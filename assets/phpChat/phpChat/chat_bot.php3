<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// This is the code for an IRC bot. It will simply sit there, print all incoming
// traffic to the browser and pass all outgoing messages on to the network.
//
// Tricky implementation of browser timeout prevention.
//
//////////////////////////////////////////////////////////////////////////////

include("configuration.inc.php3");
include("chat_db.php3");
include($chat_phpIRC_path."/phpIRC.inc.php3");
include($chat_phpIRC_path."/phpIRC.php3");

//////////////////////////////////////////////////////////////////////////////

// this variable keeps the timestamp of when traffic was sent to the browser
$chat_last_timeout_prevention = 0;
$chat_shm_current_handle = 0;

//////////////////////////////////////////////////////////////////////////////
//
// chat_print_js(string code) - print javascript code
//
//////////////////////////////////////////////////////////////////////////////
//
// Prints a JavaScript code snippet and embeds it into the correct tags needed
// for the browsers to interprete it
//
//////////////////////////////////////////////////////////////////////////////
//
// Parameteres:
//	$code - string containing the javascript code
//
//////////////////////////////////////////////////////////////////////////////

function chat_print_js($code)
{

    printf("<script language='JavaScript'>%s</script>", $code);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_print_whois(array whois_info) - prints out someone's whois info
//
//////////////////////////////////////////////////////////////////////////////
//
// This function is a helper function of the user command interpreter and
// prints out someone's whois info in a nicely formatted way
//
//////////////////////////////////////////////////////////////////////////////
//
// Parameters:
//	$whois_info - whois info in an array as returned by phpIRC
//
//////////////////////////////////////////////////////////////////////////////

function chat_print_whois($whois_info)
{

    // initialize whois template
    $tpl = new EasyTemplate("templates/whois.inc.html");

    // replace template variables
    $tpl->assign("NICK", $whois_info["nick"]);
    $tpl->assign("IDENT", $whois_info["identd"]);
    $tpl->assign("HOST", $whois_info["host"]);
    $tpl->assign("REALNAME", $whois_info["realname"]);
    $tpl->assign("CHANNELS", $whois_info["channels"]);
    $tpl->assign("SERVER", $whois_info["server"]);
    $tpl->assign("SERVER_INFO", $whois_info["serverinfo"]);                    
    $tpl->assign("IDLE", !empty($whois_info["idle"]) ? $whois_info["idle"]." seconds" : "not idle at all");
    $tpl->assign("AWAY", !empty($whois_info["away"]) ? $whois_info["away"] : "not away");

    // print template
    $tpl->easy_print();

    // scroll down enough to display the whois info
    chat_print_js("window.scrollBy(0, 300);");

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_update_nick_list() - updates the nick list frame
//
//////////////////////////////////////////////////////////////////////////////
//
// Updates the nick list in the database and issues JavaScript code to
// reload the frames related to it
//
//////////////////////////////////////////////////////////////////////////////
//
// Return value:
//	TRUE - success
//	FALSE - database error
//
//////////////////////////////////////////////////////////////////////////////

function chat_update_nick_list()
{
    global $db_handle, $chat_irc_channel;

    // retrieve nick list from the channel using phpIRC
    $nick_list = irc_get_nick_list($chat_irc_channel);

    // stuff nick list into database
    if(!chat_db_update_nick_list($db_handle, session_id(), $chat_irc_channel, $nick_list))
    {
    	// nick list update failed, print error message
        print("[phpChat] Nick list update failed!<br>");
        return(FALSE);
    }

    // send JavaScript code to reload the frame
    chat_print_js("parent.frames['frm_nicklist'].location.reload()");

    // indicate success
    return(TRUE);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_recycler(int code, string nick, string identd, string host,
//               string destination, string text) - "recycles" the chat
//
//////////////////////////////////////////////////////////////////////////////
//
// This function is the central element of the web interface. It is installed
// as a callback to phpIRC for all handled events (channel messages, private
// messages, actions, etc).
//
// It also functions as idle callback. This is done in order to be able to
// frequently "ping" the browser and prevent timeouts on the client side as
// we're using endless pages instead of auto-refreshing ones.
//
// In order not to use up all processing time on the CPU, (phpIRC is setup to
// use non-blocking sockets to be able to initiate idle callbacks) we have to
// sleep everytime we're called using the idle callback. This will release
// enough resources to the system to remain responsive enough.
//
// The time to sleep (and thus the amount of processing time to use in each
// process) can be adjusted using $chat_sleep_time)
//
//////////////////////////////////////////////////////////////////////////////
//
// Parameters:
//	$code - callback code (from phpIRC)
//	$nick - nick which triggered the callback
//	$identd - identd belonging to that nick
//	$host - host the nick originates from
//	$destination - destination of the message triggering the callback
//	$text - contents of the message
//
//////////////////////////////////////////////////////////////////////////////

function chat_recycler($code, $nick, $identd, $host, $destination, $text)
{
    global $db_handle, $chat_db_name, $chat_db_msg_table, $chat_nick;
    global $chat_default_quit_msg, $irc_default_identd, $irc_host;
    global $chat_irc_channel;
    global $chat_helperbot_nick;
    global $footer;
    global $chat_sleep_time, $chat_last_timeout_prevention;
    global $chat_browser_keep_alive;
    global $chat_shm_key, $chat_shm_current_handle, $chat_shm_var;
    global $chat_shm_enabled;

    // get current timestamp
    $current_time = time();

    // in case the last "ping" to the browser is not as long ago as specified
    // just return to the caller
    if(($current_time - $chat_last_timeout_prevention) > $chat_browser_keep_alive)
    {
        // update time stamp and ping the browser
        $chat_last_timeout_prevention = $current_time;
        print("<!-- -->\n");
        flush();
    }

    // sleep a bit to ease CPU usage
    usleep($chat_sleep_time);

    if($chat_shm_enabled)
    {
        // now find out if there's anything to process
        $lock_array = @shm_get_var($chat_shm_current_handle, $chat_shm_var);
        if($lock_array[session_id()] != 1)
            return;

        // get and lock semaphore
        $sem = sem_get($chat_shm_key);
        sem_acquire($sem);

        // there's a message for us, clear flag and store it back
        $lock_array[session_id()] = 0;

        shm_put_var($chat_shm_current_handle, $chat_shm_var, $lock_array);

        sem_release($sem);
    }

    $message_list = chat_db_retrieve_msgs($db_handle, session_id());

    while(list($key, $message) = each($message_list))
    {

        // get message string
        $message = trim($message);
        
        // determine if this is a command or not
        if(!empty($message) && $message[0] == CHAT_COMMAND_PREFIX)
        {
            // it's a command, explode string
            $command_array = explode(" ", $message);
            
            // extract command string
            $command = strtoupper(substr($command_array[0], 1));
            
            // extract parameters
            $text = trim(strchr($message, " "));
            
            // evaluate and process all commands
            switch($command)
            {
                case CHAT_CMD_QUIT:    // stop the chat
                
                            // get quit reason
                            $reason = $text;
                            
                            if($reason == "")
                                // no reason given, so use default reason
                                $reason = $chat_default_quit_msg;

                            print("[phpChat] Session ended.<br>\n");

                            // we're going to print these tags here
                            // because PHP acts buggy and sometimes
                            // prints code garbage to the browser
                            $footer->easy_print();
                            
                            irc_disconnect($reason);

                            chat_print_js("parent.location.href = 'chat_login.php3';");

                            break;
                
                case CHAT_CMD_PRIVMSG:    // send a private message

                            // get destination
                            $target = $command_array[1];
                            
                            // get text
                            $text = trim(strchr($text, " "));

                            irc_privmsg($target, $text);

                            // print to ourselves
                            chat_output(IRCCB_ONPRIVMSG, $chat_nick, $irc_default_identd, $irc_host, $target, $text);
                            
                            break;
                
                case CHAT_CMD_NOTICE:    // send a notice
                
                            // get destination
                            $target = $command_array[1];
                            
                            // get text
                            $text = trim(strchr($text, " "));
                            
                            irc_notice($target, $text);
                            
                            // print to ourselves
                            chat_output(IRCCB_ONNOTICE, $chat_nick, $irc_default_identd, $irc_host, $target, $text);
                            
                            break;
                
                case CHAT_CMD_ACTION:    // send an action
                            irc_action($chat_irc_channel, $text);
                            
                            // print to ourselves as well
                            chat_output(IRCCB_ONACTION, $chat_nick, $irc_default_identd, $irc_host, $chat_irc_channel, $text);
                            break;
                
                case CHAT_CMD_NICK:    // change our nick
                            $chat_nick = $text;
                            
                            // make sure that we'll send out a ping this time
                            $nick = $chat_nick;
                            
                            // now change the nick network-wide
                            irc_change_nick($text);
                            break;
                
                case CHAT_CMD_WHOIS:    // retrieve whois information
                            $whois_info = irc_whois($text);
                            
                            if(!$whois_info)
                            {
                                print("[phpChat] No such nick \"$text\"<br>\n");
                            }
                            else
                            {
                                chat_print_whois($whois_info);                                
                            }
                            
                            break;

                case CHAT_CMD_KICK:    // kick someone

                            $target = $command_array[1];
                            $kick_reason = trim(strchr($text, " "));

                            irc_kick($chat_irc_channel, $target, $kick_reason);

                            break;

                case CHAT_CMD_MODE:    // change channel mode

                            $mode = $command_array[1];
                            $parameters = trim(strchr($text, " "));

                            irc_set_mode($chat_irc_channel, $mode, $parameters);

                            break;

                default:        // unknown command
                            print("[phpChat] Unknown command \"$command\"<br>");
                            break;
            }
        }
        else
        {
            // this is not a command, just print it out
            irc_privmsg($chat_irc_channel, $message);
            
            // after printing it to the server, we need to
            // print it to ourselves as well
            chat_output(IRCCB_ONPRIVMSG, $chat_nick, $irc_default_identd, $irc_host, $chat_irc_channel, $message);
        }
    }

    flush();

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_output_*() - set of output functions for each type of message
//
//////////////////////////////////////////////////////////////////////////////
//
// This is a whole set of functions, each function handling a different kind
// of message. This is done to allow for flexible adjustments of the chat
// layout. All of these functions could be moved into a separate module,
// eventually producing some kind of "theme" or "skin" like output modules.
//
// Two special functions, chat_output_prefix() and chat_output_suffix() are
// used to print common message prefixes and common message suffixes, similar
// to page headers and footers
//
//////////////////////////////////////////////////////////////////////////////

function chat_output_prefix($destination = "")
{
    global $chat_irc_channel;

    print("[".date("H:i")."] ");
    
    if($chat_irc_channel != $destination && !empty($destination))
    {
        print("[$destination] ");
    }
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_suffix()
{
    chat_print_js("window.scrollBy(0, 50);");
    
}

//////////////////////////////////////////////////////////////////////////////

//
// chat_transform_link() transforms an URL found in the message to a HTML reference
// to be able to click onto URLs directly in the chat
//

function chat_transform_link($text)
{
    $ret = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])", "<a href=\"\\1://\\2\\3\" target=\"_blank\" target=\"_new\">\\1://\\2\\3</a>", $text);
	$ret = eregi_replace("(([a-z0-9_]|\\-|\\.)+@([^[:space:]]*)([[:alnum:]-]))", "<a href=\"mailto:\\1\" target=\"_new\">\\1</a>", $ret);
	return($ret);
}

//
// chat_transform_color_code() interpretes a set of mIRC color codes. The current
// implementation is very clumsy and limited (doesn't support background colors yet)
// but works.
//

function chat_transform_color_code($text)
{
	global $chat_color_translation_table;

	$output = "";
	$in_color = 0;
	$in_bold = 0;

	for($i = 0; $i < strlen($text); $i++)
	{
		switch($text[$i])
		{
			case chr(2):	// this encloses bold text
					if(!$in_bold)
					{
						// we're interpreting a bold code now
						$in_bold = 1;
						
						// print tag
						$output .= "<b>";
					}
					else
					{
						// close bold tag
						$in_bold = 0;
						
						// print tag
						$output .= "</b>";
					}

					break;

			case chr(3):	// this is a color code
					// are we still interpreting a color code?
					if(!$in_color)
					{
						// we're interpreting a color code now
						$in_color = 1;

						// advance to next index
						$i++;

						// no, start a new interpretation
						$fgcolor = -1;
						$bgcolor = -1;

						// extract foreground color
						if((int)$text[$i] == $text[$i])
							$fgcolor = $text[$i];

						// extract optional second character
						if((int)($text[$i + 1]) == $text[$i])
						{
							$fgcolor = $fgcolor * 10 + $text[$i + 1];
							$i++;
						}

						// advance to next index
						$i++;

						// extract background color
						if($text[$i] == ",")
						{
							// this might be interpreted as color separator
							$i++;

							if((int)($text[$i]) == $text[$i])
							{
								// it's an integer, so it's a color value
								$bgcolor = $text[$i];

								// extract optional second character
								if((int)($text[$i + 1]) == $text[$i])
								{
									$bgcolor = $bgcolor * 10 + $text[$i + 1];
									$i++;
								}
							}
							else
							{
								// this wasn't an integer, no background
								$i--;
							}
						}

						// find the correct HTML value for this color or invalidate
						// the foreground color field
						if(($fgcolor != -1) && isset($chat_color_translation_table[$fgcolor]))
							$fgcolor = $chat_color_translation_table[$fgcolor];
						else
							$fgcolor = -1;

						// find the correct HTML value for this color or invalidate
						// the background color field
						if(($bgcolor != -1) && isset($chat_color_translation_table[$bgcolor]))
							$bgcolor = $chat_color_translation_table[$bgcolor];
						else
							$bgcolor = -1;

						// output prefix
						if(($fgcolor != -1))
							$output .= "<font ";

						// output foreground
						if($fgcolor != -1)
							$output .= "color=$fgcolor ";

						// output background
//						if($bgcolor != -1)
//							// no handler for background yet
//							;

						// output suffix
						if(($fgcolor != -1))
							$output .= ">";

						// walk one character backwards as the for loop
						// is going to move on
						$i--;

					}
					else
					{
						// yes, we're still interpreting a color code,
						// finalize previous tag
						$output .= "</font>";

						// we're done interpreting this code
						$in_color = 0;
					}

					break;

			default:	// just append this character
					$output .= $text[$i];
					break;
		}
	}

	return($output);

}

function chat_output_privmsg($nick, $identd, $host, $destination, $text)
{
    global $chat_color_nick, $chat_color_channel, $chat_color_message;
    global $chat_priv_msg_transform;

    for($i=0; $i<count($chat_priv_msg_transform); $i++)
    {
        $function = $chat_priv_msg_transform[$i];
        $text = $function($text);
    }

    // print message
    print("&lt<font color=$chat_color_nick>$nick</font>&gt ");
    print("<font color=$chat_color_message>$text</font><br>\n");
    flush();

}

//////////////////////////////////////////////////////////////////////////////

function chat_output_join($nick, $identd, $host, $destination, $text)
{
    global $chat_color_join;

    chat_update_nick_list();

    // print message
    print("<font color=$chat_color_join>*** Joins: $nick ($identd@$host)</font><br>\n");

}

//////////////////////////////////////////////////////////////////////////////

function chat_output_part($nick, $identd, $host, $destination, $text)
{
    global $chat_color_part;

    chat_update_nick_list();
    
    // print message
    print("<font color=$chat_color_part>*** Parts: $nick ($identd@$host)</font><br>\n");

}

//////////////////////////////////////////////////////////////////////////////

function chat_output_quit($nick, $identd, $host, $destination, $text)
{
    global $chat_color_quit;

    chat_update_nick_list();
    
    $text = htmlspecialchars($text);

    // print message
    print("<font color=$chat_color_quit>*** Quits: $nick ($text)</font><br>\n");

}

//////////////////////////////////////////////////////////////////////////////

function chat_output_notice($nick, $identd, $host, $destination, $text)
{
    global $chat_color_notice;
    
    $text = htmlspecialchars($text);

    // print message
    print("<font color=$chat_color_notice>-$nick- $text</font><br>\n");
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_kick($nick, $identd, $host, $destination, $text)
{
    global $chat_color_kick;
    
    chat_update_nick_list();
    
    // print message
    print("<font color=$chat_color_kick>*** $text was kicked by $nick</font><br>\n");
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_modechange($nick, $identd, $host, $destination, $text, $change)
{
    global $chat_color_modechange;
    global $chat_nick;

    if(strstr($change, "o") && trim($text) == $chat_nick)
    {
        chat_print_js("parent.frm_actions.location.reload()");
    }
    
    chat_update_nick_list();
    
    // print message
    print("<font color=$chat_color_modechange>*** $nick sets mode: $change $text</font><br>\n");
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_nickchange($nick, $identd, $host, $destination, $text)
{
    global $chat_color_nickchange;

    chat_update_nick_list();
    
    // print message
    print("<font color=$chat_color_nickchange>*** $nick is now known as $text</font><br>\n");
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_topic($nick, $identd, $host, $destination, $text)
{
    
    // the format of $text here is
    // <channel> :<topic>
    
    // explode string to get channel
    $array = explode(" ", $text);
    $destination = trim($array[0]);
    
    // extract topic
    $text = substr(strchr($text, ":"), 1);
    
    $text = htmlspecialchars($text);

    // print message
    print("Topic: $text<br>\n");
    
}

//////////////////////////////////////////////////////////////////////////////

function chat_output_topic_change($nick, $identd, $host, $destination, $text)
{
    global $chat_color_topicchange;

    $text = htmlspecialchars($text);

    print("<font color=$chat_color_topicchange>*** $nick changes topic to '$text'</font><br>\n");

}

//////////////////////////////////////////////////////////////////////////////

function chat_output_action($nick, $identd, $host, $destination, $text)
{
    global $chat_color_action;
    
    $text = htmlspecialchars($text);

    print("<font color=$chat_color_action>* $nick $text</font><br>\n");

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_output(int code, string nick, string identd, string host,
//             string destination, string text) - format and print a message
//
//////////////////////////////////////////////////////////////////////////////
//
// This function is responsible for formatting and printing all messages which
// are to appear in the chat frame. It dispatches the messages, depending on
// the callback code, to the responsible chat_output_*() functions.
//
//////////////////////////////////////////////////////////////////////////////
//
// Parameters:
//	$code - callback code from phpIRC
//	$nick - nick which triggered the callback
//	$identd - identd belonging to that nick
//	$host - host the nick originates from
//	$destination - destination of the message triggering the callback
//	$text - contents of the message
//
//////////////////////////////////////////////////////////////////////////////

function chat_output($code, $nick, $identd, $host, $destination, $text)
{

    // special case: name list reply
    if($code == IRCRPL_ENDOFNAMES)
    {
        chat_update_nick_list();
        return;
    }                    
    
    // print prefix for output
    chat_output_prefix($destination);

    // now determine what to print
    switch($code)
    {
        case IRCCB_ONCHANNELMSG:
        case IRCCB_ONPRIVMSG:        // private and channel messages
                        chat_output_privmsg($nick, $identd, $host, $destination, $text);
                        break;
    
        case IRCCB_ONJOIN:        // join message
                        chat_output_join($nick, $identd, $host, $destination, $text);
                        break;
                        
        case IRCCB_ONPART:        // part message
                        chat_output_part($nick, $identd, $host, $destination, $text);
                        break;
                        
        case IRCCB_ONQUIT:        // quit message
                        chat_output_quit($nick, $identd, $host, $destination, $text);
                        break;
                        
        case IRCCB_ONNOTICE:        // notice
                        chat_output_notice($nick, $identd, $host, $destination, $text);
                        break;
                        
        case IRCCB_ONKICK:        // kick message
                        chat_output_kick($nick, $identd, $host, $destination, $text);
                        break;
                        
        case IRCCB_ONOP:        // op message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "+o");
                        break;
                        
        case IRCCB_ONDEOP:        // deop message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "-o");
                        break;
                        
        case IRCCB_ONVOICE:        // voice message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "+v");
                        break;
                        
        case IRCCB_ONDEVOICE:        // devoice message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "-v");
                        break;
                        
        case IRCCB_ONBAN:        // ban message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "+b");
                        break;
                        
        case IRCCB_ONUNBAN:        // unban message
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "-b");
                        break;

        case IRCCB_ONMODECHANGE:    // channel mode change
                        chat_output_modechange($nick, $identd, $host, $destination, $text, "");
                        break;

        case IRCCB_ONNICKCHANGE:    // nick change message
                        chat_output_nickchange($nick, $identd, $host, $destination, $text);
                        break;

        case IRCCB_ONTOPICCHANGE:    // topic change
                        chat_output_topic_change($nick, $identd, $host, $destination, $text);
                        break;

        case IRCRPL_TOPIC:        // initial topic reply for join
                        chat_output_topic($nick, $identd, $host, $destination, $text);
                        break;

        case IRCCB_ONACTION:        // action message
                        chat_output_action($nick, $identd, $host, $destination, $text);
                        break;
                        
        default:            // unhandled message
                        print("[phpChat] WARNING: Unhandled message $code in chat_output()!<br>\n");
                        break;
    }
    
    // print suffix for output
    chat_output_suffix();
    
    // send it to the browser
    flush();

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_shutdown() - shuts down the chat
//
//////////////////////////////////////////////////////////////////////////////
//
// This function is called as exit handler for the chat and is responsible for
// cleaning up. The function may be invoked both from regular quits and user
// aborts, thus it tries to disconnect from the IRC server and from the database
// for safety (redundant calls if the chat has been left correctly)
//
// After disconnecting from IRC / database, the function reconnects to the
// database and cleans up all data from the tables relating to this client.
//
//////////////////////////////////////////////////////////////////////////////

function chat_shutdown()
{
    global $db_handle, $chat_default_quit_msg;
    global $chat_shm_key, $chat_shm_var, $chat_shm_current_handle;
    global $chat_shm_enabled;

    // disconnect from IRC, just for safety
    // (won't hurt if already disconnected)
    irc_disconnect($chat_default_quit_msg);
    

    // clean up session
    session_destroy();

    unset($chat_nick);

    // this is a little bit dirty, we're closing
    // the database link just for safety
    @chat_db_disconnect($db_handle);

    if($chat_shm_enabled)
    {
        // lock shared memory
        $sem = sem_get($chat_shm_key);
        sem_acquire($sem);

        // get shared memory segment
        $shm = shm_attach($chat_shm_key);

        $lock_array = shm_get_var($shm, $chat_shm_var);

        // clear unused session
        unset($lock_array[session_id()]);

        // write array back to shared memory
        shm_put_var($shm, $chat_shm_var, $lock_array);

        sem_release($sem);

        // disconnect from shared memory
        shm_detach($shm);
        @shm_detach($chat_shm_current_handle);
    }

    // reconnect to database
    $db_handle = chat_db_connect();
    
    // if connect was successful, cleanup and disconnect
    if($db_handle)
    {
        chat_db_session_delete($db_handle, session_id());
        chat_db_disconnect($db_handle);
    }
    
    session_destroy();

}

//////////////////////////////////////////////////////////////////////////////

// register shutdown function
register_shutdown_function("chat_shutdown");

// first of all, make us unstoppable
set_time_limit(0);

// let user aborts through
ignore_user_abort(0);

if($chat_shm_enabled)
{
    // connect to shared memory segment
    $chat_shm_current_handle = shm_attach($chat_shm_key, $chat_shm_size);
    if(!$chat_shm_current_handle)
    {
        die("[phpChat] Shared memory not available");
    }
}

// Open template files
$header = new EasyTemplate("templates/header.inc.html");
$footer = new EasyTemplate("templates/footer.inc.html");

// Print HTML header
$header->easy_print();
print('<span class="code">');

print("[phpChat] Attempting to connect to $chat_irc_server on port $chat_irc_port...<br>\n");
flush();

// connect to database
$db_handle = chat_db_connect($chat_db_host, $chat_db_user, $chat_db_password);
if(!$db_handle)
    die("Database error.");

// retrieve nick from database
#$chat_nick = chat_db_session2nick($db_handle, session_id());
if(!$chat_nick)
    die("Invalid session.");

// initialize IRC layer
if(!irc_init())
    die("Could not initialize.");

//irc_set_debug_mode(1);

// set nick
irc_change_nick($chat_nick);

// add callback for recycler
irc_add_callback(IRCCB_ONIDLE, "chat_recycler");

// connect to IRC server
$motd = irc_connect($chat_irc_server, $chat_irc_port, 0);
if($motd == FALSE)
    die("Connection error.");

// output MOTD
for($i=0; $i<count($motd); $i++)
{
    print(trim($motd[$i])."<br>\n");
    chat_print_js("window.scrollBy(0, 50);");
    flush();
}
    
// add callbacks for output
irc_add_callback(IRCCB_ONCHANNELMSG, "chat_output");
irc_add_callback(IRCCB_ONPRIVMSG, "chat_output");
irc_add_callback(IRCCB_ONJOIN, "chat_output");
irc_add_callback(IRCCB_ONPART, "chat_output");
irc_add_callback(IRCCB_ONQUIT, "chat_output");
irc_add_callback(IRCCB_ONNOTICE, "chat_output");
irc_add_callback(IRCCB_ONKICK, "chat_output");
irc_add_callback(IRCCB_ONOP, "chat_output");
irc_add_callback(IRCCB_ONDEOP, "chat_output");
irc_add_callback(IRCCB_ONVOICE, "chat_output");
irc_add_callback(IRCCB_ONDEVOICE, "chat_output");
irc_add_callback(IRCCB_ONBAN, "chat_output");
irc_add_callback(IRCCB_ONUNBAN, "chat_output");
irc_add_callback(IRCCB_ONMODECHANGE, "chat_output");
irc_add_callback(IRCCB_ONNICKCHANGE, "chat_output");
irc_add_callback(IRCCB_ONTOPICCHANGE, "chat_output");
irc_add_callback(IRCCB_ONACTION, "chat_output");

irc_add_callback(IRCRPL_TOPIC, "chat_output");

// we're intercepting the "end of name list"
// reply from the server to output nick lists
irc_add_callback(IRCRPL_ENDOFNAMES, "chat_output");

// join a channel
$channel_handle = irc_join($chat_irc_channel);
if(!$channel_handle)
{
    // failed to join a channel, disconnect and return
    irc_disconnect($chat_default_quit_msg);
    die("Join error.");
}

// start timeout preventer by pinging ourselves
//irc_ctcp_ping($chat_nick);

// idle until disconnected
irc_idle(IRC_NOBREAK);

// close connection to database
chat_db_disconnect($db_handle);

// disconnect from shared memory
shm_detach($chat_shm_current_handle);

// Print HTML footer
$footer->easy_print();

//////////////////////////////////////////////////////////////////////////////
?>

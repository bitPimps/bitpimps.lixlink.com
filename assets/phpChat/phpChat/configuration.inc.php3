<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken, till@phpwebdev.com
//
// This file contains all configuration options for phpChat
//
//////////////////////////////////////////////////////////////////////////////

$chat_phpIRC_path = "../phpIRC";            // path to phpIRC

$chat_db_host = "localhost";                // name of MySQL host
$chat_db_user = "sqlusr";                   // name of MySQL user
$chat_db_password = "sqlpass";              // password for MySQL user

$chat_db_name = "my_db";                    // chat database name
$chat_db_msg_table = "phpChat_msg";         // chat table name
$chat_db_nick_table = "phpChat_nicklist";   // nicklist table
$chat_db_session_table = "phpChat_session"; // session table

$chat_irc_server = "localhost";             // IRC server to use
$chat_irc_port = 6667;                      // port to use

$chat_irc_channel = "#phpwebdev";           // channel to use

$chat_sleep_time = 500;                     // time in milliseconds to sleep
                                            // when idling
$chat_browser_keep_alive = 5;               // number of seconds to "ping"
                                            // the browser

$chat_session_timeout = 48 * 3600;          // time in seconds after which
                                            // an idling session will be
                                            // deleted

$chat_shm_enabled = 1;                      // use shared memory?
$chat_shm_key = 31337;                      // key to use for shared memory
$chat_shm_size = 512 * 1024;                // size of shared memory segment
$chat_shm_var = 123;                        // key to use for variable

define("CHAT_COMMAND_PREFIX", "/");         // character to prefix commands with
define("CHAT_CMD_PRIVMSG", "MSG");          // command to send private messages
define("CHAT_CMD_NOTICE", "NOTICE");        // command to send notices
define("CHAT_CMD_QUIT", "QUIT");            // command to stop the chat
define("CHAT_CMD_ACTION", "ME");            // command for actions
define("CHAT_CMD_NICK", "NICK");            // command to change our nick
define("CHAT_CMD_WHOIS", "WHOIS");          // command to retrieve whois info
define("CHAT_CMD_KICK", "KICK");	    // command to kick someone
define("CHAT_CMD_MODE", "MODE");	    // command to change channel modes

$chat_default_quit_msg = "phpChat - This is how pretty hip people are talking";

$chat_color_nick = "#0000FF";
$chat_color_channel = "#FF0000";
$chat_color_message = "#000000";
$chat_color_join = "#009900";
$chat_color_part = "#009900";
$chat_color_quit = "#0000FF";
$chat_color_action = "#880088";
$chat_color_modechange = "#00FF00";
$chat_color_nickchange = "#00FF00";
$chat_color_topicchange = "#00FF00";

$chat_color_translation_table = array(
		0  => "#FFFFFF",
		1  => "#000000",
		2  => "#000080",
		3  => "#008000",
		4  => "#FF0000",
		5  => "#800000",
		6  => "#800080",
		7  => "#123456",            // verify this code!
		8  => "#FFFF00",
		9  => "#00FF00",
		10 => "#008080",
		11 => "#00FFFF",
		12 => "#0000FF",
		13 => "#FF00FF",
		14 => "#808080",
		15 => "#C0C0C0"
		);

$chat_priv_msg_transform = array            // array holding names of functions which
                (                           // are to be applied to priv messages
                "htmlspecialchars",
                "chat_transform_link",
                "chat_transform_color_code"
                );
                
// include template functions and optionally
// the session functions if we're running
// PHP version < 4.x
require("EasyTemplate.inc.php3");
if(!strstr(phpversion(), "4."))
{
    require("sessions.php3");
}
session_register("chat_nick");

//////////////////////////////////////////////////////////////////////////////
?>

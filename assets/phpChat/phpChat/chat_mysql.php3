<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// Actual database interface to MySQL for phpChat.
//
//////////////////////////////////////////////////////////////////////////////

// We do not need to include configuration data here,
// since this should already be included from the module
// that includes us
//include("configuration.inc.php3");

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_connect() - connects to the chat database and returns a handle
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_connect()
{
	global $chat_db_host, $chat_db_user, $chat_db_password;

	return(mysql_connect($chat_db_host, $chat_db_user, $chat_db_password));

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_session_create() - creates a new session for a nick
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_session_create($db_handle, $nick, $session_id)
{
	global $chat_db_name, $chat_db_session_table;

	$current_time = time();

	$result = mysql_db_query($chat_db_name, "INSERT INTO $chat_db_session_table (session_id, nick, last_access) VALUES ('$session_id', '".addslashes($nick)."', $current_time)", $db_handle);

	if(!$result)
		return(FALSE);

	@mysql_free_result($result);
	
	return($session_id);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_session_delete() - delete all session data
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_session_delete($db_handle, $session_id)
{
	global $chat_db_name, $chat_db_msg_table, $chat_db_nick_table, $chat_db_session_table;
	global $chat_session_timeout;

	$current_time = time();

	// delete the requested session and all sessions
	// that timed out
	$session_list = mysql_db_query($chat_db_name, "SELECT * FROM $chat_db_session_table", $db_handle);
	while($session = mysql_fetch_array($session_list))
	{
		if(($session["session_id"] == $session_id) || (($current_time - $session["last_access"]) > $chat_session_timeout))
		{
			$id = $session["session_id"];

			$result = mysql_db_query($chat_db_name, "DELETE FROM $chat_db_msg_table WHERE session_id='$id'");
			@mysql_free_result($result);

			$result = mysql_db_query($chat_db_name, "DELETE FROM $chat_db_nick_table WHERE session_id='$id'");
			@mysql_free_result($result);

			$result = mysql_db_query($chat_db_name, "DELETE FROM $chat_db_session_table WHERE session_id='$id'");
			@mysql_free_result($result);
		}
	}

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_session2nick() - retrieves nickname for a session ID
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_session2nick($db_handle, $session_id)
{
	global $chat_db_name, $chat_db_session_table;
	
	$result = mysql_db_query($chat_db_name, "SELECT nick FROM $chat_db_session_table WHERE session_id = '$session_id'", $db_handle);
	if(!$result)
		return(FALSE);
	
	$array = mysql_fetch_array($result);
	if(!$array)
		return(FALSE);
	
	// query returned a valid nick, update access time
	$nick = $array["nick"];

	@mysql_free_result($result);
	
	$result = mysql_db_query($chat_db_name, "UPDATE $chat_db_session_table SET last_access = null", $db_handle);

	@mysql_free_result($result);
	
	return($nick);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_put_message() - writes a chat message to the database
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_put_message($db_handle, $session_id, $message)
{
	global $chat_db_name, $chat_db_msg_table;
	global $chat_db_session_table;

	$current_time = time();

	// re-animate session
	$result = mysql_db_query($chat_db_name, "UPDATE $chat_db_session_table SET last_access=$current_time WHERE session_id='$session_id'", $db_handle);

	@mysql_free_result($result);
	
	$query = "INSERT INTO $chat_db_msg_table (timestamp, session_id, message) VALUES ($current_time, '$session_id', '".addslashes($message)."')";

	$result = mysql_db_query($chat_db_name, $query, $db_handle);

	@mysql_free_result($result);

	return($result);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_retrieve_msgs($session_id) - reads and deletes all messages for the
//					given session
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_retrieve_msgs($db_handle, $session_id)
{
	global $chat_db_name, $chat_db_msg_table;

	// get current time
	$current_time = time();

	// select all messages
	$result = mysql_db_query($chat_db_name, "SELECT message FROM $chat_db_msg_table WHERE timestamp <= $current_time AND session_id = '$session_id' ORDER BY timestamp ASC", $db_handle);

	$msg_list = array();

	// retrieve all rows if there are any and store them in an array
	if($result)
		while($row = mysql_fetch_array($result))
			$msg_list[] = $row["message"];

	@mysql_free_result($result);
	
	// now delete all messages
	$result = mysql_db_query($chat_db_name, "DELETE FROM $chat_db_msg_table WHERE timestamp <= $current_time AND session_id = '$session_id'", $db_handle);

	@mysql_free_result($result);

	// return message list
	return($msg_list);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_update_nick_list() - writes a new nick list into the database
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_update_nick_list($db_handle, $session_id, $channel, $nick_list)
{
	global $chat_db_name, $chat_db_nick_table;
    
	// empty nick list table
	$result = mysql_db_query($chat_db_name, "DELETE FROM $chat_db_nick_table WHERE channel = '$channel' AND session_id = '$session_id'", $db_handle);
	if(!$result)
	{
		return(FALSE);
	}
    
	@mysql_free_result($result);

	// Update the MySQL table with the new nicklists
	while(list($key, $value) = each($nick_list))
	{
		$result = mysql_db_query($chat_db_name, "INSERT INTO $chat_db_nick_table (nick, channel, session_id) VALUES('".addslashes($value)."', '$channel', '$session_id')", $db_handle);
		if(!$result)
		{
			return(FALSE);
		}

		@mysql_free_result($result);
	}

	return(TRUE);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_get_logged_nicks() - returns a list of nicks with active sessions
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_get_logged_nicks($db_handle)
{
	global $chat_db_name, $chat_db_session_table;

	$result = mysql_db_query($chat_db_name, "SELECT nick FROM $chat_db_session_table", $db_handle);

	$nick_list = array();
	
	while($row = mysql_fetch_array($result))
	{
		$nick_list[] = $row["nick"];
	}

	@mysql_free_result($result);
	
	return($nick_list);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_get_nick_list() - reads the nick list from the database
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_get_nick_list($db_handle, $session_id, $channel)
{
	global $chat_db_name, $chat_db_nick_table;

	$result = mysql_db_query($chat_db_name, "SELECT * FROM $chat_db_nick_table WHERE channel = '$channel' AND session_id = '$session_id' ORDER BY nick", $db_handle);
	if(!$result)
		return(FALSE);

	$nick_list = array();

	while($row = mysql_fetch_array($result))
	{
		$nick_list[] = $row["nick"];
	}

	@mysql_free_result($result);

	return($nick_list);

}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_is_op() - check whether a nick is Op in a channel or not
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_is_op($db_handle, $channel, $nick)
{
    global $chat_db_name, $chat_db_nick_table;

    $result = mysql_db_query($chat_db_name, "SELECT nick FROM $chat_db_nick_table WHERE channel = '$channel' AND nick = '@$nick'", $db_handle);
    if(!$result)
        return(FALSE);

    if(mysql_num_rows($result) == 0)
    {
        return(FALSE);
    }
    else
    {
        return(TRUE);
    }
}

//////////////////////////////////////////////////////////////////////////////
//
// chat_db_disconnect() - disconnects from the database
//
//////////////////////////////////////////////////////////////////////////////

function chat_db_disconnect($db_handle)
{
	
	return(mysql_close($db_handle));
	
}

//////////////////////////////////////////////////////////////////////////////
?>

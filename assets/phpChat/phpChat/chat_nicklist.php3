<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// This is the code for an IRC bot. It will simply sit there, put all incoming
// traffic into a database and pass all outgoing messages on to the network.
//
//////////////////////////////////////////////////////////////////////////////

include("configuration.inc.php3");
include("chat_db.php3");

// connect to database
$db_handle = chat_db_connect($chat_db_host, $chat_db_user, $chat_db_password);
if(!$db_handle)
    die("Database error.");

// retrieve nick list
$nick_list = chat_db_get_nick_list($db_handle, session_id(), $chat_irc_channel);

// disconnect from database
chat_db_disconnect($db_handle);

// reset HTML code string
$nicks = "";

$is_op = "false";

// list all nicks and generate HTML code for nick list
while(list($key, $nick) = each($nick_list))
{
    if("@$chat_nick" == $nick)
    {
        $is_op = "true";
    }
    $nicks .= "<input type='radio' name='nick' value='$nick'>$nick<br>";
}

// output HTML
$header = new EasyTemplate("templates/header.inc.html");
$footer = new EasyTemplate("templates/footer.inc.html");
$tpl = new EasyTemplate("templates/chat_nicklist.inc.html");

$header->easy_print();
$tpl->assign("NICKLIST", $nicks);
$tpl->assign("IS_OP", $is_op);
$tpl->easy_print();
$footer->easy_print();

?>

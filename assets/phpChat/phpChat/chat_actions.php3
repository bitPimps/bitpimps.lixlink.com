<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// This module handles user commands which are initiated from a separate
// frame, acting like a "command central".
//
//////////////////////////////////////////////////////////////////////////////

include("configuration.inc.php3");
include("chat_db.php3");
include($chat_phpIRC_path."/phpIRC.inc.php3");
include($chat_phpIRC_path."/phpIRC.php3");

// connect to database
$db_handle = chat_db_connect($chat_db_host, $chat_db_user, $chat_db_password);
if(!$db_handle)
    die("Database error.");

// get operator status
$is_op = chat_db_is_op($db_handle, $chat_irc_channel, $chat_nick);

// disconnect from database
chat_db_disconnect($db_handle);

// allocate all templates
$header = new EasyTemplate("templates/header.inc.html");
$footer = new EasyTemplate("templates/footer.inc.html");
$tpl = new EasyTemplate("templates/chat_actions.inc.html");

// print header
$header->easy_print();

// if we're an operator, set up actions
if($is_op)
{
    $op_actions = "<a href='javascript:handle_topic()'>Topic</a> | ";
    $op_actions .= "<a href='javascript:handle_op()'>(De-)Op</a> | ";
    $op_actions .= "<a href='javascript:handle_kick()'>Kick</a>";
}
else
{
    // we're not an operator, disable operator commands
    $op_actions = "";
}

// display form
$tpl->assign("OP_ACTIONS", $op_actions);
$tpl->easy_print();

// print footer
$footer->easy_print();

//////////////////////////////////////////////////////////////////////////////
?>

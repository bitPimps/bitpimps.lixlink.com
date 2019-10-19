<?

//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// Login screen for phpChat
//
//////////////////////////////////////////////////////////////////////////////

// include configuration data
include("configuration.inc.php3");
include("chat_db.php3");

//////////////////////////////////////////////////////////////////////////////
//
// Main code
//
//////////////////////////////////////////////////////////////////////////////

// has a session ID been assigned?
if(!isset($chat_nick))
{
    // no session ID is present, generate HTML code for logging in

    $header = new EasyTemplate("templates/header.inc.html");
    $footer = new EasyTemplate("templates/footer.inc.html");
    $form = new EasyTemplate("templates/login.inc.html");

    $header->easy_print();    

    $form->assign("ACTION", basename($PHP_SELF));
    $form->easy_print();

    $footer->easy_print();
}
else
{
    // connect to database
    $db_handle = chat_db_connect();
    if(!$db_handle)
        die("Database error");

    // create session
    $session_id = chat_db_session_create($db_handle, $chat_nick, session_id());

    // disconnection from database
    chat_db_disconnect($db_handle);

    // generate main frameset
    $session_name = session_name();
    $session_id = session_id();
    $frame = new EasyTemplate("templates/frame.inc.html");
    $frame->assign("SESS_NAME", $session_name);
    $frame->assign("SESS_ID", $session_id);
    $frame->easy_print();
}

//////////////////////////////////////////////////////////////////////////////

?>

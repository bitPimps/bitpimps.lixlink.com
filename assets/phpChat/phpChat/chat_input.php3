<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// This module handles user input. It displays an input box and sends
// all lines to the chat database
//
//////////////////////////////////////////////////////////////////////////////

// include configuration data
include("configuration.inc.php3");
include("chat_db.php3");

// allocate templates
$header = new EasyTemplate("templates/header.inc.html");
$footer = new EasyTemplate("templates/footer.inc.html");
$form = new EasyTemplate("templates/chat_input.inc.html");

$header->easy_print();

// display form
$form->assign("ACTION", basename($PHP_SELF));
$form->assign("SESS_NAME", session_name());
$form->assign("SESS_ID", session_id());
$form->easy_print();

// stuff previously submitted text into the database
if(isset($chat_input))
{
    // connect to database
    $db_handle = chat_db_connect();
    if(!$db_handle)
        die("Database error.");
    
    // stuff message into database
    chat_db_put_message($db_handle, session_id(), $chat_input);
    
    print("<p>".mysql_error()."</p>");
    
    // disconnect from database
    chat_db_disconnect($db_handle);

    // take care of shared memory
    if($chat_shm_enabled)
    {
        // get and lock semaphore
        $sem = sem_get($chat_shm_key);
        sem_acquire($sem);

        // get shared memory segment
        $shm = shm_attach($chat_shm_key, $chat_shm_size);

        $lock_array = @shm_get_var($shm, $chat_shm_var);
        $lock_array[session_id()] = 1;
        shm_put_var($shm, $chat_shm_var, $lock_array);

        // detach from shared memory
        shm_detach($shm);

        // release semaphore
        sem_release($sem);
    }
    
}

// print form
$footer->easy_print();

//////////////////////////////////////////////////////////////////////////////
?>

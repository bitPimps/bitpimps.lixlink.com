<?
//////////////////////////////////////////////////////////////////////////////
//
// phpChat - Copyright (c) 1999 by Till Gerken - till@phpwebdev.com
//
// Chat frame
//
//////////////////////////////////////////////////////////////////////////////

// include configuration data
include("configuration.inc.php3");

// get and lock semaphore
$sem = sem_get($chat_shm_key);
sem_acquire($sem);

// attach to shared memory
$shm = shm_attach($chat_shm_key, $chat_shm_size);

$var = @shm_get_var($shm, $chat_shm_var);
if(!$var)
    $lock_array = array();
else
    $lock_array = $var;

$lock_array[session_id()] = 1;

shm_put_var($shm, $chat_shm_var, $lock_array);

shm_detach($shm);

// release semaphore
sem_release($sem);

// allocate chat frame template
$frame = new EasyTemplate("templates/frame_chat.inc.html");

// replace template variables
$frame->assign("SESS_NAME", session_name());
$frame->assign("SESS_ID", session_id());

// print template
$frame->easy_print();

?>

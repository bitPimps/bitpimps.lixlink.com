<?
include("configuration.inc.php3");

$shm = shm_attach($chat_shm_key, $chat_shm_size);

$lock_array = array();
$lock_array[0] = 1;

shm_put_var($shm, $chat_shm_var, $lock_array);

while(list($key, $value) = each($lock_array))
	print("Key \"$key\" Value \"$value\"<br>");

shm_detach($shm);
?>

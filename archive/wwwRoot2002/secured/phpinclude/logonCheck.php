<?php
//check for valid logon

session_start();

if($user=="-1" || $user=="")
{
	header("Location: logon.php?msg=Enter%20your%20logon%20information");
	die(); 
}	
?>

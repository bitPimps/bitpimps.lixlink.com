<?php
//check for valid logon
session_start();
header("Cache-control: private"); // IE 6 Fix
$username = $_SESSION['username'];
$rank	= $_SESSION['rank'];

if($username=="-1" || $username=="")
{
	header("Location: http:\/bitpimps.lixlink.com/admin/index.php?msg=Enter%20your%20logon%20information");
	die(); 
}	
?>

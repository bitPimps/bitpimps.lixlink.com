<?php
extract(array_merge($_POST,$_GET));

if($logonPassword != $logonPasswd || $logonPasswd=="")
{
	$msg="Invalid Password";
	include("index.php");
}
else
{    
	session_start();
	$_SESSION['username'] = $username;
	$_SESSION['rk']	= $rk;
	$hack = "justIn";
	include("home.php");
}
?>
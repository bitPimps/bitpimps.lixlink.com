<?php
extract(array_merge($_POST,$_GET));

include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Users.php");
include("../../secured/phpinclude/classes/UsersSR.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

if($action=="save")
{
	$art = new Users("");
	$art = $art->getUsers($dbConn, $id);
	$art->setlogonName($logonName);
	$art->setlogonPassword($logonPassword);
	$art->setrank($rank);

	$art->save($dbConn);
	// Close DB Connection
	mysql_close($dbConn);

header("Location: index.php?msg=" . $msg);
die();
}

if($action=="edit")
{
	$art = new Users("");
	$art = $art->getUsers($dbConn, $id);
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}

if($action=="new")
{
	$art = new Users("");
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}

if($action=="delete")
{
	$art = new Users("");
	$art = $art->deleteUsers($dbConn, $id);
	// Close DB Connection
	mysql_close($dbConn);
	header("Location: index.php?msg=" . $msg);
die();
}

if($action=="logon")
{
	$art = new Users("");
	$art = $art->getUsers($dbConn, $id);
	// Close DB Connection
	mysql_close($dbConn);
	$username	= $art->getlogonName();
	$logonPassword = $art->getlogonPassword();
	$rank	= $art->getrank();
	$logonPasswd = $password;
	header("Location: ../LogonController.php?logonPasswd=" . md5($password) . "&username=" . $username . "&logonPassword=" . md5($logonPassword) . "&rk=" . $rank);
die();
}
?>

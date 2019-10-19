<?php
extract(array_merge($_POST,$_GET));

include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Editors.php");
include("../../secured/phpinclude/classes/EditorsSR.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

if($action=="logon")
{
	$art = new Editors("");
	$art = $art->getEditors($dbConn, $username, $password);
	// Close DB Connection
	mysql_close($dbConn);
	
		if($logonName != $username || $username == "")
		{
			$msg="Invalid User Name";
			include("index2.php");
		}
		elseif($logonPassword != $password || $password == "")
		{
			$msg="Invalid Password";
			include("index2.php");
		}
		else
		{    
			session_start();
			$username=$logonName;
		  session_register('username');
			$hack = "justIn";
			include("home.php");
		}
}

if($action=="save")
{
	$art = new Editors("");
	$art = $art->getEditors($dbConn, $id);
	$art->setlogonName($username);
	$art->setlogonPassword($password);
	$art->setrank($rank);
	if($rank=="")
		$art->setrank("0");

	$art->save($dbConn);
	// Close DB Connection
	mysql_close($dbConn);

header("Location: index2.php?msg=" . $msg);
die();
}

if($action=="edit")
{
	$art = new Editors("");
	$art = $art->getEditors($dbConn, $id);
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}

if($action=="new")
{
	$art = new Editors("");
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}
?>

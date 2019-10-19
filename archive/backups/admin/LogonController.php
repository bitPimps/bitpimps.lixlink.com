<?php
extract(array_merge($_POST,$_GET));

include("../secured/phpinclude/common_db.php");
include("../secured/config/phpConfig.php");

$msg = "";
$logonName = $username;
$logonPassword = $password;

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);
 
$sql =	"SELECT id, logonName, logonPassword FROM adminInfo";

$sql = 	$sql . " WHERE (logonName LIKE '%" . $username . "%' AND logonPassword LIKE '%" . $password . "%')";
		
$recordSetId = mysql_query($sql, $dbConn);

if (!$recordSetId)
	handleDbError_die();
			
$recordSet							= mysql_fetch_row($recordSetId);
$this->logonName				= $recordSet["logonName"];
$this->logonPassword		= $recordSet["logonPassword"];

// Close DB Connection
mysql_close($dbConn);

if($logonName != $username || $username=="")
{
	$msg="Invalid User Name";
	include("index2.php");
}
elseif($logonPassword != $password || $password=="")
{
	$msg="Invalid Password";
	include("index2.php");
}
else
{    
	session_start();
	$username=$logonName;
	$_SESSION["username"] = $username;
	$hack = "justIn";
	include("home.php");
}
?>
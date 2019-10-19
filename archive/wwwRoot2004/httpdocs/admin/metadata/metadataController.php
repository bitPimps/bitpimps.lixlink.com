<?php
extract(array_merge($_POST,$_GET));

include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

if($action=="update")
{
	$metaData = new MetaData("");
	$metaData = $metaData->getMetaData($dbConn, $id);
	$metaData->setTitle($title);
	$metaData->setKeywords($keywords);
	$metaData->setDescription($description);
	$metaData->setCopyright($copyright);
	$metaData->save($dbConn);
	$msg="Meta%20data%20updated!";
}

// Close DB Connection
mysql_close($dbConn);

header("Location: index.php?msg=" . $msg);
die();
?>

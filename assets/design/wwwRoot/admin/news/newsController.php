<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/News.php");
include("../../secured/phpinclude/classes/NewsSR.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

if($action=="save")
{
	$art = new News("");
	$art = $art->getNews($dbConn, $id);
	$art->setcatId($catId);
	$art->settitle($articleTitle);
	$art->setdatePosted($datePosted);
	$art->setshortDesc($introCopy);
	$art->setbody($bodyCopy);
	$art->setactive($active);
	if($active=="")
		$art->setactive("0");

	$art->save($dbConn);
}

if($action=="edit")
{
	$art = new News("");
	$art = $art->getNews($dbConn, $id);
	include("edit.php");
}

if($action=="new")
{
	$art = new News("");

	include("edit.php");
}
	
// Close DB Connection
mysql_close($dbConn);

header("Location: index.php?msg=" . $msg);
die();
?>

<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Articles.php");
include("../../secured/phpinclude/classes/ArticlesSR.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

if($action=="save")
{
	$art = new Articles("");
	$art = $art->getArticles($dbConn, $id);
	$art->setcatId($catId);
	$art->settitle($articleTitle);
	$art->setdatePosted($datePosted);
	$art->setshortDesc($introCopy);
	$art->setbody($bodyCopy);
	$art->setactive($active);
	if($active=="")
		$art->setactive("0");
		$art->save($dbConn);
		// Close DB Connection
		mysql_close($dbConn);
		
		header("Location: index.php?msg=" . $msg);
		die();
}

if($action=="edit")
{
	$art = new Articles("");
	$art = $art->getArticles($dbConn, $id);
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}

if($action=="new")
{
	$art = new Articles("");
	// Close DB Connection
	mysql_close($dbConn);
	include("edit.php");
}


?>
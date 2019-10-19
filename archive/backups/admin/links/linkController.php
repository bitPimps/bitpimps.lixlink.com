<?php
extract(array_merge($_POST,$_GET));

include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Links.php");
include("../../secured/phpinclude/classes/LinksSR.php");

$msg = "";

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);
					
if($action=="update")
{
		$link = new Links("");
		$link = $link->getLinks($dbConn, $id);
		$link->seturl($linkURL);
		$link->setorderId($orderId);
		$link->setname($linkName);
		$link->setdesc($linkDescription);
		$link->save($dbConn);
		$msg="Link%20info%20updated!";
}

if($action=="moveup")
{
	$link = new Links("");
	$link = $link->getLinks($dbConn, $id);

	$linkBro = new Links("");
	$linkBro = $linkBro->getLinkByOrder($dbConn, $link->getorderId() - 1);
	$linkBro->setorderId($link->getorderId());
	$linkBro->save($dbConn);

	$link->setorderId(($link->getorderId() - 1));
	$link->save($dbConn);

	$msg="Link%20moved%20up!";
}

if($action=="movedown")
{
	$link = new Links("");
	$link = $link->getLinks($dbConn, $id);

	$linkBro = new Links("");
	$linkBro = $linkBro->getLinkByOrder($dbConn, $link->getorderId() + 1);
	$linkBro->setorderId($link->getorderId());
	$linkBro->save($dbConn);

	$link->setorderId(($link->getorderId() + 1));
	$link->save($dbConn);

	$msg="Link%20moved%20down!";
}
// Close DB Connection
mysql_close($dbConn);
			
header("Location: index.php?msg=" . $msg);
die();  

?>
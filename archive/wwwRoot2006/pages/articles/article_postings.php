<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/Articles.php");
include("../../secured/phpinclude/classes/ArticlesSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get Article Info
$art = new Articles("");
$art = $art->getArticles($dbConn, $id);

// Close DB Connection
mysql_close($dbConn);

include("../../random_img.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><? echo $metaData->getTitle() ?></title>
<meta name="author" content="bitPimps.lixlink.com" />
<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
<meta name="description" content="<? echo $metaData->getDescription() ?>" />
<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../../styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 0 0 0;
	text-align: center;
	background-image: url(../../images/bg_body.gif);
	background-repeat:repeat;
	background-color: #000;
}
#headcontainer {
	width:90%;
	height:60px;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	text-align:left;
	background-color:#000;
	border-top:1px solid #A4ADA8;
	border-right:1px solid #A4ADA8;
	border-left:1px solid #A4ADA8;
	background-image:url(../../images/bg_head.jpg);
	background-position:right;
	background-repeat:no-repeat;
}
.bodyRight {
	width:220px;
	padding:15px;
	border-right:2px solid #000;
	background-color:#CBD0CD;
	background-image: url(../../images/bg_body.jpg);
	background-repeat:repeat-y;
	background-position:top;
}
-->
</style>
</head>

<body>
<div id="barHeader"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="../../index.php"><img src="../../images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="../../index.php" title="Home">Home</a></li>
			<li><a href="index.php" title="Articles" style="background-color:#929292">Articles</a></li>
			<li><a href="../phpGallery/index.php" title="Galleries">Galleries</a></li>
			<li><a href="../phpForum/index.php" title="Forums">Forums</a></li>
			<li><a href="../../links.php" title="Links">Links</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="viewContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="viewHeader"><img src="../../images/head_articles.gif" alt="Article Categories" name="imgHead" width="188" height="25" id="imgHead" /></td>
			<td rowspan="2" class="imgMain"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" alt="" name="imgBody" width="491" height="173" id="imgBody" /></td>
		</tr>
		<tr>
		  <td valign="top" class="viewCopy">
				<a href="index.php?catId=1" title="Accessories / Add-Ons">Accessories / Add-Ons</a><br />
				<a href="index.php?catId=2" title="Body Modifications">Body Modifications</a><br />
				<a href="index.php?catId=3" title="Chassis Modifications">Chassis Modifications</a><br />
				<a href="index.php?catId=4" title="Rim / Wheel Modifications">Rim / Wheel Modifications</a><br />
				<a href="index.php?catId=5" title="Steering Modifications">Steering Modifications</a><br />
				<a href="index.php?catId=6" title="Painting Modifications">Painting Modifications</a><br />
				<a href="index.php?catId=7" title="Performance Modifications">Performance Modifications</a><br />
				<a href="index.php?catId=8" title="Controller Modifications">Controller Modifications</a>
			</td>
	  </tr>
	</table>
</div>
<div id="bodyContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="headLeft"><h1>Article</h1></td>
			<td class="headCenter" align="right"><h2>
				<?if($catId==""){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Top 10">Back to Top 10</a>
				<?}elseif($catId=="1"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Accessories / Add-Ons">Back to Accessories / Add-Ons</a>
				<?}elseif($catId=="2"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Body Modifications">Back to Body Modifications</a>
				<?}elseif($catId=="3"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Chassis Modifications">Back to Chassis Modifications</a>
				<?}elseif($catId=="4"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Rim / Wheel Modifications">Back to Rim / Wheel Modifications</a>
				<?}elseif($catId=="5"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Steering Modifications">Back to Steering Modifications</a>
				<?}elseif($catId=="6"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Painting Modifications">Back to Painting Modifications</a>
				<?}elseif($catId=="7"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Performance Modifications">Back to Performance Modifications</a>
				<?}elseif($catId=="8"){?>
				<a href="index.php?catId=<? echo $catId ?>" title="Back to Controller Modifications">Back to Controller Modifications</a>
				<?}?></h2>
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
				<p><? echo $art->getdatePosted("m/d/Y") ?><br />
					<strong><? echo $art->gettitle() ?></strong><br />
					<? echo $art->getbody() ?></p>
				<p><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to the top of da page">Back that thing up (to the top of da page)</a></p>
			</td>
		</tr>
	</table>
</div>
<div id="barContainer">
	<div id="barBottom"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="copyright"><? echo $metaData->getCopyright() ?></div>
<p>&nbsp;</p>
</body>
</html>

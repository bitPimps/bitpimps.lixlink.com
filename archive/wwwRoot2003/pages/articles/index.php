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
$artSR = new ArticlesSR($dbConn, 0, 5000, "", "datePosted", $catId, "1");
$arts = $artSR->getArticless();

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
			<td class="headLeft"><h1>
				<? if($catId==""){?>
				Top 10 Articles
				<? }elseif($catId=="1"){?>
				Accessories / Add-Ons
				<? }elseif($catId=="2"){?>
				Body Modifications
				<? }elseif($catId=="3"){?>
				Chassis Modifications
				<? }elseif($catId=="4"){?>
				Rim / Wheel Modifications
				<? }elseif($catId=="5"){?>
				Steering Modifications
				<? }elseif($catId=="6"){?>
				Painting Modifications
				<? }elseif($catId=="7"){?>
				Performance Modifications
				<? }elseif($catId=="8"){?>
				Controller Modifications
				<? } ?>
				</h1>
			</td>
			<td class="headCenter" align="right"><h2><a href="search.php" title="Search Articles">&raquo; Search Articles</a></h2></td>
			<td class="headRight"><h1>Contribute</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial" valign="top">
				<? for ($i = 0; $i<count($arts); $i++)
				{
					if($i<10 && $catId=="")
					{
				?>
				<p><? echo $arts[$i]->getdatePosted("m/d/Y") ?><br />
					<strong><? echo $arts[$i]->gettitle() ?></strong><br />
					<? echo $arts[$i]->getshortDesc() ?><br />
					<a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $catId ?>" title="&raquo; More">&raquo; More</a></p>
				<?
					}
					elseif($catId!="")
					{
				?>
				<p><? echo $arts[$i]->getdatePosted("m/d/Y") ?><br />
					<strong><? echo $arts[$i]->gettitle() ?></strong><br />
					<? echo $arts[$i]->getshortDesc() ?><br />
					<a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $catId ?>" title="&raquo; More">&raquo; More</a></p>
				<?
					}
				}
				if(count($arts)==0)
				{ ?>
				<p>No articles at this time... Check back soon.</p>
				<? } ?>
			</td>
			<td class="bodyRight" valign="top">
				<p><strong>Have your own article you want to let the rest of the community know about?</strong><br />
					Now is the perfect time to register in our <a href="../phpForum/index.php" title="Check out the forums for more information!">Forums</a> 
					and post it yourself. If your tutorial is just as good or better than the other articles here, 
					we will post it here with full credits to you!</p>
				<p><strong>Can't find it in the articles?</strong><br />
					If you have used <a href="search.php" title="search the articles">the search page</a> and still 
					cannot find the information you are looking for in our articles, be sure to check out our <a href="../phpForum/index.php" title="Check out the forums for more information!">Forums</a> 
					for more information!</p>
				<p><strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
					Check out our <a href="../phpGallery/index.php" title="see the Galleries">Galleries</a> section 
					for the most innovative, creative, and just plain hilarious images and videos that start the next 
					&quot;new waves&quot; in the micro rc world!</p>
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

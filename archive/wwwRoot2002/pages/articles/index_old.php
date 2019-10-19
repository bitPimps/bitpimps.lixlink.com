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

include("../includes/php_random_img.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title><? echo $metaData->getTitle() ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="bitPimps.com" />
	<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
	<meta name="description" content="<? echo $metaData->getDescription() ?>" />
	<meta name="MSSmartTagsPreventParsing" content="TRUE" />
	<meta http-equiv="imagetoolbar" content="no" />
	<link rel="stylesheet" href="../../stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:   url(../../images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image:  url(../../images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="../../javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif')">
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><a href="../../index.php" tabindex="1"><img src="../../images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></a></td>
		<td width="121"><img src="../../images/logo/bg_mid.jpg" width="121" height="73" name="bgMid" alt="" /></td>
		<td>
			<!-- Main Navigation -->
			<table width="418" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="6"><img src="../../images/logo/bg_top.jpg" width="418" height="49" name="bgTop" alt="" border="0" usemap="#pimpRadio" /></td>
					<td class="bgBlack"><img src="../../images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="../../index.php" tabindex="2" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnHome','','../../images/buttons/home_over.gif',1)" onfocus="MM_swapImage('btnHome','','../../images/buttons/home_over.gif',1)"><img src="../../images/buttons/home_off.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="index.php" tabindex="3"><img src="../../images/buttons/articles_on.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../phpGallery/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)"><img src="../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../phpForum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)"><img src="../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="../links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)"><img src="../../images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="http://www.cafeshops.com/bitpimps" target="_blank" tabindex="7" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnPimpGear','','../../images/buttons/pimpgear_over.gif',1)" onfocus="MM_swapImage('btnPimpGear','','../../images/buttons/pimpgear_over.gif',1)"><img src="../../images/buttons/pimpgear_off.gif" width="79" height="24" name="btnPimpGear" alt="PimpGear" border="0" /></a></td>
					<td class="bgBlack"><img src="../../images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<?
include("../includes/lines_head.inc")
?>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" height="25" class="bgGreenB"><img src="../../images/headers/articles/categories.gif" width="193" height="25" name="headArticles" alt="Article Categories" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<a href="index.php?catId=1" title="Accessories / Add-Ons">Accessories / Add-Ons</a><br />
				<a href="index.php?catId=2" title="Body Modifications">Body Modifications</a><br />
				<a href="index.php?catId=3" title="Chassis Modifications">Chassis Modifications</a><br />
				<a href="index.php?catId=4" title="Rim / Wheel Modifications">Rim / Wheel Modifications</a><br />
				<a href="index.php?catId=5" title="Steering Modifications">Steering Modifications</a><br />
				<a href="index.php?catId=6" title="Painting Modifications">Painting Modifications</a><br />
				<a href="index.php?catId=7" title="Performance Modifications">Performance Modifications</a><br />
				<a href="index.php?catId=8" title="Controller Modifications">Controller Modifications</a><br /></p>
		</td>
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Body -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="210" class="bgOrangeB">
		<?if($catId==""){?>
			<img src="../../images/headers/articles/top_ten.gif" width="210" height="25" name="headPageLeft" alt="Top 10 Articles" />
		<?}elseif($catId=="1"){?>
			<img src="../../images/headers/articles/cat_accessories.gif" width="210" height="25" name="headPageLeft" alt="Accessories / Add-Ons" />
		<?}elseif($catId=="2"){?>
			<img src="../../images/headers/articles/cat_body.gif" width="210" height="25" name="headPageLeft" alt="Body Modifications" />
		<?}elseif($catId=="3"){?>
			<img src="../../images/headers/articles/cat_chassis.gif" width="210" height="25" name="headPageLeft" alt="Chassis Modifications" />
		<?}elseif($catId=="4"){?>
			<img src="../../images/headers/articles/cat_rims.gif" width="210" height="25" name="headPageLeft" alt="Rim / Wheel Modifications" />
		<?}elseif($catId=="5"){?>
			<img src="../../images/headers/articles/cat_steering.gif" width="210" height="25" name="headPageLeft" alt="Steering Modifications" />
		<?}elseif($catId=="6"){?>
			<img src="../../images/headers/articles/cat_painting.gif" width="210" height="25" name="headPageLeft" alt="Painting Modifications" />
		<?}elseif($catId=="7"){?>
			<img src="../../images/headers/articles/cat_performance.gif" width="210" height="25" name="headPageLeft" alt="Performance Modifications" />
		<?}elseif($catId=="8"){?>
			<img src="../../images/headers/articles/cat_controller.gif" width="210" height="25" name="headPageLeft" alt="Controller Modifications" />
		<?}?>
		</td>		
		<td width="251" align="right" class="bgOrangeB"><span class="headLink"><a href="search.php" title="Search Articles">Search Articles</a></span></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="../../images/headers/articles/contribute.gif" width="193" height="25" name="headPageRight" alt="Contribute" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" valign="top" class="bgGrey">
			<?for ($i = 0; $i<count($arts); $i++)
				{
					if($i<10 && $catId=="")
					{
				?>
			<p class="text">
				<? echo $arts[$i]->getdatePosted("m/d/Y") ?><br />
				<strong><? echo $arts[$i]->gettitle() ?></strong><br />
				<? echo $arts[$i]->getshortDesc() ?><br />
				<a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $catId ?>" title="&raquo; More">&raquo; More</a>
			</p>
			<?	}
					elseif($catId!="")
					{
			?>
			<p class="text">
				<? echo $arts[$i]->getdatePosted("m/d/Y") ?><br />
				<strong><? echo $arts[$i]->gettitle() ?></strong><br />
				<? echo $arts[$i]->getshortDesc() ?><br />
				<a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $catId ?>" title="&raquo; More">&raquo; More</a>
			</p>
			<?
					}
				}
				if(count($arts)==0)
				{ ?>
			<p class="text">
				No articles at this time... Check back soon.
			</p>
			<?}?>
		</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>Have your own article you want to let the rest of the community know about?</strong><br />
				You can <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#98;&#105;&#116;&#112;&#105;&#109;&#112;&#115;&#102;&#101;&#101;&#100;&#98;&#97;&#99;&#107;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;&#63;&#115;&#117;&#98;&#106;&#101;&#99;&#116;&#61;&#65;&#114;&#116;&#105;&#99;&#108;&#101;&#32;&#83;&#117;&#98;&#109;&#105;&#115;&#115;&#105;&#111;&#110;">&#115;&#117;&#98;&#109;&#105;&#116;&#32;&#121;&#111;&#117;&#114;&#32;&#97;&#114;&#116;&#105;&#99;&#108;&#101;&#32;&#116;&#111;&#32;&#117;&#115;</a> or, if you are a registered pimp, you can post it yourself in our <a href="../phpForum/index.php" title="Check out the forums for more information!">Forums</a>.</p>
			<p class="text"><strong>Can't find it in the articles?</strong><br />
				If you have used <a href="search.php" title="search the articles">the search page</a> and still cannot find the information you are looking for in our articles, be sure to check out the <a href="../phpForum/index.php" title="Check out the forums for more information!">Forums</a> for more information!</p>
			<p class="text"><strong>Get your PimpGear:</strong><br />
				Dress in comfort and style, get a toolbox for you micro r/c accessories and more at <a href="http://www.cafeshops.com/bitpimps" target="_blank">our online shop</a>!</p>
			<p class="text">
				<strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
				Check out our <a href="../phpGallery/index.php">Galleries</a> section for the most innovative, creative, and just plain hilarious images and videos that start the next 'new waves' in the micro rc world!</p>
			<?
				include ("../includes/wallpapers.inc")
			?>
		</td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../includes/copyright.inc")
?>
<map name="pimpRadio" id="pimpRadio">
  <area shape="rect" coords="208,2,417,48" href="javascript:;" alt="bitPimps Radio - click to listen!" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')" />
</map>
</body>
</html>

<?php
extract(array_merge($_POST,$_GET));

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
<meta name="author" content="bitPimps.lixlink.com" />
<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
<meta name="description" content="<? echo $metaData->getDescription() ?>" />
<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../../stylesheets/bp_public.css" rel="stylesheet" type="text/css">
<style type="text/css">
	<!--
	.bgHomeSub	{
	background-image:  url(../../images/backgrounds/home_sub.jpg);
	background-repeat: repeat-y;
	background-color: #A4ADA8;
	background-position: center;
	}
	.bgLogoUnder	{
	background-image: url(../../images/backgrounds/logo_under.gif);
	background-repeat: repeat-x;
	}
	-->
</style>
<script language="JavaScript" type="text/JavaScript" src="../../javascript/layers_reload.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/image_preload_swap.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body onload="MM_preloadImages('../../images/buttons/galleries_over.jpg','../../images/buttons/forums_over.jpg','../../images/buttons/links_over.jpg','../../images/buttons/pimpgear_over.jpg','../../images/buttons/radio_over.jpg','../../images/buttons/home_over.jpg')">
<div id="LogoNav" style="position:absolute; width:95%; height:74px; z-index:1; left: 25px; top: 0px; visibility: visible; overflow: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgOrangeB"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="6" id="shim" /></td>
		</tr>
		<tr>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
			<td width="176"><a href="../../index.php"><img src="../../images/logo/bitpimps.gif" / alt="bitPimps Custom Modifications" name="logo" width="176" height="60" border="0" id="logo" /></a></td>
			<td align="right" class="bgLogoUnder"><img src="../../images/logo/bg_left.jpg" / alt="" name="logoBGleft" width="154" height="60" id="logoBGleft" /></td>
			<td width="418">
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="271"><img src="../../images/logo/bg_top.jpg" / alt="" name="logoBGtop" width="271" height="20" id="logoBGtop" /></td>
						<td width="147"><a href="javascript:;" onmouseover="MM_swapImage('navRadio','','../../images/buttons/radio_over.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')"><img src="../../images/buttons/radio_off.jpg" / alt="bitPimps Radio (bPRX)" name="navRadio" width="147" height="20" border="0" id="navRadio" /></a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="../../images/logo/bg_bottom.jpg" / alt="" name="logoBGbottom" width="418" height="16" id="logoBGbottom" /></td>
					</tr>
				</table>
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="60"><a href="../../index.php" onmouseover="MM_swapImage('navHome','','../../images/buttons/home_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/home_off.jpg" / alt="Home" name="navHome" width="60" height="24" border="0" id="navHome" /></a></td>
						<td width="71"><a href="index.php"><img src="../../images/buttons/articles_over.jpg" / alt="Articles" name="navArticles" width="71" height="24" border="0" id="navArticles" /></a></td>
						<td width="77"><a href="../phpGallery/index.php" onmouseover="MM_swapImage('navGalleries','','../../images/buttons/galleries_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/galleries_off.jpg" / alt="Galleries" name="navGalleries" width="77" height="24" border="0" id="navGalleries" /></a></td>
						<td width="71"><a href="../phpForum/index.php" onmouseover="MM_swapImage('navForums','','../../images/buttons/forums_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/forums_off.jpg" / alt="Forums" name="navForums" width="71" height="24" border="0" id="navForums" /></a></td>
						<td width="60"><a href="../links/index.php" onmouseover="MM_swapImage('navLinks','','../../images/buttons/links_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/links_off.jpg" / alt="Links" name="navLinks" width="60" height="24" border="0" id="navLinks" /></a></td>
						<td width="79"><a href="http://www.cafeshops.com/bitpimps" target="_blank" onmouseover="MM_swapImage('navPimpGear','','../../images/buttons/pimpgear_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/pimpgear_off.jpg" / alt="PimpGear" name="navPimpGear" width="79" height="24" border="0" id="navPimpGear" /></a></td>
					</tr>
				</table>
			</td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
		</tr>
	</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="ROTW" style="position:absolute; width:95%; height:175px; z-index:1; top: 74px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td class="bgGreenA" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="bgGreenB" style="padding-left: 10px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px;"><img src="../../images/headers/articles/categories.gif" / alt="Article Categories" name="headCategories" width="193" height="25" id="headCategories" /></td>
					</tr>
					<tr>
						<td style="padding: 10px;">
							<span class="text">
							<a href="index.php?catId=1" title="Accessories / Add-Ons">Accessories / Add-Ons</a><br />
							<a href="index.php?catId=2" title="Body Modifications">Body Modifications</a><br />
							<a href="index.php?catId=3" title="Chassis Modifications">Chassis Modifications</a><br />
							<a href="index.php?catId=4" title="Rim / Wheel Modifications">Rim / Wheel Modifications</a><br />
							<a href="index.php?catId=5" title="Steering Modifications">Steering Modifications</a><br />
							<a href="index.php?catId=6" title="Painting Modifications">Painting Modifications</a><br />
							<a href="index.php?catId=7" title="Performance Modifications">Performance Modifications</a><br />
							<a href="index.php?catId=8" title="Controller Modifications">Controller Modifications</a></span>	
						</td>
					</tr>
				</table>
			</td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td width="491"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="Body" style="position:absolute; width:95%; height:200px; z-index:1; top: 249px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td class="bgOrangeB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;">
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
			<td width="220" class="bgOrangeB" align="right" style="padding-left:0px; padding-bottom:0px; padding-right:15px; padding-top:0px;"><span class="headLink"><a href="search.php" title="Search Articles">&raquo; Search Articles</a></span></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="120" class="bgGreenB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../../images/headers/articles/contribute.gif" / alt="Contribute" name="headContribute" width="193" height="25" id="headContribute" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td colspan="2" valign="top" class="bgGrey" style="padding: 15px;">
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
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="220" valign="top" class="bgHomeSub" style="padding: 15px;">
			<p class="text">
			<strong>Have your own article you want to let the rest of the community know about?</strong><br />
			You can <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#98;&#105;&#116;&#112;&#105;&#109;&#112;&#115;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;&#63;&#115;&#117;&#98;&#106;&#101;&#99;&#116;&#61;&#65;&#114;&#116;&#105;&#99;&#108;&#101;&#32;&#83;&#117;&#98;&#109;&#105;&#115;&#115;&#105;&#111;&#110;">&#115;&#117;&#98;&#109;&#105;&#116;&#32;&#121;&#111;&#117;&#114;&#32;&#97;&#114;&#116;&#105;&#99;&#108;&#101;&#32;&#116;&#111;&#32;&#117;&#115;</a> or, if you are a registered pimp, you can post it yourself in our <a href="../phpForum/index.php" title="Check out the forums for more information!">Forums</a>.</p>
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
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td align="center" style="padding-left: 0px; padding-bottom: 5px; padding-right: 0px; padding-top: 5px;"><p class="copyright"><? echo $metaData->getCopyright() ?></p></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td colspan="3" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="2" id="shim" /></td>
		</tr>
	</table>
	<p>&nbsp;</p>
</div>
</body>
</html>

<?php
extract(array_merge($_POST,$_GET));

include("secured/config/phpConfig.php");
include("secured/phpinclude/common_db.php");
include("secured/phpinclude/classes/MetaData.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Close DB Connection
mysql_close($dbConn);
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
<link href="stylesheets/bp_public.css" rel="stylesheet" type="text/css">
<style type="text/css">
	<!--
	.bgHomeSub	{
	background-image: url(images/backgrounds/home_sub.jpg);
	background-repeat: repeat-y;
	background-color: #A4ADA8;
	background-position: center;
	}
	.bgLogoUnder	{
	background-image: url(images/backgrounds/logo_under.gif);
	background-repeat: repeat-x;
	}
	-->
</style>
<script language="JavaScript" type="text/JavaScript" src="javascript/layers_reload.js"></script>
<script language="JavaScript" type="text/javascript" src="javascript/image_preload_swap.js"></script>
<script language="JavaScript" type="text/javascript" src="javascript/window_open.js"></script>
</head>

<body onload="MM_preloadImages('images/buttons/articles_over.jpg','images/buttons/galleries_over.jpg','images/buttons/forums_over.jpg','images/buttons/links_over.jpg','images/buttons/pimpgear_over.jpg','images/buttons/radio_over.jpg')">
<div id="LogoNav" style="position:absolute; width:95%; height:74px; z-index:1; left: 25px; top: 0px; visibility: visible; overflow: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgOrangeB"><img src="images/shim.gif" / alt="" name="shim" width="750" height="6" id="shim" /></td>
		</tr>
		<tr>
			<td><img src="images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
			<td width="176"><a href="index.php"><img src="images/logo/bitpimps.gif" / alt="bitPimps Custom Modifications" name="logo" width="176" height="60" border="0" id="logo" /></a></td>
			<td align="right" class="bgLogoUnder"><img src="images/logo/bg_left.jpg" / alt="" name="logoBGleft" width="154" height="60" id="logoBGleft" /></td>
			<td width="418">
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="271"><img src="images/logo/bg_top.jpg" / alt="" name="logoBGtop" width="271" height="20" id="logoBGtop" /></td>
						<td width="147"><a href="javascript:;" onmouseover="MM_swapImage('navRadio','','images/buttons/radio_over.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')"><img src="images/buttons/radio_off.jpg" / alt="bitPimps Radio (bPRX)" name="navRadio" width="147" height="20" border="0" id="navRadio" /></a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/logo/bg_bottom.jpg" / alt="" name="logoBGbottom" width="418" height="16" id="logoBGbottom" /></td>
					</tr>
				</table>
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="60"><a href="index.php"><img src="images/buttons/home_over.jpg" / alt="Home" name="navHome" width="60" height="24" border="0" id="navHome" /></a></td>
						<td width="71"><a href="pages/articles/index.php" onmouseover="MM_swapImage('navArticles','','images/buttons/articles_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="images/buttons/articles_off.jpg" / alt="Articles" name="navArticles" width="71" height="24" border="0" id="navArticles" /></a></td>
						<td width="77"><a href="pages/phpGallery/index.php" onmouseover="MM_swapImage('navGalleries','','images/buttons/galleries_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="images/buttons/galleries_off.jpg" / alt="Galleries" name="navGalleries" width="77" height="24" border="0" id="navGalleries" /></a></td>
						<td width="71"><a href="pages/phpForum/index.php" onmouseover="MM_swapImage('navForums','','images/buttons/forums_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="images/buttons/forums_off.jpg" / alt="Forums" name="navForums" width="71" height="24" border="0" id="navForums" /></a></td>
						<td width="60"><a href="pages/links/index.php" onmouseover="MM_swapImage('navLinks','','images/buttons/links_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="images/buttons/links_off.jpg" / alt="Links" name="navLinks" width="60" height="24" border="0" id="navLinks" /></a></td>
						<td width="79"><a href="http://www.cafeshops.com/bitpimps" target="_blank" onmouseover="MM_swapImage('navPimpGear','','images/buttons/pimpgear_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="images/buttons/pimpgear_off.jpg" / alt="PimpGear" name="navPimpGear" width="79" height="24" border="0" id="navPimpGear" /></a></td>
					</tr>
				</table>
			</td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
		</tr>
	</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="ROTW" style="position:absolute; width:95%; height:175px; z-index:1; top: 74px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td class="bgGreenA" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="bgGreenB"><img src="images/headers/home/rotm.gif" / alt="Ride of the Month" name="headROTM" width="251" height="25" id="headROTM" /></td>
					</tr>
					<tr>
						<td style="padding: 10px;">
							<span class="text">Each month, we let the users choose who will be honored with winning the bitPimps Ride of the Month. <a href="pages/phpGallery/thumbnails.php?album=27">View past winners</a> or <a href="pages/phpForum/viewtopic.php?t=3551">go put your vote in</a> for next month's winner.</span>
							<br /><br />
							<span class="text">This months winner: <strong>steelwoolghandi</strong></span>
							<br />
							<br />
							<span class="text">- Word to BigBird</span>	
						</td>
					</tr>
				</table>
			</td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
      <td width="491"><img src="images/page_images/491x173/rotm_home/2006_01.jpg" / alt="" name="rotm" width="491" height="173" id="rotm" /></td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="Body" style="position:absolute; width:95%; height:200px; z-index:1; top: 249px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td colspan="3" class="bgOrangeB" align="center" style="padding-left:15px; padding-bottom:0px; padding-right:15px; padding-top:0px;"><span class="headLink"><a href="pages/news/index.php">&raquo; Read some entertaining &quot;bitPimps News&quot; as reported by our PNN beaureu.</a></span></td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
				<p class="text" align="center"><a href="pages/phpForum/index.php"><img src="images/headers/home/community.jpg" / alt="bitPimps Community" name="bPCom" width="200" height="275" border="0" id="bPCom" /></a></p>
				<p class="text"><strong>Want to talk with other members who share your interests in the R/C hobby?</strong><br />
					Our <a href="pages/phpForum/index.php">Forums</a> are full of discussion with less clutter and an adult attitude.</p>
				<p class="text">bitPimps gives back to the <a href="pages/phpForum/index.php">community</a> by running <a href="pages/phpForum/viewforum.php?f=27">contests</a> regularly that give the members their chances to win some <a href="pages/phpGallery/thumbnails.php?album=86">killer prizes</a> from tools to complete cars customized by the bitPimps themselves.</p>
				<p class="text">In addition to having discussion areas for your: Bit Char-G, Super Bit Char-G, ZipZap, ZipZap SE, ZipZap MT, SuperSlick, Clones, 					Xmod, Mini-Z, I-Waver, T Maxx, Revo, etc. We also have off-topic discussion areas for other common interests outside of the rc hobby.</p>
				<p class="text">Many of our members are very helpful and are great resources of information, help, and hook-ups.</p>
				</td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
				<p class="text" align="center"><a href="pages/articles/index.php"><img src="images/headers/home/tutorials.jpg" / alt="bitPimps Tutorials" name="bPTut" width="200" height="275" border="0" id="bPTut" /></a></p>
				<p class="text"><strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
					Our <a href="pages/articles/index.php">Articles</a> are informative  with clear instructions and crisp pictures.</p>
				<p class="text">Visit for custom modifications, how-to's and tutorials, most of which can be applied to bits, microsizers, zipzaps, superslicks, clones, and just about any micro rc vehicle!</p>
				<p class="text">Looking to <a href="pages/articles/index.php?catId=7">boost performance</a> with the infamous MOSFET Mod or Dual Cell Mod? Want to <a href="pages/articles/index.php?catId=6">make your ride look good</a> with some fresh paint? What about making it <a href="pages/articles/index.php?catId=4">roll right</a> with some new wheels? <a href="pages/articles/index.php">You can find it all here.</a></p>
				<p class="text">Want to see what can be done to your ZipZap SE or ZipZap MT? What about an original Bit Char-G or Micosizer, or even a SuperSlick or some other clone? <a href="pages/articles/index.php">This is the place.</a></p></td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
				<p class="text" align="center"><a href="pages/phpGallery/"><img src="images/headers/home/galleries.jpg" / alt="bitPimps Galleries" name="bPGal" width="200" height="275" border="0" id="bPGal" /></a></p>
				<p class="text"><strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
					Our <a href="pages/phpGallery/index.php">Galleries</a> section is known as the largest micro rc gallery around.</p>
				<p class="text">It<a href="pages/phpgallery/index.php"></a> contains some of the most innovative, creative, and just plain hilarious images and videos that start the next &quot;new waves&quot; in the micro rc world and beyond!</p>
				<p class="text">We don't only have Bit Char-G and ZipZap in our galleries, you will see Xmod, Mini-Z, T Maxx, Revo, and just about everything else. See for yourself and check out some of the <a href="pages/phpGallery/index.php?cat=1">bitPimps Crew Galleries</a> and see what else we're all in to.</p>
				<p class="text">* We are not a company, we don't sell anything, we don't charge for anything, we don't profit from anything, hell - we don't even have any ads!</p>
			</td>
			<td width="2"><img src="images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td align="center" style="padding-left: 0px; padding-bottom: 5px; padding-right: 0px; padding-top: 5px;"><p class="copyright"><? echo $metaData->getCopyright() ?></p></td>
			<td width="1" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td colspan="3" class="bgGreenA"><img src="images/shim.gif" / alt="" name="shim" width="750" height="2" id="shim" /></td>
		</tr>
	</table>
	<p>&nbsp;</p>
</div>
</body>
</html>

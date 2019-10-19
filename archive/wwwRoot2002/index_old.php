<?php
include("secured/config/phpConfig.php");
include("secured/phpinclude/common_db.php");
include("secured/phpinclude/classes/MetaData.php");
include("secured/phpinclude/classes/News.php");
include("secured/phpinclude/classes/NewsSR.php");


// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get News Info
$artSR = new NewsSR($dbConn, 0, 5000, "", "datePosted", "1");
$arts = $artSR->getNewss();

// Close DB Connection
mysql_close($dbConn);

include("pages/includes/php_random_img.php");
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
	<link rel="stylesheet" href="stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:  url(images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image: url(images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/javascript" src="javascript/window_open.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('images/buttons/articles_over.gif','images/buttons/galleries_over.gif','images/buttons/forums_over.gif','images/buttons/links_over.gif','images/buttons/members_over.gif')">
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><a href="index.php" tabindex="1"><img src="images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></a></td>
		<td width="121"><img src="images/logo/bg_mid.jpg" width="121" height="73" name="bgMid" alt="" /></td>
		<td>
			<!-- Main Navigation -->
			<table width="418" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="6"><img src="images/logo/bg_top.jpg" alt="" name="bgTop" width="418" height="49" border="0" usemap="#pimpRadio" /></td>
					<td class="bgBlack"><img src="images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="index.php" tabindex="2"><img src="images/buttons/home_on.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="pages/articles/index.php" tabindex="3" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnArticles','','images/buttons/articles_over.gif',1)" onfocus="MM_swapImage('btnArticles','','images/buttons/articles_over.gif',1)"><img src="images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="pages/phpGallery/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)"><img src="images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="pages/phpForum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)"><img src="images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="pages/links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)"><img src="images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="http://www.cafeshops.com/bitpimps" target="_blank" tabindex="7" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnPimpGear','','images/buttons/pimpgear_over.gif',1)" onfocus="MM_swapImage('btnPimpGear','','images/buttons/pimpgear_over.gif',1)"><img src="images/buttons/pimpgear_off.gif" width="79" height="24" name="btnPimpGear" alt="PimpGear" border="0" /></a></td>
					<td class="bgBlack"><img src="images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td colspan="3" class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" height="25" class="bgGreenB"><img src="images/headers/home/word_moms.gif" alt="Word To Mom's" name="headA" width="193" height="25" id="headA" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<strong>Word to your moms:</strong><br />
				Welcome to the bitPimps crib. We hope you find your visit here an enjoyable one. Our goal is to entertain and inform the masses while keeping it 'real'. And by 'real' we mean it's the hizzle dizzle schizzle fur rizzle!</p></td>
		<td width="15" height="148" class="bgGreenA"><img src="images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Body -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="210" class="bgOrangeB"><img src="images/headers/home/latest_news.gif" alt="Latest News" name="headB" width="210" height="25" id="headB" /></td>
		<td width="251" align="right" class="bgOrangeB"><span class="headLink"><a href="pages/news/index.php" title="Peep the rest of da the &quot;news&quot;">News Archives</a></span></td>
		<td width="15" class="bgOrangeB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="images/headers/home/announcements.gif" alt="Announcements" name="headC" width="193" height="25" id="headC" /></td>
		<td width="15" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" valign="top" class="bgGrey">
			<?for ($i = 0; $i<count($arts); $i++)
				{
					if($i<20 && $catId=="")
					{
				?>
			<p class="text">
				<? echo $arts[$i]->getdatePosted("m/d/Y") ?><br />
				<strong><? echo $arts[$i]->gettitle() ?></strong><br />
				<? echo $arts[$i]->getshortDesc() ?><br />
				<a href="pages/news/news_postings.php?id=<? echo $arts[$i]->getid() ?>&from=Home" title="&raquo; More">&raquo; More</a>
			</p>
			<?	}
				}
				if(count($arts)==0)
				{ ?>
			<p class="text">
				No news at this time... Check back soon.
			</p>
			<?}?>
			<span style="color: #E4E4E4; font-size: 1px;">bitpimps custom modification upgrade bit char-g tutorial information photo image video race news forum micro rc microsizer pullback gallery video paint body chassis gear motor suspension</span>
		</td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
				Check our <a href="pages/articles/index.php">Articles</a> section for custom modifications, how-to's and tutorials, most of which can be applied to bits, microsizers, zipzaps, clones, and just about any micro rc hobby!</p>
			<p class="text">
				<strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
				Check out our <a href="pages/phpGallery/index.php">Galleries</a> section for the most innovative, creative, and just plain hilarious images and videos that start the next 'new waves' in the micro rc world!</p>
			<p class="text">
				<strong>Still need help or wanna discuss more on the hobby?</strong><br />
				Join our <a href="pages/phpForum/index.php">Forums</a> for any and all possible answers to all your questions or find out the hot information before anyone else!</p>
			<p class="text"><strong>Get your PimpGear:</strong><br />
				Dress in comfort and style, get a toolbox for you micro r/c accessories and more at <a href="http://www.cafeshops.com/bitpimps" target="_blank">our online shop</a>!</p>
			<p class="text">
				<strong>What are we all about?</strong><br />
				Simple. FUN. That's it. We're about having fun, if we happen to inform, educate, or otherwise inspire along the way, all the better. Our goals aren't to take over the market nor to be the community leaders, except of course in the area of entertainment! Just like a chef prepares their favorite dishes, the bitPimps take their time to conceptualize and develop highly creative pieces that keep audiences on their toes and under their desks!</p>
			<?
				include ("pages/includes/wallpapers.inc")
			?>
		</td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlack"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="716" align="center" class="bgBlack"><span class="copyright">Copyright &copy; 2002 - 2003 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</span></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<map name="pimpRadio" id="pimpRadio">
  <area shape="rect" coords="208,2,417,48" href="javascript:;" alt="bitPimps Radio - click to listen!" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')" />
</map>
</body>
</html>

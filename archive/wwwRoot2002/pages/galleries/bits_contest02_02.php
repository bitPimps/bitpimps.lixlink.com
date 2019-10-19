<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

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
	<script language="JavaScript" type="text/JavaScript" src="../../javascript/view_img.js"></script>
	<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif')">
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
					<td><a href="../articles/index.php" tabindex="3" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)" onfocus="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)"><img src="../../images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="index.php" tabindex="4"><img src="../../images/buttons/galleries_on.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
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
		<td width="193" height="25" class="bgGreenB"><img src="../../images/headers/galleries/galleries_selections.gif" width="193" height="25" name="headGalleries" alt="Galleries" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="173" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="173" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="75" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="75" name="shim" alt="" /></td>
		<td width="193" height="75" class="bgGreenA" valign="top">
			<p class="text"><br />
				Updates will happen as we produce new material so be sure to check back often!<br />
				Currently we offer 3 sections in our galleries:<br />
				<a href="movies00.php">Movies</a><br />
				<a href="bits00.php">Bits</a><br />
				<a href="tracks00.php">Tracks</a></p>
		</td>
		<td width="15" height="75" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="75" name="shim" alt="" /></td>
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
		<td width="686" class="bgOrangeB"><img src="../../images/headers/galleries/bit_images.gif" width="210" height="25" name="headPageLeft" alt="Bit Images" /></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" class="bgGrey"><img src="../../images/shim.gif" width="686" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" valign="top" class="bgGrey">
			<p class="text">
				<strong>Set 1: Pimp Sleds</strong> (109 images) - (Pages: <a href="bits00.php">1</a> <a href="bits01.php">2</a> <a href="bits02.php">3</a> <a href="bits03.php">4</a> <a href="bits04.php">5</a> <a href="bits05.php">6</a> <a href="bits06.php">7</a> <a href="bits07.php">8</a>)<br />
				<strong>Set 2: Contest - Most Pimpin Ride</strong> (104 images) - (Pages: <a href="bits_contest01_01.php">1</a> <a href="bits_contest01_02.php">2</a> <a href="bits_contest01_03.php">3</a> <a href="bits_contest01_04.php">4</a> <a href="bits_contest01_05.php">5</a> <a href="bits_contest01_06.php">6</a> <a href="bits_contest01_07.php">7</a>)<br />
				<strong>Set 3: Contest - Twisted Plastic</strong> (48 images) - (Pages: <a href="bits_contest02_01.php">1</a> <a href="bits_contest02_02.php">2</a> <a href="bits_contest02_03.php">3</a> <a href="bits_contest02_04.php">4</a>)<br />
				<strong>Set 4: Contest - Who Say's You Can't Polish a Turd</strong> (16 images) - (Pages: <a href="bits_contest03_01.php">1</a> <a href="bits_contest03_02.php">2</a>)<br />
				<strong>Set 5: Contest - Pimps Middle of the Road</strong> (54 images) - (Pages: <a href="bits_contest04_01.php">1</a> <a href="bits_contest04_02.php">2</a> <a href="bits_contest04_03.php">3</a> <a href="bits_contest04_04.php">4</a>)<br />
				<strong>Set 6: Contest - End of the Year Blow-Out 2003</strong> (67 images) - (Pages: <a href="bits_contest05_01.php">1</a> <a href="bits_contest05_02.php">2</a> <a href="bits_contest05_03.php">3</a> <a href="bits_contest05_04.php">4</a> <a href="bits_contest05_05.php">5</a>)</p>
			<p class="text">
				Click the photo for a larger view.</p>
			<!-- Photos Table Header -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="664" class="bgBlack"><img src="../../images/shim.gif" width="664" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="664" align="center" class="bgGreenB"><span class="headLink"><a href="bits_contest02_01.php" title="Previous 15 Images">&laquo; Previous 15</a> | 16 - 30 of 48 | <a href="bits_contest02_03.php" title="Next 15 Images">Next 15 &raquo;</a></span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Image Table -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" class="bgBlack"><img src="../../images/shim.gif" width="144" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/bits/cabowabo/gtr-2000/decal/shot02.jpg','400','410','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/bits/cabowabo/gtr-2000/decal/thumbs/shot02.jpg" alt="" name="img0001" width="100" height="103" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/noxorc_1_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/noxorc_1_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/noxorc_1_2.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/noxorc_1_2.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/sm2osley_1_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/sm2osley_1_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/lefttoe_1_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/lefttoe_1_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" class="bgBlack"><img src="../../images/shim.gif" width="144" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/lefttoe_1_2.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/lefttoe_1_2.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/aquarius_1_1.jpg','402','568','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/aquarius_1_1.jpg" alt="" name="img0001" width="100" height="141" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/aquarius_1_2.jpg','402','466','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/aquarius_1_2.jpg" alt="" name="img0001" width="100" height="116" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/aquarius_2_1.jpg','402','432','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/aquarius_2_1.jpg" alt="" name="img0001" width="100" height="107" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/aquarius_2_2.jpg','402','513','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/aquarius_2_2.jpg" alt="" name="img0001" width="100" height="128" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" class="bgBlack"><img src="../../images/shim.gif" width="144" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/lefttoe_2_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/lefttoe_2_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/lefttoe_2_3.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/lefttoe_2_3.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/skylinepimpinr34_1_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/skylinepimpinr34_1_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/skylinepimpinr34_1_2.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/skylinepimpinr34_1_2.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" align="center" valign="middle"><a href="javascript:;" onclick="JustSoPicWindow('../../images/forum_images/contest_entries/twisted_plastic/yagbols_1_1.jpg','640','480','BitPimps Gallery Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../images/forum_images/contest_entries/twisted_plastic/thumbs/yagbols_1_1.jpg" alt="" name="img0001" width="100" height="75" vspace="10" border="0" id="img0001" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="144" class="bgBlack"><img src="../../images/shim.gif" width="144" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="134" class="bgBlack"><img src="../../images/shim.gif" width="134" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Photos Table Footer -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="664" align="center" class="bgGreenB"><span class="headLink"><a href="bits_contest02_01.php" title="Previous 15 Images">&laquo; Previous 15</a> | 16 - 30 of 48 | <a href="bits_contest02_03.php" title="Next 15 Images">Next 15 &raquo;</a></span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="664" class="bgBlack"><img src="../../images/shim.gif" width="664" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			<p class="text"><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to da top of da page">Back that thing up (to the top of da page)</a></p></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" class="bgGrey"><img src="../../images/shim.gif" width="686" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
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

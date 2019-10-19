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
					<td><a href="../phpGallery/index.php" tabindex="4"><img src="../../images/buttons/galleries_on.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
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
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="75" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<a href="../phpGallery/index.php">Click here to go back to the main photo galleries.</a></p>
		</td>
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="75" name="shim" alt="" /></td>
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
		<td width="686" class="bgOrangeB"><img src="../../images/headers/galleries/bit_videos.gif" width="210" height="25" name="headPageLeft" alt="Bit Videos" /></td>
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
				<strong>Set 1:</strong> (25 videos) <a href="movies00.php">Page 1</a> > <a href="movies01.php">Page 2</a> &gt; <a href="movies02.php">Page 3</a></p>
			<p class="text">
				Click the photo to view the videos.</p>
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
					<td width="664" align="center" class="bgGreenB"><span class="headLink"><a href="movies00.php" title="Previous 10 Movies">Previous 10 &laquo;</a> | 11 - 20 of 25 | <a href="movies02.php" title="Next 10 Movies">Next 10 &raquo;</a></span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Image Table -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" align="center" valign="middle"><a href="../../images/movies/cabowabo/pimp_ski.wmv"><img src="../../images/movies/cabowabo/thumbs/pimp_ski.jpg" width="200" height="150" name="img0001" alt="" vspace="10" border="0" /></a>
						<br /><strong>bitPimps @ Da Lake Ski Break</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" align="center" valign="middle"><a href="../../images/movies/cabowabo/races_warmup.wmv"><img src="../../images/movies/cabowabo/thumbs/races_part0.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>A Day @ Da bitPimps Races (Part: 1)</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" align="center" valign="middle"><a href="../../images/movies/cabowabo/races_part1.wmv"><img src="../../images/movies/cabowabo/thumbs/races_part1.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>A Day @ Da bitPimps Races (Part: 2)</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" align="center" valign="middle"><a href="../../images/movies/cabowabo/races_part2.wmv"><img src="../../images/movies/cabowabo/thumbs/races_part2.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>A Day @ Da bitPimps Races (Part: 3)</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" align="center" valign="middle"><a href="../../images/movies/cabowabo/vert_ramp.wmv"><img src="../../images/movies/cabowabo/thumbs/vert_ramp.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>Vert Ramp Action</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" align="center" valign="middle"><a href="../../images/movies/cabowabo/artsy.wmv"><img src="../../images/movies/cabowabo/thumbs/artsy.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>Lets Get Artsy Fartsy</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" align="center" valign="middle"><a href="../../images/movies/cabowabo/silly_happy.wmv"><img src="../../images/movies/cabowabo/thumbs/silly_happy.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>Super Silly Happy Crazy Funny (Stunt Bit)</strong> by <strong>CaboWabo</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" align="center" valign="middle"><a href="../../images/movies/crazydave/bajatrip.wmv"><img src="../../images/movies/crazydave/thumbs/bajatrip.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>Baja Trippin' (Trippin' In The Dirt)</strong> by <strong>crazydave</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" align="center" valign="middle"><a href="../../images/movies/crazydave/bajatrip2.wmv"><img src="../../images/movies/crazydave/thumbs/bajatrip2.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br /><strong>Baja Trippin' II (Desert Rat)</strong> by <strong>crazydave</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" align="center" valign="middle"><a href="../../images/movies/cabowabo/ganked.wmv"><img src="../../images/movies/cabowabo/thumbs/ganked.jpg" alt="" name="img0001" width="200" height="150" vspace="10" border="0" id="img0001" /></a>
						<br />
						<strong>Ganked Ghetto Style</strong> by <strong>CaboWabo & payaso</strong></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="345" class="bgBlack"><img src="../../images/shim.gif" width="345" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="335" class="bgBlack"><img src="../../images/shim.gif" width="335" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Photos Table Footer -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="664" align="center" class="bgGreenB"><span class="headLink"><a href="movies00.php" title="Previous 10 Movies">Previous 10 &laquo;</a> | 11 - 20 of 25 | <a href="movies02.php" title="Next 10 Movies">Next 10 &raquo;</a></span></td>
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

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

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/home_over.gif')">
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
					<td colspan="6"><img src="../../images/logo/bg_top.jpg" width="418" height="49" name="bgTop" alt="" /></td>
					<td class="bgBlack"><img src="../../images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="../../index.php" tabindex="2" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnHome','','../../images/buttons/home_over.gif',1)" onFocus="MM_swapImage('btnHome','','../../images/buttons/home_over.gif',1)"><img src="../../images/buttons/home_off.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="../articles/index.php" tabindex="3" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)" onFocus="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)"><img src="../../images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../galleries/index.php" tabindex="4" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)" onFocus="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)"><img src="../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../phpForum/index.php" tabindex="5" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)" onFocus="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)"><img src="../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="../links/index.php" tabindex="6" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)" onFocus="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)"><img src="../../images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="index.php" tabindex="7"><img src="../../images/buttons/members_on.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
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
		<td width="193" height="25" class="bgGreenB"><img src="../../images/headers/members/about_us.gif" width="193" height="25" name="headA" alt="A Little About Us" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="../../images/page_images/members/homies.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				Four brotha's gots together to produce bitPimps, the gang. From there, each member's individual efforts and talents helped to build bitPimps into the first class, custom modification and Bit / Micro RC resouce center it is today. Read more about each member below.</p>
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
		<td width="686" class="bgOrangeB"><img src="../../images/headers/members/crazy_large.gif" width="350" height="25" name="headB" alt="We Be Crazy Large" /></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" valign="top" class="bgGrey">
			<p class="text">
				<strong>Check out each members crib!</strong><br />
				All four founding pimp daddies have their own personal site that gives a little more information and insight into themselves, their cars, hobbies, interests, etc. We recommend you take a moment to check out each members site, you never know what you're going to find... wink wink.</p>
			<p class="text">
				<strong>CaboWabo</strong><br />
				<a href="javascript:;">http://cabowabo.lixlink.com/</a></p>
			<p class="text"><strong>payaso</strong><br />
				<a href="javascript:;">http://payaso.lixlink.com/</a></p>
			<p class="text"><strong>Shredder</strong><br />
				<a href="javascript:;">http://shredder.lixlink.com/</a></p>
			<p class="text"><strong>DaGeneral</strong><br />
				<a href="javascript:;">http://dageneral.lixlink.com/</a></p>
			</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="686" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../includes/copyright.inc")
?>
</body>
</html>

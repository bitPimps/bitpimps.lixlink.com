<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/News.php");
include("../../secured/phpinclude/classes/NewsSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get News Info
$art = new News("");
$art = $art->getNews($dbConn, $id);

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

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif','../../images/buttons/articles_over.gif')">
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
					<td><a href="../../index.php" tabindex="2"><img src="../../images/buttons/home_on.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="../articles/index.php" tabindex="3" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)" onFocus="MM_swapImage('btnArticles','','../../images/buttons/articles_over.gif',1)"><img src="../../images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../galleries/index.php" tabindex="4" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)" onFocus="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)"><img src="../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../phpForum/index.php" tabindex="5" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)" onFocus="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)"><img src="../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="../links/index.php" tabindex="6" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)" onFocus="MM_swapImage('btnLinks','','../../images/buttons/links_over.gif',1)"><img src="../../images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="../members/index.php" tabindex="7" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnMembers','','../../images/buttons/members_over.gif',1)" onFocus="MM_swapImage('btnMembers','','../../images/buttons/members_over.gif',1)"><img src="../../images/buttons/members_off.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
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
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="100" name="shim" alt="" /></td>
		<td width="716" class="bgBlack"><img src="../../images/page_images/news/post.jpg" width="716" height="100" name="pageImage" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="100" name="shim" alt="" /></td>
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
		<td width="210" class="bgOrangeB"><img src="../../images/headers/news/news.gif" width="210" height="25" name="headPageLeft" alt="News" /></td>
		<td width="251" align="right" class="bgOrangeB"><span class="headLink"><a href="index.php" title="Back to News Archives">Back to News Archives</a></span></td>
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
			<p class="text">
				<? echo $art->getdatePosted("m/d/Y") ?><br />
				<strong><? echo $art->gettitle() ?></strong><br />
				<? echo $art->getbody() ?><br />
			</p>
			</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>Have you found a news worthy item that's not listed here and you want to let the rest of the community know about?</strong></p>
			<p class="text">You can submit the news item to us or you can post it yourself in our forums.</p>
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
</body>
</html>

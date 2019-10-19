<?php
include("../../../secured/config/phpConfig.php");
include("../../../secured/phpinclude/common_db.php");
include("../../../secured/phpinclude/classes/MetaData.php");

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
	<link rel="stylesheet" href="../../../stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:    url(../../../images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image:   url(../../../images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="../../../javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/javascript" src="../../../javascript/window_close.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('../../../images/buttons/close_window_over.gif')">
<table width="420" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../../images/shim.gif" width="420" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="420" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><img src="../../../images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></td>
		<td width="135"><img src="../../../images/logo/bg_mid_popup.jpg" width="135" height="73" name="bgMid" alt="" /></td>
		<td>
			<!-- Main Navigation -->
			<table width="108" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="106"><img src="../../../images/logo/bg_top_popup.jpg" width="106" height="49" name="bgTop" alt="" /></td>
					<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="106"><a href="../../../index.php" tabindex="1" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnClose','','../../../images/buttons/close_window_over.gif',1)" onfocus="MM_swapImage('btnClose','','../../../images/buttons/close_window_over.gif',1)" onclick="close_window()" onkeypress="close_window()"><img src="../../../images/buttons/close_window_off.gif" width="106" height="24" name="btnClose" alt="Close Window" border="0" /></a></td>
					<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<?
include("../../includes/popup_lines_head.inc")
?>
<!-- Body -->
<table width="420" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="386" class="bgOrangeB"><img src="../../../images/headers/popups/copyright.gif" width="210" height="25" name="headPage" alt="Member Profile" /></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="386" class="bgGrey"><img src="../../../images/shim.gif" width="386" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="386" valign="top" class="bgGrey">
			<!-- Member Profile -->
			<span class="headLink">Copyright and Trademark Notices</span><br />
<span class="text">All editorial content and graphics on this site are copyrights of BitPimps and the related logos are trademarks and registered trademarks of BitPimps. Other products and company names mentioned herein may be the trademarks or trade names of their respective owners.

As a user of the web site, you warrant that you will not upload on the web site any material that would infringe copyrights, trademarks, and other intellectual property and proprietary rights of any person, including, but not limited to, doctor/patient confidentiality, or that is libelous, defamatory, obscene, pornographic, illegal or otherwise objectionable or would give rise to liability or violate any law. The burden of determining the foregoing rests with you.

By uploading material on the web site, or sending material to BitPimps via email with the purpose of having BitPimps publish it on the web site, you grant BitPimps a royalty-free, perpetual, irrevocable, non-exclusive right to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, communicate to the public, perform and display the content (in whole or in part) worldwide and/or to incorporate it in other works in any form, media, or technology now known or later developed for the full term of any rights. BitPimps will preserve the best available record of authorship and display this record whenever the material is displayed or published. You also permit any other user of the web site the right to view and make one paper-based copy of the material solely for his or her personal, non-commercial use.
</span>
		</td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="386" class="bgGrey"><img src="../../../images/shim.gif" width="386" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../../includes/popup_copyright.inc")
?>
</body>
</html>

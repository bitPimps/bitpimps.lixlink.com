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

// Allow for manual image selection
if (isset($imgType))
{
  if ($imgType == "one")
    $hpImg = 1;
  elseif($imgType == "two")
    $hpImg = 2;
  elseif($imgType == "three")
    $hpImg = 3;
  elseif($imgType == "four")
    $hpImg = 4;
	elseif($imgType == "five")
		$hpImg = 5;
}

// Generate random image if needed 
if (!isset($hpImg))
{
  mt_srand ((double) microtime() * 1000000);
  $hpImg = mt_rand(1,4);
}

 if ($hpImg == 1)
 {
    $imgName = "action00";
	}
  elseif($hpImg == 2)
	{
    $imgName = "collage00";
	}
  elseif($hpImg == 3)
	{
    $imgName = "crystalized00";
	}
  elseif($hpImg == 4)
	{
    $imgName = "crystalized01";
	}
	elseif($hpImg == 5)
	{
		$imgName = "crystalized02";
	}

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
	<script language="JavaScript" type="text/javascript" src="../../../javascript/window_open.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('../../../images/buttons/articles_over.gif','../../../images/buttons/galleries_over.gif','../../../images/buttons/forums_over.gif','../../../images/buttons/links_over.gif','../../../images/buttons/home_over.gif')">
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><a href="../../../index.php" tabindex="1"><img src="../../../images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></a></td>
		<td width="121"><img src="../../../images/logo/bg_mid.jpg" width="121" height="73" name="bgMid" alt="" /></td>
		<td>
			<!-- Main Navigation -->
			<table width="418" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="6"><img src="../../../images/logo/bg_top.jpg" width="418" height="49" name="bgTop" alt="" /></td>
					<td class="bgBlack"><img src="../../../images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="../../../index.php" tabindex="2" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnHome','','../../../images/buttons/home_over.gif',1)" onfocus="MM_swapImage('btnHome','','../../../images/buttons/home_over.gif',1)"><img src="../../../images/buttons/home_off.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="../../articles/index.php" tabindex="3" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnArticles','','../../../images/buttons/articles_over.gif',1)" onfocus="MM_swapImage('btnArticles','','../../../images/buttons/articles_over.gif',1)"><img src="../../../images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../../galleries/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','../../../images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','../../../images/buttons/galleries_over.gif',1)"><img src="../../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../../phpforum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','../../../images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','../../../images/buttons/forums_over.gif',1)"><img src="../../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="../../links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','../../../images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','../../../images/buttons/links_over.gif',1)"><img src="../../../images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="../members/index.php" tabindex="7"><img src="../../../images/buttons/members_on.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
					<td class="bgBlack"><img src="../../../images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<?
include("../../includes/lines_head.inc")
?>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="100" name="shim" alt="" /></td>
		<td width="716" class="bgBlack"><img src="../../images/page_images/716x100/<? echo $imgName ?>.jpg" width="716" height="100" name="pageImage" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="100" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Body -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="210" class="bgOrangeB"><img src="../../../images/headers/members/registration.gif" width="210" height="25" name="headPageLeft" alt="Registration" /></td>
		<td width="251" align="right" class="bgOrangeB"><span class="headLink"><a href="privacy_policy.php" title="Our Privacy Policy">Our Privacy Policy</a></span></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="../../../images/headers/members/advantages.gif" width="193" height="25" name="headPageRight" alt="Advantages" /></td>
		<td width="15" class="bgGreenB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" valign="top" class="bgGrey">
			<form name="memberRegistration" method="post" action="">
				<p class="text">Please complete the form below to register for membership. You will recieve an email with account details. Required form elements are denoted by a [ * ].</p>
			<table width="461" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="125" class="bgBlack"><img src="../../../images/shim.gif" width="125" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="313" class="bgBlack"><img src="../../../images/shim.gif" width="313" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Username:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="username" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Password:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="password" name="password" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Confirm Password:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="password" name="passwordCheck" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* E-mail Address:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="email" size="30" class="textfield" /><br />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" class="bgGreenB"><img src="../../../images/shim.gif" width="125" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA"><span class="text"><strong>Publish E-mail Address in Member Profile?:</strong><br />
						<input type="checkbox" name="publishEmail" value="checkbox" />
						Yes 
						<input type="checkbox" name="publishEmail" value="checkbox" />
						No</span>
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">Web Address:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="website" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">Location:</span></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="location" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" class="bgGreenB"><img src="../../../images/shim.gif" width="125" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="reset" name="Clear" value="Clear" class="button" />
						<input type="submit" name="Continue" value="Continue &raquo;" class="button" />
					</td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="125" class="bgBlack"><img src="../../../images/shim.gif" width="125" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="313" class="bgBlack"><img src="../../../images/shim.gif" width="313" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			</form>
		</td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>Member Showcase:</strong><br />
				Members can post a &quot;Biography&quot; page with the ability to show 2 seperate images of their cars  and write several paragraphs about their cars, themselves, or both.</p>
			<p class="text">
				<strong>Member Input:</strong><br />
				Members are allowed to post in the forums as well as create new topics.</p>
			<p class="text">
				<strong>Contests &amp; Competitions:</strong><br />
				Only members are allowed to enter contests and competitions found on this site.</p>
		</td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../../includes/copyright.inc")
?>
</body>
</html>

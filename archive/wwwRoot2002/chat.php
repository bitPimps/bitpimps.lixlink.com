<?php
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
	elseif($imgType == "six")
		$hpImg = 6;
	elseif($imgType == "seven")
		$hpImg = 7;
	elseif($imgType == "eight")
		$hpImg = 8;
	elseif($imgType == "nine")
		$hpImg = 9;
	elseif($imgType == "ten")
		$hpImg = 10;
	elseif($imgType == "eleven")
		$hpImg = 11;
	elseif($imgType == "twelve")
		$hpImg = 12;
	elseif($imgType == "thirteen")
		$hpImg = 13;
	elseif($imgType == "fourteen")
		$hpImg = 14;
	elseif($imgType == "fifteen")
		$hpImg = 15;
	elseif($imgType == "sixteen")
		$hpImg = 16;
	elseif($imgType == "seventeen")
		$hpImg = 17;
	elseif($imgType == "eighteen")
		$hpImg = 18;
	elseif($imgType == "nineteen")
		$hpImg = 19;
	elseif($imgType == "twenty")
		$hpImg = 20;
}

// Generate random image if needed 
if (!isset($hpImg))
{
  mt_srand ((double) microtime() * 1000000);
  $hpImg = mt_rand(1,20);
}

 if ($hpImg == 1)
 {
    $imgName = "multishot00";
	}
  elseif($hpImg == 2)
	{
    $imgName = "multishot01";
	}
  elseif($hpImg == 3)
	{
    $imgName = "multishot02";
	}
  elseif($hpImg == 4)
	{
    $imgName = "action00";
	}
	elseif($hpImg == 5)
	{
		$imgName = "action01";
	}
	elseif($hpImg == 6)
	{
		$imgName = "action02";
	}
	elseif($hpImg == 7)
	{
		$imgName = "chicks00";
	}
	elseif($hpImg == 8)
	{
		$imgName = "homies00";
	}
	elseif($hpImg == 9)
	{
		$imgName = "pose00";
	}
	elseif($hpImg == 10)
	{
		$imgName = "boombox00";
	}
	elseif($hpImg == 11)
	{
		$imgName = "pimpbus00";
	}
	elseif($hpImg == 12)
	{
		$imgName = "bitpimps00";
	}
	elseif($hpImg == 13)
	{
		$imgName = "multishot04";
	}
	elseif($hpImg == 14)
	{
		$imgName = "multishot05";
	}
	elseif($hpImg == 15)
	{
		$imgName = "multishot06";
	}
	elseif($hpImg == 16)
	{
		$imgName = "multishot07";
	}
	elseif($hpImg == 17)
	{
		$imgName = "multishot08";
	}
	elseif($hpImg == 18)
	{
		$imgName = "multishot09";
	}
	elseif($hpImg == 19)
	{
		$imgName = "multishot10";
	}
	elseif($hpImg == 20)
	{
		$imgName = "multishot11";
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
					<td><a href="pages/galleries/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)"><img src="images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="pages/phpForum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)"><img src="images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="pages/links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)"><img src="images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="pages/members/index.php" tabindex="7" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnMembers','','images/buttons/members_over.gif',1)" onfocus="MM_swapImage('btnMembers','','images/buttons/members_over.gif',1)"><img src="images/buttons/members_off.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
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
				<strong>Optimize your images:</strong><br />
				Crop the picture so we only see the subject and not the keyboard and coke can in the background. Resize the image to appropriate dimensions.<br /><br />
				Read more below on the right.</p></td>
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
		<td width="251" class="bgOrangeB"><img src="images/shim.gif" width="251" height="25" name="shim" alt="" /></td>
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
<applet codebase="http://network1.parachatfree.com/pchat/network/classes"
 archive=pchat.zip code="ParaChat.class" width=461 height=400> 
<param name="cabbase" value="pchat.cab">
<param name="Channel" value="#bitPimps Chat"> 
<param name="ui.BgColor" value="000000">
<param name="ui.FgColor" value="FF9933">
<param name="roam.Roam" value="true">
<param name="ctrl.Hidden" value="false">
Sorry, your browser is not Java enabled, please visit
<a href="http://www.parachat.com/faq/java.html">our java support pages</a>
</applet>
		</td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>How can you optimize your images to keep file sizes down?</strong><br />
				The maximum file size allowed by this form is 80 Kb - that's plenty, you should be aiming for no more than 50 Kb if you have optimized correctly.</p>
			<p class="text">
				Follow these few simple steps to ensure you have optimized your image:</p>
			<p class="text">
				<strong>Crop the image:</strong><br />
				Crop the image so we only see the subject. We don't need to see the surrounding area.</p>
			<p class="text">
				<strong>Resize the image:</strong><br />
				Resize your image, nobody likes an image so big you have to scroll to see it. Besides, the maximum width and height the form allows for is 500 pixels width x 500 pixels height. Usually 200 - 400 pixels width and height is the best option to help decrease file sizes.</p>
			<p class="text">
				<strong>Save the image:</strong><br />
				Many applications allow you to export images optimized for the Internet, use one - it will save you a lot of file size.</p>
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

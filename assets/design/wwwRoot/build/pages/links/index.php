<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Links.php");
include("../../secured/phpinclude/classes/LinksSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Article Info
$linkSR = new LinksSR($dbConn, 0, 5000, "", "orderId");
$links = $linkSR->getLinkss();

// Close DB Connection
mysql_close($dbConn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>bitPimps.com - Doin' It To Your Momma's Chassis!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="bitPimps.com" />
	<meta name="keywords" content="bitPimps bit char g " />
	<meta name="description" content="bitPimps.com offers the best tutorials, modifications, information, etc. on all things related to Bit-Char-G and similar R/C hobbies." />
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

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif')">
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
					<td><a href="../forums/index.php" tabindex="5" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)" onFocus="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)"><img src="../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="index.php" tabindex="6"><img src="../../images/buttons/links_on.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="../members/index.php" tabindex="7" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnMembers','','../../images/buttons/members_over.gif',1)" onFocus="MM_swapImage('btnMembers','','../../images/buttons/members_over.gif',1)"><img src="../../images/buttons/members_off.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
					<td class="bgBlack"><img src="../../images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="../../images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="../../images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td colspan="3" class="bgBlack"><img src="../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" height="25" class="bgGreenB"><img src="../../images/headers/links/how_it_works.gif" width="193" height="25" name="headHowWorks" alt="How It Works" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="../../images/page_images/home/index.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<strong>Waddup Wit Dis?</strong><br />
				Most sites are junk, it's just too hard to keep track of, so we've decided to offer the &quot;Top 10 External Links&quot; to help ya' dig any informations you might have missed here.<br />
				- word to BigBird.</p>
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
		<td width="461" class="bgOrangeB"><img src="../../images/headers/links/top_ten.gif" width="280" height="25" name="headPageLeft" alt="Top 10 External Links" /></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="../../images/headers/links/submit_site.gif" width="193" height="25" name="headPageRight" alt="Submit A Site" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
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
		<td width="461" valign="top" class="bgGrey">
			<?for ($i = 0; $i<count($links); $i++)
				{
				?>
			<p class="text">
				<a href="<? echo $links[$i]->geturl() ?>" title="<? echo $links[$i]->getname() ?>" target="_blank"><? echo $links[$i]->getname() ?></a><br />
				<? echo $links[$i]->getdesc() ?></p>
			</p>
			<?}
				if(count($links)==0)
				{ ?>
			<p class="text">
				No links at this time... Check back soon.
			</p>
			<?}?>
		</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<form name="submitSite" method="post" action="">
				<p class="text"><br />
					Use this form to tell us of a site!<br />
					<strong>Site Name:</strong>
					<input type="text" name="sitename" size="20" class="textfield" /><br />
					<strong>Address:</strong><br />
					<input type="text" name="siteURL" size="20" class="textfield" /><br />
					<input type="submit" name="Submit" value="Submit!" class="button" /><br />
				</p>
			</form>
			</td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlack"><img src="../../images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="../../images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="../../images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="716" align="center" class="bgBlack"><span class="copyright">Copyright &copy; 2002 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</span></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
</body>
</html>

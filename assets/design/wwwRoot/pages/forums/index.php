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

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif')">
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
					<td><a href="index.php" tabindex="5"><img src="../../images/buttons/forums_on.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
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
		<td width="716" class="bgBlack"><img src="../../images/page_images/forums/index.jpg" width="716" height="100" name="pageImage" alt="" /></td>
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
		<td width="343" class="bgOrangeB"><img src="../../images/headers/forums/discussion_forums.gif" width="210" height="25" name="headPageLeft" alt="Discussion Forums" /></td>
		<td width="343" align="right" class="bgOrangeB"><span class="headLink"><a href="javascript:;" title="Logout">Logout</a> | <a href="javascript:;" title="Members List" onClick="MM_openBrWindow('../popups/members_list.php','membersList','scrollbars=yes,width=500,height=400')">Members List</a> | <a href="search.php" title="Search Forums">Search Forums</a></span></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="686" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td colspan="2" valign="top" class="bgGrey">
			<!-- Login & Note -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="336" valign="top">
						<p class="text"><strong>NOTE!</strong><br />
							You <em>gots</em> to login to be able to post messages to dis board.</p>
						<p class="text">If you is not a member, you can sign up by <a href="../members/registration.php">clicking here</a>, or just browse the message boards as a guest.</p>
						<p class="text">Members - if you have not already logged in, you <em>gots</em> to do so now to post messages in the forum.</p>
						<p class="text">- word to moms
						</p>
					</td>
					<td width="15"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
					<td width="335" valign="top">
						<form name="login" method="post" action="">
							<p class="text"><strong>Username:</strong> <a href="javascript:;" title="Been shooting too much heroin between your toes and watching &quot;Darma &amp; Greg&quot; and have now forgotten your username? Click hur, we'll crack you over the skull to remind you!" onClick="MM_openBrWindow('../popups/forgot_login.php','fogotLogin','scrollbars=yes,width=500,height=400')">Forgotten username?</a><br />
								<input type="text" name="username2" size="20" class="textfield" /><br />
								<strong>Password:</strong> <a href="javascript:;" title="Crack got you strung out and you've forgotten your password? Click hur to be pimped for your password!" onClick="MM_openBrWindow('../popups/forgot_login.php','fogotLogin','scrollbars=yes,width=500,height=400')">Forgotten password?</a><br />
								<input type="text" name="password2" size="20" class="textfield" /><br />
								<input type="submit" name="Submit2" value="Login!" class="button" /><br />
								<a href="../members/registration.php" title="Wanna be the newest sucka and aspire to have your own &quot;stable&quot;? Click hur to gets the initiation!">New membership registration</a>
							</p>
						</form>
					</td>
				</tr>
			</table>
			<!-- Forum Header -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="25" class="bgGreenB"><img src="../../images/shim.gif" width="25" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300" class="bgGreenB"><span class="headLink">FORUM</span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="58" align="center" class="bgGreenB"><span class="headLink">TOPICS</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="57" align="center" class="bgGreenB"><span class="headLink">POSTS</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="200" align="right" class="bgGreenB"><span class="headLink">LAST POST</span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Forum General -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25" class="bgGreenA"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300" class="bgGreenA"><span class="text"><strong>General</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" class="bgGreenA"><img src="../../images/shim.gif" width="58" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" class="bgGreenA"><img src="../../images/shim.gif" width="57" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" class="bgGreenA"><img src="../../images/shim.gif" width="200" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Discussions">Discussions</a><br />
						This forum is for all your general chat.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">7</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">58</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Forum Bit Char-G -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25" class="bgGreenA"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300" class="bgGreenA"><span class="text"><strong>Bit Char-G / Microsizers / Zip Zaps / etc.</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" class="bgGreenA"><img src="../../images/shim.gif" width="58" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" class="bgGreenA"><img src="../../images/shim.gif" width="57" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" class="bgGreenA"><img src="../../images/shim.gif" width="200" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Buy | Sell | Trade">Buy | Sell | Trade</a><br />
						Buy, sell or trade parts for your Bit Char-G right here.<br />
						Private sales only NO companies.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">10</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">29</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Discussions">Discussions</a><br />
						All general Bit Char-G discussions.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">53</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">684</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Technical">Technical</a><br />
						Technical tips, how-to's and help for all Bit Char-G related issues.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">78</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">1,205</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Member Galleries">Member Galleries</a><br />
						Car and track photos and videos from racers around the world.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">4</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">108</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Forum Contests & Polls / Surveys -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25" class="bgGreenA"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300" class="bgGreenA"><span class="text"><strong>Contests &amp; Polls / Surveys</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" class="bgGreenA"><img src="../../images/shim.gif" width="58" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" class="bgGreenA"><img src="../../images/shim.gif" width="57" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" class="bgGreenA"><img src="../../images/shim.gif" width="200" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="300"><span class="text"><a href="forum.php" title="Contest: Bit ' Hoopties'">Contest: Bit ' Hoopties'</a><br />
						Enter the contest, show us your 'hoopties' and you could win a new 3.8 motor to help get that 'hoopty' back in shape!</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="58" align="center"><span class="text">1</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="57" align="center"><span class="text">12</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="200" align="right"><span class="text">September 20, 2002 @ 06:08<br />
						By: <a href="javascript:;" onClick="MM_openBrWindow('../popups/member_profile.php','memberProfile','scrollbars=yes,width=500,height=400')">CaboWabo</a></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="58" class="bgBlack"><img src="../../images/shim.gif" width="58" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="57" class="bgBlack"><img src="../../images/shim.gif" width="57" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="200" class="bgBlack"><img src="../../images/shim.gif" width="200" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="686" height="25" name="shim" alt="" /></td>
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

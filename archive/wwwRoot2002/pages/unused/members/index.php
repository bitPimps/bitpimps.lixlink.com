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

include("../../includes/php_random_img.php");
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
	<link rel="stylesheet" href="../../../stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:    url(../../../images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image:   url(../../../images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="../../../javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/JavaScript" src="../../../javascript/view_img.js"></script>
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
					<td colspan="6"><img src="../../../images/logo/bg_top.jpg" width="418" height="49" name="bgTop" alt="" border="0" usemap="#pimpRadio" /></td>
					<td class="bgBlack"><img src="../../../images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="../../../index.php" tabindex="2" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnHome','','../../../images/buttons/home_over.gif',1)" onfocus="MM_swapImage('btnHome','','../../../images/buttons/home_over.gif',1)"><img src="../../../images/buttons/home_off.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="../../articles/index.php" tabindex="3" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnArticles','','../../../images/buttons/articles_over.gif',1)" onfocus="MM_swapImage('btnArticles','','../../../images/buttons/articles_over.gif',1)"><img src="../../../images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../../phpgallery/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','../../../images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','../../../images/buttons/galleries_over.gif',1)"><img src="../../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../../phpforum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','../../../images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','../../../images/buttons/forums_over.gif',1)"><img src="../../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="../../links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','../../../images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','../../../images/buttons/links_over.gif',1)"><img src="../../../images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="index.php" tabindex="7"><img src="../../../images/buttons/members_on.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
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
		<td width="2" rowspan="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" height="25" class="bgGreenB"><img src="../../../images/headers/members/about_us.gif" width="193" height="25" name="headA" alt="A Little About Us" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="../../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="../../../images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<strong>Whachu Talkin 'Bout Willis?</strong><br />
				Four brotha's gots together to produce bitPimps, the club, the website, and the attitude. While each member has their own uniqueness, we all share the common goal of entertainment and education, and we've grown!</p>
		</td>
		<td width="15" height="148" class="bgGreenA"><img src="../../../images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
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
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="461" class="bgOrangeB"><img src="../../../images/headers/members/crazy_large.gif" alt="We Be Crazy Large" name="headB" width="350" height="25" id="headB" /></td>
		<td width="15" class="bgOrangeB"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGreenB"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="193" class="bgGreenB"><img src="../../../images/headers/members/useless_stats.gif" alt="Useless Stats" name="headPageRight" width="193" height="25" id="headPageRight" /></td>
		<td width="15" class="bgGreenB"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="461" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="461" height="25" id="shim" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="193" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="193" height="25" id="shim" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="461" valign="top" class="bgGrey">
			<p class="text">
				<strong>Profiling the ballers...</strong><br />
				Still shot images taken from surveillance video footage during the daring mini-bank robbery pulled off by the bitPimps. Read more about it here in our news article.</p>
			<table width="461" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/cabowabo_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/cabowabo_s.jpg" alt="CaboWabo" name="shot_cabowabo_s" width="130" height="115" id="shot_cabowabo_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35.3 cm.<br />
							<strong>Weight:</strong> 3 oz.</p>
					</td>
					<td width="201" valign="top">
						<p class="text">
							<strong>CaboWabo</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#99;&#97;&#98;&#111;&#119;&#97;&#98;&#111;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">&#99;&#97;&#98;&#111;&#119;&#97;&#98;&#111;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">Last seen ballin' in the ghetto and gettin' some stank on his hang down. If seen please do not approach but contact your local crack dealers and put a contract out on his life. He's also attending night school for interior decorating and owns a gun that shoots through schools.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/cabowabo_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/cabowabo_f.jpg" alt="CaboWabo" name="shot_cabowabo_f" width="130" height="115" id="shot_cabowabo_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> candle-lit<br />
							&nbsp;&nbsp;&nbsp;dinners<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> burnt<br />
							&nbsp;&nbsp;&nbsp;plastic</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/payaso_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/payaso_s.jpg" alt="Payaso" name="shot_payaso_s" width="130" height="115" id="shot_payaso_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35 cm.<br />
							<strong>Weight:</strong> 3.1 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>Payaso</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#112;&#97;&#121;&#97;&#115;&#111;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">&#112;&#97;&#121;&#97;&#115;&#111;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">This pimp's name says most of it, but not all. While he tends to be the clown of the gang, he also likes to throw switches in his ride as he drives by clipping un-suspecting citizens at random. Police hate him for taking away morons to shoot, citizens fear his random acts of violence, we love him for helping speed-up the evolutionary process.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/payaso_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/payaso_f.jpg" alt="Payaso" name="shot_payaso_f" width="130" height="115" id="shot_payaso_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> chicks<br />
							&nbsp;&nbsp;&nbsp;w/ guns<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> chicks<br />
							&nbsp;&nbsp;&nbsp;w/ out guns</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/kwikbb_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/kwikbb_s.jpg" alt="kwikbb" name="shot_kwikbb_s" width="130" height="115" id="shot_kwikbb_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 34.1 cm.<br />
							<strong>Weight:</strong> 2.7 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>Kwikbb</strong><br />
							<a href="mailto:kwikbb@lixlink.com">kwikbb&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">Not much is known about this mysterious figure, he rolled up in the piece with bad attitude about a month ago. Known to be ball'n hard on the East Side now, this cat's look'n to move on up Jefferson's style. Anonymous tip's have led the local authiorities to 'kwikbb' for suspicion of involvement in the recent gang related hits, but no evidence was ever found to substantiate any rumors of his involvement. As of late he's been seen pimp'n the ladies and roll'n da Big-D's.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/kwikbb_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/kwikbb_f.jpg" alt="kwikbb" name="shot_kwikbb_f" width="130" height="115" id="shot_kwikbb_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> fur money<br />
							&nbsp;&nbsp;&nbsp;&amp; power<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> losing,<br />
							&nbsp;&nbsp;&nbsp;loose women &amp;<br />
							&nbsp;&nbsp;&nbsp;small bank rolls</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/shredder_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/shredder_s.jpg" alt="Shredder" name="shot_shredder_s" width="130" height="115" id="shot_shredder_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35.1 cm.<br />
							<strong>Weight:</strong> 2.9 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>Shredder</strong><br />
							<a href="mailto:shredder@lixlink.com">&#115;&#104;&#114;&#101;&#100;&#100;&#101;&#114;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">Recently named boss of the west side, this silent but deadly player will not hesitate to drop a pimp. He spends most of his time pimp'n hoes for this new strip club enterprise and smuggling high end RC parts for the Pimp City Black Market. Rumor has it his car decapitated 10 bitch ass street punks in a road rally last year.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/shredder_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/shredder_f.jpg" alt="Shredder" name="shot_shredder_f" width="130" height="115" id="shot_shredder_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> hookers<br />
							&nbsp;&nbsp;&nbsp;&amp; blow<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> pretty bits</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/dageneral_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/dageneral_s.jpg" alt="DaGeneral" name="shot_dageneral_s" width="130" height="115" id="shot_dageneral_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 34.8 cm.<br />
							<strong>Weight:</strong> 3.6 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>DaGeneral</strong><br />
							<a href="mailto:dageneral@lixlink.com">&#100;&#97;&#103;&#101;&#110;&#101;&#114;&#97;&#108;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">Known internationally, especially by the ladies, this pimp is smooth like butta' but will also blast a cap and spray noodles. He controls most of the prostitution rings in Pimp City and &quot;inspects&quot; each ho before made available to the public.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/dageneral_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/dageneral_f.jpg" alt="DaGeneral" name="shot_dageneral_f" width="130" height="115" id="shot_dageneral_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> porn<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> spam</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/madsamoan_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/madsamoan_s.jpg" alt="MadSamoan" name="shot_madsamoan_s" width="130" height="115" id="shot_madsamoan_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35 cm.<br />
							<strong>Weight:</strong> 4 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>MadSamoan</strong><br />
							<a href="mailto:madsamoan@lixlink.com">&#109;&#97;&#100;&#115;&#97;&#109;&#111;&#97;&#110;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">He's big.<br />
							He's pissed.<br />
							He's been working out.<br />
							He's been on trial for manslaughter charges.<br />
							'Nough said.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/madsamoan_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/madsamoan_f.jpg" alt="MadSamoan" name="shot_madsamoan_f" width="130" height="115" id="shot_madsamoan_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> engaging<br />
							&nbsp;&nbsp;&nbsp;conversation<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> cold &amp;<br />
							&nbsp;&nbsp;&nbsp;lonely nights</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/noxorc_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/noxorc_s.jpg" alt="noxorc" name="shot_noxorc_s" width="130" height="115" id="shot_noxorc_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35 cm.<br />
							<strong>Weight:</strong> 2.9 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>noxorc</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#110;&#111;&#120;&#111;&#114;&#99;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">&#110;&#111;&#120;&#111;&#114;&#99;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">One of the newer homies to join the street gang. Pinched from the Paddy Wagon just before the Law was going to sentence him. Nox runs the local pawn, laundering and controlling substances for import/export out of da city. He's paid a heavy price in the past for his execution style hits on rival gangs. Nox carries 15 weapons, all concealed.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/noxorc_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/noxorc_f.jpg" alt="noxorc" name="shot_noxorc_f" width="130" height="115" id="shot_noxorc_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> big nipples<br />
							&nbsp;&nbsp;&nbsp;&amp; and tight ass<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> nuns<br />
							&nbsp;&nbsp;&nbsp;with hats</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/hogjowlz_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/hogjowlz_s.jpg" alt="hogjowlz" name="shot_hogjowlz_s" width="130" height="115" id="shot_hogjowlz_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 30 cm.<br />
							<strong>Weight:</strong> 2.3 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>hogjowlz</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#104;&#111;&#103;&#106;&#111;&#119;&#108;&#122;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">&#104;&#111;&#103;&#106;&#111;&#119;&#108;&#122;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">This pimp is wildly revered as an innovator by pimps all over the world for installing tracking devices in every ho in Pimp City. Always conniving up new ways to take the territory of rival gangs as well as increasing "prifitability margins" for his own crew. It is rumored that Hogjowlz has been working on a "top secret" cadillac/tank with enough built in fire power to claim the rest of the hold out neighborhoods in pimp city.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/hogjowlz_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/hogjowlz_f.jpg" alt="hogjowlz" name="shot_hogjowlz_f" width="130" height="115" id="shot_hogjowlz_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> loud<br />
							&nbsp;&nbsp;&nbsp;radios &amp; quiet hos<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> quiet<br />
							&nbsp;&nbsp;&nbsp;radios &amp; loud hos</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/darktari_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/darktari_s.jpg" alt="darktari" name="shot_darktari_s" width="130" height="115" id="shot_darktari_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 34 cm.<br />
							<strong>Weight:</strong> 3.0 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>DarkTari</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#100;&#97;&#114;&#107;&#116;&#97;&#114;&#105;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">&#100;&#97;&#114;&#107;&#116;&#97;&#114;&#105;&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">AKA &#8220;The Smuth1&quot; This is one Mean Ass Pimp! He&#8217;s known as the Enforcer of the Pimp Gang. <br />
							Don&#8217;t let the muscle fool you, he&#8217;s a crafty mastermind of devious goin ons in the hood, school&#8217;d in 101 ways to take an enemy down. Don&#8217;t take shit from nobody. <br />
							The babes can&#8217;t keep their bodies to themselves around him and they love the Fly Azz Custom painted Bits he sports. He always has his Homies back. So if you ever try to get the lowdown on one of the Inner Circle gang members, don&#8217;t bother to turn around, DarkTari&#8217;s there, and it&#8217;s lights out!</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/darktari_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/darktari_f.jpg" alt="darktari" name="shot_darktari_f" width="130" height="115" id="shot_darktari_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> Fine<br />
							&nbsp;&nbsp;&nbsp;babes with Big Azz's<br />
							&nbsp;&nbsp;&nbsp;&amp; Fast, Fly Azz Bits <br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> Fine<br />
							&nbsp;&nbsp;&nbsp;babes with Noazzatol</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/crazydave_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/crazydave_f.jpg" alt="crazydave" name="shot_crazydave_f" width="130" height="115" id="shot_crazydave_f" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 35 cm.<br />
							<strong>Weight:</strong> 2.9 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>crazydave</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;crazydave&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">crazydave&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">BIO HERE</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/crazydave_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/crazydave_f.jpg" alt="crazydave" name="shot_crazydave_f" width="130" height="115" id="shot_crazydave_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> Fine<br />
							&nbsp;&nbsp;&nbsp;babes with Big Azz's<br />
							&nbsp;&nbsp;&nbsp;&amp; Fast, Fly Azz Bits <br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> Fine<br />
							&nbsp;&nbsp;&nbsp;babes with Noazzatol</p>
					</td>
				</tr>
				<tr>
					<td width="130">&nbsp;</td>
					<td width="201">&nbsp;</td>
					<td width="130">&nbsp;</td>
				</tr>
				<tr>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/sessiz_s.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/sessiz_s.jpg" alt="sessiz" name="shot_sessiz_s" width="130" height="115" id="shot_sessiz_s" border="0" /></a></p>
						<p class="text">
							<strong>Height:</strong> 30 cm.<br />
							<strong>Weight:</strong> 3.3 oz.</p>
					</td>
					<td width="331" valign="top">
						<p class="text"><strong>sessiz</strong><br />
							<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;sessiz&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;">sessiz&#64;&#108;&#105;&#120;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;</a></p>
						<p class="text">Leaving his Turkish pimp palace behind, sessiz came to America with Eddie Murphy and Arsenio Hall with the hope of finding a bride / queen for... wait, wrong story.<br />
Leaving	his	Turkish	mental	institution	bed	behind, sessiz came to Pimp City and quickly gained a reputation and respect as the most insane Turk on the block. This pimp is also know as the graphical art guru who will make your silly ass look good in a wallpaper.</p>
					</td>
					<td width="130" valign="top">
						<p class="text"><a href="javascript:;" onclick="JustSoPicWindow('../../images/member_images/surveillance/450x430/sessiz_f.jpg','450','430','BitPimps Robbery Video Surveillance Viewer','#E4E4E4','hug image','0');return document.MM_returnValue"><img src="../../../images/member_images/surveillance/120x115/sessiz_f.jpg" alt="sessiz" name="shot_sessiz_f" width="130" height="115" id="shot_sessiz_f" border="0" /></a></p>
						<p class="text">
							&nbsp;&nbsp;&nbsp;<strong>Turn-ons:</strong> Dirty<br />
							&nbsp;&nbsp;&nbsp;candy wrappers<br />
							&nbsp;&nbsp;&nbsp;&amp; raping mothers<br />
							&nbsp;&nbsp;&nbsp;<strong>Turn-offs:</strong> Youngins<br />
							&nbsp;&nbsp;&nbsp;who don't &quot;put out&quot;</p>
					</td>
				</tr>
			</table>
		</td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<?
				include ("../../includes/wallpapers.inc")
			?>
			<p class="text">
				<strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
				Check our <a href="../../articles/index.php">Articles</a> section for custom modifications, how-to's and tutorials, most of which can be applied to bits, microsizers, zipzaps, clones, and just about any micro rc hobby!</p>
			<p class="text">
				<strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
				Check out our <a href="../../phpgallery/index.php">Galleries</a> section for the most innovative, creative, and just plain hilarious images and videos that start the next 'new waves' in the micro rc world!</p>
			<p class="text">
				<strong>Still need help or wanna discuss more on the hobby?</strong><br />
				Join our <a href="../../phpforum/index.php">Forums</a> for any and all possible answers to all your questions or find out the hot information before anyone else!</p>
			<p class="text">
				<strong>What are we all about?</strong><br />
				Simple. FUN. That's it. We're about having fun, if we happen to inform, educate, or otherwise inspire along the way, all the better. Our goals aren't to take over the market nor to be the community leaders, except of course in the area of entertainment! Just like a chef prepares their favorite dishes, the bitPimps take their time to conceptualize and develop highly creative pieces that keep audiences on their toes and under their desks!</p>
		</td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="461" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="461" height="25" id="shim" /></td>
		<td width="15" class="bgGrey"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="193" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="193" height="25" id="shim" /></td>
		<td width="15" class="bgGreenA"><img src="../../../images/shim.gif" alt="" name="shim" width="15" height="25" id="shim" /></td>
		<td width="2" class="bgBlack"><img src="../../../images/shim.gif" alt="" name="shim" width="2" height="25" id="shim" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../../includes/copyright.inc")
?>
<map name="pimpRadio" id="pimpRadio">
  <area shape="rect" coords="208,2,417,48" href="javascript:;" alt="bitPimps Radio - click to listen!" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')" />
</map>
</body>
</html>

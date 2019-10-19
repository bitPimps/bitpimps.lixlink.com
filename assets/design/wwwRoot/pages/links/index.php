<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/Links.php");
include("../../secured/phpinclude/classes/LinksSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get Link Info
$linkSR = new LinksSR($dbConn, 0, 5000, "", "orderId");
$links = $linkSR->getLinkss();

// Close DB Connection
mysql_close($dbConn);

// Find Focus
if ($focalPoint == "siteNameField")
{
	$onLoader = "document.submitSite.siteName.focus(); MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif'); ";
}
elseIf ($focalPoint == "siteURLField")
{
	$onLoader = "document.submitSite.siteURL.focus(); document.submitSite.siteURL.blur(); document.submitSite.siteURL.select(); MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif'); ";
}
elseIf ($focalPoint == "yourNameField")
{
	$onLoader = "document.submitSite.yourName.focus(); MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif'); ";
}

$email_contact = <<<EOF
bitpimpsfeedback@lixlink.com
EOF;

if (!isset($formSubmitted))
{
$submitForm = <<<EOF
			<form name="submitSite" method="post" action="index.php">
			<input type="hidden" name="formSubmitted" value="true" />
				<p class="text"><br />
					Use this form to tell us of a site!<br />
					<strong>Site Name:</strong>
					<input type="text" name="siteName" size="20" class="textfield" value="$siteName" /><br />
					<strong>Address:</strong> (must contain &quot;http://&quot;)<br />
					<input type="text" name="siteURL" size="20" class="textfield" value="$siteURL" /><br />
					<strong>Your Name:</strong>
					<input type="text" name="yourName" size="20" class="textfield" value="$yourName" /><br />
					<input type="submit" name="Submit" value="Submit!" class="button" /><br />
				</p>
			</form>
EOF;
}
else
{
//trim and validate URLs comparing string to regular expression 
$yourURL = trim($siteURL);

if (!eregi( "^[http://www]+\."
. "[A-Z a-z_0-9 -]+\."
. "(com|net|org|gov|biz|edu)$" , $siteURL))
{
	$result_msg="<strong>Error encountered!</strong><br />The <em>Address</em> is invalid.<br />Please click <a href='index.php?siteName=" . $siteName . "&siteURL=" . $siteURL . "&yourName=" . $yourName . "&focalPoint=siteURLField' title='go back'>back</a> and correct the required fields.";
}
else if($siteName == "" || !isSet($siteName))
{
	$result_msg="<strong>Error encountered!</strong><br />The <em>Site Name</em> is required.<br />Please click <a href='index.php?siteName=" . $siteName . "&siteURL=" . $siteURL . "&yourName=" . $yourName . "&focalPoint=siteNameField' title='go back'>back</a> and fill out the required fields.";
}
else if($yourName == "" || !isSet($yourName))
{
	$result_msg="<strong>Error encountered!</strong><br />The <em>Your Name</em> field is required.<br />Please click <a href='index.php?siteName=" . $siteName . "&siteURL=" . $siteURL . "&yourName=" . $yourName . "&focalPoint=yourNameField' title='go back'>back</a> and fill out the required fields.";
}
else
{

$email_subject   = "Link submission from bitPimps website";
$email_header    = "From:" .  $yourName . "\r\n";
$email_msg =

"Site Name: " . $siteName . "\n".
"Site URL: " . $siteURL . "\n" .
"Submitter's Name: " . $yourName ."\n" ;

if( mail($email_contact,
         $email_subject,
         $email_msg,
         $email_header))
  {
		$result_msg="Thank you " . $yourName . " for your comments, we will be reviewing your email shortly.<br /><br />
				Continue browsing the site by clicking <a href='../../index.php' title='go back'>back</a> to the home page.";
  }
  else
  {
		$result_msg="<strong>Error encountered!</strong><br /><em>The email message was not sent!</em><br />An internal error occured...please email your request to:" .
                " <a href='mailto:" . $email_contact . "' title='" . $email_contact . "'>" . $email_contact . "</a>";
  }
}
$submitForm = <<<EOF
			<p class="text"><br />
					$result_msg</p>
EOF;
}  //End If
EOF;

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

<body class="bgPage" onLoad="<? echo $onLoader ?>">
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
					<td><a href="index.php" tabindex="6"><img src="../../images/buttons/links_on.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
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
				<a href="<? echo $links[$i]->geturl() ?>" title="<? echo $links[$i]->getname() ?>" target="_blank"><strong><? echo $links[$i]->getname() ?></strong></a><br />
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
			<? echo $submitForm ?>
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
<?
include("../includes/copyright.inc")
?>
</body>
</html>

<?php
extract(array_merge($_POST,$_GET));

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

include("../includes/php_random_img.php");
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

if (!isset($formSubmitted))
{
$submitForm = <<<EOF
			<form name="submitSite" method="post" action="index.php">
			<input type="hidden" name="formSubmitted" value="true" />
				<p class="text"><strong>What do you think we haven't seen yet?</strong><br />
					Use this form to tell us of a site!<br />
					Just submit it once, we will review the site. If we think it should be in the list, we will add it.<br />
					<strong>Site Name:</strong><br />
					<input type="text" name="siteName" size="20" class="textfield" value="$siteName" /><br />
					<strong>Site URL:</strong> (must contain &quot;http://&quot;)<br />
					<input type="text" name="siteURL" size="20" class="textfield" value="http://$siteURL" /><br />
					<strong>Your Name:</strong><br />
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

if ($siteURL == "" || !isSet($siteURL))
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

$email_subject   = "Link submitted from bitPimps website";
$email_header    = "From:server@bitpimps.lixlink.com\r\n";
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
<meta name="author" content="bitPimps.lixlink.com" />
<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
<meta name="description" content="<? echo $metaData->getDescription() ?>" />
<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../../stylesheets/bp_public.css" rel="stylesheet" type="text/css">
<style type="text/css">
	<!--
	.bgHomeSub	{
	background-image:  url(../../images/backgrounds/home_sub.jpg);
	background-repeat: repeat-y;
	background-color: #A4ADA8;
	background-position: center;
	}
	.bgLogoUnder	{
	background-image: url(../../images/backgrounds/logo_under.gif);
	background-repeat: repeat-x;
	}
	-->
</style>
<script language="JavaScript" type="text/JavaScript" src="../../javascript/layers_reload.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/image_preload_swap.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body onLoad="MM_preloadImages('../../images/buttons/articles_over.jpg','../../images/buttons/galleries_over.jpg','../../images/buttons/forums_over.jpg','../../images/buttons/pimpgear_over.jpg','../../images/buttons/radio_over.jpg','../../images/buttons/home_over.jpg')">
<div id="LogoNav" style="position:absolute; width:95%; height:74px; z-index:1; left: 25px; top: 0px; visibility: visible; overflow: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgOrangeB"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="6" id="shim" /></td>
		</tr>
		<tr>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
			<td width="176"><a href="../../index.php"><img src="../../images/logo/bitpimps.gif" / alt="bitPimps Custom Modifications" name="logo" width="176" height="60" border="0" id="logo" /></a></td>
			<td align="right" class="bgLogoUnder"><img src="../../images/logo/bg_left.jpg" / alt="" name="logoBGleft" width="154" height="60" id="logoBGleft" /></td>
			<td width="418">
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="271"><img src="../../images/logo/bg_top.jpg" / alt="" name="logoBGtop" width="271" height="20" id="logoBGtop" /></td>
						<td width="147"><a href="javascript:;" onMouseOver="MM_swapImage('navRadio','','../../images/buttons/radio_over.jpg',1)" onMouseOut="MM_swapImgRestore()" onClick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')"><img src="../../images/buttons/radio_off.jpg" / alt="bitPimps Radio (bPRX)" name="navRadio" width="147" height="20" border="0" id="navRadio" /></a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="../../images/logo/bg_bottom.jpg" / alt="" name="logoBGbottom" width="418" height="16" id="logoBGbottom" /></td>
					</tr>
				</table>
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="60"><a href="../../index.php" onMouseOver="MM_swapImage('navHome','','../../images/buttons/home_over.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="../../images/buttons/home_off.jpg" / alt="Home" name="navHome" width="60" height="24" border="0" id="navHome" /></a></td>
						<td width="71"><a href="../articles/index.php" onMouseOver="MM_swapImage('navArticles','','../../images/buttons/articles_over.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="../../images/buttons/articles_off.jpg" / alt="Articles" name="navArticles" width="71" height="24" border="0" id="navArticles" /></a></td>
						<td width="77"><a href="../phpGallery/index.php" onMouseOver="MM_swapImage('navGalleries','','../../images/buttons/galleries_over.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="../../images/buttons/galleries_off.jpg" / alt="Galleries" name="navGalleries" width="77" height="24" border="0" id="navGalleries" /></a></td>
						<td width="71"><a href="../phpForum/index.php" onMouseOver="MM_swapImage('navForums','','../../images/buttons/forums_over.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="../../images/buttons/forums_off.jpg" / alt="Forums" name="navForums" width="71" height="24" border="0" id="navForums" /></a></td>
						<td width="60"><a href="index.php"><img src="../../images/buttons/links_over.jpg" / alt="Links" name="navLinks" width="60" height="24" border="0" id="navLinks" /></a></td>
						<td width="79"><a href="http://www.cafeshops.com/bitpimps" target="_blank" onMouseOver="MM_swapImage('navPimpGear','','../../images/buttons/pimpgear_over.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="../../images/buttons/pimpgear_off.jpg" / alt="PimpGear" name="navPimpGear" width="79" height="24" border="0" id="navPimpGear" /></a></td>
					</tr>
				</table>
			</td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
		</tr>
	</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="ROTW" style="position:absolute; width:95%; height:175px; z-index:1; top: 74px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td class="bgGreenA" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="bgGreenB" style="padding-left: 10px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px;"><img src="../../images/headers/links/how_it_works.gif" / alt="How It Works" name="headAbout" width="193" height="25" id="headAbout" /></td>
					</tr>
					<tr>
						<td style="padding: 10px;">
							<p class="text"><strong>Waddup Wit Dis?</strong><br />
								Most sites are junk, it's just too hard to keep track of, so we've decided to offer the "Top 10 External Links" to help ya' dig any informations you might have missed here.</p>	
						</td>
					</tr>
				</table>
			</td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td width="491"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="173" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="173" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="Body" style="position:absolute; width:95%; height:200px; z-index:1; top: 249px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td class="bgOrangeB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../../images/headers/links/top_ten.gif" / alt="Top 10 External Links" name="headLinks" width="280" height="25" id="headLinks" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="220" class="bgGreenB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../../images/headers/links/submit_site.gif" / alt="Submit A Site" name="headSubmit" width="193" height="25" id="headSubmit" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
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
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="220" valign="top" class="bgHomeSub" style="padding: 15px;">
			<? //echo $submitForm ?>
			<p class="text">
				<strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
				Check our <a href="../articles/index.php">Articles</a> section for custom modifications, how-to's and tutorials, most of which can be applied to bits, microsizers, zipzaps, clones, and just about any micro rc hobby!</p>
			<p class="text">
				<strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
				Check out our <a href="../phpGallery/index.php">Galleries</a> section for the most innovative, creative, and just plain hilarious images and videos that start the next 'new waves' in the micro rc world!</p>
			<p class="text"><strong>Get your PimpGear:</strong><br />
				Dress in comfort and style, get a toolbox for you micro r/c accessories and more at <a href="http://www.cafeshops.com/bitpimps" target="_blank">our online shop</a>!</p>
			</td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td align="center" style="padding-left: 0px; padding-bottom: 5px; padding-right: 0px; padding-top: 5px;"><p class="copyright"><? echo $metaData->getCopyright() ?></p></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td colspan="3" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="750" height="2" id="shim" /></td>
		</tr>
	</table>
	<p>&nbsp;</p>
</div>
</body>
</html>

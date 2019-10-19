<?php
extract(array_merge($_POST,$_GET));

include("secured/config/phpConfig.php");
include("secured/phpinclude/common_db.php");
include("secured/phpinclude/classes/MetaData.php");
include("secured/phpinclude/classes/Links.php");
include("secured/phpinclude/classes/LinksSR.php");

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

include("random_img.php");

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><? echo $metaData->getTitle() ?></title>
<meta name="author" content="bitPimps.lixlink.com" />
<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
<meta name="description" content="<? echo $metaData->getDescription() ?>" />
<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="styles.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="barHeader"><img src="images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="index.php"><img src="images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="index.php" title="Home">Home</a></li>
			<li><a href="pages/articles/index.php" title="Articles">Articles</a></li>
			<li><a href="pages/phpGallery/index.php" title="Galleries">Galleries</a></li>
			<li><a href="pages/phpForum/index.php" title="Forums">Forums</a></li>
			<li><a href="links.php" title="Links" style="background-color:#929292">Links</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="viewContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="viewHeader"><img src="images/head_links.gif" alt="How It Works" name="imgHead" width="159" height="25" id="imgHead" /></td>
			<td rowspan="2" class="imgMain"><img src="images/page_images/491x173/<? echo $imgName ?>.jpg" alt="" name="imgBody" width="491" height="173" id="imgBody" /></td>
		</tr>
		<tr>
		  <td valign="top" class="viewCopy">
				<strong>Waddup Wit Dis?</strong><br />
				Most sites are junk, it's just too hard to keep track of, so we've decided to offer the 
				&quot;Top 10 External Links&quot; to help ya' dig any informations you might have missed here.
			</td>
	  </tr>
	</table>
</div>
<div id="bodyContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="headSpecial"><h1>Top 10 External Links</h1></td>
			<td class="headRight"><h1>Need More?</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial" valign="top">
				<? for ($i = 0; $i<count($links); $i++)
					{
				?>
				<p><a href="<? echo $links[$i]->geturl() ?>" title="<? echo $links[$i]->getname() ?>" target="_blank"><strong><? echo $links[$i]->getname() ?></strong></a><br />
					<? echo $links[$i]->getdesc() ?></p>
				<? }
					if(count($links)==0)
					{ ?>
				<p>No links at this time... Check back soon.</p>
				<? } ?>
			</td>
			<td class="bodyRight" valign="top">
				<p><strong>Want to talk with other members who share your interests in the R/C hobby?</strong><br />
					Our <a href="pages/phpForum/index.php" title="Forums">Forums</a> are full of discussion with 
					less clutter and an adult attitude.</p>
				<p><strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
					Check our <a href="pages/articles/index.php" title="Articles">Articles</a> section for custom 
					modifications, how-to's and tutorials, most of which can be applied to bits, microsizers, 
					zipzaps, clones, and just about any micro rc hobby!</p>
				<p><strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
					Check out our <a href="../phpGallery/index.php" title="Galleries">Galleries</a> section for the 
					most innovative, creative, and just plain hilarious images and videos that start the next 
					&quot;new waves&quot; in the micro rc world!</p>
			</td>
		</tr>
	</table>
</div>
<div id="barContainer">
	<div id="barBottom"><img src="images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="copyright"><? echo $metaData->getCopyright() ?></div>
<p>&nbsp;</p>
</body>
</html>

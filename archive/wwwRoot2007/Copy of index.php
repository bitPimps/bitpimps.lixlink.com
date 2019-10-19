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
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="SHORTCUT ICON" href="/favicon.ico" type="image/x-icon" />
<link href="styles.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="barHeader"><img src="images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="index.php"><img src="images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="index.php" title="Home" style="background-color:#929292">Home</a></li>
			<li><a href="javascript:alert('Temporarily offline - check back soon.')" title="Articles">Articles</a></li>
			<li><a href="pages/phpGallery/index.php" title="Galleries">Galleries</a></li>
			<li><a href="pages/phpForum/index.php" title="Forums">Forums</a></li>
			<li><a href="links.php" title="Links">Links</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="viewContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="viewHeader"><img src="images/head_home.gif" alt="Ride of the Month" name="imgHead" width="223" height="25" id="imgHead" /></td>
			<td rowspan="2" class="imgMain"><img src="images/page_images/491x173/rotm_home/2007_02.jpg" alt="" name="imgBody" width="491" height="173" id="imgBody" /></td>
		</tr>
		<tr>
		  <td valign="top" class="viewCopy">
				Each month, we let the users choose who will be honored with winning the bitPimps Ride of the Month. 
				<a href="pages/phpGallery/thumbnails.php?album=27">View past winners</a> or 
				<a href="pages/phpForum/viewtopic.php?t=3551">go put your vote in</a> for next month's winner.<br /><br />
				This months winner: <strong>HirotoR34</strong><br /><br />
				- Word to BigBird
			</td>
	  </tr>
	</table>
</div>
<div id="bodyContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="headSpecial" align="center"><h1>Get Hip On The Real Tip</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" style="padding-right:30px;">
							<p align="center"><a href="pages/phpForum/index.php"><img src="images/head_community.jpg" / alt="bitPimps Community" name="bPCom" width="200" height="275" border="0" id="bPCom" /></a></p>
							<p><strong>Want to talk with other members who share your interests in the R/C hobby?</strong><br />
								Our <a href="pages/phpForum/index.php">Forums</a> are full of discussion with less clutter and an 
								adult attitude.</p>
							<p>bitPimps gives back to the <a href="pages/phpForum/index.php">community</a> by running 
								<a href="pages/phpForum/viewforum.php?f=27">contests</a> regularly that give the members their 
								chances to win some <a href="pages/phpGallery/thumbnails.php?album=86">killer prizes</a> from tools 
								to complete cars customized by the bitPimps themselves.</p>
							<p>In addition to having discussion areas for your: Bit Char-G, Super Bit Char-G, ZipZap, ZipZap SE, 
								ZipZap MT, SuperSlick, Clones, Xmod, Mini-Z, I-Waver, T Maxx, Revo, etc. We also have off-topic 
								discussion areas for other common interests outside of the rc hobby.</p>
							<p>Many of our members are very helpful and are great resources of information, help, and hook-ups.</p>
						</td>
						<td valign="top" style="padding-right:30px;">
							<p align="center"><a href="pages/articles/index.php"><img src="images/head_tutorials.jpg" / alt="bitPimps Tutorials" name="bPTut" width="200" height="275" border="0" id="bPTut" /></a></p>
							<p><strong>Need help fixing or making custom modifications to your Micro R/C?</strong><br />
								Our <a href="pages/articles/index.php">Articles</a> are informative  with clear instructions and 
								crisp pictures.</p>
							<p>Visit for custom modifications, how-to's and tutorials, most of which can be applied to bits, 
								microsizers, zipzaps, superslicks, clones, and just about any micro rc vehicle!</p>
							<p>Looking to <a href="pages/articles/index.php?catId=7">boost performance</a> with the infamous 
								MOSFET Mod or Dual Cell Mod? Want to <a href="pages/articles/index.php?catId=6">make your ride 
								look good</a> with some fresh paint? What about making it 
								<a href="pages/articles/index.php?catId=4">roll right</a> with some new wheels? 
								<a href="pages/articles/index.php">You can find it all here.</a></p>
							<p>Want to see what can be done to your ZipZap SE or ZipZap MT? What about an original Bit Char-G 
								or Micosizer, or even a SuperSlick or some other clone? <a href="pages/articles/index.php">This 
								is the place.</a></p>
						</td>
						<td valign="top">
							<p align="center"><a href="pages/phpGallery/"><img src="images/head_galleries.jpg" / alt="bitPimps Galleries" name="bPGal" width="200" height="275" border="0" id="bPGal" /></a></p>
							<p><strong>Looking for some great entertainment, wanna see some serious custom modifications?</strong><br />
								Our <a href="pages/phpGallery/index.php">Galleries</a> section is known as the largest micro rc gallery 
								around.</p>
							<p>It<a href="pages/phpgallery/index.php"></a> contains some of the most innovative, creative, and just 
								plain hilarious images and videos that start the next &quot;new waves&quot; in the micro rc world and 
								beyond!</p>
							<p>We don't only have Bit Char-G and ZipZap in our galleries, you will see Xmod, Mini-Z, T Maxx, Revo, 
								and just about everything else. See for yourself and check out some of the 
								<a href="pages/phpGallery/index.php?cat=1">bitPimps Crew Galleries</a> and see what else we're all in 
								to.</p>
							<p>* We are not a company, we don't sell anything, we don't charge for anything, we don't profit from 
								anything, hell - we don't even have any ads!</p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div id="barContainer">
	<div id="barBottom"><img src="images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="copyright">Copyright &#0169; 2002 - <?php echo date('Y') ?> | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</div>
<p>&nbsp;</p>
</body>
</html>

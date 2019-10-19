<?php
extract(array_merge($_POST,$_GET));

include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/News.php");
include("../../secured/phpinclude/classes/NewsSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get News Info
$artSR = new NewsSR($dbConn, 0, 5000, $query, "datePosted", "1");
$arts = $artSR->getNewss();

// Close DB Connection
mysql_close($dbConn);

include("../includes/php_random_img.php");

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

<body onload="MM_preloadImages('../../images/buttons/articles_over.jpg','../../images/buttons/galleries_over.jpg','../../images/buttons/forums_over.jpg','../../images/buttons/links_over.jpg','../../images/buttons/pimpgear_over.jpg','../../images/buttons/radio_over.jpg')">
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
						<td width="147"><a href="javascript:;" onmouseover="MM_swapImage('navRadio','','../../images/buttons/radio_over.jpg',1)" onmouseout="MM_swapImgRestore()" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')"><img src="../../images/buttons/radio_off.jpg" / alt="bitPimps Radio (bPRX)" name="navRadio" width="147" height="20" border="0" id="navRadio" /></a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="../../images/logo/bg_bottom.jpg" / alt="" name="logoBGbottom" width="418" height="16" id="logoBGbottom" /></td>
					</tr>
				</table>
				<table width="418" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="60"><a href="../../index.php"><img src="../../images/buttons/home_over.jpg" / alt="Home" name="navHome" width="60" height="24" border="0" id="navHome" /></a></td>
						<td width="71"><a href="../articles/index.php" onmouseover="MM_swapImage('navArticles','','../../images/buttons/articles_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/articles_off.jpg" / alt="Articles" name="navArticles" width="71" height="24" border="0" id="navArticles" /></a></td>
						<td width="77"><a href="../phpGallery/index.php" onmouseover="MM_swapImage('navGalleries','','../../images/buttons/galleries_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/galleries_off.jpg" / alt="Galleries" name="navGalleries" width="77" height="24" border="0" id="navGalleries" /></a></td>
						<td width="71"><a href="../phpForum/index.php" onmouseover="MM_swapImage('navForums','','../../images/buttons/forums_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/forums_off.jpg" / alt="Forums" name="navForums" width="71" height="24" border="0" id="navForums" /></a></td>
						<td width="60"><a href="../links/index.php" onmouseover="MM_swapImage('navLinks','','../../images/buttons/links_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/links_off.jpg" / alt="Links" name="navLinks" width="60" height="24" border="0" id="navLinks" /></a></td>
						<td width="79"><a href="http://www.cafeshops.com/bitpimps" target="_blank" onmouseover="MM_swapImage('navPimpGear','','../../images/buttons/pimpgear_over.jpg',1)" onmouseout="MM_swapImgRestore()"><img src="../../images/buttons/pimpgear_off.jpg" / alt="PimpGear" name="navPimpGear" width="79" height="24" border="0" id="navPimpGear" /></a></td>
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
						<td class="bgGreenB" style="padding-left: 10px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px;"><img src="../../images/headers/news/galleries_selections.gif" / alt="Galleries" name="headGalleries" width="193" height="25" id="headGalleries" /></td>
					</tr>
					<tr>
						<td style="padding: 10px;">
							<p class="text"><strong>We be crazy large!</strong><br />
								We've got the biggest photo collection of the baddest micro's put out by pimps from all over the world, <a href="../phpGallery/" title="Check out these images foo!">check them out here</a>.</p>
							<p class="text">Claude Balls &amp; Noodles recommend it</p>	
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
			<td class="bgOrangeB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../../images/headers/news/news.gif" / alt="News" name="headNews" width="210" height="25" id="headNews" /></td>
			<td width="220" class="bgOrangeB" align="right" style="padding-left:0px; padding-bottom:0px; padding-right:15px; padding-top:0px;"><p class="headLink"><? echo $backLink ?></p></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td colspan="2" valign="top" class="bgGrey" style="padding: 15px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="50%" valign="top">
						<p class="text"><strong>It's as easy as a crack-whore in Vegas!</strong><br />
							All you <em>gots</em> to do is follow these simple steps.</p>
						<ol>
							<li>Enter the text you want to search on in the 'Search For' field.</li>
							<li>Hit the 'Search' button and await your results.</li>
						</ol>
						<p class="text">- word to your moms</p>
						</td>
						<td width="50%" valign="top">
						<form name="searchNews" method="post" action="search.php">
							<p class="text"><strong>Search For:</strong><br />
								<input type="text" name="query" value="<? echo $query ?>" size="20" class="textfield" />
								<br />
								<input type="submit" name="Search" value="Search!" class="button" />
							</p>
						</form>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="bgGreenB" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="headLink">Search Results</p></td>
					</tr>
					<tr>
						<td class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border-top-width: 0px;
						border-right-width: 1px;
						border-bottom-width: 1px;
						border-left-width: 1px;
						border-top-style: none;
						border-right-style: solid;
						border-bottom-style: solid; 
						border-left-style: solid; 
						border-color: #000000;"><p class="text"><strong><? echo $query ?></strong></p></td>
					</tr>
					<?for ($i = 0; $i<count($arts); $i++)
					{?>
					<tr>
						<td style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border-top-width: 0px;
						border-right-width: 1px;
						border-bottom-width: 1px;
						border-left-width: 1px;
						border-top-style: none;
						border-right-style: solid;
						border-bottom-style: solid; 
						border-left-style: solid; 
						border-color: #000000;"><p class="text"><a href="news_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $artCat ?>" title="<? echo $arts[$i]->gettitle() ?>"><? echo $arts[$i]->gettitle() ?></a><br />
							<? echo $arts[$i]->getshortDesc() ?></p>
						</td>
					</tr>
					<? } 
					 if(count($arts)==0)
					 { ?>
					 <tr>
						<td style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border-top-width: 0px;
						border-right-width: 1px;
						border-bottom-width: 1px;
						border-left-width: 1px;
						border-top-style: none;
						border-right-style: solid;
						border-bottom-style: solid; 
						border-left-style: solid; 
						border-color: #000000;"><p class="text">Sorry Pimp, no news found for the given search criteria. Try another search.</p>
						</td>
					</tr>
					 <? } ?>
				</table>
				<p class="text"><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to da top of da page">Back that thing up (to the top of da page)</a></p>
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

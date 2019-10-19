<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/Articles.php");
include("../../secured/phpinclude/classes/ArticlesSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get Article Info
$artSR = new ArticlesSR($dbConn, 0, 5000, $query, "datePosted", $artCat, "1");
$arts = $artSR->getArticless();

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

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif','../../images/buttons/home_over.gif'); document.searchArticles.query.focus();">
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
					<td><a href="index.php" tabindex="3"><img src="../../images/buttons/articles_on.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="../galleries/index.php" tabindex="4" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)" onFocus="MM_swapImage('btnGalleries','','../../images/buttons/galleries_over.gif',1)"><img src="../../images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="../phpForum/index.php" tabindex="5" onMouseOut="MM_swapImgRestore()" onBlur="MM_swapImgRestore()" onMouseOver="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)" onFocus="MM_swapImage('btnForums','','../../images/buttons/forums_over.gif',1)"><img src="../../images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
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
		<td width="716" class="bgBlack"><img src="../../images/page_images/articles/search.jpg" width="716" height="100" name="pageImage" /></td>
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
		<td width="343" class="bgOrangeB"><img src="../../images/headers/articles/search.gif" width="210" height="25" name="headPageLeft" alt="Top 10 Articles" /></td>
		<td width="343" align="right" class="bgOrangeB"><span class="headLink"><a href="index.php" title="Back to Articles">Back to Articles</a></span></td>
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
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td colspan="2" valign="top" class="bgGrey">
			<!-- Login & Note -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="336" valign="top">
						<p class="text"><strong>It's as easy as a crack-whore in Vegas!</strong><br />
							All you <em>gots</em> to do is follow these simple steps.</p>
						<ol>
							<li>Enter the text you want to search on in the ' Search For' field.</li>
							<li>Select the 'Article Category' you want to search in.</li>
							<li>Hit the 'Search' button and await your results.</li>
						</ol>
						<p class="text">- word to your moms</p>
					</td>
					<td width="15"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
					<td width="335" valign="top">
						<form name="searchArticles" method="post" action="search.php">
							<p class="text"><strong>Search For:</strong><br />
								<input type="text" name="query" value="<? echo $query ?>" size="20" class="textfield" />
								<br />
								<strong>In This Article Category:</strong><br />
								<select name="artCat" class="textfield">
									<option value="" <? if($artCat=="" || !isSet($artCat)){ ?>selected<? } ?>>All *</option>
									<option value="1" <? if($artCat=="1"){ ?>selected<? } ?>>Accessories</option>
									<option value="2" <? if($artCat=="2"){ ?>selected<? } ?>>Body Modifications</option>
									<option value="3" <? if($artCat=="3"){ ?>selected<? } ?>>Reception Modifications</option>
									<option value="4" <? if($artCat=="4"){ ?>selected<? } ?>>Rim / Wheel Modifications</option>
									<option value="5" <? if($artCat=="5"){ ?>selected<? } ?>>Steering Modifications</option>
									<option value="6" <? if($artCat=="6"){ ?>selected<? } ?>>Suspension Modifications</option>
									<option value="7" <? if($artCat=="7"){ ?>selected<? } ?>>Tire Modifications</option>
									<option value="8" <? if($artCat=="8"){ ?>selected<? } ?>>Tracks</option>
								</select>
								<br />
								<input type="submit" name="Search" value="Search!" class="button" />
							</p>
						</form>
					</td>
				</tr>
			</table>
			<!-- Search Results Header -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="638" class="bgBlack"><img src="../../images/shim.gif" width="638" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="25" class="bgGreenB"><img src="../../images/shim.gif" width="25" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="638" class="bgGreenB"><span class="headLink">Search results for:</span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
			</table>
			<!-- Search Results Data -->
			<table width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="638" class="bgBlack"><img src="../../images/shim.gif" width="638" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25" class="bgGreenA"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgGreenA"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="638" class="bgGreenA"><span class="text"><strong>
					<?if($artCat==""){?>
						All
					<?}elseif($artCat=="1"){?>
						Accessories
					<?}elseif($artCat=="2"){?>
						Body Modifications
					<?}elseif($artCat=="3"){?>
						Reception Modifications
					<?}elseif($artCat=="4"){?>
						Rim / Wheel Modifications
					<?}elseif($artCat=="5"){?>
						Steering Modifications
					<?}elseif($artCat=="6"){?>
						Suspension Modifications
					<?}elseif($artCat=="7"){?>
						Tire Modifications
					<?}elseif($artCat=="8"){?>
						Tracks
					<?}?>		
						</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<?for ($i = 0; $i<count($arts); $i++)
					{?>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="638" class="bgBlack"><img src="../../images/shim.gif" width="638" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="638"><span class="text"><a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $artCat ?>" title="<? echo $arts[$i]->gettitle() ?>"><? echo $arts[$i]->gettitle() ?></a><br />
						<? echo $arts[$i]->getshortDesc() ?></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<? } 
					 if(count($arts)==0)
					 { ?>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="638" class="bgBlack"><img src="../../images/shim.gif" width="638" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="25"><img src="../../images/shim.gif" width="25" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="638"><span class="text">Sorry Pimp, no articles found for the given search criteria. Try another search.</span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="20" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="20" name="shim" alt="" /></td>
				</tr>
				<? } ?>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="25" class="bgBlack"><img src="../../images/shim.gif" width="25" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="638" class="bgBlack"><img src="../../images/shim.gif" width="638" height="1" name="shim" alt="" /></td>
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
		<td colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
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

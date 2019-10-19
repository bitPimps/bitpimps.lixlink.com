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

include("../../random_img.php");
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
<link href="../../styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 0 0 0;
	text-align: center;
	background-image: url(../../images/bg_body.gif);
	background-repeat:repeat;
	background-color: #000;
}
#headcontainer {
	width:90%;
	height:60px;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	text-align:left;
	background-color:#000;
	border-top:1px solid #A4ADA8;
	border-right:1px solid #A4ADA8;
	border-left:1px solid #A4ADA8;
	background-image:url(../../images/bg_head.jpg);
	background-position:right;
	background-repeat:no-repeat;
}
.bodyRight {
	width:220px;
	padding:15px;
	border-right:2px solid #000;
	background-color:#CBD0CD;
	background-image: url(../../images/bg_body.jpg);
	background-repeat:repeat-y;
	background-position:top;
}
-->
</style>
</head>

<body>
<div id="barHeader"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="../../index.php"><img src="../../images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="../../index.php" title="Home">Home</a></li>
			<li><a href="index.php" title="Articles" style="background-color:#929292">Articles</a></li>
			<li><a href="../phpGallery/index.php" title="Galleries">Galleries</a></li>
			<li><a href="../phpForum/index.php" title="Forums">Forums</a></li>
			<li><a href="../../links.php" title="Links">Links</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="viewContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="viewHeader"><img src="../../images/head_articles.gif" alt="Article Categories" name="imgHead" width="188" height="25" id="imgHead" /></td>
			<td rowspan="2" class="imgMain"><img src="../../images/page_images/491x173/<? echo $imgName ?>.jpg" alt="" name="imgBody" width="491" height="173" id="imgBody" /></td>
		</tr>
		<tr>
		  <td valign="top" class="viewCopy">
				<a href="index.php?catId=1" title="Accessories / Add-Ons">Accessories / Add-Ons</a><br />
				<a href="index.php?catId=2" title="Body Modifications">Body Modifications</a><br />
				<a href="index.php?catId=3" title="Chassis Modifications">Chassis Modifications</a><br />
				<a href="index.php?catId=4" title="Rim / Wheel Modifications">Rim / Wheel Modifications</a><br />
				<a href="index.php?catId=5" title="Steering Modifications">Steering Modifications</a><br />
				<a href="index.php?catId=6" title="Painting Modifications">Painting Modifications</a><br />
				<a href="index.php?catId=7" title="Performance Modifications">Performance Modifications</a><br />
				<a href="index.php?catId=8" title="Controller Modifications">Controller Modifications</a>
			</td>
	  </tr>
	</table>
</div>
<div id="bodyContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="headLeft"><h1>Search Articles</h1></td>
			<td class="headCenter" align="right"><h2><a href="index.php" title="Go back to Articles">Back to Articles</a></h2></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="50%" valign="top">
				<p><strong>It's as easy as a crack-whore in Vegas!</strong><br />
					All you <em>gots</em> to do is follow these simple steps.</p>
				<ol>
					<li>Enter the text you want to search on in the 'Search For' field</li>
					<li>Select the 'Article Category' you want to search in</li>
					<li>Hit the 'Search' button and await your results</li>
				</ol>
				<p>- word to your moms</p>
			</td>
			<td width="50%" valign="top">
			<form name="searchArticles" method="post" action="search.php">
				<p><strong>Search For:</strong><br />
					<input type="text" name="query" value="<? echo $query ?>" size="20" class="textfield" /><br />
					<strong>In This Article Category:</strong><br />
					<select name="artCat" class="textfield">
						<option value="" <? if($artCat=="" || !isSet($artCat)){ ?>selected<? } ?>>All *</option>
						<option value="1" <? if($artCat=="1"){ ?>selected<? } ?>>Accessories / Add-Ons</option>
						<option value="2" <? if($artCat=="2"){ ?>selected<? } ?>>Body Modifications</option>
						<option value="3" <? if($artCat=="3"){ ?>selected<? } ?>>Chassis Modifications</option>
						<option value="4" <? if($artCat=="4"){ ?>selected<? } ?>>Rim / Wheel Modifications</option>
						<option value="5" <? if($artCat=="5"){ ?>selected<? } ?>>Steering Modifications</option>
						<option value="6" <? if($artCat=="6"){ ?>selected<? } ?>>Painting Modifications</option>
						<option value="7" <? if($artCat=="7"){ ?>selected<? } ?>>Performance Modifications</option>
						<option value="8" <? if($artCat=="8"){ ?>selected<? } ?>>Controller Modifications</option>
					</select>
					<br />
					<input type="submit" name="Search" value="Search!" class="button" />
				</p>
			</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
          	<td class="resultsHeadTerm"><h1>Search results for: <? echo $query ?></h1></td>
         	</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Searching in: 
							<?if($artCat==""){?>
							All Articles
							<?}elseif($artCat=="1"){?>
							Accessories / Add-Ons
							<?}elseif($artCat=="2"){?>
							Body Modifications
							<?}elseif($artCat=="3"){?>
							Chassis Modifications
							<?}elseif($artCat=="4"){?>
							Rim / Wheel Modifications
							<?}elseif($artCat=="5"){?>
							Steering Modifications
							<?}elseif($artCat=="6"){?>
							Painting Modifications
							<?}elseif($artCat=="7"){?>
							Performance Modifications
							<?}elseif($artCat=="8"){?>
							Controller Modifications
							<?}?></strong></p>
						</td>
        	</tr>
					<?for ($i = 0; $i<count($arts); $i++)
					{?>
        	<tr>
          	<td class="results"><p><a href="article_postings.php?id=<? echo $arts[$i]->getid() ?>&catId=<? echo $artCat ?>" title="<? echo $arts[$i]->gettitle() ?>"><? echo $arts[$i]->gettitle() ?></a><br />
							<? echo $arts[$i]->getshortDesc() ?></p></td>
        	</tr>
					<? } 
					 if(count($arts)==0)
					 { ?>
        	<tr>
          	<td class="results"><p>Sorry Pimp, no articles found for the given search criteria. Try another search.</p></td>
        	</tr>
					<? } ?>
      	</table>
				<p><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to the top of da page">Back that thing up (to the top of da page)</a></p>
			</td>
		</tr>
	</table>
	</td>
	</tr>
	</table>
</div>
<div id="barContainer">
	<div id="barBottom"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="copyright"><? echo $metaData->getCopyright() ?></div>
<p>&nbsp;</p>
</body>
</html>

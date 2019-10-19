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
$artSR = new ArticlesSR($dbConn, 0, 5000, "", "datePosted", $catId, "");
$arts = $artSR->getArticless();

// Close DB Connection
mysql_close($dbConn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>bitPimps :: Administration</title>
<meta name="author" content="bitPimps.lixlink.com" />
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
-->
</style>
</head>

<body>
<div id="barHeader"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="../index.php"><img src="../../images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="../index.php" title="Home">Home</a></li>
			<li><a href="index.php" title="Articles" style="background-color:#929292">Articles</a></li>
			<li><a href="../links/index.php" title="Links">Links</a></li>
			<li><a href="../metadata/index.php" title="MetaData">MetaData</a></li>
			<li><a href="https://webmail.lixlink.com" target="_blank" title="Webmail">Webmail</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="bodyContainer">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="headSpecial"><h1>Articles Administration</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
				<p>All Articles are listed below. The published (or live on the web site) articles 
					have a check in the &quot;Publish To Category&quot; field, un-published articles 
					have no check in the field. Click the articles Title to preview that particular 
					article.</p>
				<p>Articles belong to a specific &quot;Category&quot;, the categories list can be 
					found just below. You must first choose which &quot;Category&quot; you would like 
					to modify, once inside, you will be able &quot;Add / Edit / Delete&quot; Articles 
					under that specific category.</p>
				<p><strong>Current Article Categories:</strong><br />
					<a href="index.php?artCat=1">&raquo; Accessories / Add-Ons</a><br />
					<a href="index.php?artCat=2">&raquo; Body Modifications</a><br />
					<a href="index.php?artCat=3">&raquo; Chassis Modifications</a><br />
					<a href="index.php?artCat=4">&raquo; Rim / Wheel Modifications</a><br />
					<a href="index.php?artCat=5">&raquo; Steering Modifications</a><br />
					<a href="index.php?artCat=6">&raquo; Painting Modifications</a><br />
					<a href="index.php?artCat=7">&raquo; Performance Modifications</a><br />
					<a href="index.php?artCat=8">&raquo; Controller Modifications</a></p>
				<p><a href="articleController.php?action=new">&raquo; Create a New Article</a></p>
				<p>&quot;
					<?if($artCat==""){?>
						All
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
					<?}?> Articles&quot; can be chosen from the list of articles found below.</p>
				<p><strong><? echo $msg ?></strong></p>
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="resultsHeadTerm">&nbsp;</td>
						<td class="resultsHeadTerm">&nbsp;</td>
						<td class="resultsHeadTerm">&nbsp;</td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Publish</strong></p></td>
						<td class="resultsHeadCat"><p><strong>Aritcles By Title -&raquo; (preview opens in new window)</strong></p></td>
						<td class="resultsHeadCat"><p><strong>Edit</strong></p></td>
        	</tr>
					<?for ($i = 0; $i<count($arts); $i++)
					{
					?>
        	<tr>
          	<td class="results"><p><strong><? if($arts[$i]->getactive()=="1"){ ?>Yes<?}else{?>No<?}?></strong></p></td>
        		<td class="results"><p><a href="preview.php?id=<? echo $arts[$i]->getid() ?>" target="_blank"><? echo $arts[$i]->gettitle() ?></a></p></td>
						<td class="results"><a href="articleController.php?action=edit&id=<? echo $arts[$i]->getid() ?>"><img src="../../images/buttons/edit.gif" width="25" height="25" name="btnEdit" alt="Edit" border="0" /></a></td>
					</tr>
					<? }
					if(count($arts)==0)
					{ ?>
        	<tr>
						<td class="results">&nbsp;</td>
          	<td class="results"><p>No articles at this time.</p></td>
						<td class="results">&nbsp;</td>
        	</tr>
					<? } ?>
      	</table>
				<p><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to the top of da page">Back that thing up (to the top of da page)</a></p>
			</td>
		</tr>
	</table>
</div>
<div id="barContainer">
	<div id="barBottom"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="copyright"><? echo $metaData->getCopyright() ?></div>
</body>
</html>

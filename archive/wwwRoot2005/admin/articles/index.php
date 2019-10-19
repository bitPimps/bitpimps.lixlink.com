<?php
include("../../secured/phpinclude/logonCheck.php");

extract(array_merge($_POST,$_GET));

if(!isSet($hack) && $hack!="justIn")
{
	include("../../secured/config/phpConfig.php");
	include("../../secured/phpinclude/common_db.php");
	include("../../secured/phpinclude/classes/Articles.php");
	include("../../secured/phpinclude/classes/ArticlesSR.php");
}
include("../linkBuilder.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Article Info
$artSR = new ArticlesSR($dbConn, 0, 5000, "", "datePosted", $artCat, "");
$arts = $artSR->getArticless();

// Close DB Connection
mysql_close($dbConn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>bitPimps Article Administration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" content="bitPimps.lixlink.com" />
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
	background-image:  url(../../images/backgrounds/logo_under.gif);
	background-repeat: repeat-x;
	}
	-->
</style>
<script language="JavaScript" type="text/JavaScript" src="../../javascript/layers_reload.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/image_preload_swap.js"></script>
<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body>
<div id="LogoNav" style="position:absolute; width:95%; height:74px; z-index:1; left: 25px; top: 0px; visibility: visible; overflow: hidden;">
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
			<td width="176"><a href="../index.php"><img src="../../images/logo/bitpimps.gif" / alt="bitPimps Custom Modifications" name="logo" width="176" height="60" border="0" id="logo" /></a></td>
			<td align="right" valign="bottom" class="bgLogoUnder" style="padding-left: 0px; padding-bottom: 5px; padding-right: 10px; padding- top: 0px;"><p class="headLink">
				<? echo $newsLink ?><? echo $articlesLink ?><? echo $linksLink ?><? echo $metaLink ?><? echo $usersLink ?><? echo $uploadLink ?><? echo $forumLink ?><? echo $mailLink ?><? echo $pleskLink ?><? echo $logoutLink ?></p></td>
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
<div id="Body" style="position:absolute; width:95%; height:200px; z-index:1; top: 74px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td class="bgOrangeB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../../images/headers/admin/admin.gif" alt="bitPimps.com Administration" name="headPageLeft" width="300" height="25" id="headPageLeft" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
				<p class="text">
				All Articles are listed below. The published (or live on the website) articles have a check in the &quot;Publish To Category&quot; field, un-published articles have no check in the field. Click the articles Title to preview that particular article.</p>
			<p class="text">Articles belong to a specific &quot;Category&quot;, the categories list can be found just below. You must first choose which &quot;Category&quot; you would like to modify, once inside, you will be able &quot;Add / Edit / Delete&quot; Articles under that specific category.</p>
			<p class="text"><strong>Current Article Categories:</strong><br />
				<a href="index.php?artCat=1">&raquo; Accessories / Add-Ons</a><br />
				<a href="index.php?artCat=2">&raquo; Body Modifications</a><br />
				<a href="index.php?artCat=3">&raquo; Chassis Modifications</a><br />
				<a href="index.php?artCat=4">&raquo; Rim / Wheel Modifications</a><br />
				<a href="index.php?artCat=5">&raquo; Steering Modifications</a><br />
				<a href="index.php?artCat=6">&raquo; Painting Modifications</a><br />
				<a href="index.php?artCat=7">&raquo; Performance Modifications</a><br />
				<a href="index.php?artCat=8">&raquo; Controller Modifications</a></p>
			<p class="text"><a href="articleController.php?action=new">&raquo; Create a New Article</a></p>
			<h3>Always check / test / preview  your modifications before making them live to the public site.</h3>
			<p class="text">The &quot;
					<?if($artCat==""){?>
						Top 10
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
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="75" class="bgGreenB" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="headLink">Publish</p></td>
						<td class="bgGreenB" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="headLink">Aritcles By Title -&raquo; (preview opens in new window)</p></td>
						<td width="55" class="bgGreenB" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="headLink">Edit</p></td>
					</tr>
					<tr>
						<td width="75" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="75" height="1" name="shim" alt="" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
						<td width="55" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="55" height="1" name="shim" alt="" /></td>
					</tr>
					<?for ($i = 0; $i<count($arts); $i++)
					{
					?>
					<tr>
						<td width="75" class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="text"><strong><? if($arts[$i]->getactive()=="1"){ ?>Yes<?}else{?>No<?}?></strong></p></td>
						<td class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="text"><a href="preview.php?id=<? echo $arts[$i]->getid() ?>" target="_blank"><? echo $arts[$i]->gettitle() ?></a></p></td>
						<td width="55" class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><a href="articleController.php?action=edit&id=<? echo $arts[$i]->getid() ?>"><img src="../../images/buttons/edit.gif" width="25" height="25" name="btnEdit" alt="Edit" border="0" /></a></td>
					</tr>
					<tr>
						<td width="75" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="75" height="1" name="shim" alt="" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
						<td width="55" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="55" height="1" name="shim" alt="" /></td>
					</tr>
					<?	}
					if(count($arts)==0)
					{ ?>
					<tr>
						<td width="75" class="bgGreenA" style="border: 1px solid #000000;">&nbsp;</td>
						<td class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="text">No articles at this time</p></td>
						<td width="55" class="bgGreenA" style="border: 1px solid #000000;">&nbsp;</td>
					</tr>
					 <tr>
						<td width="75" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="75" height="1" name="shim" alt="" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
						<td width="55" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" width="55" height="1" name="shim" alt="" /></td>
					</tr>
					<? } ?>
				</table>
				<p class="text"><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to da top of da page">Back that thing up (to the top of da page)</a></p>
				<p class="text">&nbsp;</p></td>
			<td width="2"><img src="../../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td colspan="3"><img src="../../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
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
			<td align="center" style="padding-left: 0px; padding-bottom: 5px; padding-right: 0px; padding-top: 5px;"><p class="copyright">Copyright &copy; 2002 - 2004 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</p></td>
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

<?php
include("../../secured/phpinclude/logonCheck.php");

extract(array_merge($_POST,$_GET));

if(!isSet($hack) && $hack!="justIn")
{
	include("../../secured/config/phpConfig.php");
	include("../../secured/phpinclude/common_db.php");
	include("../../secured/phpinclude/classes/MetaData.php");
}
include("../linkBuilder.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Close DB Connection
mysql_close($dbConn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>bitPimps MetaData Administration</title>
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
				The current meta information can be found below. Click inside the text fields to edit. When finished, click "Save" to finish.</p>
			<h3>Always check / test / preview  your modifications before making them live to the public site.</h3>
			<p class="text"><strong><? echo $msg ?></strong></p>
			<!-- Meta Data -->
			<form name="metadata" method="post" action="metadataController.php">
			 <input type="hidden" name="action" value="update">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="175" class="bgGreenB" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 0px; 
								padding-top: 5px; 
								border: 1px solid #000000;"><p class="headLink">Title:</p></td>
						<td class="bgGreenA" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 15px; 
								padding-top: 5px; 
								border: 1px solid #000000;"><input type="text" name="title" style="width: 98%" value="<? echo $metaData->getTitle() ?>" /></td>
					</tr>
					<tr>
						<td width="175" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="175" height="1" id="shim" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="1" height="1" id="shim" /></td>
					</tr>
					<tr>
						<td width="175" valign="top" class="bgGreenB" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 0px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><p class="headLink"><strong>Keywords:</strong></p></td>
						  <td class="bgGreenA" style="
						padding-left: 15px; 
						padding-bottom: 5px; 
						padding-right: 15px; 
						padding-top: 5px; 
						border: 1px solid #000000;"><textarea name="keywords" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getKeywords() ?></textarea></td>
					</tr>
					<tr>
						<td width="175" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="175" height="1" id="shim" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="1" height="1" id="shim" /></td>
					</tr>
					<tr>
						<td width="175" valign="top" class="bgGreenB" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 0px; 
								padding-top: 5px;
								border: 1px solid #000000;"><p class="headLink"><strong>Description:</strong></p></td>
						<td class="bgGreenA" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 15px; 
								padding-top: 5px; 
								border: 1px solid #000000;"><textarea name="description" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getDescription() ?></textarea></td>
					</tr>
					<tr>
						<td width="175" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="175" height="1" id="shim" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="1" height="1" id="shim" /></td>
					</tr>
					<tr>
						<td width="175" valign="top" class="bgGreenB" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 0px; 
								padding-top: 5px;
								border: 1px solid #000000;"><p class="headLink"><strong>Copyright:</strong></p></td>
						<td class="bgGreenA" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 15px; 
								padding-top: 5px; 
								border: 1px solid #000000;"><textarea name="copyright" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getCopyright() ?></textarea></td>
					</tr>
					<tr>
						<td width="175" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="175" height="1" id="shim" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="1" height="1" id="shim" /></td>
					</tr>
					<tr>
						<td width="175" class="bgGreenB" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 0px; 
								padding-top: 5px;
								border: 1px solid #000000;"><p class="headLink">&nbsp;</p></td>
						<td class="bgGreenA" style="
								padding-left: 15px; 
								padding-bottom: 5px; 
								padding-right: 0px; 
								padding-top: 5px; 
								border: 1px solid #000000;"><input type="submit" name="Save" value="Save" />
									<input type="reset" name="Clear" value="Clear" /></td>
					</tr>
					<tr>
						<td width="175" style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="175" height="1" id="shim" /></td>
						<td style="border-color: #E4E4E4;"><img src="../../images/shim.gif" alt="" name="shim" width="1" height="1" id="shim" /></td>
					</tr>
				</table>
				</form>
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

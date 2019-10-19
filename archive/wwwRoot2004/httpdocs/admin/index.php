<?php
session_start();
header("Cache-control: private"); // IE 6 Fix
$username = "-1";
$_SESSION = array();
session_destroy();
	include("../secured/config/phpConfig.php");
	include("../secured/phpinclude/common_db.php");
	include("../secured/phpinclude/classes/Users.php");
	include("../secured/phpinclude/classes/UsersSR.php");
	
// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get News Info
$artSR = new UsersSR($dbConn, 0, 5000, "", "logonName", "");
$arts = $artSR->getUserss();

// Close DB Connection
mysql_close($dbConn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>bitPimps Administration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" content="bitPimps.lixlink.com" />
<meta name="MSSmartTagsPreventParsing" content="TRUE" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../stylesheets/bp_public.css" rel="stylesheet" type="text/css">
<style type="text/css">
	<!--
	.bgHomeSub	{
	background-image:  url(../images/backgrounds/home_sub.jpg);
	background-repeat: repeat-y;
	background-color: #A4ADA8;
	background-position: center;
	}
	.bgLogoUnder	{
	background-image:  url(../images/backgrounds/logo_under.gif);
	background-repeat: repeat-x;
	}
	-->
</style>
</head>

<body>
<div id="LogoNav" style="position:absolute; width:95%; height:74px; z-index:1; left: 25px; top: 0px; visibility: visible; overflow: hidden;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bgOrangeB"><img src="../images/shim.gif" / alt="" name="shim" width="750" height="6" id="shim" /></td>
		</tr>
		<tr>
			<td><img src="../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="750" height="1" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
			<td class="bgLogoUnder"><a href="home.php"><img src="../images/logo/bitpimps.gif" / alt="bitPimps Custom Modifications" name="logo" width="176" height="60" border="0" id="logo" /></a></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="60" id="shim" /></td>
		</tr>
	</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
</div>
<div id="Body" style="position:absolute; width:95%; height:200px; z-index:1; top: 74px; left: 25px; overflow: visible; visibility: visible;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td class="bgOrangeB" style="padding-left:15px; padding-bottom:0px; padding-right:0px; padding-top:0px;"><img src="../images/headers/admin/admin.gif" alt="bitPimps.com Administration" name="headPageLeft" width="300" height="25" id="headPageLeft" /></td>
			<td width="2"><img src="../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
			<td width="2"><img src="../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td valign="top" class="bgGrey" style="padding: 15px;">
				<p class="text">
				Enter your login information:</p>
				<p style="color: #FF0000"><strong><? echo $msg ?></strong></p>
				<table cellpadding="5" cellspacing="0" border="0">
				<form name="loginForm" action="users/usersController.php" method="POST">
				<input type="hidden" name="action" value="logon" />
					<tr>
						<td><strong>Username:</strong></td>
						<td><select name="id">
								<option value="0">--Select a Logon Name--</option>
					<?for ($i = 0; $i<count($arts); $i++)
					{
					?>
								<option value="<? echo $arts[$i]->getid() ?>"><? echo $arts[$i]->getlogonName() ?></option>
					<?	}
					if(count($arts)==0)
					{ ?>
								<option>--No Users Available--</option>
					<? } ?>
							</select></td>
					</tr>
					<tr>
						<td><strong>Password:</strong></td>
						<td><input type="password" name="password" class="textfield"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" name="submit" value="Log in" class="button"></td>
					</tr>
				</form>
				</table>
				<p class="text">&nbsp;</p>
				<p class="text">&nbsp;</p></td>
			<td width="2"><img src="../images/shim.gif" / alt="" name="shim" width="2" height="25" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="25" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td colspan="3"><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueA"><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td class="bgBlueB"><img src="../images/shim.gif" / alt="" name="shim" width="748" height="2" id="shim" /></td>
			<td class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
			<td align="center" style="padding-left: 0px; padding-bottom: 5px; padding-right: 0px; padding-top: 5px;"><p class="copyright">Copyright &copy; 2002 - 2004 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</p></td>
			<td width="1" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="1" height="2" id="shim" /></td>
		</tr>
		<tr>
			<td colspan="3" class="bgGreenA"><img src="../images/shim.gif" / alt="" name="shim" width="750" height="2" id="shim" /></td>
		</tr>
	</table>
	<p>&nbsp;</p>
</div>
</body>
</html>

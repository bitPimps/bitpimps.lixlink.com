<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>bitPimps.com - Website Administration</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="bitPimps.com" />
	<meta name="MSSmartTagsPreventParsing" content="TRUE" />
	<link rel="stylesheet" href="../../stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:    url(../../images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image:   url(../../images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="../../javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/javascript" src="../../javascript/window_open.js"></script>
</head>

<body class="bgPage" onLoad="MM_preloadImages('../../images/buttons/articles_over.gif','../../images/buttons/galleries_over.gif','../../images/buttons/forums_over.gif','../../images/buttons/links_over.gif','../../images/buttons/members_over.gif')">
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="../../images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><a href="../index.php" tabindex="1"><img src="../../images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></a></td>
		<td width="539"><img src="../../images/logo/bg_admin_right.jpg" width="539" height="73" name="bgLogo" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
	</tr>
</table>
<?
include("../pages/includes/lines_head.inc")
?>
<!-- Body -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="300" class="bgOrangeB"><img src="../../images/headers/admin/admin.gif" width="300" height="25" name="headPageLeft" alt="bitPimps.com Administration" /></td>
		<td width="161" align="right" class="bgOrangeB"><span class="headLink"><a href="../index.php" title="Admin Home">Admin Home</a></span></td>
		<td width="15" class="bgOrangeB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="../../images/headers/admin/navigation.gif" width="193" height="25" name="headPageRight" alt="Admin Navigation" /></td>
		<td width="15" class="bgGreenB"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" valign="top" class="bgGrey">
			<p class="text">
				Add or Edit a member here by filling in all the fields. Check the &quot;Active&quot; box to publish the member to the public site.</p>
			<p class="text"><strong>Always check / test / preview  your modifications before making them live to the public site.</strong></p>
			<form name="editMember" method="post" action="">
			<table width="461" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="125" class="bgBlack"><img src="../../images/shim.gif" width="125" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="313" class="bgBlack"><img src="../../images/shim.gif" width="313" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Username:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="username" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Password:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="password" name="password" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* Confirm Password:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="password" name="passwordCheck" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">* E-mail Address:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="email" size="30" class="textfield" /><br />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" class="bgGreenB"><img src="../../images/shim.gif" width="125" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA"><span class="text"><strong>Publish E-mail Address in Member Profile?:</strong><br />
						<input type="checkbox" name="publishEmail" value="checkbox" />
						Yes 
						<input type="checkbox" name="publishEmail" value="checkbox" />
						No</span>
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">Web Address:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						  <input type="text" name="website" size="30" class="textfield" value="http://" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">Location:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="text" name="location" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" align="right" class="bgGreenB"><span class="headLink">Member Since:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						  <input type="text" name="memberSince" size="30" class="textfield" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					  <td width="125" align="right" class="bgGreenB"><span class="headLink">* Member Level:</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<select name="memberLevel" class="textfield">
							<option selected>Ghetto Boy</option>
							<option>Hustler</option>
							<option>Pimp</option>
							<option>Snoop Dogg</option>
							<option>Godlike</option>
						</select>
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="125"><img src="../../images/shim.gif" width="125" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="313"><img src="../../images/shim.gif" width="313" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="125" class="bgGreenB"><img src="../../images/shim.gif" width="125" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="313" class="bgGreenA">
						<input type="reset" name="Clear" value="Clear" class="button" />
						<input type="submit" name="Continue" value="Continue &raquo;" class="button" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="125" class="bgBlack"><img src="../../images/shim.gif" width="125" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="313" class="bgBlack"><img src="../../images/shim.gif" width="313" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			</form>
			<p class="text"><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to da top of da page">Back that thing up (to the top of da page)</a></p>
		</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				&raquo; Modify the Home Page<br />
				<a href="../news/index.php">&raquo; Modify the News Archive</a><br />
				<a href="../articles/index.php">&raquo; Modify the Articles</a><br />
				&raquo; Modify the Galleries<br />
				<a href="../../pages/phpForum/">&raquo; Modify the Forums</a><br />
				<a href="../links/index.php">&raquo; Modify the Links</a><br />
				&raquo; Modify the Members<br />
				<a href="../metadata/index.php">&raquo; Modify the Meta Data</a><br />
				<a href="http://webmail.cqhost.com/">&raquo; WebMail: Check your E-mail</a><br />
				<a href="javascript:window.open('http://www.lixlink.com/.phpmyadmin/','','status=no,resizable=yes,width=710,height=440'); void('');">&raquo; phpMyAdmin</a></p>
			</td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="../../images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="../../images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<?
include("../pages/includes/copyright.inc")
?>
</body>
</html>

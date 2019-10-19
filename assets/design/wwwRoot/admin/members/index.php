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
				All bitPimp.com Members are listed below alphabetically. Click the members name to preview the members profile or select &quot;Edit&quot; to modify the members information or status. Active members have NO check next to their names, check the box next to the username that you want to make &quot;In-Active&quot;.</p>
			<p class="text"><strong>Always check / test / preview  your modifications before making them live to the public site.</strong></p>
			<table width="461" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="75" class="bgBlack"><img src="../../images/shim.gif" width="75" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="327" class="bgBlack"><img src="../../images/shim.gif" width="327" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="35" class="bgBlack"><img src="../../images/shim.gif" width="35" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="75" class="bgGreenB" align="center"><span class="headLink">ACTIVE</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="327" class="bgGreenB"><span class="headLink">ALL MEMBERS BY USERNAME</span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="35" align="center" class="bgGreenB"><span class="headLink">EDIT</span></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="75"><img src="../../images/shim.gif" width="75" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="327"><img src="../../images/shim.gif" width="327" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="35"><img src="../../images/shim.gif" width="35" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="75" class="bgGreenA" align="center">
						<input type="checkbox" name="checkbox" value="checkbox" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="327" class="bgGreenA"><span class="text">
						<a href="preview.php">Member (1)</a></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="35" align="center" class="bgGreenA"><a href="edit.php"><img src="../../images/buttons/edit.gif" width="25" height="25" name="btnEdit" alt="Edit" border="0" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="75"><img src="../../images/shim.gif" width="75" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="327"><img src="../../images/shim.gif" width="327" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="35"><img src="../../images/shim.gif" width="35" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="75" class="bgGreenA" align="center">
						<input type="checkbox" name="checkbox2" value="checkbox" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="327" class="bgGreenA"><span class="text"><a href="preview.php">Member (2)</a></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="35" align="center" class="bgGreenA"><a href="edit.php"><img src="../../images/buttons/edit.gif" width="25" height="25" name="btnEdit" alt="Edit" border="0" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="75"><img src="../../images/shim.gif" width="75" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="327"><img src="../../images/shim.gif" width="327" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="35"><img src="../../images/shim.gif" width="35" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="75" class="bgGreenA" align="center">
						<input type="checkbox" name="checkbox2" value="checkbox" />
					</td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="327" class="bgGreenA"><span class="text"><a href="preview.php">Member (3)</a></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="35" align="center" class="bgGreenA"><a href="edit.php"><img src="../../images/buttons/edit.gif" width="25" height="25" name="btnEdit" alt="Edit" border="0" /></a></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="75" class="bgBlack"><img src="../../images/shim.gif" width="75" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="327" class="bgBlack"><img src="../../images/shim.gif" width="327" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="35" class="bgBlack"><img src="../../images/shim.gif" width="35" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			<p class="text"><a href="javascript:window.scrollTo(0,0);" title="Back this mutha to da top of da page">Back that thing up (to the top of da page)</a></p>
		</td>
		<td width="15" class="bgGrey"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="../../images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="../../images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">&raquo; Modify the Home Page<br />
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

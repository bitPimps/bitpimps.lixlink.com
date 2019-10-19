<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/Links.php");
include("../../secured/phpinclude/classes/LinksSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Links Info
$linkSR = new LinksSR($dbConn, 0, 5000, "", "orderId");
$links = $linkSR->getLinkss();

// Close DB Connection
mysql_close($dbConn);
?>
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
				This admin section is layed out much like the page on the public site itself, which should make this administration section intuitive enough to warrant little help. The current links that are on the &quot;Public Web Site&quot; can be found just to the left (in the green), as well as below in the &quot;Editable Form&quot;.</p>
			<p class="text">
				<strong>Current Top 10 External Links</strong><br />
				<?for ($i = 0; $i<count($links); $i++)
					{
				?>
			<a href="<? echo $links[$i]->geturl() ?>" target="_blank">&raquo; <? echo $links[$i]->getname() ?></a><br />
			<?}
				if(count($links)==0)
				{ ?>
				No links at this time.
			<?}?>
			</p>
			<p class="text"><strong>Always check / test / preview  your modifications before making them live to the public site.</strong></p>
			<p class="text"><strong>Top 10 External Links Editable Form<br><? echo $msg ?></strong></p>
			<?// Connect to Database
				$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

				for ($i=1; $i<11; $i++)
				{
					$link = new Links("");
					$link = $link->getLinkByOrder($dbConn, $i);
			?>
			<!-- Link #1 Data -->
			<form name="link<? echo $i ?>data" method="post" action="linkController.php">
			 <input type="hidden" name="id" value="<? echo $link->getid() ?>">
			 <input type="hidden" name="action" value="update">
			<table width="461" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="119" class="bgBlack"><img src="../../images/shim.gif" width="119" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenB"><span class="headLink">LINK #<? echo $i ?></span></td>
					<td width="10" class="bgGreenB"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300" class="bgGreenA"><?if($i != 1){?><a href="linkController.php?action=moveup&id=<? echo $link->getid() ?>"><img src="../../images/buttons/arrow_up.gif" width="25" height="25" name="arrowUP" alt="Move Up" border="0" /></a><?}?><?if($i != 10){?><a href="linkController.php?action=movedown&id=<? echo $link->getid() ?>"><img src="../../images/buttons/arrow_down.gif" width="25" height="25" name="arrowDOWN" alt="Move Down" border="0" /></a><?}?></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="119"><img src="../../images/shim.gif" width="119" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="300"><img src="../../images/shim.gif" width="300" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenA"><span class="text"><strong>Link Order</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300"><span class="text"><? echo $i ?></span></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="119"><img src="../../images/shim.gif" width="119" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="300"><img src="../../images/shim.gif" width="300" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenA"><span class="text"><strong>Link URL</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300">
						<input type="text" name="linkURL" size="30" value="<? echo $link->geturl() ?>" />
					</td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="119"><img src="../../images/shim.gif" width="119" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="300"><img src="../../images/shim.gif" width="300" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenA"><span class="text"><strong>Link Name</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300">
						<input type="text" name="linkName" size="30" value="<? echo $link->getname() ?>"/>
					</td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="119"><img src="../../images/shim.gif" width="119" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="300"><img src="../../images/shim.gif" width="300" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenA"><span class="text"><strong>Link Description</strong></span></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300">
						<textarea name="linkDescription" cols="30" rows="5" wrap="VIRTUAL"><? echo $link->getdesc() ?></textarea>
					</td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="119"><img src="../../images/shim.gif" width="119" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="300"><img src="../../images/shim.gif" width="300" height="2" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="2" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="2" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="119" class="bgGreenA"><img src="../../images/shim.gif" width="119" height="25" name="shim" alt="" /></td>
					<td width="10" class="bgGreenA"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="300">
						<input type="submit" name="Submit" value="Submit" />
						<input type="reset" name="Clear" value="Clear" />
					</td>
					<td width="10"><img src="../../images/shim.gif" width="10" height="25" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="25" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="119" class="bgBlack"><img src="../../images/shim.gif" width="119" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="300" class="bgBlack"><img src="../../images/shim.gif" width="300" height="1" name="shim" alt="" /></td>
					<td width="10" class="bgBlack"><img src="../../images/shim.gif" width="10" height="1" name="shim" alt="" /></td>
					<td width="1" class="bgBlack"><img src="../../images/shim.gif" width="1" height="1" name="shim" alt="" /></td>
				</tr>
			</table>
			</form><br />
			<?}
				// Close DB Connection
				mysql_close($dbConn);?> 
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
				<a href="index.php">&raquo; Modify the Links</a><br />
				&raquo; Modify the Members<br />
				<a href="../metadata/index.php">&raquo; Modify the Meta Data</a><br />
				<a href="http://webmail.cqhost.com/">&raquo; WebMail: Check your E-mail</a><br />
				<a href="javascript:window.open('http://www.lixlink.com/.phpmyadmin/','','status=no,resizable=yes,width=710,height=440'); void('');">&raquo; phpMyAdmin</a></p>
			<p class="text">
				<strong>Editing The Link Order</strong><br />
				If we have any affiliates or sister sites, those need to be listed first, followed by the most respected, user friendly and generally good sites.</p>
			<p class="text">Use the arrows to change the link order.</p>
			<p class="text">
				<strong>Editing Descriptions</strong><br />
				Try to keep the &quot;Description&quot; section of each link to just a couple of sentences. Make sure you highlight the parts of the site that are extremely useful.</p>
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

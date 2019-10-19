<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");
include("../../secured/phpinclude/classes/Links.php");
include("../../secured/phpinclude/classes/LinksSR.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Get Links Info
$linkSR = new LinksSR($dbConn, 0, 5000, "", "orderId");
$links = $linkSR->getLinkss();

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
			<li><a href="../articles/index.php" title="Articles">Articles</a></li>
			<li><a href="index.php" title="Links" style="background-color:#929292">Links</a></li>
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
			<td class="headSpecial"><h1>Links Administration</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
				<p>The current links that are on the &quot;Public Web Site&quot; can be found just 
					below, as well as below in the &quot;Editable Form&quot;.</p>
				<p><strong>Current Top 10 External Links</strong><br />
					<?for ($i = 0; $i<count($links); $i++)
					{
					?>
					<a href="<? echo $links[$i]->geturl() ?>" target="_blank">&raquo; <? echo $links[$i]->getname() ?></a><br />
					<?}
					if(count($links)==0)
					{ ?>
					No links at this time.
					<?}?></p>
				<p><strong>Top 10 External Links Editable Form</strong></p>
				<p><strong><? echo $msg ?></strong></p>
				<?// Connect to Database
				$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

				for ($i=1; $i<11; $i++)
				{
					$link = new Links("");
					$link = $link->getLinkByOrder($dbConn, $i);
				?>
				<form name="link<? echo $i ?>data" method="post" action="linkController.php">
				<input type="hidden" name="id" value="<? echo $link->getid() ?>">
				<input type="hidden" name="orderId" value="<? echo $i ?>" />
				<input type="hidden" name="action" value="update">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="resultsHeadTerm">&nbsp;</td>
						<td class="resultsHeadTerm">&nbsp;</td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Link #: <? echo $i ?></strong></p></td>
						<td class="results"><?if($i != 1){?><a href="linkController.php?action=moveup&id=<? echo $link->getid() ?>"><img src="../../images/buttons/arrow_up.gif" width="25" height="25" name="arrowUP" alt="Move Up" border="0" /></a><?}?><?if($i != 10){?><a href="linkController.php?action=movedown&id=<? echo $link->getid() ?>"><img src="../../images/buttons/arrow_down.gif" width="25" height="25" name="arrowDOWN" alt="Move Down" border="0" /></a><?}?></td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Link Order:</strong></p></td>
        		<td class="results"><p><? echo $i ?></p></td>
					</tr>
        	<tr>
						<td class="resultsHeadCat"><p><strong>Link URL:</strong></p></td>
          	<td class="results"><input type="text" name="linkURL" style="width: 98%" value="<? echo $link->geturl() ?>" /></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat"><p><strong>Link Name:</strong></p></td>
          	<td class="results"><input type="text" name="linkName" style="width: 98%" value="<? echo $link->getname() ?>" /></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat" valign="top"><p><strong>Link Description:</strong></p></td>
          	<td class="results"><textarea name="linkDescription" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $link->getdesc() ?></textarea></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat">&nbsp;</td>
          	<td class="results"><input type="submit" name="Save" value="Save" /> 
							<input type="reset" name="Clear" value="Clear" /></td>
        	</tr>
      	</table>
				</form>
				<?}
				// Close DB Connection
				mysql_close($dbConn);?>
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

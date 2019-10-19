<?php
include("../../secured/config/phpConfig.php");
include("../../secured/phpinclude/common_db.php");
include("../../secured/phpinclude/classes/MetaData.php");

// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

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
			<li><a href="../links/index.php" title="Links">Links</a></li>
			<li><a href="index.php" title="MetaData" style="background-color:#929292">MetaData</a></li>
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
			<td class="headSpecial"><h1>MetaData Administration</h1></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="bodySpecial">
				<p>The current meta information can be found below. Click inside the text 
					fields to edit. When finished, click &quot;Save&quot; to finish.</p>
				<p><strong><? echo $msg ?></strong></p>
				<form name="metadata" method="post" action="metadataController.php">
				<input type="hidden" name="action" value="update">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="resultsHeadTerm">&nbsp;</td>
						<td class="resultsHeadTerm">&nbsp;</td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Title:</strong></p></td>
						<td class="results"><input type="text" name="title" style="width: 98%" value="<? echo $metaData->getTitle() ?>" /></td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Keywords:</strong></p></td>
        		<td class="results"><textarea name="keywords" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getKeywords() ?></textarea></td>
					</tr>
        	<tr>
						<td class="resultsHeadCat"><p><strong>Description:</strong></p></td>
          	<td class="results"><textarea name="description" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getDescription() ?></textarea></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat"><p><strong>Copyright:</strong></p></td>
          	<td class="results"><textarea name="copyright" style="width: 98%" rows="5" wrap="VIRTUAL"><? echo $metaData->getCopyright() ?></textarea></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat">&nbsp;</td>
          	<td class="results"><input type="submit" name="Save" value="Save" /> 
							<input type="reset" name="Clear" value="Clear" /></td>
        	</tr>
      	</table>
				</form>
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

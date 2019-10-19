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
				<p>Add or Edit a news item here by filling in all the fields. Check the 
					&quot;Publish&quot; box to publish the news item to the public site.</p>
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
				<form name="edit" method="post" action="articleController.php">
				<input type="hidden" name="id" value="<? echo $art->getid() ?>"/>
				<input type="hidden" name="action" value="save"/>
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="resultsHeadTerm">&nbsp;</td>
						<td class="resultsHeadTerm">&nbsp;</td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Publish To Category:</strong></p></td>
						<td class="results"><input type="checkbox" name="active" value="1" <?if($art->getactive()=="1"){?>checked<?}?>/></td>
					</tr>
        	<tr>
          	<td class="resultsHeadCat"><p><strong>Current Category:</strong></p></td>
        		<td class="results">
							<select name="catId">
								<option value="1" <? if($art->getcatId()=="1"){ ?>selected<?}?>>Accessories / Add-Ons</option>
								<option value="2" <? if($art->getcatId()=="2"){ ?>selected<?}?>>Body Modifications</option>
								<option value="3" <? if($art->getcatId()=="3"){ ?>selected<?}?>>Chassis Modifications</option>
								<option value="4" <? if($art->getcatId()=="4"){ ?>selected<?}?>>Rim / Wheel Modifications</option>
								<option value="5" <? if($art->getcatId()=="5"){ ?>selected<?}?>>Steering Modifications</option>
								<option value="6" <? if($art->getcatId()=="6"){ ?>selected<?}?>>Painting Modifications</option>
								<option value="7" <? if($art->getcatId()=="7"){ ?>selected<?}?>>Performance Modifications</option>
								<option value="8" <? if($art->getcatId()=="8"){ ?>selected<?}?>>Controller Modifications</option>
							</select>
						</td>
					</tr>
        	<tr>
						<td class="resultsHeadCat"><p><strong>Release Date:</strong></p></td>
          	<td class="results"><? echo $art->getdatePosted("m/d/Y") ?><input type="hidden" name="datePosted" value="<? echo $art->getdatePosted("m/d/Y") ?>" /></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat"><p><strong>Article Title:</strong></p></td>
          	<td class="results"><input type="text" name="articleTitle" style="width: 98%" value="<? echo $art->gettitle() ?>"/></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat" valign="top"><p><strong>Intro Copy:</strong></p></td>
          	<td class="results"><textarea name="introCopy" style="width: 98%" rows="3" wrap="VIRTUAL"><? echo $art->getshortDesc() ?></textarea></td>
        	</tr>
					<tr>
						<td class="resultsHeadCat" valign="top"><p><strong>Body Copy:</strong></p></td>
          	<td class="results"><textarea name="bodyCopy" style="width: 98%" rows="12" wrap="VIRTUAL"><? echo $art->getbody() ?></textarea></td>
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
<div id="copyright">Copyright &copy; 2002 - 2006 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</div>
</body>
</html>

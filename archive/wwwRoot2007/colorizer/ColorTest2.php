<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
$movieUrl = "ColorTest2.swf";

if(isset($_REQUEST["styleId"]))
{	
	$movieUrl = $movieUrl . "?styleId=" . $_REQUEST["styleId"];
}
?>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Color Test 2</title>
</head>
<body bgcolor="#000000">
<!--url's used in the movie-->
<!--text used in the movie-->
<div align="center" height="100%">
<p><font font="verdana" color="white"><br />Color Test 2 - Porsche</font></p>

<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="500" height="335" id="Untitled-1" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="<?=$movieUrl?>" />
<param name="quality" value="high" />
<param name="bgcolor" value="#000000" />


<embed src="<?=$movieUrl?>" quality="high" bgcolor="#000000" width="500" height="335" name="Untitled-1" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<div>
</body>
</html>


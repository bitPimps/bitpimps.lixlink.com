<?php
mt_srand ((double) microtime() * 1000000);
$noCache = mt_rand(1,11);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>bitPimps Radio: bPRX - Pimpin The Air Waves 24/7</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="CaboWabo (bitPimps)" />
	<meta name="keywords" content="bitPimps radio pimp air waves 24/7" />
	<meta name="description" content="Our little blingin radio station straight from Pimp City." />
	<meta name="MSSmartTagsPreventParsing" content="TRUE" />
	<!-- prevent caching in netscape. very important cause netscape tends to mangle cached code -->
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="Pragma" content="no-cache" />
</head>
<body bgcolor="#000000">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
 width=420 height=200>
 <param name=movie value="pimpbox.swf?noCache=<? echo $noCache ?>"> <param name=menu value=false> <param name=quality value=high> <param name=bgcolor value=#FFFFFF> <embed src="pimpbox.swf?noCache=<? echo $noCache ?>" menu=false quality=high bgcolor=#FFFFFF  width=420 height=200 type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed>
</object>
</body>
</html>

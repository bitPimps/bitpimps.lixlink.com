<?php
include("secured/config/phpConfig.php");
include("secured/phpinclude/common_db.php");
include("secured/phpinclude/classes/MetaData.php");


// Connect to Database
$dbConn = connectBitPimpsDb($dbHost, $dbUsername, $dbPassword);

// Get Meta Info
$metaData = new MetaData("");
$metaData = $metaData->getMetaData($dbConn);

// Close DB Connection
mysql_close($dbConn);

include("pages/includes/php_random_img.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title><? echo $metaData->getTitle() ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="bitPimps.com" />
	<meta name="keywords" content="<? echo $metaData->getKeywords() ?>" />
	<meta name="description" content="<? echo $metaData->getDescription() ?>" />
	<meta name="MSSmartTagsPreventParsing" content="TRUE" />
	<meta http-equiv="imagetoolbar" content="no" />
	<link rel="stylesheet" href="stylesheets/bp_public.css" type="text/css" />
	<style type="text/css">
	<!--
	.bgPage	{	background-image:  url(images/backgrounds/bg_pattern.gif); background-repeat: repeat; }
	.bgHomeSub	{ background-image: url(images/backgrounds/home_sub.jpg); background-repeat: repeat-y; }
	-->
	</style>
	<script language="JavaScript" type="text/javascript" src="javascript/image_preload_swap.js"></script>
	<script language="JavaScript" type="text/javascript" src="javascript/window_open.js"></script>
</head>

<body class="bgPage" onload="MM_preloadImages('images/buttons/articles_over.gif','images/buttons/galleries_over.gif','images/buttons/forums_over.gif','images/buttons/links_over.gif','images/buttons/members_over.gif')">
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="73" name="shim" alt="" /></td>
		<td width="177"><a href="index.php" tabindex="1"><img src="images/logo/bitpimps.jpg" width="177" height="73" name="logoBitPimps" alt="bitPimps - Custom Modifications" border="0" /></a></td>
		<td width="121"><img src="images/logo/bg_mid.jpg" width="121" height="73" name="bgMid" alt="" /></td>
		<td>
			<!-- Main Navigation -->
			<table width="418" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="6"><img src="images/logo/bg_top.jpg" alt="" name="bgTop" width="418" height="49" border="0" usemap="#pimpRadio" /></td>
					<td class="bgBlack"><img src="images/shim.gif" width="2" height="49" name="shim" alt="" /></td>
				</tr>
				<tr>
					<td><a href="index.php" tabindex="2"><img src="images/buttons/home_on.gif" width="60" height="24" name="btnHome" alt="Home" border="0" /></a></td>
					<td><a href="pages/articles/index.php" tabindex="3" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnArticles','','images/buttons/articles_over.gif',1)" onfocus="MM_swapImage('btnArticles','','images/buttons/articles_over.gif',1)"><img src="images/buttons/articles_off.gif" width="71" height="24" name="btnArticles" alt="Articles" border="0" /></a></td>
					<td><a href="pages/galleries/index.php" tabindex="4" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)" onfocus="MM_swapImage('btnGalleries','','images/buttons/galleries_over.gif',1)"><img src="images/buttons/galleries_off.gif" width="77" height="24" name="btnGalleries" alt="Galleries" border="0" /></a></td>
					<td><a href="pages/phpForum/index.php" tabindex="5" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)" onfocus="MM_swapImage('btnForums','','images/buttons/forums_over.gif',1)"><img src="images/buttons/forums_off.gif" width="71" height="24" name="btnForums" alt="Forums" border="0" /></a></td>
					<td><a href="pages/links/index.php" tabindex="6" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)" onfocus="MM_swapImage('btnLinks','','images/buttons/links_over.gif',1)"><img src="images/buttons/links_off.gif" width="60" height="24" name="btnLinks" alt="Links" border="0" /></a></td>
					<td><a href="pages/unused/members/index.php" tabindex="7" onmouseout="MM_swapImgRestore()" onblur="MM_swapImgRestore()" onmouseover="MM_swapImage('btnMembers','','images/buttons/members_over.gif',1)" onfocus="MM_swapImage('btnMembers','','images/buttons/members_over.gif',1)"><img src="images/buttons/members_off.gif" width="79" height="24" name="btnMembers" alt="Members" border="0" /></a></td>
					<td class="bgBlack"><img src="images/shim.gif" width="2" height="24" name="shim" alt="" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td colspan="3" class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" height="25" class="bgGreenB"><img src="images/headers/home/word_moms.gif" alt="Word To Mom's" name="headA" width="193" height="25" id="headA" /></td>
		<td width="15" height="25" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="491" rowspan="2" valign="top" class="bgBlack"><img src="images/page_images/491x173/<? echo $imgName ?>.jpg" width="491" height="173" name="pageImage" alt="" /></td>
		<td width="2" rowspan="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="15" height="148" class="bgGreenA"><img src="images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
		<td width="193" height="148" class="bgGreenA" valign="top">
			<p class="text"><br />
				<strong>Optimize your images:</strong><br />
				Crop the picture so we only see the subject and not the keyboard and coke can in the background. Resize the image to appropriate dimensions.<br /><br />
				Read more below on the right.</p></td>
		<td width="15" height="148" class="bgGreenA"><img src="images/shim.gif" width="15" height="148" name="shim" alt="" /></td>
	</tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td class="bgBlack"><img src="images/shim.gif" width="720" height="2" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Body -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="210" class="bgOrangeB"><img src="images/headers/home/latest_news.gif" alt="Latest News" name="headB" width="210" height="25" id="headB" /></td>
		<td width="251" class="bgOrangeB"><img src="images/shim.gif" width="251" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgOrangeB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenB"><img src="images/headers/home/announcements.gif" alt="Announcements" name="headC" width="193" height="25" id="headC" /></td>
		<td width="15" class="bgGreenB"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" valign="top" class="bgGrey">
			<?php

require("fileupload-class.php");

#--------------------------------#
# Variables
#--------------------------------#

// The path to the directory where you want the 
// uploaded files to be saved. This MUST end with a 
// trailing slash unless you use $path = ""; to 
// upload to the current directory. Whatever directory
// you choose, please chmod 777 that directory.

	$path = "user_uploads/";

// The name of the file field in your form.

	$upload_file_name = "userfile";

// ACCEPT mode - if you only want to accept
// a certain type of file.
// possible file types that PHP recognizes includes:
//
// OPTIONS INCLUDE:
//  text/plain
//  image/gif
//  image/jpeg
//  image/png
	
	// Accept ONLY gifs's
	#$acceptable_file_types = "image/gifs";
	
	// Accept GIF and JPEG files
	$acceptable_file_types = "image/gif|image/jpeg|image/pjpeg";
	
	// Accept ALL files
	#$acceptable_file_types = "";

// If no extension is supplied, and the browser or PHP
// can not figure out what type of file it is, you can
// add a default extension - like ".jpg" or ".txt"

	$default_extension = "";

// MODE: if your are attempting to upload
// a file with the same name as another file in the
// $path directory
//
// OPTIONS:
//   1 = overwrite mode
//   2 = create new with incremental extention
//   3 = do nothing if exists, highest protection

	$mode = 2;
	
	
#--------------------------------#
# PHP
#--------------------------------#
	if (isset($_REQUEST['submitted'])) {
		/* 
			A simpler way of handling the submitted upload form
			might look like this:
			
			$my_uploader = new uploader('en'); // errors in English
	
			$my_uploader->max_filesize(30000);
			$my_uploader->max_image_size(800, 800);
			$my_uploader->upload('userfile', 'image/gif', '.gif');
			$my_uploader->save_file('uploads/', 2);
			
			if ($my_uploader->error) {
				print($my_uploader->error . "<br><br>\n");
			} else {
				print("Thanks for uploading " . $my_uploader->file['name'] . "<br><br>\n");
			}
		*/
			
		// Create a new instance of the class
		$my_uploader = new uploader($_POST['language']); // for error messages in french, try: uploader('fr');
		
		// OPTIONAL: set the max filesize of uploadable files in bytes
		$my_uploader->max_filesize(80000); // 80 kb
		
		// OPTIONAL: if you're uploading images, you can set the max pixel dimensions 
		$my_uploader->max_image_size(500, 500); // max_image_size($width, $height)
		
		// UPLOAD the file
		if ($my_uploader->upload($upload_file_name, $acceptable_file_types, $default_extension)) {
			$my_uploader->save_file($path, $mode);
		}
		
		if ($my_uploader->error) {
			echo $my_uploader->error . "<br /><br />\n";
		
		} else {
			// Successful upload!
			print"<p class=\"text\">" .($my_uploader->file['name'] . " was successfully uploaded!<br /><br />Here's the link for you to use:<br /><strong>http://bitpimps.lixlink.com/user_uploads/" . $my_uploader->file['name'] . "</strong><br /><br /><a href=\"" . $_SERVER['PHP_SELF'] . "\">Try Again</a></p>");
			
			// Print all the array details...
			//print_r($my_uploader->file);
			
			// ...or print the file
			if(stristr($my_uploader->file['type'], "image")) {
				echo "<img src=\"" . $path . $my_uploader->file['name'] . "\" border=\"0\" alt=\"\"><br /><br />";
			} else {
				$fp = fopen($path . $my_uploader->file['name'], "r");
				while(!feof($fp)) {
					$line = fgets($fp, 255);
					echo $line;
				}
				if ($fp) { fclose($fp); }
			}
 		}
 	}




#--------------------------------#
# HTML FORM
#--------------------------------#
?>
	<p class="text"><strong>Image files only!</strong><br /><br />
	<strong>Follow these simple rules, all others will be deleted without warning:</strong><br />
	<strong>1.)</strong> Only contestants entering the contest may upload images.<br />
	<strong>2.)</strong> Only 2 images per contestant is allowed.<br />
	<strong>3.)</strong> Both uploaded images must be your contest entry.<br />
	<strong>4.)</strong> One of your contest entries must have "bitPimps" and your "username", <strong>hand written</strong> on a piece of paper, in the same shot as your contest entry.<br />
	<strong>5.)</strong> Images uploaded here are for the contest only.<br />
	<strong>6.)</strong> Maximum image width and height are 500 pixels. (500 x 500)<br />
	<strong>7.)</strong> Maximum image file size is 80 Kb.</p>
	<form enctype="multipart/form-data" action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
	<input type="hidden" name="submitted" value="true">
		
		<span class="text">Upload this file:</span><br />
		<input name="<?= $upload_file_name; ?>" type="file">
		<br /><br />
		
		<span class="text">Error Messages:</span><br />
		<select name="language">
			<option value="en">English</option>
			<option value="fr">French</option>
			<option value="de">German</option>
			<option value="nl">Dutch</option>
			<option value="it">Italian</option>
		</select>
		<br /><br />
		
		<input type="submit" value="Upload File">
	</form>

<?php
	if (isset($acceptable_file_types) && trim($acceptable_file_types)) {
		print("<p class=\"text\">This form only accepts <strong>" . str_replace("|", " or ", $acceptable_file_types) . "</strong> files</p>\n");
	}
?>
		</td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" valign="top" class="bgHomeSub">
			<p class="text">
				<strong>How can you optimize your images to keep file sizes down?</strong><br />
				The maximum file size allowed by this form is 80 Kb - that's plenty, you should be aiming for no more than 50 Kb if you have optimized correctly.</p>
			<p class="text">
				Follow these few simple steps to ensure you have optimized your image:</p>
			<p class="text">
				<strong>Crop the image:</strong><br />
				Crop the image so we only see the subject. We don't need to see the surrounding area.</p>
			<p class="text">
				<strong>Resize the image:</strong><br />
				Resize your image, nobody likes an image so big you have to scroll to see it. Besides, the maximum width and height the form allows for is 500 pixels width x 500 pixels height. Usually 200 - 400 pixels width and height is the best option to help decrease file sizes.</p>
			<p class="text">
				<strong>Save the image:</strong><br />
				Many applications allow you to export images optimized for the Internet, use one - it will save you a lot of file size.</p>
		</td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="461" colspan="2" class="bgGrey"><img src="images/shim.gif" width="461" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGrey"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="193" class="bgGreenA"><img src="images/shim.gif" width="193" height="25" name="shim" alt="" /></td>
		<td width="15" class="bgGreenA"><img src="images/shim.gif" width="15" height="25" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<!-- Copyright -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlack"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueA"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
		<td width="716" class="bgBlueB"><img src="images/shim.gif" width="716" height="2" name="shim" alt="" /></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="2" name="shim" alt="" /></td>
	</tr>
	<tr class="decoration">
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
		<td width="716" align="center" class="bgBlack"><span class="copyright">Copyright &copy; 2002 - 2003 | All rights resereved by penalty of: death, cappin', blastin', sprayin', etc.</span></td>
		<td width="2" class="bgBlack"><img src="images/shim.gif" width="2" height="25" name="shim" alt="" /></td>
	</tr>
</table>
<map name="pimpRadio" id="pimpRadio">
  <area shape="rect" coords="208,2,417,48" href="javascript:;" alt="bitPimps Radio - click to listen!" onclick="MM_openBrWindow('http://bitpimps.lixlink.com/pimpbox/pimpbox.php','pimpRadio','width=440,height=220')" />
</map>
</body>
</html>

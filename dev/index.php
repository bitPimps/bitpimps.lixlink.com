<?php
// Metadata
$metaUrl = "https://bitPimps.lixlink.com";
$metaTitle = "bitPimps Custom Modifications :: Doin' It To Your Momma's Chassis!";
$metaDescription = "bitPimps.lixlink.com offers the best entertainment, tutorials, modifications, information, etc. on all things related to Bit-Char G and similar R/C hobbies";
?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><?php echo $metaTitle ?></title>
		<meta name="description" content="<?php echo $metaDescription ?>">
		<?php include_once("inc/meta-data.php"); ?>
		<link rel="stylesheet" href="css/home.css" />
		<!-- Schema.org markup for Google+ -->
		<meta itemprop="name" content="<?php echo $metaTitle ?>" />
		<meta itemprop="description" content="<?php echo $metaDescription ?>" />
		<meta itemprop="image" content="<?php echo $metaUrl ?>/tile.png" />
		<!-- Twitter Card data -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@bitpimps" />
		<meta name="twitter:title" content="<?php echo $metaTitle ?>" />
		<meta name="twitter:description" content="<?php echo $metaDescription ?>" />
		<meta name="twitter:image" content="<?php echo $metaUrl ?>/tile.png" />
		<!-- Open Graph data -->
		<meta property="og:title" content="<?php echo $metaTitle ?>" />
		<meta property="og:type" content="article" />
		<meta property="og:url" content="<?php echo $metaUrl ?>/" />
		<meta property="og:image" content="<?php echo $metaUrl ?>/tile.png" />
		<meta property="og:description" content="<?php echo $metaDescription ?>" />
		<meta property="og:site_name" content="<?php echo $metaTitle ?>" />
	</head>
	<body>
		<header>
		</header>
		<main role="main">
		</main>
		<?php include_once("inc/footer.php"); ?>
	</body>
</html>

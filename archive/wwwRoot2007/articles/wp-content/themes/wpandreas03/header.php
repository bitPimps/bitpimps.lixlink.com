<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php bloginfo('name'); ?> <?php if ( is_single() ) { ?> &raquo; Blog Archive <?php } ?> <?php wp_title(); ?></title>

<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" /> <!-- leave this for stats -->
<meta name="description" content="WPAndreas03 - A Betaflow (http://www.betaflow.com/) Wordpress Theme; Original Design: Andreas Viklund" />
<meta name="keywords" content="wordpress, template, theme, blog template, blog" />

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="alternate" type="text/xml" title="RSS .92" href="<?php bloginfo('rss_url'); ?>" />
<link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="<?php bloginfo('atom_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<style type="text/css" media="screen">
	To accomodate differing install paths of WordPress, images are referred only here,
	and not in the wp-layout.css file. If you prefer to use only CSS for colors and what
	not, then go right ahead and delete the following lines, and the image files.
		
	body { background:#047 url("<?php bloginfo('stylesheet_directory'); ?>/img/bodybg.png)" repeat-x fixed; }
    #container { background:#fff url("<?php bloginfo('stylesheet_directory'); ?>/img/contbg.png)" no-repeat; }
	#main { background:#fff url("<?php bloginfo('stylesheet_directory'); ?>/img/contbg.png)" no-repeat; }
	#footer { background:#fff url("<?php bloginfo('stylesheet_directory'); ?>/img/footerbg.png)" bottom left no-repeat; }
	.headerstyle { background:#eee url("<?php bloginfo('stylesheet_directory'); ?>/img/gradient2.png)" repeat-x; }
	.headerstyle a { background:#eee url("<?php bloginfo('stylesheet_directory'); ?>/img/gradient2.png)" repeat-x; }
	.sidelink { background:#eee url("<?php bloginfo('stylesheet_directory'); ?>/img/gradient1.png)" repeat-x; }
	.sidelink:hover,.menuheader { background:#fff url("<?php bloginfo('stylesheet_directory'); ?>/img/gradient2.png)" repeat-x; } 
</style>

<?php wp_get_archives('type=monthly&format=link'); ?>

<?php wp_head(); ?>
</head>
<body>

<div id="thetop">
	<a id="top"></a>
	<p class="hide">Skip to: <a href="#sitemenu" accesskey="2">Site menu</a> | <a href="#maincontent" accesskey="3">Main content</a></p>
</div>

<div id="container">
	<div id="main">
		<div id="logo">
			<h1>[<a href="<?php echo get_settings('home'); ?>" accesskey="4"><?php bloginfo('name'); ?></a>]</h1>
			<span id="tagline"><?php bloginfo('description'); ?></span>
		</div>

		<div id="intro">
			<a id="maincontent"></a>
			<!-- 
			<script type="text/javascript">
google_ad_client = "pub-3199482735201520";
google_alternate_color = "FFFFFF";
google_ad_width = 234;
google_ad_height = 60;
google_ad_format = "234x60_as";
google_ad_type = "text_image";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "2266CC";
google_color_url = "2266CC";
google_color_text = "222222";
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><br />&nbsp;<br /><script type="text/javascript"><!--
google_ad_client = "pub-3199482735201520";
google_alternate_color = "FFFFFF";
google_ad_width = 234;
google_ad_height = 60;
google_ad_format = "234x60_as";
google_ad_type = "text_image";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "2266CC";
google_color_url = "2266CC";
google_color_text = "222222";
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>//-->
		</div>

		<div class="clear"></div>
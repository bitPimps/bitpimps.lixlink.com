<?php
if($username == "CaboWabo")
{
	$newsLink = "<a href=\"news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "<a href=\"links/index.php\">&raquo; Links</a> | ";
	$metaLink = "<a href=\"metadata/index.php\">&raquo; MetaData</a> | ";
	$forumLink = "<a href=\"../pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "<a href=\"http:\/\/webmail.lixlink.com/horde/\" target=\"_blank\">&raquo; Check Email</a> | ";
	$pleskLink = "<a href=\"https:\/\/admin.lixlink.com:8443\" target=\"_blank\">&raquo; Plesk</a> | ";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
elseif($username == "XXXX")
{
	$newsLink = "<a href=\"news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "<a href=\"links/index.php\">&raquo; Links</a> | ";
	$metaLink = "<a href=\"metadata/index.php\">&raquo; MetaData</a> | ";
	$forumLink = "<a href=\"../pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
elseif($username == "crazydave")
{
	$newsLink = "<a href=\"news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "";
	$metaLink = "";
	$forumLink = "<a href=\"../pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
elseif($username == "XXX")
{
	$newsLink = "<a href=\"news/index.php\">&raquo; News</a> | ";
	$articlesLink = "";
	$linksLink = "";
	$metaLink = "";
	$forumLink = "<a href=\"../pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
elseif($username == "XX")
{
	$newsLink = "";
	$articlesLink = "<a href=\"articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "";
	$metaLink = "";
	$forumLink = "<a href=\"../pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
else
{
	$newsLink = "";
	$articlesLink = "";
	$linksLink = "";
	$metaLink = "";
	$forumLink = "";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"index.php\">&raquo; Logout</a>";
}
?>
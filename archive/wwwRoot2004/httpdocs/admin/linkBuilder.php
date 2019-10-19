<?php
if($_SESSION['rk'] == "1")
{
	$newsLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/links/index.php\">&raquo; Links</a> | ";
	$metaLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/metadata/index.php\">&raquo; MetaData</a> | ";
	$usersLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/users/index.php\">&raquo; Users</a> | ";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "<a href=\"http:\/webmail.lixlink.com/horde/\" target=\"_blank\">&raquo; Check Email</a> | ";
	$pleskLink = "<a href=\"https:\/admin.lixlink.com:8443\" target=\"_blank\">&raquo; Plesk</a> | ";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
elseif($_SESSION['rk'] == "XXXX")
{
	$newsLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/links/index.php\">&raquo; Links</a> | ";
	$metaLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/metadata/index.php\">&raquo; MetaData</a> | ";
	$usersLink	= "";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
elseif($_SESSION['rk'] == "3")
{
	$newsLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/news/index.php\">&raquo; News</a> | ";
	$articlesLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "";
	$metaLink = "";
	$usersLink	= "";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
elseif($_SESSION['rk'] == "4")
{
	$newsLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/news/index.php\">&raquo; News</a> | ";
	$articlesLink = "";
	$linksLink = "";
	$metaLink = "";
	$usersLink	= "";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
elseif($_SESSION['rk'] == "5")
{
	$newsLink = "";
	$articlesLink = "<a href=\"http:\/bitpimps.lixlink.com/admin/articles/index.php\">&raquo; Articles</a> | ";
	$linksLink = "";
	$metaLink = "";
	$usersLink	= "";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
elseif($_SESSION['rk'] == "6")
{
	$newsLink = "";
	$articlesLink = "";
	$linksLink = "";
	$metaLink = "";
	$usersLink	= "";
	$uploadLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/upload/index.php\">&raquo; Upload Images</a> | ";
	$forumLink = "<a href=\"http:\/bitpimps.lixlink.com/pages/phpForum/\">&raquo; Forums</a> | ";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "<a href=\"http:\/bitpimps.lixlink.com/admin/index.php\">&raquo; Logout</a>";
}
else
{
	$newsLink = "";
	$articlesLink = "";
	$linksLink = "";
	$metaLink = "";
	$usersLink	= "";
	$uploadLink	= "";
	$forumLink = "";
	$mailLink = "";
	$pleskLink = "";
	$logoutLink	= "";
}
?>
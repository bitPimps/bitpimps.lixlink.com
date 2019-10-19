<?php
// Please, note that all changes in this file will be lost
// after reconfiguring application by Plesk
	define('HTTP_SERVER', 'http://bitpimps.lixlink.com');
	define('HTTP_CATALOG_SERVER', 'http://bitpimps.lixlink.com');
	define('HTTPS_CATALOG_SERVER', 'http://bitpimps.lixlink.com');
	define('ENABLE_SSL_CATALOG', 'false');
	define('DIR_FS_DOCUMENT_ROOT', '/home/httpd/vhosts/lixlink.com/subdomains/bitpimps/httpdocs');
	define('DIR_WS_ADMIN', '/shop/admin/');
	define('DIR_FS_ADMIN', '/home/httpd/vhosts/lixlink.com/subdomains/bitpimps/httpdocs/shop/admin');
	define('DIR_WS_CATALOG', '/shop/');
	define('DIR_FS_CATALOG', '/home/httpd/vhosts/lixlink.com/subdomains/bitpimps/httpdocs/shop/');
	define('DIR_WS_IMAGES', 'images/');
	define('DIR_WS_ICONS', DIR_WS_IMAGES . 'icons/');
	define('DIR_WS_CATALOG_IMAGES', DIR_WS_CATALOG . 'images/');
	define('DIR_WS_INCLUDES', 'includes/');
	define('DIR_WS_BOXES', DIR_WS_INCLUDES . 'boxes/');
	define('DIR_WS_FUNCTIONS', DIR_WS_INCLUDES . 'functions/');
	define('DIR_WS_CLASSES', DIR_WS_INCLUDES . 'classes/');
	define('DIR_WS_MODULES', DIR_WS_INCLUDES . 'modules/');
	define('DIR_WS_LANGUAGES', DIR_WS_INCLUDES . 'languages/');
	define('DIR_WS_CATALOG_LANGUAGES', DIR_WS_CATALOG . 'includes/languages/');
	define('DIR_FS_CATALOG_LANGUAGES', DIR_FS_CATALOG . 'includes/languages/');
	define('DIR_FS_CATALOG_IMAGES', DIR_FS_CATALOG . 'images/');
	define('DIR_FS_CATALOG_MODULES', DIR_FS_CATALOG . 'includes/modules/');
	define('DIR_FS_BACKUP', DIR_FS_ADMIN . 'backups/');

// define our database connection
	
	define('DB_SERVER', 'localhost');
	define('DB_SERVER_USERNAME', 'lixsql3');
	define('DB_SERVER_PASSWORD', 'li87dn3');
	define('DB_DATABASE', 'lixlink3');
	define('USE_PCONNECT', 'false');
	define('STORE_SESSIONS', 'mysql');
?>

<?php
// Please, note that all changes in this file will be lost
// after reconfiguring application by Plesk
	define('HTTP_SERVER', 'http://bitpimps.lixlink.com');
	define('HTTPS_SERVER', 'http://bitpimps.lixlink.com');
	define('ENABLE_SSL', 'false');
	define('HTTP_COOKIE_DOMAIN', 'http://bitpimps.lixlink.com');
	define('HTTPS_COOKIE_DOMAIN', 'http://bitpimps.lixlink.com');
	define('HTTP_COOKIE_PATH', '/shop/');
	define('DIR_WS_HTTP_CATALOG', '/shop/');
	define('DIR_WS_HTTPS_CATALOG', '/shop/');
	define('DIR_WS_IMAGES', 'images/');
	define('DIR_WS_ICONS', DIR_WS_IMAGES . 'icons/');
	define('DIR_WS_INCLUDES', 'includes/');
	define('DIR_WS_BOXES', DIR_WS_INCLUDES . 'boxes/');
	define('DIR_WS_FUNCTIONS', DIR_WS_INCLUDES . 'functions/');
	define('DIR_WS_CLASSES', DIR_WS_INCLUDES . 'classes/');
	define('DIR_WS_MODULES', DIR_WS_INCLUDES . 'modules/');
	define('DIR_WS_LANGUAGES', DIR_WS_INCLUDES . 'languages/');

	define('DIR_WS_DOWNLOAD_PUBLIC', 'pub/');
	define('DIR_FS_CATALOG', dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']));
	define('DIR_FS_DOWNLOAD', DIR_FS_CATALOG . 'download/');
	define('DIR_FS_DOWNLOAD_PUBLIC', DIR_FS_CATALOG . 'pub/');

// define our database connection
	
	define('DB_SERVER', 'localhost');
	define('DB_SERVER_USERNAME', 'lixsql3');
	define('DB_SERVER_PASSWORD', 'li87dn3');
	define('DB_DATABASE', 'lixlink3');
	define('USE_PCONNECT', 'false');
	define('STORE_SESSIONS', 'mysql');
?>

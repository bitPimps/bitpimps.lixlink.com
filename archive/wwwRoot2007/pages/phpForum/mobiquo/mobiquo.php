<?php
/*======================================================================*\
|| #################################################################### ||
|| # Copyright &copy;2009 Quoord Systems Ltd. All Rights Reserved.    # ||
|| # This file may not be redistributed in whole or significant part. # ||
|| # This file is part of the Tapatalk package and should not be used # ||
|| # and distributed for any other purpose that is not approved by    # ||
|| # Quoord Systems Ltd.                                              # ||
|| # http://www.tapatalk.com | http://www.tapatalk.com/license.html   # ||
|| #################################################################### ||
\*======================================================================*/

define('IN_PHPBB', true);
define('IN_MOBIQUO', true);

require('./config/config.php');
$mobiquo_config = get_mobiquo_config();
$phpEx = $mobiquo_config['php_extension'];

$phpbb_root_path = '../';
include($phpbb_root_path . 'common.' . $phpEx);
include($phpbb_root_path . 'includes/functions_display.' . $phpEx);

// Start session management
$user->session_begin();
$auth->acl($user->data);
$user->setup('viewforum');

if($user->data['is_registered'])
{
    header('Mobiquo_is_login:true');
} else {
    header('Mobiquo_is_login:false');
}

if ($user->data['user_new_privmsg'])
{
    include_once($phpbb_root_path . 'includes/functions_privmsgs.' . $phpEx);
    place_pm_into_folder($global_privmsgs_rules);
}

include('./include/xmlrpc.inc');
include('./include/xmlrpcs.inc');

require('./error_code.php');
require('./mobiquo_common.php');
require('./server_define.php');

error_reporting(0);

$phpbb_home = generate_board_url().'/';
$request_method_name = get_method_name();
if ($request_method_name)
{
    require('./function/'.trim($request_method_name).'.php');
}

ob_get_clean();
$rpcServer = new xmlrpc_server($server_param, false);
$rpcServer->setDebug(1);
$rpcServer->compress_response = 'true';
$rpcServer->response_charset_encoding = 'UTF-8'; 

$response = $rpcServer->service();

?>
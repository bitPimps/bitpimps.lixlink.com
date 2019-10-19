<?php

defined('IN_MOBIQUO') or exit;

function get_config_func() 
{    
    global $mobiquo_config, $config;
    
    $config_list = array(
        'version'    => new xmlrpcval($mobiquo_config['version']),
        'is_open'    => new xmlrpcval($mobiquo_config['is_open'] ? true : false, 'boolean'),
        'guest_okay' => new xmlrpcval($mobiquo_config['guest_okay'] ? true : false, 'boolean'),
        'reg_url'    => new xmlrpcval($mobiquo_config['reg_url']),
        'forum_name' => new xmlrpcval($config['sitename'], 'base64'),
        'forum_description' => new xmlrpcval($config['site_desc'], 'base64')
    );
    
    $response = new xmlrpcval($config_list, 'struct');
    
    return new xmlrpcresp($response);
} // End of get_config_func

?>
<?php

defined('IN_MOBIQUO') or exit;

function get_user_info_func($xmlrpc_params)
{
    global $db, $user, $auth;
    
    $params = php_xmlrpc_decode($xmlrpc_params);
    $username = $params[0];
    
    // Can this user view profiles/memberlist?
    if (!$auth->acl_gets('u_viewprofile', 'a_user', 'a_useradd', 'a_userdel'))
    {
        return get_error(2);
    }
    
    $sql = 'SELECT user_id, 
                   username,
                   user_posts,
                   user_regdate, 
                   user_avatar,
                   user_avatar_type,
        		   user_lastpost_time
            FROM ' . USERS_TABLE . "
            WHERE username_clean = '" . $db->sql_escape(utf8_clean_string($username)) . "'";

    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $db->sql_freeresult($result);

    if (!$row)
    {
        return get_error(8);
    }
    
    $user_avatar_url = get_user_avatar_url($row['user_avatar'], $row['user_avatar_type']);

    $xmlrpc_user_info = new xmlrpcval(array(
        'user_id'       => new xmlrpcval($row['user_id']),
        'user_name'     => new xmlrpcval(html_entity_decode($row['username']), 'base64'),
        'reg_time'      => new xmlrpcval(mobiquo_iso8601_encode($row['user_regdate']), 'dateTime.iso8601'),
        'post_count'    => new xmlrpcval($row['user_posts'], 'int'),
        'icon_url'      => new xmlrpcval($user_avatar_url),
        'thread_sort_order' => new xmlrpcval(empty($user->data['user_post_sortby_dir']) ? 'ASC' : $user->data['user_post_sortby_dir']),
        'lastactivity_time' => new xmlrpcval(mobiquo_iso8601_encode($row['user_lastpost_time']), 'dateTime.iso8601'),
    ), 'struct');

    return new xmlrpcresp($xmlrpc_user_info);
} // End of get_user_info_func
    
?>
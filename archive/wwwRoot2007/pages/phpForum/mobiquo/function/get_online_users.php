<?php

defined('IN_MOBIQUO') or exit;

function get_online_users_func() 
{    
    global $db, $auth;
    
    // Can this user view profiles/memberlist?
    if (!$auth->acl_gets('u_viewprofile', 'a_user', 'a_useradd', 'a_userdel'))
    {
        return get_error(2);
    }
    
    $online_info = obtain_users_online();
    $online_user_ids = array_keys($online_info['online_users']);
    $hidden_user_ids = array_keys($online_info['hidden_users']);
    $visible_user_ids =  array_diff_assoc($online_user_ids, $hidden_user_ids);
    
    $user_list = array();
    if (count($visible_user_ids))
    {
        $sql = 'SELECT username, user_avatar, user_avatar_type
                FROM ' . USERS_TABLE . '
                WHERE ' . $db->sql_in_set('user_id', $visible_user_ids) . '
                AND user_type IN (' . USER_NORMAL . ', ' . USER_FOUNDER . ')';
        $result = $db->sql_query($sql);
        
        while($row = $db->sql_fetchrow($result))
        {
            $user_avatar_url = '';
            if (count($visible_user_ids) < 100)
            {
                $user_avatar_url = get_user_avatar_url($row['user_avatar'], $row['user_avatar_type']);
            }
            $user_list[] = new xmlrpcval(array(
                'user_name' => new xmlrpcval($row['username'], 'base64'),
                'icon_url'  => new xmlrpcval($user_avatar_url)
            ), 'struct');
        }        
        $db->sql_freeresult($result);
    }
    
    $online_users = array(
        'member_count' => new xmlrpcval($online_info['total_online'] - $online_info['guests_online'], 'int'),
        'guest_count'  => new xmlrpcval($online_info['guests_online'], 'int'),
        'list'         => new xmlrpcval($user_list, 'array')
    );
    
    $response = new xmlrpcval($online_users, 'struct');

    return new xmlrpcresp($response);
} // End of get_online_users_func

?>
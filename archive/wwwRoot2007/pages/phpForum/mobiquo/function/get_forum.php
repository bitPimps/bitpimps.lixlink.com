<?php

defined('IN_MOBIQUO') or exit;

function get_forum_func()
{
    global $db, $auth, $user, $mobiquo_config, $phpbb_home;
    
    $unread = array();
//    if ($user->data['is_registered'])
//    {    
//        $ex_fid_ary = array_unique(array_merge(array_keys($auth->acl_getf('!f_read', true)), array_keys($auth->acl_getf('!f_search', true))));
//        $not_in_fid = (sizeof($ex_fid_ary)) ? 'WHERE ' . $db->sql_in_set('f.forum_id', $ex_fid_ary, true) . " OR (f.forum_password <> '' AND fa.user_id <> " . (int) $user->data['user_id'] . ')' : "";
//        
//        $sql = 'SELECT f.forum_id, f.forum_name, f.parent_id, f.forum_type, f.right_id, f.forum_password, fa.user_id
//                FROM ' . FORUMS_TABLE . ' f
//                LEFT JOIN ' . FORUMS_ACCESS_TABLE . " fa ON (fa.forum_id = f.forum_id
//                AND fa.session_id = '" . $db->sql_escape($user->session_id) . "')
//                $not_in_fid
//                ORDER BY f.left_id";
//        $result = $db->sql_query($sql);
//        
//        while ($row = $db->sql_fetchrow($result))
//        {
//            if ($row['forum_password'] && $row['user_id'] != $user->data['user_id'])
//            {
//                $ex_fid_ary[] = (int) $row['forum_id'];
//                continue;
//            }
//        }
//        $db->sql_freeresult($result);
//    
//        // find out in which forums the user is allowed to view approved posts
//        if ($auth->acl_get('m_approve'))
//        {
//            $m_approve_fid_sql = '';
//        }
//        else if ($auth->acl_getf_global('m_approve'))
//        {
//            $m_approve_fid_ary = array_diff(array_keys($auth->acl_getf('!m_approve', true)), $ex_fid_ary);
//            $m_approve_fid_sql = ' AND (t.topic_approved = 1' . ((sizeof($m_approve_fid_ary)) ? ' OR ' . $db->sql_in_set('t.forum_id', $m_approve_fid_ary, true) : '') . ')';
//        }
//        else
//        {
//            $m_approve_fid_sql = ' AND t.topic_approved = 1';
//        }
//    
//        $sql = 'SELECT t.topic_id, t.forum_id, t.topic_last_post_time FROM ' . TOPICS_TABLE . ' t
//                WHERE t.topic_last_post_time > ' . $user->data['user_lastvisit'] . '
//                AND t.topic_moved_id = 0 ' . $m_approve_fid_sql .
//                ((sizeof($ex_fid_ary)) ? ' AND ' . $db->sql_in_set('t.forum_id', $ex_fid_ary, true) : '');
//        $result = $db->sql_query($sql);
//        
//        while ($row = $db->sql_fetchrow($result))
//        {
//            $topic_id = $row['topic_id'];
//            $forum_id = $row['forum_id'];
//            $topic_tracking = get_complete_topic_tracking($forum_id, $topic_id);
//            if ($topic_tracking[$topic_id] < $row['topic_last_post_time'])
//            {
//                $unread[$forum_id] += 1;
//            }
//        }
//        $db->sql_freeresult($result);
//    }
    
    $sql = 'SELECT *
            FROM ' . FORUMS_TABLE . '
            ORDER BY left_id ASC';
    $result = $db->sql_query($sql, 600);
    
    $forum_rows = array();
    $forum_rows[0] = array('forum_id' => 0, 'parent_id' => -1, 'child' => array());
    while ($row = $db->sql_fetchrow($result))
    {
        $forum_id = $row['forum_id'];
        
        if ($row['forum_type'] == FORUM_CAT && ($row['left_id'] + 1 == $row['right_id']))
        {
            // Non-postable forum with no subforums, don't display
            continue;
        }

        // Skip branch
        if (isset($right_id))
        {
            if ($row['left_id'] < $right_id)
            {
                continue;
            }
            unset($right_id);
        }

        if (!$auth->acl_get('f_list', $forum_id) || (isset($mobiquo_config['hide_forum_id']) && in_array($forum_id, $mobiquo_config['hide_forum_id'])))
        {
            // if the user does not have permissions to list this forum, skip everything until next branch
            $right_id = $row['right_id'];
            continue;
        }

        $forum_rows[$forum_id] = $row;
    }
    $db->sql_freeresult($result);


    $forum_rows[0] = array('parent_id' => -1, 'child' => array());
    while(count($forum_rows) > 1)
    {
        $current_parent_id = -1;
        $leaves_forum = array();
        foreach($forum_rows as $row)
        {            
            $row_parent_id = $row['parent_id'];
    
            if ($row_parent_id != $current_parent_id)
            {
                if(isset($leaves_forum[$row_parent_id]))
                {
                    $leaves_forum[$row_parent_id] = array();
                }
                else
                {
                    if(isset($leaves_forum[$forum_rows[$row_parent_id]['parent_id']]))
                    {
                        $leaves_forum[$forum_rows[$row_parent_id]['parent_id']] = array();
                    }
                    $leaves_forum[$row_parent_id][] = $row['forum_id'];
                }
                $current_parent_id = $row_parent_id;
            }
            else if ($row_parent_id == $current_parent_id)
            {
                if(!empty($leaves_forum[$row_parent_id]))
                {
                    $leaves_forum[$row_parent_id][] = $row['forum_id'];
                }
            }
        }
        
        foreach($leaves_forum as $node_forum_id => $leaves)
        {
            foreach($leaves as $forum_id)
            {
                $logo_url = '';
                if (file_exists("./forum_icons/$forum_id.png"))
                {
                    $logo_url = $phpbb_home."mobiquo/forum_icons/$forum_id.png";
                }
                else if (file_exists("./forum_icons/$forum_id.jpg"))
                {
                    $logo_url = $phpbb_home."mobiquo/forum_icons/$forum_id.jpg";
                }
                else if (file_exists("./forum_icons/default.png"))
                {
                    $logo_url = $phpbb_home."mobiquo/forum_icons/default.png";
                }
                else if ($forum_rows[$forum_id]['forum_image'])
                {
                    $logo_url = $phpbb_home.$forum_rows[$forum_id]['forum_image'];
                }
                
                $xmlrpc_forum = new xmlrpcval(array(
                    'forum_id'      => new xmlrpcval($forum_id),
                    'forum_name'    => new xmlrpcval(html_entity_decode($forum_rows[$forum_id]['forum_name']), 'base64'),
                    'description'   => new xmlrpcval(html_entity_decode($forum_rows[$forum_id]['forum_desc']), 'base64'),
                    'parent_id'     => new xmlrpcval($node_forum_id),
                    'logo_url'      => new xmlrpcval($logo_url),
                    'unread_count'  => new xmlrpcval($unread[$forum_id] ? $unread[$forum_id] : 0, 'int'),
                    'is_protected'  => new xmlrpcval($forum_rows[$forum_id]['forum_password'] ? true : false, 'boolean'),
                    'url'           => new xmlrpcval($forum_rows[$forum_id]['forum_link']),
                    'sub_only'      => new xmlrpcval(($forum_rows[$forum_id]['forum_type'] == FORUM_POST) ? false : true, 'boolean'),
                 ), 'struct');
                
                if (isset($forum_rows[$forum_id]['child']))
                {
                    $xmlrpc_forum->addStruct(array('child' => new xmlrpcval($forum_rows[$forum_id]['child'], 'array')));
                }
                
                $forum_rows[$node_forum_id]['child'][] = $xmlrpc_forum;
                unset($forum_rows[$forum_id]);
            }
        }
    }
    
    $response = new xmlrpcval($forum_rows[0]['child'], 'array');
    
    return new xmlrpcresp($response);
} // End of get_forum_func

?>
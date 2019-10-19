<?php

defined('IN_MOBIQUO') or exit;


function log_it($log_data, $is_begin = false)
{
    global $mobiquo_config;
    
    if(!$mobiquo_config['keep_log'] || !$log_data)
    {
        return;
    }
    
    $log_file = './log/'.date('Ymd_H').'.log';
    
    if ($is_begin)
    {
        global $user;
        $method_name = $log_data;
        $log_data = "\nSTART ======================================== $method_name\n";
        $log_data .= "TIME: ".date('Y-m-d H:i:s')."\n";
        $log_data .= "USER ID: ".$user->data['user_id']."\n";
        $log_data .= "USER NAME: ".$user->data['username']."\n";
        $log_data .= "PARAMETER:\n";
    }
    
    file_put_contents($log_file, print_r($log_data, true), FILE_APPEND);
}


function get_method_name()
{
    $request = $HTTP_RAW_POST_DATA ? $HTTP_RAW_POST_DATA : file_get_contents('php://input');
    $parsers = php_xmlrpc_decode_xml($request);
    return $parsers->methodname;
}


function get_error($error_code = 99)
{
    global $mobiquo_error_code;
    
    if(!isset($mobiquo_error_code[$error_code]))
    {
        $error_code = 99;
    }
    
    return new xmlrpcresp('', 18, $mobiquo_error_code[$error_code]); // for test purpose
    //return new xmlrpcresp('', $error_code, $mobiquo_error_code[$error_code]);
}


function get_short_content($post_id, $length = 200)
{
    global $db;
    
    $sql = 'SELECT post_text
            FROM ' . POSTS_TABLE . '
            WHERE post_id = ' . $post_id;
    $result = $db->sql_query($sql);
    $post_text = $db->sql_fetchfield('post_text');
    $db->sql_freeresult($result);
    
    $post_text = censor_text($post_text);
    $post_text = preg_replace('/\[url.*?\].*?\[\/url.*?\]/', '[url]', $post_text);
    $post_text = preg_replace('/\[img.*?\].*?\[\/img.*?\]/', '[img]', $post_text);
    $post_text = preg_replace('/[\n\r\t]+/', ' ', $post_text);
    strip_bbcode($post_text);
    $post_text = html_entity_decode($post_text);
    $post_text = function_exists('mb_substr') ? mb_substr($post_text, 0, $length) : substr($post_text, 0, $length);
    return $post_text;
}


function post_html_clean($str)
{
    global $phpbb_home, $mobiquo_config;
    $search = array(
        "/<a .*?href=\"(.*?)\".*?>(.*?)<\/a>/si",
        "/<img .*?src=\"(.*?)\".*?\/>/si",
        "/<blockquote.*?>(.*?)<\/blockquote>/si",
        "/<br\s*\/?>|<\/cite>/si",
    );
    
    $replace = array(
        '[url=$1]$2[/url]',
        '[img]$1[/img]',
        '[quote]$1[/quote]',
        "\n"
    );
    
    $str = preg_replace('/\n/si', '', $str);
    if (preg_match('/^(.*?<blockquote(.*?)>)(.*)(<\/blockquote>.*)$/si', $str, $match_first))
    {
        if (preg_match('/^(.*?)<blockquote(.*?)>.*<\/blockquote>(.*)$/si', $match_first[2], $match_second))
        {
            $str = $match_first[1].$match_second[1].$match_second[2].$match_first[3];
        }
    }
    
    $str = preg_replace('/<img .*?src=\".*?\/images\/smilies\/.*?\".*? alt=\"(.*?)\".*? \/>/', '$1', $str);
    $str = preg_replace($search, $replace, $str);
    $str = strip_tags($str);
    $str = html_entity_decode($str);
    
    // change relative path to absolute URL 
    $str = preg_replace('/\[img\]\.\.\/(.*?)\[\/img\]/si', "[img]$phpbb_home/$1[/img]", $str);
    // remove link on img
    $str = preg_replace('/\[url=.*?\]\s*(\[img\].*?\[\/img\])\s*\[\/url\]/si', '$1', $str);
    // cut quote content to 100 charactors
    if ($mobiquo_config['shorten_quote'])
    {
        $str = cut_quote($str, 100);
    }
    
    return $str;
}


function get_user_avatar_url($avatar, $avatar_type, $ignore_config = false)
{
    global $config, $phpbb_home, $phpEx;

    if (empty($avatar) || !$avatar_type || (isset($config['allow_avatar']) && !$config['allow_avatar'] && !$ignore_config))
    {
        return '';
    }
    
    $avatar_img = '';

    switch ($avatar_type)
    {
        case AVATAR_UPLOAD:
            if (isset($config['allow_avatar_upload']) && !$config['allow_avatar_upload'] && !$ignore_config)
            {
                return '';
            }
            $avatar_img = $phpbb_home . "download/file.$phpEx?avatar=";
        break;

        case AVATAR_GALLERY:
            if (isset($config['allow_avatar_local']) && !$config['allow_avatar_local'] && !$ignore_config)
            {
                return '';
            }
            $avatar_img = $phpbb_home . $config['avatar_gallery_path'] . '/';
        break;

        case AVATAR_REMOTE:
            if (isset($config['allow_avatar_remote']) && !$config['allow_avatar_remote'] && !$ignore_config)
            {
                return '';
            }
        break;
    }

    $avatar_img .= $avatar;
    $avatar_img = str_replace(' ', '%20', $avatar_img);
    
    return $avatar_img;
}


function mobiquo_iso8601_encode($timet)
{
    global $user;
    
    $timezone = ($user->timezone)/3600;
    $t = gmdate("Ymd\TH:i:s", $timet + $user->timezone + $user->dst);
    
    if($timezone >= 0){
        $timezone = sprintf("%02d", $timezone);         
        $timezone = '+'.$timezone;
    }
    else{
        $timezone = $timezone * (-1);
        $timezone = sprintf("%02d",$timezone);
        $timezone = '-'.$timezone;
    }
    $t = $t.$timezone.':00';
    
    return $t;
}


function get_user_id_by_name($username)
{
    global $db;
    
    if (!$username)
    {
        return false;
    }
    
    $sql = 'SELECT user_id
            FROM ' . USERS_TABLE . "
            WHERE username = '$username'";
    $result = $db->sql_query($sql);
    $user_id = $db->sql_fetchfield('user_id');
    $db->sql_freeresult($result);
    
    return $user_id;
}

function cut_quote($str, $keep_size)
{
    $str_array = preg_split('/\[quote\](.*?)\[\/quote\]/is', $str, -1, PREG_SPLIT_DELIM_CAPTURE);
    if (sizeof($str_array) == 3)
    {
        $quote_array = preg_split('/(\[img\].*?\[\/img\]|\[url=.*?\].*?\[\/url\])/is', $str_array[1], -1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE);
        $short_str = '';
        $current_size = 0;
        $img_flag = true; // just keep at most one img in the quote
        for ($i = 0, $size = sizeof($quote_array); $i < $size; $i++)
        {
            if (preg_match('/^\[img\].*?\[\/img\]$/is', $quote_array[$i]))
            {
                if ($img_flag)
                {
                    $short_str .= $quote_array[$i];
                    $img_flag = false;
                }
            }
            else if (preg_match('/^\[url=.*?\](.*?)\[\/url\]$/is', $quote_array[$i], $matches))
            {
                $short_str .= $quote_array[$i];
                $current_size += strlen($matches[1]);
                if ($current_size > $keep_size)
                {
                    $short_str .= "...";
                    break;
                }
            }
            else
            {
                if ($current_size + strlen($quote_array[$i]) > $keep_size)
                {
                    $short_str .= substr($quote_array[$i], 0, $keep_size - $current_size);
                    $short_str .= "...";
                    break;
                }
                else
                {
                    $short_str .= $quote_array[$i];
                    $current_size += strlen($quote_array[$i]);
                }
            }
        }
        return $str_array[0] . '[quote]' . $short_str . '[/quote]' . $str_array[2];
    }

    return $str;
}

?>
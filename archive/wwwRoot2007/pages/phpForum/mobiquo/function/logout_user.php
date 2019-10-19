<?php

defined('IN_MOBIQUO') or exit;

function logout_user_func()
{
    global $user;
    
    $user->session_kill();

    return new xmlrpcresp(new xmlrpcval(true, 'boolean'));
} // End of logout_user_func

?>
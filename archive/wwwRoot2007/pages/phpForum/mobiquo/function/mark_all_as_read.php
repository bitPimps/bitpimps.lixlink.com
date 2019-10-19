<?php

defined('IN_MOBIQUO') or exit;

function mark_all_as_read_func($xmlrpc_params)
{
    markread('all');
    
    return new xmlrpcresp(new xmlrpcval(true, 'boolean'));
    
} // End of mark_all_as_read_func

?>
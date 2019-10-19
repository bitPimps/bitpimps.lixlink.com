<?
/*****************************************************************************
 *                                                                           *
 *                Web Application Development with PHP                       *
 *                                 by                                        *
 *                 Tobias Ratschiller and Till Gerken                        *
 *                                                                           *
 *              Copyright (c) 2000, New Riders Publishing                    *
 *                                                                           *
 *****************************************************************************
 *                                                                           *
 * $Title: PHP 3 implementation of PHP 4's session management API $          *
 * $Chapter: Web Application Concepts $                                      *
 * $Executable: false $                                                      * 
 *                                                                           *
 * $Description:                                                             *
 * This is a backport of the PHP 4 session_* functions to native PHP - so    * 
 * that you can use the same session management functions under both         *
 * versions of PHP. They're believed to be about 75% compatible at the       *   
 * moment, but it's already possible to use the most common stuff. $         *
 *                                                                           *
 *****************************************************************************/

/*
 *      Differences from PHP 4:
 *      - no URL rewriting (of course)
 *      - options aren't specified in the php.ini but in the session class below
 *      - auto_start doesn't work with user callbacks
 *      - the session ID is produced by a different algorithm
 *      - shared memory support is still missing 
 *      - <?=SID?> doesn't work - use <?print($SID);?>
 *      - the WDDX serializer doesn't work yet.
 *      - serializing objects is limited due to PHP 3's serializer()
 *
 *      Notes:
 *          The session class contains the configuration variables. This is the
 *          only part of the code you should need to edit.
 *
 *          To reproduce the module concept used in PHP 4's session library, we
 *          use classes. An example class has been been provided: files. You can
 *          easily create your own classes, for example a class mysql to store
 *          session data to MySQL. It needs to provide the following functions:
 *          bool open(string save_path, string sess_name):
 *              used on startup of a session to initialize variables or memory
 *              returns false on error or true on success
 *          bool close:
 *              used on shutdown of a session to unset variables or free memory 
 *          mixed read(string sess_id):
 *              reads the session data of the session identified with sess_id.
 *              returns false on error or the serialized session data
 *          bool write(string sess_id, string val):
 *              saves the session data of the session identified with sess_id
 *              returns false on error or true on success
 *          bool destroy(string sess_id):
 *              destroy the session identified with sess_id
 *              returns false on error or true on success
 *          bool gc(int max_lifetime):
 *              provides garbage collection to remove sessions older than 
 *              time() - max_lifetime
 *              returns false on error or true on success
 *          
 *          While it may be faster to provide your own class, the recommended way
 *          to add storage modules is to use session_set_save_handler(), as this
 *          is compatible to PHP 4.
 */

$SID = "";
class session
{
    // Public variables
    var $auto_start = true;
    var $save_path = "/tmp";
    var $name = "PHPSESSID";    
    var $save_handler = "files";
    var $lifetime = 0;
    var $gc_probability = 1;
    var $gc_maxlifetime = 0;
    var $serialize_handler = "php";
    var $extern_referer_check = false;  
    var $use_cookies = true;
    var $ID;          

    // Private variables
    var $nr_open_sessions = 0;
    var $mod_name = "";
    var $id;
    var $delimiter = "\n";
    var $delimiter_value = "[==]";
    
    function session()
    {
        $this->mod_name = $this->save_handler;
    }
}

class user
{
    var $open_func;
    var $close_func;
    var $read_func;
    var $write_func;
    var $destroy_func;
    var $gc_func;
    
    function open($save_path, $sess_name)
    {
        $func = $this->open_func;
        if(function_exists($func))
        {
            return($func($save_path, $sess_name));
        }
        
        return(true);
    } 

    function close($save_path, $sess_name)
    {
        $func = $this->close_func;
        if(function_exists($func))
        {        
            return($func());
        }
        
        return(true);
    } 

    function read($sess_id)
    {
        $func = $this->read_func;
        
        return($func($sess_id));
    }    

    function write($sess_id, $val)
    {
        $func = $this->write_func;
        
        return($func($sess_id, $val));
    }    

    function destroy($sess_id)
    {
        $func = $this->destroy_func;
        if(function_exists($func))
        {        
            return($func($sess_id));
        }
        
        return(true);
    }    

    function gc($max_lifteime)
    {
        $func = $this->gc_func;
        if(function_exists($func))
        {        
            return($func($max_lifetime));
        }
        
        return(true);
    }    

}

class files
{
    function open($save_path, $sess_name)
    {
        return(true);
    }

    function close()
    {
        return(true);    
    }
    
    function read($sess_id)
    {
        global $session;

        // Open, read in, close file with session data
        $file = $session->save_path."/sess$sess_id";
        if (!file_exists($file))
        {
            // Create it
            touch($file);
        }
        $fp = fopen($file, "r") or die("Could not open session file ($file).");
        $val = fread($fp, filesize($file));
        fclose($fp);
        
        return($val);
    }
    
    function write($sess_id, $val)
    {
        global $session;

        // Open, write to, close file with session data
        $file = $session->save_path."/sess$sess_id";
        $fp = fopen($file, "w") or die("Could not write session file ($file)");
        $val = fputs($fp, $val);
        fclose($fp);
        
        return(true);
    }

    function destroy($sess_id)
    {
        global $session;
        
        $file = $session->save_path."/sess$sess_id";
        unlink($file);
        
        return(true);    
    }
      
    function gc($max_lifetime)
    {
        // We return true, since all cleanup should be handled by
	    // an external entity (i.e. find -ctime x | xargs rm)
        return(true);    
    }         
}


function _session_create_id()
{
    return(md5(uniqid(microtime())));
}

function _php_encode()
{
    global $session;
    
    $ret = "";
    // Create a string containing the serialized variables
    for ($i=0; $i<count($session->vars); $i++)
    {
        $ret .= $session->vars[$i].$session->delimiter_value.serialize($GLOBALS[$session->vars[$i]]).$session->delimiter;
    }
    
    return($ret);
}

function _php_decode($data)
{
    global $session;
    
    $data = trim($data);
    $vars = explode($session->delimiter, $data);

    // Add the variables to the global namespace
    for ($i=0; $i<count($vars); $i++)
    {
        $tmp = explode($session->delimiter_value, $vars[$i]);
        $name = trim($tmp[0]);
        $value = trim($tmp[1]);
        $GLOBALS[$name] = unserialize($value);
    }
}

function _wddx_encode($data)
{
    global $session;
    
    $ret = wddx_serialize_vars($session->vars);
    return($ret);
}

function _wddx_decode($data)
{
    return(wddx_deserialize($data));
}

function session_name($name = "")
{
    global $session;
    if(empty($name))
    {
        return($session->name);
    }
    $session->name = $name;
}

function session_set_save_handler($open, $close, $read, $write, $destroy, $gc)
{
    global $session, $user;
    
    $user = new user; 
    $user->open_func = $open;
    $user->close_func = $close;
    $user->read_func = $read;
    $user->write_func = $write;
    $user->destroy_func = $destroy;
    $user->gc_func = $gc;
    $session->mod_name = "user";
}

function session_module_name($name = "")
{
    global $session;
    
    if(empty($name))
    {
        return($session->mod_name);
    }
    $session->mod_name = $name;    
}

function session_save_path($path = "")
{
    global $session;
    
    if(empty($path))
    {
        return($session->save_path);
    }
    $session->save_path = $path;    
}

function session_id($id = "")
{
    global $session;
    
    if(empty($id))
    {
        return($session->id);
    }
    $session->id = $id;    
}

function session_register($var)
{
    global $session;
    
    if ($session->nr_open_sessions == 0)
    {
        session_start();
    }
    $session->vars[] = trim($var);
}

function session_unregister($var)
{
    global $session;
    
    for ($i=0; $i<count($session->vars); $i++)
    {
        if ($session->vars[$i] == trim($var))
           {
               unset($session->vars[$i]);
               break;
           }
    }
}

function session_is_registered($var)
{
    global $session;
    
    for ($i=0; $i<count($session->vars); $i++)
    {
        if ($session->vars[$i] == trim($var))
           {
               return(true);
           }
    }
    
    return(false);
}

function session_encode()
{
    global $session;
    
    $serializer = "_".$session->serialize_handler."_encode";
    $ret = $serializer();
    
    return($ret);
}

function session_decode($data)
{
    global $session;
    
    $serializer = "_".$session->serialize_handler."_decode";
    $ret = $serializer($data);
    
    return($ret);
}

function session_start()
{
    global $session, $SID, $HTTP_COOKIE_VARS;
    
    // Define the global variable $SID?
    $define_sid = true;
 
    // Check if session_start() has been called once already
    if ($session->nr_open_sessions != 0)
    {
        return(false);
    }

    // Try to get the session ID
    if (empty($GLOBALS[$session->name]))
    {
        // Maybe it is encoded into the URL (form <session-name>=<session-id>?
        eregi($session->name."=([^/]+)", $GLOBALS["REQUEST_URI"], $regs);
        $regs[1] = trim($regs[1]);
        if (!empty($regs[1]))
        {
            $session->id = $regs[1];
        }
    }
    else
    {
        $session->id =  $GLOBALS[$session->name];
        if (isset($HTTP_COOKIE_VARS[$session->name]))
        {
            $define_sid = false;
        }
    }

    // Check for external referer
    if ($session->extern_referer_check)
    {
        $url = parse_url($GLOBALS["HTTP_REFERER"]);
        if(trim($url["host"]) != $GLOBALS["SERVER_NAME"])
        {
            unset($session->id);
            $define_sid = true;
        }
    }   
   
    $mod = $GLOBALS[$session->mod_name];
    
    // Do we have an existing session ID?
    if (!empty($session->id))
    {
        // Start session
        if (!$mod->open($session->save_path, $session->name))
        {
            die("Failed to initialize session module.");
        }
        // Read session data
        if ($val = $mod->read($session->id))
        {   
            // Decode session data
            session_decode($val);
        }        
    }
    else 
    {
        // Create new session ID
        $session->id = _session_create_id();
        
        // Store cookie with this session ID?
        if ($session>use_cookies)
        {
            SetCookie($session->name, $session->id, $session->lifetime);
        }
    }
    
    // Check if we should clean up (call the garbage collection routines)
    if ($session->gc_probability > 0)
    {
        srand(time());
        $randmax = getrandmax();
        $nrand = (int)(100 * rand() / $randmax);
        if($nrand < $session->gc_probability) 
        {
            $mod->gc($session->gc_maxlifetime);
        }
    }
    
    if($define_sid)
    {
        $SID = $session->name."=".$session->id;
    }
    $session->nr_open_sessions++;
    
    return(true);
}

function session_destroy()
{
    global $session;
    
    if($session->nr_open_sessions == 0)
    {
        return(false);
    }
    // Destroy session
    $mod = $GLOBALS[$session->mod_name];
    if (!$mod->destroy($session->name))
    {
        return(false);
    }    
    unset($session);
    $session = new session;

    return(true);
}

function session_close()
{
    global $session, $SID;
    
    if($session->nr_open_sessions == 0)
    {
        return(false);
    }
    // Encode session
    $val = session_encode();
    $len = strlen($val);

    // Save session
    $mod = $GLOBALS[$session->mod_name];
    if (!$mod->write($session->id, $val))
    {
        die("Session could not be saved.");
    }
    // Close session
    if (function_exists($session->mod_name."->close") &&!$mod->close())
    {
        die("Session could not be closed.");
    }
    $SID = "";
    $session->nr_open_sessions--;
    
    return(true);
}

$session = new session;
$mod = $session->save_handler;
$$mod = new $mod;

if ($session->auto_start)
{
    $ret = session_start() or die("Session could not be started.");
}
register_shutdown_function("session_close");

/*
 *      Basic Example
 *      
 *      This basic example shows the normal use. The code is the same as in 
 *      PHP 4, except for the require("sessions.php3");

require("sessions.php3");
session_start();
print("Our session ID is: ".session_id()."<br>");
print("The counter value is: $counter<br>");
print("The foo value is: $foo<br>");
$counter++;
$foo = "Foobar=Fobar";
session_register("counter");
session_register("foo");

 *
 */
  
/*
 *      User Callback Example
 *      
 *      This example uses callback functions. It's a slightly modified version
 *      of Sascha Schumann's original test script for the callbacks. 100%
 *      the same code as in PHP 4 (except for the require(), of course).

require("sessions.php3");
function my_open($save_path, $sess_name)
{
    echo $save_path."<br>";
    echo $sess_name."<br>";
    return true;    
}
    
function my_read($sess_id)
{
    echo $sess_id."<br>";
    return true;
}
    
function my_write($sess_id, $val)
{
    echo $val."<br>";
    return true;    
}

$foo = 10;    
session_set_save_handler("my_open", "", "my_read", "my_write", "", "");
session_start();
session_register("foo");
echo "foo: $foo";

 *
 */
?>

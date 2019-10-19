<?php
class Users
{
  var $id;
  var $logonName;
  var $logonPassword;
	var $rank;

  function Users ($recordSetArray)
  {
    if(!isset($recordSetArray) || $recordSetArray == "")
    {
      $this->id = -1;
      $this->logonName = "";
      $this->logonPassword = "";
			$this->rank	= "";
    }
    else
    {
      $this->id = $recordSetArray["id"];
      $this->logonName = stripslashes($recordSetArray["logonName"]);
      $this->logonPassword = stripslashes($recordSetArray["logonPassword"]);
			$this->rank = stripslashes($recordSetArray["rank"]);
    }
  }

  function save ($dbConn)
  {
    if(!isset($this->id) || (integer)$this->id == -1 || $this->id == "")
    {
      $sql =  "INSERT INTO Users (logonName, logonPassword, rank) VALUES ('" . addslashes($this->logonName) . "', '" . addslashes($this->logonPassword) . "', '" . addslashes($this->rank) . "')";
      $result = mysql_query($sql);
      $this->id = mysql_insert_id($dbConn);
    }
    else
    {
      $sql =  "UPDATE Users SET logonName='" . addslashes($this->logonName) . "', logonPassword='" . addslashes($this->logonPassword) . "', rank='" . addslashes($this->rank) . "' WHERE id=" . $this->id;
      $result = mysql_query($sql);
    }
    if(!$result)
    {
      $errorMsg =  "Database Error Occurred: " . htmlspecialchars(mysql_error());
      return $errorMsg;
    }
  }

  function setid($id)
  {
    $this->id = $id;
  }

  function getid()
  {
    return $this->id;
  }

  function setlogonName($logonName)
  {
    $this->logonName = $logonName;
  }

  function getlogonName()
  {
    return $this->logonName;
  }

  function setlogonPassword($logonPassword)
  {
    $this->logonPassword = $logonPassword;
  }

  function getlogonPassword()
  {
    return $this->logonPassword;
  }
	
	function setrank($rank)
  {
    $this->rank = $rank;
  }

  function getrank()
  {
    return $this->rank;
  }

  function getUsers($dbConn, $id)
  {
    $recordSetId = mysql_query( "SELECT * FROM Users WHERE id=" . $id, $dbConn);
    if(!$recordSetId)
      handleDbError_die();

    $recordSetArray = mysql_fetch_array($recordSetId);

    $aUsers = new Users($recordSetArray);

    return $aUsers;
  }

  function deleteUsers($dbConn, $id)
  {
    $sql = "DELETE FROM Users WHERE id=" . $id;
    $result = mysql_query($sql);
    if(!$result)
      return "Database Error Occurred: " . htmlspecialchars(mysql_error());
    else
      return "";
  }

}
?>
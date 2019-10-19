<?php
class Links
{
  var $id;
  var $orderId;
  var $url;
  var $name;
  var $desc;

  function Links ($recordSetArray)
  {
    if(!isset($recordSetArray) || $recordSetArray == "")
    {
      $this->id = -1;
      $this->orderId = -1;
      $this->url = "";
      $this->name = "";
      $this->desc = "";
    }
    else
    {
      $this->id = $recordSetArray["id"];
      $this->orderId = $recordSetArray["orderId"];
      $this->url = stripslashes($recordSetArray["url"]);
      $this->name = stripslashes($recordSetArray["name"]);
      $this->desc = stripslashes($recordSetArray["description"]);
    }
  }

  function save ($dbConn)
  {
    if(!isset($this->id) || (integer)$this->id == -1 || $this->id == "")
    {
      $sql =  "INSERT INTO Links" .
			" (orderId, url, name, description)" .
			" VALUES ('" . 
			$this->orderId . "', '" . 
			addslashes($this->url) . "', '" . 
			addslashes($this->name) . "', '" . 
			addslashes($this->desc) . "')";
      $result = mysql_query($sql);
      $this->id = mysql_insert_id($dbConn);
    }
    else
    {
      $sql =  "UPDATE Links SET " .
			" orderId='" . $this->orderId . "'," .
			" url='" . addslashes($this->url) . "'," .
			" name='" . addslashes($this->name) . "'," .
			" description='" . addslashes($this->desc) . "'" .
			" WHERE id=" . $this->id;
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

  function setorderId($orderId)
  {
    $this->orderId = $orderId;
  }

  function getorderId()
  {
    return $this->orderId;
  }

  function seturl($url)
  {
    $this->url = $url;
  }

  function geturl()
  {
    return $this->url;
  }

  function setname($name)
  {
    $this->name = $name;
  }

  function getname()
  {
    return $this->name;
  }

  function setdesc($desc)
  {
    $this->desc = $desc;
  }

  function getdesc()
  {
    return $this->desc;
  }

  function getLinks($dbConn, $id)
  {
    $recordSetId = mysql_query( "SELECT * FROM Links WHERE id=" . $id, $dbConn);
    if(!$recordSetId)
      handleDbError_die();

    $recordSetArray = mysql_fetch_array($recordSetId);

    $aLinks = new Links($recordSetArray);

    return $aLinks;
  }

	function getLinkByOrder($dbConn, $num)
  {
    $recordSetId = mysql_query( "SELECT * FROM Links WHERE orderId=" . $num, $dbConn);
    if(!$recordSetId)
      handleDbError_die();

    $recordSetArray = mysql_fetch_array($recordSetId);

    $aLinks = new Links($recordSetArray);

    return $aLinks;
  }

  function deleteLinks($dbConn, $id)
  {
    $sql = "DELETE FROM Links WHERE id=" . $id;
    $result = mysql_query($sql);
    if(!$result)
      return "Database Error Occurred: " . htmlspecialchars(mysql_error());
    else
      return "";
  }
}

?>
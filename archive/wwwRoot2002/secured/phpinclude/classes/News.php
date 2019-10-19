<?php
class News
{
  var $id;
  var $title;
  var $datePosted;
  var $shortDesc;
  var $body;
  var $active;

  function News ($recordSetArray)
  {
    if(!isset($recordSetArray) || $recordSetArray == "")
    {
      $this->id = -1;
      $this->title = "";
      $this->datePosted = time();
      $this->shortDesc = "";
      $this->body = "";
      $this->active = "0";
    }
    else
    {
      $this->id = $recordSetArray["id"];
      $this->title = stripslashes($recordSetArray["title"]);
      $this->datePosted = strtotime($recordSetArray["datePosted"]);
      $this->shortDesc = stripslashes($recordSetArray["shortDesc"]);
      $this->body = stripslashes($recordSetArray["body"]);
      $this->active = stripslashes($recordSetArray["active"]);
    }
  }

  function save ($dbConn)
  {
    if(!isset($this->id) || (integer)$this->id == -1 || $this->id == "")
    {
      $sql =  "INSERT INTO News (title, datePosted, shortDesc, body, active) VALUES ('" . addslashes($this->title) . "', '" . Date("Y-m-d 00:00:00", time()) . "', '" . addslashes($this->shortDesc) . "', '" . addslashes($this->body) . "', '" . addslashes($this->active) . "')";
      $result = mysql_query($sql);
      $this->id = mysql_insert_id($dbConn);
    }
    else
    {
      $sql =  "UPDATE News SET title='" . addslashes($this->title) . "', datePosted='" . Date("Y-m-d 00:00:00", $this->datePosted) . "', shortDesc='" . addslashes($this->shortDesc) . "', body='" . addslashes($this->body) . "', active='" . addslashes($this->active) . "' WHERE id=" . $this->id;
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

  function settitle($title)
  {
    $this->title = $title;
  }

  function gettitle()
  {
    return $this->title;
  }

  function setdatePosted($datePosted)
  {
    $this->datePosted = strtotime($datePosted);
  }

  function getdatePosted($format)
  {
    return date($format, $this->datePosted);
  }

  function setshortDesc($shortDesc)
  {
    $this->shortDesc = $shortDesc;
  }

  function getshortDesc()
  {
    return $this->shortDesc;
  }

  function setbody($body)
  {
    $this->body = $body;
  }

  function getbody()
  {
    return $this->body;
  }

  function setactive($active)
  {
    $this->active = $active;
  }

  function getactive()
  {
    return $this->active;
  }

  function getNews($dbConn, $id)
  {
    $recordSetId = mysql_query( "SELECT * FROM News WHERE id=" . $id, $dbConn);
    if(!$recordSetId)
      handleDbError_die();

    $recordSetArray = mysql_fetch_array($recordSetId);

    $aNews = new News($recordSetArray);

    return $aNews;
  }

  function deleteNews($dbConn, $id)
  {
    $sql = "DELETE FROM News WHERE id=" . $id;
    $result = mysql_query($sql);
    if(!$result)
      return "Database Error Occurred: " . htmlspecialchars(mysql_error());
    else
      return "";
  }

}
?>
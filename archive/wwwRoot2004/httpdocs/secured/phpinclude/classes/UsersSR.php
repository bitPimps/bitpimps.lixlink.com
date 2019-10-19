<?php
class UsersSR
{
  var $Userss;
  var $totalNum;
  var $currNum;

  function UsersSR($dbConn, $lowerBound, $upperBound, $searchCrit, $sortBy)
  {
    $sql = 	"SELECT COUNT(DISTINCT id) FROM Users";

    $recordSetId 		= mysql_query($sql, $dbConn);
    if (!$recordSetId)
      handleDbError_die();

    $recordSet				= mysql_fetch_row($recordSetId);
    $this->totalNum		= $recordSet[0];

    $sql =	"SELECT * FROM Users";

    if($searchCrit != "")
		{
			$sql = 	$sql . " WHERE (logonName LIKE '%" . $searchCrit . "%' OR logonPassword LIKE '%" . $searchCrit . "%')";
		}

		if(isSet($sortBy) && $sortBy != "")
    {
      $sql = 	$sql . " ORDER BY " . $sortBy . " ASC";
    }
    $sql = 	$sql . " LIMIT " . $lowerBound . "," . $upperBound;

    $recordSetId = mysql_query($sql, $dbConn);

    if (!$recordSetId)
      handleDbError_die();

    $this->currNum = mysql_num_rows($recordSetId);

    while ($recordSet = mysql_fetch_array($recordSetId))
    {
      $this->Userss[] = new Users($recordSet);
    }
  }

  function getCurrNum()
  {
    return $this->currNum;
  }
  function getTotalNum()
  {
    return $this->totalNum;
  }
  function getUserss()
  {
    return $this->Userss;
  }

}
?>
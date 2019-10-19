<?php
class LinksSR
{
  var $Linkss;
  var $totalNum;
  var $currNum;

  function LinksSR($dbConn, $lowerBound, $upperBound, $searchCrit, $sortBy)
  {
    $sql = 	"SELECT COUNT(DISTINCT id) FROM Links";

    $recordSetId 		= mysql_query($sql, $dbConn);
    if (!$recordSetId)
      handleDbError_die();

    $recordSet				= mysql_fetch_row($recordSetId);
    $this->totalNum		= $recordSet[0];

    $sql =	"SELECT * FROM Links";

    //if($searchCrit != "")
    //  $sql = 	$sql . " WHERE (name LIKE '%" . $searchCrit . "%' OR desc LIKE '%" . $searchCrit . "%')";

		$sql = 	$sql . " WHERE url != ''";

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
      $this->Linkss[] = new Links($recordSet);
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
  function getLinkss()
  {
    return $this->Linkss;
  }

}
?>
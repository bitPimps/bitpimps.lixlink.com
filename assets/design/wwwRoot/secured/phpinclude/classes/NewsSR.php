<?php
class NewsSR
{
  var $Newss;
  var $totalNum;
  var $currNum;

  function NewsSR($dbConn, $lowerBound, $upperBound, $searchCrit, $sortBy, $catId, $active)
  {
    $sql = 	"SELECT COUNT(DISTINCT id) FROM News";

    $recordSetId 		= mysql_query($sql, $dbConn);
    if (!$recordSetId)
      handleDbError_die();

    $recordSet				= mysql_fetch_row($recordSetId);
    $this->totalNum		= $recordSet[0];

    $sql =	"SELECT * FROM News";

    if($searchCrit != "")
		{
			if($catId == "")
			{
				$sql = 	$sql . " WHERE (active='1' AND (title LIKE '%" . $searchCrit . "%' OR shortDesc LIKE '%" . $searchCrit . "%' OR body LIKE '%" . $searchCrit . "%'))";
			}
			else
			{
				$sql = 	$sql . " WHERE (catId = '" . $catId . "' AND active='1' AND (title LIKE '%" . $searchCrit . "%' OR shortDesc LIKE '%" . $searchCrit . "%' OR body LIKE '%" . $searchCrit . "%'))";
			}
		}

		if($catId != "" && $searchCrit == "" && $active=="")
      $sql = 	$sql . " WHERE catId = '" . $catId . "'";

		if($catId != "" && $searchCrit == "" && $active!="")
      $sql = 	$sql . " WHERE catId = '" . $catId . "' AND active='1'";

		if($catId == "" && $searchCrit == "" && $active!="")
      $sql = 	$sql . " WHERE active='1'";

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
      $this->Newss[] = new News($recordSet);
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
  function getNewss()
  {
    return $this->Newss;
  }

}
?>
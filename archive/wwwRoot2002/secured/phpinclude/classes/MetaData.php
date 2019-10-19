<?php
class MetaData
{
	var $title;
	var $keywords;
	var $description;

	function MetaData ($recordSetArray)
	{
		if(!isset($recordSetArray) || $recordSetArray == "")
		{
			$this->title					= "";
			$this->keywords				= "";
			$this->description		= "";
		}
		else
		{
			$this->title				= stripslashes($recordSetArray["title"]);
			$this->keywords			= stripslashes($recordSetArray["keywords"]);
			$this->description	= stripslashes($recordSetArray["description"]);
		}
	}

	function save ($dbConn)
	{
		$sql =  "UPDATE metainformation SET " .
						" title='" . addslashes($this->title) . "'," .
						" keywords='" . addslashes($this->keywords) . "'," .
						" description='" . addslashes($this->description) . "'";
		$result = mysql_query($sql);    

		if(!$result)
		{
			$errorMsg =  "Database Error Occurred: " . htmlspecialchars(mysql_error());
			return $errorMsg;
		}
	}

	function setTitle($title)
	{
		$this->title = $title;
	}
	
	function getTitle()
	{
		return $this->title;
	}

	function setKeywords($keywords)
	{
		$this->keywords = $keywords;
	}

	function getKeywords()
	{
		return $this->keywords;
	}

	function setDescription($description)
	{
		$this->description = $description;
	}

	function getDescription()
	{
		return $this->description;
	}

	function getMetaData($dbConn)
	{
		$recordSetId = mysql_query("SELECT *" .
															 " FROM metainformation",
															 $dbConn);
		if(!$recordSetId)
			handleDbError_die();

		$recordSetArray = mysql_fetch_array($recordSetId);

		$metaData = new MetaData($recordSetArray);

		return $metaData;
	}
}
?>
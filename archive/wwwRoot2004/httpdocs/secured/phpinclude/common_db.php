<?php

	function connectBitPimpsDb($dbHost, $dbUsername, $dbPassword)
	{
		$dbConn = mysql_Connect($dbHost, $dbUsername, $dbPassword);

		if (!$dbConn)
			handleDbError_die();

		mysql_select_db ("lixlink2");

		return $dbConn;
	}


	function handleDbError_die()
	{
		handleDbError();
	}
	
	
	function handleDbError()
	{
		echo "<br /><br />";
		echo "An unexpected database error occurred: <br /><br />";
		echo "<strong>" . htmlspecialchars(mysql_error()) . "</strong>";
		echo "<br /><br />";
	
	}
?>
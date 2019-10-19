<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide - Web Wiz Forums
'**                                                              
'**  Copyright 2001-2002 Bruce Corkhill All Rights Reserved.                                
'**
'**  This program is free software; you can modify (at your own risk) any part of it 
'**  under the terms of the License that accompanies this software and use it both 
'**  privately and commercially.
'**
'**  All copyright notices must remain in tacked in the scripts and the 
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole or any part of this program even 
'**  if it is modified or reverse engineered in whole or in part without express 
'**  permission from the author.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**   
'**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
'**  and must remain visible when the pages are viewed unless permission is first granted
'**  by the copyright holder.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER 
'**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
'**
'**  You should have received a copy of the License along with this program; 
'**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**    
'**
'**  No official support is available for this program but you may post support questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered by e-mail ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.com
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************

'Set the timeout of the forum
Server.ScriptTimeout = 90

'Set the date time format to your own if you are getting a CDATE error
'Session.LCID = 1033

Dim adoCon 			'Database Connection Variable
Dim strCon			'Holds the Database driver and the path and name of the database
Dim rsCheckPassword		'Database recordset to check the password
Dim rsLoggedInUser		'Database recordset to check the user has logged in
Dim lngLoggedInUserID		'Holds the logginned in user ID
Dim strUsername			'Holds the users username
Dim strPassword			'Holds the usres password
Dim blnAutoLogin		'Holds whether the user wnats to be automactically logged in
Dim strUserCode			'Holds the users ID code
Dim strLoggedInUserCode		'Holds the loggin in user ID
Dim strSQL			'Holds the SQL query
Dim strCode			'Holds the page code
Dim strCodeField		'Holds the code type
Dim strDatabaseDateFunction	'Holds a different date function for Access or SQL server
Dim strDatabaseType		'Holds the type of database used
Dim strDbPathAndName		'Holds the path and name of the database


'Intialise variables
lngLoggedInUserID = 0

'Database Type
'strDatabaseType = "Access"
strDatabaseType = "SQLServer"

'Create database connection
'Create a connection odject
Set adoCon = Server.CreateObject("ADODB.Connection")




'--------------------- Set the path and name of the database --------------------------------------------------------------------------------

strDbPathAndName = "wwForum.mdb"

'BRINKSTER USERS
'Brinkster users remove the ' single quote mark from infront of the line below and replace USERNAME with your Brinkster uersname

'strDbPathAndName = "/USERNAME/db/wwForum.mdb"

'PLEASE NOTE: - For extra security it is highly recommended you change the name of the database, wwForum.mdb, to another name and then 
'replace the wwForum.mdb found above with the name you changed the forum database to.

'---------------------------------------------------------------------------------------------------------------------------------------------




'------------- If you are having problems with the script then try using a diffrent driver or DSN by editing the lines below --------------
			 
'Database connection info and driver (if this driver does not work then comment it out and use one of the alternative drivers)
strCon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath(strDbPathAndName)

'Alternative drivers faster than the basic one above
'strCon = "Provider=Microsoft.Jet.OLEDB.3.51; Data Source=" & Server.MapPath(strDbPathAndName) 'This one is if you convert the database to Access 97
'strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(strDbPathAndName)  'This one is for Access 2000/2002

'If you wish to use DSN then comment out the driver above and uncomment the line below (DSN is slower than the above drivers)
'strCon = "DSN=DSN_NAME" 'Place the DSN where you see DSN_NAME

'---------------------------------------------------------------------------------------------------------------------------------------------


'Set the diffrent variables for diffrent database types
If strDatabaseType = "SQLServer" Then
%>
	<!--#include file="SQL_server_connection.asp" -->
<%
	'The GetDate() function is used in SQL Server
	strDatabaseDateFunction = "GetDate()"
Else
	'The now() function is used in Access
	strDatabaseDateFunction = "Now()"
End If


'Set an active connection to the Connection object
adoCon.Open strCon


'Read in the users details from the form
strUsername = Request.Form("name")
strPassword = Request.Form("password")

'Replace harmful SQL quotation marks with doubles
strUsername = Replace(strUsername, "'", "''")

'If a username has been entered check that the password is correct
If isEmpty(strUsername) = False Then
	
	'Intialise the ADO recordset object
	Set rsCheckPassword = Server.CreateObject("ADODB.Recordset")
	
	'Read the various forums from the database
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Password, tblAuthor.Author_ID, tblAuthor.User_code "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Username = '" & strUsername & "';"
	
	'Query the database
	rsCheckPassword.Open strSQL, strCon
	
	'If the query has returned a value to the recordset then check the password is correct
	If NOT rsCheckPassword.EOF Then
	
		'Check the password is correct, if it is get the user ID and set a cookie
		If strPassword = rsCheckPassword("Password") Then
			
			'Read in the users ID number and whether they want to be automactically logged in when they return to the forum
			lngLoggedInUserID = CLng(rsCheckPassword("Author_ID"))
			strUserCode = rsCheckPassword("User_code")
			
			
			'Write a cookie with the User ID number so the user logged in throughout the forum	
			'Write the cookie with the name Forum containing the value UserID number
			Response.Cookies("Forum")("UserID") = strUserCode
			
			'If the user has selected to be remebered when they next login then set the expiry date for the cookie for 1 year
			If blnAutoLogin = True Then
				
				'Set the expiry date for 1 year (365 days)
				'If no expiry date is set the cookie is deleted from the users system 20 minutes after they leave the forum
				Response.Cookies("Forum").Expires = Now() + 365
			End If	
		End If
	End If
	
	'Reset Server Objects
	rsCheckPassword.Close
	Set rsCheckPassword = Nothing
End If
	



'Read in users ID number from the cookie
strLoggedInUserCode = Request.Cookies("Forum")("UserID")

'Make the usercode SQL safe
strLoggedInUserCode = formatSQLInput(strLoggedInUserCode)


'If a cookie exsists on the users system then read in there username from the database
If isEmpty(strLoggedInUserCode) = False Then

	'Intialise the ADO recordset object
	Set rsLoggedInUser = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Author_ID "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE User_code = '" & strLoggedInUserCode & "';"
		
	'Query the database
	rsLoggedInUser.Open strSQL, strCon
	
	'If there is a user with the ID number read in from the cookie then
	If NOT rsLoggedInUser.EOF Then
	
		'Read in the users details from the recordset
		lngLoggedInUserID = CLng(rsLoggedInUser("Author_ID"))
	
	'Otherwise the username is not correct or the user has been barred so set there User ID to 0
	Else
		lngLoggedInUserID = 0
	End If
	
	'Reset server objects
	rsLoggedInUser.Close
	Set rsLoggedInUser = Nothing
End If


'If the user is not the admin or not logged in send them away
If NOT lngLoggedInUserID = 1 Then Response.Redirect "../insufficient_permission.asp"


'Format SQL Query funtion
Private Function formatSQLInput(strInputEntry)

	'Remove malisous charcters from links and images
	strInputEntry = Replace(strInputEntry, "<", "&lt;")
	strInputEntry = Replace(strInputEntry, ">", "&gt;")
	strInputEntry = Replace(strInputEntry, """", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "=", "&#061;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "'", "''", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "select", "sel&#101;ct", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "join", "jo&#105;n", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "union", "un&#105;on", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "where", "wh&#101;re", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "insert", "ins&#101;rt", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "delete", "del&#101;te", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "update", "up&#100;ate", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "like", "lik&#101;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "drop", "dro&#112;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "create", "cr&#101;ate", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "modify", "mod&#105;fy", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "rename", "ren&#097;me", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "alter", "alt&#101;r", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "pass", "pa&#115;s", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "code", "co&#100;e", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "author", "aut&#104;or", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "username", "usernam&#101;", 1, -1, 1)
	
	'Return
	formatSQLInput = strInputEntry
End Function


'Decode encoded strings
Private Function decodeString(strInputEntry)

	'Remove malisous charcters from links and images
	strInputEntry = Replace(strInputEntry, "&#061;", "=", 1, -1, 0)
	
	strInputEntry = Replace(strInputEntry, "&#097;", "a", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#098;", "b", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#099;", "c", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#100;", "d", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#101;", "e", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#102;", "f", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#103;", "g", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#104;", "h", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#105;", "i", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#106;", "j", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#107;", "k", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#108;", "l", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#109;", "m", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#110;", "n", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#111;", "o", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#112;", "p", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#113;", "q", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#114;", "r", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#115;", "s", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#116;", "t", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#117;", "u", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#118;", "v", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#119;", "w", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#120;", "x", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#121;", "y", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#122;", "z", 1, -1, 0)
	
	strInputEntry = Replace(strInputEntry, "&#065;", "A", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#066;", "B", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#067;", "C", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#068;", "D", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#069;", "E", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#070;", "F", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#071;", "G", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#072;", "H", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#073;", "I", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#074;", "J", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#075;", "K", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#076;", "L", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#077;", "M", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#078;", "N", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#079;", "O", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#080;", "P", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#081;", "Q", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#082;", "R", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#083;", "S", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#084;", "T", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#085;", "U", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#086;", "V", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#087;", "W", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#088;", "X", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#089;", "Y", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#090;", "Z", 1, -1, 0)
	
	
	strInputEntry = Replace(strInputEntry, "&#048;", "0", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#049;", "1", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#050;", "2", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#051;", "3", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#052;", "4", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#053;", "5", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#054;", "6", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#055;", "7", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#056;", "8", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#057;", "9", 1, -1, 0)
	
	'Return
	decodeString = strInputEntry
End Function
%>
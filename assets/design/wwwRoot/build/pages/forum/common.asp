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
Dim rsLoggedInUser		'Hols the recordset for the user Id number
Dim rsConfiguration		'Holds the configuartion recordset
Dim rsModerator			'holds wether the user can moderate this forum
Dim strCon			'Holds the Database driver and the path and name of the database
Dim strSQL			'Holds the SQL query for the database
Dim lngLoggedInUserID		'Holds a logged in users ID number 
Dim strLoggedInUsername		'Holds a logged in users username
Dim strWebsiteName		'Holds the website name
Dim strHomepagePath		'Holds the path to the web sites homepage
Dim strForumPath		'Holds the virtual path to the forum	
Dim strForumEmailAddress	'Holds the forum e-mail address
Dim blnTextLinks		'Set to true if you want text links instead of the powered by logo
Dim blnIEEditor			'Set to true if the HTML editor for IE 5+ is turned on
Dim blnEmail			'Boolean set to true if e-mail is on
Dim blnAdminEmail		'Boolean set to true if admin e-mail is on
Dim strMailComponent		'Email coponent the forum useses
Dim strIncomingMailServer	'Forums incomming mail server
Dim strLoggedInUserCode		'Holds the user code of the user
Dim blnLCode			'set to true
Dim blnModerator		'Set to true if the user is a forum moderator
Dim blnActiveMember		'Set to false if the member is no longer allowed to post messages on the forum
Dim blnLoggedInUserEmail	'Set to true if the user has entered there e-mail
Dim blnLoggedInUserSignature	'set to true if the user has enetered a signature
Dim intTopicPerPage		'Holds the number of topics to show on each page
Dim strTitleImage		'Holds the path and name for the title image for the forum
Dim blnEmoticons		'Set to true if emoticons are turned on
Dim strDatabaseDateFunction	'Holds a different date function for Access or SQL server
Dim strDatabaseType		'Holds the type of database used
Dim blnGuestPost		'Set to true if guests can post
Dim intMemberStatus		'Holds the members status level
Dim blnModeratorAdmin		'Set to true if the moderator has some admin rights
Dim blnAvatar			'Set to true if the forum can use avatars
Dim blnEmailActivation		'Set to true if the e-mail activation is turned on
Dim blnSendPost			'Set to true if post is sent with e-mail notification
Dim intNumHotViews		'Holds the number of how many views a topic has before it becomes a hot topic
Dim intNumHotReplies		'Holds the number of replies before a topic becomes a hot topic
Dim blnPrivateMessages		'Set to true if private messages are allowed
Dim intNumPrivateMessages	'Holds the number of private messages allowed by each user
Dim intThreadsPerPage		'Holds the number of threads shown per page
Dim strDbPathAndName		'Holds the path and name of the database
Dim intSpamTimeLimitSeconds	'Holds the number of secounds between posts
Dim intSpamTimeLimitMinutes	'Holds the number of minutes the user can post five posts in
Dim intDeletePostsTimeLimit	'Holds the time limit users have to edit or delete there posts in


'Initialise variables
lngLoggedInUserID = 0
intMemberStatus = 0
blnEmail = False
blnAdminEmail = False
blnLCode = True
blnModerator = False
blnIEEditor = True
blnActiveMember = True
blnLoggedInUserEmail = False
blnLoggedInUserSignature = False
blnEmoticons = True
blnGuestPost = False
intDeletePostsTimeLimit = 20

'Database Type
'strDatabaseType = "Access"
strDatabaseType = "SQLServer"


'Create database connection
'Create a connection odject
Set adoCon = Server.CreateObject("ADODB.Connection")




'--------------------- Set the path and name of the database --------------------------------------------------------------------------------

strDbPathAndName = "admin/wwForum.mdb"

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
	<!--#include file="admin/SQL_server_connection.asp" -->
<%
	'The GetDate() function is used in SQL Server
	strDatabaseDateFunction = "GetDate()"
Else
	'The now() function is used in Access
	strDatabaseDateFunction = "Now()"
End If


'Set an active connection to the Connection object
adoCon.Open strCon


'Read in the Forum configuration
'Intialise the ADO recordset object
Set rsConfiguration = Server.CreateObject("ADODB.Recordset")

'Initialise the SQL variable with an SQL statement to get the configuration details from the database
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpSelectConfiguration"
Else
	strSQL = "SELECT tblConfiguration.* From tblConfiguration;"
End If

'Query the database
rsConfiguration.Open strSQL, strCon

'If there is config deatils in the recordset then read them in
If NOT rsConfiguration.EOF Then

	'read in the configuration details from the recordset
	strWebsiteName = rsConfiguration("website_name")
	strHomepagePath = rsConfiguration("website_path") 
	strForumPath = rsConfiguration("forum_path")
	strMailComponent = rsConfiguration("mail_component")
	strIncomingMailServer = rsConfiguration("mail_server")
	strForumEmailAddress = rsConfiguration("forum_email_address")
	blnLCode = CBool(rsConfiguration("L_Code"))
	blnEmail = CBool(rsConfiguration("email_notify"))
	blnAdminEmail = CBool(rsConfiguration("email_admin"))
	blnTextLinks = rsConfiguration("Text_link")
	blnIEEditor = CBool(rsConfiguration("IE_editor"))
	intTopicPerPage = CInt(rsConfiguration("Topics_per_page"))
	strTitleImage = rsConfiguration("Title_image")
	blnEmoticons = CBool(rsConfiguration("Emoticons"))
	blnGuestPost = CBool(rsConfiguration("Guest_post"))
	blnModeratorAdmin = CBool(rsConfiguration("Mod_admin"))
	blnAvatar = CBool(rsConfiguration("Avatar"))
	blnEmailActivation = CBool(rsConfiguration("Email_activate"))
	intNumHotViews = CInt(rsConfiguration("Hot_views"))
	intNumHotReplies = CInt(rsConfiguration("Hot_replies"))
	blnSendPost = CBool(rsConfiguration("Email_post"))
	blnPrivateMessages = CBool(rsConfiguration("Private_msg"))
	intNumPrivateMessages = CInt(rsConfiguration("No_of_priavte_msg"))
	intThreadsPerPage = CInt(rsConfiguration("Threads_per_page"))
	intSpamTimeLimitSeconds = CInt(rsConfiguration("Spam_seconds"))
	intSpamTimeLimitMinutes = CInt(rsConfiguration("Spam_minutes"))
End If

'Set a cookie with the last date/time the user used the forum to calculate if there any new posts
'If the date/time the user was last here is 20 minutes since the last visit then set the session variable to the users last date they were here
If Session("dtmLastVisit") = "" AND Request.Cookies("ForumVisit")("LastVist") <> "" Then
	Session("dtmLastVisit") = CDate(Request.Cookies("ForumVisit")("LastVist"))
	Response.Cookies("ForumVisit")("LastVist") = CDbl(Now())
	Response.Cookies("ForumVisit").Expires = DateAdd("yyyy", 1, Now())
'If the last enetry date is not alreay set set it to now	
ElseIf Session("dtmLastVisit") = "" Then
	Session("dtmLastVisit") = Now()
End If

'If the cookie is older than 5 mintues set a new one
If isNumeric(Request.Cookies("ForumVisit")("LastVist")) Then
	If CDate(Request.Cookies("ForumVisit")("LastVist")) < DateAdd("n", -5, Now()) Then
		Response.Cookies("ForumVisit")("LastVist") = CDbl(Now())
		Response.Cookies("ForumVisit").Expires = DateAdd("yyyy", 1, Now())
	End If
'If there is no date in the cookie or it is empty then set the date to now()
Else 
	Response.Cookies("ForumVisit")("LastVist") = CDbl(Now())
	Response.Cookies("ForumVisit").Expires = DateAdd("yyyy", 1, Now())
End If


'If someone has placed the default.asp in the path to the forum then remove it as it's not needed
strForumPath = Replace(strForumPath, "default.asp", "")

'Read in users ID number from the cookie
strLoggedInUserCode = Trim(Mid(Request.Cookies("Forum")("UserID"), 1, 44))

'Make the usercode SQL safe
strLoggedInUserCode = formatSQLInput(strLoggedInUserCode)


'If a cookie exsists on the users system then read in there username from the database
If strLoggedInUserCode <> "" Then

	'Intialise the ADO recordset object
	Set rsLoggedInUser = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database
	If strDatabaseType = "SQLServer" Then
		strSQL = "EXECUTE wwfSpChkUserID @strUserID = '" & strLoggedInUserCode & "'"
	Else
		strSQL = "SELECT tblAuthor.Username, tblAuthor.Author_ID, tblAuthor.Active, tblAuthor.Signature, tblAuthor.Author_email, tblAuthor.Status "
		strSQL = strSQL & "FROM tblAuthor "
		strSQL = strSQL & "WHERE User_code = '" & strLoggedInUserCode & "';"
	End If
		
	'Query the database
	rsLoggedInUser.Open strSQL, strCon
	
	'If the database has returned a record then run next bit
	If NOT rsLoggedInUser.EOF Then
		
		'Before getting the users details make sure then are not trying to log in under the guest account
		If rsLoggedInUser("Author_ID") <> 2 Then
			'Read in the users details from the recordset
			strLoggedInUsername = rsLoggedInUser("Username")
			lngLoggedInUserID = CLng(rsLoggedInUser("Author_ID"))
			blnActiveMember = CBool(rsLoggedInUser("Active"))
			If rsLoggedInUser("Author_Email") <> "" Then blnLoggedInUserEmail = True
			If rsLoggedInUser("Signature") <> "" Then blnLoggedInUserSignature = True
			intMemberStatus = CInt(rsLoggedInUser("Status"))
			
			'If the members account is not active then set there security level to 0 (Guest)
			If blnActiveMember = False Then intMemberStatus = 0
			
			'If we are in a forum see if this user is a forum moderator
			If Request("ForumID") <> "" Then
				
				'Intialise the ADO recordset object
				Set rsModerator = Server.CreateObject("ADODB.Recordset")
				
				'SQL query to see if this person moderates this forum
				If strDatabaseType = "SQLServer" Then
					strSQL = "EXECUTE wwfSpCheckUserIsModerator @lngUserID = " & CLng(lngLoggedInUserID) & ", @intForumID = " & CInt(Request("ForumID"))
				Else
					strSQL = "SELECT TOP 1 tblModerator.Moderator_ID FROM tblModerator "
					strSQL = strSQL & "WHERE tblModerator.Author_ID=" & CLng(lngLoggedInUserID) & " AND (tblModerator.Forum_ID=" & CInt(Request("ForumID")) & " OR tblModerator.Forum_ID=0);"
				End If
					
				'Query the database
				rsModerator.Open strSQL, strCon
				
				'If a record is returned then this user moderates this forum :)
				If NOT rsModerator.EOF Then blnModerator = True
				
				'Get rid of them objects
				rsModerator.Close
				Set rsModerator = Nothing
			End If
		Else
			lngLoggedInUserID = 0
		End If
	
	'Otherwise the username is not correct or the user has been barred so set there User ID to 0
	Else
		lngLoggedInUserID = 0
	End If
	
	'Close the recordset
	rsLoggedInUser.Close
	Set rsLoggedInUser = Nothing
End If

'If the user is logged in and the Guest account posting is enabled then set the user up to be able to post
If lngLoggedInUserID = 0 AND blnGuestPost = True then	
	strLoggedInUsername = strTxtGuest
	lngLoggedInUserID = 2
	intMemberStatus = 0
	blnActiveMember = True
End If

'Make sure the admin account remains active and full access rights
If lngLoggedInUserID = 1 Then 
	intMemberStatus = 3
	blnActiveMember = True
End If

'If the logged on user id is 0 then this person is a guest so set the username to guest
If lngLoggedInUserID = 0 Then strLoggedInUsername = strTxtGuest
	

'Reset server objects
rsConfiguration.Close
Set rsConfiguration = Nothing

%>
<!--#include file="active_users.inc" -->
<!--#include file="code_check.asp" -->
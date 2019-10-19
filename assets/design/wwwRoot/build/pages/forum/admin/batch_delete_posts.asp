<% Option Explicit %>
<!--#include file="common.asp" -->
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


Session.Timeout = 1000

'Set the response buffer to true as we maybe redirecting
Response.Buffer = True 

'Dimension variables
Dim rsTopicDelete		'Holds the database recordset for the topic to be deleted
Dim rsTopic
Dim intNoOfDays
Dim intForumID
Dim lngNumberOfTopics

lngNumberOfTopics = 0

'get teh number of days to delte from
intNoOfDays = CInt(Request.Form("days"))
intForumID = CInt(Request.Form("ForumID"))




'Get all the Topics from the database to be deleted
'Create a recordset object for the Topic in the database
Set rsTopic = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to get the topic from the database
strSQL = "SELECT tblTopic.Topic_ID FROM tblTopic "
If intForumID = 0 Then
	strSQL = strSQL & "WHERE (((tblTopic.Last_entry_date)< " & strDatabaseDateFunction & " - " & intNoOfDays  & "));"
Else
	strSQL = strSQL & "WHERE (((tblTopic.Last_entry_date)< " & strDatabaseDateFunction & " - " & intNoOfDays  & ") AND ((tblTopic.Forum_ID)=" & intForumID & "));"
End If
	
'Query the database
rsTopic.Open strSQL, strCon


'Loop through all the topics to get all the thread in the topics to be deleted
Do While NOT rsTopic.EOF

	lngNumberOfTopics = lngNumberOfTopics + 1	

	'Delete the thread
	strSQL = "DELETE FROM tblThread WHERE tblThread.Topic_ID =" & rsTopic("Topic_ID") & ";"
	
	'Delete the threads
	adoCon.Execute(strSQL)	
	
	'Move to the next record
	rsTopic.MoveNext	
Loop


		
'Initalise the strSQL variable with an SQL statement to get the topic from the database
strSQL = "DELETE FROM tblTopic "
If intForumID = 0 Then
	strSQL = strSQL & "WHERE (((tblTopic.Last_entry_date)<" & strDatabaseDateFunction & " - " & intNoOfDays  & "));"
Else
	strSQL = strSQL & "WHERE (((tblTopic.Last_entry_date)<" & strDatabaseDateFunction & " - " & intNoOfDays  & ") AND ((tblTopic.Forum_ID)=" & intForumID & "));"
End If

'Delete the topics
adoCon.Execute(strSQL)	
	
'Reset Server Objects
rsTopic.Close
Set rsTopic = Nothing
Set adoCon = Nothing
Set strCon = Nothing

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Batch Delete Forum Topics</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
     	
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Batch Delete Forum Topics</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 <br>
 <% = lngNumberOfTopics %> Topics have been Deleted.</font><br>
</div>
</body>
</html>

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



'Set the response buffer to true as we maybe redirecting
Response.Buffer = True

'Set the timeout of the page
Server.ScriptTimeout = 90

'Dimension variables
Dim rsForum		'db recordset holding the forums in this cat
Dim rsTopic		'Holds the database recordset for the Topic to be delete
Dim intCatID		'Holds the forum ID to be deleted
		
'Get the category ID to delete
intCatID = CInt(Request.QueryString("CatID"))	

'Get all the Forums from the database to be deleted
'Create a recordset object for the Topic in the database
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Create a recordset object for the Topic in the database
Set rsTopic = Server.CreateObject("ADODB.Recordset")
			
'Initalise the strSQL variable with an SQL statement to get the topic from the database
strSQL = "SELECT tblForum.* FROM tblForum WHERE tblForum.Cat_ID ="  & intCatID & ";"
			
'Query the database
rsForum.Open strSQL, strCon

'Loop through all the forums for the topics and delete them
Do While NOT rsForum.EOF	
		
	'Get all the Topics from the database to be deleted			
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "SELECT tblTopic.* FROM tblTopic WHERE tblTopic.Forum_ID ="  & CLng(rsForum("Forum_ID")) & ";"
				
	'Query the database
	rsTopic.Open strSQL, strCon
				
	'Loop through all the threads for the topics and delete them
	Do While NOT rsTopic.EOF	
				
		'Delete the posts in this topic
		strSQL = "DELETE FROM tblThread WHERE tblThread.Topic_ID ="  & CLng(rsTopic("Topic_ID")) & ";"
			
		'Write to database
		adoCon.Execute(strSQL)	
				
		'Move to the next record
		rsTopic.MoveNext
	Loop
	
			
	'Delete the topics in this forum
	strSQL = "DELETE FROM tblTopic WHERE tblTopic.Forum_ID ="  & CLng(rsForum("Forum_ID")) & ";"
					
	'Write to database
	adoCon.Execute(strSQL)
	
	
	'Delete the moderators in this forum
	strSQL = "DELETE FROM tblModerator WHERE tblModerator.Forum_ID ="  & CLng(rsForum("Forum_ID")) & ";"
					
	'Write to database
	adoCon.Execute(strSQL)	
	
	
	'close recordset
	rsTopic.Close
		
		
	'Move to the next record
	rsForum.MoveNext
Loop
		
		
'Delete the forum
strSQL = "DELETE FROM tblForum WHERE tblForum.Cat_ID ="  & intCatID & ";"
				
'Write to database
adoCon.Execute(strSQL)	


'Delete the category
strSQL = "DELETE FROM tblCategory WHERE tblCategory.Cat_ID ="  & intCatID & ";"
				
'Write to database
adoCon.Execute(strSQL)	

	
	
'Reset Server Objects
rsForum.Close
Set rsForum = Nothing
Set rsTopic = Nothing
Set adoCon = Nothing
Set strCon = Nothing


'Return to the forum categories page
Response.Redirect "view_forums.asp"
%>
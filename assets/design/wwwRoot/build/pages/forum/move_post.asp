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

'Declare variables
Dim rsNewTopic	'Holds the new topic recordset
Dim lngTopicID	'Holds the topic ID
Dim intForumID	'Holds the forum ID
Dim strSubject	'Holds the new subject

'Check to see this person is the admin or moderator
If lngLoggedInUserID = 1 OR Request.Form("mod") = "1" Then
	
	'Read in the forum details
	lngTopicID = CLng(Request.Form("topicSelect"))
	intForumID = CInt(Request.Form("ForumID"))
	strSubject = Request.Form("subject")
	
	'Intialise the ADO recordset object
	Set rsNewTopic = Server.CreateObject("ADODB.Recordset")
	
	'If a new subject has been entered then place it into the database
	If strSubject <> "" Then
		
		'Initalise the SQL string with a query to get the Topic details
		strSQL = "SELECT TOP 1 tblTopic.* FROM tblTopic "
		strSQL = strSQL & "WHERE Forum_ID =" & intForumID & " "
		strSQL = strSQL & "ORDER By tblTopic.Start_date DESC;"
		
		'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
		rsNewTopic.CursorType = 2
		
		'Set the Lock Type for the records so that the record set is only locked when it is updated
		rsNewTopic.LockType = 3
		
		'Open the topic table
		rsNewTopic.Open strSQL, strCon
		
		'Insert the new topic details in the recordset
		rsNewTopic.AddNew
			
		rsNewTopic.Fields("Forum_ID") = intForumID
		rsNewTopic.Fields("Subject") = strSubject
					
		'Update the database with the new topic details
		rsNewTopic.Update
		
		'Re-run the Query once the database has been updated
		rsNewTopic.Requery
		
		'Move to the last record in the recordset to get the new topic's ID number
		rsNewTopic.MoveLast
		
		'Read in the new topic's ID number
		lngTopicID = CLng(rsNewTopic("Topic_ID"))
		
		'Clean up
		rsNewTopic.Close	
	End If	
		
	'Move the post to another topic
	strSQL = "UPDATE tblThread SET Topic_ID= " & lngTopicID & " WHERE Thread_ID ="  & CLng(Request.Form("MessageID")) & ";"
			
	'Write to database
	adoCon.Execute(strSQL)	
	
	
	'Check there are still topics in the old topic
	strSQL = "SELECT TOP 1 tblThread.Thread_ID FROM tblThread WHERE Topic_ID =" & CLng(Request.Form("oldTopicID")) & ";"
	
	'Open the thread table
	rsNewTopic.Open strSQL, strCon
	
	'See if there is a topic left in the old topic
	If rsNewTopic.EOF Then
		'If there are no topics left then delete the old topic
		strSQL = "DELETE FROM tblTopic WHERE Topic_ID=" & CLng(Request.Form("oldTopicID")) & ";"
			
		'Write to database
		adoCon.Execute(strSQL)	
	End If
	
	'Close the recordset
	rsNewTopic.Close
	
End If

'Reset main server variables
Set rsNewTopic = Nothing
Set adoCon = Nothing
Set strCon = Nothing

'Return to forum
Response.Redirect "display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=1&ThreadPage=" & Request.Form("ThreadPage")
%>
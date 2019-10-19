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

'Dimension variables
Dim rsTopic			'Holds the database recordset for the Topic to (un)lock
Dim strMode			'Holds the mode of the page
Dim lngTopicID			'Holds the Topic ID number


'Read in the message ID number to be deleted
lngTopicID = CLng(Request.QueryString("TopicID"))
strMode = Request.QueryString("mode")

'Check that the user is admin/moderator
If (lngLoggedInUserID = 1 OR blnModerator = True) Then


	'Get the Topic from the database to be locked
	'Create a recordset object for the Topic in the database
	Set rsTopic = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "SELECT tblTopic.Locked FROM tblTopic WHERE tblTopic.Topic_ID ="  & lngTopicID & ";"
		
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsTopic.CursorType = 2
		
	'Set set the lock type of the recordset to optomistic while the record is deleted
	rsTopic.LockType = 3
		
	'Query the database
	rsTopic.Open strSQL, strCon  
	
	'If there is a topic returned then lock it
	If NOT rsTopic.EOF Then
		
		'Lock the topic
		If strMode = "Lock" Then
			rsTopic("Locked") = 1
		'Unlock topic
		ElseIf strMode = "UnLock" Then
			rsTopic("Locked") = 0
		End If
		rsTopic.Update
	End If
		
	
	'Release server objects
	rsTopic.Close
	Set rsTopic = Nothing
End If


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing

'Return to the forum topics page or search page
If Request.QueryString("ReturnPage") = "Search" Then
	Response.Redirect "search.asp?ForumID=" & Request.QueryString("ForumID") & "&TopicID=" & lngTopicID & "&PagePosition=" & Request.QueryString("PagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")
Else
	'Return to the page showing the threads
	Response.Redirect "display_forum_topics.asp?ForumID=" & CInt(Request.QueryString("ForumID")) & "&TopicID=" & lngTopicID & "&PagePosition=" & Request.QueryString("PagePosition")
End If
%>
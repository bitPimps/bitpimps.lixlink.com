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
Dim rsForum		'Holds the database recordset for the forum to (un)lock
Dim strMode		'Holds the mode of the page
Dim intForumID		'Holds the Forum ID number


'Read in the message ID number to be deleted
intForumID = CLng(Request.QueryString("ForumID"))
strMode = Request.QueryString("mode")

'Check that the user is admin/moderator
If lngLoggedInUserID = 1 Then


	'Get the Forum from the database to be locked
	'Create a recordset object for the Forum in the database
	Set rsForum = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to get the forum from the database
	strSQL = "SELECT tblForum.Locked FROM tblForum WHERE tblForum.Forum_ID ="  & intForumID & ";"
		
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsForum.CursorType = 2
		
	'Set set the lock type of the recordset to optomistic while the record is deleted
	rsForum.LockType = 3
		
	'Query the database
	rsForum.Open strSQL, strCon  
	
	'If there is a forum returned then lock it
	If NOT rsForum.EOF Then
		
		'Lock the topic
		If strMode = "Lock" Then
			rsForum("Locked") = 1
		'Unlock topic
		ElseIf strMode = "UnLock" Then
			rsForum("Locked") = 0
		End If
		rsForum.Update
	End If
		
	
	'Release server objects
	rsForum.Close
	Set rsForum = Nothing
End If


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing

'If this is a lock from the admin area then return there
If CInt(Request.QueryString("code")) = 2 Then
	Response.Redirect "admin/view_forums.asp"
Else
	'Return to the page showing the threads
	Response.Redirect "default.asp"
End If
%>
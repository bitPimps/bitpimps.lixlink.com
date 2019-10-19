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
Dim rsDeletePost		'Holds the database recordset for the message
Dim rsThreads			'Holds the database recordset for the other threads
Dim rsTopicDelete		'Holds the database recordset for the Topic to delete if there are no other threads in the Topic
Dim rsNumOfPosts		'holds the database recordset for the number of posts the user has made
Dim strMode			'Holds the mode of the page
Dim lngTopicID			'Holds the Topic ID number
Dim lngMessageID		'Holds the message ID to be deleted
Dim lngDelMsgAuthorID		'Holds the deleted message Author ID
Dim lngNumOfPosts		'Holds the number of posts the user has made


'Read in the message ID number to be deleted
lngMessageID = CLng(Request.QueryString("messageID"))
lngTopicID = CLng(Request.QueryString("TopicID"))


'Get the Post to be deleted from the database
'Create a record set object to the Posts held in the database
Set rsDeletePost = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to get the post from the database
strSQL = "SELECT tblThread.* FROM tblThread WHERE tblThread.Thread_ID ="  & lngMessageID & ";"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsDeletePost.CursorType = 2

'Set set the lock type of the recordset to optomistic while the record is deleted
rsDeletePost.LockType = 3

'Query the database
rsDeletePost.Open strSQL, strCon  

'Read in the author ID of the message to be deleted
If NOT rsDeletePost.EOF Then lngDelMsgAuthorID = CLng(rsDeletePost("Author_ID"))


'Check to make sure the user is deleting the post enetered the post or a moderator or the forum adminstrator
If (lngDelMsgAuthorID = lngLoggedInUserID OR lngLoggedInUserID = 1 OR blnModerator = True) AND (NOT lngLoggedInUserID = 2) Then

	'Delete the record set
	rsDeletePost.Delete
	
	'We need to requry the database before moving on as Access can take a few moments to delete the record
	rsDeletePost.Requery
	
	'Get the number of posts the user has made and take one away
	Set rsNumOfPosts = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to query the database to get the number of posts the user has made
	strSQL = "SELECT tblAuthor.No_of_posts " 
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Author_ID= " & lngDelMsgAuthorID & ";"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsNumOfPosts.CursorType = 2
			
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsNumOfPosts.LockType = 3
			
	'Query the database
	rsNumOfPosts.Open strSQL, strCon
		
	'If there is a record returned by the database then read in the no of posts and decrement it by 1
	If NOT rsNumOfPosts.EOF Then
		
		'Read in the no of posts the user has made and username
		lngNumOfPosts = CLng(rsNumOfPosts("No_of_posts"))
		
		'decrement the number of posts by 1
		lngNumOfPosts = lngNumOfPosts - 1
			
		'Place the new number of posts in the recordset
		rsNumOfPosts.Fields("No_of_posts") =  lngNumOfPosts
		
		'Update the database
		rsNumOfPosts.Update	
	End If
		
	'Close the recordset
	rsNumOfPosts.Close
	
	
	'Check there are other Threads for the Topic 
	'Create a recordet object for the Threads in the database
	Set rsThreads = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to get the Threads from the database
	strSQL = "SELECT tblThread.Thread_ID, tblThread.Message_Date FROM tblThread WHERE tblThread.Topic_ID ="  & lngTopicID & " ORDER BY tblThread.Message_date DESC;"
	
	'Query the database
	rsThreads.Open strSQL, strCon
	
	'Get the Topic from the database to be deleted
	'Create a recordset object for the Topic in the database
	Set rsTopicDelete = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "SELECT tblTopic.* FROM tblTopic WHERE tblTopic.Topic_ID ="  & lngTopicID & ";"
		
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsTopicDelete.CursorType = 2
		
	'Set set the lock type of the recordset to optomistic while the record is deleted
	rsTopicDelete.LockType = 3
		
	'Query the database
	rsTopicDelete.Open strSQL, strCon  
	
	'If there are threads left make sure the last topic date has the date of the last entry
	If NOT rsThreads.EOF Then
		
		'Place the date of the last post in the last enry date
		rsTopicDelete("Last_entry_date") = CDate(rsThreads("Message_date"))
		rsTopicDelete.Update
		
	
	'If there are no more threads in the database for the topic then delete the topic from the database
	Else
		
		'Delete the record set
		rsTopicDelete.Delete
		
		'Reset Server Objects
		Set adoCon = Nothing
		Set strCon = Nothing
		Set rsDeletePost = Nothing
		Set rsThreads = Nothing
		Set rsTopicDelete = Nothing
		Set rsNumOfPosts = Nothing
		
		'Return to the page showing the the topics in the forum
		Response.Redirect "display_forum_topics.asp?ForumID=" & CInt(Request.QueryString("ForumID")) & "&PagePosition=" & Request.QueryString("PagePosition")
	End If
	
	'Release server objects
	Set rsThreads = Nothing
	Set rsTopicDelete = Nothing
	Set rsNumOfPosts = Nothing
	Set rsTopicDelete = Nothing
End If


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsDeletePost = Nothing



'Return to the page showing the threads
Response.Redirect "display_topic_threads.asp?ForumID=" & CInt(Request.QueryString("ForumID")) & "&TopicID=" & lngTopicID & "&PagePosition=" & Request.QueryString("PagePosition") & "&ThreadPage=" & Request.QueryString("ThreadPage")
%>
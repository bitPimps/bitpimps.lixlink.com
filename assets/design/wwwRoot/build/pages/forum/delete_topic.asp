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
Dim rsForumDelete		'Holds the database recordset for the forum to be deleted
Dim rsThreadDelete		'Holds the database recordset for the threads to be deleted
Dim rsNumOfPosts		'holds the database recordset for the number of posts the user has made
Dim rsForum			'Holds the forum for order
Dim strMode			'Holds the mode of the page
Dim lngTopicID 			'Holds the topic ID number to return to
Dim lngDelMsgAuthorID		'Holds the deleted message Author ID
Dim lngNumOfPosts		'Holds the number of posts the user has made
Dim rsTopicDelete


'Read in the message ID number to be deleted
lngTopicID = CLng(Request.QueryString("TopicID"))

'Check to make sure the user is deleting the post is a moderator or the forum adminstrator
If lngLoggedInUserID = 1 OR blnModerator = True Then
	
	'Get the Posts to be deleted from the database
	'Create a record set object to the Posts held in the database
	Set rsThreadDelete = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "SELECT tblThread.* "
	strSQL = strSQL & "FROM tblThread "
	strSQL = strSQL & "WHERE (((tblThread.Topic_ID)= "  & lngTopicID  & "));"
	
	'Query the database
	rsThreadDelete.Open strSQL, strCon 
	
	'Get the number of posts the user has made and take one away
	Set rsNumOfPosts = Server.CreateObject("ADODB.Recordset")	
		
		
	'Loop through all the posts for the topic and delete them
	Do While NOT rsThreadDelete.EOF		
			
		'Initalise the strSQL variable with an SQL statement to query the database to get the number of posts the user has made
		strSQL = "SELECT tblAuthor.Author_ID, tblAuthor.No_of_posts FROM tblAuthor WHERE tblAuthor.Author_ID = " & CLng(rsThreadDelete("Author_ID")) & ";"
				
		'Query the database
		rsNumOfPosts.Open strSQL, strCon
		
		'If there is a record returned by the database then read in the no of posts and decrement it by 1
		If NOT rsNumOfPosts.EOF Then
			
			'Read in the no of posts the user has made and username
			lngNumOfPosts = CLng(rsNumOfPosts("No_of_posts"))
			
			'Decrement by 1 unless the number of posts is already 0
			If NOT lngNumOfPosts = 0 Then
			
				'decrement the number of posts by 1
				lngNumOfPosts = lngNumOfPosts - 1
					
				'Initalise the SQL string with an SQL update command to update the number of posts the user has made
				strSQL = "UPDATE tblAuthor SET " 
				strSQL = strSQL & "tblAuthor.No_of_posts = " & lngNumOfPosts
				strSQL = strSQL & " WHERE tblAuthor.Author_ID= " & CLng(rsThreadDelete("Author_ID")) & ";"
					
				'Write the updated number of posts to the database
				adoCon.Execute(strSQL)	
			End If
		End If
		
		'Close the recordset
		rsNumOfPosts.Close			
			
		'Move to the next record
		rsThreadDelete.MoveNext
	Loop	
	
	
	'Delete the posts in this topic
	strSQL = "DELETE FROM tblThread WHERE tblThread.Topic_ID ="  & lngTopicID & ";"
			
	'Write to database
	adoCon.Execute(strSQL)	
	
	'Delete the topic from the database	
	'Initalise the strSQL variable with an SQL statement to get the topic from the database
	strSQL = "DELETE FROM tblTopic WHERE tblTopic.Topic_ID ="  & lngTopicID & ";"
		
	'Write the updated date of last post to the database
	adoCon.Execute(strSQL)	
	
	'Reset Server Objects
	rsThreadDelete.Close
	Set rsThreadDelete = Nothing
	Set rsNumOfPosts = Nothing
End If

'Reset main server variables
Set adoCon = Nothing
Set strCon = Nothing

Session("msg") = "delTopic"

'Return to the forum topics page or search page
If Request.QueryString("ReturnPage") = "Search" Then
	Response.Redirect "search.asp?ForumID=" & Request.QueryString("ForumID") & "&TopicID=" & lngTopicID & "&PagePosition=" & Request.QueryString("PagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")
Else
	Response.Redirect "display_forum_topics.asp?ForumID=" & Request.QueryString("ForumID") & "&TopicID=" & lngTopicID & "&PagePosition=" & Request.QueryString("PagePosition") 
End If
%>
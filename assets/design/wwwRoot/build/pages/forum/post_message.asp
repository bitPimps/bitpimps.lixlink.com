<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="send_mail_function.inc" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="convert_post_to_text.inc" -->

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
Dim rsNumOfPosts	'Database recordset holding the number of posts a user has made	
Dim rsNewTopic		'Database recordset holding the new topic details
Dim rsNewPost		'Database recordset holding the post message
Dim rsUpdatePost	'Database recordset holding the updated post details
Dim rsTopic		'Database recordset object to hold topic subject
Dim rsPreviousPost	'Database recordset holding the last message to be posted
Dim lngNumOfPosts	'Holds the number of posts a user has made
Dim strName 		'Holds the Users name
Dim blnEmailNotify	'Set to true if the users want to be notified by e-mail of a post
Dim blnEmailSent	'Set to true if the e-mail is sent
Dim strEmailSubject	'Holds the subject of the e-mail
Dim strMessage 		'Holds the Users Message
Dim lngMessageID	'Holds the message ID number
Dim strTempMessageQuote	'Temporary word hold for the first line of a quote
Dim strMessageQuote	'Holds the new first line of a quote
Dim lngQuoteStartPos	'Holds the start position for a quote
Dim lngQuoteEndPos	'Holds the end position of a quote
Dim strTempMessageLink	'Temporary word hold for e-mail and url words
Dim strMessageLink	'Holds the new mesage link
Dim lngLinkStartPos	'Holds the start position for a link
Dim lngLinkEndPos	'Holds the end position for a word
Dim rsSmut		'Database recordset holding any swear words
Dim strMode		'Holds the mode of the page so we know whether we are editing, updating, or new topic
Dim intReturnTopicPage	'Holds the Topic page number to return to
Dim intForumID		'Holds the forum ID number
Dim lngTopicID		'Holds the topic ID number
Dim strSubject		'Holds the subject
Dim objCDOMail		'Holds the CDO mail object
Dim rsEmailNotifty	'Database recorset holding the e-mail details	
Dim strUserName		'Holds the username of the person we are going to email
Dim lngEmailUserID	'Holds the users ID of the person we are going to email	
Dim strUserEmail	'Holds the users e-mail address
Dim strEmailBody	'Holds the body of the e-mail
Dim strCcEmailAddresses 'Holds the e-mail addresses of any carbon copies of the e-mails
Dim rsModerators	'Database recordset holding the moderators user ID and e-mail address
Dim blnSignature	'Holds wether a signature is to be shown or not
Dim intPriority		'Holds the priority of tipics
Dim strPostMessage	'Holds the post to send as mail notify
Dim intReturnPageNum 	'Holds the page number to return to
Dim strForumName	'Holds the name of the forum the message is being posted in
Dim intNumOfPostsInFiveMin 	'Holds the number of posts the user has made in the last 5 minutes
Dim strReturnCode	'Holds the code if the post is not valid and we need to return to forum without posting
Dim strPostDateTime	'Holds the current date and time for the post


'Initalise variables
intReturnTopicPage = 1
intNumOfPostsInFiveMin = 0
strPostDateTime = Now()


'If the user has not logged in then redirect them to the main forum page
If lngLoggedInUserID = 0 OR blnActiveMember = False Then Response.Redirect "default.asp"



'If there is no number must be a new post
If Request.Form("ThreadPage") = "" Then
	intReturnPageNum = 1
Else
	intReturnPageNum = CInt(Request.Form("ThreadPage"))
End If

'calcultae which page the tread is posted on
If NOT Request.Form("ThreadPos") = "" Then
	
	'If the position in the topic is on next page add 1 to the return page number
	If CInt(Request.Form("ThreadPos")) > (intThreadsPerPage * intReturnPageNum) Then
		intReturnPageNum = intReturnPageNum + 1
	End If 
End If	


'Read in user deatils from the post message form
strMode = Request.Form("mode")
intForumID = CInt(Request.Form("ForumID"))
lngTopicID = CLng(Request.Form("TopicID"))
strSubject = Trim(Mid(Request.Form("subject"), 1, 41))
strMessage = Request.Form("Message")
lngMessageID = CLng(Request.Form("MessageID"))
blnEmailNotify = CBool(Request.Form("email"))
blnSignature = CBool(Request.Form("signature"))
intPriority = CInt(Request.Form("priority"))


'If there is no subject or message then don't post the message as won't be able to link to it
If strSubject = "" AND (strMode = "new" OR strMode = "editTopic") Then strReturnCode = "noSubject"
If strMessage = "" Then strReturnCode = "noSubject"

'Place the target as blank and the border as 0 on IE posts
If Request.Form("browser") = "IE" Then 
	
	strMessage = Replace(strMessage, "<a href=", "<a target=""_blank"" href=", 1, -1, 1)
	strMessage = Replace(strMessage, "href='", "href=""", 1, -1, 1)
	strMessage = Replace(strMessage, "<img src=", "<img border=""0"" src=", 1, -1, 1)
	strMessage = Replace(strMessage, "src='", "src=""", 1, -1, 1)
	strMessage = Replace(strMessage, "'>", """>", 1, -1, 1)
	strMessage = Replace(strMessage, " border=0>", ">", 1, -1, 1)
	strMessage = Replace(strMessage, " target=_blank>", ">", 1, -1, 1)
	strMessage = Replace(strMessage, " target=_top>", ">", 1, -1, 1)
	strMessage = Replace(strMessage, " target=_self>", ">", 1, -1, 1)
	strMessage = Replace(strMessage, " target=_parent>", ">", 1, -1, 1)
	strMessage = Replace(strMessage, "<SCRIPT> window.open=NS_ActualOpen; </SCRIPT>", "", 1, -1, 1) 
	'Strip out Zone Alarm Pro's pop up add blocking injected code (bloody pain in the arse software, but some people do run it)
	 If Instr(1, strMessage, "<!-- ZoneLabs Popup Blocking Insertion -->", 1) Then
	  strMessage = Replace(strMessage, "<!-- ZoneLabs Popup Blocking Insertion -->", "", 1, -1, 1)
	  strMessage = Replace(strMessage, "<SCRIPT>" & vbCrLf & "window.open=NS_ActualOpen;" & vbCrLf & "orig_onload = window.onload;" & vbCrLf & "orig_onunload = window.onunload;" & vbCrLf & "window.onload = noopen_load;" & vbCrLf & "window.onunload = noopen_unload;" & vbCrLf & "</SCRIPT>", "", 1, -1, 1)
	  strMessage = Replace(strMessage, "window.open=NS_ActualOpen; orig_onload = window.onload; orig_onunload = window.onunload; window.onload = noopen_load; window.onunload = noopen_unload;", "", 1, -1, 1)
	 End If



'If the users browser type is IE then miss out the message formatting	
Else
	
	'Format the user input by replacing characters with HTML equivelents
	strMessage = Replace(strMessage, "<", "&lt;", 1, -1, 1)
	strMessage = Replace(strMessage, ">", "&gt;", 1, -1, 1)
	strMessage = Replace(strMessage, "       ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, "      ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, "     ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, "    ", "&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, "   ", "&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, vbTab, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
	strMessage = Replace(strMessage, vbCrLf, "<br>" & vbCrLf, 1, -1, 1)


	'Call the format_post.inc file to format the message
	%><!--#include file="format_post.inc" --><%
End If

'Call the code_check.asp file to remove malcious code
strMessage = checkImages(strMessage)
strMessage = checkLinks(strMessage)
strMessage = formatInput(strMessage)

'Get rid of scripting tags in the subject
strSubject = Replace(strSubject, "<", "&lt;", 1, -1, 1)
strSubject = Replace(strSubject, ">", "&gt;", 1, -1, 1)
strSubject = Replace(strSubject, """", " ", 1, -1, 1)
strSubject = Replace(strSubject, "'", "&#146;", 1, -1, 1)
strSubject = formatInput(strSubject)



'Replace swear words with other words with ***
'Intialise the ADO recordset object
Set rsSmut = Server.CreateObject("ADODB.Recordset")
	
'Initalise the SQL string with a query to read in all the words from the smut table
strSQL = "SELECT tblSmut.* FROM tblSmut"

'Open the recordset
rsSmut.Open strSQL, strCon

'Loop through all the words to check for
Do While NOT rsSmut.EOF
	
	'Replace the swear words with the words in the database the swear words
	strMessage = Replace(strMessage, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
	strSubject = Replace(strSubject, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)

	'Move to the next word in the recordset
	rsSmut.MoveNext
Loop

'Reset server varaible
rsSmut.Close
Set rsSmut = Nothing



'Check the user is not pressing refresh and submitting the same post more than once
'Intialise the ADO recordset object
Set rsPreviousPost = Server.CreateObject("ADODB.Recordset")
	
'Initalise the SQL string with a query to read in the last post from the database
strSQL = "SELECT TOP 10 tblThread.Message, tblThread.Author_ID, tblThread.Message_date FROM tblThread ORDER BY tblThread.Message_date DESC;"

'Open the recordset
rsPreviousPost.Open strSQL, strCon

'If there is a post returned by the recorset then check it's not already posted and for spammers
If NOT rsPreviousPost.EOF Then
	'Check the last message posted is not the same as the new one
 	If (rsPreviousPost("Message") = strMessage) AND NOT (strMode = "edit" OR strMode = "editTopic") Then 
	
		'Set the return code
		strReturnCode = "posted"
	End If
	
	'Check the user hasn't posted in the last limit set for secounds and not more than 5 times in the last spam time limit set for minutes
	Do While NOT rsPreviousPost.EOF AND NOT lngLoggedInUserID = 2
	
		'Check the user hasn't posted in the last spam time limit set for seconds
		If rsPreviousPost("Author_ID") = lngLoggedInUserID AND DateDiff("s", rsPreviousPost("Message_date"), now()) < intSpamTimeLimitSeconds Then
			
			'Set the return code
			strReturnCode = "maxS"
		End If
		
		'Check that the user hasn't posted 5 posts in the spam time limit set for minutes
		If rsPreviousPost("Author_ID") = lngLoggedInUserID AND DateDiff("n", rsPreviousPost("Message_date"), now()) < intSpamTimeLimitMinutes Then
			
			'Add 1 to the number of posts in the last 5 minutes
			intNumOfPostsInFiveMin = intNumOfPostsInFiveMin + 1
			
			'If the number of posts is more than 3 then set the return code
			If intNumOfPostsInFiveMin = 5 Then
				
				'Set the return code
				strReturnCode = "maxM"
			End If
		End If
	
		
		'Move to the next post
		rsPreviousPost.MoveNext
	
	Loop
End If

rsPreviousPost.Close
Set rsPreviousPost = Nothing


'If there is a return code then this post is not valid so redirect to error page admin can post no matter what
If strReturnCode <> "" AND lngLoggedInUserID > 1 AND NOT (strMode = "edit" OR strMode = "editTopic") Then
	
	'Clean up
	Set adoCon = Nothing
	Set strCon = Nothing
							
	'Redirect to error page
	Response.Redirect "not_posted.asp?mode=" & strReturnCode & "&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intReturnTopicPage & "&ThreadPage=" & intReturnPageNum
End If


'If this is a new topic then save the new subject heading and read back the new topic ID number
If strMode = "new" Then
	
	'Intialise the ADO recordset object
	Set rsNewTopic = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the SQL string with a query to get the Topic details
	strSQL = "SELECT TOP 1 tblTopic.* FROM tblTopic "
	strSQL = strSQL & "WHERE Forum_ID =" & intForumID & " "
	strSQL = strSQL & "ORDER By tblTopic.Start_date DESC;"
	
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsNewTopic.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsNewTopic.LockType = 3
	
	'Open the author table
	rsNewTopic.Open strSQL, strCon
	
	'Insert the new topic details in the recordset
	rsNewTopic.AddNew
		
	rsNewTopic.Fields("Forum_ID") = intForumID
	rsNewTopic.Fields("Subject") = strSubject
	rsNewTopic.Fields("Priority") = intPriority
	rsNewTopic.Fields("Start_date") = strPostDateTime
				
	'Update the database with the new topic details
	rsNewTopic.Update
	
	'Re-run the Query once the database has been updated
	rsNewTopic.Requery
	
	'Move to the last record in the recordset to get the new topic's ID number
	rsNewTopic.MoveLast
	
	'Read in the new topic's ID number
	lngTopicID = CLng(rsNewTopic("Topic_ID"))
	
	'Set the rerun page properties
	intReturnPageNum = 1
	
	'Clean up
	rsNewTopic.Close	
End If


'If the post is the first in the thread then update the topic details
If strMode = "editTopic" Then
	
	'Intialise the ADO recordset object
	Set rsNewTopic = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the SQL string with a query to get the Topic details
	strSQL = "SELECT tblTopic.* FROM tblTopic "
	strSQL = strSQL & "WHERE Topic_ID =" & lngTopicID & ";"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsNewTopic.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsNewTopic.LockType = 3
	
	'Open the author table
	rsNewTopic.Open strSQL, strCon
	
	'Update the recorset
	rsNewTopic.Fields("Subject") = strSubject
	rsNewTopic.Fields("Priority") = intPriority
				
	'Update the database with the new topic details
	rsNewTopic.Update
	
	'Change the mode to edit
	strMode = "edit"
	
	rsNewTopic.Close
	
End If


'If the post is a previous post that has been edited then update the post
If strMode = "edit" Then
	
	'Intialise the ADO recordset object
	Set rsUpdatePost = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database get the message details
	strSQL = "SELECT tblThread.Thread_ID, tblThread.Message, tblThread.Show_signature, tblThread.Email_notify, tblThread.IP_addr "
	strSQL = strSQL & "FROM tblThread "
	strSQL = strSQL & "WHERE (((tblThread.Thread_ID)=" & lngMessageID & "));"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsUpdatePost.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsUpdatePost.LockType = 3
	
	'Open the author table
	rsUpdatePost.Open strSQL, strCon
		
	'Enter the updated post into the recordset
	rsUpdatePost.Fields("Message") = strMessage
	rsUpdatePost.Fields("Email_notify") = blnEmailNotify
	rsUpdatePost.Fields("Show_signature") = CBool(blnSignature)
	rsUpdatePost.Fields("IP_addr") = Request.ServerVariables("REMOTE_ADDR")
	
	'Update the database
	rsUpdatePost.Update
	
	'Read in the page postion in the Forum topics to return to
	intReturnTopicPage = CInt(Request.QueryString("PagePosition"))

	'Close rs
	rsUpdatePost.Close

'Else this is a new post so save the new post to the database
Else
	
	'Intialise the ADO recordset object
	Set rsNewPost = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database get the message details
	strSQL = "SELECT TOP 1 tblThread.Topic_ID, tblThread.Author_ID, tblThread.Email_notify, tblThread.Message, tblThread.Message_date, tblThread.Show_signature, tblThread.IP_addr "
	strSQL = strSQL & "FROM tblThread;"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsNewPost.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsNewPost.LockType = 3
	
	'Open the threads table
	rsNewPost.Open strSQL, strCon
	
	'Insert the new Thread details in the recordset
	rsNewPost.AddNew
		
	rsNewPost.Fields("Topic_ID") = lngTopicID
	rsNewPost.Fields("Author_ID") = lngLoggedInUserID
	rsNewPost.Fields("Email_notify") = blnEmailNotify
	rsNewPost.Fields("Message") = strMessage
	rsNewPost.Fields("Message_date") = strPostDateTime
	rsNewPost.Fields("Show_signature") = blnSignature
	rsNewPost.Fields("IP_addr") = Request.ServerVariables("REMOTE_ADDR")
	
				
	'Update the database with the new Thread
	rsNewPost.Update	
	
	
	'Initalise the SQL string with an SQL update command to update the date of the last post in the Topic table
	strSQL = "UPDATE tblTopic SET "
	strSQL = strSQL & "tblTopic.Last_entry_date = " & strDatabaseDateFunction & " "
	strSQL = strSQL & "WHERE (((tblTopic.Topic_ID)= " & lngTopicID & "));"
		
	'Write the updated date of last post to the database
	adoCon.Execute(strSQL)	
	
	
	'Get the number of posts the user has made
	Set rsNumOfPosts = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database to get the number of posts the user has made
	strSQL = "SELECT tblAuthor.No_of_posts, tblAuthor.Username " 
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Author_ID= " & lngLoggedInUserID & ";"
		
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsNumOfPosts.LockType = 3
		
	'Query the database
	rsNumOfPosts.Open strSQL, strCon
	
	'If there is a record returned by the database then read in the no of posts and increment it by 1
	If NOT rsNumOfPosts.EOF Then
	
		'Read in the no of posts the user has made and username
		lngNumOfPosts = CLng(rsNumOfPosts("No_of_posts"))
		strName = rsNumOfPosts("Username")
	
		'Inrement the number of posts by 1
		lngNumOfPosts = lngNumOfPosts + 1
		
		'Initalise the SQL string with an SQL update command to update the number of posts the user has made
		strSQL = "UPDATE tblAuthor SET " 
		strSQL = strSQL & "tblAuthor.No_of_posts = " & lngNumOfPosts
		strSQL = strSQL & " WHERE tblAuthor.Author_ID= " & lngLoggedInUserID & ";"
			
		'Write the updated number of posts to the database
		adoCon.Execute(strSQL)		
	End If
	
	'Close the recordset
	rsNumOfPosts.Close
	
	'Set the e-mail subject
	strEmailSubject = strWebsiteName & " " & strTxtForumPostNotifi
	
	'If we are to send an e-mail notification and send the post with the e-mail then format the post for the e-mai
	If blnSendPost = True AND (blnEmail = True Or blnAdminEmail = True) Then
		
		'Get the subject of the topic the thread is posted in
		'Intialise the ADO recordset object
		Set rsTopic = Server.CreateObject("ADODB.Recordset")
		
		'Initalise the SQL string with a query to get the Topic details
		strSQL = "SELECT tblForum.Forum_name, tblTopic.Subject FROM tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID WHERE Topic_ID =" & lngTopicID & ";"
		
		'Open the author table
		rsTopic.Open strSQL, strCon
		
		'Get the topic subject
		If NOT rsTopic.EOF Then 
			strSubject = rsTopic("Subject")
			strForumName = rsTopic("Forum_name")
		End If
		
		'Close the recordset
		rsTopic.Close
		
		'Format the post to be sent with the e-mail
		strPostMessage = "<br><br><br><b>" & strTxtForum & ":</b> " & strForumName
		strPostMessage = strPostMessage & "<br><b>" & strTxtTopic & ":</b> " & strSubject
		strPostMessage = strPostMessage & "<br><b>" & strTxtPostedBy & ":</b> " & strName & "<br><br>"
		strPostMessage = strPostMessage & strMessage

		'Change the path to the emotion symbols to include the path to the images
		strPostMessage = Replace(strPostMessage, "src=""smileys/smiley", "src=""" & strForumPath & "/smileys/smiley", 1, -1, 1)
	End If
				
	'If not a new topic and e-mail is turned on for the forum then send an e-mail notification to the author (if they want it)
	If NOT strMode = "new" AND blnEmail = True Then
	
		'Initialise the e-mail notify boolean variable
		blnEmailNotify = False
	
		'Intialise the ADO recordset object
		Set rsEmailNotifty = Server.CreateObject("ADODB.Recordset")
		
		'Initalise the strSQL variable with an SQL statement to query the database get the details for the email
		strSQL = "SELECT tblAuthor.Username, tblAuthor.Author_ID, tblAuthor.Author_email, tblThread.Topic_ID "
		strSQL = strSQL & "FROM tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID "
		'Write a differnt statement for SQL server
		If strDatabaseType = "SQLServer" Then
			strSQL = strSQL & "WHERE (tblThread.Topic_ID =" & lngTopicID & ") AND (tblThread.Email_notify = 1) "
		Else
			strSQL = strSQL & "WHERE (tblThread.Topic_ID =" & lngTopicID & ") AND (tblThread.Email_notify = True) "
		End If
		strSQL = strSQL & "ORDER BY tblAuthor.Author_ID ASC;"
		
		'Query the database
		rsEmailNotifty.Open strSQL, strCon
		
		'Initialise e-mail user id variable
		lngEmailUserID = 0
			
		'If a record is returned by the recordset then read in the details and send the e-mail
		Do While NOT rsEmailNotifty.EOF
		
			'Check we havn't already sent this person an e-mail
			If NOT lngEmailUserID = CLng(rsEmailNotifty("Author_ID")) Then 
		
				'Read in the details from the recordset for the e-mail
				strUserName = rsEmailNotifty("Username")
				lngEmailUserID = CLng(rsEmailNotifty("Author_ID"))
				strUserEmail = rsEmailNotifty("Author_email")
				
				'If the user wants to be e-mailed and the user has enetered there e-mail and they are not the original topic writter then send an e-mail
				If NOT strUserEmail = "" AND NOT lngEmailUserID = lngLoggedInUserID Then
							
					'Initailise the e-mail body variable with the body of the e-mail
					strEmailBody = strTxtHi & " " & decodeString(strUserName) & ","
					strEmailBody = strEmailBody & "<br><br>" & strTxtEmailAMeesageHasBeenPosted & " " & strWebsiteName & " " & strTxtThatYouAskedKeepAnEyeOn
					strEmailBody = strEmailBody & "<br><br>" & strTxtEmailClickOnLinkBelowToView & " : -"
					strEmailBody = strEmailBody & "<br><br><a href=""" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & """>" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & "</a>"
					
					'If we are to send the post then attach it as well
					If blnSendPost = True Then
						strEmailBody = strEmailBody & strPostMessage
					End If
					
					'Call the function to send the e-mail
					blnEmailSent = SendMail(strEmailBody, decodeString(strUserName), decodeString(strUserEmail), strWebsiteName, decodeString(strForumEmailAddress), strEmailSubject, strMailComponent, true)
				End If
			End If
			
			'Move to the next record in the recordset
			rsEmailNotifty.MoveNext
		Loop
	End If

	'If the forum adminstrator has requested e-mail notification of a post then send an e-mail
	If blnAdminEmail = True AND (lngLoggedInUserID <> 1 OR blnAdminEmail = False) Then
	
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & strWebsiteName & " " & strTxtForumAdministrator & ","
		strEmailBody = strEmailBody & "<br><br>" & strTxtEmailAMeesageHasBeenPosted & " " & strWebsiteName & "."
		strEmailBody = strEmailBody & "<br><br>" & strTxtEmailClickOnLinkBelowToView & " : -"
		strEmailBody = strEmailBody & "<br><br><a href=""" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & """>" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & "</a>"
	
		'If we are to send the post then attach it as well
		If blnSendPost = True Then
			strEmailBody = strEmailBody & strPostMessage
		End If
	
		'Call the funtion to send the e-mail
		blnEmailSent = SendMail(strEmailBody, decodeString(strUserName), decodeString(strForumEmailAddress), strWebsiteName, decodeString(strForumEmailAddress), strEmailSubject, strMailComponent, true)
	End If
	
	'If the forum moderators have requested e-mail notification of a post then send an e-mail
	If blnAdminEmail = True Then
	
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & strWebsiteName & " " & strTxtForumModerator & ","
		strEmailBody = strEmailBody & "<br><br>" & strTxtEmailAMeesageHasBeenPostedOnForumNum & " " & intForumID & " " & strTxtOn & " " & strWebsiteName & "."
		strEmailBody = strEmailBody & "<br><br>" & strTxtEmailClickOnLinkBelowToView & " : -"
		strEmailBody = strEmailBody & "<br><br><a href=""" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & """>" & strForumPath & "/display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ThreadPage=" & intReturnPageNum & "</a>"

		'If we are to send the post then attach it as well
		If blnSendPost = True Then
			strEmailBody = strEmailBody & strPostMessage
		End If

		'Now we need to get all the moderators e-mail addresses from the database
		'Intialise the ADO recordset object
		Set rsModerators = Server.CreateObject("ADODB.Recordset")
		
		'Initalise the strSQL variable with an SQL statement to query the database to get the email address of the moderator(s) for this forum
		strSQL = "SELECT tblModerator.Author_ID, tblAuthor.Author_email, tblAuthor.Username "
		strSQL = strSQL & "FROM tblAuthor INNER JOIN tblModerator ON tblAuthor.Author_ID = tblModerator.Author_ID "
		strSQL = strSQL & "WHERE ((Not (tblAuthor.Author_email)='') AND (((tblModerator.Forum_ID)=" & intForumID & ") OR (tblModerator.Forum_ID)=0));"
			
		'Query the database
		rsModerators.Open strSQL, strCon
		
		'If there are moderators returned by the recordset then get the e-mail addresses
		Do While NOT rsModerators.EOF
		
			'If the person who posted the message is the same as the moderator then don't send them an e-mail
			If NOT rsModerators("Author_ID") = lngLoggedInUserID Then
			
				'Read in the username and e-mail address
				strUserName = rsModerators("Username")
				strUserEmail = rsModerators("Author_email")
			
				'Send an e-mail to the moderator
				blnEmailSent = SendMail(strEmailBody, decodeString(strUserName), decodeString(strUserEmail), strWebsiteName, decodeString(strForumEmailAddress), strEmailSubject, strMailComponent, true)
			End If	
			
			'Move to the next rocord in the recordset
			rsModerators.MoveNext
		Loop
	End If
End If


'Reset Server Objects
Set rsNewTopic = Nothing
Set rsNewPost = Nothing
Set rsUpdatePost = Nothing
Set rsEmailNotifty = Nothing
Set rsNumOfPosts = Nothing
Set rsTopic = Nothing
Set adoCon = Nothing
Set strCon = Nothing

	
	
'Return to the page showing the threads
Response.Redirect "display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=1&ThreadPage=" & intReturnPageNum
%>
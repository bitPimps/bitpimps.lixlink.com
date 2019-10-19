<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="forum_permissions.inc" -->
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
Dim rsThreadMessage		'Holds the database recordset for the message
Dim rsEditTopic			'Holds the topic if it is to be edited
Dim rsForum			'Recordset object holding the forum details
Dim strMode			'Holds the mode of the page
Dim intForumID			'Holds the forum ID number
Dim lngTopicID			'Holds the Topic ID number
Dim strTopicSubject		'Holds the title of the topic
Dim intTopicPriority		'Holds the priority of the topic
Dim lngMessageID		'Holds the message ID to be edited
Dim lngPostUserID		'Holds the user ID of the user to post the message
Dim blnForumLocked		'Set to true if the forum is locked
Dim blnEmailNotify		'Set to true if the users want to be notified by e-mail of a post
Dim strPostPage 		'Holds the page the form is posted to
Dim intRecordPositionPageNum	'Holds the recorset page number to show the Threads for
Dim dtmStartDate
Dim dtmMessageDate


'Get the mode of the page
If CInt(Request.QueryString("ThreadPage")) = 1 Then
	intRecordPositionPageNum = 1
Else
	intRecordPositionPageNum = Request.QueryString("ThreadPage")
End If

strMode = "edit"

'Read in the message ID number to edit
lngMessageID = CLng(Request.QueryString("messageID"))
intForumID = CInt(Request.QueryString("ForumID"))
lngTopicID = CLng(Request.QueryString("TopicID"))

'Create a recordset to get the forum details
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.Locked FROM tblForum WHERE Forum_ID = " & intForumID

'Query the database
rsForum.Open strSQL, strCon

'Read in wether the forum is locked or not
If NOT rsForum.EOF Then blnForumLocked = CBool(rsForum("Locked"))

'If the forum level for the user on this forum is 2 (read only) set the forum to be locked
If (intMemberSecurityLevel = 2 AND blnModerator = False AND NOT lngLoggedInUserID = 1) AND (lngLoggedInUserID > 0) Then blnForumLocked = True


'Create a record set object to the Threads held in the database
Set rsEditTopic = Server.CreateObject("ADODB.Recordset")
		
'Initalise the strSQL variable with an SQL statement to query the database get the message details
strSQL = "SELECT tblTopic.Subject, tblTopic.Priority, tblTopic.Locked, tblTopic.Start_date "
strSQL = strSQL & "FROM tblTopic "
strSQL = strSQL & "WHERE (((tblTopic.Topic_ID)=" & lngTopicID & "));"
	
'Query the database
rsEditTopic.Open strSQL, strCon 

'If a topic returned read in it's details and if it is locked
If NOT rsEditTopic.EOF Then
	
	strTopicSubject = rsEditTopic("Subject")
	intTopicPriority = CInt(rsEditTopic("Priority"))
	'If the forums not locked check that the topics not locked either
	If blnForumLocked = False Then blnForumLocked = CBool(rsEditTopic("Locked"))
	dtmStartDate = CDbl(rsEditTopic("Start_date"))
End If


'Get the message from the database
'Create a record set object to the Threads held in the database
Set rsThreadMessage = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database get the message details
strSQL = "SELECT tblThread.Author_ID, tblThread.Message, tblThread.Email_notify, tblThread.Message_date "
strSQL = strSQL & "FROM tblThread "
strSQL = strSQL & "WHERE (((tblThread.Thread_ID)=" & lngMessageID & "));"

'Query the database
rsThreadMessage.Open strSQL, strCon 


'Read in the details from the recordset
strMessage = rsThreadMessage("Message")
lngPostUserID = CLng(rsThreadMessage("Author_ID"))
blnEmailNotify = CBool(rsThreadMessage("Email_notify"))
dtmMessageDate =  CDbl(rsThreadMessage("Message_date"))


'If the start topic date and the message date are the same then the user can edit the topic title
If dtmStartDate = dtmMessageDate Then strMode = "editTopic"
		
'Set the user to guest so they can't edit the post if it is an all forums post unless they are the admin
If strMode = "editTopic" AND intTopicPriority = 3 AND NOT lngLoggedInUserID = 1 Then lngLoggedInUserID = 2
	
'Reset Server Objects
rsForum.Close
Set rsForum = Nothing
rsEditTopic.Close
Set rsEditTopic = Nothing
rsThreadMessage.Close
Set rsThreadMessage = Nothing
Set adoCon = Nothing
Set strCon = Nothing

%>
<!--#include file="edit_post.inc" -->
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Edit Post</title>

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";
	
	//Check for message
	if (document.frmAddMessage.message.value==""){
		errorMsg += "\n\t<% = strTxtNoMessageError %>";
	}
	
	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}
// -->
</script>
<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtEditPost %></div>
<div align="center"><a href="display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = CInt(Request.QueryString("PagePosition")) %>&ThreadPage=<% = Request.QueryString("ThreadPage") %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br><br>
 <%
'If the Post is by the logged in user or the adminstrator/moderator then display a form to edit the post
If (lngLoggedInUserID = lngPostUserID OR lngLoggedInUserID = 1 OR blnModerator = True) AND (blnActiveMember = True) AND (blnForumLocked = False OR lngLoggedInUserID = 1) AND (NOT lngLoggedInUserID = 2) Then

	'See if the users browser is Internet Explorer and not the Mac version
	If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE", 1) > 0 AND InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MAC", 1) = 0 AND InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "Opera", 1) = 0 AND blnIEEditor = True Then
		
		'See if the users version on Internet Explorer is 5 or above
		If Trim(Mid(Request.ServerVariables("HTTP_USER_AGENT"), CInt(inStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE", 1)+5), 1)) => 5 Then
			
			'Open the message form for Internet Explorer users 5 and above
			%><!--#include file="IE_message_form.inc" --><%
		Else
			'Open up the mesage form for IE 4 and below users
			%><!--#include file="message_form.inc" --><%
		End If
		
	'Open up the massge form for all other browser users
	Else
		%><!--#include file="message_form.inc" --><%
	End If
 %>
  <br>
  <%
'Else if the forum is locked display a message telling the user so
ElseIf blnForumLocked = True Then
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtForumLockedByAdmim & "</span><br><br>"
  
'Else the user is not the person who posted the message so display an error message
Else
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtNoPermissionToEditPost & "</span><br><br>"
	Response.Write vbCrLf & "<a href=""javascript:history.back(1)"" target=""_self"">" & strTxtReturnForumTopic & "</a><br>"
End If
%>
  <br>
  <div align="center">
<% 
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	If blnTextLinks = True Then 
		Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums</a> version 6.34</span>")
	Else
  		Response.Write("<a href=""http://www.webwizforums.com"" target=""_blank""><img src=""" & strImagePath & "web_wiz_guide.gif"" border=""0"" alt=""Powered by Web Wiz Forums version 6.34""></a>")
	End If
	
	Response.Write("<br><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2002 Web Wiz Guide</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
</div>
</div>
<!-- #include file="footer.inc" -->
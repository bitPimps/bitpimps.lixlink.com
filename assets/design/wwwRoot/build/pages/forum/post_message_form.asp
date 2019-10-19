<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
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
Dim rsQuoteThread		'Recordset object
Dim rsForum			'Recordset object
Dim strMode			'Holds the mode of the page
Dim intForumID			'Holds the forum ID number
Dim lngTopicID			'Holds the Topic ID number
Dim lngMessageID		'Holds the Thread ID of the post
Dim strReturnPage		'Holds the page to return to
Dim strReturnPageProperties	'Holds the properties of the return page 
Dim strQuoteUsername		'Holds the username of the user being quoted
Dim dtmQuotedThreadDate		'Holds the date the quoted message was posted
Dim blnForumLocked		'Set to true if the forum is locked
Dim intTopicPriority		'Holds the priority of the topic
Dim strPostPage 		'Holds the page the form is posted to
Dim intTotalNumOfThreads	'Holds the total number of therads in this topic
Dim intRecordPositionPageNum	'Holds the recorset page number to show the Threads for


'Intialise variables
lngTopicID = 0
lngMessageID = 0
intTopicPriority = 0
intRecordPositionPageNum = 1


'Read in the forum and topic ID number and mode
strMode = Request.QueryString("mode")
intForumID = CInt(Request.QueryString("ForumID"))
lngTopicID = CLng(Request.QueryString("TopicID"))


'Get the forum page to return to
Select Case Request.QueryString("ReturnPage")
	Case "Topic"
		'Read in the forum and topic to return to
		strReturnPage = "display_forum_topics.asp"
		strReturnPageProperties = "?ReturnPage=Topic&ForumID=" & CInt(Request.QueryString("ForumID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Read in the thread and forum to return to
	Case "Thread"
		strReturnPage = "display_topic_threads.asp"
		strReturnPageProperties = "?ReturnPage=Thread&ForumID=" & CInt(Request.QueryString("ForumID")) & "&TopicID=" & CLng(Request.QueryString("TopicID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition")) & "&ThreadPage=" & Request.QueryString("ThreadPage")
	
	'Read in the search to return to
	Case "Search"
		strReturnPage = "search.asp"
		strReturnPageProperties = "?ReturnPage=Search&SearchPagePosition=" & Request.QueryString("SearchPagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")
	
	'Read in the private message to return to
	Case "pm"
		strReturnPage = "pm_welcome.asp"
		strReturnPageProperties = "?ReturnPage=pm"
	
	'Read in the active topic page to return to
	Case "Active"
		strReturnPage = "active_topics.asp"
		strReturnPageProperties = "?PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Else return to the forum main page
	Case Else
		strReturnPage = "default.asp"
		strReturnPageProperties = "?ForumID=0"
End Select


'Create a recordset to get the forum details
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Read in the forum name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.Password, tblForum.Forum_code, tblForum.Locked FROM tblForum WHERE Forum_ID = " & intForumID

'Query the database
rsForum.Open strSQL, strCon


'If there is a record returned by the recordset then check to see if you need a password to enter it
If NOT rsForum.EOF Then
	
	'Read in wether the forum is locked or not
	blnForumLocked = CBool(rsForum("Locked"))
	
	'If the forum requires a password and a logged in forum code is not found on the users machine then send them to a login page
	If NOT rsForum("Password") = "" and NOT Request.Cookies("PrForum")("Forum" & intForumID) = rsForum("Forum_code") Then
		
		'Reset Server Objects
		Set adoCon = Nothing
		Set strCon = Nothing
		Set rsForum = Nothing 
		
		'Redirect to a page asking for the user to enter the forum password
		Response.Redirect "forum_password_form.asp?ReturnPage=Topic&ForumID=" & intForumID
	End If
End If

'Reset server object
Set rsForum = Nothing

'If the forum level for the user on this forum is 2 (read only) set the forum to be locked
If (intMemberSecurityLevel = 2 AND blnModerator = False AND NOT lngLoggedInUserID = 1) AND (lngLoggedInUserID > 0) Then blnForumLocked = True


If strMode = "quote" Then
	
	'Get the number this thread is after
	intTotalNumOfThreads = Request.QueryString("ThreadPos")
	
	'Get the return thread page
	intRecordPositionPageNum = Request.QueryString("ThreadPage")

	'Get the message from the database
	'Create a record set object to the Threads held in the database
	Set rsQuoteThread = Server.CreateObject("ADODB.Recordset")
	
	'Initialise the sql query to get the thread details to be quoted
	strSQL = "SELECT tblAuthor.Username, tblThread.Message, tblThread.Message_date "
	strSQL = strSQL & "FROM tblThread INNER JOIN tblAuthor ON tblThread.Author_ID = tblAuthor.Author_ID "
	strSQL = strSQL & "WHERE tblThread.Thread_ID = " & CLng(Request.QueryString("threadID"))
	
	
	'Query the database
	rsQuoteThread.Open strSQL, strCon 
	
	'Read in the date of the quoted message
	dtmQuotedThreadDate = CDate(rsQuoteThread("Message_date"))
	
	'Read in the username to be quoted
	strQuoteUsername = rsQuoteThread("Username")
	
	'Build up the quoted thread post
	strMessage = "[QUOTE] " & strTxtOriginallyPostedBy & " " & strQuoteUsername & " " & strTxtOn & " " & DateFormat(dtmQuotedThreadDate, saryDateTimeData) & "<br>"
	
	'Read in the quoted thread from the recordset
	strMessage = strMessage & rsQuoteThread("Message")
		
%>
<!--#include file="edit_post.inc" -->
<%

	strMessage = strMessage & vbCrLf & "[/QUOTE]" & vbCrLf
	
	'Close recordset
	rsQuoteThread.Close
End If

'Reset server objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsQuoteThread = Nothing

%>
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Post New Topic</title>


<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001
    	 If you want your forum then goto http://www.webwizforums.com --> 


<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";

<%
'If this is a new post then check for a subject heading
If strMode = "new" Then
%>	
	//Check for a subject
	if (document.frmAddMessage.subject.value==""){
		errorMsg += "\n\t<% = strTxtErrorTopicSubject %>";
	}
<%
End If
%>
	
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
<div align="center" class="heading"><% If strMode = "quote" Then Response.Write(strTxtPostReply) Else Response.Write(strTxtPostNewTopic) %></div>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br><br>
 <%
'If the user has logged in then display the from to allow the user to post a new message
If NOT lngLoggedInUserID = 0 AND blnActiveMember = True AND (blnForumLocked = False OR lngLoggedInUserID = 1) Then

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

'If the users account is suspended then let them know
ElseIf blnActiveMember = False Then
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtForumMemberSuspended & "</span><br><br>"

'Else if the forum is locked display a message telling the user so
ElseIf blnForumLocked = True Then
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtForumLockedByAdmim & "</span><br><br>"

'Else the user is not logged in so let them know to login before they can post a message
Else
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtMustBeRegistered & "</span><br><br>"
	Response.Write vbCrLf & "<a href=""register_form.asp" & strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;&nbsp;<a href=""login_user.asp" &  strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a><br>"
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
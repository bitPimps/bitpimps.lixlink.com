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
Dim rsForum 			'Holds the Recordset for the forum details
Dim rsTopicDetails		'Holds the Recordset for the Topic Count
Dim rsTopic			'Holds the Recordset for the Topic details
Dim intForumID			'Holds the forum ID number
Dim strForumName		'Holds the forum name
Dim lngNumberOfReplies		'Holds the number of replies for a topic
Dim lngTopicID			'Holds the topic ID
Dim strSubject			'Holds the topic subject
Dim strTopicStartUsername 	'Holds the username of the user who started the topic
Dim lngTopicStartUserID		'Holds the users Id number for the user who started the topic
Dim lngNumberOfViews		'Holds the number of views a topic has had
Dim lngLastEntryMessageID	'Holds the message ID of the last entry
Dim strLastEntryUsername	'Holds the username of the last person to post a message in a topic
Dim lngLastEntryUserID		'Holds the user's ID number of the last person to post a meassge in a topic
Dim dtmLastEntryDate		'Holds the date the last person made a post in the topic
Dim intRecordPositionPageNum	'Holds the recorset page number to show the topics for
Dim intTotalNumOfPages		'Holds the total number of pages in the recordset
Dim intRecordLoopCounter	'Holds the loop counter numeber
Dim intTopicPageLoopCounter	'Holds the number of pages there are in the forum
Dim intLinkPageNum		'Holss the page number to link to
Dim intShowTopicsFrom		'Holds when to show the topics from
Dim strShowTopicsFrom		'Holds the display text from when the topics are shown from
Dim blnForumLocked		'Set to true if the forum is locked
Dim blnTopicLocked		'set to true if the topic is locked
Dim intPriority			'Holds the priority level of the topic
Dim intNumberOfTopicPages	'Holds the number of topic pages
Dim intTopicPagesLoopCounter	'Holds the number of loops

'Read in the Forum ID to display the Topics for
intForumID = CInt(Request.QueryString("ForumID"))


'If there is no Forum ID to display the Topics for then redirect the user to the main forum page
If intForumID = 0 Then Response.Redirect "default.asp"


'If this is the first time the page is displayed then the Forum Topic record position is set to page 1
If Request.QueryString("PagePosition") = "" OR Request.QueryString("PagePosition") = 0 Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the Forum Topic record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("PagePosition"))
End If	


      
'Create a recordset to get the forum details
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Read in the forum name from the database
'Initalise the strSQL variable with an SQL statement to query the database
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpForumsAllWhereForumIs @intForumID = " & intForumID
Else
	strSQL = "SELECT tblForum.Forum_name, tblForum.Password, tblForum.Forum_code, tblForum.Locked FROM tblForum WHERE Forum_ID = " & intForumID & ";"
End If

'Query the database
rsForum.Open strSQL, strCon


'If there is a record returned by the recordset then check to see if you need a password to enter it
If NOT rsForum.EOF Then
	
	'Read in forum details from the database
	strForumName = rsForum("Forum_name")
	
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

'If the forum level for the user on this forum is 2 (read only) set the forum to be locked
If (intMemberSecurityLevel = 2 AND blnModerator = False AND NOT lngLoggedInUserID = 1) AND (lngLoggedInUserID > 0) Then blnForumLocked = True


'Get what date to show topics till from cookie
If NOT Request.Cookies("show") = "" Then
	intShowTopicsFrom = CInt(Request.Cookies("show"))
Else
	intShowTopicsFrom = 31
End If


'Initialse the string to display when the topics are show up till
Select Case intShowTopicsFrom
	Case 0
		strShowTopicsFrom = strTxtFewYears
	case 7
		strShowTopicsFrom = strTxtWeek
	case 14
		strShowTopicsFrom = strTxtTwoWeeks
	Case 31
		strShowTopicsFrom = strTxtMonth
	Case 62
		strShowTopicsFrom = strTxtTwoMonths
	Case 182
		strShowTopicsFrom = strTxtSixMonths
	Case 365
		strShowTopicsFrom = strTxtYear
End Select

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum: <% = strForumName %></title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<script  language="JavaScript">
<!-- Hide from older browsers...
<%
'Display a message letting the user know a private message has been deleted
If Session("msg") = "delTopic" Then 
	Response.Write("alert('" & strTxtTheTopicIsNowDeleted & "')")
	Session("msg") = ""
End If
%>

//Function to choose how many topics are show
function ShowTopics(Show){

   	strShow = escape(Show.options[Show.selectedIndex].value);
   	document.cookie = "show=" + strShow
   	
   	if (Show != "") self.location.href = "display_forum_topics.asp?ForumID=<% = intForumID %>&PagePosition=1";
	return true;
}

//Function to jump to another forum
function ForumJump(URL) {
	
	if (URL.options[URL.selectedIndex].value != "") self.location.href = URL.options[URL.selectedIndex].value;	
	return true;
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
// -->
</script>
<!-- #include file="header.inc" -->
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td class="text"><% = strTxtWelcome & " " &  strLoggedInUsername %></td>
  <td align="right"><% 
   
'If the user has logged in then the Logged In User ID number will not be 0 and not 2 for the guest account
If NOT lngLoggedInUserID = 0 AND NOT lngLoggedInUserID = 2 Then
	
	'Dispaly a " & strTxtWelcome & " message to the user in the top bar
	Response.Write vbCrLf & "<a href=""profile_edit.asp?ReturnPage=Topic&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "edit_profile.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtEditProfile & """></a>&nbsp;<a href=""log_off_user.asp?ReturnPage=Topic&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "log_off.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogOff & """ border=""0"" align=""absmiddle""></a>"

'Else the user is not logged
Else
    	'Display a " & strTxtWelcome & " guset message with the option to login or register
    	Response.Write vbCrLf & "<a href=""register_form.asp?ReturnPage=Topic&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;<a href=""login_user.asp?ReturnPage=Topic&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"
End If
%>
   <a href="search_form.asp?ReturnPage=Topic&ForumID=<% = intForumID %>&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
   <a href="forum_members.asp?ReturnPage=Topic&ForumID=<% = intForumID %>&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a></td>
 </tr>
</table>
<a href="http://www.webwizguide.info"></a> 
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="71%"><img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif"> 
   <%
'Check there are forum's to display
If rsForum.EOF Then

	'If there are no forum's to display then display the appropriate error message
	Response.Write vbCrLf & "<span class=""text"">" & strTxtNoForums & "</span>"

'Else there the are forum's to write the HTML to display it the forum names and a discription
Else 	
	'Write the HTML of the forum descriptions as hyperlinks to the forums
	Response.Write vbCrLf & ("<a href=""display_forum_topics.asp?ForumID=" & intForumID & """ target=""_self"">" & strForumName & "</a>")
	'If the forum is locked show a locked pad lock icon
	If blnForumLocked = True Then
		Response.Write ("  <span class=""text"">(<img src=""" & strImagePath & "forum_locked_icon.gif"" align=""baseline"" alt=""" & strTxtForumLocked & """> " & strTxtForumLocked & ")</span>")
	End If
	Response.Write ("<br>")
End If


%>
  </td>
  <td align="right" width="29%">&nbsp; 
   <!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <form>
   <td width="50%"><span class="text"><% = strTxtShowTopics %></span> 
    <select name="show" onChange=ShowTopics(this)>
     <option value="0" <% If intShowTopicsFrom = 0 Then Response.Write "selected" %>><% = strTxtAll %></option>
     <option value="7" <% If intShowTopicsFrom = 7 Then Response.Write "selected" %>><% = strTxtLastWeek %></option>
     <option value="14" <% If intShowTopicsFrom = 14 Then Response.Write "selected" %>><% = strTxtLastTwoWeeks %></option>
     <option value="31" <% If intShowTopicsFrom = 31 Then Response.Write "selected" %>><% = strTxtLastMonth %></option>
     <option value="62" <% If intShowTopicsFrom = 62 Then Response.Write "selected" %>><% = strTxtLastTwoMonths %></option>
     <option value="182" <% If intShowTopicsFrom = 182 Then Response.Write "selected" %>><% = strTxtLastSixMonths %></option>
     <option value="365" <% If intShowTopicsFrom = 365 Then Response.Write "selected" %>><% = strTxtLastYear %></option>
    </select>
   </td>
   <td align="right" width="50%"><a href="post_message_form.asp?mode=new&ReturnPage=Topic&ForumID=<% = intForumID %>&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>new_post.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtNewTopic %>"></a></td>
  </form>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <tr> 
     <td bgcolor="<% = strTableTitleColour %>" width="3%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>">&nbsp;</td>
     <td bgcolor="<% = strTableTitleColour %>" width="41%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtTopics %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="15%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtThreadStarter %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtReplies %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtViews %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="29%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtLastPost %></td>
    </tr>
    <%
        
        
'Get the Topics for the forum from the database
'Create a record set object to the Topics held in the database
Set rsTopicDetails = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database to count the number of Topics for each Forum
'Run Stored procedures for SQL Server
If strDatabaseType = "SQLServer" Then
	If intShowTopicsFrom = 0 Then
		strSQL = "EXECUTE wwfSpTopicDetialsAll @intForumID = " & intForumID
	Else
		strSQL = "EXECUTE wwfSpTopicDetialsInTheLastXX @intForumID = " & intForumID & ", @intShowTopicsFrom = " & intShowTopicsFrom
	End If
'Run SQL for Access
Else
	strSQL = "SELECT tblTopic.Topic_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Locked, tblTopic.Priority "
	strSQL = strSQL & "FROM tblTopic "
	'Choose a where string for the query
	If intShowTopicsFrom = 0 Then
		strSQL = strSQL & "WHERE (tblTopic.Forum_ID = "  & intForumID & ") OR  (tblTopic.Priority = 3)"
	Else
		strSQL = strSQL & "WHERE ((tblTopic.Forum_ID = "  & intForumID & ") AND ((tblTopic.Last_entry_date > Now() - " & intShowTopicsFrom & ") OR (tblTopic.Priority > 0))) OR (tblTopic.Priority = 3) "
	End If
	strSQL = strSQL & "ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;"
End If

'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsTopicDetails.CursorType = 1

'Query the database
rsTopicDetails.Open strSQL, strCon   

'Set the number of records to display on each page
rsTopicDetails.PageSize = intTopicPerPage


'Check there are Topic's to display
If rsTopicDetails.EOF Then

	'If there are no Topic's to display then display the appropriate error message
	Response.Write vbCrLf & "<td bgcolor=""" & strTableColour & """ background=""" & strTableBgImage & """ colspan=""6"" class=""text"">" & strTxtNoTopicsToDisplay & "&nbsp;" & strShowTopicsFrom & "</td>"

'Else there the are topic's so write the HTML to display the topic names and a discription
Else 
	'Get the record poistion to display from
	rsTopicDetails.AbsolutePage = intRecordPositionPageNum
	
	'If there are no records on this page and it's above the frist page then set the page position to 1
	If rsTopicDetails.EOF AND intRecordPositionPageNum > 1 Then rsTopicDetails.AbsolutePage = 1
	
	'Count the number of pages there are in the recordset calculated by the PageSize attribute set above
	intTotalNumOfPages = rsTopicDetails.PageCount
	
	'Craete a Recodset object for the topic details
	Set rsTopic = Server.CreateObject("ADODB.Recordset")

	
	'Loop round to read in all the Topics in the database
	For intRecordLoopCounter = 1 to intTopicPerPage
	
		'If there are no records left in the recordset to display then exit the for loop
		If rsTopicDetails.EOF Then Exit For
	
		'Read in Topic details from the database
		lngTopicID = CLng(rsTopicDetails("Topic_ID"))
		lngNumberOfViews = CLng(rsTopicDetails("No_of_views"))
		strSubject = rsTopicDetails("Subject")	
		blnTopicLocked = CBool(rsTopicDetails("Locked"))
		intPriority = CInt(rsTopicDetails("Priority"))
		
		'Initalise the strSQL variable with an SQL statement to query the database to get the Author and subject from the database for the topic
		If strDatabaseType = "SQLServer" Then
			strSQL = "EXECUTE wwfSpLastAndFirstThreadAuthor @lngTopicID = " & lngTopicID
		Else
			strSQL = "SELECT tblThread.Thread_ID, tblThread.Author_ID, tblThread.Message_date, tblAuthor.Username " 
			strSQL = strSQL & "FROM tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID "
			strSQL = strSQL & "WHERE tblThread.Topic_ID = " & lngTopicID & " "
			strSQL = strSQL & "ORDER BY tblThread.Message_date ASC;"
		End If		
		
		'Set the cursor type property of the record set to forward only so we can navigate through the record set
		rsTopic.CursorType = 1	
		
		'Query the database
		rsTopic.Open strSQL, strCon
		
		'If there is info in the database relating to the topic then get them from the record set
		If NOT rsTopic.EOF Then
			
			'Read in the subject and author and number of replies from the record set
			strTopicStartUsername = rsTopic("Username") 
			lngTopicStartUserID = CLng(rsTopic("Author_ID")) 
			lngNumberOfReplies = CLng((rsTopic.RecordCount) - 1)
			
			'Move to the last record in the record set to get the date and username of the last entry
			rsTopic.MoveLast
			
			'Read in the username and date of the last entry from the record set
			lngLastEntryMessageID = CLng(rsTopic("Thread_ID"))
			strLastEntryUsername = rsTopic("Username")
			lngLastEntryUserID = CLng(rsTopic("Author_ID"))
			dtmLastEntryDate = CDate(rsTopic("Message_date"))
		End If	
		
		'Write the HTML of the Topic descriptions as hyperlinks to the Topic details and message 
		%>
    <tr> 
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="1%" align="center"><% 
     	 	 
     	 	'If the topic is pinned then display the pinned icon
     	 	If intPriority = 1 Then
     	 		Response.Write("<img src=""" & strImagePath & "pinned_topic_icon.gif"" border=""0"" alt=""" & strTxtPinnedTopic & """>")
     	 	'If the topic is top priorty and locked then display top priporty locked icon
     	 	ElseIf blnTopicLocked = True AND intPriority > 0 Then
     	 	 	Response.Write("<img src=""" & strImagePath & "priority_post_locked_icon.gif"" border=""0"" alt=""" & strTxtHighPriorityPostLocked & """>")
     		'If the topic is top priorty then display top priporty icon
     	 	ElseIf intPriority > 0 Then
     			Response.Write("<img src=""" & strImagePath & "priority_post_icon.gif"" border=""0"" alt=""" & strTxtHighPriorityPost & """>")
     		'If the topic is closed display a closed topic icon
     	 	ElseIf blnTopicLocked = True Then
     			Response.Write("<img src=""" & strImagePath & "closed_topic_icon.gif"" border=""0"" alt=""" & strTxtLockedTopic & """>")
     		'If the topic is a hot topic and with new replies then display hot to new replies icon
     	 	ElseIf (lngNumberOfReplies >= intNumHotReplies OR lngNumberOfViews >= intNumHotViews) AND (CDate(Session("dtmLastVisit")) < dtmLastEntryDate) Then
     			Response.Write("<img src=""" & strImagePath & "hot_topic_new_posts_icon.gif"" border=""0"" alt=""" & strTxtHotTopicNewReplies & """>")
     		'If the topic is a hot topic display hot topic icon
     	 	ElseIf lngNumberOfReplies >= intNumHotReplies OR lngNumberOfViews >= intNumHotViews Then
     			Response.Write("<img src=""" & strImagePath & "hot_topic_no_new_posts_icon.gif"" border=""0"" alt=""" & strTxtHotTopic & """>")
     		'If the topic is has new replies display new replies icon
     	 	ElseIf CDate(Session("dtmLastVisit")) < dtmLastEntryDate Then
     			Response.Write("<img src=""" & strImagePath & "new_posts_icon.gif"" border=""0"" alt=""" & strTxtOpenTopicNewReplies & """>")
     		'Display topic icon
     		Else
     			Response.Write("<img src=""" & strImagePath & "no_new_posts_icon.gif"" border=""0"" alt=""" & strTxtOpenTopic & """>")
     		End If
     %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="41%" class="text"><% 
      
		   
		 'If the user is the forum admin or a moderator then give let them delete the topic
		 If (lngLoggedInUserID = 1 OR blnModerator = True) AND (intPriority <> 3 OR lngLoggedInUserID = 1) Then %>  		
      <a href="delete_topic.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>" OnClick="return confirm('<% = strTxtDeleteTopicAlert %>')"><img src="<% = strImagePath %>delete_icon.gif" border="0" alt="<% = strTxtDeleteTopic %>"></a> 
      <% 	
		  	'If the topic is not allow admin moderator to lock it
		  	If blnTopicLocked = True Then 
%>
      <a href="lock_topic.asp?mode=UnLock&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>" OnClick="return confirm('<% = strTxtUnLockTopicAlert %>')"><img src="<% = strImagePath %>forum_locked_icon.gif" border="0" alt="<% = strTxtUnLockTopic %>"></a>&nbsp; 
      <%
		 	Else
%>
      <a href="lock_topic.asp?mode=Lock&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>" OnClick="return confirm('<% = strTxtLockTopicAlert %>')"><img src="<% = strImagePath %>forum_unlock_icon.gif" border="0" alt="<% = strTxtLockTopic %>"></a> 
      <%		 	
			End If         
		End If 
		  %><a href="display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><% = strSubject %></a><%
		 
		 'Calculate the number of pages for the topic and display links if there are more than 1 page
		 intNumberOfTopicPages = ((lngNumberOfReplies + 1)\intThreadsPerPage)
		 
		 'If there is a remainder from calculating the num of pages add 1 to the number of pages
		 If ((lngNumberOfReplies + 1) Mod intThreadsPerPage) > 0 Then intNumberOfTopicPages = intNumberOfTopicPages + 1
		 
		 'If there is more than 1 page for the topic display links to the other pages
		 If intNumberOfTopicPages > 1 Then
		 	Response.Write("<br><img src=""forum_images/pages_icon.gif"" align=""middle"" alt=""" & strTxtPages & """>")
		 	
		 	'Loop round to display the links to the other pages
		 	For intTopicPagesLoopCounter = 1 To intNumberOfTopicPages
		 	
		 		'If there is more than 7 pages display ... last page and exit the loop
		 		If intTopicPagesLoopCounter > 7 Then 
		 			Response.Write(" ...<a href=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intRecordPositionPageNum & "&ThreadPage=" & intNumberOfTopicPages & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intNumberOfTopicPages & "</a>")
		 			Exit For
		 		End If
		 	
		 		'Display the links to the other pages
		 		Response.Write(" <a href=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intRecordPositionPageNum & "&ThreadPage=" & intTopicPagesLoopCounter & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intTopicPagesLoopCounter & "</a>")
		 	Next
		 End If		  
		  %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="15%" class="text"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngTopicStartUserID %>&ForumID=<% = intForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strTopicStartUsername %></a></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfReplies %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfViews %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="29%" class="text" align="right"><% Response.Write(DateFormat(dtmLastEntryDate, saryDateTimeData) & "&nbsp;" & strTxtAt & "&nbsp;" & TimeFormat(dtmLastEntryDate, saryDateTimeData)) %>
      <br><% = strTxtBy %> <a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngLastEntryUserID %>&ForumID=<% = intForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strLastEntryUsername %></a> <a href="display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>&get=last#<% = lngLastEntryMessageID %>" target="_self"><img src="<% = strImagePath %>right_arrow.gif" align="absmiddle" border="0" alt="<% = strTxtViewLastPost %>"></a></td>
    </tr><%
    
		'Close the topic recordset
                rsTopic.Close
                
		'Move to the next database record
		rsTopicDetails.MoveNext	
	Next		
End If

'Release server objects
Set rsTopic = Nothing 
rsTopicDetails.Close
Set rsTopicDetails = Nothing 
rsForum.Close
Set rsForum = Nothing       
        %>
   </table>
  </td>
 </tr>
</table>
<br>
<form>
 <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
  <tr> 
   <td><!-- #include file="forum_jump.inc" --></td>
   <%
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing

'If there is more than 1 page of topics then dispaly drop down list to the other topics
If intTotalNumOfPages > 1 Then   

	'Display an image link to the last topic
	Response.Write vbCrLf & "		<td><span class=""text"">" & strTxtPage
	Response.Write vbCrLf & "		 <select onChange=""ForumJump(this)"" name=""SelectTopicPage"">"
	
	'Loop round to display links to all the other pages
	For intTopicPageLoopCounter = 1 to intTotalNumOfPages  
	
		'Display a link in the link list to the another topic page
		Response.Write vbCrLf & "		  <option value=""display_forum_topics.asp?ForumID=" & intForumID & "&PagePosition=" & intTopicPageLoopCounter & """"
		
		'If this page number to display is the same as the page being displayed then make sure it's selected
		If intTopicPageLoopCounter = intRecordPositionPageNum Then
			Response.Write " selected"
		End If
		
		'Display the link page number
		Response.Write ">" & intTopicPageLoopCounter & "</option>"
	
	Next
	
	'End the drop down list
	Response.Write vbCrLf & "		</select> " & strTxtOf & " " & intTotalNumOfPages & "</span></td>"
End If
%>
   <td align="right"><a href="post_message_form.asp?mode=new&ReturnPage=Topic&ForumID=<% = intForumID %>&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>new_post.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtNewTopic %>"></a></td>
  </tr>
 </table>
</form>
<div align="center">
 <table width="617" border="0" cellspacing="0" cellpadding="2">
  <tr> 
   <td width="193" class="text"><img src="<% = strImagePath %>no_new_posts_icon.gif" alt="<% = strTxtOpenTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtOpenTopic %></span></td>
   <td width="184" class="text"><img src="<% = strImagePath %>hot_topic_no_new_posts_icon.gif" alt="<% = strTxtHotTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtHotTopic %></span></td>
   <td width="141" class="text"><img src="<% = strImagePath %>priority_post_icon.gif" alt="<% = strTxtHighPriorityPost %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtHighPriorityPost %></span></td>
   <td width="94" class="text"><img src="<% = strImagePath %>pinned_topic_icon.gif" alt="<% = strTxtPinnedTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtPinnedTopic %></span></td>
  </tr>
  <tr> 
   <td width="193" class="text"><img src="<% = strImagePath %>new_posts_icon.gif" alt="<% = strTxtOpenTopicNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtOpenTopicNewReplies %></span></td>
   <td width="184" class="text"><img src="<% = strImagePath %>hot_topic_new_posts_icon.gif" alt="<% = strTxtHotTopicNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtHotTopicNewReplies %></span></td>
   <td width="141" class="text"><img src="<% = strImagePath %>priority_post_locked_icon.gif" alt="<% = strTxtHighPriorityPostLocked %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtHighPriorityPostLocked %></span></td>
   <td width="94" class="text"><img src="<% = strImagePath %>closed_topic_icon.gif" alt="<% = strTxtLockedTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"> <% = strTxtLockedTopic %></span></td>
  </tr>
 </table>
 <br>
</div>
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
<!-- #include file="footer.inc" -->
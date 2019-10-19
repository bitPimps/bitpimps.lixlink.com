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
Dim dblActiveFrom		'Holds the time to get active topics from
Dim intNumberOfTopicPages	'Holds the number of topic pages
Dim intTopicPagesLoopCounter	'Holds the number of loops


'If this is the first time the page is displayed then the Forum Topic record position is set to page 1
If Request.QueryString("PagePosition") = "" OR Request.QueryString("PagePosition") = 0 Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the Forum Topic record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("PagePosition"))
End If	


'Get what date to show active topics till from cookie
If Request.QueryString("showActive") <> "" Then
	intShowTopicsFrom = CInt(Request.QueryString("showActive"))

'If this is not the first time the user has visted then use this date to show active topics from
ElseIf Session("dtmLastVisit") < CDate(Request.Cookies("ForumVisit")("LastVist")) Then
	intShowTopicsFrom = 1 '1 = last visit
Else
	intShowTopicsFrom = 7 '7 = yesterday
End If


'Initialse the string to display when active topics are shown since
Select Case intShowTopicsFrom
	Case 1
		strShowTopicsFrom = strTxtLastVisitOn & " " & DateFormat(Session("dtmLastVisit"), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(Session("dtmLastVisit"), saryDateTimeData)
		dblActiveFrom = DateDiff("d", Session("dtmLastVisit"), Now()) + 1
	case 2
		strShowTopicsFrom = strTxtLastFifteenMinutes
		dblActiveFrom = 1
	case 3
		strShowTopicsFrom = strTxtLastThirtyMinutes
		dblActiveFrom = 1
	Case 4
		strShowTopicsFrom = strTxtLastFortyFiveMinutes
		dblActiveFrom = 1
	Case 5
		strShowTopicsFrom = strTxtLastHour
		dblActiveFrom = 1
	Case 6
		strShowTopicsFrom = strTxtLastTwoHours
		dblActiveFrom = 1
	Case 7
		strShowTopicsFrom = strTxtYesterday
		dblActiveFrom = 1
	Case 8
		strShowTopicsFrom = strTxtLastWeek
		dblActiveFrom = 7
	Case 9
		strShowTopicsFrom = strTxtLastMonth
		dblActiveFrom = 28
End Select

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum: Active Topics</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
     	
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to choose how many topics are show
function ShowTopics(Show){

   	strShow = escape(Show.options[Show.selectedIndex].value);
   	
   	if (Show != "") self.location.href = "active_topics.asp?PagePosition=1&showActive=" + strShow;
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
	Response.Write vbCrLf & "<a href=""profile_edit.asp?ReturnPage=Active&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "edit_profile.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtEditProfile & """></a>&nbsp;<a href=""log_off_user.asp?ReturnPage=Active&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "log_off.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogOff & """ border=""0"" align=""absmiddle""></a>"

'Else the user is not logged
Else
    	'Display a " & strTxtWelcome & " guset message with the option to login or register
    	Response.Write vbCrLf & "<a href=""register_form.asp?ReturnPage=Active&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;<a href=""login_user.asp?ReturnPage=Active&ForumID=" & intForumID & "&PagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"
End If
%>
   <a href="search_form.asp?ReturnPage=Active&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
   <a href="forum_members.asp?ReturnPage=Active&PagePosition=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a></td>
 </tr>
</table>
<a href="http://www.webwizguide.info"></a> 
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="71%"><img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
            <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif"> 
            <a href="active_topics.asp" target="_self"><% = strTxtActiveTopics %></a></td>
  <td align="right" width="29%">&nbsp; 
   <!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
      <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
        <tr> 
          <form>
            <td><span class="text"><% = strTxtShowActiveTopicsSince %></span> 
              <select name="show" onChange=ShowTopics(this)>
                <option value="1" <% If intShowTopicsFrom = 1 Then Response.Write "selected" %>><% = strTxtLastVisitOn & " " & DateFormat(Session("dtmLastVisit"), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(Session("dtmLastVisit"), saryDateTimeData) %></option>
                <option value="2" <% If intShowTopicsFrom = 2 Then Response.Write "selected" %>><% = strTxtLastFifteenMinutes %></option>
                <option value="3" <% If intShowTopicsFrom = 3 Then Response.Write "selected" %>><% = strTxtLastThirtyMinutes %></option>
                <option value="4" <% If intShowTopicsFrom = 4 Then Response.Write "selected" %>><% = strTxtLastFortyFiveMinutes %></option>
                <option value="5" <% If intShowTopicsFrom = 5 Then Response.Write "selected" %>><% = strTxtLastHour %></option>
                <option value="6" <% If intShowTopicsFrom = 6 Then Response.Write "selected" %>><% = strTxtLastTwoHours %></option>
                <option value="7" <% If intShowTopicsFrom = 7 Then Response.Write "selected" %>><% = strTxtYesterday %></option>
                <option value="8" <% If intShowTopicsFrom = 8 Then Response.Write "selected" %>><% = strTxtLastWeek %></option>
                <option value="9" <% If intShowTopicsFrom = 9 Then Response.Write "selected" %>><% = strTxtLastMonth %></option>
              </select>
            </td>
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
'Create a record set object to the Topics held in the database
Set rsForum = Server.CreateObject("ADODB.Recordset")
	
'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsForum.CursorType = 1

'Initilise SQL Query
strSQL = "SELECT tblForum.Forum_name, tblForum." & strMemberStatus & ", tblTopic.* "
strSQL = strSQL & "FROM (tblCategory INNER JOIN tblForum ON tblCategory.Cat_ID = tblForum.Cat_ID) INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID "
strSQL = strSQL & "WHERE ((tblForum." & strMemberStatus & " < 3) AND (tblTopic.Last_entry_date > " & strDatabaseDateFunction & " - " & dblActiveFrom & "))"
strSQL = strSQL & "ORDER BY tblCategory.Cat_order ASC, tblForum.Forum_Order ASC, tblTopic.Last_entry_date DESC;"

'Query the database
rsForum.Open strSQL, strCon  

'Initialse the string to display when active topics are shown since
Select Case intShowTopicsFrom
	Case 1
		'Filter the recorset to leave only active topics since last vists (Filter used for overcome incompatibilty problems between application and database)
		rsForum.Filter = "Last_entry_date > #" & CDate(Session("dtmLastVisit")) & "#"
	case 2
		rsForum.Filter = "Last_entry_date > #" & DateAdd("n", -15, Now()) & "#"
	case 3
		rsForum.Filter = "Last_entry_date > #" & DateAdd("n", -30, Now()) & "#"
	Case 4
		rsForum.Filter = "Last_entry_date > #" & DateAdd("n", -45, Now()) & "#"
	Case 5
		rsForum.Filter = "Last_entry_date > #" & DateAdd("h", -1, Now()) & "#"
	Case 6
		rsForum.Filter = "Last_entry_date > #" & DateAdd("h", -2, Now()) & "#"
End Select
	 
'If there are no active topics display an error msg
If rsForum.EOF Then
	'If there are no Active Topic's to display then display the appropriate error message
	Response.Write vbCrLf & "<td bgcolor=""" & strTableColour & """ background=""" & strTableBgImage & """ colspan=""6"" class=""text"">" & strTxtNoActiveTopicsSince & " " & strShowTopicsFrom & " " & strTxtToDisplay & "</td>"
End If
	
	
	'Disply any active topics in the forum
	If NOT rsForum.EOF Then
		
	'Read in the forum ID
	intForumID = CInt(rsForum("Forum_ID"))    
	
	'Set the number of records to display on each page
	rsForum.PageSize = intTopicPerPage

	
	'Get the record poistion to display from
	rsForum.AbsolutePage = intRecordPositionPageNum
		
	'Count the number of pages there are in the recordset calculated by the PageSize attribute set above
	intTotalNumOfPages = rsForum.PageCount
	
	'Craete a Recodset object for the topic details
	Set rsTopic = Server.CreateObject("ADODB.Recordset")
	
		
	'Loop round to read in all the Topics in the database
	For intRecordLoopCounter = 1 to intTopicPerPage
		
		'If there are no records left in the recordset to display then exit the for loop
		If rsForum.EOF Then Exit For
		
		'If the forum name is different to the one from the last forum display the forum name
		If rsForum("Forum_name") <> strForumName Then
			
			'Give the forum name the new forum name
			strForumName = rsForum("Forum_name")
			
			'Display the new forum name
			Response.Write vbCrLf & "<td bgcolor=""" & strTableTitleColour2 & """ background=""" & strTableTitleBgImage2 & """ colspan=""6"" class=""tiHeading"">" & rsForum("Forum_name") & "</td>"
		End If
			
	
		'Read in Topic details from the database
		intForumID = CInt(rsForum("Forum_ID"))
		lngTopicID = CLng(rsForum("Topic_ID"))
		lngNumberOfViews = CLng(rsForum("No_of_views"))
		strSubject = rsForum("Subject")	
		blnTopicLocked = CBool(rsForum("Locked"))
		intPriority = CInt(rsForum("Priority"))
		
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
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="41%" class="text"><a href="display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>&showActive=<% = intShowTopicsFrom %>&ReturnPage=Active" target="_self"><% = strSubject %></a><%
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
		 			Response.Write(" ...<a href=""display_topic_threads.asp?ReturnPage=Active&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intRecordPositionPageNum & "&ThreadPage=" & intNumberOfTopicPages & "&showActive=" & intShowTopicsFrom & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intNumberOfTopicPages & "</a>")
		 			Exit For
		 		End If
		 	
		 		'Display the links to the other pages
		 		Response.Write(" <a href=""display_topic_threads.asp?ReturnPage=Active&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intRecordPositionPageNum & "&ThreadPage=" & intNumberOfTopicPages & "&showActive=" & intShowTopicsFrom & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intTopicPagesLoopCounter & "</a>")
		 	Next
		 End If		  
		  %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="15%" class="text"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngTopicStartUserID %>&ForumID=<% = intForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strTopicStartUsername %></a></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfReplies %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfViews %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="29%" class="text" align="right"><% Response.Write(DateFormat(dtmLastEntryDate, saryDateTimeData) & "&nbsp;" & strTxtAt & "&nbsp;" & TimeFormat(dtmLastEntryDate, saryDateTimeData)) %>
      <br><% = strTxtBy %> <a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngLastEntryUserID %>&ForumID=<% = intForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strLastEntryUsername %></a> <a href="display_topic_threads.asp?ReturnPage=Active&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>&get=last#<% = lngLastEntryMessageID %>" target="_self"><img src="<% = strImagePath %>right_arrow.gif" align="absmiddle" border="0" alt="<% = strTxtViewLastPost %>"></a></td>
    </tr><%
    
		'Close the topic recordset
               	rsTopic.Close
                
		'Move to the next database record
		rsForum.MoveNext	
	Next		
End If

'Release server objects
Set rsTopic = Nothing 
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
            <td> 
              <!-- #include file="forum_jump.inc" -->
            </td>
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
		Response.Write vbCrLf & "		  <option value=""active_topics.asp?PagePosition=" & intTopicPageLoopCounter & "&showActive=" & intShowTopicsFrom & """"
		
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
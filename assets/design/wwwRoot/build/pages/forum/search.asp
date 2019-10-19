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
Dim rsTopicDetails		'Holds the Recordset for the Topic Count
Dim rsTopic			'Holds the Recordset for the Topic details
Dim rsForum			'Holds the Recordset for the Forum details
Dim rsThread			'Holds the Recordset for the Thread details
Dim rsTopicLocked		'holds if the topic is locked or not
Dim strSQLResultsQuery		'Holds the query built for the search
Dim intForumID			'Holds the forum ID number
Dim strForumName		'Holds the forum name
Dim strSearchKeywords		'Holds the keywords to search for
Dim sarySearchWord		'Array to hold the search words
Dim strSearchIn			'Holds where the serach is to be done
Dim intSearchForumID		'Holds the forum the result belongs to
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
Dim intLinkPageNum		'Holss the page number to link to
Dim blnReturnedSearchResults	'Set to true if there are search results returned
Dim intTopicPageLoopCounter	'Holds the number of pages there are in the forum
Dim blnTopicLocked		'set to true if the topic is locked
Dim intPriority			'Holds the priority level of the topic
Dim intNumberOfTopicPages	'Holds the number of topic pages
Dim intTopicPagesLoopCounter	'Holds the number of loops
Dim intHighlightLoopCounter	'Loop counter to loop through words and hightlight them



'Initialise variables
blnReturnedSearchResults = True



'Read in the search criteria
strSearchKeywords = Trim(Mid(Request.QueryString("search"), 1, 35))	
strSearchIn = Request.QueryString("searchIn")
intForumID = CInt(Request.QueryString("Forum"))


'Replace _ with a space so that these words are split into multiple words
If Request.QueryString("searchIn") <> "Author" Then
	strSearchKeywords = Replace(strSearchKeywords, "_", " ")
End If

'Filter the search words with the same filters as the text is saved with
strSearchKeywords = formatSQLInput(strSearchKeywords)
If NOT Request.QueryString("searchIn") = "Author" Then strSearchKeywords = formatInput(strSearchKeywords)


'Split up the keywords to be searched
sarySearchWord = Split(Trim(strSearchKeywords), " ")


'If there is no keywords to search for then redirect to the forum homepage
If strSearchKeywords = "" Then Response.Redirect "default.asp"


'If this is the first time the page is displayed then the Forum Topic record position is set to page 1
If Request.QueryString("SearchPagePosition") = 0 Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the Forum Topic record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("SearchPagePosition"))
End If	



'If the user has selected to search in the Topic subjects then build the Where Clause of the Reseults Query with the Topics containg threads with the search words
If Request.QueryString("searchIn") = "Topic"  Then
	
	'Initalise the Results Query string with the select part of the query
	strSQLResultsQuery = "SELECT tblTopic.Topic_ID, tblTopic.Forum_ID, tblTopic.No_of_views, tblTopic.Subject FROM tblTopic WHERE "
	
	
	'If the user has selected to search the TOPICS and any words or all words then build the next part of the Results Query with the where cluase 
	If (Request.QueryString("searchMode") = "anywords" OR Request.QueryString("searchMode") = "allwords") AND Request.QueryString("searchIn") = "Topic" Then 	
	
		'Call the function to build the query
		strSQLResultsQuery = strSQLResultsQuery & BuildSQL ("tblTopic.Subject", sarySearchWord)
	
	'Else they have choosen phrase in topic
	Else	
		strSQLResultsQuery = strSQLResultsQuery & "tblTopic.Subject LIKE '%" & strSearchKeywords & "%'"
	End If
	
	If intForumID <> 0 Then
		'If the user has selected to search a certain forum then build the Results Query to only look in that forum
		strSQLResultsQuery = strSQLResultsQuery & " AND tblTopic.Forum_ID =" & intForumID & " "
	End If
End If



'If the user has selected to search in the message body then build the Where Clause of the Reseults Query with the Topics containg threads with the search words
If Request.QueryString("searchIn") = "Thread"  Then
	
	'Initialise the sql query to get the with a select statment to get the topic ID
	strSQLResultsQuery = "SELECT tblTopic.Topic_ID, tblTopic.Forum_ID, tblTopic.No_of_views, tblTopic.Subject FROM tblTopic INNER JOIN tblThread ON tblTopic.Topic_ID = tblThread.Topic_ID WHERE ("
	
	'If the user has selected all or any words then build the where clause with the words to be searched
	If Request.QueryString("searchMode") = "anywords" OR Request.QueryString("searchMode") = "allwords" Then 	
	
		'Call the function to build the query
		strSQLResultsQuery = strSQLResultsQuery & BuildSQL ("tblThread.Message", sarySearchWord)
	
	'Else the user has choosen to only search for a message containg the phrase
	Else
		strSQLResultsQuery = strSQLResultsQuery & "tblThread.Message LIKE '%" & strSearchKeywords & "%'"
	
	End If
	
	If intForumID <> 0 Then
		'If the user has selected to search a certain forum then intitilaise the SQL query to search only that forum
		strSQLResultsQuery = strSQLResultsQuery & " AND (tblTopic.Forum_ID=" & intForumID & ")"
	End If
	
	'Group results that have more than one togather
	strSQLResultsQuery = strSQLResultsQuery & ") GROUP BY tblTopic.Topic_ID, tblTopic.Forum_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Last_entry_date "
End If



'If the user has selected to search in the message body then build the Where Clause of the Reseults Query with the Topics containg threads written by the author
If Request.QueryString("searchIn") = "Author" Then
	
	'Take out parts of the username that are not permitted
	strSearchKeywords = Replace(strSearchKeywords, "password", "", 1, -1, 1)
	strSearchKeywords = Replace(strSearchKeywords, "author", "", 1, -1, 1)
	strSearchKeywords = Replace(strSearchKeywords, "code", "", 1, -1, 1)
	strSearchKeywords = Replace(strSearchKeywords, "username", "", 1, -1, 1)
	
	'Get rid of milisous code
	strSearchKeywords = formatSQLInput(strSearchKeywords)
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQLResultsQuery = "SELECT tblTopic.Topic_ID, tblTopic.Forum_ID, tblTopic.No_of_views, tblTopic.Subject "
	strSQLResultsQuery = strSQLResultsQuery & "FROM tblTopic INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
	strSQLResultsQuery = strSQLResultsQuery & "WHERE (((tblAuthor.Username) LIKE '" & strSearchKeywords & "') "
	If intForumID <> 0 Then
		strSQLResultsQuery = strSQLResultsQuery & "AND ((tblTopic.Forum_ID)=" & intForumID & ") "		
	End If
	strSQLResultsQuery = strSQLResultsQuery & ") GROUP BY tblTopic.Topic_ID, tblTopic.Forum_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Last_entry_date "
End If



'Tell the Results Query what order to place the results in
Select Case Request.QueryString("searchSort")
	Case "topic"
		strSQLResultsQuery = strSQLResultsQuery & " ORDER BY tblTopic.Subject ASC;"
	Case "views"
		strSQLResultsQuery = strSQLResultsQuery & " ORDER BY tblTopic.No_of_views DESC;"
	Case "dateASC"
		strSQLResultsQuery = strSQLResultsQuery & " ORDER BY tblTopic.Last_entry_date ASC;"
	Case Else
		strSQLResultsQuery = strSQLResultsQuery & " ORDER BY tblTopic.Last_entry_date DESC;"
End Select

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum Search Results: <% = strSearchKeywords %></title>
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
   
'If the user has logged in then the Logged In User ID number will be more than 0
If NOT lngLoggedInUserID = 0 AND NOT lngLoggedInUserID = 2 Then
	
	'Dispaly a " & strTxtWelcome & " message to the user in the top bar
	Response.Write vbCrLf & "<a href=""profile_edit.asp?ReturnPage=Search&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&SearchPagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "edit_profile.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtEditProfile & """></a>&nbsp;<a href=""log_off_user.asp?ReturnPage=Search&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&SearchPagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "log_off.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogOff & """ border=""0"" align=""absmiddle""></a>"

'Else the user is not logged
Else
    	'Display a " & strTxtWelcome & " guset message with the option to login or register
    	Response.Write vbCrLf & "<a href=""register_form.asp?ReturnPage=Search&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&SearchPagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;<a href=""login_user.asp?ReturnPage=Search&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&SearchPagePosition=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"
End If
%>
   <a href="search_form.asp?ReturnPage=Search&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="Search the Forum"></a> 
   <a href="forum_members.asp?ReturnPage=Search&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="70%"><img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom"> 
   <%
      
'Create a recordset to get the forum details
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Read in the forum name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.Forum_name FROM tblForum WHERE Forum_ID = " & intForumID

'Query the database
rsForum.Open strSQL, strCon


'Check there are forum's to display
If rsForum.EOF AND NOT intForumID = 0 Then

	'If there are no forum's to display then display the appropriate error message
	Response.Write vbCrLf & "<span class=""text"">" & strTxtNoForums & "</span>"

'Else there the are forum's to write the HTML to display it the forum names and a discription
Else 
			
	'Read in forum details from the database or display all forums
	If intForumID = 0 Then 
		strForumName = strTxtAllForums
	Else
		strForumName = rsForum("Forum_name")
	End If
		
		
	'Write the HTML of the forum descriptions as hyperlinks to the forums
	Response.Write vbCrLf & "<a href=""display_forum_topics.asp?ForumID=" & intForumID & """ target=""_self"">" & strForumName & "</a>"		

%>
   <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<% = strImagePath %>folder_line.gif"> <img src="<% = strImagePath %>open_folder_icon.gif"> 
   <a href="search.asp?SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ReturnPage=Search" target="_self"><% = strTxtSearchResults %></a> 
   <%
End If
%>
  </td>
  <td align="right" width="30%">&nbsp; 
   <!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="50%" class="text"><%
  
'Get the Topics for the forum from the database
'Create a record set object to the Topics held in the database
Set rsTopicDetails = Server.CreateObject("ADODB.Recordset")
	

'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsTopicDetails.CursorType = 1

'Query the database
rsTopicDetails.Open strSQLResultsQuery, strCon   

'Set the number of records to display on each page
rsTopicDetails.PageSize = intTopicPerPage



'If ther are records found say how many
If NOT rsTopicDetails.EOF Then 	
	Response.Write vbCrLf & strTxtYourSearchHasFound & "&nbsp;" & rsTopicDetails.RecordCount & "&nbsp;" & strTxtResults
End If
	
  %></td>
 <td align="right" width="50%">&nbsp;</td>
 </tr>
</table>
<a href="http://www.webwizguide.info"> </a> 
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <%
If rsTopicDetails.EOF Then 

	Response.Write vbCrLf & "<tr><td bgcolor=""" & strTableColour & """ background=""" & strTableBgImage & """ colspan=""5"" align=""center"" height=""150"" class=""text"">" & strTxtNoSearchResults
	Response.Write vbCrLf & "<br><br><a href=""search_form.asp?ReturnPage=Search&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")  & "&SearchPagePosition=1" & """ target=""_self"">" & strTxtClickHereToRefineSearch & "</a></td></tr>"

'If there the are topic's so write the HTML to display the topic names and a discription
Else
%>
    <tr> 
     <td bgcolor="<% = strTableTitleColour %>" width="3%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>">&nbsp;</td>
     <td bgcolor="<% = strTableTitleColour %>" width="41%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtTopics %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="15%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtThreadStarter %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtReplies %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtViews %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="29%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtLastPost %></td>
    </tr>
    <%
        

	'Get the record poistion to display from
	rsTopicDetails.AbsolutePage = intRecordPositionPageNum
	
	'Count the number of pages there are in the recordset calculated by the PageSize attribute set above
	intTotalNumOfPages = rsTopicDetails.PageCount

	'Create a Recodset object for the topic details
	Set rsTopic = Server.CreateObject("ADODB.Recordset")
	
	
	'Loop round to read in all the Topics in the database
	For intRecordLoopCounter = 1 to intTopicPerPage
	
		'If there are no records left in the recordset to display then exit the for loop
		If rsTopicDetails.EOF Then Exit For	
	
		'Read in Topic details from the database
		intSearchForumID = CInt(rsTopicDetails("Forum_ID"))
		lngTopicID = CLng(rsTopicDetails("Topic_ID"))
		lngNumberOfViews = CLng(rsTopicDetails("No_of_views"))
		strSubject = rsTopicDetails("Subject")	
		
		'Make search words in the subject highlighted
		For intHighlightLoopCounter = 0 To UBound(sarySearchWord)
			'Replace the search words with highlited ones
			strSubject = Replace(strSubject, sarySearchWord(intHighlightLoopCounter), "<span style=""color: #000000; background-color: #ffff66"">" & sarySearchWord(intHighlightLoopCounter) & "</span>", 1, -1, 1)
		Next
		
		'Query the database to get if the topic is locked
		strSQL = "SELECT TOP 1 tblTopic.Locked, tblTopic.Priority FROM tblTopic WHERE tblTopic.Topic_ID = " & lngTopicID & ";"
		
		'Query the database
		rsTopic.Open strSQL, strCon
		
		'Read in if the topic is locked
		blnTopicLocked = CBool(rsTopic("Locked"))
		intPriority = CInt(rsTopic("Priority"))
		
		'Close the recordset
		rsTopic.Close
		
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
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="3%" align="center"><% 
     	 	 
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
		 If lngLoggedInUserID = 1 OR blnModerator = True Then 
		  		%>
      <a href="delete_topic.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ReturnPage=Search" OnClick="return confirm('<% = strTxtDeleteTopicAlert %>')"><img src="<% = strImagePath %>delete_icon.gif" border="0" alt="<% = strTxtDeleteTopic %>"></a> 
      <%
		  	
		  	'If the topic is not allow admin moderator to lock it
		  	If blnTopicLocked = True Then 
%>
      <a href="lock_topic.asp?mode=UnLock&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ReturnPage=Search" OnClick="return confirm('<% = strTxtUnLockTopicAlert %>')"><img src="<% = strImagePath %>forum_locked_icon.gif" border="0" alt="<% = strTxtUnLockTopic %>"></a>&nbsp; 
      <%
		 	Else
%>
      <a href="lock_topic.asp?mode=Lock&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ReturnPage=Search" OnClick="return confirm('<% = strTxtLockTopicAlert %>')"><img src="<% = strImagePath %>forum_unlock_icon.gif" border="0" alt="<% = strTxtLockTopic %>"></a> 
      <%		 	
			End If        
		End If 
		  %><a href="display_topic_threads.asp?ForumID=<% = intSearchForumID %>&TopicID=<% = lngTopicID %>&SearchPagePosition=<% = intRecordPositionPageNum %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ReturnPage=Search" target="_self"><% = strSubject %></a><%
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
		 			Response.Write(" ...<a href=""display_topic_threads.asp?ForumID=" & intSearchForumID & "&TopicID=" & lngTopicID & "&SearchPagePosition=" & intRecordPositionPageNum & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&ReturnPage=Search&ThreadPage=" & intNumberOfTopicPages & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intNumberOfTopicPages & "</a>")
		 			Exit For
		 		End If
		 	
		 		'Display the links to the other pages
		 		Response.Write(" <a href=""display_topic_threads.asp?ForumID=" & intSearchForumID & "&TopicID=" & lngTopicID & "&SearchPagePosition=" & intRecordPositionPageNum & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&ReturnPage=Search&ThreadPage=" & intNumberOfTopicPages & """ target=""_self"" style=""font-size:" & intSmallFontSize & "px;"">" & intTopicPagesLoopCounter & "</a>")
		 	Next
		 End If		  
		  %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="15%" class="text"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngTopicStartUserID %>&ForumID=<% = intSearchForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strTopicStartUsername %></a></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfReplies %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" class="text"><% = lngNumberOfViews %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="29%" align="right" class="text"><% = DateFormat(dtmLastEntryDate, saryDateTimeData) %>&nbsp;<% = strTxtAt %>&nbsp;<% = TimeFormat(dtmLastEntryDate, saryDateTimeData) %>
      <br><% = strTxtBy %>&nbsp;<a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngLastEntryUserID %>&ForumID=<% = intSearchForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strLastEntryUsername %></a> <a href="display_topic_threads.asp?ForumID=<% = intSearchForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intRecordPositionPageNum %>&ThPage=<% = CInt(((lngNumberOfReplies+1)/intThreadsPerPage)+ 0.5) %>#<% = lngLastEntryMessageID %>" target="_self"><img src="<% = strImagePath %>right_arrow.gif" align="absmiddle" border="0" alt="<% = strTxtViewLastPost %>"></a></td>
    </tr>
    <%
		
		'Close the topic recordset
                rsTopic.Close
                
		'Move to the next database record
		rsTopicDetails.MoveNext	
	Next		
End If      
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
'If there is more than 1 page of topics then dispaly drop down list to the other topics
If intTotalNumOfPages > 1 Then   

	'Display an image link to the last topic
	Response.Write vbCrLf & "		<td><span class=""text"">" & strTxtSearch & " " & strTxtPage
	Response.Write vbCrLf & "		  <select onChange=""ForumJump(this)"" name=""SelectTopicPage"">"
	
	'Loop round to display links to all the other pages
	For intTopicPageLoopCounter = 1 to intTotalNumOfPages  
	
		'Display a link in the link list to the another topic page
		Response.Write vbCrLf & "		  <option value=""search.asp?search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&SearchPagePosition=" & intTopicPageLoopCounter & """"
		
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


'Reset Server Objects
rsForum.Close
Set rsForum = Nothing
rsTopicDetails.Close
Set rsTopicDetails = Nothing 
Set rsTopic = Nothing 
Set adoCon = Nothing
Set strCon = Nothing
%>
            <td align="right">&nbsp;</td>
  </tr>
 </table>
</form>
<div align="center">
 <table width="617" border="0" cellspacing="0" cellpadding="2">
  <tr> 
   <td width="193" class="text"><img src="<% = strImagePath %>no_new_posts_icon.gif" alt="<% = strTxtOpenTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtOpenTopic %></span></td>
   <td width="184" class="text"><img src="<% = strImagePath %>hot_topic_no_new_posts_icon.gif" alt="<% = strTxtHotTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtHotTopic %></span></td>
   <td width="141" class="text"><img src="<% = strImagePath %>priority_post_icon.gif" alt="<% = strTxtHighPriorityPost %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtHighPriorityPost %></span></td>
   <td width="94" class="text"><img src="<% = strImagePath %>pinned_topic_icon.gif" alt="<% = strTxtPinnedTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtPinnedTopic %></span></td>
  </tr>
  <tr> 
   <td width="193" class="text"><img src="<% = strImagePath %>new_posts_icon.gif" alt="<% = strTxtOpenTopicNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtOpenTopicNewReplies %></span></td>
   <td width="184" class="text"><img src="<% = strImagePath %>hot_topic_new_posts_icon.gif" alt="<% = strTxtHotTopicNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtHotTopicNewReplies %></span></td>
   <td width="141" class="text"><img src="<% = strImagePath %>priority_post_locked_icon.gif" alt="<% = strTxtHighPriorityPostLocked %>"><span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtHighPriorityPostLocked %></span></td>
   <td width="94" class="text"><img src="<% = strImagePath %>closed_topic_icon.gif" alt="<% = strTxtLockedTopic %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtLockedTopic %></span></td>
  </tr>
 </table>
 <br>
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
<%



'Function to build SQL query's for seach all or any words
Function BuildSQL (strTable, sarySearchWord)

	'Initilaise variables
	Dim intSQLLoopCounter
	
	
	'Initilaise variables
	intSQLLoopCounter = 0

	'Search for the first search word
	BuildSQL = BuildSQL & "(" & strTable & " LIKE '%" & sarySearchWord(0) & "%'"

	'Loop to search for each search word entered by the user
	For intSQLLoopCounter = 1 To UBound(sarySearchWord)
		
		'If the search is for all words then place AND between the words to be serached
		If Request.QueryString("searchMode") = "allwords" Then 
			BuildSQL = BuildSQL & " AND "
		
		'Else the user has choosen to search for any words so place OR between the words to be serached
		Else
			BuildSQL = BuildSQL & " OR "
		End If
		
		'Place the search word in the query
		BuildSQL = BuildSQL & strTable & " LIKE '%" & sarySearchWord(intSQLLoopCounter) & "%'"
	Next

	'Close the end of the search words in the SQL query by closing the bracket
	BuildSQL = BuildSQL & ")"
End Function
%>
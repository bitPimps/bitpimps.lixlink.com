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

Response.Buffer = True

'Dimension variables
Dim rsForum 			'Holds the Database Recordset Variable for the topic details
Dim rsThread			'Holds the database recordset variable for the thread
Dim intForumID			'Holds the forum ID number
Dim strForumName		'Holds the forum name
Dim lngTopicID			'Holds the topic number
Dim strSubject			'Holds the topic subject
Dim strUsername 		'Holds the Username of the thread
Dim lngUserID			'Holds the ID number of the user
Dim dtmTopicDate		'Holds the date the thread was made
Dim strMessage			'Holds the message body of the thread
Dim lngMessageID		'Holds the message ID number
Dim strAuthorHomepage		'Holds the homepage of the Username if it is given
Dim strAuthorLocation		'Holds the location of the user if given
Dim strAuthorAvatar		'Holds the authors avatar	
Dim strAuthorSignature		'Holds the authors signature
Dim lngAuthorNumOfPosts		'Holds the number of posts the user has made to the forum
Dim dtmAuthorRegistration	'Holds the registration date of the user
Dim lngNumberOfViews		'Holds the number of times the topic has been viewed to save back to the database
Dim intStatus			'Holds the users interger status
Dim strStatus			'Holds the users status
Dim strMode			'Holds the mode of the page that is being passed
Dim intTopicPageNumber		'Holds the topic page position to link back to
Dim blnNoThread			'Set to true if there is no thread to view
Dim blnIsModerator		'Set to true if the user who posted the message is a forum moderator
Dim blnForumLocked		'Set to true if the forum is locked
Dim blnTopicLocked		'set to true if the topic is locked
Dim intThreadNo			'Holds the number of threads in the topic
Dim intPriority			'Holds the priority level of the topic
Dim strPostPage 		'Holds the page the form is posted to
Dim intRecordPositionPageNum	'Holds the recorset page number to show the Threads for
Dim intTotalNumOfPages		'Holds the number of pages
Dim intRecordLoopCounter	'Holds the loop counter numeber
Dim intThreadPageLoopCounter	'Loop counter for other thread page link
Dim intTotalNumOfThreads	'Holds the total number of therads in this topic
Dim strAuthorIP			'Holds the authors IP
Dim strSearchKeywords		'Holds the keywords to search for
Dim sarySearchWord		'Array to hold the search words
Dim intHighlightLoopCounter	'Loop counter to loop through words and hightlight them

'Initialise variables
strMode = "reply"
lngMessageID = 0
intForumID = 0
lngTopicID = 0
intThreadNo = 0
blnNoThread = False
blnIsModerator = False

'If this is the first time the page is displayed then the Forum Thread record position is set to page 1
If Request.QueryString("ThreadPage") = "" Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the Forum Thread record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("ThreadPage"))
End If	


'Read in the Forum ID to display the Topics for
intForumID = CInt(Request.QueryString("ForumID"))
lngTopicID = CLng(Request.QueryString("TopicID"))
intTopicPageNumber = CInt(Request.QueryString("PagePosition"))
strSearchKeywords = Trim(Mid(Request.QueryString("search"), 1, 35))


'If there is no Topic ID then redirect the user to the main forum page
If lngTopicID = 0 Then Response.Redirect "default.asp"

'Filter the search words with the same filters as the text is saved with
strSearchKeywords = formatSQLInput(strSearchKeywords)
strSearchKeywords = formatInput(strSearchKeywords)

'Split up the keywords to be searched
sarySearchWord = Split(Trim(strSearchKeywords), " ")


'Get the threads from the database
'Create a record set object to the Threads held in the database
Set rsThread = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database get the thread details
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpThreadDetails @lngTopicID = " & lngTopicID
Else
	strSQL = "SELECT  tblTopic.Forum_ID, tblThread.*, tblAuthor.Username, tblAuthor.Homepage, tblAuthor.Location, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Signature, tblAuthor.Active, tblAuthor.Status, tblAuthor.Avatar, tblTopic.Subject, tblTopic.Locked, tblTopic.Priority, tblTopic.No_of_views "
	strSQL = strSQL & "FROM tblTopic INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
	strSQL = strSQL & "WHERE (((tblThread.Topic_ID)=" & lngTopicID & ")) "
	strSQL = strSQL & "ORDER by tblThread.Message_date ASC;"
End If

'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsThread.CursorType = 1

'Query the database
rsThread.Open strSQL, strCon 

'Set the number of records to display on each page
rsThread.PageSize = intThreadsPerPage


'If there is no topic in the database then display the appropraite mesasage
If rsThread.EOF Then
	
	'If there are no thread's to display then display the appropriate error message
	strSubject = strTxtNoThreads
	blnNoThread = True


'Else there are records returned by the database
Else
	'Count the number of pages there are in the recordset calculated by the PageSize attribute set by admin 
	intTotalNumOfPages = rsThread.PageCount
	
	'Get the total amount of threads in the topic
	intTotalNumOfThreads = rsThread.RecordCount
	
	'Get the record poistion to display from
	'If the page number to show from is higher than the last page number then the last page number is the highers page
	If (intRecordPositionPageNum > intTotalNumOfPages) OR (Request.QueryString("get") = "last") Then
		'Set the page number to show from
		rsThread.AbsolutePage = intTotalNumOfPages
		'Set the page position number to the highest page number
		intRecordPositionPageNum = intTotalNumOfPages
	'Else the page number to show from is the requested page number
	Else
		rsThread.AbsolutePage = intRecordPositionPageNum
	End If	


	'Read in the number of views for the page form the database
	lngNumberOfViews = CLng(rsThread("No_of_views"))
	
	'Add 1 to the number of views the Topic has had
	lngNumberOfViews = lngNumberOfViews + 1
	
	'Write the number of times the Topic has been viewed back to the database
	'Initalise the strSQL variable with the SQL string
	strSQL = "UPDATE tblTopic SET "
	strSQL = strSQL & "tblTopic.No_of_views=" & lngNumberOfViews
	strSQL = strSQL & " WHERE (((tblTopic.Topic_ID)=" & lngTopicID & "));"
							
	'Write to the database
	adoCon.Execute(strSQL)


	'Read in the thread subject forum ID and where the topic is locked
	strSubject = rsThread("Subject")
	blnTopicLocked = CBool(rsThread("Locked"))
	intPriority = CInt(rsThread("Priority"))
	
	'If the priority of the post is not for all forums then get the Forum ID from the database for this topic
	If intPriority <> 1 Then
		intForumID = Cint(rsThread("Forum_ID"))
	End If
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
		rsThread.Close
		Set rsThread = Nothing
		rsForum.Close
		Set rsForum = Nothing 
		Set adoCon = Nothing
		Set strCon = Nothing
		
		'Redirect to a page asking for the user to enter the forum password
		Response.Redirect "forum_password_form.asp?ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID
	End If
End If


'If the forum level for the user on this forum is 2 (read only) set the forum to be locked
If (intMemberSecurityLevel = 2 AND blnModerator = False AND NOT lngLoggedInUserID = 1) AND (lngLoggedInUserID > 0) Then blnForumLocked = True
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum: <% = strSubject %></title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
     	   	
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
        <tr><td class="text"><% = strTxtWelcome & " " &  strLoggedInUsername %></td>
          <td align="right">
          <%
'If the user has logged in then the Logged In User ID number will not be 0 and not 2 for the guest account
If NOT lngLoggedInUserID = 0 AND NOT lngLoggedInUserID = 2 Then
	
	'Dispaly a " & strTxtWelcome & " message to the user in the top bar
	Response.Write vbCrLf & "<a href=""profile_edit.asp?ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "edit_profile.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtEditProfile & """></a>&nbsp;<a href=""log_off_user.asp?ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "log_off.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogOff & """ border=""0"" align=""absmiddle""></a>"

'Else the user is not logged
Else
    	'Display a " & strTxtWelcome & " guset message with the option to login or register
    	Response.Write vbCrLf & "<a href=""register_form.asp?ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;<a href=""login_user.asp?ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"
End If
%>
          
            <a href="search_form.asp?ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
            <a href="forum_members.asp?ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a>
          </td>
        </tr>
      </table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="69%"> 
   <%

'Check there is a forum to display
If rsForum.EOF Then

	'If there is no forum to display then display the appropriate error message
	Response.Write vbCrLf & "<br><span class=""text"">" & strTxtNoForums & "</span>"

'Else there the is a forum then write the HTML to display it the forum names and a discription
Else 				
	'Write the HTML of the forum descriptions as hyperlinks to the forums
	Response.Write vbCrLf & "<img src=""" & strImagePath & "folder_icon.gif"" border=""0"" align=""bottom"">&nbsp;<a href=""default.asp"" target=""_self"">" & strTxtAllForums & "</a><br>"
	Response.Write vbCrLf & "<img src=""" & strImagePath & "folder_line.gif"">&nbsp;<img src=""" & strImagePath & "open_folder_icon.gif"" width=""15"" height=""15"">&nbsp;<a href=""display_forum_topics.asp?ForumID=" & intForumID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self"">" & strForumName & "</a>"
	'If the forum is locked show a locked pad lock icon
	If blnForumLocked = True Then
		Response.Write ("  <span class=""text"">(<img src=""" & strImagePath & "forum_locked_icon.gif"" align=""baseline"" alt=""" & strTxtForumLocked & """> " & strTxtForumLocked & ")</span>")
	End If

	'If this is the results of a search have a link back to the serach results
	If Request.QueryString("ReturnPage") = "Search" Then
%>
   <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<% = strImagePath %>folder_line.gif"> <img src="<% = strImagePath %>open_folder_icon.gif"> 
   <a href="search.asp?ForumID=<% = Request.QueryString("ForumID") %>&TopicID=<% = Request.QueryString("TopicID") %>&SearchPagePosition=<% = Request.QueryString("SearchPagePosition") %>&search=<% = Server.URLEncode(Request.QueryString("search")) %>&searchMode=<% = Request.QueryString("searchMode") %>&searchIn=<% = Request.QueryString("searchIn") %>&forum=<% = Request.QueryString("forum") %>&searchSort=<% = Request.QueryString("searchSort") %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self"><% = strTxtSearchResults %></a> 
   <%
	'If this is a link from an active topic page then link back to it
	ElseIf Request.QueryString("ReturnPage") = "Active" Then %>
	<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<% = strImagePath %>folder_line.gif"> <img src="<% = strImagePath %>open_folder_icon.gif"> 
   <a href="active_topics.asp?PagePosition=<% = intTopicPageNumber %>&showActive=<% = Request.QueryString("showActive") %>" target="_self"><% = strTxtActiveTopics %></a> 
	<%	
	End If
End If

%>
  </td>
  <td align="right" width="31%" >&nbsp;<!-- #include file="pm_check.inc" --><%
   	'If the user is the forum admin or a moderator then let them move the topic to another forum
	If lngLoggedInUserID = 1 OR blnModerator = True Then %>  		
      <br>
      <a href="move_topic_form.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtMoveTopic %></a><%
	End If
%></td>
 </tr>
</table>
      <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
        <tr> 
          <td width="70%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtTopic & ": " & strSubject %></span><%
'If the topic is locked then have a locked icon
If blnTopicLocked = True Then
	Response.Write ("  <span class=""text"">(<img src=""" & strImagePath & "forum_locked_icon.gif"" align=""baseline"" alt=""" & strTxtTopicLocked & """> " & strTxtTopicLocked & ")</span>")
End If
    %></td>
          <%
'If the user has logged in then the Logged In User ID number will be more than 0
If NOT lngLoggedInUserID = 0 AND blnActiveMember = True Then
	
	'If the reply box is on the same page shorten the reply link
	If intRecordPositionPageNum = intTotalNumOfPages Then
		'Display images with links to reply to post or post a new topic
		Response.Write (vbCrLf & "<td align=""right""><a href=""#reply"" target=""_self""><img src=""" & strImagePath & "post_reply.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtPostReply & """></a>")
	Else	
		'Display images with links to reply to post or post a new topic
		Response.Write (vbCrLf & "<td align=""right""><a href=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intTotalNumOfPages & "#reply"" target=""_self""><img src=""" & strImagePath & "post_reply.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtPostReply & """></a>")
	End If

	Response.Write("&nbsp;<a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "new_post.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtNewTopic & """></a></td>")

'Else the user is not logged
Else
    
    	'Display images with links to reply to post or post a new topic but get redirected to a login screen if user is not logged in
	Response.Write vbCrLf & "<td align=""right""><a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "post_reply.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtPostReply & """></a>&nbsp;<a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "new_post.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtNewTopic & """></a></td>"
End If
%>       
        </tr>
      </table>
<%
'Intialise the ADO recordset object
Set rsModerator = Server.CreateObject("ADODB.Recordset")


'If there are threads display them
If NOT rsThread.EOF Then

	'Loop round to read in all the thread's in the database
	For intRecordLoopCounter = 1 to intThreadsPerPage
	
		'Initilise moderator variable
		blnIsModerator = False
	
		'If there are no reacrds left exit for loop
		If rsThread.EOF Then Exit For
	
		'Calculate the thread number
		intThreadNo = intThreadNo + 1
		
		'Read in threads details for the topic from the database
		lngMessageID = CLng(rsThread("Thread_ID"))
		strMessage = rsThread("Message")
		strUsername = rsThread("Username") 
		lngUserID = CLng(rsThread("Author_ID"))
		dtmTopicDate = CDate(rsThread("Message_date")) 
		strAuthorHomepage = rsThread("Homepage")
		strAuthorLocation = rsThread("Location")
		dtmAuthorRegistration = CDate(rsThread("Join_date"))
		lngAuthorNumOfPosts = CLng(rsThread("No_of_posts"))
		intStatus = CInt(rsThread("Status"))
		strAuthorAvatar = rsThread("Avatar")
		strAuthorSignature = rsThread("Signature")
		strAuthorIP = rsThread("IP_addr")
		
		
		'Make search words in the subject highlighted
		For intHighlightLoopCounter = 0 To UBound(sarySearchWord)
		
			'Replace the search words with highlited ones
			strMessage = Replace(strMessage, sarySearchWord(intHighlightLoopCounter), "<span style=""color: #000000; background-color: #ffff66"">" & sarySearchWord(intHighlightLoopCounter) & "</span>", 1, -1, 1)
		Next
			
				
		'If the users account is not active make there account level guest
		If CBool(rsThread("Active")) = False Then intStatus = 0
		
		
		'SQL query to see if this person moderates this forum
		If strDatabaseType = "SQLServer" Then
			strSQL = "EXECUTE wwfSpCheckUserIsModerator @lngUserID = " & lngUserID & ", @intForumID = " & intForumID
		Else
			strSQL = "SELECT TOP 1 tblModerator.Moderator_ID FROM tblModerator "
			strSQL = strSQL & "WHERE tblModerator.Author_ID=" & lngUserID & " AND (tblModerator.Forum_ID=" & intForumID & " OR tblModerator.Forum_ID=0);"
		End If
						
		'Query the database
		rsModerator.Open strSQL, strCon
					
		'If a record is returned then this user moderates this forum :)
		If NOT rsModerator.EOF Then blnIsModerator = True
					
		'Get rid of them objects
		rsModerator.Close
		
		
		'Turn the members status number returned from the database into a string value
		Select Case intStatus
			'Guest status
			Case 0
				strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtGuest & "</span><br><img src=""" & strImagePath & "0_star_rating.gif"" alt=""" & strTxtGuest & """>"
			'Standard member status
			Case 1
				strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtStandardMember & "</span><br><img src=""" & strImagePath & "1_star_rating.gif"" alt=""" & strTxtStandardMember & """>"
			'Super member status
			Case 2
				strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtGoldMember & "</span><br><img src=""" & strImagePath & "2_star_rating.gif"" alt=""" & strTxtGoldMember & """>"
			'Power member status
			Case 3
				strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtPlatinumMember & "</span><br><img src=""" & strImagePath & "3_star_rating.gif"" alt=""" & strTxtPlatinumMember & """>"
		End select			
		
		'If the user is admin or this forums moderator then display so
		If blnIsModerator = True Then strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtForumModerator & "</span><br><img src=""" & strImagePath & "4_star_rating.gif"" alt=""" & strTxtForumModerator & """>"
		If lngUserID = 1 Then strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtForumAdmin & "</span><br><img src=""" & strImagePath & "5_star_rating.gif"" alt=""" & strTxtForumAdministrator & """>"
		
		
		
		
		'If the user wants there signature shown then attach it to the message
		If rsThread("Show_signature") = True AND strAuthorSignature <> "" Then
			strMessage = strMessage & "<!-- Signature --><br><br><span style=""font-size:9px;"">-----------------</span><br>" & strAuthorSignature & "<!-- Signature -->"
		End If
		
		'If no location is given then display a not given for the location
		If strAuthorLocation = "" Then strAuthorLocation = "&nbsp;"
	
	%>
	<a name="<% = lngMessageID %>">
	<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>" align="center">
          <tr>
           <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strBehindBgColour %>" height="145">
             <tr> 
              <td colspan="2">
               <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>">
                <tr> 
                 <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="<% = strTopBarColour %>" background="<% = strTopBarBgImage %>">
                   <tr> 
                    <td class="text"><% Response.Write(strTxtMessageBy & " <a href=""JavaScript:openWin('pop_up_profile.asp?profile=" & lngUserID & "&ForumID=" & intForumID & "','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"">" & strUsername & "</a> " & strTxtOn & " " & DateFormat(dtmTopicDate, saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(dtmTopicDate, saryDateTimeData)) & "<span style=""font-size=" & intSmallFontSize & "px"">"
                'If the user is the admin or moderatir then display the authors IP
                If (lngLoggedInUserID = 1 OR blnModerator = True) AND strAuthorIP <> "" Then
                	Response.Write(" - " & strTxtIP & " " & strAuthorIP)
                Else
                	Response.Write(" - " & strTxtIPLogged)
        	End If
        	Response.Write("</span>")
                    %>
            <br>
            <a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngUserID %>&ForumID=<% = intForumID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><img src="<% = strImagePath %>profile_icon.gif" border="0" alt="<% = strTxtView %>&nbsp;<% = strUsername %>'s&nbsp;<% = strTxtProfile %>" align="absmiddle"></a>
            <a href="search_form.asp?search=<% = Server.URLEncode(strUsername) %>&searchIn=Author&forum=<% = CInt(Request.QueryString("ForumID")) %>&date=DESC&ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>&ThreadPos=<% = intTotalNumOfPages %>"><img src="<% = strImagePath %>search_sm.gif" border="0" alt="<% = strTxtSearchForPosts %>&nbsp;<% = strUsername %>" align="absmiddle"></a>
            <% 
            	'If the user has a hompeage put in a link button
      		If strAuthorHomepage <> "" Then
%>
            <a href="<% = strAuthorHomepage %>" target="_blank"><img src="<% = strImagePath %>home_icon.gif" border="0" alt="<% = strTxtVisit & " " & strUsername & "'s " & strTxtHomepage %>" align="absmiddle"></a>
            <%
      		End If
      
      		'If the topic is not locked put in a link for someone to quote this message
      		If blnTopicLocked = False OR (blnTopicLocked = True AND lngLoggedInUserID = 1) Then
            %>
            <a href="post_message_form.asp?mode=quote&threadID=<% = lngMessageID %>&ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>&ThreadPos=<% = intTotalNumOfPages %>"><img src="<% = strImagePath %>quote_icon.gif" align="absmiddle" border="0" alt="<% = strTxtQuote %>&nbsp;<% = strUsername %>"></a> 
<%
            	End If
            
            	'If the private msg's are on then display a link to enable use to send them a msg 
            	If blnPrivateMessages = True Then %>
            <a href="pm_new_message_form.asp?name=<% = Server.URLEncode(strUsername) %>" target="_self"><img src="<% = strImagePath %>pm_icon.gif" align="absmiddle" border="0" alt="<% = strTxtSendPrivateMessage %>"></a>
            <a href="pm_buddy_list.asp?name=<% = Server.URLEncode(strUsername) %>" target="_self"><img src="<% = strImagePath %>add_buddy_sm.gif" align="absmiddle" border="0" alt="<% = strTxtAddToBuddyList %>"></a>
            <% 
      		End If
           
	      'If the logged in user is the person who posted the message or the forum administrator/moderator then allow them to edit or delete the message
	      If (lngLoggedInUserID = lngUserID OR lngLoggedInUserID = 1 OR blnModerator = True) AND (blnForumLocked = False OR lngLoggedInUserID = 1) AND (blnActiveMember = True) AND (NOT lngLoggedInUserID = 2) AND (blnTopicLocked = False OR lngLoggedInUserID = 1) AND ((intPriority <> 3 OR intThreadNo <> 1) OR lngLoggedInUserID = 1) Then
	      	   	
	      	   	'Check the time limit on editing posts has not expired
      			If DateDiff("n", dtmTopicDate, now()) < intDeletePostsTimeLimit OR (lngLoggedInUserID = 1 OR blnModerator = True) Then
	      	   		Response.Write("<a href=""edit_post.asp?threadNo=" & intThreadNo & "&messageID=" & lngMessageID & "&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self""><img src=""" & strImagePath & "edit_post_icon.gif"" border=""0"" align=""absmiddle"" alt=""" & strTxtEditPost & """></a>")
	            		Response.Write(VbCrLf & "<a href=""delete_post.asp?messageID=" & lngMessageID & "&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """ target=""_self"" OnClick=""return confirm('" & strTxtDeletePostAlert & "')""><img src=""" & strImagePath & "delete_sm.gif"" align=""absmiddle"" alt=""" & strTxtDeletePost & """ border=""0""></a>")
	      		End If
	      End If
      
         
   	      'If the user is the forum admin or a moderator then let them move the topic to another forum
	      If lngLoggedInUserID = 1 OR blnModerator = True Then %>  		

            <a href="move_post_form.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>&MessageID=<% = lngMessageID %>" target="_self"><img src="<% = strImagePath %>move_icon.gif" align="absmiddle" border="0" alt="<% = strTxtMovePost %>"></a>
            <%
	      End If
%>
           </td>
                   </tr>
                  </table>
                 </td>
                </tr>
               </table>
              </td>
             </tr>
             <tr> 
              <td valign="top"> 
               <table border="0" cellspacing="1" cellpadding="1" bgcolor="<% = strTableBorderColour %>" height="100%">
                <tr> 
                 <td valign="top" bgcolor="<% = strSideBarColour %>" background="<% = strSideBarImage %>"> 
                  <table border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strSideBarColour %>" background="<% = strSideBarImage %>" height="100%">
                   <tr> 
                    <td valign="top"> 
              	     <table border="0" cellspacing="0" cellpadding="2" height="145">
                      <tr> 
                       <td class="text" align="center"><% = strUsername %></td>
                      </tr>
                      <%
	        'If the user has an avatar then display it
	        If blnAvatar = True AND strAuthorAvatar <> "" Then 
	        	Response.Write("<tr> ")
	        	Response.Write("<td class=""text"" align=""center""><img src=""" & strAuthorAvatar & """ width=""" & intAvatarWidth & """ height=""" & intAvatarHeight & """ alt=""" & strTxtAvatar & """ OnError=""this.src='avatars/blank.gif', height='0';""></td>")
	       		Response.Write("</tr>")
	       	End If
                     %>
                      <tr> 
                       <td class="text" align="center"><% = strStatus %></td>
                      </tr>
                      <tr> 
                       <td><img src="<% = strImagePath %>1px_spacer.gif" width="112" height="1"></td>
                       </tr>
          		<tr> 
           		<td class="text" valign="bottom"><span style="font-size: <% = intSmallFontSize %>px;"><% = strAuthorLocation %>
           		 <br><% = DateFormat(dtmAuthorRegistration, saryDateTimeData) %>
           		 <br><% = lngAuthorNumOfPosts %>&nbsp;<% = strTxtPosts %></span></td>
           		</tr>
                     </table>       
                    </td>
                   </tr>
                  </table>
                 </td>
                </tr>
               </table>
              </td>
              <td width="90%"  valign="top">
               <table border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>" width="100%">
                <tr> 
                 <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="<% = strDisplayPostBoxColour %>" background="<% = strDisplayPostBoxImage %>" height="147">
                   <tr> 
                    <td class="text" valign="top"><!-- Message body --><% = strMessage %><!-- Message body ''"" --></td>
                   </tr>
                  </table>
                 </td>
                </tr>
               </table>
              </td>
             </tr>
            </table>
           </td>
          </tr>
         </table>
<br>
<%
		'Move to the next database record
		rsThread.MoveNext
	Next	
End If	


'get rid of server objects	
Set rsModerator = Nothing 
rsForum.Close
Set rsForum = Nothing  
rsThread.Close
Set rsThread = Nothing  

'Set up an achor
Response.Write("<a name=""reply""></a>")
    
'If the user has logged in then display a form so they can post a thread unless there are more thread pages
If (NOT lngLoggedInUserID = 0 AND blnNoThread = False AND blnActiveMember = True AND (blnForumLocked = False OR lngLoggedInUserID = 1) AND (blnTopicLocked = False OR lngLoggedInUserID = 1)) AND (intRecordPositionPageNum = intTotalNumOfPages) Then
%>
<div align="center"><span class="heading"><% = strTxtPostReply %></span><br>
<%
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
</div>
  <%
End If
%>
<div align="center"> 
<%
'Display message if the users forum membership is suspended
If blnActiveMember = False AND (intRecordPositionPageNum = intTotalNumOfPages) Then
%>
  <p class="text"><% = strTxtSorryNoReply %><br><% = strTxtForumMembershipSespended %></p>
  <%
'Display message if the forum is locked
ElseIf blnForumLocked = True AND (intRecordPositionPageNum = intTotalNumOfPages) Then
	%>
  
<p class="text"><% = strTxtSorryNoReply %><br><% = strTxtThisForumIsLocked %></p><%

'Display message if the topic is locked
ElseIf blnTopicLocked = True AND (intRecordPositionPageNum = intTotalNumOfPages) Then
	%>
  
<p class="text"><% = strTxtSorryNoReply %><br><% = strTxtThisTopicIsLocked %></p><%
'Display message if the user is a guest or not logged in
ElseIf lngLoggedInUserID = 0 AND (intRecordPositionPageNum = intTotalNumOfPages) Then
%>
  <p class="text"><% = strTxtPostAReplyRegister %>&nbsp;<a href="login_user.asp?ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self"><% = strTxtLogin %></a><br>
  <% = strTxtNeedToRegister %>&nbsp;<a href="register_form.asp?ReturnPage=Thread&ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>&PagePosition=<% = intTopicPageNumber %>&ThreadPage=<% = intRecordPositionPageNum %>" target="_self"><% = strTxtSmRegister %></a> 
</p>
  <%
End If
%>
    <form>
          <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
            <tr> 
              <td><!-- #include file="forum_jump.inc" --></td>
              <%


'If there is more than 1 page of topics then dispaly drop down list to the other threads
If intTotalNumOfPages > 1 Then   

	'Display an image link to the last topic
	Response.Write vbCrLf & "		<td><span class=""text"">" & strTxtPage
	Response.Write vbCrLf & "		 <select onChange=""ForumJump(this)"" name=""SelectTopicPage"">"
	
	'Loop round to display links to all the other pages
	For intThreadPageLoopCounter = 1 to intTotalNumOfPages  
	
		'Display a link in the link list to the another threads pages
		'If it's a search result page build up a longer link to cover the search conditions
		If Request.QueryString("ReturnPage") = "Search" Then																																			
			Response.Write vbCrLf & "		  <option value=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&SearchPagePosition=" & Request.QueryString("SearchPagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort") & "&ReturnPage=Search&ThreadPage=" & intThreadPageLoopCounter & """"
		Else
			Response.Write vbCrLf & "		  <option value=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&ReturnPage=" & Request.QueryString("ReturnPage") & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intThreadPageLoopCounter & """"
		End If
		
		'If this page number to display is the same as the page being displayed then make sure it's selected
		If intThreadPageLoopCounter = intRecordPositionPageNum Then
			Response.Write " selected"
		End If
		
		'Display the link page number
		Response.Write ">" & intThreadPageLoopCounter & "</option>"
	
	Next
	
	'End the drop down list
	Response.Write vbCrLf & "		</select> " & strTxtOf & " " & intTotalNumOfPages & "</span></td>"
End If

              
'If the user has logged in then the Logged In User ID number will be more than 0
If NOT lngLoggedInUserID = 0 AND blnActiveMember = True Then
	
	'Display images with links to reply to post or post a new topic
	Response.Write(vbCrLf & "<td align=""right"">")
	'Only show the post reply link button on pages without the reply box as some people seem to think this button should actually post the forum!!!
	If intRecordPositionPageNum <> intTotalNumOfPages Then
		Response.Write("<a href=""display_topic_threads.asp?ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intTotalNumOfPages & "#reply"" target=""_self""><img src=""" & strImagePath & "post_reply.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtPostReply & """></a>")
	End If
	Response.Write(vbCrLf & "<a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "new_post.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtNewTopic & """></a></td>")

'Else the user is not logged
Else
    
    	'Display images with links to reply to post or post a new topic but get redirected to a login screen if user is not logged in
	Response.Write vbCrLf & "<td align=""right""><a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "post_reply.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtPostReply & """></a>&nbsp;<a href=""post_message_form.asp?mode=new&ReturnPage=Thread&ForumID=" & intForumID & "&TopicID=" & lngTopicID & "&PagePosition=" & intTopicPageNumber & "&ThreadPage=" & intRecordPositionPageNum & """  target=""_self""><img src=""" & strImagePath & "new_post.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtNewTopic & """></a></td>"
End If

'Clear server objects
Set adoCon = Nothing
Set strCon = Nothing
%>
            </tr>
          </table>
    </form>
 <table width="300" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="<% = strTableBorderColour %>">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="4" align="center" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>">
        <tr>
      <td align="center"> <a href="JavaScript:openWin('display_printer_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>','printer_friendly','toolbar=0,location=0,status=0,menubar=1,scrollbars=1,resizable=1,width=640,height=390')"><img src="<% = strImagePath %>print_version.gif" width="16" height="14" align="absmiddle" border="0" alt="<% = strTxtPrintVersion %>"></a> 
       <a href="JavaScript:openWin('display_printer_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>','printer_friendly','toolbar=0,location=0,status=0,menubar=1,scrollbars=1,resizable=1,width=640,height=390')" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtPrintVersion %></a> 
       <%
'If the user has logged in then the Logged In and the e-mail is on then display a link to allow the user to e-mail topic to a friend
If NOT lngLoggedInUserID = 0 AND blnEmail = True AND blnActiveMember = True Then
%>
       &nbsp;<a href="JavaScript:openWin('e-mail_topic.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>','email_friend','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=450')"><img src="<% = strImagePath %>e-mail_topic.gif" width="20" height="13" align="absmiddle" border="0" alt="<% = strTxtEmailTopic %>"></a> 
       <a href="JavaScript:openWin('e-mail_topic.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>','email_friend','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=450')" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtEmailTopic %></a> 
       <%
End If
%>
      </td>
     </tr>
    </table>
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
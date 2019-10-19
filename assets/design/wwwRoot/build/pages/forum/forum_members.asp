<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
<!--#include file="langauge_file.inc" -->

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
Dim rsMembers 			'Holds the Database Recordset for the forum members
Dim rsModerators		'Holds the recordset to see if the user is a moderator
Dim strUsername			'Holds the users username
Dim strHomepage			'Holds the users homepage if they have one
Dim strEmail			'Holds the users e-mail address
Dim blnShowEmail		'Boolean set to true if the user wishes there e-mail address to be shown
Dim lngUserID			'Holds the new users ID number
Dim intNumOfPosts		'Holds the number of posts the user has made
Dim intStatus			'Holds the users interger status
Dim strStatus			'Holds the users status
Dim dtmRegisteredDate		'Holds the date the usre registered
Dim strReturnPage		'Holds the page to return to 
Dim intTotalNumMembersPages	'Holds the total number of pages
Dim intTotalNumMembers		'Holds the total number of forum members
Dim intRecordPositionPageNum	'Holds the page number we are on
Dim intRecordLoopCounter	'Recordset loop counter
Dim dtmLastPostDate		'Holds the date of the users las post
Dim intLinkPageNum		'Holds the page number to link to
Dim strReturnPageProperties	'Holds the properties of the return page
Dim strSearchCriteria		'Holds the search critiria
Dim strSortBy			'Holds the way the records are sorted
Dim intSortSelectField		'Holds the sort selection to be shown in the sort list box

'Initalise variables
blnShowEmail = False


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


'If this is the first time the page is displayed then the members record position is set to page 1
If Request.QueryString("MemPagePosition") = "" Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the members page record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("MemPagePosition"))
End If	


'Get the search critiria for the members to display
If NOT Request.QueryString("find") = "" Then
	strSearchCriteria = Trim(Mid(Request.QueryString("find"), 1, 15))
End If

'Take out parts of the username that are not permitted
strSearchCriteria = Replace(strSearchCriteria, "password", "", 1, -1, 1)
strSearchCriteria = Replace(strSearchCriteria, "author", "", 1, -1, 1)
strSearchCriteria = Replace(strSearchCriteria, "code", "", 1, -1, 1)
strSearchCriteria = Replace(strSearchCriteria, "username", "", 1, -1, 1)

'Get rid of milisous code
strSearchCriteria = formatSQLInput(strSearchCriteria)

'Get the sort critiria
Select Case Request.QueryString("Sort")
	Case "post"
		strSortBy = "No_of_posts DESC"
		intSortSelectField = 1
	Case "latestUsers"
		strSortBy = "Join_date DESC"
		intSortSelectField = 2
	Case "oldestUsers"
		strSortBy = "Join_date ASC"
		intSortSelectField = 3
	Case "group"
		strSortBy = "Status DESC"
		intSortSelectField = 4
	Case Else
		strSortBy = "Username ASC"
		intSortSelectField = 0
End Select 


%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Forum Members List</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a somthing to search for
	if (document.frmMemberSearch.find.value==""){
	
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";
	
		alert(msg + "\n\t<% = strTxtErrorMemberSerach %>\n\n");
		document.frmMemberSearch.find.focus();
		return false;
	}
	
	return true;
}
     	
//Function to choose how the members list is sorted
function MembersSort(SelectSort){

   	if (SelectSort != "") self.location.href = "forum_members.asp<% = strReturnPageProperties %>&find=<% = Server.URLEncode(Request.QueryString("find")) %>&sort=" + SelectSort.options[SelectSort.selectedIndex].value;	
	return true;
}

//Function to move to another page of members
function MembersPage(SelectPage){

   	if (SelectPage != -1) self.location.href = "forum_members.asp<% = strReturnPageProperties %>&find=<% = Request.QueryString("find") %>&sort=<% = Request.QueryString("sort") %>&MemPagePosition=" + SelectPage.options[SelectPage.selectedIndex].value;	
	return true;
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
// -->
</script>
<!-- #include file="header.inc" -->
   <div align="center" class="heading"> 
    <% = strTxtForumMembersList %>
   </div>
   <div align="center"> <a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"> 
    <% = strTxtReturnToDiscussionForum %>
    </a><br>
    <br>
    <form name="frmMemberSearch" method="get" action="forum_members.asp" onSubmit="return CheckForm();">
     <table width="490" border="0" cellspacing="0" cellpadding="1" height="24" align="center" bgcolor="<% = strTableBorderColour %>">
      <tr> 
       <td align="center" height="2"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="4" bgcolor="<% = strTableBorderColour %>">
         <tr> 
          <td align="center" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" width="100%" height="20"><span class="text"> 
           <% = strTxtMemberSearch %>
           :</span> 
           <input type="text" name="find" size="15" maxlength="15">
           <input type="submit" name="Submit" value="<% = strTxtSearch %>">
           <input type="hidden" name="ReturnPage" value="<% = Request.QueryString("ReturnPage") %>">
           <input type="hidden" name="ForumID" value="<% = Request.QueryString("ForumID") %>">
           <input type="hidden" name="TopicID" value="<% = Request.QueryString("TopicID") %>">
           <input type="hidden" name="PagePosition" value="<% = Request.QueryString("PagePosition") %>">
           <input type="hidden" name="SearchPagePosition" value="<% = Request.QueryString("SearchPagePosition") %>">
           <input type="hidden" name="search" value="<% = Server.URLEncode(Request.QueryString("search")) %>">
           <input type="hidden" name="searchMode" value="<% = Request.QueryString("searchMode") %>">
           <input type="hidden" name="searchIn" value="<% = Request.QueryString("searchIn") %>">
           <input type="hidden" name="forum" value="<% = Request.QueryString("forum") %>">
           <input type="hidden" name="searchSort" value="<% = Request.QueryString("searchSort") %>">
          </td>
         </tr>
         <tr> 
          <td align="center" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" width="100%"><a href="forum_members.asp<% = strReturnPageProperties %>" target="_self"><% = strTxtAll %></a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=A" target="_self">A</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=B" target="_self">B</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=C" target="_self">C</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=D" target="_self">D</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=E" target="_self">E</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=F" target="_self">F</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=G" target="_self">G</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=H" target="_self">H</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=I" target="_self">I</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=J" target="_self">J</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=K" target="_self">K</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=L" target="_self">L</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=M" target="_self">M</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=N" target="_self">N</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=O" target="_self">O</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=P" target="_self">P</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=Q" target="_self">Q</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=R" target="_self">R</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=S" target="_self">S</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=T" target="_self">T</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=U" target="_self">U</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=V" target="_self">V</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=W" target="_self">W</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=X" target="_self">X</a> 
           <a href="forum_members.asp<% = strReturnPageProperties %>&find=Y" target="_self">Y</a> <a href="forum_members.asp<% = strReturnPageProperties %>&find=Z" target="_self">Z</a></td>
         </tr>
        </table>
       </td>
      </tr>
     </table>
    </form>
   </div>
   <div align="center"><%
   
'If the user has not logged in dispaly an error message
If lngLoggedInUserID = 0 Then

	Response.Write vbCrLf & "<span class=""text"">" & strTxtMustBeRegistered & "</span><br><br>"
	Response.Write vbCrLf & "<a href=""register_form.asp" & strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;&nbsp;<a href=""login_user.asp" &  strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"

'If the user has logged in then read in the members from the database and dispaly them
Else

	'Intialise the ADO recordset object
	Set rsMembers = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Author_ID, tblAuthor.Username, tblAuthor.Homepage, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Status, tblAuthor.Active "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE (((tblAuthor.Username) Like '" & strSearchCriteria & "%')) "
	strSQL = strSQL & "ORDER BY tblAuthor." & strSortBy & ";"
	
	'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
	rsMembers.CursorType = 1
		
	'Query the database
	rsMembers.Open strSQL, strCon
	
	'Set the number of records to display on each page
	rsMembers.PageSize = 25
	
	
	'If there are no memebers to display then show an error message
	If rsMembers.EOF Then
		Response.Write "<span class=""text"">" & strTxtSorryYourSearchFoundNoMembers & "</span>"
	
	'If there is a recordset returned by the query then read in the details
	Else	
		'Set the page number to display records for
		rsMembers.AbsolutePage = intRecordPositionPageNum
		
	
		'Count the number of members there are in the database by returning the number of records in the recordset
		intTotalNumMembers = rsMembers.RecordCount	
		
		'Count the number of pages there are in the database calculated by the PageSize attribute set above
		intTotalNumMembersPages = rsMembers.PageCount
	
	
		'Display the HTML for the total number of pages and total number of records in the database for the users
		Response.Write vbCrLf & "	<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
		Response.Write vbCrLf & " 	  <tr>"
		Response.Write vbCrLf & " 	    <td align=""center"" class=""text"">"
		
		'If we are showing all the forum memebers then display how many members there are
		If Request.QueryString("find") = "" Then
			Response.Write vbCrLf & "	      " & strTxtThereAre & " " & intTotalNumMembers & " " & strTxtForumMembersOn & " " & intTotalNumMembersPages & " " & strTxtPageYouAerOnPage & " " & intRecordPositionPageNum
		'Else display how many results were fround from the search
		Else
			Response.Write vbCrLf & "	      " & strTxtYourSearchMembersFound & " " & intTotalNumMembers & " " & strTxtMatches
		End If
		
		Response.Write vbCrLf & "	    </td>"
		Response.Write vbCrLf & "	  </tr>"
		Response.Write vbCrLf & "	</table>"
		Response.Write vbCrLf & "	<br>"

%>  <form>
     <table width="630" border="0" cellspacing="0" cellpadding="0" align="center" height="32">
      <tr> 
       <td align="right" height="28" valign="top"><span class="text"><% = strTxtSortResultsBy %></span> 
        <select name="SelectSort" onChange="MembersSort(this)">
         <option value="username" <% If intSortSelectField = 0 Then Response.Write "selected" %>><% = strTxtUsernameAlphabetically %></option>
         <option value="post" <% If intSortSelectField = 1 Then Response.Write "selected" %>><% = strTxtPosts %></option>
         <option value="latestUsers" <% If intSortSelectField = 2 Then Response.Write "selected" %>><% = strTxtNewForumMembersFirst %></option>
         <option value="oldestUsers" <% If intSortSelectField = 3 Then Response.Write "selected" %>><% = strTxtOldForumMembersFirst %></option>
         <option value="group" <% If intSortSelectField = 4 Then Response.Write "selected" %>><% = strTxtType %></option>
        </select>
       </td>
      </tr>
     </table>
     <table width="630" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
      <tr> 
       <td> 
        <table width="630" border="0" cellspacing="1" cellpadding="4" height="14" bgcolor="<% = strTableBorderColour %>">
         <tr> 
          <td bgcolor="<% = strTableTitleColour %>" height="2" width="116" class="tHeading" background="<% = strTableTitleBgImage %>"><a href="http://www.webwizguide.info"></a><% = strTxtUsername %></td>
          <td bgcolor="<% = strTableTitleColour %>" width="113" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtType %></td>
          <td bgcolor="<% = strTableTitleColour %>" width="116" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtRegistered %></td>
          <td bgcolor="<% = strTableTitleColour %>" width="41" height="2" class="tHeading" background="<% = strTableTitleBgImage %>" align="center"><% = strTxtPosts %></td>
          <td bgcolor="<% = strTableTitleColour %>" width="59" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtHomepage %></td>
          <% If blnPrivateMessages = True Then %>
          <td bgcolor="<% = strTableTitleColour %>" width="64" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtAddBuddy %></td>
          <% End If %>
          <td bgcolor="<% = strTableTitleColour %>" width="57" height="2" align="center" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSearch %></td>
         </tr><% 
                
          	'Intialise the ADO recordset object
		Set rsModerators = Server.CreateObject("ADODB.Recordset")
          	
		'For....Next Loop to loop through the recorset to display the forum members
		For intRecordLoopCounter = 1 to 25
	
			'If there are no member's records left to display then exit loop
			If rsMembers.EOF Then Exit For
			
			'Initialise varibles 
			dtmLastPostDate = ""
			
			'Read in the profile from the recordset
			lngUserID = CLng(rsMembers("Author_ID"))
			strUsername = rsMembers("Username")
			'strEmail = rsMembers("Author_email")
			'blnShowEmail = CBool(rsMembers("Show_email"))
			strHomepage = rsMembers("Homepage")
			intNumOfPosts = CInt(rsMembers("No_of_posts"))
			dtmRegisteredDate = CDate(rsMembers("Join_date"))
			intStatus = CInt(rsMembers("Status"))
			
			'If the users account is not active make there account level guest
			If CBool(rsMembers("Active")) = False Then intStatus = 0
			
			'Turn the members status number returned from the database into a string value
			Select Case intStatus
				'Guest status
				Case 0
					strStatus = strTxtGuest & "<br><img src=""" & strImagePath & "0_star_rating.gif"" alt=""" & strTxtGuest & """>"  
				'Standard member status
				Case 1
					strStatus = strTxtStandardMember & "<br><img src=""" & strImagePath & "1_star_rating.gif"" alt=""" & strTxtStandardMember & """>" 
				'Super member status
				Case 2
					strStatus = strTxtGoldMember & "<br><img src=""" & strImagePath & "2_star_rating.gif"" alt=""" & strTxtGoldMember & """>" 
				'Power member status
				Case 3
					strStatus = strTxtPlatinumMember & "<br><img src=""" & strImagePath & "3_star_rating.gif"" alt=""" & strTxtPlatinumMember & """>" 
			End select
			
			'Now we need to see if the user is a moderator as if they are they will have edit options
			'Initalise the strSQL variable with an SQL statement to query the database to get the email address of the moderator(s) for this forum
			If strDatabaseType = "SQLServer" Then
				strSQL = "EXECUTE wwfSpModerator @lngUserID = " & lngUserID
			Else
				strSQL = "SELECT TOP 1 tblModerator.Moderator_ID FROM tblModerator "
				strSQL = strSQL & "WHERE tblModerator.Author_ID=" & lngUserID & ";"
			End If
				
			'Query the database
			rsModerators.Open strSQL, strCon
			
			'If theres a record returened then this member is a moderator
			If NOT rsModerators.EOF Then strStatus = strTxtForumModerator & "&nbsp;<img src=""" & strImagePath & "4_star_rating.gif"" alt=""" & strTxtForumModerator & """>" 
		
			'If the user ID is 1 then this is the admin account
			If lngUserID = 1 Then strStatus = strTxtForumAdministrator & "&nbsp;<img src=""" & strImagePath & "5_star_rating.gif"" alt=""" & strTxtForumAdministrator & """>" 
			
			'Write the HTML of the Topic descriptions as hyperlinks to the Topic details and message
			%>
         <tr> 
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="116" height="24"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngUserID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strUsername %></a></td>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="113" height="24" class="text" style="font-size: <% = intSmallFontSize %>px;"><% = strStatus %></td>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="116" height="24" class="text" style="font-size: <% = intSmallFontSize %>px;"><% = DateFormat(dtmRegisteredDate, saryDateTimeData) %></td>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="41" align="center" height="24" class="text"><% = intNumOfPosts %></td>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="59" align="center" height="24" class="text"><% If NOT strHomepage = "" Then Response.Write("<a href=""" & strHomepage & """ target=""_blank""><img src=""" & strImagePath & "home_icon.gif"" border=""0"" alt=""" & strTxtVisit & " " & strUsername & "'s " & strTxtHomepage & """></a>") %></td>
          <% If blnPrivateMessages = True Then %>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="64" align="center" height="24" class="text"><a href="pm_buddy_list.asp?name=<% = Server.URLEncode(strUsername) %>" target="_self"><img src="<% = strImagePath %>add_buddy_sm.gif" align="absmiddle" border="0" alt="<% = strTxtAddToBuddyList %>"></a></td>
          <% End If %>
          <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="57" align="center" height="24"><%
               
            		If Request.QueryString("ReturnPage") = "Search" Then
           
                %><a href="search_form.asp?search=<% = Server.URLEncode(strUsername) %>&searchIn=Author&date=DESC"><img src="<% = strImagePath %>search_sm.gif" border="0" alt="Search for other posts by <% = strUsername %>" align="absmiddle"></a><%
               
            		Else
            
                %><a href="search_form.asp<% = strReturnPageProperties %>&search=<% = Server.URLEncode(strUsername) %>&searchIn=Author&searchSort=dateDESC"><img src="<% = strImagePath %>search_sm.gif" border="0" alt="<% = strTxtSearchForPosts %>&nbsp;<% = strUsername %>" align="absmiddle"></a><%
                
            		End If
            
              %></td>
         </tr><%
		
			'Move to the next record in the database
	   		rsMembers.MoveNext
	   		
	   		'Close the post date recordset
	   		rsModerators.Close
	
		'Loop back round   	
		Next
	End If
	

%>
        </table>
      </tr>
     </table>
     <table width="630" border="0" cellspacing="0" cellpadding="0" align="center" height="32">
      <tr> 
       <%
   'If there is more than 1 page of members then dispaly drop down list to the other members
	If intTotalNumMembersPages > 1 Then   
	
		'Display an drop down list to the other members in list
		Response.Write vbCrLf & "		<td align=""right"" height=""28"" valign=""bottom""><span class=""text"">" & strTxtPage & " "
		Response.Write vbCrLf & "		 <select onChange=""MembersPage(this)"" name=""SelectPage"">"
		
		Dim intTopicPageLoopCounter
		
		'Loop round to display links to all the other pages
		For intTopicPageLoopCounter = 1 to intTotalNumMembersPages 
		
			'Display a link in the link list to the another members page
			Response.Write vbCrLf & "		  <option value=""" & intTopicPageLoopCounter & """"
			
			'If this page number to display is the same as the page being displayed then make sure it's selected
			If intTopicPageLoopCounter = intRecordPositionPageNum Then
				Response.Write " selected"
			End If
			
			'Display the link page number
			Response.Write ">" & intTopicPageLoopCounter & "</option>"
		
		Next
		
		'End the drop down list
		Response.Write vbCrLf & "		</select> " & strTxtOf & " " & intTotalNumMembersPages & "</span></td>"
	End If
%>
      </tr>
     </table>
     <%	
	'Reset Server Variables	
	rsMembers.Close
	Set rsMembers = Nothing
	Set rsModerators = Nothing

End If

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>
     <br>
    </form>
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
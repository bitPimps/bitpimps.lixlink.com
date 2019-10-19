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


'Set the response buffer to true as we maybe redirecting and setting a cookie
Response.Buffer = True 
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<script  language="JavaScript">    	
//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
</script>
<!-- #include file="header.inc" -->
 <br>
   <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="2" align="center">
    <tr> 
     <td class="text" valign="bottom"><% = strTxtWelcome & " " &  strLoggedInUsername %></td>
     <td align="right" height="2"><%
      
'If the user has logged in then the Logged In User ID number will not be 0 and not 2 for the guest account
If NOT lngLoggedInUserID = 0 AND NOT lngLoggedInUserID = 2 Then
	
	'Dispaly a " & strTxtWelcome & " message to the user in the top bar
	Response.Write vbCrLf & "<a href=""profile_edit.asp"" target=""_self""><img src=""" & strImagePath & "edit_profile.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ border=""0"" align=""absmiddle"" alt=""" & strTxtEditProfile & """></a>&nbsp;<a href=""log_off_user.asp"" target=""_self""><img src=""" & strImagePath & "log_off.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogOff & """ border=""0"" align=""absmiddle""></a>"

'Else the user is not logged
Else
    	'Display a " & strTxtWelcome & " guset message with the option to login or register
    	Response.Write vbCrLf & "<a href=""register_form.asp"" target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;<a href=""login_user.asp"" target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a>"
End If
%>
      <a href="active_topics.asp" target="_self"><img src="<% = strImagePath %>active_topics.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtActiveTopics %>"></a> 
      <a href="search_form.asp" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
      <a href="forum_members.asp" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a> 
     </td>
    </tr>
   </table>
   <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="2" align="center">
    <tr> 
     <td width="68%" class="text"><% Response.Write(strTxtTheTimeNowIs & " " & TimeFormat(now(), saryDateTimeData)) %>.<br>
      <%
'If this is not the first time the user has visted the site display the last visit time and date
If Session("dtmLastVisit") < CDate(Request.Cookies("ForumVisit")("LastVist")) Then
   Response.Write(strTxtYouLastVisitedOn & " " & DateFormat(Session("dtmLastVisit"), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(Session("dtmLastVisit"), saryDateTimeData) & ".")
End If      
  %></td>
     <td align="right" width="32%">&nbsp; 
      <!-- #include file="pm_check.inc" -->
     </td>
    </tr>
   </table>
   <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
    <tr> 
     <td> 
      <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center">
       <tr> 
        <td bgcolor="<% = strTableTitleColour %>" width="1%" class="tHeading" background="<% = strTableTitleBgImage %>">&nbsp;</td>
        <td bgcolor="<% = strTableTitleColour %>" width="56%" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtForum %></td>
        <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtTopics %></td>
        <td bgcolor="<% = strTableTitleColour %>" width="7%" align="center" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtPosts %></td>
        <td bgcolor="<% = strTableTitleColour %>" width="29%" class="tHeading" align="center" background="<% = strTableTitleBgImage %>"><% = strTxtLastPost %></td>
       </tr>
       <%

'Dimension variables
Dim rsCategory			'Holds the categories for the forums
Dim rsForum 			'Holds the Recordset for the forum details
Dim rsCount			'Holds the Recordset for the count of Topics
Dim rsThread			'Holds the recordset for the thread details
Dim rsStatistics		'Holds the latest posts from the database
Dim intForumID			'Holds the forum ID number
Dim strCategory			'Holds the category name
Dim intCatID			'Holds the id for the category
Dim strForumName		'Holds the forum name
Dim strForumDiscription		'Holds the forum description
Dim dtmForumStartDate		'Holds the forum start date
Dim lngNumberOfTopics		'Holds the number of topics in a forum
Dim lngNumberOfPosts		'Holds the number of Posts in the forum
Dim lngTotalNumberOfTopics	'Holds the total number of topics in a forum
Dim lngTotalNumberOfPosts	'Holds the total number of Posts in the forum
Dim intNumberofForums		'Holds the number of forums
Dim lngLastEntryMessageID	'Holds the message ID of the last entry
Dim lngLastEntryTopicID		'Holds the topic ID of the last entry
Dim dtmLastEntryDate		'Holds the date of the last entry to the forum
Dim strLastEntryUser		'Holds the the username of the user who made the last entry
Dim lngLastEntryUserID		'Holds the ID number of the last user to make and entry
Dim blnForumLocked		'Set to true if the forum is locked
Dim intForumColourNumber	'Holds the number to calculate the table row colour	


'Initialise variables
lngTotalNumberOfTopics = 0
lngTotalNumberOfPosts = 0 
intNumberofForums = 0
intForumColourNumber = 0


'Craete a recordset to get the forum details
Set rsCategory = Server.CreateObject("ADODB.Recordset")

'Create a record set object to the Threads held in the database
Set rsThread = Server.CreateObject("ADODB.Recordset")

'Read the various categories from the database
'Initalise the strSQL variable with an SQL statement to query the database
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCategoryAll"
Else
	strSQL = "SELECT tblCategory.Cat_name, tblCategory.Cat_ID FROM tblCategory ORDER BY tblCategory.Cat_order ASC;"
End If

'Query the database
rsCategory.Open strSQL, strCon

'Check there are categories to display
If rsCategory.EOF Then
	
	'If there are no categories to display then display the appropriate error message
	Response.Write vbCrLf & "<tr><td bgcolor=""" & strTableColour & """ background="" & strTableBgImage & "" colspan=""5"" class=""text"">" & strTxtNoForums & "</td></tr>"
	
'Else there the are categories so write the HTML to display categories and the forum names and a discription
Else 

	'Create a recordset to get the forum details
	Set rsForum = Server.CreateObject("ADODB.Recordset")
	
	'Create a record set object to the Topics held in the database
	Set rsCount = Server.CreateObject("ADODB.Recordset")


	'Loop round to read in all the categories in the database
	Do While NOT rsCategory.EOF
	
		'Get the category name from the database
		strCategory = rsCategory("Cat_name")
		intCatID = CInt(rsCategory("Cat_ID"))
	
		'Display the category name
		Response.Write vbCrLf & "<tr><td bgcolor=""" & strTableTitleColour2 & """ background=""" & strTableTitleBgImage2 & """ colspan=""5"" class=""tiHeading"">" & strCategory & "</td></tr>"

		'Read the various forums from the database
		'Initalise the strSQL variable with an SQL statement to query the database
		If strDatabaseType = "SQLServer" Then
			strSQL = "EXECUTE wwfSpForumsAllWhereCatIs @intCatID = " & intCatID
		Else
			strSQL = "SELECT tblForum.* FROM tblForum WHERE tblForum.Cat_ID = " & intCatID & " ORDER BY tblForum.Forum_Order ASC;"
		End If
		
		'Query the database
		rsForum.Open strSQL, strCon
		
		'Check there are forum's to display
		If rsForum.EOF Then
		
			'If there are no forum's to display then display the appropriate error message
			Response.Write vbCrLf & "<tr><td bgcolor=""" & strTableColour & """  background="" & strTableBgImage & "" colspan=""5"" class=""text"">" & strTxtNoForums & "</td></tr>"
		
		'Else there the are forum's to write the HTML to display it the forum names and a discription
		Else 	
				
			'Loop round to read in all the forums in the database
			Do While NOT rsForum.EOF
			
				'Get the row number
				intForumColourNumber = intForumColourNumber + 1
			
				'Initialise variables
				lngNumberOfTopics = 0
				lngNumberOfPosts = 0	
				lngLastEntryTopicID = 0
			
				'Read in forum details from the database
				intForumID = CInt(rsForum("Forum_ID"))
				strForumName = rsForum("Forum_name")
				strForumDiscription = rsForum("Forum_description")
				dtmForumStartDate = CDate(rsForum("Date_Started"))
				blnForumLocked = CBool(rsForum("Locked"))
				intMemberSecurityLevel = CInt(rsForum(strMemberStatus))		
				
				'Initilaise variables for the information required for each forum
				dtmLastEntryDate = dtmForumStartDate
				strLastEntryUser = strTxtForumAdministrator
				lngLastEntryUserID = 1		
				
				'Get the number of Topics		
				'Initalise the strSQL variable with an SQL statement to query the database to count the number of topics in the forums
				If strDatabaseType = "SQLServer" Then
					strSQL = "EXECUTE wwfSpForumTopicCount @intForumID = " & intForumID
				Else
					strSQL = "SELECT Count(tblTopic.Forum_ID) AS Topic_Count "
					strSQL = strSQL & "From tblTopic "
					strSQL = strSQL & "WHERE tblTopic.Forum_ID = " & intForumID & " "		
				End If
					
				'Query the database
				rsCount.Open strSQL, strCon		
					
				'Read in the number of Topics
				lngNumberOfTopics = CLng(rsCount("Topic_Count"))
				lngTotalNumberOfTopics = lngTotalNumberOfTopics + CLng(rsCount("Topic_Count"))			
				
				'Close the rs
				rsCount.Close
					
				'Initalise the strSQL variable with an SQL statement to query the database for the date of the last entry and the author for the thread
				If strDatabaseType = "SQLServer" Then
					strSQL = "EXECUTE wwfSpLastForumPostEntry @intForumID = " & intForumID
				Else
					strSQL = "SELECT TOP 1 tblThread.Thread_ID, tblThread.Message_date, tblThread.Topic_ID, tblAuthor.Username, tblAuthor.Author_ID " 
					strSQL = strSQL & "FROM (tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID) INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
					strSQL = strSQL & "WHERE tblTopic.Forum_ID = " & intForumID & " "
					strSQL = strSQL & "ORDER BY tblThread.Message_date DESC;"
				End If	
					
				'Query the database
				rsThread.Open strSQL, strCon
				
					
				'If there are threads for topic then read in the date and author of the last entry
				If NOT rsThread.EOF Then
					
					'Read in the deatils from the recorset
					lngLastEntryMessageID = CLng(rsThread("Thread_ID"))								
					lngLastEntryTopicID = CLng(rsThread("Topic_ID"))
					dtmLastEntryDate = CDate(rsThread("Message_date"))
					strLastEntryUser = rsThread("Username")
					lngLastEntryUserID = CLng(rsThread("Author_ID"))
					
					
					'Get the number of Posts		
					'Initalise the strSQL variable with an SQL statement to query the database to count the number of threads in the forums
					If strDatabaseType = "SQLServer" Then
						strSQL = "EXECUTE wwfSpForumThreadCount @intForumID = " & intForumID
					Else
						strSQL = "SELECT Count(tblThread.Thread_ID) AS Thread_Count "
						strSQL = strSQL & "FROM tblTopic INNER JOIN tblThread ON tblTopic.Topic_ID = tblThread.Topic_ID "
						strSQL = strSQL & "GROUP BY tblTopic.Forum_ID "	
						strSQL = strSQL & "HAVING (((tblTopic.Forum_ID)=" & intForumID & "));"	
					End If
							
					'Query the database
					rsCount.Open strSQL, strCon
					
					'Get the thread count
					lngNumberOfPosts = CLng(rsCount("Thread_Count"))
					lngTotalNumberOfPosts = lngTotalNumberOfPosts + CLng(rsCount("Thread_Count"))	
					
					
					'Reset server variables
					rsCount.Close
				End If
				
				'Reset variables
				rsThread.Close
													
				'Write the HTML of the forum descriptions and hyperlinks to the forums
		%>
       <tr> 
        <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="1%" height="41" class="text"> 
         <%
     				'If the user has no access to a forum diplay a no access icon
     				If intMemberSecurityLevel = 3 AND blnModerator = False AND NOT lngLoggedInUserID = 1 Then
					Response.Write ("  <img src=""" & strImagePath & "forum_no_entry_icon.gif"" alt=""" & strTxtNoAccess & """>") 
				'If the forum requires a password diplay the password icon
				ElseIf NOT rsForum("Password") = "" Then
					Response.Write ("  <img src=""" & strImagePath & "password_required_icon.gif"" alt=""" & strTxtPasswordRequired & """>") 
				'If the forum is read only and has new posts show the locked new posts icon
				ElseIf CDate(Session("dtmLastVisit")) < dtmLastEntryDate AND (CBool(rsForum("Locked")) = True OR intMemberSecurityLevel = 2) AND lngLoggedInUserID > 1 AND blnModerator = False Then
					Response.Write ("  <img src=""" & strImagePath & "locked_new_posts_icon.gif"" alt=""" & strTxtReadOnlyNewReplies & """>") 
				'If the forum is read only show the locked new posts icon
				ElseIf CBool(rsForum("Locked")) = True OR intMemberSecurityLevel = 2 AND lngLoggedInUserID > 1 AND blnModerator = False Then
					Response.Write ("  <img src=""" & strImagePath & "closed_topic_icon.gif"" alt=""" & strTxtReadOnly & """>")
				'If the forum has new posts show the new posts icon
				ElseIf CDate(Session("dtmLastVisit")) < dtmLastEntryDate Then
					Response.Write ("  <img src=""" & strImagePath & "new_posts_icon.gif"" alt=""" & strTxtOpenForumNewReplies & """>") 
				'If the forum is open but with no new replies
				Else
					Response.Write ("  <img src=""" & strImagePath & "no_new_posts_icon.gif"" alt=""" & strTxtOpenForum & """>")
				
				End If
     %>
        </td>
        <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="56%" height="41" class="text"> 
         <% 
      
		     
				'If the forum is locked and the user is admin let them unlock it
				If blnForumLocked = True AND lngLoggedInUserID = 1 Then 
				  	Response.Write ("	<a href=""lock_forum.asp?mode=UnLock&ForumID=" & intForumID & """ OnClick=""return confirm('" & strTxtUnLockForumAlert & "')""><img src=""" & strImagePath & "forum_locked_icon.gif"" border=""0"" align=""baseline"" alt=""" & strTxtUnForumLocked & """></a>")
				'If the forum is not locked and this is the admin then let them lock it
				ElseIf blnForumLocked = False AND lngLoggedInUserID = 1 Then 
				  	Response.Write ("	<a href=""lock_forum.asp?mode=Lock&ForumID=" & intForumID & """ OnClick=""return confirm('" & strTxtLockForumAlert & "')""><img src=""" & strImagePath & "forum_unlock_icon.gif"" border=""0"" align=""baseline"" alt=""" & strTxtLockForum & """></a>")
				End If
            
      %>
         <a href="display_forum_topics.asp?ForumID=<% = intForumID %>" target="_self"><% = strForumName %></a><br><% = strForumDiscription %></td>
        <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" height="41" class="text"> 
         <% If lngNumberOfTopics > 0 Then 
		            		Response.Write(lngNumberOfTopics) 
		            	Else 
		            		Response.Write("&nbsp;") 
		            	End If
            	%>
        </td>
        <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="7%" align="center" height="41" class="text"> 
         <% 	If lngNumberOfPosts > 0 Then 
		            		Response.Write(lngNumberOfPosts) 
		            	Else 
		            		Response.Write("&nbsp;")  
		            	End If
            	%>
        </td>
        <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="29%" height="41" class="text" align="right"><% = DateFormat(dtmLastEntryDate, saryDateTimeData) & "&nbsp;" &  strTxtAt & "&nbsp;" & TimeFormat(dtmLastEntryDate, saryDateTimeData) %>
         <br><% = strTxtBy %>&nbsp;<a href="JavaScript:openWin('pop_up_profile.asp?ForumID=<% = intForumID %>&profile=<% = lngLastEntryUserID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strLastEntryUser %></a> <a href="display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngLastEntryTopicID %>&get=last#<% = lngLastEntryMessageID %>" target="_self"><img src="<% = strImagePath %>right_arrow.gif" align="absmiddle" border="0" alt="<% = strTxtViewLastPost %>"></a></td>
       </tr>
       <%
				'Count the number of forums
				intNumberofForums = intNumberofForums + 1
				
				'Move to the next database record
				rsForum.MoveNext	
			'Loop back round for next forum
			Loop
		End If
		
		'Close recordsets
		rsForum.Close
	
		'Move to the next database record
		rsCategory.MoveNext
	'Loop back round for next category
	Loop
End If

'Release server variables
rsCategory.Close
Set rsCategory = Nothing
Set rsForum = Nothing 
Set rsCount = Nothing
Set rsThread = Nothing
%>
      </table>
     </td>
    </tr>
   </table>
   <br>
   <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
     <td width="49%" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>">
       <tr> 
        <td> 
         <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr> 
           <td bgcolor="<% = strTableTitleColour %>" width="56%" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtLatestForumPosts %></td>
          </tr>
          <tr> 
           <td width="49%" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text" height="95" valign="top"> 
            <%
'Get the latest forum posts
'Intialise the ADO recordset object
Set rsStatistics = Server.CreateObject("ADODB.Recordset")

'Cursor type to one to count
rsStatistics.CursorType = 1
	
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT Top 6 tblTopic.Forum_ID, tblTopic.Topic_ID, tblTopic.Subject, tblForum.Password, tblForum." & strMemberStatus & " "
strSQL = strSQL & "FROM tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID "
strSQL = strSQL & "WHERE ((tblForum.Password) Is Null) "
'As long as the user is not the admin don't display a post unless they have permission to view it
If lngLoggedInUserID <> 1 Then
	strSQL = strSQL & " AND (tblForum." & strMemberStatus & " < 3) "
End If
strSQL = strSQL & "ORDER BY tblTopic.Last_entry_date DESC;"
		
'Query the database
rsStatistics.Open strSQL, strCon

'If EOF then display an error message
If rsStatistics.EOF Then Response.Write "<span class=""text"">" & strTxtNoForumPostMade & "</span>" 
	
'If there are pages to display then display them
Do while NOT rsStatistics.EOF
	
	%>
            <a href="display_topic_threads.asp?ForumID=<% = rsStatistics("Forum_ID") %>&TopicID=<% = rsStatistics("Topic_ID") %>&PagePosition=1" target="_self"><% = rsStatistics("Subject") %></a><br>
            <%
	rsStatistics.MoveNext
Loop

'Close the recordset
rsStatistics.Close
%>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
     <td width="1%">&nbsp;</td>
     <td width="50%" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>">
       <tr> 
        <td> 
         <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr> 
           <td bgcolor="<% = strTableTitleColour %>" width="44%" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtForumStatistics %></td>
          </tr>
          <%
'Get the date and author of the last post			
'Initalise the strSQL variable with an SQL statement to query the database for the date of the last entry and the author for the thread
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpLastAllForumsAuthorAndDate"
Else
	strSQL = "SELECT TOP 1 tblThread.Message_date, tblAuthor.Username, tblAuthor.Author_ID " 
	strSQL = strSQL & "FROM (tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID) INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
	strSQL = strSQL & "ORDER BY tblThread.Message_date DESC;"	
End If	
					
'Query the database
rsStatistics.Open strSQL, strCon
	
'If there are records returned by the database then get there details
If NOT rsStatistics.EOF Then
	dtmLastEntryDate = CDate(rsStatistics("Message_date"))
	strLastEntryUser = rsStatistics("Username")	
	lngLastEntryUserID = CLng(rsStatistics("Author_ID"))
End If	
%>
          <tr> 
           <td width="44%" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text" height="95" valign="top"> 
            <%
                
Response.Write(vbCrLf & "		" & strTxtThereAre & "&nbsp;" & lngTotalNumberOfPosts & "&nbsp;" & strTxtPostsIn & "&nbsp;" & lngTotalNumberOfTopics & "&nbsp;" & strTxtTopicsIn & "&nbsp;" & intNumberofForums & "&nbsp;" & strTxtForum)
Response.Write(vbCrLf & "		<br>" & strTxtLastPostOn & "&nbsp;" & DateFormat(dtmLastEntryDate, saryDateTimeData) & "&nbsp;" & strTxtAt & "&nbsp;" & TimeFormat(dtmLastEntryDate, saryDateTimeData))
Response.Write(vbCrLf & "		<br>" & strTxtLastPostBy & "&nbsp;<a href=""JavaScript:openWin('pop_up_profile.asp?profile=" & lngLastEntryUserID & "','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"">" & strLastEntryUser & "</a>")                  
                  
'Close the recordset
rsStatistics.Close
                 

'Get the last signed up user	
'Initalise the strSQL variable with an SQL statement to query the database
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpAuthorDesc"
Else
	strSQL = "SELECT tblAuthor.Username, tblAuthor.Author_ID "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "ORDER BY tblAuthor.Author_ID DESC;"
End If

'Query the database
rsStatistics.Open strSQL, strCon

'Display some statistics for the members
If NOT rsStatistics.EOF Then

Response.Write(vbCrLf & "		<br>" & strTxtThereAre & "&nbsp;" & rsStatistics.RecordCount & "&nbsp;" & strTxtForumMembers) 
Response.Write(vbCrLf & "		<br>" & strTxtTheNewestForumMember & "&nbsp;<a href=""JavaScript:openWin('pop_up_profile.asp?profile=" & rsStatistics("Author_ID") & "','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"">" & rsStatistics("Username") & "</a>")


End If

'Close the recordset
rsStatistics.Close


'Get the number of active users
'Initialise the SQL variable with an SQL statement count the number of records
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCountOfActiveUsers"
Else
	strSQL = "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser;"
End If

'Query the database
rsStatistics.Open strSQL, strCon

'Read in the active users from the recordset
intActiveUsers = CInt(rsStatistics("ActiveUser"))

'Close the recordset
rsStatistics.Close


'Get the number of active guests
'Initialise the SQL variable with an SQL statement count the number of records
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCountOfActiveGuests"
Else
	strSQL = "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser WHERE tblActiveUser.Author_ID=2;"
End If

'Query the database
rsStatistics.Open strSQL, strCon

'Read in the active guests from the recordset
intActiveGuests = CInt(rsStatistics("ActiveUser"))

'To save another database hit we can get the number of members online by taking the number of guest away from the total active users
intActiveMembers = intActiveUsers - intActiveGuests

'Close the recordset
rsStatistics.Close
Set rsStatistics = Nothing

  
Response.Write(vbCrLf & "		<br>" & strTxtThereAre & "&nbsp;" & intActiveUsers & "&nbsp;<a href=""active_users.asp"" target=""_self"">" & strTxtActiveUsers & "</a>,&nbsp;" & intActiveGuests & "&nbsp;" & strTxtGuestsAnd & "&nbsp;" & intActiveMembers & "&nbsp;" & strTxtMembers & "</span>")
            %>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
   <%
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>
   <a href="http://www.webwizguide.info"></a> 
   <div align="center"><br>
    <table width="533" border="0" cellspacing="0" cellpadding="2">
     <tr> 
      <td width="202" class="text"><img src="<% = strImagePath %>no_new_posts_icon.gif" alt="<% = strTxtOpenForum %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtOpenForum %></span></td>
      <td width="186" class="text"><img src="<% = strImagePath %>closed_topic_icon.gif" alt="<% = strTxtReadOnly %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtReadOnly %></span></td>
      <td width="133" class="text"><img src="<% = strImagePath %>password_required_icon.gif" alt="<% = strTxtPasswordRequired %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtPasswordRequired %></span></td>
     </tr>
     <tr> 
      <td width="202" class="text"><img src="<% = strImagePath %>new_posts_icon.gif" alt="<% = strTxtOpenForumNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtOpenForumNewReplies %></span></td>
      <td width="186" class="text"><img src="<% = strImagePath %>locked_new_posts_icon.gif" alt="<% = strTxtReadOnlyNewReplies %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtReadOnlyNewReplies %></span></td>
      <td width="133" class="text"><img src="<% = strImagePath %>forum_no_entry_icon.gif" alt="<% = strTxtNoAccess %>"> <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtNoAccess %></span></td>
     </tr>
    </table>
    <br>
    <span class="text" style="font-size: <% = intSmallFontSize %>px;"><a href="mark_posts_as_read.asp" target="_self" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtMarkAllPostsAsRead %></a> :: <a href="remove_cookies.asp" target="_self" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtDeleteCookiesSetByThisForum %></a></span><br>
    <br>
    <span class="text"><% = strTxtCookies %></span><br>
    <br>
 <% 
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	If blnTextLinks = True Then 
		Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums</a> version 6.34</span>")
	Else
  		Response.Write("<a href=""http://www.webwizforums.com"" target=""_blank""><img src=""" & strImagePath & "web_wiz_guide.gif"" border=""0"" alt=""Powered by Web Wiz Forums version 6.34""></a>")
	End If
	
	Response.Write("<br><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2002 <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Guide</a></span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
   </div>
   <!-- #include file="footer.inc" -->
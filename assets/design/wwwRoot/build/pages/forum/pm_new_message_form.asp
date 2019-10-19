<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="date_time_functions.inc" -->
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

'Set the buffer to true
Response.Buffer = True

'Declare variables
Dim strMode 			'Holds the mode of the page
Dim rsBuddyList			'Recordset holding the buddy list
Dim rsReplyPM			'Holds the reply to pm
Dim strPostPage 		'Holds the page the form is posted to
Dim lngMessageID		'Holds the pm id
Dim strTopicSubject		'Holds the subject
Dim strBuddyName		'Holds the to username
Dim dtmReplyPMDate		'Holds the reply pm date

'Set the mode of the page
strMode = "PM"



'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")

'If there is a person who to send to then read in there name
strBuddyName = Request.QueryString("name")

'If edit read in the detials
If Request.QueryString("code") = "edit" Then
	'Read in the details of the message to be edited
	strTopicSubject = Session("Subject")
	strMessage = Session("PmMessage")
End If

'If this is a reply to a pm then get the details from the db
If Request.QueryString("code") = "reply" Then
	
	'Read in the pm mesage number to reply to
	lngMessageID = CLng(Request.QueryString("pm"))

	'Get the pm from the database
	'Create a record set object to the Threads held in the database
	Set rsReplyPM = Server.CreateObject("ADODB.Recordset")
	
	'Initlise the sql statement
	strSQL = "SELECT tblPMMessage.*, tblAuthor.Username "
	strSQL = strSQL & "FROM tblAuthor INNER JOIN tblPMMessage ON tblAuthor.Author_ID = tblPMMessage.From_ID "
	strSQL = strSQL & "WHERE tblPMMessage.PM_ID=" & lngMessageID & " AND tblPMMessage.Author_ID=" & lngLoggedInUserID & ";"
	
	'Query the database
	rsReplyPM.Open strSQL, strCon 
	
	'Read in the date of the reply pm
	dtmReplyPMDate = CDate(rsReplyPM("PM_Message_Date"))
	
	'Read in the username to be the pm is a reply to
	strBuddyName = rsReplyPM("Username")
	
	'Set up the pm title
	strTopicSubject = Replace(rsReplyPM("PM_Tittle"), "RE: ", "")
	strTopicSubject = "RE: " & strTopicSubject
	
	'Build up the reply pm
	strMessage = "-- " & strTxtPreviousPrivateMessage & " --"
	strMessage = strMessage & "<br>[B]" & strTxtSentBy & " :[/B] " & strBuddyName 
	strMessage = strMessage & "<br>[B]" & strTxtSent & " :[/B] " & DateFormat(dtmReplyPMDate, saryDateTimeData) & " at " & TimeFormat(dtmReplyPMDate, saryDateTimeData) & "<br><br>"
	
	'Read in the pm from the recordset
	strMessage = strMessage & rsReplyPM("PM_Message")
		
%>
<!--#include file="edit_post.inc" -->
<%
	'Place a couple of carridge returns infront of the reply pm
	strMessage = vbCrLf & vbCrLf & vbCrLf & strMessage
	
	'Close recordset
	rsReplyPM.Close
	Set rsReplyPM = Nothing
End If
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger : Send New Message</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";
	
	//Check for a subject
	if ((document.frmAddMessage.member.value=="") && (document.frmAddMessage.selectMember.value=="")){
		errorMsg += "\n\t<% = strTxtNoToUsernameErrorMsg %>";
	}

	//Check for a subject
	if (document.frmAddMessage.subject.value==""){
		errorMsg += "\n\t<% = strTxtNoPMSubjectErrorMsg %>";
	}
	
	//Check for message
	if (document.frmAddMessage.message.value==""){
		errorMsg += "\n\t<% = strTxtNoPMErrorMsg %>";
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
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td class="text"><% = strTxtWelcome & " " &  strLoggedInUsername %></td>
  <td align="right"> 
   <a href="profile_edit.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>edit_profile.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtEditProfile %>"></a>
   <a href="log_off_user.asp" target="_self"><img src="<% = strImagePath %>log_off.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtLogOff %>" border="0" align="absmiddle"></a>
   <a href="search_form.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
   <a href="forum_members.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a> 
  </td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="63%" > <img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="37%" >&nbsp;<!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="60%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger & ": " & strTxtSendNewMessage %></span></td>
  <td align="right" width="40%"> <a href="pm_inbox.asp" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
</table>
<%

'See if the users browser is Internet Explorer and not the Mac version
If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE", 1) > 0 AND InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MAC", 1) = 0 AND InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "Opera", 1) = 0 AND blnIEEditor = True Then
	
	'See if the users version on Internet Explorer is 5 or above
	If Trim(Mid(Request.ServerVariables("HTTP_USER_AGENT"), CInt(inStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE", 1)+5), 1)) => 5 Then
		
		'Open the message form for Internet Explorer users 5 and above
		%>
<!--#include file="IE_message_form.inc" -->
<%
	Else
		'Open up the mesage form for IE 4 and below users
		%>
<!--#include file="message_form.inc" -->
<%
	End If
'Open up the massge form for all other browser users
Else
	%>
<!--#include file="message_form.inc" -->
<%
End If

'Reset server variables
Set adoCon = Nothing
Set strCon = Nothing 
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
<!-- #include file="footer.inc" -->
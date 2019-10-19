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

'Set the buffer to true
Response.Buffer = True

'Declare variables
Dim rsPmMessage		'db recordset holding any new pm's since last vist
Dim intNumOfNewPM	'Hols the number of new pm's

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")


'Intialise the ADO recordset object
Set rsPmMessage = Server.CreateObject("ADODB.Recordset")
			
'Initlise the sql statement
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCountOfPMs @lngLoggedInUserID = " & lngLoggedInUserID
Else
	strSQL = "SELECT Count(tblPMMessage.PM_ID) AS CountOfPM FROM tblPMMessage "
	strSQL = strSQL & "WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID = " & lngLoggedInUserID & ";"
End If
	
'Query the database
rsPmMessage.Open strSQL, strCon


'Get the number of new pm's this user has
intNumOfNewPM = CInt(rsPmMessage("CountOfPM"))

'Close the recordset
rsPmMessage.Close

'Now get the date of the last PM
strSQL = "SELECT TOP 1 tblPMMessage.PM_Message_Date, tblAuthor.Username "
strSQL = strSQL & "FROM tblAuthor INNER JOIN tblPMMessage ON tblAuthor.Author_ID = tblPMMessage.From_ID "
strSQL = strSQL & "WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID = " & lngLoggedInUserID & " "
strSQL = strSQL & "ORDER BY tblPMMessage.PM_Message_Date DESC;"
		
'Query the database
rsPmMessage.Open strSQL, strCon
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger : Welcome</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
     	
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to jump to another forum
function ForumJump(URL) {
	
	if (URL.options[URL.selectedIndex].value != "") self.location.href = URL.options[URL.selectedIndex].value;	
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
  <td align="left" width="64%" ><img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="36%" ><%
'If there are pm's display new pm icon and how many
If NOT rsPmMessage.EOF Then
	Response.Write("<img src=""" & strImagePath & "unread_private_message.gif"" alt=" & strTxtUnreadMessage & "> <a href=""pm_welcome.asp"" target=""_self"" style=""font-size: " & intSmallFontSize & "px;"">" & strTxtPrivateMessenger & "</a><span class=""text"" style=""font-size: " & intSmallFontSize & "px;""> (" & intNumOfNewPM & " " & strTxtNew & ")</span>")
Else
	Response.Write("<img src=""" & strImagePath & "e-mail_topic.gif"" align=""middle"" alt=" & strTxtReadMessage & "> <a href=""pm_welcome.asp"" target=""_self"" style=""font-size: " & intSmallFontSize & "px;"">" & strTxtPrivateMessenger & "</a>")
End If
         %></tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="60%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger & ": " & strTxtWelcome %></span></td>
  <td align="right" width="40%"> <a href="pm_inbox.asp" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <tr> 
     <td bgcolor="<% = strTableTitleColour %>" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtWelcome & " " & strLoggedInUsername & " " & strTxtToYourPrivateMessenger %></td>
    </tr>
    <tr> 
     <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text">
      <table width="100%" border="0" cellspacing="0" cellpadding="2" class="text">
       <tr> 
        <td class="text"><% = strTxtPmIntroduction %></td>
       </tr>
       <tr> 
        <td>&nbsp;</td>
       </tr>
       <tr> 
        <td><span class="tiHeading"><% = strTxtInboxStatus %><br>
         </span> 
         <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
           <td width="3%"><%
'If there are pm's display full inbox icon
If NOT rsPmMessage.EOF Then
	Response.Write("<img src=""" & strImagePath & "inbox_full.gif"">")
Else
	Response.Write("<img src=""" & strImagePath & "inbox_empty.gif"">")
End If
         %></td>
           <td width="97%" class="text"><%
'If there are pm's display the last pm details
If NOT rsPmMessage.EOF Then
	Response.Write("<span class=""bold"">" & strTxtYouHave & " " & intNumOfNewPM & " " & strTxtNewMsgsInYourInbox & "</span> <a href=""pm_inbox.asp"" target=""_self"">" & strTxtGoToYourInbox & "</a>.<br>")
	Response.Write(strTxtYourLatestPrivateMessageIsFrom & " " & rsPmMessage("Username") & " " & strTxtSentOn & " " & DateFormat(rsPmMessage("PM_Message_Date"), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(rsPmMessage("PM_Message_Date"), saryDateTimeData) & "<br>")
Else	
	Response.Write(strTxtNoNewMsgsInYourInbox & " <a href=""pm_inbox.asp"" target=""_self"">" & strTxtGoToYourInbox & "</a>")
End If
         %></td>
         </tr>
         </table>
        </td>
       </tr>
       <tr>
        <td>&nbsp;</td>
       </tr>
       <tr> 
        <td><span class="tiHeading"><% = strTxtPrivateMessengerOverview %></span></td>
       </tr>
       <tr> 
        <td class="text"><span class="bold"><% = strTxtInbox %>: </span><% = strTxtInboxOverview %></td>
       </tr>
       <tr> 
        <td class="text"><span class="bold"><% = strTxtBuddyList %>: </span><% = strTxtBuddyListOverview %></td>
       </tr>
       <tr> 
        <td class="text"><span class="bold"><% = strTxtNewPrivateMessage %>:</span> <% = strTxtNewMsgOverview %></td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr>
  <form>
   <td>
    <!-- #include file="forum_jump.inc" -->
   </td>
  </form>
 </tr>
</table>
<div align="center"><br>
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
'Clean up
rsPmMessage.Close
Set rsPmMessage = Nothing
Set adoCon = Nothing
Set strCon = Nothing 
%>

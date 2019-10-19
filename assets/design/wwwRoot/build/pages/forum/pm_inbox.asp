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
Dim rsPmMessage			'ADO recordset object holding the users private messages
Dim intRecordPositionPageNum	'Holds the recorset page number to show the other pm message
Dim intTotalNumOfPages		'Holds the total number of pages in the recordset
Dim intRecordLoopCounter	'Holds the loop counter numeber
Dim intTopicPageLoopCounter	'Holds the number of pages there are of pm messages
Dim intNumOfPMs			'Holds the number of private messages the user has

'Initilise varaibles
intNumOfPMs = 0

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")


'If this is the first time the page is displayed then the pm message record position is set to page 1
If Request.QueryString("PagePosition") = 0 Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the pm message record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("PagePosition"))
End If	


'Intialise the ADO recordset object
Set rsPmMessage = Server.CreateObject("ADODB.Recordset")
	
'Initlise the sql statement
strSQL = "SELECT tblPMMessage.*, tblAuthor.Username "
strSQL = strSQL & "FROM tblAuthor INNER JOIN tblPMMessage ON tblAuthor.Author_ID = tblPMMessage.From_ID "
strSQL = strSQL & "WHERE tblPMMessage.Author_ID=" & lngLoggedInUserID & " "
strSQL = strSQL & "ORDER BY tblPMMessage.PM_Message_Date DESC;"
	
'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
rsPmMessage.CursorType = 1

'Query the database
rsPmMessage.Open strSQL, strCon

'Set the number of records to display on each page
rsPmMessage.PageSize = 10

'Get the record poistion to display from
If NOT rsPmMessage.EOF Then rsPmMessage.AbsolutePage = intRecordPositionPageNum

'If there are no records on this page and it's above the frist page then set the page position to 1
If rsPmMessage.EOF AND intRecordPositionPageNum > 1 Then Response.Redirect "pm_inbox.asp?PagePosition=1"

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger: Inbox</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to jump to another forum
function ForumJump(URL) {
	
	if (URL.options[URL.selectedIndex].value != "") self.location.href = URL.options[URL.selectedIndex].value;	
	return true;
}

//Funtion to check or uncheck all the dete boxes
function checkAll(){
	
	for (i=0; i < document.frmDelete.chkDelete.length; i++){
		document.frmDelete.chkDelete[i].checked = document.frmDelete.chkAll.checked;
	}
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
  <td align="left" width="64%"><img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="36%" >&nbsp;<!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr><form name="frmDelete" method="post" action="pm_delete_message.asp?Page=<% = intRecordPositionPageNum %>" OnSubmit="return confirm('<% = strTxtDeletePrivateMessageAlert %>')">
 <td>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="60%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger & ": " & strTxtInbox %></span></td>
  <td align="right" width="40%"> <a href="pm_inbox.asp" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <tr> 
     <td bgcolor="<% = strTableTitleColour %>" width="3%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>" align="center"><% = strTxtRead %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="39%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtMessageTitle %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="22%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtMessageFrom %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="31%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtDate %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="5%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>">
          <input type="checkbox" name="chkAll" value="" onClick="checkAll();">
         </td>
    </tr><%
    
'Check there are PM messages to display
If rsPmMessage.EOF Then

	'If there are no pm messages to display then display the appropriate error message
	Response.Write vbCrLf & "<td bgcolor=""" & strTableColour & """ background=""" & strTableBgImage & """ colspan=""5"" class=""text"">" & strTxtNoPrivateMessages & "<input type=""hidden"" name=""chkDelete"" value=""-1""></td>"

'Else there the are topic's so write the HTML to display the topic names and a discription
Else 
	'Get the total number of pm's this user has
	intNumOfPMs = rsPmMessage.RecordCount
	
	'Count the number of pages there are in the recordset calculated by the PageSize attribute set above
	intTotalNumOfPages = rsPmMessage.PageCount

	
	'Loop round to read in all the Topics in the database
	For intRecordLoopCounter = 1 to 10 
	
		'Exit loop if run out of records
		If rsPmMessage.EOF Then Exit For
	%>
    <tr> 
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="3%" class="text" align="center"><% 
      
     		If CBool(rsPmMessage("Read_Post")) = False Then
     			Response.Write("<img src=""" & strImagePath & "unread_private_message.gif"" alt=""" & strTxtUnreadMessage & """>")
     		Else
     			Response.Write("<img src=""" & strImagePath & "read_private_message.gif"" alt=""" & strTxtReadMessage & """>")
     		End If
     
     %>
     </td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="39%" class="text"><% Response.Write("<a href=""pm_show_message.asp?ID=" & rsPmMessage("PM_ID") & "&Page=" & intRecordPositionPageNum & """ target=""_self"">" & rsPmMessage("PM_Tittle") & "</a>") %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="22%" class="text"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = rsPmMessage("From_ID") %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = rsPmMessage("Username") %></a></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="31%" class="text"><% Response.Write(DateFormat(rsPmMessage("PM_Message_Date"), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(rsPmMessage("PM_Message_Date"), saryDateTimeData)) %></td>
     <td bgcolor="<% If (intRecordLoopCounter MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="5%" class="text" align="center"><input type="checkbox" name="chkDelete" value="<% = rsPmMessage("PM_ID") %>"></td>
    </tr><%
		
		'Move to the next recordset
		rsPmMessage.MoveNext
	Next
End If
%>
   </table>
  </td>
 </tr>
</table>
    <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="2" align="center">
     <tr>
      <td width="94%" class="text"><% Response.Write(strLoggedInUsername & ", " & strTxtYouHave & " " & intNumOfPMs & " " & strTxtPrivateMessagesYouCanReceiveAnother & " " & (intNumPrivateMessages-intNumOfPMs) & " " & strTxtOutOf & " " & intNumPrivateMessages) %></td>
      <td width="6%" align="right">
       <input type="submit" name="Submit" value="<% = strTxtDelete %>">
      </td>
     </tr>
    </table>
    <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="2" align="center">
     <tr> 
      <td class="text"><img src="<% = strImagePath %>unread_private_message.gif" alt="<% = strTxtUnreadMessage %>"> <% = strTxtUnreadMessage %>&nbsp;&nbsp;<img src="<% = strImagePath %>read_private_message.gif" alt="<% = strTxtReadMessage %>"> <% = strTxtReadMessage %></td>
      <%

'If there is more than 1 page of topics then dispaly drop down list to the other topics
If intTotalNumOfPages > 1 Then   

	'Display an image link to the last topic
	Response.Write vbCrLf & "		<td align=""right""><span class=""text"">" & strTxtPage
	Response.Write vbCrLf & "		 <select onChange=""ForumJump(this)"" name=""SelectTopicPage"">"
	
	'Loop round to display links to all the other pages
	For intTopicPageLoopCounter = 1 to intTotalNumOfPages  
	
		'Display a link in the link list to the another topic page
		Response.Write vbCrLf & "		  <option value=""pm_inbox.asp?PagePosition=" & intTopicPageLoopCounter & """"
		
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
</td>
</form></tr>
</table>
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
  <tr><form>
   <td><!-- #include file="forum_jump.inc" --></td>
   </form>
  </tr>
 </table>
<div align="center"><br>
 <%
'Clear server objects
rsPmMessage.Close
Set rsPmMessage = Nothing
Set adoCon = Nothing
Set strCon = Nothing 

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
 <!-- #include file="footer.inc" -->
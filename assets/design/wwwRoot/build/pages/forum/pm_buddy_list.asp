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
Dim rsBuddyList			'ADO recordset object holding the users private messages
Dim intForumColourNumber	'Holds the number to calculate the table row colour	

intForumColourNumber = 0

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")



'Get the users buddy detals from the db
'Intialise the ADO recordset object
Set rsBuddyList = Server.CreateObject("ADODB.Recordset")
	
'Initlise the sql statement
strSQL = "SELECT tblBuddyList.*, tblAuthor.Username, tblAuthor.Author_ID "
strSQL = strSQL & "FROM tblAuthor INNER JOIN tblBuddyList ON tblAuthor.Author_ID = tblBuddyList.Buddy_ID "
strSQL = strSQL & "WHERE tblBuddyList.Author_ID=" & lngLoggedInUserID & " AND tblBuddyList.Buddy_ID <> 2 "
strSQL = strSQL & "ORDER BY tblAuthor.Username ASC;"
	

'Query the database
rsBuddyList.Open strSQL, strCon
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger: Buddy List</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";
	
	//Check for a subject
	if (document.frmBuddy.username.value==""){
		errorMsg += "\n\t<% = strTxtNoBuddyErrorMsg %>";
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
  <td align="left" width="61%" > <img src="<% = strImagePath %>folder_icon.gif" width="15" height="15" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif" width="20" height="20">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif" width="15" height="15">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="39%" >&nbsp;<!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="60%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" width="26" height="26" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger & ": " & strTxtBuddyList %></span></td>
  <td align="right" width="40%"> <a href="pm_inbox.asp" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <tr> 
     <td bgcolor="<% = strTableTitleColour %>" width="19%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtBuddy %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="40%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtDescription %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="35%" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtContactStatus %></td>
     <td bgcolor="<% = strTableTitleColour %>" width="6%" align="center" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtDelete %></td>
    </tr>
    <%
    
'Check there are PM messages to display
If rsBuddyList.EOF Then

	'If there are no pm messages to display then display the appropriate error message
	Response.Write vbCrLf & "<td bgcolor=""" & strTableColour & """ background=""" & strTableBgImage & """ colspan=""5"" class=""text"">" & strTxtNoBuddysInList & "</td>"

'Else there the are topic's so write the HTML to display the topic names and a discription
Else 	
	'Loop round to read in all the Topics in the database
	Do WHILE NOT  rsBuddyList.EOF 
	
		'Get the row number
		intForumColourNumber = intForumColourNumber + 1
	%>
    <tr> 
     <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="19%" class="text"><a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = rsBuddyList("Buddy_ID") %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = rsBuddyList("Username") %></a></td>
     <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="40%" class="text"><% = rsBuddyList("Description") %>&nbsp;</td>
     <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="35%" class="text"> 
      <%
     		'Get the contact status
     		If rsBuddyList("Block") = True Then
     			Response.Write(strTxtThisPersonCanNotMessageYou)
     		Else
     			Response.Write(strTxtThisPersonCanMessageYou)
     		End If
     %>
     </td>
     <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="6%" class="text" align="center"><a href="pm_delete_buddy.asp?pm_id=<% = rsBuddyList("Address_ID") %>" OnClick="return confirm('<% = strTxtDeleteBuddyAlert %>')"><img src="<% = strImagePath %>delete_icon.gif" width="15" height="16" alt="<% = strTxtDelete %>" border="0"></a></td>
    </tr>
    <%
		
		'Move to the next recordset
		rsBuddyList.MoveNext
	Loop
End If
%>
   </table>
  </td>
 </tr>
</table>
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr><form method="post" name="frmBuddy" action="pm_add_buddy.asp" onSubmit="return CheckForm();" onReset="return ResetForm();"> 
  <td> 
   <table width="100%" border="0" cellspacing="1" cellpadding="2" height="14" bgcolor="<% = strTableBorderColour %>">
    <tr>
     <td bgcolor="<% = strTableTitleColour %>" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtAddNewBuddyToList %></td>
    </tr>
    <tr> 
     <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td width="23%" class="text"><% = strTxtMemberName %></td>
        <td width="32%" class="text"><% = strTxtDescription %></td>
        <td width="24%" class="text"><% = strTxtAllowThisMemberTo %></td>
        <td width="21%" class="text">&nbsp;</td>
       </tr>
       <tr>
        <td width="23%"> 
         <input type="text" name="username" size="15" maxlength="15" value="<% If CInt(Request.QueryString("code")) <> 2 Then Response.Write(Request.QueryString("name")) %>">
        </td>
        <td width="32%"> 
         <input type="text" name="description" size="25" maxlength="30" value="<% If CInt(Request.QueryString("code")) <> 2 Then Response.Write(Request.QueryString("desc")) %>">
        </td>
        <td width="24%"> 
         <select name="blocked">
          <option value="False" selected><% = strTxtMessageMe %></option>
          <option value="True"><% = strTxtNotMessageMe %></option>
         </select>
        </td>
        <td width="21%" align="right"><input type="submit" name="Submit" value="<% = strTxtAddToBuddy %>"></td>
       </tr>
      </table>
     </td>
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
rsBuddyList.Close
Set rsBuddyList = Nothing
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
 <br>
</div>
<%
'Display a msg letting the user know any add or delete details to the buddy list
Select Case Session("msg")
	Case "exsistBuddy"
		Response.Write("<script  language=""JavaScript"">")
		Response.Write("alert('" & Replace(Request.QueryString("name"), "'", "\'", 1, -1, 1) & " " & strTxtIsAlreadyInYourBuddyList & ".');")
		Response.Write("</script>")
		Session("msg") = ""
	Case "noBuddy"
		Response.Write("<script  language=""JavaScript"">")
		Response.Write("alert('" & Replace(Request.QueryString("name"), "'", "\'", 1, -1, 1) & ", " & strTxtUserCanNotBeFoundInDatabase & ".');")
		Response.Write("</script>")
		Session("msg") = ""
End Select
%>
<!-- #include file="footer.inc" -->
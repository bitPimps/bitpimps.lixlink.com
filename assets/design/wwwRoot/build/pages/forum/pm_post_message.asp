<% Option Explicit %>
<!--#include file="common.asp" -->
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

'Set the buffer to true
Response.Buffer = True

'Declare variables
Dim rsSendPM		'Db recordset to save the pm to the database
Dim rsCheckUser		'Db recordset to get check username exsists
Dim rsCheckNumPM	'DB recordset to check the to user has not exceeded there max pm's
Dim rsBlockedCheck	'Db rs to check the  user is not blocked from mailing this person
Dim rsSavePM		'Db recordset to save the pm
Dim rsSmut		'Database recordset holding any swear words
Dim strToUsername	'Holds the username the pm message is sent to
Dim lngToUserID		'Holds author id of the person who the pm is for
Dim strSubject		'Holds the subject of the pm
Dim strMessage		'Holds the pm
Dim blnReadEmailNotify	'Holds if the user is to be notified when the message is read
Dim blnToUsernameOK	'Set to false if the to username is not found
Dim blnMaxPMsOK		'Set to false if the max number of private messages is exceeded
Dim blnMessageSent	'Set to true if the message is already sent
Dim strEmailSubject	'Holds the subject of the e-mail
Dim strEmailBody	'Holds the body of the e-mail message
Dim blnEmailSent	'set to true if an e-mail is sent
Dim strTempMessageQuote	'Temporary word hold for the first line of a quote
Dim strMessageQuote	'Holds the new first line of a quote
Dim lngQuoteStartPos	'Holds the start position for a quote
Dim lngQuoteEndPos	'Holds the end position of a quote
Dim strTempMessageLink	'Temporary word hold for e-mail and url words
Dim strMessageLink	'Holds the new mesage link
Dim lngLinkStartPos	'Holds the start position for a link
Dim lngLinkEndPos	'Holds the end position for a word
Dim blnBlocked		'Set to true if the user is blocked from messaging this person
Dim blnNoSubject	'Set to true if there is no subject to the PM


'Initilaise varaibles
blnToUsernameOK = False
blnMaxPMsOK = False
blnMessageSent = False
blnBlocked = False
blnNoSubject = False

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")


'Read in the details for the pm
strSubject = Trim(Mid(Request.Form("subject"), 1, 41))
strMessage = Request.Form("Message")
blnReadEmailNotify = CBool(Request.Form("email"))
strToUsername = Trim(Request.Form("member"))
	
'If the buddy text box is empty then read in the buddy from the list box
If strToUsername = "" Then strToUsername = Trim(Request.Form("selectMember"))

'Trim the lentgh of the buddy name to the right length
strToUsername = Trim(Mid(strToUsername, 1, 15))

'Take out parts of the username that are not permitted
strToUsername = Replace(strToUsername, "password", "", 1, -1, 1)
strToUsername = Replace(strToUsername, "author", "", 1, -1, 1)
strToUsername = Replace(strToUsername, "code", "", 1, -1, 1)
strToUsername = Replace(strToUsername, "username", "", 1, -1, 1)

'Run the to username through the same SQL filer it was created under otherwise it may not match
strToUsername = formatSQLInput(strToUsername)

'If there is no subject or message then don't post the message as won't be able to link to it
If strSubject = "" OR strMessage = "" Then blnNoSubject = True

'Check that the user the pm is being sent to exisits
'Intialise the ADO recordset object
Set rsCheckUser = Server.CreateObject("ADODB.Recordset")
	
'Initalise the SQL string with a query to read in all the words from the smut table
strSQL = "SELECT tblAuthor.Author_ID, Author_email FROM tblAuthor "
strSQL = strSQL & "WHERE tblAuthor.Username = '" & strToUsername & "';"

'Open the recordset
rsCheckUser.Open strSQL, strCon

'If the to buddy is found in the database run the rest of the code
If NOT rsCheckUser.EOF Then

	'Get the buddy user id
	lngToUserID = CLng(rsCheckUser("Author_ID"))
	
	'Username found so set to true
	blnToUsernameOK = True
	
	'Don't let user send private message to guest account
	If (lngToUserID = 2 OR lngLoggedInUserID = 0) Then Response.Redirect("insufficient_permission.asp")
	
	
	
	'Check the user is not blocked from messaging this person
	'Intialise the ADO recordset object
	Set rsBlockedCheck = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the SQL string with a query to read count the number of pm's the user has recieved
	strSQL = "SELECT tblBuddyList.Buddy_ID FROM tblBuddyList "
	strSQL = strSQL & "WHERE tblBuddyList.Block = 1 AND tblBuddyList.Buddy_ID = " & lngLoggedInUserID & " AND tblBuddyList.Author_ID = " & lngToUserID & ";"
	
	'Open the recordset
	rsBlockedCheck.Open strSQL, strCon
	
	'If a record is returned then this user is blocked from messaging this person so don't send the pm, unless this is the forum admin
	If NOT rsBlockedCheck.EOF AND NOT lngLoggedInUserID = 1 Then blnBlocked = True
	
	'Clean up
	rsBlockedCheck.Close
	Set rsBlockedCheck = Nothing
	
	
	
	'Check the user has not exceeded there allowed amount of private messages
	'Intialise the ADO recordset object
	Set rsCheckNumPM = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the SQL string with a query to read count the number of pm's the user has recieved
	strSQL = "SELECT Count(tblPMMessage.PM_ID) AS CountOfPM FROM tblPMMessage "
	strSQL = strSQL & "GROUP BY tblPMMessage.Author_ID "
	strSQL = strSQL & "HAVING (((tblPMMessage.Author_ID)=" & lngToUserID & ")); "
	
	'Open the recordset
	rsCheckNumPM.Open strSQL, strCon
	
	'If there are records returned and the num of pm's is less than max alloed set blnMaxPMsOK to true
	If NOT rsCheckNumPM.EOF Then
		If (CInt(rsCheckNumPM("CountOfPM")) < intNumPrivateMessages) OR lngLoggedInUserID = 1 OR lngToUserID = 1 Then blnMaxPMsOK = True
	'Else if no records returened they have no pm's set set blnMaxPMsOK to true anyway (it's intilised to false at the top)
	Else
		blnMaxPMsOK = True
	End If
	
	'Relese sever objects
	rsCheckNumPM.Close
	Set rsCheckNumPM = Nothing
End If


'If the user to send to is found and they don't exceed max num of pm's (unless the sender is admin) then send the pm
If blnToUsernameOK = True AND blnMaxPMsOK = True AND blnBlocked = False AND blnNoSubject = False Then

	'Place the target as blank and the border as 0 on IE posts
	If Request.Form("browser") = "IE" Then 
		
		strMessage = Replace(strMessage, "<a href=", "<a target=""_blank"" href=", 1, -1, 1)
		strMessage = Replace(strMessage, "href='", "href=""", 1, -1, 1)
		strMessage = Replace(strMessage, "<img src=", "<img border=""0"" src=", 1, -1, 1)
		strMessage = Replace(strMessage, "src='", "src=""", 1, -1, 1)
		strMessage = Replace(strMessage, "'>", """>", 1, -1, 1)
		strMessage = Replace(strMessage, " border=0>", ">", 1, -1, 1)
		strMessage = Replace(strMessage, " target=_blank>", ">", 1, -1, 1)
		strMessage = Replace(strMessage, " target=_top>", ">", 1, -1, 1)
		strMessage = Replace(strMessage, " target=_self>", ">", 1, -1, 1)
		strMessage = Replace(strMessage, " target=_parent>", ">", 1, -1, 1)
		strMessage = Replace(strMessage, "<SCRIPT> window.open=NS_ActualOpen; </SCRIPT>", "", 1, -1, 1) 
	
	'If the users browser type is IE then miss out the message formatting	
	Else
		
		'Format the user input by replacing characters with HTML equivelents
		strMessage = Replace(strMessage, "<", "&lt;", 1, -1, 1)
		strMessage = Replace(strMessage, ">", "&gt;", 1, -1, 1)
		strMessage = Replace(strMessage, "       ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, "      ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, "     ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, "    ", "&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, "   ", "&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, vbTab, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
		strMessage = Replace(strMessage, vbCrLf, "<br>" & vbCrLf, 1, -1, 1)
	
	
		'Call the format_post.inc file to format the message
		%><!--#include file="format_post.inc" --><%
	End If
	
	'Call the code_check.asp file to remove malcious code
	strMessage = checkImages(strMessage)
	strMessage = checkLinks(strMessage)
	strMessage = formatInput(strMessage)
	
	'Get rid of scripting tags in the subject
	strSubject = Replace(strSubject, "&", "&amp;", 1, -1, 1)
	strSubject = Replace(strSubject, "<", "&lt;", 1, -1, 1)
	strSubject = Replace(strSubject, ">", "&gt;", 1, -1, 1)
	strSubject = Replace(strSubject, """", " ", 1, -1, 1)
	strSubject = Replace(strSubject, "'", "&#146;", 1, -1, 1)
	strSubject = formatInput(strSubject)
	
	
	'Replace swear words with other words with ***
	'Intialise the ADO recordset object
	Set rsSmut = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the SQL string with a query to read in all the words from the smut table
	strSQL = "SELECT tblSmut.* FROM tblSmut"
	
	'Open the recordset
	rsSmut.Open strSQL, strCon
	
	'Loop through all the words to check for
	Do While NOT rsSmut.EOF
		
		'Replace the swear words with the words in the database the swear words
		strMessage = Replace(strMessage, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
		strSubject = Replace(strSubject, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
	
		'Move to the next word in the recordset
		rsSmut.MoveNext
	Loop
	
	'Release server objects
	rsSmut.Close
	Set rsSmut = Nothing
	
	
	'Send the private message
	'Intialise the ADO recordset object
	Set rsSavePM = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the SQL string with a query to read in all the words from the smut table
	strSQL = "SELECT TOP 1 tblPMMessage.* FROM tblPMMessage WHERE tblPMMessage.Author_ID = " & lngToUserID & " ORDER BY tblPMMessage.PM_Message_Date DESC;"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsSavePM.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsSavePM.LockType = 3
	
	'Open the recordset
	rsSavePM.Open strSQL, strCon
	
	'Check to make sure the message is not already sent to the user
	If NOT rsSavePM.EOF Then
		If strMessage = rsSavePM("PM_Message") Then blnMessageSent = True
	End IF
	
	'Save the pm
	If blnMessageSent = False Then
		
		'Add new record to recordset
		rsSavePM.AddNew
		rsSavePM.Fields("Author_ID") = lngToUserID
		rsSavePM.Fields("From_ID") = lngLoggedInUserID
		rsSavePM.Fields("PM_Tittle") = strSubject
		rsSavePM.Fields("PM_Message") = strMessage
		'Check to see if they want e-mail notification of read pm
		If blnLoggedInUserEmail = True AND blnReadEmailNotify = True Then 
			rsSavePM.Fields("Email_notify") = 1
		Else
			rsSavePM.Fields("Email_notify") = 0
		End If
		rsSavePM.Update
	End If
End If
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger : Send New Message</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

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
  <td align="left" width="63%" > <img src="<% = strImagePath %>folder_icon.gif" width="15" height="15" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif" width="20" height="20">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif" width="15" height="15">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="37%" >&nbsp;<!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="4" align="center">
 <tr> 
  <td width="60%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" width="26" height="26" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger & ": " & strTxtSendNewMessage %></span></td>
  <td align="right" width="40%"> <a href="pm_inbox.asp" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
</table>
<div align="center"><br>
 <br>
 <br>
 <span class="text">
 <%
'Display message to user
If blnToUsernameOK = False Then
	
	'Display an error message
	Response.Write("<span class=""lgText"">" & strTxtYourPrivateMessage & " &quot;" & strSubject & "&quot;, " & strTxtHasNotBeenSent & "</span>")
	Response.Write("<br><br>" & strTxtTheUsernameCannotBeFound)
	Response.Write("<br><br><a href=""pm_new_message_form.asp?code=edit"">" & strTxtAmendYourPrivateMessage & "</a>")
	
	'Save the pm details so they can be edited
	Session("Subject") = strSubject
	Session("Buddy") = strToUsername
	Session("PmMessage") = Request.Form("Message")

'If the message is blocked
ElseIf blnBlocked = True Then
	'Display an error message
	Response.Write("<span class=""lgText"">" & strTxtYourPrivateMessage & " &quot;" & strSubject & "&quot;, " & strTxtHasNotBeenSent & "</span>")
	Response.Write("<br><br>" & strTxtYouAreBlockedFromSendingPMsTo & " " & strToUsername & ".")
	Response.Write("<br><br><a href=""pm_welcome.asp"">" & strTxtReturnToYourPrivateMessenger & "</a>")
	
ElseIf blnMaxPMsOK = False Then
	'Display an error message
	Response.Write("<span class=""lgText"">" & strTxtYourPrivateMessage & " &quot;" & strSubject & "&quot;, " & strTxtHasNotBeenSent & "</span>")
	Response.Write("<br><br>" & strToUsername & " " & strTxtHasExceededMaxNumPPMs & ".")
	Response.Write("<br><br><a href=""pm_welcome.asp"">" & strTxtReturnToYourPrivateMessenger & "</a>")

'If there is no message body or subject display an error message
ElseIf blnNoSubject = True Then
	
	'Display an error message
	Response.Write("<span class=""lgText"">" & strTxtYourPrivateMessage & " &quot;" & strSubject & "&quot;, " & strTxtHasNotBeenSent & "</span>")
	Response.Write("<br><br>" & strTxtYourMessageNoValidSubjectHeading)
	Response.Write("<br><br><a href=""pm_new_message_form.asp?code=edit"">" & strTxtAmendYourPrivateMessage & "</a>")

	'Save the pm details so they can be edited
	Session("Subject") = strSubject
	Session("Buddy") = strToUsername
	Session("PmMessage") = Request.Form("Message")
Else
	'Display a message to say the message is sent
	Response.Write("<span class=""lgText""><img src=""" & strImagePath & "message_sent_icon.gif"" width=""32"" height=""32"" align=""absmiddle""> " & strTxtYourPrivateMessage & " &quot;" & strSubject & "&quot;, " & strTxtHasBeenSentTo & " " & strToUsername & ".</span>")
	Response.Write("<br><br><a href=""pm_welcome.asp"">" & strTxtReturnToYourPrivateMessenger & "</a>")
End If
%>
 <br>
 </span> 
 <br><br>
 <br><br><br>
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
'Release server objects
rsCheckUser.Close
Set rsCheckUser = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
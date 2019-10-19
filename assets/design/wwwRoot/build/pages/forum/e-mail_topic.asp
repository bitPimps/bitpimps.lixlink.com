<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="send_mail_function.inc" -->
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


Response.Buffer = True 


'Dimension variables
Dim rsAuthorEmail	'Recordset object holding the users e-mail address
Dim strAuthorEmail	'Holds the users e-maila address
Dim strFormMessage	'Holds the message in the form
Dim strEmailBody	'Holds the body of the e-mail
Dim blnSentEmail	'Set to true when the e-mail is sent
Dim strSubject		'Holds the subject of the e-mail

'Initialise variables
blnSentEmail = False


'If the user has not logged in then  or the page has not been passed with a topic id the redirect to the forum start page
If lngLoggedInUserID = 0 OR Request.QueryString("ForumID") = "" OR Request.QueryString("TopicID") = "" OR blnEmail = False Then Response.Redirect "default.asp"


'Initilise the message in the form
strFormMessage = strTxtEmailFriendMessage & " " & strWebsiteName & " " & strTxtEmailForumAt & ": -"
strFormMessage = strFormMessage & vbCrLf & vbCrLf & strForumPath & "/display_topic_threads.asp?ForumID=" & Request.QueryString("ForumID") & "&TopicID=" & Request.QueryString("TopicID") & vbCrLf


'Read in the users e-mail address
'Create a record set object to the Threads held in the database
Set rsAuthorEmail = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database get the thread details
strSQL = "SELECT tblAuthor.Author_email "
strSQL = strSQL & "FROM tblAuthor "
strSQL = strSQL & "WHERE (((tblAuthor.Author_ID)=" & lngLoggedInUserID & "));"

'Query the database
rsAuthorEmail.Open strSQL, strCon 

'If there is an e-mail address for the user then read it in
If NOT rsAuthorEmail.EOF Then
	'Read in authors detals from the database
	strAuthorEmail = rsAuthorEmail("Author_email")
End If

'Reset server objects
rsAuthorEmail.Close
Set rsAuthorEmail = Nothing
Set adoCon = Nothing
Set strCon = Nothing


'If the form has been filled in then send the form
If NOT Request.Form("ToName") = "" AND NOT Request.Form("ToEmail") = "" AND NOT Request.Form("FromName") = "" AND NOT Request.Form("FromEmail") = "" AND NOT Request.Form("message") = "" Then

	'Initilalse the body of the email message
	strEmailBody = strTxtHi & " " & Request.Form("ToName")
	strEmailBody = strEmailBody & vbCrLf & vbCrLf & Request.Form("message")
	strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailRecievedFrom
	strEmailBody = strEmailBody & vbCrLf & vbCrLf & Request.Form("FromName")
	strEmailBody = strEmailBody & vbCrLf & Request.Form("FromEmail")
	
	'Inititlaise the subject of the e-mail
	strSubject = strTxtInterestingForumPostOn & " " & strWebsiteName

	'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
	blnSentEmail = SendMail(strEmailBody, Request.Form("ToName"), Request.Form("ToEmail"), Request.Form("FromName"), Request.Form("FromEmail"), strSubject, strMailComponent, false)
End If
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>E-mail Topic To a Friend</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm() {

	var errorMsg = "";

	//Check for a Friends Name
	if (document.frmEmailTopic.ToName.value == ""){
		errorMsg += "\n\t<% = strTxtErrorFrinedsName %>";	
	}
		
	//Check that the friends e-mail and it is valid address is valid
	if ((document.frmEmailTopic.ToEmail.value=="") || (document.frmEmailTopic.ToEmail.value.length > 0 && (document.frmEmailTopic.ToEmail.value.indexOf("@",0) == - 1 || document.frmEmailTopic.ToEmail.value.indexOf(".",0) == - 1))) { 
		errorMsg += "\n\t<% = strTxtErrorFriendsEmail %>"; 	
	}
	
	//Check for a Users Name
	if (document.frmEmailTopic.FromName.value==""){
		errorMsg += "\n\t<% = strTxtErrorYourName %>";		
	}	
	
	//Check for the users e-mail address and it is valid
	if ((document.frmEmailTopic.FromEmail.value=="") || (document.frmEmailTopic.FromEmail.value.length > 0 && (document.frmEmailTopic.FromEmail.value.indexOf("@",0) == - 1 || document.frmEmailTopic.FromEmail.value.indexOf(".",0) == - 1))) { 
		errorMsg += "\n\t<% = strTxtErrorYourEmail %>"; 
	}
	
	//Check for a Message
	if (document.frmEmailTopic.message.value==""){
		errorMsg += "\n\t<% = strTxtErrorEmailMessage %>";
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
<!--#include file="skin_file.inc" -->
</head>
<body bgcolor="<% = strBgColour %>" text="<% = strTextColour %>" background="<% = strBgImage %>" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
 <tr> 
  <td align="center"><span class="heading"> 
   <% = strTxtEmailTopicToFriend %>
   </span></td>
 </tr>
</table>
<%
'If the email has been sent then display a message saying
If blnSentEmail = True Then
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
 <tr> 
  <td align="center" height="79" class="text"> 
   <% = strTxtFriendSentEmail %>
  </td>
 </tr>
</table>
<%
'Else the e-mail has not been sent so display the form
Else
%>
<br>
<form name="frmEmailTopic" method="post" action="e-mail_topic.asp?ForumID=<% = Request.QueryString("ForumID") %>&TopicID=<% = Request.QueryString("TopicID") %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
 <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="138">
  <tr> 
   <td height="174"> 
    <table border="0" align="center" cellpadding="4" cellspacing="1" width="350">
     <tr align="left" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td colspan="2" bgcolor="<% = strTableTitleColour %>"><span class="text">*<% = strTxtRequiredFields %></span></td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td align="left" width="115" nowrap bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text"><% = strTxtFriendsName %>*</td>
      <td align="left" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" width="234" nowrap> 
       <input type="text" name="ToName" size="20" maxlength="20">
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td align="left" width="115" nowrap class="text" background="<% = strTableBgImage %>"><% = strTxtFriendsEmail %>*</td>
      <td align="left" width="234" nowrap background="<% = strTableBgImage %>"> 
       <input type="text" name="ToEmail" size="20" maxlength="50">
      </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td align="left" width="115" nowrap class="text" background="<% = strTableBgImage %>"><% = strTxtYourName %>*</td>
      <td align="left" width="234" nowrap background="<% = strTableBgImage %>"> 
       <input type="text" name="FromName" size="20" maxlength="20" value="<% = strLoggedInUsername %>" onFocus="FromName.value = ''">
      </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td align="left" width="115" nowrap class="text" background="<% = strTableBgImage %>"><% = strTxtYourEmail %>*</td>
      <td align="left" width="234" nowrap background="<% = strTableBgImage %>"> 
       <input type="text" name="FromEmail" size="20" maxlength="50" value="<% = strAuthorEmail %>" onFocus="FromEmail.value = ''">
      </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
      <td align="left" colspan="2" background="<% = strTableBgImage %>"><span class="text"><% = strTxtMessage %>:</span><br>
       <textarea name="message" cols="40" rows="4" wrap="OFF"><% = strFormMessage %></textarea>
      </td>
     </tr>
     <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" align="center"> 
      <td valign="top" colspan="2" background="<% = strTableBgImage %>"> 
       <p> 
        <input type="submit" name="Submit" value="<% = strTxtSendEmail %>">
        <input type="reset" name="Reset" value="<% = strTxtResetForm %>">
       </p>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</form>
<%
End If
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
 <tr> 
  <td align="center" height="34"><a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
 </tr>
</table>
</body>
</html>

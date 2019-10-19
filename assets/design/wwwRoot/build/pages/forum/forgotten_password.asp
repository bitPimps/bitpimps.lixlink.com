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
Dim rsEmailPassword		'Database recorset for the password
Dim objCDOMail			'Holds the CDO mail object
Dim objJMail			'Holds the Jmail object
Dim strUsername			'Holds the users username
Dim strPassword			'Holds the usres password
Dim strEmailAddress		'Holds the users e-mail address
Dim strReturnPage		'Holds the page to return to 
Dim blnInvalidUsername 		'Set to true if the username entered does not exsit
Dim blnInvalidEmail 		'Set to true if the user has not given there e-mail address	
Dim blnEmailSent		'Set to true if the e-mail has been sent
Dim strEmailBody		'Holds the body of the e-mail message	
Dim strSubject			'Holds the subject of the e-mail


'Intialise variables
blnInvalidUsername = False
blnInvalidEmail = False
blnEmailSent = False

'If e-mail notify is not turned on then close the window
If blnEmail = False Then
	Response.Redirect "default.asp"
End If

'Read in the users details from the form
strUsername = Trim(Mid(Request.Form("name"), 1, 15))

'Take out parts of the username that are not permitted
strUsername = Replace(strUsername, "admin", "", 1, -1, 1)
strUsername = Replace(strUsername, "password", "", 1, -1, 1)
strUsername = Replace(strUsername, "author", "", 1, -1, 1)
strUsername = Replace(strUsername, "code", "", 1, -1, 1)
strUsername = Replace(strUsername, "username", "", 1, -1, 1)

'Replace harmful SQL quotation marks with doubles
strUsername = formatSQLInput(strUsername)

    
'If a username has been entered check that the password is correct
If NOT strUsername = "" Then
	
	'Intialise the ADO recordset object
	Set rsEmailPassword = Server.CreateObject("ADODB.Recordset")
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Password, tblAuthor.Author_email "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Username = '" & strUsername & "';"
	
	'Query the database
	rsEmailPassword.Open strSQL, strCon
	
	'If the query has returned a value to the recordset then send the e-mail
	If NOT rsEmailPassword.EOF Then
	
		'Read in the users password and e-mail address from the recordset
		strPassword = rsEmailPassword("Password")
		strEmailAddress = rsEmailPassword("Author_email")
	
		If NOT strEmailAddress = "" Then
		
			'Initailise the e-mail body variable with the body of the e-mail
			strEmailBody = strTxtHi & " " & decodeString(strUsername)
			strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailPasswordRequest & " " & strWebsiteName & "."
			strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailPasswordRequest2 & " " & decodeString(strPassword) & " "
			strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailPasswordRequest3
			strEmailBody = strEmailBody & vbCrLf & vbCrLf & "   " & strForumPath
			
			'Initalise the subject of the e-mail
			strSubject = strTxtForumLostPasswordRequest
			
			'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
			blnEmailSent = SendMail(strEmailBody, decodeString(strUsername), decodeString(strEmailAddress), strWebsiteName, decodeString(strForumEmailAddress), strSubject, strMailComponent, false)
			
		Else
			'Set the Invalid e-mail variable to True
			blnInvalidEmail = True	
		End If
	
	
	Else
		'Set the Invalid username variable to True
		blnInvalidUsername = True		
		
	End If
	
	'Clean up
	rsEmailPassword.Close
	Set rsEmailPassword = Nothing
End If
	


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Forgotten Password</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";
	
	//Check for a Username
	if (document.frmMailPass.name.value==""){
	
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";
	
		alert(msg + "\n\t<% = strTxtErrorUsername %>");
		document.frmMailPass.name.focus();
		return false;
	}
	
	return true
}
// -->
</script>
<!--#include file="skin_file.inc" -->
</head>
<body bgcolor="<% = strBgColour %>" text="<% = strTextColour %>" background="<% = strBgImage %>" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<div align="center" class="heading"><% = strTxtForgottenPassword %></div><br>
<%
'If the user has entered a username that does not exsit then display an error message
If blnInvalidUsername = True Then
%>
  <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
    <td align="center" class="text"><% = strTxtNoRecordOfUsername %><br><% = strTxtPleaseTryAgain %></td>
    </tr>
  </table>
  <%
'If there is no e-mail address for the user then display an error message
ElseIf blnInvalidEmail = True Then
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"> 
      <p class="text"><% = strTxtNoEmailAddressInProfile %><br>
        <br><% = strTxtReregisterForForum %></p>
      </td>
  </tr>
</table>
<%
'If the password has been e-mailed to the user then let them know
ElseIf blnEmailSent = True Then
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
    <td align="center"><span class="text"><% = strTxtPasswordEmailToYou %> 
      </span><br>
    </td>
    </tr>
  </table>
<%
Else
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      
    <td align="center" class="text"><% = strTxtPleaseEnterYourUsername %></td>
    </tr>
  </table>
<%
End If

If blnInvalidEmail = False AND blnEmailSent = False Then
%>
<form method="post" name="frmMailPass" action="forgotten_password.asp" onSubmit="return CheckForm();">
  <br>
  <table width="390" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="30">
    <tr> 
      <td height="2" width="483" align="center"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" height="26"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td align="right" width="22%"><span class="text"><% = strTxtUsername %>:</span>&nbsp;&nbsp;</td>
                  <td width="78%"> 
                    <input type="text" name="name" size="15" maxlength="15" value="<% = strUsername %>">
                    <input type="submit" name="Submit" value="<% = strTxtEmailPassword %>">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="75%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" height="51" class="text"><% = strTxtValidEmailRequired %></td>
    </tr>
  </table>
<%
End If
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    <td align="center"><a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
</body>
</html>
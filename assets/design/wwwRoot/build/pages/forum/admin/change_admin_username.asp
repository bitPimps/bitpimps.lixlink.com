<% Option Explicit %>
<!--#include file="common.asp" -->
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

'Set the response buffer to true
Response.Buffer = True 


'Dimension variables
Dim rsCheckUsername 		'Recorset holding all the username in the database			
Dim rsAdminUpdate		'Recordset holding the updated admin username and password			
Dim rsAdminDetails		'recordset holding the admin details		
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database
Dim strNewUsername		'Holds the new username
Dim strNewPassword		'Holds the new password
Dim blnUsernameOK		'Set to ture if the username is not already in the database
Dim strCheckUsername		'Holds the username from the database that we are checking against


'Initialise variables
blnUsernameOK = True



'Read in the users details from the form
strNewUsername = Request.Form("name2")
strNewPassword = Request.Form("password2")
strMode = Request.Form("mode")


'Intialise the ADO recordset object
Set rsAdminDetails = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblAuthor.Username,  tblAuthor.Password "
strSQL = strSQL & "From tblAuthor "
strSQL = strSQL & "WHERE tblAuthor.Author_ID=1;"
	
'Query the database
rsAdminDetails.Open strSQL, strCon


'Read in the username from the datbase
If NOT rsAdminDetails.EOF Then
	
	'Read in the Username and password from the recordset
	strUsername = rsAdminDetails("Username")
	strPassword = rsAdminDetails("Password")
End If

'Clean up
rsAdminDetails.Close
Set rsAdminDetails = Nothing

'If the user is changing there username and password then update the database
If strMode = "change" Then

	'Intialise the ADO recordset object
	Set rsCheckUsername = Server.CreateObject("ADODB.Recordset")
	
	'Read in the usernames from the database to check the username does not alreday exsist
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Username FROM tblAuthor WHERE tblAuthor.Username = '" & strNewUsername & "';"
	
	'Query the database
	rsCheckUsername.Open strSQL, strCon
	
	'If there a record returned then the username is already in use
	If NOT rsCheckUsername.EOF Then blnUsernameOK = False
	
	'Make sure the user has not entered disallowed usernames
	If InStr(1, strNewUsername, "password", vbTextCompare) Then blnUsernameOK = False
	If InStr(1, strNewUsername, "author", vbTextCompare) Then blnUsernameOK = False
	If InStr(1, strNewUsername, "code", vbTextCompare) Then blnUsernameOK = False
	If InStr(1, strNewUsername, "username", vbTextCompare) Then blnUsernameOK = False
	If InStr(1, strNewUsername, "N0act", vbTextCompare) Then blnUsernameOK = False
	
	'If the new username is the same as the old username then the username is OK
	If strNewUsername = strUsername Then blnUsernameOK = True
	
	'Clean up
	rsCheckUsername.Close
	Set rsCheckUsername = Nothing
	
	'If the Username dose not already exsists then save the users details to the database
	If blnUsernameOK = True Then
	
		'Intialise the ADO recordset object
		Set rsAdminUpdate = Server.CreateObject("ADODB.Recordset")
		
		'Intialise the strSQL variable with an SQL string to open a record set for the Author table
		strSQL = "SELECT tblAuthor.Username,  tblAuthor.Password, tblAuthor.User_code "
		strSQL = strSQL & "From tblAuthor "
		strSQL = strSQL & "WHERE tblAuthor.Author_ID=1;"
		
		
		'Set the Lock Type for the records so that the record set is only locked when it is updated
		rsAdminUpdate.LockType = 3
		
		'Set the Cursor Type to dynamic
		rsAdminUpdate.CursorType = 2
		
		'Open the author table
		rsAdminUpdate.Open strSQL, strCon
		
		'Randomise the system timer
		Randomize Timer
		
		'Calculate a code for the user
		strUserCode = strNewUsername & (987656342 * CInt((RND * 32000) + 100)) & Left(strNewPassword,1) & Right(strNewPassword,1)
	
		'Update the recordset	
		rsAdminUpdate.Fields("Username") = strNewUsername
		rsAdminUpdate.Fields("Password") = strNewPassword
		rsAdminUpdate.Fields("User_code") = strUserCode
			
				
		'Update the database with the new user's details
		rsAdminUpdate.Update
		
		'Re-run the NewUser query to read in the updated recordset from the database
		rsAdminUpdate.Requery	
		
		'Write a cookie with the User ID number so the user logged in throughout the forum	
		'Write the cookie with the name Forum containing the value UserID number
		Response.Cookies("Forum")("UserID") = strUserCode
		
		strUsername = rsAdminUpdate("Username")
		strPassword = rsAdminUpdate("Password")
		
		'Clean up
		rsAdminUpdate.Close
		Set rsAdminUpdate = Nothing
	End If
End If

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Change Admin Username &amp; Password</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a Username
	if (document.frmChangePassword.name2.value==""){
		alert("Please enter your a Username");
		document.frmChangePassword.name2.focus();
		return false;
	}
	
	//Check for a Password
	if (document.frmChangePassword.password2.value==""){
		alert("Please enter your a Password");
		document.frmChangePassword.password2.focus();
		return false;
	}
	
	return true
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Change Admin Username &amp; Password</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 <br>
 Make sure you <b>remember</b> the new<b> username</b> and <b>password</b> <br>
 as you <b>will not</b> be able to Login or <b>Administer the Forum without them</b>!!!</font><br>
 <br>
</div>
<%
If blnUsernameOK = False Then
%>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
 <tr> 
  <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Sorry the Username you requested is already taken.<br>
   Please choose another Username.</font></td>
 </tr>
</table>
<%
End If
%>
<form method="post" name="frmChangePassword" action="change_admin_username.asp" onSubmit="return CheckForm();">
 <table width="300" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="30">
  <tr> 
   <td height="2" width="483" align="center"> 
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
     <tr> 
      <td bgcolor="#FFFFFF"> 
       <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <tr> 
         <td align="right" width="29%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Username:&nbsp;</font>&nbsp;</td>
         <td width="71%"> 
          <input type="text" name="name2" size="15" maxlength="15" value="<% = strUsername %>" >
         </td>
        </tr>
        <tr> 
         <td align="right" width="29%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Password:&nbsp;</font> </td>
         <td width="71%"> 
          <input type="text" name="password2" size="15" maxlength="15" value="<% = strPassword %>" >
         </td>
        </tr>
        <tr> 
         <td align="right" width="29%"> 
          <input type="hidden" name="mode" value="change">
         </td>
         <td width="71%"> 
          <input type="submit" name="Submit" value="Update Details">
          <input type="reset" name="Reset" value="Clear">
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
<br>
</body>
</html>

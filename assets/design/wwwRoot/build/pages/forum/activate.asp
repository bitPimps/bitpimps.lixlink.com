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


'Set the response buffer to true as we maybe redirecting and setting a cookie
Response.Buffer = True 


'Dimension variables
Dim rsActivateMem		'Holds the Database Recordset for the new user
Dim rsSmut			'Holds the recordset for the swear filter
Dim strUserCode			'Holds a code for the user
Dim lngUserID			'Holds the new users ID number
Dim blnActivated		'Set to true if the account is activated

blnActivated = False

'Read in the users ID from the query string
strUserCode = Trim(Mid(Request.QueryString("ID"), 1, 44))

'Make the usercode SQL safe
strUserCode = formatSQLInput(strUserCode)


'If therese a usercode activate it
If strUserCode <> "" Then	
	
	'Intialise the ADO recordset object
	Set rsActivateMem = Server.CreateObject("ADODB.Recordset")
	
	'Intialise the strSQL variable with an SQL string to open a record set for the Author table
	strSQL = "SELECT tblAuthor.* From tblAuthor WHERE tblAuthor.User_code = '" & strUserCode & "';"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsActivateMem.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsActivateMem.LockType = 3
	
	'Open the author table
	rsActivateMem.Open strSQL, strCon
	
	'If these a record returned then alls well so cteate a new id code and activate the membership
	If NOT rsActivateMem.EOF AND InStr(1, strUserCode, "N0act", vbTextCompare) = False Then
		
		'Read in the new user's ID number from the database
		lngUserID = CLng(rsActivateMem("Author_ID"))
			
		'Randomise the system timer
		Randomize Timer
		
		'Calculate a code for the user
		strUserCode = rsActivateMem("Username") & (9797299628 * CInt((RND * 32000) + 100)) & Left(rsActivateMem("Password"),1) & Right(rsActivateMem("Password"),1)
		
		'Make the usercode SQL safe
		strUserCode = formatSQLInput(strUserCode)
	
		'Replace double quote with single in this intance
		strUserCode = Replace(strUserCode, "''", "'", 1, -1, 1)
		
		'Update the database by actvating the users account
		rsActivateMem.Fields("User_code") = strUserCode
		rsActivateMem.Fields("Active") = 1
			
		'Update the database with the new user's details
		rsActivateMem.Update
			
		'Write a cookie with the User ID number so the user logged in throughout the forum	
		'Write the cookie with the name Forum containing the value UserID number
		Response.Cookies("Forum")("UserID") = strUserCode
		
		'Set the activate boolean to true
		blnActivated = True
	End If
	
	'Release objects
	rsActivateMem.Close
	Set rsActivateMem = Nothing
End If
	
	
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Register New User</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";

	//Check for a Username
	if (document.frmRegister.name.value.length <= 3){
		errorMsg += "\n\t<% = strTxtErrorUsernameChar %>";
		document.frmRegister.name.focus();
	}
	
	//If there is a problem with the form then display an error
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
<div align="center" class="heading"><% = strTxtRegisterNewUser %></div>
<div align="center"><a href="default.asp" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br>
  <br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr><%
'If the account is now active display a message
If blnActivated = True Then
  	Response.Write("	<td align=""center"" class=""text"">" & strTxtYourForumMemIsNowActive & "</td>")
'Theres been a problem so display an error message
Else 
   	Response.Write("	<td align=""center"" class=""text"">" & strTxtErrorWithActvation & "</td>")
End If %>
  </tr>
 </table>
</div> 
<br>
  <br>
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
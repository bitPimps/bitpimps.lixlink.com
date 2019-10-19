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


Response.Buffer = True 

'Dimension variables
Dim rsCheckPassword		'Holds the recordset of the users password
Dim strUsername			'Holds the users username
Dim strPassword			'Holds the usres password
Dim blnAutoLogin		'Holds whether the user wnats to be automactically logged in
Dim lngUserID			'Holds the users Id number
Dim strUserCode			'Holds the users ID code
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page


'Intialise variables
blnAutoLogin = False

'Get the forum page to return to
Select Case Request.QueryString("ReturnPage")
	Case "Topic"
		'Read in the forum and topic to return to
		strReturnPage = "display_forum_topics.asp"
		strReturnPageProperties = "?ReturnPage=Topic&ForumID=" & CInt(Request.QueryString("ForumID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Read in the thread and forum to return to
	Case "Thread"
		strReturnPage = "display_topic_threads.asp"
		strReturnPageProperties = "?ReturnPage=Thread&ForumID=" & CInt(Request.QueryString("ForumID")) & "&TopicID=" & CLng(Request.QueryString("TopicID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition")) & "&ThreadPage=" & Request.QueryString("ThreadPage")
	
	'Read in the search to return to
	Case "Search"
		strReturnPage = "search.asp"
		strReturnPageProperties = "?ReturnPage=Search&SearchPagePosition=" & Request.QueryString("SearchPagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")
	
	'Read in the private message to return to
	Case "pm"
		strReturnPage = "pm_welcome.asp"
		strReturnPageProperties = "?ReturnPage=pm"
	
	'Read in the active topic page to return to
	Case "Active"
		strReturnPage = "active_topics.asp"
		strReturnPageProperties = "?PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Else return to the forum main page
	Case Else
		strReturnPage = "default.asp"
		strReturnPageProperties = "?ForumID=0"
End Select


'Read in the users details from the form
strUsername = Trim(Mid(Request.Form("name"), 1, 15))
strPassword = Trim(Mid(Request.Form("password"), 1, 15))
blnAutoLogin = CBool(Request.Form("AutoLogin"))

'Take out parts of the username that are not permitted
strUsername = Replace(strUsername, "password", "", 1, -1, 1)
strUsername = Replace(strUsername, "author", "", 1, -1, 1)
strUsername = Replace(strUsername, "code", "", 1, -1, 1)
strUsername = Replace(strUsername, "username", "", 1, -1, 1)

'Replace harmful SQL quotation marks with doubles
strUsername = formatSQLInput(strUsername)
  
    
'If a username has been entered check that the password is correct
If NOT strUsername = "" Then
	
	'Intialise the ADO recordset object
	Set rsCheckPassword = Server.CreateObject("ADODB.Recordset")
	
	'Read the various forums from the database
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Password, tblAuthor.Author_ID, tblAuthor.User_code "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Username = '" & strUsername & "';"
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsCheckPassword.LockType = 3
	
	'Query the database
	rsCheckPassword.Open strSQL, strCon
	
	'If the query has returned a value to the recordset then check the password is correct
	If NOT rsCheckPassword.EOF Then
	
		'Check the password is correct, if it is get the user ID and set a cookie
		If LCase(strPassword) = LCase(rsCheckPassword("Password")) Then
			
			'Read in the users ID number and whether they want to be automactically logged in when they return to the forum
			lngUserID = CLng(rsCheckPassword("Author_ID"))
			strUserCode = rsCheckPassword("User_code")	
			
			'Write a cookie with the User ID number so the user logged in throughout the forum	
			'Write the cookie with the name Forum containing the value UserID number
			Response.Cookies("Forum")("UserID") = strUserCode
			If CBool(Request.Form("ActiveUsers")) = False Then
				Response.Cookies("Forum")("Hide") = True
			Else
				Response.Cookies("Forum")("Hide") = False
			End If
				
			
			'If the user has selected to be remebered when they next login then set the expiry date for the cookie for 1 year
			If blnAutoLogin = True Then
				
				'Set the expiry date for 1 year
				'If no expiry date is set the cookie is deleted from the users system 20 minutes after they leave the forum
				Response.Cookies("Forum").Expires = DateAdd("yyyy", 1, Now())
			End If	
			
			'Reset Server Objects
			rsCheckPassword.Close
			Set rsCheckPassword = Nothing
			Set adoCon = Nothing
			Set strCon = Nothing
			
		
			'Redirect the user back to the forum page they have just come from
			Response.Redirect strReturnPage & strReturnPageProperties
		End If
	End If
	
	'Reset Server Objects
	rsCheckPassword.Close
	Set rsCheckPassword = Nothing
End If
	
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing


'Replace the doble quotes we put in fpr the SQL back to single quote to display in the text box
strUsername = Replace(strUsername, "''", "'")
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Login User</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";

	//Check for a Username
	if (document.frmLogin.name.value==""){
		errorMsg += "\n\t<% = strTxtErrorUsername %>"; 	
	}
	
	//Check for a Password
	if (document.frmLogin.password.value==""){
		errorMsg += "\n\t<% = strTxtErrorPassword %>";
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

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

// -->
</script>
<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtLogin %></div><br>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br>
</div>
<%
'If the user has unsuccesfully tried logging in before then display a password incorrect error
If NOT strUsername = "" Then
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="lgText"><% = strTxtSorryUsernamePasswordIncorrect %><br>
      <% = strTxtPleaseTryAgain %></td>
  </tr>
</table>
<%
End If
%>
<form method="post" name="frmLogin" action="login_user.asp<% = strReturnPageProperties %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
    <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="30">
     <tr> 
      <td height="2" width="483" align="center"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="2">
           <tr> 
            <td align="right" width="31%"><span class="text"><% = strTxtUsername %>: </span>&nbsp;</td>
            <td width="69%"> 
             <input type="text" name="name" size="15" maxlength="15" value="<% = strUsername %>">
            </td>
           </tr>
           <tr> 
            <td align="right" width="31%"><span class="text"><% = strTxtPassword %>: </span>&nbsp; </td>
            <td width="69%"> 
             <input type="password" name="password" size="15" maxlength="15" >
            </td>
           </tr>
           <tr>
            <td align="right" width="31%">&nbsp;</td>
            <td width="69%" class="text"><span class="text"><input type="checkbox" name="AutoLogin" value="True" checked><% = strTxtAutoLogin %></span></td>
           </tr>
           <tr> 
            <td align="right" width="31%">&nbsp;</td>
            <td width="69%" class="text"><span class="text"><input type="checkbox" name="ActiveUsers" value="True" checked><% = strTxtAddMToActiveUsersList %></span> </td>
           </tr>
           <tr> 
            <td align="right" width="31%">&nbsp;<a href="http://www.webwizguide.info"></a></td>
            <td width="69%"> 
             <input type="submit" name="Submit" value="<% = strTxtLoginUser %>">
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
<table width="63%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td align="center" class="text"> 
      <%
	If blnEmail = True Then 
	%>
      <a href="JavaScript:openWin('forgotten_password.asp','forgot_pass','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=550,height=300')"><% = strTxtClickHereForgottenPass %></a><br>
      <br>
	  <%
	  End If
	  %>
      <% = strTxtMustBeRegistered %><br>
      <br>
      <a href="register_form.asp<% = strReturnPageProperties %>" target="_self"><% = strClickHereIfNotRegistered %></a><br>
      <br>
    </tr>
  </table>
  <script>frmLogin.name.focus()</script>
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
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
Dim rsForum			'Holds the recordset of the forum password
Dim strPassword			'Holds the forum password
Dim blnAutoLogin		'Holds whether the user wnats to be automactically logged in
Dim intForumID			'Holds the forum ID
Dim strForumCode		'Holds the users ID code
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page


'Get the forum page to return to
Select Case Request.QueryString("ReturnPage")
	Case "Topic"
		'Read in the forum and topic to return to
		strReturnPage = "display_forum_topics.asp"
		strReturnPageProperties = "?ReturnPage=" & Request.QueryString("ReturnPage") & "&ForumID=" & CInt(Request.QueryString("ForumID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Read in the thread and forum to return to
	Case "Thread"
		strReturnPage = "display_topic_threads.asp"
		strReturnPageProperties = "?ReturnPage=" & Request.QueryString("ReturnPage") & "&ForumID=" & CInt(Request.QueryString("ForumID")) & "&TopicID=" & CLng(Request.QueryString("TopicID")) & "&PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Read in the active topic page to return to
	Case "Active"
		strReturnPage = "active_topics.asp"
		strReturnPageProperties = "?PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Else return to the forum main page
	Case Else
		strReturnPage = "default.asp"
		strReturnPageProperties = "?ForumID=0"
End Select


'Read in the forum id number
intForumID = CInt(Request.QueryString("ForumID"))

'Read in the users details from the form
strPassword = Trim(Mid(Request.Form("password"), 1, 15))
blnAutoLogin = CBool(Request.Form("AutoLogin")) 
    
'If user has eneterd a password make sure it is correct
If NOT strPassword = "" Then
	
	'Create a recordset to get the forum details
	Set rsForum = Server.CreateObject("ADODB.Recordset")
	
	'Read in the forum name from the database
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblForum.Password, tblForum.Forum_code FROM tblForum WHERE Forum_ID = " & intForumID
	
	'Query the database
	rsForum.Open strSQL, strCon
	
	
	'If the query has returned a value to the recordset then check the password is correct
	If NOT rsForum.EOF Then
	
		'Check the password is correct, if it is get the user ID and set a cookie
		If LCase(strPassword) = LCase(rsForum("Password")) Then
			
			'Read in the users ID number and whether they want to be automactically logged in when they return to the forum
			strForumCode = rsForum("Forum_code")			
			
			'Write a cookie with the Forum ID number so the user logged in throughout the forum	
			'Write the cookie with the name Forum containing the value Forum Code number
			Response.Cookies("PrForum")("Forum" & intForumID) = strForumCode
			
			'If the user has selected to be remebered when they next login then set the expiry date for the cookie for 1 year
			If blnAutoLogin = True Then
				
				'Set the expiry date for 1 year (365 days)
				'If no expiry date is set the cookie is deleted from the users system 20 minutes after they leave the forum
				Response.Cookies("PrForum").Expires = Now() + 365
			End If	
			
			'Reset Server Objects
			rsForum.Close
			Set rsForum = Nothing
			Set adoCon = Nothing
			Set strCon = Nothing
			
		
			'Redirect the user back to the forum page they have just come from
			Response.Redirect strReturnPage & strReturnPageProperties
		End If
	End If
	
	'Clean up
	rsForum.Close
	Set rsForum = Nothing
End If
	


'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Forum Login</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";
	
	//Check for a Password
	if (document.frmLogin.password.value==""){
		errorMsg += "\n\t<% = strTxtErrorEnterPassword %>";
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
<div align="center" class="heading"><% = strTxtForumLogin %></div><br>
<div align="center"><a href="default.asp" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br>
  <span class="text"><% = strTxtPasswordRequiredForForum %></span><br>
  <br>
</div>
<%
'If the user has unsuccesfully tried logging in before then display a password incorrect error
If NOT strPassword = "" Then
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="lgText"><% = strTxtForumPasswordIncorrect %><br>
      <% = strTxtPleaseTryAgain %></td>
  </tr>
</table>
<%
End If
%>
<form method="post" name="frmLogin" action="forum_password_form.asp<% = strReturnPageProperties %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
  <table width="310" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="30">
    <tr> 
      <td height="2" width="483" align="center"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="2">
          <tr>
            <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>">
              <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td align="right" width="29%"><span class="text"><% = strTxtPassword %>:</span> 
                  </td>
                  <td width="71%"> 
                    <input type="password" name="password" size="15" maxlength="15" >
                  </td>
                </tr>
                <tr>   
         <td align="right" width="29%">&nbsp;</td>
         <td width="71%" class="text" valign="middle"><span class="text">
          <input type="checkbox" name="AutoLogin" value="True" checked><% = strTxtAutoLogin %></span></td>
                </tr>
                <tr> 
                  <td align="right" width="29%">&nbsp;<a href="http://www.webwizguide.info"></a></td>
                  <td width="71%"> 
                    <input type="submit" name="Submit" value="<% = strTxtLoginToForum %>">
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
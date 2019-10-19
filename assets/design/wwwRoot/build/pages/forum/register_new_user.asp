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


'Set the response buffer to true as we maybe redirecting and setting a cookie
Response.Buffer = True 


'Dimension variables
Dim rsAuthor			'Holds the Database Recordset for the new user
Dim rsSmut			'Holds the recordset for the swear filter
Dim strUsername			'Holds the new users username
Dim strPassword			'Holds the new users password
Dim strEmail			'Holds the new users e-mail address
Dim blnShowEmail		'Boolean set to true if the user wishes there e-mail address to be shown
Dim strLocation			'Holds the new users location
Dim strHomepage			'Holds the new users homepage if they have one
Dim strMessage			'Although the name does not suggest it this holds the users signature
Dim strAvatar			'Holds the avatar image
Dim blnUsernameOK		'Set to true if the username requested does not already exsist
Dim blnSentEmail		'Set to true if the e-mail has been sent
Dim strEmailBody		'Holds the body of the " & strTxtWelcome & " message e-mail
Dim lngUserID			'Holds the new users ID number
Dim blnAutoLogin		'Boolean set to true if the user wishes to be automactically logged in when they enter the forum
Dim strUserCode			'Holds a code for the user
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page
Dim strSubject			'Holds the subject of the e-mail
Dim strTempMessageQuote		'Temporary word hold for the first line of a quote
Dim strMessageQuote		'Holds the new first line of a quote
Dim lngQuoteStartPos		'Holds the start position for a quote
Dim lngQuoteEndPos		'Holds the end position of a quote
Dim strTempMessageLink		'Temporary word hold for e-mail and url words
Dim strMessageLink		'Holds the new mesage link
Dim lngLinkStartPos		'Holds the start position for a link
Dim lngLinkEndPos		'Holds the end position for a word
Dim blnEmailOK			'Set to true if e-mail is not already in the database
Dim strImageFileExtension	'holds the file extension


'Initialise variables
blnUsernameOK = True
blnEmailOK = True
blnShowEmail = False
blnAutoLogin = True


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
strEmail = Trim(Mid(Request.Form("email"), 1, 50))
blnShowEmail = CBool(Request.Form("emailShow"))
strLocation = Request.Form("location")
strHomepage = Trim(Mid(Request.Form("homepage"), 1, 38))
strMessage = Mid(Request.Form("signature"), 1, 200)
blnAutoLogin = CBool(Request.Form("Login"))

'If avatars are enabled then read in selected avatar
If blnAvatar = True Then

	strAvatar = Trim(Request.Form("txtAvatar"))
	
	'If the avatar text box is empty then read in the avatar from the list box
	If strAvatar = "http://" OR strAvatar = "" Then strAvatar = Trim(Request.Form("SelectAvatar"))
	
	'If the avatar is the blank image then the user doesn't want one
	If strAvatar = "avatars/blank.gif" Then strAvatar = ""
Else
	strAvatar = ""
End If

'If the user has not entered a homepage then make sure the homepage variable is blank
If strHomepage = "http://" Then strHomepage = ""

'Check there is a username
If strUsername = "" Then blnUsernameOK = False

'Make sure the user has not entered disallowed usernames
If InStr(1, strUsername, "admin", vbTextCompare) Then blnUsernameOK = False
If InStr(1, strUsername, "password", vbTextCompare) Then blnUsernameOK = False
If InStr(1, strUsername, "author", vbTextCompare) Then blnUsernameOK = False
If InStr(1, strUsername, "code", vbTextCompare) Then blnUsernameOK = False
If InStr(1, strUsername, "username", vbTextCompare) Then blnUsernameOK = False
If InStr(1, strUsername, "N0act", vbTextCompare) Then blnUsernameOK = False

'Clean up user input
strUsername = formatSQLInput(strUsername)
strEmail = formatLink(strEmail)
strEmail = formatInput(strEmail)
strHomepage = formatLink(strHomepage)
strHomepage = formatInput(strHomepage)


'Format the user signature by replacing characters with HTML equivelents
strMessage = Replace(strMessage, "<", "&lt;", 1, -1, 1)
strMessage = Replace(strMessage, ">", "&gt;", 1, -1, 1)
strMessage = Replace(strMessage, "       ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "      ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "     ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "    ", "&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "   ", "&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, vbTab, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, vbCrLf, "<br>" & vbCrLf, 1, -1, 1)


'Call the format_post.inc file to format the users signature
%><!--#include file="format_post.inc" --><%

'Call the code_check.asp file to remove malcious code
strMessage = checkImages(strMessage)
strMessage = checkLinks(strMessage)
strMessage = formatInput(strMessage)


'Remove malicious code form the avatar link or remove it all togtaher if not a web graphic
If strAvatar <> "" Then
	'If there is no . in the link then there is no extenison and so can't be an image
	If inStr(1, strAvatar, ".", 1) = 0 Then 
		strAvatar = ""
	'Else remove malicious code and check the extension is an image extension
	Else
		'Call the filter for the image
		strAvatar = formatLink(strAvatar)
		strAvatar = formatInput(strAvatar)
		
		
		'Get the file extension
		strImageFileExtension = Trim(Mid(strAvatar, (InstrRev(strAvatar, ".", (Len(strAvatar)), 1)), (Len(strAvatar))))
			
		'Check the file extension if it's not a web graphic then remove the extension
		If NOT (strImageFileExtension = ".gif" OR strImageFileExtension = ".jpg" OR strImageFileExtension = ".jpeg" OR strImageFileExtension = ".bmp" OR strImageFileExtension = ".png") Then
				strAvatar = Replace(strAvatar, strImageFileExtension, ".", 1, -1, 1)
		End If
	End If
End If


'Replace swear words with other words with ***
'Intialise the ADO recordset object
Set rsSmut = Server.CreateObject("ADODB.Recordset")
	
'Initalise the SQL string with a query to read in all the words from the smut table
strSQL = "SELECT tblSmut.* FROM tblSmut;"

'Open the recordset
rsSmut.Open strSQL, strCon

'Loop through all the words to check for
Do While NOT rsSmut.EOF
	
	'Replace the swear words with the words in the database the swear words
	strMessage = Replace(strMessage, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
	strUsername = Replace(strUsername, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
	strEmail = Replace(strEmail, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)

	'Move to the next word in the recordset
	rsSmut.MoveNext
Loop

'Release the smut recordset object
rsSmut.Close
Set rsSmut = Nothing




'Intialise the ADO recordset object
Set rsAuthor = Server.CreateObject("ADODB.Recordset")
	

'If the username is not already written off then check it's not already gone
If blnUsernameOK = True Then

	
	'Read in the the usernames from the database to check that the username does not already exsist
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Username FROM tblAuthor WHERE tblAuthor.Username = '" & strUsername & "';"
	
	'Query the database
	rsAuthor.Open strSQL, strCon
	
	'If there is a record returned from the database then the username is already used
	If NOT rsAuthor.EOF Then blnUsernameOK = False
	
	'Close the recordset
	rsAuthor.Close
	
	'Remove SQL safe single quote double up set in the format SQL function
	strUsername = Replace(strUsername, "''", "'", 1, -1, 1)
End If


'If e-mail activation is on then check the e-mail address is not already used
If blnEmailActivation = True Then
	
	'SQL safe format call
	strEmail = formatSQLInput(strEmail)
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.Author_email FROM tblAuthor WHERE tblAuthor.Author_email = '" & strEmail & "';"

	'Query the database
	rsAuthor.Open strSQL, strCon
	
	'If there is a record returned from the database then the username is already used
	If NOT rsAuthor.EOF Then blnEmailOK = False
	
	'Close recordset
	rsAuthor.Close
End If

'If the Username dose not already exsists then save the users details to the database
If blnUsernameOK = True AND blnEmailOK = True Then
	
	'Randomise the system timer
	Randomize Timer
	
	'Calculate a code for the user
	strUserCode = strUsername & (9776929856 * CInt((RND * 32000) + 100)) & Left(strPassword,1) & Right(strPassword,1)
	
	'Make the usercode SQL safe
	strUserCode = formatSQLInput(strUserCode)
	
	'Replace double quote with single in this intance
	strUserCode = Replace(strUserCode, "''", "'", 1, -1, 1)
	
	'Intialise the strSQL variable with an SQL string to open a record set for the Author table
	strSQL = "SELECT TOP 1 tblAuthor.* From tblAuthor ORDER By tblAuthor.Author_ID DESC;"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsAuthor.CursorType = 2
		
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsAuthor.LockType = 3
	
	'Open the author table
	rsAuthor.Open strSQL, strCon
	
	'Insert the new user's details into the NewUser recordset
	rsAuthor.AddNew
		
	rsAuthor.Fields("Username") = strUsername
	rsAuthor.Fields("Password") = strPassword
	rsAuthor.Fields("User_code") = strUserCode
	rsAuthor.Fields("Author_email") = strEmail
	rsAuthor.Fields("Show_email") = blnShowEmail
	rsAuthor.Fields("Homepage") = strHomepage
	rsAuthor.Fields("Location") = strLocation
	rsAuthor.Fields("Signature") = strMessage
	'If the e-mail activation is on then don't activate the account
	If blnEmailActivation = True Then
		rsAuthor.Fields("Active") = 0
	Else
		rsAuthor.Fields("Active") = 1
	End If
	rsAuthor.Fields("Avatar") = strAvatar
		
	
	'Update the database with the new user's details
	rsAuthor.Update
	
	'Re-run the NewUser query to read in the updated recordset from the database
	rsAuthor.Requery
	
	'Move to the last record in the recordset to get the new user's ID number
	rsAuthor.MoveLast
	
	'Read in the new user's ID number from the database
	lngUserID = CLng(rsAuthor("Author_ID"))
	
	'Reset server object
	rsAuthor.Close
	
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
	
	
	'Inititlaise the subject of the e-mail that may be sent in the next if/ifelse statements
	strSubject = "" & strTxtWelcome & " " & strTxtEmailToThe & " " & strTxtForum & " " & strTxtOf & " " & strWebsiteName
	
	'If email activation is on then send an email to activate the users membership
	If blnEmailActivation = True Then
		
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & decodeString(strUsername)
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailThankYouForRegistering & " " & strWebsiteName & " " & strTxtForum & "."
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtUsername & ": - " & decodeString(strUsername)
		strEmailBody = strEmailBody & vbCrLf & strTxtPassword & ": - " & decodeString(strPassword)
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtToActivateYourMembershipFor & " " & strWebsiteName & " " & strTxtForumClickOnTheLinkBelow & ": -"
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strForumPath & "/activate.asp?ID=" & Server.URLEncode(strUserCode)
		
		
		'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
		blnSentEmail = SendMail(strEmailBody, decodeString(strUsername), decodeString(strEmail), strWebsiteName, decodeString(strForumEmailAddress), strSubject, strMailComponent, false)
	
	'Send the new user a welcome e-mail if e-mail notification is turned on and the user has given an e-mail address
	ElseIf blnEmail = True AND NOT strEmail = "" Then
	
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & decodeString(strUsername)
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailThankYouForRegistering & " " & strWebsiteName & " " & strTxtForum & "."
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailYouCanNowUseTheForumAt & " " & strWebsiteName & " " & strTxtEmailForumAt & " " & strForumPath
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtUsername & ": - " & decodeString(strUsername)
		strEmailBody = strEmailBody & vbCrLf & strTxtPassword & ": - " & decodeString(strPassword)
		
		'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
		blnSentEmail = SendMail(strEmailBody, decodeString(strUsername), decodeString(strEmail), strWebsiteName, decodeString(strForumEmailAddress), strSubject, strMailComponent, false)
	End If
	
	'If email activation is on then send to the page telling the user to wait for an e-mail
	If blnEmailActivation = True Then
		
		'Reset Server Objects
		Set rsAuthor = Nothing
		Set adoCon = Nothing
		Set strCon = Nothing
	
		'Redirect to confirm page
		Response.Redirect "register_mail_confirm.asp" & strReturnPageProperties
	Else
		'Reset Server Objects
		Set rsAuthor = Nothing
		Set adoCon = Nothing
		Set strCon = Nothing
	
		'Redirect the user to the profile page
		Response.Redirect "profile.asp" & strReturnPageProperties & "&mode=newuser&profile=" & CLng(lngUserID)
	End If
End If
	
	
'Reset Server Objects
Set rsAuthor = Nothing
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
<div align="center"><a href="<% = strReturnPage &  strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br>
</div>
<%
If blnEmailOK = False Then
	%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="text"><% = strTxtEmailAddressAlreadyUsed %></td>
  </tr>
</table>	
<%	
Else
%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center" class="text"><% = strTxtUsrenameGone %></td>
  </tr>
</table>
<form method="post" name="frmRegister" action="register_new_user.asp<% = strReturnPageProperties %>" onSubmit="return CheckForm();">
  <table width="300" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="30">
    <tr> 
      <td height="2" width="483" align="center"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr>
            <td bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="right" width="27%"><span class="text"><% = strTxtUsername %>:</span>&nbsp;</td>
                  <td width="73%"> 
                    <input type="text" name="name" size="15" maxlength="15" >
                    <input type="submit" name="Submit" value="Register">
                    <input type="hidden" name="password" value="<% = strPassword %>">
                    <input type="hidden" name="email" value="<% = strEmail %>">
                    <input type="hidden" name="emailShow" value="<% = blnShowEmail %>">
                    <input type="hidden" name="location" value="<% = strLocation %>">
                    <input type="hidden" name="homepage" value="<% = strHomepage %>">
                    <input type="hidden" name="Login" value="<% = blnAutoLogin %>"> 
                    <input type="hidden" name="signature" value="<% = Request.Form("signature") %>">
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
<%
End If
%>
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
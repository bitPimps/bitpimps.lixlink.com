<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->

<!--#include file="send_mail_function.inc" -->
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


'Set the response buffer to true as we maybe redirecting
Response.Buffer = True


'Dimension variables
Dim rsProfile 			'Holds the Database Recordset for the author profile
Dim rsProfileUpdate		'Holds the databse recordset to be updated
Dim rsSmut			'Holds the recordset for the swear filter
Dim strPassword			'Holds the new users password
Dim strUserCode			'Holds the unique user code for the user
Dim strEmail			'Holds the new users e-mail address
Dim blnShowEmail		'Boolean set to true if the user wishes there e-mail address to be shown
Dim strLocation			'Holds the new users location
Dim strHomepage			'Holds the new users homepage if they have one
Dim strAvatar			'Holds the avatar image
Dim strCheckUsername		'Holds the usernames from the database recordset to check against the new users requested username
Dim blnAutoLogin		'Boolean set to true if the user wants auto login trured on
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page
Dim strImageFileExtension	'holds the file extension
Dim blnAccountReactivate	'Set to true if the users account needs to be reactivated
Dim blnSentEmail		'Set to true if the e-mail has been sent
Dim strEmailBody		'Holds the body of the " & strTxtWelcome & " message e-mail
Dim strSubject			'Holds the subject of the e-mail


'Initalise variables
blnShowEmail = False
blnAutoLogin = True
blnAccountReactivate = False


'If the user has not logged in then redirect them to the main forum page
If lngLoggedInUserID = 0 OR blnActiveMember = False OR lngLoggedInUserID = 2 Then Response.Redirect "insufficient_permission.asp"


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

'If the Profile has already been edited then update the Profile
If Request.Form("mode") = "update" Then
	
	'Read in the users details from the form
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
		
		'If there is no new avatar selected then get the old one if there is one
		If strAvatar = "" Then strAvatar = Request.Form("oldAvatar")
		
		'If the avatar is the blank image then the user doesn't want one
		If strAvatar = "avatars/blank.gif" Then strAvatar = ""
	Else
		strAvatar = ""
	End If
	
	'Clean up user input
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
		strEmail = Replace(strEmail, rsSmut("Smut"), rsSmut("Word_replace"), 1, -1, 1)
	
		'Move to the next word in the recordset
		rsSmut.MoveNext
	Loop
	
	'Release the smut recordset object
	Set rsSmut = Nothing
	
	'If the user has not entered a hoempage then make sure the homepage variable is blank
	If strHomepage = "http://" Then strHomepage = ""
	
	'Randomise the system timer
	Randomize Timer
	
	'Calculate a code for the user
	strUserCode = strLoggedInUsername & (987656342 * CInt((RND * 32000) + 100)) & Left(strPassword,1) & Right(strPassword,1)
		
	'Make the usercode SQL safe
	strUserCode = formatSQLInput(strUserCode)
	
	'Replace double quote with single in this intance
	strUserCode = Replace(strUserCode, "''", "'", 1, -1, 1)
		
	'Intialise the ADO recordset object
	Set rsProfileUpdate = Server.CreateObject("ADODB.Recordset")
	
	'Intialise the strSQL variable with an SQL string to open a record set for the Author table
	strSQL = "SELECT tblAuthor.* From tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Author_ID =" & lngLoggedInUserID & ";"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsProfileUpdate.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsProfileUpdate.LockType = 3
	
	'Open the author table
	rsProfileUpdate.Open strSQL, strCon
	
	
	'If e-mail activation is on then check the user has not changed there e-mail address
	If blnEmailActivation = True AND lngLoggedInUserID <> 1 Then
		'If the old and new e-mail addresses don't match set the reactivation boolean to true
		If rsProfileUpdate("Author_email") <> strEmail Then blnAccountReactivate = True
	End If
	
		
	'Insert the new user's details into the NewUser recordset
	rsProfileUpdate.Fields("Password") = strPassword
	rsProfileUpdate.Fields("User_code") = strUserCode
	rsProfileUpdate.Fields("Author_email") = strEmail
	rsProfileUpdate.Fields("Show_email") = blnShowEmail
	rsProfileUpdate.Fields("Homepage") = strHomepage
	rsProfileUpdate.Fields("Location") = strLocation
	rsProfileUpdate.Fields("Signature") = strMessage
	rsProfileUpdate.Fields("Avatar") = strAvatar
	'If the account needs to be reacativated then set the acitive field to false
	If blnAccountReactivate = True Then
		rsProfileUpdate.Fields("Active") = 0
	End If
			
	'Update the database with the new user's details
	rsProfileUpdate.Update	
	
	'Re-run the query to read in the updated recordset from the database
	rsProfileUpdate.Requery	
	
	'Write a cookie with the User ID number so the user logged in throughout the forum	
	'Write the cookie with the name Forum containing the value UserID number
	Response.Cookies("Forum")("UserID") = strUserCode
	
	'If the user has selected to be remebered when they next login then set the expiry date for the cookie for 1 year
	If blnAutoLogin = True Then
				
		'Set the expiry date for 1 year (365 days)
		'If no expiry date is set the cookie is deleted from the users system 20 minutes after they leave the forum
		Response.Cookies("Forum").Expires = Now() + 365
	End If	
	
	'If the members account needs to be reactivated then send the member a re-activate mail a redirect them to a page to tell them there account needs re-activating
	If blnAccountReactivate = True Then
		
		'Send an e-mail to enable the users account to be reactivated
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & decodeString(rsProfileUpdate("Username"))
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtEmailThankYouForRegistering & " " & strWebsiteName & " " & strTxtForum & "."
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtUsername & ": - " & decodeString(rsProfileUpdate("Username"))
		strEmailBody = strEmailBody & vbCrLf & strTxtPassword & ": - " & decodeString(strPassword)
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtToActivateYourMembershipFor & " " & strWebsiteName & " " & strTxtForumClickOnTheLinkBelow & ": -"
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strForumPath & "/activate.asp?ID=" & Server.URLEncode(strUserCode)
		
		'Send the e-mail using the Send Mail function created on the send_mail_function.inc file
		blnSentEmail = SendMail(strEmailBody, decodeString(rsProfileUpdate("Username")), decodeString(strEmail), strWebsiteName, decodeString(strForumEmailAddress), strSubject, strMailComponent, false)
	
		'Reset server Object
		rsProfileUpdate.Close
		Set rsProfileUpdate = Nothing
		Set adoCon = Nothing
		Set strCon = Nothing	
		
		'Redirect the reactivate page
		Response.Redirect "register_mail_confirm.asp" & strReturnPageProperties & "&mode=reactivate"
	End If
	
	'Reset server Object
	rsProfileUpdate.Close
	Set rsProfileUpdate = Nothing	
	Set adoCon = Nothing
	Set strCon = Nothing
	
	
	'Redirect the user to the profile page
	Response.Redirect "profile.asp" & strReturnPageProperties & "&profile=" & lngLoggedInUserID 
	
End If


'Intialise the ADO recordset object
Set rsProfile = Server.CreateObject("ADODB.Recordset")
	
'Read the various forums from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblAuthor.* "
strSQL = strSQL & "FROM tblAuthor "
strSQL = strSQL & "WHERE tblAuthor.Author_ID = " & lngLoggedInUserID
		
'Query the database
rsProfile.Open strSQL, strCon
	
'If there is no matching profile returned by the recordset then redirect the user to the main forum page
If rsProfile.EOF Then Response.Redirect "default.asp"
		
'Read in the new user's profile from the recordset
strPassword = rsProfile("Password")
strEmail = rsProfile("Author_email")
blnShowEmail = CBool(rsProfile("Show_email"))
strHomepage = rsProfile("Homepage")
strLocation = rsProfile("Location")
strMessage = rsProfile("Signature") & ""
strAvatar = rsProfile("Avatar")


'Reset Server Objects
rsProfile.Close
Set rsProfile = Nothing
Set adoCon = Nothing
Set strCon = Nothing


'Profile edit used below to edit the signature file
%>
<!--#include file="edit_post.inc" -->
<HTML> 
<HEAD>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Edit Profile</TITLE>


<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001
    	 If you want your forum then goto http://www.webwizforums.com --> 


<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Initialise variables
	var errorMsg = "";
	var errorMsgLong = "";
	
	//Check for a password
	if (document.frmRegister.password.value.length <= 3){
		errorMsg += "\n\t<% = strTxtErrorPasswordChar %>";
	}
	
	//Check both passwords are the same
	if ((document.frmRegister.password.value) != (document.frmRegister.password2.value)){
		errorMsg += "\n\t<% = strTxtErrorPasswordNoMatch %>";
		document.frmRegister.password.value = ""
		document.frmRegister.password2.value = ""		
	}
	
	
	//If an e-mail is entered check that the e-mail address is valid
	if (<%
'If e-mail activation is on check that the e-mail address entered is correct
If blnEmailActivation = True Then
	Response.Write("document.frmRegister.email.value == """" || ")
Else 
	Response.Write("document.frmRegister.email.value.length >0 && ")
End If	
		%>(document.frmRegister.email.value.indexOf("@",0) == -1||document.frmRegister.email.value.indexOf(".",0) == -1)) { 
		errorMsg +="\n\t<% = strTxtErrorValidEmail %>";
<%
'If e-mail activation is not on display a long error message to the user if they enter an incorrect e-mail addres
If NOT blnEmailActivation = True Then Response.Write("		errorMsgLong += ""\n- " & strTxtErrorValidEmailLong & """; ")
%>
	}
	
	//Check to make sure the user is not trying to show there e-mail if they hav not entered one
	if (document.frmRegister.email.value == "" && document.frmRegister.emailShow[0].checked == true){
		errorMsgLong += "\n- <% = strTxtErrorNoEmailToShow %>";
		document.frmRegister.emailShow[1].checked = true
		document.frmRegister.email.focus();
	}
	
	//Check that the signature is not above 200 chracters
	if (document.frmRegister.signature.value.length > 200){
		errorMsg += "\n\t<% = strTxtErrorSignatureToLong %>";
		errorMsgLong += "\n- <% = strTxtYouHave %> " + document.frmRegister.signature.value.length + " <% = strTxtCharactersInYourSignatureToLong %>"; 
	}
		
	
	//If there is aproblem with the form then display an error
	if ((errorMsg != "") || (errorMsgLong != "")){
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";
		
		errorMsg += alert(msg + errorMsg + "\n" + errorMsgLong);
		return false;
	}
	
	return true;
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

//Function to count the number of characters in the signature text box
function DescriptionCharCount() {
	document.frmRegister.countcharacters.value = document.frmRegister.signature.value.length;	
}

//Function to open preview signature window
function OpenPreviewWindow(){
	
	now = new Date
	strMessage = escape(document.frmRegister.signature.value);
   	document.cookie = "Signature=" + strMessage
   		
   	openWin('signature_preview.asp?ID=' + now.getTime(),'preview','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=680,height=300')
}
// -->
</script>

<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtEditProfile %></div>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br><br></div>
<form method="post" name="frmRegister" action="profile_edit.asp<% = strReturnPageProperties %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
    <table width="630" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>">
     <tr> 
      <td height="253" width="680"> 
       <table width="100%" border="0" align="center"  height="233" cellpadding="4" cellspacing="1">
        <tr bgcolor="<% = strTableTitleColour %>"> 
      <td colspan="2" align="left" background="<% = strTableTitleBgImage %>"><span class="text">*<% = strTxtRequiredFields %></span></td>
     </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" > 
         <td align="left" width="56%" height="27"  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text"><% = strTxtUsername %></td>
         <td height="27" width="44%" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text"><% = strLoggedInUsername %><input type="hidden" name="mode" value="update">
         </td>
     </tr>
     <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text"><% = strTxtPassword %>*</td>
         <td height="12" width="44%" valign="top" background="<% = strTableBgImage %>"><input type="password" name="password" size="15" maxlength="15" value="<% = strPassword %>" ></td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtRetypePassword %>*</td>
         <td width="44%" valign="top" height="2" background="<% = strTableBgImage %>"><input type="password" name="password2" size="15" maxlength="15" value="<% = strPassword %>"></td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="23" class="text" background="<% = strTableBgImage %>"><% = strTxtEmail %><% 
If blnEmailActivation = True Then 
	Response.Write("*<br><span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtCahngeOfEmailReactivateAccount & "</span><br>") 
Else
	Response.Write("	 <br><span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtProfileEmailLong & "</span><br>")
End If

         %></td>
         <td height="23" width="44%" valign="top" background="<% = strTableBgImage %>"> 
          <input type="text" name="email" size="30" maxlength="50" value="<% = strEmail %>">&nbsp;</td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtShowHideEmail %>
          <br><span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtShowHideEmailLong %></span></td>
         <td height="12" width="44%" valign="top" class="text" background="<% = strTableBgImage %>"><% = strTxtShowEmail %><input type="radio" name="emailShow" value="True" <% If blnShowEmail = True Then Response.Write "checked" %>>
       &nbsp;&nbsp;&nbsp;<% = strTxtHideEmail %><input type="radio" name="emailShow" value="False" <% If blnShowEmail = False Then Response.Write "checked" %>>
         </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtLocation %></td>
         <td height="12" width="44%" background="<% = strTableBgImage %>"> 
          <select name=location>
        <option value="<% = strLocation %>" selected><% If strLocation = "" Then Response.Write "-- " & strTxtSelectCountry & " --" Else Response.Write strLocation %></option>
        <!-- Include countires include file -->
        <!-- #include file="select_countries_list.inc" -->
       </select>
         </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtHomepage %></td>
         <td height="12" width="44%" background="<% = strTableBgImage %>"> 
          <input type="text" name="homepage" size="30" maxlength="38" value="<% If strHomepage = "" Then Response.Write "http://" Else Response.Write strHomepage %>">
         </td>
     </tr>
     <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="13" class="text" background="<% = strTableBgImage %>"><% = strTxtProfileAutoLogin %></td>
         <td height="13" width="44%" valign="top" class="text" background="<% = strTableBgImage %>"><% = strTxtYes %><input type="radio" name="Login" value="True" <% If blnAutoLogin = True Then Response.Write "checked" %>>
       &nbsp;&nbsp;<% = strTxtNo %><input type="radio" name="Login" value="False" <% If blnAutoLogin = False Then Response.Write "checked" %>>
         </td>
     </tr><%
'If avatars are enabled then let the user select an avatar
If blnAvatar = True Then
%>
     <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>">
         <td valign="top" height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtSelectAvatar %>
          <br><span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtSelectAvatarDetails %></span></td>
         <td valign="top" height="2" background="<% = strTableBgImage %>" > 
          <table width="290" border="0" cellspacing="0" cellpadding="1">
        <tr> 
         <td width="168"> 
          <select name="SelectAvatar" size="4" onChange="(avatar.src = SelectAvatar.options[SelectAvatar.selectedIndex].value) && (txtAvatar.value='http://') && (oldAvatar.value='')">
           <option value="avatars/blank.gif"><% = strTxtNoneSelected %></option>
           <!-- #include file="select_avatar.inc" -->
          </select>
         </td>
         <td width="122" align="center"><img src="<%
'If there is an avatar then display it
If strAvatar <> "" Then
	Response.Write(strAvatar)
Else
	Response.Write("avatars/blank.gif")
End If
		%>" width="32" height="32" name="avatar"> 
          <input type="hidden" name="oldAvatar" value="<% = strAvatar %>"></td>
        </tr>
        <tr> 
         <td width="168"> 
          <input type="text" name="txtAvatar" size="30" maxlength="95" value="<% 
'If the avatar is the persons own then display the link
If InStr(1, strAvatar, "http://") > 0 Then 
	Response.Write(strAvatar) 
Else  
	Response.Write("http://")
End If
	%>" onChange="oldAvatar.value=''">
         </td>
         <td width="122"> 
          <input type="button" name="preview" value="<% = strTxtPreview %>" onClick="avatar.src = txtAvatar.value">
         </td>
        </tr>
       </table>
         </td>
     </tr><%
End If
%>
     <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td valign="top" height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtSignature %><br>
          <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtSignatureLong %>&nbsp;(max 200 characters)<br>
          <br>
          </span><span style="font-size: <% = intSmallFontSize %>px;"><a href="javascript:OpenPreviewWindow()" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtSignaturePreview %></a><br>
          <a href="JavaScript:openWin('forum_codes.asp','codes','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=550,height=400')" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtForumCodes %></a> <% = strTxtForumCodesInSignature %></span></td>
         <td valign="top" height="2" background="<% = strTableBgImage %>"> 
          <textarea name="signature" cols="30" rows="3" onKeyDown="DescriptionCharCount();" onKeyUp="DescriptionCharCount();"><% = strMessage %></textarea>
         <br><input size="3" value="0" name="countcharacters" maxlength="3">
          <input onClick="DescriptionCharCount();" type="button" value="<% = strTxtCharacterCount %>" name="Count">
         </td>
     </tr>
     <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td valign="top" height="2" colspan="2" align="center" background="<% = strTableBgImage %>"> 
          <p> 
        <input type="submit" name="Submit" value="<% = strTxtUpdateProfile %>">
        <input type="reset" name="Reset" value="<% = strTxtResetForm %>">
       </p>
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
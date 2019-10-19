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


'Set the response buffer to true as we maybe redirecting
Response.Buffer = True 


'Dimension variables
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page


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

'Reset server objects
Set adoCon = Nothing
Set strCon = Nothing

'Redirect if not been through the registration process
If NOT Request.Form("Reg") = "OK" Then
	Response.Redirect "registration_rules.asp" & strReturnPageProperties
End If
%>
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Register New User</TITLE>

<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001
    	 If you want your forum then goto http://www.webwizforums.com --> 

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";
	var errorMsgLong = "";

	//Check for a username
	if (document.frmRegister.name.value.length <= 3){
		errorMsg += "\n\t<% = strTxtErrorUsernameChar %>";
	}
	
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
<div align="center" class="heading"><% = strTxtRegisterNewUser %></div>
<div align="center"><a href="<% = strReturnPage &  strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <span class="text"><br><% = strTxtMustBeRegistered %></span></div>
<form method="post" name="frmRegister" action="register_new_user.asp<% = strReturnPageProperties %>" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
    <table width="630" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>">
     <tr> 
      <td height="253" width="680"> 
       <table width="100%" border="0" align="center"  height="233" cellpadding="4" cellspacing="1">
        <tr align="left" bgcolor="<% = strTableTitleColour %>"> 
         <td colspan="2" class="text" background="<% = strTableTitleBgImage %>">*<% = strTxtRequiredFields %></td>
        </tr>
        <tr background="<% = strTableBgImage %>"> 
         <td align="left" width="56%" height="27"  bgcolor="<% = strTableColour %>" class="text" background="<% = strTableBgImage %>"><% = strTxtUsername %>*<br>
          <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtProfileUsernameLong %></span></td>
         <td height="27" width="44%" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
          <input type="text" name="name" size="15" maxlength="15" >
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%" height="12" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" class="text"><% = strTxtPassword %>*</td>
         <td height="12" width="44%" valign="top" background="<% = strTableBgImage %>"> 
          <input type="password" name="password" size="15" maxlength="15" >
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtRetypePassword %>*</td>
         <td width="44%" valign="top" height="2" background="<% = strTableBgImage %>"> 
          <input type="password" name="password2" size="15" maxlength="15" >
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="23" class="text" background="<% = strTableBgImage %>"><% = strTxtEmail %><% 
If blnEmailActivation = True Then 
	Response.Write("*<br><span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtEmailRequiredForActvation & "</span><br>") 
Else
	Response.Write("	 <br><span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtProfileEmailLong & "</span><br>")
End If

         %></td>
         <td height="23" width="44%" valign="top" background="<% = strTableBgImage %>"> 
          <input type="text" name="email" size="30" maxlength="50">&nbsp;</td>
        </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtShowHideEmail %><br>
          <span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtShowHideEmailLong %></span></td>
         <td height="12" width="44%" valign="top" class="text" background="<% = strTableBgImage %>"><% = strTxtShowEmail %>
          <input type="radio" name="emailShow" value="True">&nbsp;&nbsp;&nbsp;<% = strTxtHideEmail %>
          <input type="radio" name="emailShow" value="False" checked>
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtLocation %></td>
         <td height="12" width="44%" background="<% = strTableBgImage %>"> 
          <select name=location>
           <option value="" selected>-- <% = strTxtSelectCountry %> --</option>
           <!-- Include countires include file -->
           <!-- #include file="select_countries_list.inc" -->
          </select>
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="12" class="text" background="<% = strTableBgImage %>"><% = strTxtHomepage %><a href="http://www.webwizguide.info"></a></td>
         <td height="12" width="44%" background="<% = strTableBgImage %>"> 
          <input type="text" name="homepage" size="30" maxlength="38" value="http://">
         </td>
        </tr>
        <tr  bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="56%"  height="13" class="text" background="<% = strTableBgImage %>"><% = strTxtProfileAutoLogin %></td>
         <td height="13" width="44%" valign="top" class="text" background="<% = strTableBgImage %>"><% = strTxtYes %><input type="radio" name="Login" value="True" checked>&nbsp;&nbsp;<% = strTxtNo %><input type="radio" name="Login" value="False">
         </td>
        </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" align="left">
         <td height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtAddMToActiveUsersList %></td>
         <td height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtYes %><input type="radio" name="ActiveUsers" value="True" checked>&nbsp;&nbsp;<% = strTxtNo %><input type="radio" name="ActiveUsers" value="False">
         </td>
        </tr><%
        
'If avatars are enabled then let the user select an avatar
If blnAvatar = True Then
%>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" align="left"> 
         <td valign="top" height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtSelectAvatar %>
          <br><span style="font-size: <% = intSmallFontSize %>px;"><% = strTxtSelectAvatarDetails %></span></td>
         <td valign="top" height="2" background="<% = strTableBgImage %>" > 
          <table width="290" border="0" cellspacing="0" cellpadding="1">
           <tr> 
            <td width="168"> 
             <select name="SelectAvatar" size="4" onChange="(avatar.src = SelectAvatar.options[SelectAvatar.selectedIndex].value) && (txtAvatar.value='http://')">
              <option value="avatars/blank.gif"><% = strTxtNoneSelected %></option>
              <!-- #include file="select_avatar.inc" -->
             </select>
            </td>
            <td width="122" align="center"><img src="avatars/blank.gif" width="32" height="32" name="avatar"></td>
           </tr>
           <tr> 
            <td width="168"> 
             <input type="text" name="txtAvatar" size="30" maxlength="95" value="http://">
            </td>
            <td width="122"> 
             <input type="button" name="Submit2" value="<% = strTxtPreview %>" onClick="avatar.src = txtAvatar.value">
            </td>
           </tr>
          </table>
         </td>
        </tr>
        <%
End If
%>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" align="left"> 
         <td valign="top" height="2" class="text" background="<% = strTableBgImage %>"><% = strTxtSignature %>
          <br>
          <span style="font-size: <% = intSmallFontSize %>px;"> 
          <% = strTxtSignatureLong %>
          &nbsp;(max 200 characters)<br>
          <br>
          <br>
          </span><span style="font-size: <% = intSmallFontSize %>px;"><a href="javascript:OpenPreviewWindow()" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtSignaturePreview %></a><br>
          <a href="JavaScript:openWin('forum_codes.asp','codes','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=550,height=400')" style="font-size: <% = intSmallFontSize %>px;"><% = strTxtForumCodes %></a> <% = strTxtForumCodesInSignature %></span></td>
         <td valign="top" height="2" background="<% = strTableBgImage %>"> 
          <textarea name="signature" cols="30" rows="3" onKeyDown="DescriptionCharCount();" onKeyUp="DescriptionCharCount();"></textarea>
          <br><input size="3" value="0" name="countcharacters" maxlength="3">
          <input onClick="DescriptionCharCount();" type="button" value="<% = strTxtCharacterCount %>" name="Count">
         </td>
        </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>" align="center"> 
         <td valign="top" height="2" colspan="2" background="<% = strTableBgImage %>"> 
          <p> 
           <input type="submit" name="Submit" value="<% = strTxtRegister %>">
           <input type="reset" name="Reset" value="<% = strTxtClearForm %>">
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
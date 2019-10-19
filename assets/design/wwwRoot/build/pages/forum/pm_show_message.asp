<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="forum_permissions.inc" -->
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

'Set the buffer to true
Response.Buffer = True

'Declare variables
Dim rsPmMessage			'ADO recordset object holding the users private messages
Dim lngPmMessageID		'Private message id
Dim strPmSubject 		'Holds the subject of the private message
Dim strMessage			'Holds the message body of the thread
Dim lngMessageID		'Holds the message ID number
Dim lngUserID			'Holds the ID number of the user
Dim dtmTopicDate		'Holds the date the thread was made
Dim strUsername 		'Holds the Username of the thread
Dim strAuthorHomepage		'Holds the homepage of the Username if it is given
Dim strAuthorLocation		'Holds the location of the user if given
Dim strAuthorAvatar		'Holds the authors avatar	
Dim strAuthorSignature		'Holds the authors signature
Dim lngAuthorNumOfPosts		'Holds the number of posts the user has made to the forum
Dim dtmAuthorRegistration	'Holds the registration date of the user
Dim lngNumberOfViews		'Holds the number of times the topic has been viewed to save back to the database
Dim intStatus			'Holds the users interger status
Dim strStatus			'Holds the users status
Dim intTotalNumOfPages		'Holds the total number of pages in the recordset
Dim intRecordLoopCounter	'Holds the loop counter numeber
Dim intTopicPageLoopCounter	'Holds the number of pages there are of pm messages
Dim strEmailBody		'Holds the body of the e-mail message
Dim strEmailSubject		'Holds the subject of the e-mail
Dim blnEmailSent		'set to true if an e-mail is sent


'Raed in the pm mesage number to display
lngPmMessageID = CLng(Request.QueryString("ID"))

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")



'Intialise the ADO recordset object
Set rsPmMessage = Server.CreateObject("ADODB.Recordset")
	
'Initlise the sql statement
strSQL = "SELECT tblPMMessage.*, tblAuthor.Username, tblAuthor.Homepage, tblAuthor.Location, tblAuthor.Author_email, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Signature, tblAuthor.Active, tblAuthor.Status, tblAuthor.Avatar "
strSQL = strSQL & "FROM tblAuthor INNER JOIN tblPMMessage ON tblAuthor.Author_ID = tblPMMessage.From_ID "
strSQL = strSQL & "WHERE tblPMMessage.PM_ID=" & lngPmMessageID & " AND tblPMMessage.Author_ID=" & lngLoggedInUserID & ";"

'Query the database
rsPmMessage.Open strSQL, strCon


'If a mesage is found then send a mail if the sender wants notifying
If NOT rsPmMessage.EOF Then 
	
	'Read in some of the details
	strPmSubject = rsPmMessage("PM_Tittle")
	strUsername = rsPmMessage("Username")
	
	'If the sender wants notifying then send a mail as long as e-mail notify is on and the message hasn't already been read
	If CBool(rsPmMessage("Email_notify")) = True AND rsPmMessage("Author_email") <> "" AND blnEmail = True AND CBool(rsPmMessage("Read_Post")) = False Then
		
		'Set the subject
		strEmailSubject = strWebsiteName & " " & strTxtNotificationPM
	
		'Initailise the e-mail body variable with the body of the e-mail
		strEmailBody = strTxtHi & " " & decodeString(strUsername) & ","
		strEmailBody = strEmailBody & vbCrLf & vbCrLf & strTxtThisIsToNotifyYouThat & " " & strLoggedInUsername & " " & strTxtHasReadPMYouSentThem & " " & strWebsiteName & " " & strTxtForum & "."
		
		
		'Call the function to send the e-mail
		blnEmailSent = SendMail(strEmailBody, decodeString(strUsername), decodeString(rsPmMessage("Author_email")), strWebsiteName, decodeString(strForumEmailAddress), strEmailSubject, strMailComponent, false)
	
	End If
End If

'Inittilise the sql veriable to update the database
strSQL = "UPDATE tblPMMessage SET tblPMMessage.Read_Post = 1 WHERE tblPMMessage.PM_ID=" & lngPmMessageID & ";"

'Execute the sql statement to set the pm to read
adoCon.Execute(strSQL)

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Private Messenger: <% = strPmSubject %></title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
// -->
</script>

<!-- #include file="header.inc" -->
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td class="text"><% = strTxtWelcome & " " &  strLoggedInUsername %></td>
  <td align="right"> 
   <a href="profile_edit.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>edit_profile.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtEditProfile %>"></a>&nbsp;<a href="log_off_user.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>log_off.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtLogOff %>" border="0" align="absmiddle"></a>
   <a href="search_form.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>search.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" align="absmiddle" border="0" alt="<% = strTxtSearchTheForum %>"></a> 
   <a href="forum_members.asp?ReturnPage=pm" target="_self"><img src="<% = strImagePath %>members_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" align="absmiddle" alt="<% = strTxtMembersList %>"></a> 
  </td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="3" align="center">
 <tr> 
  <td align="left" width="64%" > <img src="<% = strImagePath %>folder_icon.gif" border="0" align="bottom">&nbsp;<a href="default.asp" target="_self"><% = strTxtAllForums %></a><br>
   <img src="<% = strImagePath %>folder_line.gif">&nbsp;<img src="<% = strImagePath %>open_folder_icon.gif">&nbsp;<a href="pm_welcome.asp" target="_self"><% = strTxtPrivateMessenger %></a></td>
  <td align="right" width="36%" >&nbsp;<!-- #include file="pm_check.inc" --></td>
 </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="2" align="center">
 <tr>
  <td width="65%"><span class="lgText"><img src="<% = strImagePath %>subject_folder.gif" alt="<% = strTxtSubjectFolder %>" align="absmiddle"> <% = strTxtPrivateMessenger %></span></td>
  <td align="right" width="35%"><a href="pm_inbox.asp?PagePosition=<% = Request.QueryString("Page") %>" target="_self"><img src="<% = strImagePath %>inbox.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtInbox %>" border="0"></a>&nbsp;<a href="pm_buddy_list.asp" target="_self"><img src="<% = strImagePath %>buddy_list.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtPrivateMessenger & " " & strTxtBuddyList %>" border="0"></a>&nbsp;<a href="pm_new_message_form.asp" target="_self"><img src="<% = strImagePath %>new_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" alt="<% = strTxtNewPrivateMessage %>" border="0"></a></td>
 </tr>
 <tr> 
  <td width="60%"><span class="lgText"><% = strPmSubject %></span></td>
  <td align="right" width="40%"><a href="pm_new_message_form.asp?code=reply&pm=<% = rsPmMessage("PM_ID") %>"><img src="<% = strImagePath %>reply_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" alt="<% = strTxtReplyToPrivateMessage %>"></a>&nbsp;<a href="pm_buddy_list.asp?name=<% = Server.URLEncode(strUsername) %>"><img src="<% = strImagePath %>add_buddy.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" alt="<% = strTxtAddToBuddy %>"></a>&nbsp;<a href="pm_delete_message.asp?pm_id=<% = rsPmMessage("PM_ID") %>&Page=<% = Request.QueryString("Page") %>" OnClick="return confirm('<% = strTxtDeletePrivateMessageAlert %>')"><img src="<% = strImagePath %>delete_private_message.gif" width="<% = intButtonWidth %>" height="<% = intButtonHeight %>" border="0" alt="<% = strTxtDelete %>"></a></td>
 </tr>
</table><%
'If no private message display an error
IF rsPmMessage.EOF Then
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="166">
 <tr>
  <td align="center" class="heading" height="120"><% = strTxtYouDoNotHavePermissionViewPM %></td>
 </tr>
</table><%
'Else display the message
Else
	'Read in threads details for the topic from the database
	strMessage = rsPmMessage("PM_Message")
	lngUserID = CLng(rsPmMessage("From_ID"))
	dtmTopicDate = CDate(rsPmMessage("PM_Message_Date")) 
	strAuthorHomepage = rsPmMessage("Homepage")
	strAuthorLocation = rsPmMessage("Location")
	dtmAuthorRegistration = CDate(rsPmMessage("Join_date"))
	lngAuthorNumOfPosts = CLng(rsPmMessage("No_of_posts"))
	intStatus = CInt(rsPmMessage("Status"))
	strAuthorAvatar = rsPmMessage("Avatar")
	
	'Place the details into a session vraiable fro the reply
	Session("Subject") = strPmSubject
	
	'Turn the members status number returned from the database into a string value
	Select Case intStatus
		'Guest status
		Case 0
			strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtGuest & "</span><br><img src=""" & strImagePath & "0_star_rating.gif"" alt=""" & strTxtGuest & """>"
		'Standard member status
		Case 1
			strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtStandardMember & "</span><br><img src=""" & strImagePath & "1_star_rating.gif"" alt=""" & strTxtStandardMember & """>"
		'Super member status
		Case 2
			strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtGoldMember & "</span><br><img src=""" & strImagePath & "2_star_rating.gif"" alt=""" & strTxtGoldMember & """>"
		'Power member status
		Case 3
			strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtPlatinumMember & "</span><br><img src=""" & strImagePath & "3_star_rating.gif"" alt=""" & strTxtPlatinumMember & """>"
	End select			
		
	'If the user is admin or this forums then display so
	If lngUserID = 1 Then strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtForumAdmin & "</span><br><img src=""" & strImagePath & "5_star_rating.gif"" alt=""" & strTxtForumAdministrator & """>"


%>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>" align="center">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strBehindBgColour %>" height="145">
    <tr> 
     <td colspan="2"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>">
       <tr> 
        <td> 
         <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="<% = strTopBarColour %>" background="<% = strTopBarBgImage %>">
          <tr> 
           <td class="text"> 
            <% Response.Write(strTxtSentBy & " <a href=""JavaScript:openWin('pop_up_profile.asp?profile=" & lngUserID & "','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"">" & strUsername & "</a> " & strTxtOn & " " & DateFormat(dtmTopicDate, saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(dtmTopicDate, saryDateTimeData)) %>
            <br>
            <a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngUserID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><img src="<% = strImagePath %>profile_icon.gif" border="0" alt="<% = strTxtView & " " & strUsername & "'s " & strTxtProfile %>" align="absmiddle"></a> 
            <% 
            
      	If strAuthorHomepage <> "" Then
%>
            <a href="<% = strAuthorHomepage %>" target="_blank"><img src="<% = strImagePath %>home_icon.gif" border="0" alt="<% = strTxtVisit & " " & strUsername & "'s " & strTxtHomepage %>" align="absmiddle"></a>
            <%
      	End If
      
            %>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
    <tr> 
     <td valign="top"> 
      <table border="0" cellspacing="1" cellpadding="1" bgcolor="<% = strTableBorderColour %>" height="100%">
       <tr> 
        <td valign="top" bgcolor="<% = strSideBarColour %>" background="<% = strSideBarImage %>"> 
         <table border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strSideBarColour %>" background="<% = strSideBarImage %>" height="100%">
          <tr> 
           <td valign="top"> 
            <table border="0" cellspacing="0" cellpadding="2" height="145">
             <tr> 
              <td class="text" align="center"><% = strUsername %></td>
             </tr>
             <%
        'If the user has an avatar then display it
        If blnAvatar = True AND strAuthorAvatar <> "" Then 
        	Response.Write("<tr> ")
        	Response.Write("<td class=""text"" align=""center""><img src=""" & strAuthorAvatar & """ width=""" & intAvatarWidth & """ height=""" & intAvatarHeight & """ alt=""" & strTxtAvatar & """ OnError=""this.src='avatars/blank.gif', height='0';""></td>")
       		Response.Write("</tr>")
       	End If
                     %>
             <tr> 
              <td class="text" align="center"><% = strStatus %></td>
             </tr>
             <tr> 
              <td><img src="<% = strImagePath %>1px_spacer.gif" width="112" height="1"></td>
             </tr>
             <tr> 
              <td class="text" valign="bottom"><span style="font-size: <% = intSmallFontSize %>px;"><% = strAuthorLocation %>
               <br><% = DateFormat(dtmAuthorRegistration, saryDateTimeData) %>
               <br><% = lngAuthorNumOfPosts %>&nbsp;<% = strTxtPosts %></span></td>
             </tr>
            </table>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
     <td width="90%"> 
      <table border="0" cellspacing="0" cellpadding="1" bgcolor="<% = strTableBorderColour %>" width="100%">
       <tr> 
           <td valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="<% = strDisplayPostBoxColour %>" background="<% = strDisplayPostBoxImage %>" height="147">
          <tr> 
           <td class="text" valign="top"> <!-- Message body --><% = strMessage %><!-- Message body --></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<%
End If
%>
<div align="center"><br>
 <%
'Clear server objects
rsPmMessage.Close
Set rsPmMessage = Nothing
Set adoCon = Nothing
Set strCon = Nothing 

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
 <br>
</div>
<!-- #include file="footer.inc" -->
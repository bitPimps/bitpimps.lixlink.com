<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
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


Dim strMessage 			'Holds the Users Message
Dim strTempMessageLink		'Temporary word hold for e-mail and url words
Dim strMessageLink		'Holds the new mesage link
Dim lngLinkStartPos		'Holds the start position for a link
Dim lngLinkEndPos		'Holds the end position for a word
Dim strTempMessageQuote		'Temporary word hold for the first line of a quote
Dim strMessageQuote		'Holds the new first line of a quote
Dim lngQuoteStartPos		'Holds the start position for a quote
Dim lngQuoteEndPos		'Holds the end position of a quote
Dim rsAuthor			'Holds the author recordset
Dim strAuthorLocation		'Holds the location of the user if given	
Dim lngAuthorNumOfPosts		'Holds the number of posts the user has made to the forum
Dim dtmAuthorRegistration	'Holds the registration date of the user
Dim strAuthorAvatar
Dim intStatus
Dim strStatus



'If the user has not logged in then  redirect to the forum start page
If lngLoggedInUserID = 0 Then Response.Redirect "default.asp"


'Read in the message to be previewed from the cookie set
strMessage = Request.Cookies("Message")

'Make sure this page is not cached
Response.Expires = 15
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "private"


'Format the user input by replacing characters with HTML equivelents
strMessage = Replace(strMessage, "<", "&lt;", 1, -1, 1)
strMessage = Replace(strMessage, ">", "&gt;", 1, -1, 1)
strMessage = Replace(strMessage, "¢", "&cent;", 1, -1, 1)
strMessage = Replace(strMessage, "       ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "      ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "     ", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "    ", "&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, "   ", "&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, vbTab, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", 1, -1, 1)
strMessage = Replace(strMessage, Chr(10), "<br>", 1, -1, 1)


'Call the format_post.inc file to format the message
%><!--#include file="format_post.inc" --><%

'Call the code_check.asp file to remove malcious code
strMessage = checkImages(strMessage)
strMessage = checkLinks(strMessage)
strMessage = formatInput(strMessage)


'If there is nothing to preview then say so
If strMessage = "" OR IsNull(strMessage) Then
	strMessage = "<br><br><div align=""center"">" & strTxtThereIsNothingToPreview & "</div><br><br>"
End If


'Get the users details from the database
'Create a record set object to the Threads held in the database
Set rsAuthor = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database get the thread details
strSQL = "SELECT tblAuthor.Location, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Status, tblAuthor.Avatar "
strSQL = strSQL & "FROM tblAuthor "
strSQL = strSQL & "WHERE (((tblAuthor.Author_ID)=" & lngLoggedInUserID & "));"

'Query the database
rsAuthor.Open strSQL, strCon 

If NOT rsAuthor.EOF Then
	'Read in authors detals from the database
	strAuthorLocation = rsAuthor("Location")
	dtmAuthorRegistration = CDate(rsAuthor("Join_date"))
	lngAuthorNumOfPosts = CLng(rsAuthor("No_of_posts"))
	strAuthorAvatar = rsAuthor("Avatar")
	intStatus = CInt(rsAuthor("Status"))
End If


'Reset server objects
rsAuthor.Close
Set rsAuthor = Nothing

'If no location is given then display a not given for the location
If strAuthorLocation = "" Then strAuthorLocation = strTxtNotGiven

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
		
'If the user is admin or this forums moderator then display so
If lngLoggedInUserID = 1 Then strStatus = "<span style=""font-size: " & intSmallFontSize & "px;"">" & strTxtForumAdmin & "</span><br><img src=""" & strImagePath & "5_star_rating.gif"" alt=""" & strTxtForumAdministrator & """>"

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Post Preview</title>
<HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!--#include file="skin_file.inc" -->

</head>
<body bgcolor="<% = strBgColour %>" text="<% = strTextColour %>" background="<% = strBgImage %>" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center" height="53">
  <tr> 
    <td align="center" height="17"><span class="heading"><% = strTxtPostPreview %></span></td>
  </tr>
  <tr>
    <td align="center" height="39"><a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
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
           <td class="text"><% Response.Write(strTxtMessageBy & " " & strLoggedInUsername & " " & strTxtOn & " " & DateFormat(Now(), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(Now(), saryDateTimeData)) %></tr>
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
              <td class="text" align="center"><% = strLoggedInUsername %></td>
             </tr><%
             
	        'If the user has an avatar then display it
	        If blnAvatar = True AND strAuthorAvatar <> "" Then 
	        	Response.Write("<tr> ")
	        	Response.Write("<td class=""text"" align=""center""><img src=""" & strAuthorAvatar & """ width=""" & intAvatarWidth & """ height=""" & intAvatarHeight & """ alt=""" & strTxtAvatar & """ OnError=""this.src='avatars/blank.gif', height='0';""></td>")
	       		Response.Write("</tr>")
	       	End If
                    
              %><tr> 
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
           <td class="text" valign="top"> 
             <!-- Message body --><% = strMessage %><!-- Message body ''"" -->
           </td>
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
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    <td align="center" height="49"><a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
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
</body>
</html>
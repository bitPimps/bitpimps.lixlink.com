<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="date_time_functions.inc" -->
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
Dim lngUserID			'Holds the active users ID
Dim strUsername			'Holds the active users username
Dim strReturnPage		'Holds the page to return to 
Dim strForumName 		'Holds the forum name
Dim lngForumID 			'Holds the fourum ID
Dim strReturnPageProperties	'Holds the properties of the return page
Dim intGuestNumber		'Holds the Guest Number
Dim intForumColourNumber	'Holds the number to calculate the table row colour	

'Initilise variables
intGuestNumber = 0
intForumColourNumber = 0

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
	
	'Read in the private message
	Case "pm"
		strReturnPage = "pm_welcome.asp"
		strReturnPageProperties = "?ReturnPage=pm"
	
	'Else return to the forum main page
	Case Else
		strReturnPage = "default.asp"
		strReturnPageProperties = "?ForumID=0"
End Select


%>
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Discussion Forum Active Users</TITLE>

<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001-2002
    	 If you want your forum then goto http://www.webwizforums.com --> 
    	 
<script  language="JavaScript">    	
//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
</script>
<!-- #include file="header.inc" -->
   <div align="center" class="heading"><% = strTxtActiveForumUsers %></div>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
</div>
   <div align="center"> <br><%
   
'Intialise the ADO recordset object
Set rsActiveUsers = Server.CreateObject("ADODB.Recordset")

'Get the number of active users
'Initialise the SQL variable with an SQL statement count the number of active users
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCountOfActiveUsers"
Else
	strSQL = "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser;"
End If

'Query the database
rsActiveUsers.Open strSQL, strCon

'Read in the active users from the recordset
intActiveUsers = CInt(rsActiveUsers("ActiveUser"))

'Close the recordset
rsActiveUsers.Close


'Get the number of active guests
'Initialise the SQL variable with an SQL statement count the number of active guests
If strDatabaseType = "SQLServer" Then
	strSQL = "EXECUTE wwfSpCountOfActiveGuests"
Else
	strSQL = "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser WHERE tblActiveUser.Author_ID=2;"
End If

'Query the database
rsActiveUsers.Open strSQL, strCon

'Read in the active guests from the recordset
intActiveGuests = CInt(rsActiveUsers("ActiveUser"))

'To save another database hit we can get the number of members online by taking the number of guest away from the total active users
intActiveMembers = intActiveUsers - intActiveGuests

'Close the recordset
rsActiveUsers.Close

Response.Write("    	<span class=""text"">" & strTxtThereAreCurrently & " " & intActiveUsers & " " & strTxtActiveUsers & ", " & intActiveGuests & " " & strTxtGuestsAnd & " " & intActiveMembers & " " & strTxtMembers & "</span><br>")
%>    
    <br>
    <table width="630" border="0" cellspacing="0" cellpadding="0" bgcolor="<% = strTableBorderColour %>" align="center">
     <tr> 
      <td> 
       <table width="630" border="0" cellspacing="1" cellpadding="3" height="14" bgcolor="<% = strTableBorderColour %>">
        <tr> 
         <td bgcolor="<% = strTableTitleColour %>" width="93" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtUsername %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="120" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtLoggedIn %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="117" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtLastActive %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="66" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtActive %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="95" align="left" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtBrowser %></td>
         <td bgcolor="<% = strTableTitleColour %>" width="96" align="left" height="2" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtOS %></td>
        </tr>
        <%  

'Initialise the SQL variable with an SQL statement to get the active users
strSQL = "SELECT tblActiveUser.*, tblAuthor.Username FROM tblAuthor INNER JOIN tblActiveUser ON tblAuthor.Author_ID = tblActiveUser.Author_ID ORDER BY tblActiveUser.Active DESC;"

'Query the database
rsActiveUsers.Open strSQL, strCon   
        		
'display the active users
Do While NOT rsActiveUsers.EOF

	intForumColourNumber = intForumColourNumber + 1

	'Read in the details from the rs
	lngUserID = CLng(rsActiveUsers("Author_ID"))
	strUsername = rsActiveUsers("Username")
	strBrowserUserType = rsActiveUsers("Browser")
	strOS = rsActiveUsers("OS")
	dtmLastActive = CDate(rsActiveUsers("Active"))
	dtmLoggedIn = CDate(rsActiveUsers("Login"))
	blnHideActiveUser = CBool(rsActiveUsers("Hide"))
	
			
			'Write the HTML of the Topic descriptions as hyperlinks to the Topic details and message
			%>
        <tr> 
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="93" height="24" class="text"><% 
          
         'If the user is a Guest then display them as a Guest
         If lngUserID = 2 Then
         
         	'Add 1 to the Guest number
         	intGuestNumber = intGuestNumber + 1
         	
         	'Display the User as Guest
         	Response.Write(strTxtGuest & " "& intGuestNumber)
         
         'If the user wants to hide there ID then do so 
         ElseIf blnHideActiveUser = True Then
         	
         	'Display the user as an annoy
         	Response.Write(strTxtAnnoymous)
         
         'Else display the users name
         Else %>
          <a href="JavaScript:openWin('pop_up_profile.asp?profile=<% = lngUserID %>','profile','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=440,height=370')"><% = strUsername %></a> 
          <% 
        End If
        %>
         </td>
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="120" height="24" class="text" style="font-size: <% = intSmallFontSize %>px;"><% Response.Write(DateFormat(dtmLoggedIn, saryDateTimeData) & " " & strTxtAt & "&nbsp;" & TimeFormat(dtmLoggedIn, saryDateTimeData))  %></td>
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="117" height="24" class="text" style="font-size: <% = intSmallFontSize %>px;"><% Response.Write(DateFormat(dtmLastActive, saryDateTimeData) & " " & strTxtAt & "&nbsp;" & TimeFormat(dtmLastActive, saryDateTimeData)) %></td>
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="66" height="24" class="text"><% = DateDiff("n", dtmLoggedIn, dtmLastActive) %>&nbsp;<% = strTxtMinutes %></td>
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="95" align="left" height="24" class="text"><% = strBrowserUserType %></td>
         <td bgcolor="<% If (intForumColourNumber MOD 2 = 0 ) Then Response.Write(strTableEvenRowColour) Else Response.Write(strTableOddRowColour) %>" background="<% = strTableBgImage %>" width="96" align="left" height="24" class="text"><% = strOS %></td>
        </tr>
        <%
		
	'Move to the next record in the database
	rsActiveUsers.MoveNext
	   		
Loop
	

%>
       </table>
     </tr>
    </table>
    <br>
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
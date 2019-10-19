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
Dim rsSelectTopic		'Holds the recordset for the topic
Dim strTopicSubject		'Holds the name of the topic
Dim lngTopicID			'Holds the ID number of the category
Dim lngForumID			'Holds the forum id to jump to
Dim strReturnPageProperties	'Holds the properties of the return page
Dim strReturnPage		'Holds the page to return to 


'If the person is not a moderator or admin then send them away
If (lngLoggedInUserID <> 1) AND (blnModerator = False AND lngLoggedInUserID <> 1) Then Response.Redirect("default.asp")
%>
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Discussion Forum Move Post</TITLE>

<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001-2002
    	 If you want your forum then goto http://www.webwizforums.com --> 

<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtMovePost %></div>
<div align="center" class="text"><a href="display_topic_threads.asp?ForumID=<% = CInt(Request.QueryString("ForumID")) %>&TopicID=<% = CLng(Request.QueryString("TopicID")) %>&PagePosition=<% = CInt(Request.QueryString("PagePosition")) %>&ThreadPage=<% = Request.QueryString("ThreadPage") %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
    <br><% = strTxtSelectTopicToMovePostTo %></div>
   <form method="post" name="frmMovePost" action="move_post.asp">
    <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="8">
     <tr> 
      <td height="24" width="680"> 
       <table width="100%" border="0" align="center"  height="8" cellpadding="4" cellspacing="1">
        <tr > 
         <td align="left" width="57%" height="2"  bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSelectTheTopicYouWouldLikeThisPostToBeIn %></td>
        </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="57%"  height="12" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
          <select name="topicSelect"><%
           
'Read in the forum ID to show the topics for
lngForumID = CLng(Request.Form("forum"))
           
'Create a recordset to hold the forum name and id number
Set rsSelectTopic = Server.CreateObject("ADODB.Recordset")
		
		
'Read in the category name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT TOP 400 tblTopic.Topic_ID, tblTopic.Subject FROM tblTopic WHERE tblTopic.Forum_ID = " & lngForumID & " ORDER BY tblTopic.Last_entry_date DESC;"
		
'Query the database
rsSelectTopic.Open strSQL, strCon
		
'Loop through all the categories in the database
Do while NOT rsSelectTopic.EOF 

	'Read in the deatils for the category
	strTopicSubject = rsSelectTopic("Subject")
	lngTopicID = Cint(rsSelectTopic("Topic_ID"))	
			
	'Display a link in the link list to the forum
	Response.Write vbCrLf & "		<option value=""" & lngTopicID & """>" & strTopicSubject & "</option>"
			
	'Move to the next record in the recordset
	rsSelectTopic.MoveNext
Loop
		
'Reset Server Objects
rsSelectTopic.Close
Set rsSelectTopic = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
          </select><%
'If the user is admin or moderator then set a hidden form input
If lngLoggedInUserID = 1 OR blnModerator = True Then
	  Response.Write("<input type=""hidden"" name=""mod"" value=""1"">")
End If
%>
          <input type="hidden" name="ThreadPage" value="<% = Request.QueryString("ThreadPage") %>">
          <input type="hidden" name="MessageID" value="<% = Request.Form("MessageID") %>">
          <input type="hidden" name="ForumID" value="<% = Request.Form("forum") %>">
          <input type="hidden" name="oldTopicID" value="<% = Request.QueryString("TopicID") %>">
         </td>
        </tr>
       </table>
      </td>
    </tr>
  </table>
    <br>
    <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="8">
     <tr> 
      <td height="24" width="680"> 
       <table width="100%" border="0" align="center"  height="8" cellpadding="4" cellspacing="1">
        <tr > 
         <td align="left" width="57%" height="2"  bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtOrTypeTheSubjectOfANewTopic %></td>
        </tr>
        <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
         <td align="left" width="57%"  height="12" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
          <input type="text" name="subject" size="30" maxlength="41">
         </td>
        </tr>
       </table>
      </td>
     </tr>
    </table>
    <br>
  <table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
    <tr>
      <td align="center"> 
        
       <input type="submit" name="Submit" value="<% = strTxtMovePost %>">
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
<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="forum_permissions.inc" -->
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
Dim rsForum			'Holds the recorset of the forums
Dim strReturnPage		'Holds the page to return to 
Dim strForumName 		'Holds the forum name
Dim lngForumID 			'Holds the fourum ID
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


%>
<html> 
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Discussion Forum Search</TITLE>

<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001-2002
    	 If you want your forum then goto http://www.webwizforums.com --> 

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a somthing to search for
	if (document.frmSearch.search.value==""){
	
		msg = "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine1 %>\n";
		msg += "<% = strTxtErrorDisplayLine2 %>\n";
		msg += "<% = strTxtErrorDisplayLine %>\n\n";
		msg += "<% = strTxtErrorDisplayLine3 %>\n";
	
		alert(msg + "\n\t<% = strTxtSearchFormError %>\n\n");
		document.frmSearch.search.focus();
		return false;
	}
	
	return true
}
// -->
</script>

<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtDiscussionForumSearch %></div>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br><br>
</div>
<form method="get" name="frmSearch" action="search.asp" onSubmit="return CheckForm();" onReset="return confirm('<% = strResetFormConfirm %>');">
    <table width="620" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="8">
     <tr> 
      <td height="2" width="680"> 
        <table width="100%" border="0" align="center"  height="8" cellpadding="4" cellspacing="1">
          <tr > 
            <td align="left" width="57%" height="2"  bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSearchFor %></td>
            <td height="2" width="43%" bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSearchIn %></td>
          </tr>
          <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
            <td align="left" width="57%"  height="2" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
              <input type="text" name="search" maxlength="35" value="<% = Request.QueryString("search") %>">
              <br>
              <span class="text"><% = strTxtSearchOn %>&nbsp;: 
              <input type="radio" name="searchMode" value="allwords" <% If Request.QueryString("searchMode") = "allwords" OR Request.QueryString("searchMode") = "" Then Response.Write "CHECKED" %>><% = strTxtAllWords %> 
              <input type="radio" name="searchMode" value="anywords" <% If Request.QueryString("searchMode") = "anywords" Then Response.Write "CHECKED" %>><% = strTxtAnyWords %> 
              <input type="radio" name="searchMode" value="phrase" <% If Request.QueryString("searchMode") = "phrase" Then Response.Write "CHECKED" %>><% = strTxtPhrase %> </span></td>
            
         <td height="2" width="43%" valign="top" background="<% = strTableBgImage %>"> 
          <select name="searchIn">
                <option value="Topic" <% If Request.QueryString("searchIn") = "Topic" OR Request.QueryString("searchIn") = "" Then Response.Write "selected" %>><% = strTxtTopicSubject %></option>
                <option value="Thread" <% If Request.QueryString("searchIn") = "Thread" Then Response.Write "selected" %>><% = strTxtMessageBody %></option>
                <option value="Author" <% If Request.QueryString("searchIn") = "Author" Then Response.Write "selected" %>><% = strTxtAuthor %></option>
              </select>
         </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
    <table width="620" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="8">
     <tr> 
      <td height="24" width="680"> 
        <table width="100%" border="0" align="center"  height="8" cellpadding="4" cellspacing="1">
          <tr > 
            <td align="left" width="57%" height="2"  bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSearchForum %></td>
            <td height="2" width="43%" bgcolor="<% = strTableTitleColour %>" class="tHeading" background="<% = strTableTitleBgImage %>"><% = strTxtSortResultsBy %></td>
          </tr>
          <tr bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
            <td align="left" width="57%"  height="12" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
              <select name="forum">
			  <option value="0"><% = strTxtAllForums %></option>
                <%
'Create a recordset to hold the forum name and id number
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Read in the forum name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.* FROM tblForum ORDER BY tblForum.Cat_ID ASC, tblForum.Forum_Order ASC;"

'Query the database
rsForum.Open strSQL, strCon

'Loop through all the froum in the database
Do while NOT rsForum.EOF 

	'Read in the forum details from the recordset
	strForumName = rsForum("Forum_name")
	lngForumID = CLng(rsForum("Forum_ID"))
	intMemberSecurityLevel = CInt(rsForum(strMemberStatus))	
	
	'If the user is the forum admin or moderator then set there security level to 1 (read and write)
	If lngLoggedInUserID = 1 OR blnModerator = True Then intMemberSecurityLevel = 1

	'Display the fourms to search as long as they are not private or they have logged in if they are and they have permission to use forum
	If (isNull(rsForum("Password")) = True OR Request.Cookies("PrForum")("Forum" & lngForumID) = rsForum("Forum_code")) AND (intMemberSecurityLevel < 3) Then
		'Display a link in the link list to the forum
		Response.Write vbCrLf & "<option value=" & lngForumID & " "
		If CInt(Request.QueryString("ForumID")) = lngForumID OR CInt(Request.QueryString("forum")) = lngForumID Then Response.Write "selected"
		Response.Write ">" & strForumName & "</option>"		
	End If
			
	'Move to the next record in the recordset
	rsForum.MoveNext
Loop

'Reset server objects
rsForum.Close
Set rsForum = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
              </select>
            </td>
            
         <td height="12" width="43%" valign="top" background="<% = strTableBgImage %>"> 
          <select name="searchSort">
                <option value="dateDESC" <% If Request.QueryString("searchSort") = "dateDESC" OR Request.QueryString("searchSort") = "" Then Response.Write "selected" %>><% = strTxtLastPostTime %></option>
                <option value="dateASC" <% If Request.QueryString("searchSort") = "dateASC" Then Response.Write "selected" %>><% = strTxtTopicStartDate %></option>
                <option value="topic" <% If Request.QueryString("searchSort") = "topic" Then Response.Write "selected" %>><% = strTxtSubjectAlphabetically %></option>
                <option value="views" <% If Request.QueryString("searchSort") = "views" Then Response.Write "selected" %>><% = strTxtNumberViews %></option>
              </select>
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
        <input type="submit" name="Submit" value="<% = strTxtStartSearch %>">
        <input type="reset" name="Reset" value="<% = strTxtResetForm %>">
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
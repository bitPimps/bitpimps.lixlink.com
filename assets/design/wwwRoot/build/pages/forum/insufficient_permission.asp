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
Dim strReturnPage		'Holds the page to return to 
Dim strReturnPageProperties	'Holds the properties of the return page


'Get the forum page to return to
Select Case Request.QueryString("ReturnPage")
	'Read in the search to return to
	Case "Search"
		strReturnPage = "search.asp"
		strReturnPageProperties = "?ReturnPage=" & Request.QueryString("ReturnPage") & "&SearchPagePosition=" & Request.QueryString("SearchPagePosition") & "&search=" & Server.URLEncode(Request.QueryString("search")) & "&searchMode=" & Request.QueryString("searchMode") & "&searchIn=" & Request.QueryString("searchIn") & "&forum=" & Request.QueryString("forum") & "&searchSort=" & Request.QueryString("searchSort")
	
	'Read in the active topic page to return to
	Case "Active"
		strReturnPage = "active_topics.asp"
		strReturnPageProperties = "?PagePosition=" & CInt(Request.QueryString("PagePosition"))
	
	'Else return to the forum main page
	Case Else
		strReturnPage = "default.asp"
		strReturnPageProperties = "?ForumID=0"
End Select

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Access Denied</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!-- #include file="header.inc" -->
<div align="center" class="heading"><% = strTxtAccessDenied %></div><br>
<div align="center"><a href="<% = strReturnPage & strReturnPageProperties %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br>
 <span class="lgText"><% = strTxtInsufficientPermison %></span><br>
  <br>
  <%
Response.Write vbCrLf & "	<a href=""register_form.asp" & strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "register.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtRegister & """ border=""0"" align=""absmiddle""></a>&nbsp;&nbsp;<a href=""login_user.asp" &  strReturnPageProperties & """ target=""_self""><img src=""" & strImagePath & "login.gif"" width=""" & intButtonWidth & """ height=""" & intButtonHeight & """ alt=""" & strTxtLogin & """ border=""0"" align=""absmiddle""></a><br>"
%>
<br>
<br>
<br>
</div>
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
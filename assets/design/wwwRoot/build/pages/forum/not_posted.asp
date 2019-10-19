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
Dim strErrorCode		'Holds the error code of the page

'Read in the error code
strErrorCode = Request.QueryString("mode")

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Message Not Posted</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!-- #include file="header.inc" -->
      <div align="center" class="heading"><% = strTxtMessageNotPosted %></div>
      <br>
<div align="center"><a href="display_topic_threads.asp?ForumID=<% = Request.QueryString("ForumID") %>&TopicID=<% = Request.QueryString("TopicID") %>&PagePosition=<% = Request.QueryString("PagePosition") %>&ThreadPage=<% = Request.QueryString("ThreadPage") %>" target="_self"><% = strTxtReturnToDiscussionForum %></a><br>
  <br><br>
  <span class="text"><%
 
'Write the error message
If strErrorCode = "posted" Then
	Response.Write(strTxtDoublePostingIsNotPermitted) 
ElseIf strErrorCode = "noSubject" Then
	Response.Write(strTxtYourMessageNoValidSubjectHeading) 
ElseIf strErrorCode = "maxS" OR strErrorCode = "maxM" Then    
	Response.Write("<span class=""lgText"">" & strTxtSpammingIsNotPermitted & "</span><br>" & strTxtYouHaveExceededNumOfPostAllowed) 
End If        
        %></span><br>
  <br>
   <br><br><br>
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
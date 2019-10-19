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


'Clear the forum cookie on the users system so the user is no longer logged in
Response.Cookies("Forum")("UserID") = strLoggedInUsername & "LOGGED-OFF"
Response.Cookies("PrForum") = ""

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

'Return to the forum
Response.Redirect strReturnPage & strReturnPageProperties
%>
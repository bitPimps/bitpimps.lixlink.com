<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
<!--#include file="langauge_file.inc" -->
<!--#include file="convert_post_to_text.inc" -->
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
Dim rsThreadPrint		'Holds the database recordset variable for the thread
Dim intForumID			'Holds the forum ID number
Dim strForumName		'Holds the forum name
Dim strForumDescription		'Holds the description of the forum
Dim lngTopicID			'Holds the topic number
Dim strSubject			'Holds the topic subject
Dim strUsername 		'Holds the Username of the thread
Dim dtmTopicDate		'Holds the date the thread was made
Dim strMessage			'Holds the message body of the thread


'Initialise variables
intForumID = 0
lngTopicID = 0


'Read in the Forum ID to display the Topics for
intForumID = CInt(Request.QueryString("ForumID"))
lngTopicID = CLng(Request.QueryString("TopicID"))


'If there no Topic ID then redirect the user to the main forum page
If lngTopicID = 0 Then Response.Redirect "default.asp"

'Get the threads from the database
'Create a record set object to the Threads held in the database
Set rsThreadPrint = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database get the thread details
strSQL = "SELECT tblThread.Message, tblThread.Message_date, tblThread.Show_signature, tblForum.Forum_name, tblForum.Forum_description, tblAuthor.Username, tblAuthor.Signature, tblTopic.Subject "
strSQL = strSQL & "FROM (tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID) INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
strSQL = strSQL & "WHERE (((tblThread.Topic_ID)=" & lngTopicID & ")) "
strSQL = strSQL & "ORDER by tblThread.Message_Date ASC;"

'Query the database
rsThreadPrint.Open strSQL, strCon 

'If there is no topic in the database then display the appropraite mesasage
If rsThreadPrint.EOF Then
	'If there are no thread's to display then display the appropriate error message
	strSubject = strNoThreads
	
Else
	'Read in the thread subject
	strSubject = rsThreadPrint("Subject")
End If

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Discussion Forum</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!--#include file="skin_file.inc" -->
		
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0000CC" vlink="#0000CC" alink="#FF0000">
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr> 
    <td align="center"><a href="javascript:onClick=window.print()"><% = strTxtPrintPage %></a> 
      | <a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr> 
    <td> <br>
      <%
'If there are no threads returned by the qury then display an error message
If rsThreadPrint.EOF Then
%>
      <table width="100%" border="0" cellspacing="0" cellpadding="1">
        <tr> 
          <td align="center" height="66"><font size="4"><% = strNoThreads %></font></td>
        </tr>
      </table>
      <%
'Display the threads
Else
	
	'Read in threads details for the topic from the database
	strMessage = rsThreadPrint("Message")
	strUsername = rsThreadPrint("Username")
	dtmTopicDate = CDate(rsThreadPrint("Message_date")) 
	strForumName = rsThreadPrint("Forum_name")
	strForumDescription = rsThreadPrint("Forum_description")
	
	'If the user wants there signature shown then attach it to the message
	If rsThreadPrint("Show_signature") = True Then
		strMessage = strMessage & "<!-- Signature --><br><br>-------------<br>" & rsThreadPrint("Signature")
	End If	
	
	'Remove the font colours and smilley graphics
	strMessage = ConvertToText(strMessage)      
    
    %>
      <font size="4"><b><% = strSubject %></b></font> <br>
      <br>
      <b><% = strTxtPrintedFrom %>:</b> <% = strWebsiteName %>
      <br><b><% = strTxtForumName %>: </b> <% = strForumName %>
      <br><b><% = strTxtForumDiscription %>: </b> <% = strForumDescription %>
      <br><b><% = strTxtURL %>:</b><% = strForumPath %>/display_topic_threads.asp?ForumID=<% = intForumID %>&TopicID=<% = lngTopicID %>
      <br><b><% = strTxtPrintedDate %>:</b> <% = DateFormat(Now(), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(Now(), saryDateTimeData) %>
      <br><br><br>
      <font size="4"><b><% = strTxtTopic %>:</b> <% = strSubject %></font> 
      <hr><br>
      <b><% = strTxtPostedBy %>:</b> <% = strUsername %>
      <br><b><% = strTxtSubjectFolder %>:</b> <% = strSubject %>
      <br><b><% = strTxtDatePosted %>:</b> <% = DateFormat(dtmTopicDate, saryDateTimeData) %>&nbsp;<% = strTxtAt %>&nbsp;<% = TimeFormat(dtmTopicDate, saryDateTimeData) %>
      <br><br>
      <% = strMessage %>
      <br><br><br>
      <% 
      	'Move to the next database record
	rsThreadPrint.MoveNext
	
      	If NOT rsThreadPrint.EOF Then Response.Write "<b><font size=""4"">" & strTxtReplies & ": </font></b>" 
      	%>
      <hr>
      <%
      	
      
      	'Loop round to read in all the thread's in the database
	Do While NOT rsThreadPrint.EOF
		
		'Read in threads details for the topic from the database
		strMessage = rsThreadPrint("Message")
		strUsername = rsThreadPrint("Username")
		dtmTopicDate = CDate(rsThreadPrint("Message_date"))
		
		'If the user wants there signature shown then attach it to the message
		If rsThreadPrint("Show_signature") = True Then
			strMessage = strMessage & "<!-- Signature --><br><br>-------------<br>" & rsThreadPrint("Signature")
		End If	
		
		'Remove the font colours and smilley graphics
		strMessage = ConvertToText(strMessage)
		
	      %>
      <br>
      <b><% = strTxtPostedBy %>:</b> <% = strUsername %>
      <br>
      <b><% = strTxtDatePosted %>:</b> <% = DateFormat(dtmTopicDate, saryDateTimeData) %>&nbsp;<% = strTxtAt %>&nbsp;<% = TimeFormat(dtmTopicDate, saryDateTimeData) %>
      <br><br>
      <% = strMessage %>
      <br>
      <br>
      <hr>
      <%
	      	'Move to the next database record
		rsThreadPrint.MoveNext	
	Loop	
%>
    </td>
  </tr>
</table>
<br>
<%	
End If

'Reset server variables
rsThreadPrint.Close
Set rsThreadPrint = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
<br>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr> 
    <td align="center"><a href="javascript:onClick=window.print()"><% = strTxtPrintPage %></a> 
      | <a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
</body>
</html>
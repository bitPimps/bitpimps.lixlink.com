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

'Dimension variables
Dim rsThreadMessage		'Holds the database recordset for the message
Dim strMode			'Holds the mode of the page
Dim strMessage			'Holds the message to be edited

'Read in the message ID number to edit
strMode = Request.QueryString("mode")


'Get the message from the database
'Create a record set object to the Threads held in the database
Set rsThreadMessage = Server.CreateObject("ADODB.Recordset")

'If the message is to be edited then read in the message from the database
If strMode = "edit" or strMode="editTopic" Then
	
	'Initalise the strSQL variable with an SQL statement to query the database get the message details
	strSQL = "SELECT tblThread.Message "
	strSQL = strSQL & "FROM tblThread "
	strSQL = strSQL & "WHERE (((tblThread.Thread_ID)=" & CLng(Request.QueryString("messageID")) & "));"
	
	'Query the database
	rsThreadMessage.Open strSQL, strCon 
	
	'Read in the details from the recordset
	strMessage = rsThreadMessage("Message")
	
	'Clean up
	rsThreadMessage.Close

'If the message is to have a quote from someone else then read in there message
ElseIf strMode = "quote" Then
	
	'Initialise the sql query to get the thread details to be quoted
	strSQL = "SELECT tblThread.Message, tblAuthor.Username, tblThread.Message_date "
	strSQL = strSQL & "FROM tblThread INNER JOIN tblAuthor ON tblThread.Author_ID = tblAuthor.Author_ID "
	strSQL = strSQL & "WHERE tblThread.Thread_ID = " & CLng(Request.QueryString("postID"))
	
	'Query the database
	rsThreadMessage.Open strSQL, strCon 
	
	
	'Build up the quoted thread post
	strMessage = "<blockquote><b>" & strTxtQuote & ": </b><i>" & strTxtOriginallyPostedBy & " " & rsThreadMessage("Username") & " " & strTxtOn & " " & DateFormat(CDate(rsThreadMessage("Message_date")), saryDateTimeData) & "</i><hr>"
	
	'Read in the quoted thread from the recordset
	strMessage = strMessage & rsThreadMessage("Message")
	strMessage = strMessage & "<hr></blockquote><br>"
	
	'Clean up
	rsThreadMessage.Close

'If a private message read in the message again if the user has returned to ammend after getting username wrong	
ElseIf strMode = "PM" AND Session("PmMessage") <> "" AND Request.QueryString("code") = "edit" Then
	strMessage = Session("PmMessage")
End If

'If we are replying to a private message then formt it
If Request.QueryString("code") = "reply" Then
	
	'Initlise the sql statement
	strSQL = "SELECT tblPMMessage.*, tblAuthor.Username "
	strSQL = strSQL & "FROM tblAuthor INNER JOIN tblPMMessage ON tblAuthor.Author_ID = tblPMMessage.From_ID "
	strSQL = strSQL & "WHERE tblPMMessage.PM_ID=" & CLng(Request.QueryString("messageID")) & " AND tblPMMessage.Author_ID=" & lngLoggedInUserID & ";"

	'Query the database
	rsThreadMessage.Open strSQL, strCon 
	
	
	'Build up the reply pm post
	strMessage = "<br><br><br>-- " & strTxtPreviousPrivateMessage & " --"
	strMessage = strMessage & "<br><b>" & strTxtSentBy & " :</b> " & rsThreadMessage("Username") 
	strMessage = strMessage & "<br><b>" & strTxtSent & " :</b> " & DateFormat(CDate(rsThreadMessage("PM_Message_Date")), saryDateTimeData) & " " & strTxtAt & " " & TimeFormat(CDate(rsThreadMessage("PM_Message_Date")), saryDateTimeData) & "<br><br>"
	
	'Read in the quoted thread from the recordset
	strMessage = strMessage & rsThreadMessage("PM_Message")
	
	'Clean up
	rsThreadMessage.Close
End If


'Make the post idetical to before it was posted by removing border and target tags from the images and links
If NOT strMessage = "" Then strMessage = Replace(strMessage, """ border=""0"" target=""_blank"">", """>", 1, -1, 1)
If NOT strMessage = "" Then strMessage = Replace(strMessage, """ border=""0"">", """>", 1, -1, 1)
		
	
'Reset Server Objects
Set rsThreadMessage = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
<html>
<head>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!--#include file="skin_file.inc" -->

</head>
<body bgcolor="<% = strIETextBoxColour %>" text="#000000" class="text" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<% = strMessage %></body>
</html>

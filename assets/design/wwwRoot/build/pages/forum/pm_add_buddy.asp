<% Option Explicit %>
<!--#include file="common.asp" -->

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

'Declare variables
Dim rsCheckUser		'Db recordset to get check username exsists
Dim rsAddBuddyList	'Db recorset to add the new buddy
Dim strUsername		'Holds the usrename of the new buddy
Dim strDescription	'Holds a short description of the buddy
Dim blnBlocked		'Set to true if the users is blocked from messaging
Dim intCode		'Return page code

'Set the return page code
intCode = 1

'If Priavte messages are not on then send them away
If blnPrivateMessages = False Then Response.Redirect("default.asp")

'If the user is not allowed then send them away
If lngLoggedInUserID = 0 OR lngLoggedInUserID = 2 OR intMemberStatus = 0 Then Response.Redirect("insufficient_permission.asp")

''Read in the details from the form
strUsername = Trim(Mid(Request.Form("username"), 1, 15))
strDescription = Trim(Mid(Request.Form("description"), 1, 30))
blnBlocked = CBool(Request.Form("blocked"))

'Take out parts of the username that are not permitted
strUsername = Replace(strUsername, "password", "", 1, -1, 1)
strUsername = Replace(strUsername, "author", "", 1, -1, 1)
strUsername = Replace(strUsername, "code", "", 1, -1, 1)
strUsername = Replace(strUsername, "username", "", 1, -1, 1)

'Clean up user input
strUsername = formatSQLInput(strUsername)
strDescription = formatInput(strDescription)

'Check that the new buddy exsists
'Intialise the ADO recordset object
Set rsCheckUser = Server.CreateObject("ADODB.Recordset")
	
'Initalise the SQL string to query the database to see if the uername exists
strSQL = "SELECT tblAuthor.Author_ID FROM tblAuthor "
strSQL = strSQL & "WHERE tblAuthor.Username = '" & strUsername & "';"

'Open the recordset
rsCheckUser.Open strSQL, strCon

'If the user exsist check there not in the list and then add them
If NOT rsCheckUser.EOF Then
	
	'Intialise the ADO recordset object
	Set rsAddBuddyList = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the SQL string with a query to check to see if user is already in list
	strSQL = "SELECT tblBuddyList.* FROM tblBuddyList "
	strSQL = strSQL & "WHERE tblBuddyList.Buddy_ID = " & CLng(rsCheckUser("Author_ID")) & " AND tblBuddyList.Author_ID = " & lngLoggedInUserID & ";"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsAddBuddyList.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsAddBuddyList.LockType = 3
	
	'Open the recordset
	rsAddBuddyList.Open strSQL, strCon
	
	'If no record is returned the buddy is not already in the buddy list so eneter them
	If rsAddBuddyList.EOF Then
		
		'Add the new buddy
		rsAddBuddyList.AddNew
		rsAddBuddyList.Fields("Author_ID") = lngLoggedInUserID
		rsAddBuddyList.Fields("Buddy_ID") = CInt(rsCheckUser("Author_ID"))
		rsAddBuddyList.Fields("Description") = strDescription
		rsAddBuddyList.Fields("Block") = blnBlocked
		rsAddBuddyList.Update
		
		'Set the msg varaible to let the user know the buddy has been added
		intCode = 2
		
	'Else the buddy is alreay entered so set the msg varaiable to tell the user
	Else
		Session("msg") = "exsistBuddy"
	End If

	'Clear up
	rsAddBuddyList.Close
	Set rsAddBuddyList = Nothing

Else
	'Tell the next page to display an error msg as user is not found
	Session("msg") = "noBuddy"
End If

'Clear up
rsCheckUser.Close
Set rsCheckUser = Nothing
Set adoCon = Nothing
Set strCon = Nothing

'Remove anti SQL injection code
strUsername = Replace(strUsername, "''", "'", 1, -1, 1)

'Return to the page showing the threads
Response.Redirect "pm_buddy_list.asp?name=" & Server.URLEncode(strUsername) & "&desc=" & Server.URLEncode(strDescription) & "&code=" & intCode
%>
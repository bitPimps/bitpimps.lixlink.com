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

'Dimension variables
Dim rsCat	'Holds the category order
Dim rsForum	'Holds the forum for order


'Update the category and forum order
If Request.Form("Submit") = "Update Order" Then
	
	'Intialise the ADO recordset object
	Set rsCat  = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblCategory.* From tblCategory ORDER BY tblCategory.Cat_order ASC;"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsCat.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsCat.LockType = 3
		
	'Query the database
	rsCat.Open strSQL, strCon
	
	'Loop through the rs to change the cat order
	Do While NOT rsCat.EOF
	
		rsCat.Fields("Cat_order") = CInt(Request.Form("catOrder" & rsCat("Cat_ID")))		
					
		'Add new forum to database
		rsCat.Update
		
		'Move to the next record in the recordset
		rsCat.MoveNext
	Loop
	
	'Close the recordset
	rsCat.Close
	Set rsCat = Nothing	
	
	
	
	'Intialise the ADO recordset object
	Set rsForum  = Server.CreateObject("ADODB.Recordset")
		
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblForum.* From tblForum ORDER BY tblForum.Forum_Order ASC;"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsForum.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsForum.LockType = 3
		
	'Query the database
	rsForum.Open strSQL, strCon
	
	
	'Loop through rs to change the forums order
	Do While NOT rsForum.EOF
	
		rsForum.Fields("Forum_Order") = CInt(Request.Form("forumOrder" & rsForum("Forum_ID")))		
					
		'Add new forum to database
		rsForum.Update
		
		'Move to the next record in the recordset
		rsForum.MoveNext
	Loop
	
	'Close the recordset
	rsForum.Close
	Set rsForum = Nothing	
End If
	
'Reset main server variables
Set adoCon = Nothing
Set strCon = Nothing


'Return to the forum categories page
Response.Redirect "view_forums.asp"
%>
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

'If this is the forum admin and the ID number passed across is numeric then delete the member
If lngLoggedInUserID = 1 AND isNumeric(Request.QueryString("ID")) Then
	
	'Make sure we are not trying to delete the admin or geust account
	If CLng(Request.QueryString("ID")) > 2 Then
	
		'Delete the members buddy list
		'Initalise the strSQL variable with an SQL statement
		strSQL = "DELETE FROM tblBuddyList WHERE (Author_ID ="  & CLng(Request.QueryString("ID")) & ") OR (Buddy_ID ="  & CLng(Request.QueryString("ID")) & ")"
		
		'Write to database
		adoCon.Execute(strSQL)	
		
		
		'Delete the members private msg's
		strSQL = "DELETE FROM tblPMMessage WHERE (Author_ID ="  & CLng(Request.QueryString("ID")) & ")"
			
		'Write to database
		adoCon.Execute(strSQL)	
		
		
		'Set all the users private messages to Guest account
		strSQL = "UPDATE tblPMMessage SET From_ID=2 WHERE (From_ID ="  & CLng(Request.QueryString("ID")) & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Set all the users posts to the Guest account
		strSQL = "UPDATE tblThread SET Author_ID=2 WHERE (Author_ID ="  & CLng(Request.QueryString("ID")) & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		'Delete the user from the moderators table
		strSQL = "DELETE FROM tblModerator WHERE (Author_ID ="  & CLng(Request.QueryString("ID")) & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
		
		
		'Finally we can now delete the member from the forum
		strSQL = "DELETE FROM tblAuthor WHERE (Author_ID ="  & CLng(Request.QueryString("ID")) & ")"
			
		'Write to database
		adoCon.Execute(strSQL)
	End If	
End If

'Reset main server variables
Set adoCon = Nothing
Set strCon = Nothing

'Return to forum
If Request.QueryString("Return") = "admin" Then
	Response.Redirect "admin/member_profile.asp?code=2&profile=" & Request.QueryString("ID")
Else
	'Redirect back to the profile page
	Response.Redirect "pop_up_profile.asp?code=2&profile=" & Request.QueryString("ID")
End If
%>
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


'Set the response buffer to true
Response.Buffer = True 


'Dimension variables
Dim rsForumConfiguration 	'Recorset holding all the username in the database
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database				
Dim intSpamTimeLimitSeconds	'Holds the number of secounds between posts
Dim intSpamTimeLimitMinutes	'Holds the number of minutes the user can post five posts in
      
      

'Read in the users colours for the forum
intSpamTimeLimitSeconds = CInt(Request.Form("seconds"))
intSpamTimeLimitMinutes = CInt(Request.Form("minutes"))
strMode = Request.Form("mode")

'Intialise the ADO recordset object
Set rsForumConfiguration  = Server.CreateObject("ADODB.Recordset")
	
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblConfiguration.* From tblConfiguration;"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsForumConfiguration.CursorType = 2

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsForumConfiguration.LockType = 3

'we only want one record so set the maximum records to 1
rsForumConfiguration.MaxRecords = 1
	
'Query the database
rsForumConfiguration.Open strSQL, strCon

'If the user is changing tthe colours then update the database
If strMode = "change" Then
	
	'Update the recordset
	rsForumConfiguration.Fields("Spam_seconds") = intSpamTimeLimitSeconds
	rsForumConfiguration.Fields("Spam_minutes") = intSpamTimeLimitMinutes
				
	'Update the database with the new user's colours
	rsForumConfiguration.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsForumConfiguration.Requery	
End If

'Read in the forum colours from the database
If NOT rsForumConfiguration.EOF Then
	
	'Read in the colour info from the database
	intSpamTimeLimitSeconds = CInt(rsForumConfiguration.Fields("Spam_seconds"))
	intSpamTimeLimitMinutes = CInt(rsForumConfiguration.Fields("Spam_minutes"))
End If


'Reset Server Objects
rsForumConfiguration.Close
Set rsForumConfiguration = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<title>Anti-Spam Configuration</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Anti-Spam Configuration</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><br>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 These Anti-Spam measures are to stop a spammer going on a spree and posting thousands of useless or <br>
 abusive messages on your forum in a matter of minutes. The higher you set these times the harder it is <br>
 for a spammer, but bewared set them to high and you may block legitimate forum users.</font></div>
<form method="post" name="frmConfiguration" action="spam_configure.asp">
 <table border="0" align="center" cellpadding="4" cellspacing="1" width="681" bgcolor="#000000">
  <tr bgcolor="#CCCCCC"> 
   <td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="3"><b>Anti-Spam Configuration</b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Time Interval Between Posts:<br>
    <font size="1">This how long a forum member needs to wait before posting a new post.<br>
    If this is set to high it will stop forum member from posting another post straight after there last post if they suddenly realize they forgot to mention 
    something.</font></font></td>
   <td valign="top"> 
    <select name="seconds">
     <option value="0" <% If intSpamTimeLimitSeconds = 0 Then Response.Write("selected") %>>Off</option>
     <option value="10" <% If intSpamTimeLimitSeconds = 10 Then Response.Write("selected") %>>10 Seconds</option>
     <option value="15" <% If intSpamTimeLimitSeconds = 15 Then Response.Write("selected") %>>15 Seconds</option>
     <option value="20" <% If intSpamTimeLimitSeconds = 20 Then Response.Write("selected") %>>20 Seconds</option>
     <option value="25" <% If intSpamTimeLimitSeconds = 25 Then Response.Write("selected") %>>25 Seconds</option>
     <option value="30" <% If intSpamTimeLimitSeconds = 30 Then Response.Write("selected") %>>30 Seconds</option>
     <option value="45" <% If intSpamTimeLimitSeconds = 45 Then Response.Write("selected") %>>45 Seconds</option>
     <option value="60" <% If intSpamTimeLimitSeconds = 60 Then Response.Write("selected") %>>1 minute</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">A Forum Member can Post a Maximum of 5 Posts In:<br>
    <font size="1">This is the amount of time a Forum Member can post 5 Posts, once this is reached the forum member will have to wait till at least one 
    of their 5 posts is no longer in this time limit.</font></font></td>
   <td valign="top"> 
    <select name="minutes">
     <option value="0" <% If intSpamTimeLimitMinutes = 0 Then Response.Write(" selected") %>>Off</option>
     <option value="1" <% If intSpamTimeLimitMinutes = 1 Then Response.Write(" selected") %>>1 minute</option>
     <option value="2" <% If intSpamTimeLimitMinutes = 2 Then Response.Write(" selected") %>>2 minutes</option>
     <option value="3" <% If intSpamTimeLimitMinutes = 3 Then Response.Write(" selected") %>>3 minutes</option>
     <option value="4" <% If intSpamTimeLimitMinutes = 4 Then Response.Write(" selected") %>>4 minutes</option>
     <option value="5" <% If intSpamTimeLimitMinutes = 5 Then Response.Write(" selected") %>>5 minutes</option>
     <option value="6" <% If intSpamTimeLimitMinutes = 6 Then Response.Write(" selected") %>>6 minutes</option>
     <option value="7" <% If intSpamTimeLimitMinutes = 7 Then Response.Write(" selected") %>>7 minutes</option>
     <option value="8" <% If intSpamTimeLimitMinutes = 8 Then Response.Write(" selected") %>>8 minutes</option>
     <option value="9" <% If intSpamTimeLimitMinutes = 9 Then Response.Write(" selected") %>>9 minutes</option>
     <option value="10" <% If intSpamTimeLimitMinutes = 10 Then Response.Write(" selected") %>>10 minutes</option>
     <option value="15" <% If intSpamTimeLimitMinutes = 15 Then Response.Write(" selected") %>>15 minutes</option>
     <option value="20" <% If intSpamTimeLimitMinutes = 20 Then Response.Write(" selected") %>>20 minutes</option>
     <option value="25" <% If intSpamTimeLimitMinutes = 25 Then Response.Write(" selected") %>>25 minutes</option>
     <option value="30" <% If intSpamTimeLimitMinutes = 30 Then Response.Write(" selected") %>>30 minutes</option>
     <option value="40" <% If intSpamTimeLimitMinutes = 40 Then Response.Write(" selected") %>>40 minutes</option>
     <option value="50" <% If intSpamTimeLimitMinutes = 50 Then Response.Write(" selected") %>>50 minutes</option>
     <option value="60" <% If intSpamTimeLimitMinutes = 60 Then Response.Write(" selected") %>>1 hour</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
   <td valign="top" colspan="2" class="arial"> 
    <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
     <input type="hidden" name="mode" value="change">
     <input type="submit" name="Submit" value="Update Spam Configuration">
     <input type="reset" name="Reset" value="Clear Form">
     </font></p>
   </td>
  </tr>
 </table>
</form>
<div align="center"><br>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font face="Arial, Helvetica, sans-serif" size="4">Please Note</font></b><br>
 The Anti-Spam measures do not affect the admin account, so you can still post as many messages as you like.<br>
 <br>
 <b>Guest Account Enabled: -</b> If you have the Guest Account enabled then you have no protection against a spammer.<br>
 <br>
 <br>
 <b>These measures are not fool proof but should make it harder for a spammer to attack your forum</b></font><b>.</b><br>
</div>
</body>
</html>

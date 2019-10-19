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



%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Batch Delete Forum Topics</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
     	
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Batch Delete Forum Topics</font></h1>
<div align="center">
 <p><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
  <br>
  If you find the forum starts running a bit slow it maybe worth cleaning the database out by deleting topics.<br>
  <br>
  Select the Topics you want deleted by Forum and when a posts was last posted in them.</font><br>
 </p>
 </div>
<form method="post" name="frmChangePassword" action="batch_delete_posts.asp" onSubmit="return confirm('Are you sure you want to delete these topics?\n\nOnce the topics are deleted they will be lost forever.')">
  <table width="680" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="8">
    <tr> 
      <td height="24" width="680"> 
        
    <table width="100%" border="0" align="center"  height="8" cellpadding="4" cellspacing="1">
     <tr bgcolor="#CCCCCC" > 
      <td align="left" width="53%" height="2" class="text"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Delete Topics in</font></b></td>
      <td height="2" width="47%" class="text"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Delete Topics that haven't been posted for</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="53%"  height="12"> 
       <select name="ForumID">
        <option value="0" selected>All Forums</option>
        <%
Dim rsForum
                
'Create a recordset to hold the forum name and id number
Set rsForum = Server.CreateObject("ADODB.Recordset")

'Read in the forum name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.Forum_name, tblForum.Forum_ID FROM tblForum ORDER BY tblForum.Forum_Order ASC;"

'Query the database
rsForum.Open strSQL, strCon

'Loop through all the froum in the database
Do while NOT rsForum.EOF 

	'Display a link in the link list to the forum
	Response.Write vbCrLf & "<option value=" & CLng(rsForum("Forum_ID")) & " "
	Response.Write ">" & rsForum("Forum_name") & "</option>"		
			
	'Move to the next record in the recordset
	rsForum.MoveNext
Loop

'Reset server objects
Set adoCon = Nothing
Set strCon = Nothing
Set rsForum = Nothing
%>
       </select>
      </td>
      <td height="12" width="47%" valign="top"> 
       <select name="days">
        <option value="0">Now</option>
        <option value="7">1 Week</option>
        <option value="14">2 Weeks</option>
        <option value="31">1 Month</option>
        <option value="62">2 Months</option>
        <option value="124">4 Months</option>
        <option value="182" selected>6 Months</option>
        <option value="279">9 Months</option>
        <option value="365">1 Year</option>
        <option value="730">2 Years</option>
       </select>
      </td>
     </tr>
    </table>
      </td>
    </tr>
  </table>
  <div align="center"><br>
    <input type="submit" name="Submit" value="Delete Topics">
  </div>
</form>
<br>
</body>
</html>

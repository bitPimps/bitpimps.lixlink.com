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
Dim rsBadWords		'Holds the Database Recordset for the users last post

%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Configure Bad Word Filter</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Configure Bad Word Filter</font></h1>
<div align="center"> <a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><br>
 <form name="frmAddNewWords" method="post" action="bad_word_filter_add_new.asp">
  <table width="574" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
   <tr> 
    <td> 
     <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
      <tr> 
       <td align="center"> <b><font size="5" face="Arial, Helvetica, sans-serif">Add New Bad Words To List</font></b><br>
        <br>
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Type any words you would like to add to the Bad Word filter into the boxes below.<br>
        Both the <i>Bad Word</i> and the <i>Replace With</i> boxes must be filled in for each new word.<br>
        You can add between 1 and 3 new bad words at once. </font><br>
        <br>
        <table width="300" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
         <tr> 
          <td> 
           <table width="100%" border="0" cellspacing="1" cellpadding="4">
            <tr bgcolor="#CCCCCC" align="center"> 
             <td width="50%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Bad Word</font></b></td>
             <td width="50%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Replace With</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
             <td width="50%"> 
              <input type="text" name="badWord1" maxlength="49">
             </td>
             <td width="50%"> 
              <input type="text" name="replaceWord1" maxlength="49">
             </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
             <td width="50%"> 
              <input type="text" name="badWord2" maxlength="49">
             </td>
             <td width="50%"> 
              <input type="text" name="replaceWord2" maxlength="49">
             </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
             <td width="50%"> 
              <input type="text" name="badWord3" maxlength="49">
             </td>
             <td width="50%"> 
              <input type="text" name="replaceWord3" maxlength="49">
             </td>
            </tr>
           </table>
          </td>
         </tr>
        </table>
        <br>
        <input type="submit" name="Submit" value="Add New Bad Words To List">
        <br>
        <br>
       </td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
  <br>
  <br>
 </form>
 <table width="574" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
  <tr> 
   <td> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
     <tr> 
      <td height="255"> 
       <div align="center"><font size="5"><b><font face="Arial, Helvetica, sans-serif">Remove Bad Words From List</font><br>
        </b></font><br>
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Place a tick in the checkbox for any bad words you wish to remove from the list <br>
        then click on the Delete Bad Words from List button.</font></div>
       <div align="center"> 
        <form name="frmModerators" method="post" action="bad_word_filter_delete.asp">
         <table width="300" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
          <tr> 
           <td bgcolor="#000000"> 
            <table width="100%" border="0" cellspacing="1" cellpadding="4" height="14">
             <tr bgcolor="#CCCCCC"> 
              <td height="2" width="14%" align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Delete</font></b></td>
              <td height="2" width="46%" align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Bad Word</font></b></td>
              <td height="2" width="40%" align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Replaced With</font></b></td>
             </tr>
             <%        
'Intialise the ADO recordset object
Set rsBadWords = Server.CreateObject("ADODB.Recordset")
						
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblSmut.* FROM tblSmut ORDER BY tblSmut.Smut ASC;"
				
'Query the database
rsBadWords.Open strSQL, strCon

'Display the bad words       		
Do While NOT rsBadWords.EOF		
			%>
             <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="center" height="24"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
               <input type="checkbox" name="chkWordID" value="<% = rsBadWords("ID_no") %>">
               </font></td>
              <td width="46%" align="left" height="24"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
               <% = rsBadWords("Smut") %>
               </font></td>
              <td width="40%" align="left" height="24"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
               <% = rsBadWords("Word_replace") %>
               </font></td>
             </tr>
             <%
		
	'Move to the next record in the database
	rsBadWords.MoveNext
	
'Loop back round   	
Loop
	

%>
            </table>
           </td>
          </tr>
         </table>
         <br>
         <input type="submit" name="Submit" value="Delete Bad Words From List">
         <br>
        </form>
       </div>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br>
</div>
<br>
</body>
</html>


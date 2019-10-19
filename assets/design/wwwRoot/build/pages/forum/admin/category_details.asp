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
Dim rsCategory 		'Recorset holding all the username in the database				
Dim strMode		'holds the mode of the page, set to true if changes are to be made to the database
Dim strCatName		'Holds the name of the category
Dim intCatID		'Holds the ID number of the category
 

'Read in the details
intCatID = CInt(Request.QueryString("CatID"))
strMode = Request("mode")


'Intialise the ADO recordset object
Set rsCategory  = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblCategory.* From tblCategory WHERE tblCategory.Cat_ID=" & intCatID & ";"

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsCategory.LockType = 3
	
'Query the database
rsCategory.Open strSQL, strCon

'If the user is changing the email setup then update the database
If (strMode = "edit" OR strMode = "new") AND CBool(Request.Form("postBack")) Then

	'If this is a new one add new
	If strMode = "new" Then rsCategory.AddNew

	'Update the recordset
	rsCategory.Fields("Cat_name") = Request.Form("category")
					
	'Update the database with the new user's details
	rsCategory.Update
	
	'If this is a new forum go back to the main forums page
	If strMode = "new" Then
		
		'Release server varaibles
		rsCategory.Close
		Set rsCategory = Nothing
		Set adoCon = Nothing
		Set strCon = Nothing
		
		Response.Redirect"view_forums.asp"
	End If	
		
	'Re-run the query to read in the updated recordset from the database
	rsCategory.Requery	
End If

'Read in the forum details from the recordset
If NOT rsCategory.EOF Then
	
	'Read in the forums from the recordset
	intCatID = CInt(rsCategory("Cat_ID"))
	strCatName = rsCategory("Cat_name")
End If

'Release server varaibles
rsCategory.Close
Set rsCategory = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Category Details</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a a category
	if (document.frmNewForum.category.value==""){
		alert("Please enter the Category");
		return false;
	}
	
	return true
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Category</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 <a href="view_forums.asp" target="_self">Return to the Category and Forum Set up and Admin page</a><br>
 </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> </font></div>
<form method="post" name="frmNewForum" action="category_details.asp?CatID=<% = intCatID %>" onSubmit="return CheckForm();">
 <br>
 <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
   <td width="450"> 
    <table width="100%" border="0" align="center" class="normal" cellpadding="4" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" class="arial_sm2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Forum Details</b></font></td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">category*</font></td>
      <td width="43%" valign="top"> 
       <input type="text" name="category" maxlength="50" size="30" value="<% = strCatName %>" >
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br>
 <div align="center"><br>
  <input type="hidden" name="postBack" value="true">
  <input type="hidden" name="mode" value="<% = strMode %>">
  <input type="submit" name="Submit2" value="Submit Category">
  <input type="reset" name="Reset2" value="Clear Form">
  <br>
 </div>
</form>
</body>
</html>
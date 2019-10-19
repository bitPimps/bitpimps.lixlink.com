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
Dim rsForum 		'Recorset holding all the username in the database				
Dim strMode		'holds the mode of the page, set to true if changes are to be made to the database
Dim strForumName	'Holds the name of the forum
Dim strForumDescription	'Holds the discription of the forum
Dim strForumPassword	'Holds the forum password
Dim intForumID		'Holds the forum ID number
Dim strForumCode	'Holds a security code for the forum if it is password protected
Dim rsForumCat		'Holds the recordset for the categories
Dim strCatName		'Holds the name of the category
Dim intCatID		'Holds the ID number of the category
Dim intSelCatID		'Holds the selected cat id
Dim intGuest		'Holds the guests access rights
Dim intStandard		'Holds the standard access rights
Dim intSuper		'Holds the super access rights
Dim intPower		'Holds the power access rights
 
'Initilise variables    
intCatID = 0
intGuest = 2
intStandard = 1
intSuper = 1
intPower = 1

'Read in the details
intForumID = CInt(Request.QueryString("ForumID"))
strForumPassword = Request.Form("password")


strMode = Request("mode")


'Intialise the ADO recordset object
Set rsForum  = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblForum.* From tblForum WHERE tblForum.Forum_ID=" & intForumID & ";"

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsForum.LockType = 3
	
'Query the database
rsForum.Open strSQL, strCon

'If the user is changing the email setup then update the database
If (strMode = "edit" OR strMode = "new") AND CBool(Request.Form("postBack")) Then

	'If this is a new one add new
	If strMode = "new" Then rsForum.AddNew

	'Update the recordset
	rsForum.Fields("Cat_ID") = CInt(Request.Form("cat"))
	rsForum.Fields("Forum_name") = Request.Form("forumName")
	rsForum.Fields("Forum_description") = Request.Form("description")
	rsForum.Fields("Guest") = CInt(Request.Form("Guest"))
	rsForum.Fields("Standard") = CInt(Request.Form("Standard"))
	rsForum.Fields("Super") = CInt(Request.Form("Super"))
	rsForum.Fields("Power") = CInt(Request.Form("Power"))
	'See if there is a password if not the filed must be null
	If strPassword = "" Then
		rsForum.Fields("Password") = null
		rsForum.Fields("Forum_code") = null
	Else
	
		'Create a forum code
		'Randomise the system timer
		Randomize Timer
		
		'Calculate a code for the forum
		strForumCode = intForumID & Left(strForumName,1) & (9876989856 * CInt((RND * 32000) + 100)) & Right(strPassword,1)
		
		rsForum.Fields("Password") = strForumPassword
		rsForum.Fields("Forum_code") = strForumCode
	End If
					
	'Update the database with the new user's details
	rsForum.Update
	
	'If this is a new forum go back to the main forums page
	If strMode = "new" Then
		
		'Release server varaibles
		rsForum.Close
		Set rsForum = Nothing
		Set adoCon = Nothing
		Set strCon = Nothing
		
		Response.Redirect"view_forums.asp"
	End If	
		
	'Re-run the query to read in the updated recordset from the database
	rsForum.Requery	
End If

'Read in the forum details from the recordset
If NOT rsForum.EOF Then
	
	'Read in the forums from the recordset
	intCatID = CInt(rsForum("Cat_ID"))
	strForumName = rsForum("Forum_name")
	strForumDescription = rsForum("Forum_description")
	intForumID = CInt(rsForum("Forum_ID"))
	strForumPassword = rsForum("Password")
	intGuest = CInt(rsForum("Guest"))
	intStandard = CInt(rsForum("Standard"))
	intSuper = CInt(rsForum("Super"))
	intPower = CInt(rsForum("Power"))
End If

'Release server varaibles
rsForum.Close
Set rsForum = Nothing


'Create a recordset to hold the forum name and id number
Set rsForumCat = Server.CreateObject("ADODB.Recordset")

'Read in the category name from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblCategory.Cat_name, tblCategory.Cat_ID FROM tblCategory ORDER BY tblCategory.Cat_order ASC;"

'Query the database
rsForumCat.Open strSQL, strCon
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Forum Details</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a a category
	if (document.frmNewForum.cat.value==""){
		alert("Please select the Category this Forum is to be in");
		return false;
	}

	//Check for a website name
	if (document.frmNewForum.forumName.value==""){
		alert("Please enter a Name for the Forum");
		document.frmNewForum.forumName.focus();
		return false;
	}
	
	//Check for a path to the forum
	if (document.frmNewForum.description.value==""){
		alert("Please enter a Description for the Forum");
		document.frmNewForum.description.focus();
		return false;
	}
	
	return true
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Forum Details</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 <a href="view_forums.asp" target="_self">Return to the Category and Forum Set up and Admin page</a><br>
 <br>
 </font> 
 <%
 If rsForumCat.EOF Then
 	%>
 <table width="98%" border="0" cellspacing="0" cellpadding="1" height="135">
  <tr>
   <td align="center"><font face="Arial, Helvetica, sans-serif"><b><font size="3">You must first enter a Forum Category to place your new Forum in.<br>
    <br>
    </font></b><font size="3"><a href="category_details.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Enter a Forum Category</font></a></font></font></td>
  </tr>
 </table>
<%
Else
%>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> </font></div>
<form method="post" name="frmNewForum" action="forum_details.asp?ForumID=<% = intForumID %>" onSubmit="return CheckForm();">
 <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
   <td width="450"> 
    <table width="100%" border="0" align="center" class="normal" cellpadding="4" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" class="arial_sm2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Select Forum Category</b></font></td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" colspan="2" class="arial"> 
       <select name="cat">
        <option value=""<% If intCatID = 0 Then Response.Write(" selected") %>>-- Select Forum Category --</option>
        <%
'Declare variables

'Loop through all the categories in the database
Do while NOT rsForumCat.EOF 

	'Read in the deatils for the category
	strCatName = rsForumCat("Cat_name")
	intSelCatID = Cint(rsForumCat("Cat_ID"))	
	
	'Display a link in the link list to the cat
	Response.Write (vbCrLf & "		<option value=""" & intSelCatID & """")
	If intCatID = intSelCatID Then Response.Write(" selected")
	Response.Write(">" & strCatName & "</option>")


	'Move to the next record in the recordset
	rsForumCat.MoveNext
Loop

'Reset Server Objects
rsForumCat.Close
Set rsForumCat = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
       </select>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br>
 <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
   <td width="450"> 
    <table width="100%" border="0" align="center" class="normal" cellpadding="4" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" class="arial_sm2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Forum Details</b></font></td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Forum Name*</font></td>
      <td width="43%" valign="top"> 
       <input type="text" name="forumName" maxlength="70" size="30" value="<% = strForumName %>" >
      </td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Forum Description*<br>
       <font size="1">Give a brief description of the forum</font></font></td>
      <td width="43%" valign="top"> 
       <input type="text" name="description" maxlength="190" size="30" value="<% = strForumDescription %>" >
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br>
 <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
   <td width="450"> 
    <table width="100%" border="0" align="center" class="normal" cellpadding="4" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" class="arial_sm2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Forum Permissions</b></font></td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Guests:<br>
       <font size="1">Guest Posting most also be enabled from the Forum Configuration page if you want to allow write permissions for Guests on this forum.</font></font></td>
      <td width="43%" valign="top"> 
       <select name="Guest">
        <option value="1"<% If intGuest = 1 Then Response.Write(" selected") %>>Read and Write</option>
        <option value="2"<% If intGuest = 2 Then Response.Write(" selected") %>>Read Only</option>
        <option value="3"<% If intGuest = 3 Then Response.Write(" selected") %>>No Access</option>
       </select>
      </td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Standard Members:</font></td>
      <td width="43%" valign="top"> 
       <select name="Standard">
        <option value="1"<% If intStandard = 1 Then Response.Write(" selected") %>>Read and Write</option>
        <option value="2"<% If intStandard = 2 Then Response.Write(" selected") %>>Read Only</option>
        <option value="3"<% If intStandard = 3 Then Response.Write(" selected") %>>No Access</option>
       </select>
      </td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Gold Members:</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
       </font> </td>
      <td width="43%" valign="top"> 
       <select name="Super">
        <option value="1"<% If intSuper = 1 Then Response.Write(" selected") %>>Read and Write</option>
        <option value="2"<% If intSuper = 2 Then Response.Write(" selected") %>>Read Only</option>
        <option value="3"<% If intSuper = 3 Then Response.Write(" selected") %>>No Access</option>
       </select>
      </td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Platinum Members:</font></td>
      <td width="43%" valign="top"> 
       <select name="Power">
        <option value="1"<% If intPower = 1 Then Response.Write(" selected") %>>Read and Write</option>
        <option value="2"<% If intPower = 2 Then Response.Write(" selected") %>>Read Only</option>
        <option value="3"<% If intPower = 3 Then Response.Write(" selected") %>>No Access</option>
       </select>
      </td>
     </tr>
     <tr class="arial" bgcolor="#FFFFFF"> 
      <td align="left" width="57%" class="arial"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Password:<br>
       <font size="1">If you want this forum password protected place the password here. Otherwise leave it blank.</font></font></td>
      <td width="43%" valign="top"> 
       <input type="text" name="password" maxlength="20" size="20" value="<% = strForumPassword %>" >
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <div align="center"><br>
  <input type="hidden" name="postBack" value="true">
  <input type="hidden" name="mode" value="<% = strMode %>">
  <input type="submit" name="Submit2" value="Submit Forum Details">
  <input type="reset" name="Reset2" value="Clear Form">
  <br>
 </div>
</form>
<%
End If
%>
</body>
</html>

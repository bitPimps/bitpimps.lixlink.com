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
Dim rsProfile 			'Holds the Database Recordset for the author profile
Dim rsProfileUpdate		'Holds the databse recordset to be updated
Dim strUsersName
Dim strUsersPassword		'Holds the new users password
Dim strEmail			'Holds the new users e-mail address
Dim strLocation			'Holds the new users location
Dim strHomepage			'Holds the new users homepage if they have one
Dim strCheckUsername		'Holds the usernames from the database recordset to check against the new users requested username
Dim lngUserID			'Holds the profile id number
Dim strSignature		'Holds the users signature
Dim strAvatar			'Holds the users avatar
Dim intStatus			'Holds integer status of the member
Dim blnActive			'Set to true if the forum membership is active


'Read in the users details from the form
strUsersPassword = Request.Form("password")
strEmail = Request.Form("email")
strLocation = Request.Form("location")
strHomepage = Request.Form("homepage")
lngUserID = CLng(Request("profile"))


'If the Profile has already been edited then update the Profile
If Request.Form("mode") = "update" Then
	
	
	
	'If the user has not entered a hoempage then make sure the homepage variable is blank
	If strHomepage = "http://" Then strHomepage = ""
		
	'Intialise the ADO recordset object
	Set rsProfileUpdate = Server.CreateObject("ADODB.Recordset")
	
	'Intialise the strSQL variable with an SQL string to open a record set for the Author table
	strSQL = "SELECT tblAuthor.* From tblAuthor "
	strSQL = strSQL & "WHERE tblAuthor.Author_ID =" & lngUserID & ";"
	
	'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
	rsProfileUpdate.CursorType = 2
	
	'Set the Lock Type for the records so that the record set is only locked when it is updated
	rsProfileUpdate.LockType = 3
	
	'Open the author table
	rsProfileUpdate.Open strSQL, strCon
		
	'Insert the new user's details into the NewUser recordset
	rsProfileUpdate.Fields("Password") = strUsersPassword
	rsProfileUpdate.Fields("Author_email") = strEmail
	rsProfileUpdate.Fields("Homepage") = strHomepage
	rsProfileUpdate.Fields("Location") = strLocation
	rsProfileUpdate("Status") = CLng(Request.Form("memLevel"))
	'Only change the active status if this is not forum admin or guest accounts
	If lngUserID > 2 Then
		rsProfileUpdate("Active") = CBool(Request.Form("memActive"))
	End If
	If CBool(Request.Form("signature")) Then
		rsProfileUpdate.Fields("Signature") = ""
	End If
	If CBool(Request.Form("avatar")) Then
		rsProfileUpdate.Fields("Avatar") = ""
	End If
			
	'Update the database with the new user's details
	rsProfileUpdate.Update	
	
	'Re-run the query to read in the updated recordset from the database
	rsProfileUpdate.Requery	
	
	'Reset server Object
	rsProfileUpdate.Close
	Set rsProfileUpdate = Nothing		
End If


'Intialise the ADO recordset object
Set rsProfile = Server.CreateObject("ADODB.Recordset")
	
'Read the various forums from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblAuthor.* "
strSQL = strSQL & "FROM tblAuthor "
strSQL = strSQL & "WHERE tblAuthor.Author_ID = " & lngUserID
		
'Query the database
rsProfile.Open strSQL, strCon

If Not rsProfile.EOF Then	
	'Read in the new user's profile from the recordset
	strUsersName = rsProfile("Username")
	strUsersPassword = rsProfile("Password")
	strEmail = rsProfile("Author_email")
	strHomepage = rsProfile("Homepage")
	strLocation = rsProfile("Location")
	strSignature = rsProfile("Signature") & ""
	strAvatar = rsProfile("Avatar")
	intStatus = CLng(rsProfile("Status"))
	blnActive = CBool(rsProfile("Active"))
End If
%>
<HTML>
<HEAD>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<TITLE>Forum Membership Admin</TITLE>
<!-- The Web Wiz Guide ASP forum is written by Bruce Corkhill ©2001
    	 If you want your forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	//Check for a path to the forum
	if (document.frmSelectMod.SelectForum.value==""){
		alert("Please select a forum you want this person to be a moderator of");
		return false;
	}
	return true
}

//Funtion to check or uncheck all the dete boxes
function checkAll(){
	
	for (i=0; i < document.frmMod.chkRemove.length; i++){
		document.frmMod.chkRemove[i].checked = document.frmMod.chkAll.checked;
	}
}

// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center">Forum Membership Admin</h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><br>
 <a href="select_forum_members.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Select another Forum Member to Administer</font></a><br>
<%
'If there is no member then display no mem msg
If rsProfile.EOF Then
	%>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="223">
  <tr>
   <td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><b><font size="3">No Profile can be found for this member, <br>
    either there account doesn't exist or it has been deleted!</font></b></font></td>
  </tr>
 </table>
</div>
<%
Else
%>
<div align="center"><br>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2">From here you can alter the members details, change there status, make them moderators or delete 
 there account.<br>
 Please note you can not delete or make moderators of the Admin or Guest accounts.</font></div>
<form method="post" name="frmRegister" action="member_profile.asp?profile=<% = lngUserID %>">
 <br>
 <table width="590" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="167">
  <tr> 
   <td height="92" width="680"> 
    <table width="590" border="0" align="center" cellpadding="3" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
       <% = strUsersName %>
       Profile</b></font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Username</font></td>
      <td width="220" class="text"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <% = strUsersName %>
       <input type="hidden" name="mode" value="update">
       &nbsp;</font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Password</font></td>
      <td width="220" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       
       <input type="text" name="password" size="15" maxlength="15" value="<% = strUsersPassword %>" >
       </font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Account Status</font></td>
      <td width="220" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
       <select name="memActive">
        <option value="true"<% If blnActive = True Then Response.Write(" selected") %>>Active</option>
        <option value="false"<% If blnActive = False Then Response.Write(" selected") %>>Suspended</option>
       </select>
       </font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Member group</font></td>
      <td width="220" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="memLevel">
        <option value="0"<% If intStatus = 0 Then Response.Write(" selected") %>>Guest</option>
        <option value="1"<% If intStatus = 1 Then Response.Write(" selected") %>>Standard Member</option>
        <option value="2"<% If intStatus = 2 Then Response.Write(" selected") %>>Gold Member</option>
        <option value="3"<% If intStatus = 3 Then Response.Write(" selected") %>>Platinum Member</option>
       </select>
       </font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">E-mail<br>
       </font></td>
      <td width="220" valign="top"> 
       <input type="text" name="email" size="30" maxlength="50" value="<% = strEmail %>">
       &nbsp;</td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Homepage</font></td>
      <td width="220"> 
       <input type="text" name="homepage" size="30" maxlength="50" value="<% If strHomepage = "" Then Response.Write "http://" Else Response.Write strHomepage %>">
      </td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="351" class="text" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Avatar<br>
       </font></td>
      <td width="220" valign="top" class="text"> <img src="<%
	'If there is an avatar then display it
	If strAvatar <> "" Then
		If Instr(1, strAvatar, "http://", vbTextCompare) Then
			Response.Write(strAvatar)
		Else
			Response.Write("../" & strAvatar)
		End If
	Else
		Response.Write("../avatars/blank.gif")
	End If
		%>" width="32" height="32" name="avatar"> 
       <input type="checkbox" name="avatar" value="true">
       <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Remove Avatar</font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" colspan="2"> 
       <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <tr> 
         <td><span class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Signature:</font></span></td>
        </tr>
        <tr> 
         <td> 
          <table width="98%" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000">
           <tr> 
            <td> 
             <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#E7E7E7">
              <tr> 
               <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = strSignature %>&nbsp;</font></td>
              </tr>
             </table>
            </td>
           </tr>
          </table>
         </td>
        </tr>
        <tr> 
         <td align="right"> 
          <input type="checkbox" name="signature" value="true">
          <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Remove Signature</font></td>
        </tr>
       </table>
      </td>
     </tr>
     <tr bgcolor="#FFFFFF" align="center"> 
      <td valign="top" colspan="2"> 
       <input type="submit" name="Submit" value="Update Profile">
       <input type="reset" name="Reset" value="Reset Form">
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</form>
<%
	'If the member is not admin or guest account let them set moderator on it or delete account
	If lngUserID > 2 Then

		'Dimension variables
		Dim rsModerator		'rs holding the moderator details
		Dim rsModForum		'rs holding the forum name the members is a moderator of
		Dim strModForumName	'Holds the forum name the members is a moderator of
		
		'Intialise the ADO recordset object
		Set rsModerator = Server.CreateObject("ADODB.Recordset")
		Set rsModForum = Server.CreateObject("ADODB.Recordset")
			
		'Read in the forum id's this member is a moderator of
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT tblModerator.Forum_ID, tblModerator.Moderator_ID FROM tblModerator WHERE tblModerator.Author_ID=" & lngUserID & ";"
			
		'Query the database
		rsModerator.Open strSQL, strCon

%>
<div align="center"><br>
 <form name="frmMod" method="post" action="remove_moderator.asp">
  <table width="590" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
   <tr> 
    <td width="680"> 
     <table width="590" border="0" align="center" cellpadding="3" cellspacing="1">
      <tr align="left" bgcolor="#CCCCCC"> 
       <td width="524" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Moderator<br>
        </b><% = strUsersName %> is a moderator of the following Forums</font></td>
       <td class="text" width="51" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="checkbox" name="chkAll" value="" onClick="checkAll();">
        </font></td>
      </tr>
      <%
			'If the member is not a moderator then dsiplay so
			If rsModerator.EOF Then
				Response.Write("<tr bgcolor=""#FFFFFF""><td colspan=""2""><font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">This member is not a moderator of any Forums<input type=""hidden"" name=""chkRemove"" value=""-1""></font></tr>")
			
			'Else display the forums this person is a moderator of
			Else
				'Loop through each forum and dsiplay
				Do While NOT rsModerator.EOF
						
					'Read in the forum id's this member is a moderator of
					'Initalise the strSQL variable with an SQL statement to query the database
					strSQL = "SELECT tblForum.Forum_name FROM tblForum WHERE tblForum.Forum_ID=" & CInt(rsModerator("Forum_ID")) & ";"
						
					'Query the database
					rsModForum.Open strSQL, strCon
					
					'If there is a recor display it
					If CInt(rsModerator("Forum_ID")) = 0 OR NOT rsModForum.EOF Then
					
						'Get the forum name unless forum ID is 0 then they are moderator of all forums
						If CInt(rsModerator("Forum_ID")) = 0 Then
							strModForumName = "All Forums"
						Else	
							strModForumName = rsModForum("Forum_name")
						End If
	%>
      <tr bgcolor="#FFFFFF"> 
       <td align="left" width="524" class="text" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = strModForumName %></font></td>
       <td align="center" class="text" valign="top" width="51"> 
        <input type="checkbox" name="chkRemove" value="<% = rsModerator("Forum_ID") %>">
       </td>
      </tr>
	      <%
		      			End If
		      			
		      			'Clean up
		      			rsModForum.Close
		      		
		      			'Move to next record
		      			rsModerator.MoveNext
		      		Loop
		      	End If
      %>
      <tr bgcolor="#FFFFFF" align="center"> 
       <td colspan="2" class="text" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <span class="text"> 
        <input type="hidden" name="user" value="<% = lngUserID %>">
        </span> 
        <input type="submit" name="Submit2" value="Remove as Moderator from Selected Forums">
        </font></td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
 </form>
 <br>
 <form name="frmSelectMod" method="post" action="make_moderator.asp" onSubmit="return CheckForm();">
  <table width="590" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000">
   <tr> 
    <td width="680"> 
     <table width="590" border="0" align="center" cellpadding="3" cellspacing="1">
      <tr align="left" bgcolor="#CCCCCC"> 
       <td colspan="2" class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Make 
        <% = strUsersName %>
        a Moderator of the following forum</b></font></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
       <td align="left" colspan="2" class="text" valign="top"><span class="text"> 
        <select name="SelectForum">
         <option value="" selected>-- Select Forum --</option>
         <option value="0">&nbsp;&nbsp;-&nbsp;All Forums</option>
         <%
		'Declare variables
		Dim rsCategorySelect	'Holds the recordset for the categories
		Dim rsSelectForum	'Holds the recordset for the forum
		Dim strCatName		'Holds the name of the category
		Dim intCatID		'Holds the ID number of the category
		Dim strForumName	'Holds the name of the forum to jump to
		Dim lngForumID		'Holds the forum id to jump to
		
		'Create a recordset to hold the forum name and id number
		Set rsCategorySelect = Server.CreateObject("ADODB.Recordset")
		
		'Create a recordset to hold the forum name and id number
		Set rsSelectForum = Server.CreateObject("ADODB.Recordset")
		
		
		'Read in the category name from the database
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT tblCategory.Cat_name, tblCategory.Cat_ID FROM tblCategory ORDER BY tblCategory.Cat_order ASC;"
		
		'Query the database
		rsCategorySelect.Open strSQL, strCon
		
		'Loop through all the categories in the database
		Do while NOT rsCategorySelect.EOF 
		
			'Read in the deatils for the category
			strCatName = rsCategorySelect("Cat_name")
			intCatID = Cint(rsCategorySelect("Cat_ID"))	
			
			'Display a link in the link list to the forum
			Response.Write vbCrLf & "		<option value="""">" & strCatName & "</option>"
		
			'Read in the forum name from the database
			'Initalise the strSQL variable with an SQL statement to query the database
			strSQL = "SELECT tblForum.Forum_name, tblForum.Forum_ID FROM tblForum WHERE tblForum.Cat_ID = " & intCatID & " ORDER BY tblForum.Forum_Order ASC;"
			
			'Query the database
			rsSelectForum.Open strSQL, strCon
			
			'Loop through all the froum in the database
			Do while NOT rsSelectForum.EOF 
			
				'Read in the forum details from the recordset
				strForumName = rsSelectForum("Forum_name")
				lngForumID = CLng(rsSelectForum("Forum_ID"))
				
				
				'Display a link in the link list to the forum
				Response.Write vbCrLf & "		<option value=""" & lngForumID & """>&nbsp;&nbsp;-&nbsp;" & strForumName & "</option>"		
				
						
				'Move to the next record in the recordset
				rsSelectForum.MoveNext
			Loop
			
			'Close the forum recordset so another can be opened
			rsSelectForum.Close
			
			'Move to the next record in the recordset
			rsCategorySelect.MoveNext
		Loop
		
		'Reset Server Objects
		rsCategorySelect.Close
		Set rsCategorySelect = Nothing
		Set rsSelectForum = Nothing
%>
        </select>
        <input type="hidden" name="user" value="<% = lngUserID %>">
        <input type="submit" name="Submit3" value="Make Moderator">
        </span></td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
 </form>
 <br>
 <input type="button" name="Submit4" value="Delete This Member!" onClick="if (window.confirm('Are you sure you want to permanently Delete this Member from the Forum?')) window.open('../delete_member.asp?ID=<% = lngUserID %>&Return=admin','_self');">
</div>
</body>
</html>
<%
		'Clear up
		rsModerator.Close
		Set rsModerator = Nothing
		Set rsModForum = Nothing
	End If
End If

rsProfile.Close
Set rsProfile = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>
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
<title>Set up and Administer Forums</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

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
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Set up and Administer Forums</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><br>
</div>
<form name="form1" method="post" action="update_forum_order.asp">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
   <td align="center" height="91"> <b><font size="5" face="Arial, Helvetica, sans-serif">Forum Details</font><font size="5"><br>
    </font></b>
    <table width="98%" border="0" cellspacing="0" cellpadding="1">
     <tr align="center"> 
      <td width="50%"><a href="category_details.asp?mode=new" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Add New Forum Category</font></a></td>
      <td width="50%"><a href="forum_details.asp?mode=new" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Add New Forum</font></a></td>
     </tr>
    </table>
    <br>
    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Click on Forum name or Category to Amend Details.<br>
    <br>
    Select the order you would like the forums to be in from the Order drop down list and click on the Update Order button </font> 
 </table>
 <br>
 <table width="99%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000" align="center">
  <tr> 
   <td> 
    <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center">
     <tr> 
      <td bgcolor="#CCCCCC" class="text" height="12"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"></font></b><b><span style="font-size: 12px;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Forum</font></span></b></td>
      <td bgcolor="#CCCCCC" class="heading" width="9%" height="12" align="center"><b><span style="font-size: 12px;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Lock</font></span></b></td>
      <td bgcolor="#CCCCCC" class="heading" width="9%" height="12" align="center"><b><span style="font-size: 12px;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Delete</font></span></b></td>
      <td bgcolor="#CCCCCC" class="heading" width="10%" height="12" align="center"><b><span style="font-size: 12px;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Order</font></span></b></td>
     </tr>
     <%

'Dimension variables
Dim rsCategory			'db recordset object
Dim rsForum 			'Holds the Recordset for the forum details
Dim strCategory			'Holds the categories
Dim intCatID			'Holds the category ID number
Dim intForumID			'Holds the forum ID number
Dim strForumName		'Holds the forum name
Dim strForumDiscription		'Holds the forum description
Dim blnForumLocked		'Set to true if the forum is locked
Dim intLoop			'Holds the number of times round in the Loop Counter
Dim intNumOfForums		'Holds the number of forums
Dim intForumOrder		'Holds the order number of the forum
Dim intNumOfCategories		'Holds the number of categories
Dim intCatOrder			'Holds the order number of the category


'Craete a recordset to get the forum details
Set rsCategory = Server.CreateObject("ADODB.Recordset")

'Read the various categories from the database
'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblCategory.* FROM tblCategory ORDER BY tblCategory.Cat_order ASC;"

rsCategory.CursorType = 1

'Query the database
rsCategory.Open strSQL, strCon

'Check there are categories to display
If rsCategory.EOF Then
	
	'If there are no categories to display then display the appropriate error message
	Response.Write vbCrLf & "<td bgcolor=""#FFFFFF"" colspan=""4""><font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">There are no Categories to display. <a href=""category_details.asp?mode=new"">Click here to create a Forum Category</a></font></td>"
	
'Else there the are categories so write the HTML to display categories and the forum names and a discription
Else 
	'Create a recordset to get the forum details
	Set rsForum = Server.CreateObject("ADODB.Recordset")
	
	'Get the number of categories
	intNumOfCategories = rsCategory.RecordCount
	
	'Loop round to read in all the categories in the database
	Do While NOT rsCategory.EOF
	
		'Get the category name from the database
		strCategory = rsCategory("Cat_name")
		intCatID = CInt(rsCategory("Cat_ID"))
		intCatOrder = CInt(rsCategory("Cat_order"))
		
	
		'Display the category name%>
     <tr> 
      <td bgcolor="#E7E7E7" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="category_details.asp?mode=edit&CatID=<% = intCatID %>" target="_self"><b><% = strCategory %></b></a></font></td>
      <td bgcolor="#E7E7E7" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="delete_category.asp?CatID=<% = intCatID %>" onClick="return confirm('Are you sure you want to Delete this Category?\n\nWARNING: Deleting this category will permanently  remove all Forum(s) in this Category and all the Posts!')"><img src="../forum_images/delete_icon.gif" width="15" height="16" border="0" alt="Delete"></a></font></td>
      <td bgcolor="#E7E7E7" align="center"> 
       <select name="catOrder<% = intCatID %>">
        <%
           'loop round to display the number of forums for the order select list
           For intLoop = 1 to intNumOfCategories
		Response.Write("<option value=""" & intLoop & """ ")
		
			'If the loop number is the same as the order number make this one selected
			If intCatOrder = intLoop Then
				Response.Write("selected")
			End If
		
		Response.Write(">" & intLoop & "</option>")
           Next
           %>
       </select>
      </td>
     </tr>
     <%	  
		'Read the various forums from the database
		'Initalise the strSQL variable with an SQL statement to query the database
		strSQL = "SELECT tblForum.* FROM tblForum WHERE tblForum.Cat_ID = " & intCatID & " ORDER BY tblForum.Forum_Order ASC;"
		
		rsForum.CursorType = 1
		
		'Query the database
		rsForum.Open strSQL, strCon
	
		'Check there are forum's to display
		If rsForum.EOF Then

			'If there are no forum's to display then display the appropriate error message
			Response.Write vbCrLf & "<td bgcolor=""#FFFFFF"" colspan=""4""><font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">There are no Forum's to display. <a href=""forum_details.asp?mode=new"">Click here to create a Forum</a></font></td>"
		
		'Else there the are forum's to write the HTML to display it the forum names and a discription
		Else 	
		
			'Get the number of categories
			intNumOfForums = rsForum.RecordCount
				
			'Loop round to read in all the forums in the database
			Do While NOT rsForum.EOF
			
				'Read in forum details from the database
				intForumID = CInt(rsForum("Forum_ID"))
				strForumName = rsForum("Forum_name")
				strForumDiscription = rsForum("Forum_description")
				intForumOrder = CInt(rsForum("Forum_order"))
				blnForumLocked = CBool(rsForum("Locked"))
	
				'Write the HTML of the forum descriptions and hyperlinks to the forums%>
     <tr> 
      <td bgcolor="#FFFFFF" class="text"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> </font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <a href="forum_details.asp?mode=edit&ForumID=<% = intForumID %>" target="_self"><% = strForumName %></a><br>
       <span style="font-size: 11px;"><% = strForumDiscription %></span></font></td>
      <td bgcolor="#FFFFFF" width="9%" align="center" class="text"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <% 
                
		            	'If the forum is locked and the user is admin let them unlock it
				If blnForumLocked = True Then 
				  	Response.Write ("	<a href=""../lock_forum.asp?code=2&mode=UnLock&ForumID=" & intForumID & """ OnClick=""return confirm('Are you sure you want to Un-Lock this Forum?')""><img src=""../forum_images/forum_locked_icon.gif"" width=""11"" height=""14"" border=""0"" align=""baseline"" alt=""Un-Lock Forum""></a>")
				'If the forum is not lovked and this is the admin then let them lock it
				ElseIf blnForumLocked = False Then 
				  	Response.Write ("	<a href=""../lock_forum.asp?code=2&mode=Lock&ForumID=" & intForumID & """ OnClick=""return confirm('Are you sure you want to Lock this Forum?')""><img src=""../forum_images/forum_unlock_icon.gif"" width=""15"" height=""14"" border=""0"" align=""baseline"" alt=""Lock Forum""></a>")
				End If
            
               %>
       </font></td>
      <td bgcolor="#FFFFFF" width="9%" align="center" class="text"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="delete_forum.asp?ForumID=<% = intForumID %>" OnClick="return confirm('Are you sure you want to Delete this Forum?\n\nWARNING: Deleting this forum will permanently  remove all Posts in this Forum!')"><img src="../forum_images/delete_icon.gif" width="15" height="16" border="0" alt="Delete"></a></font></td>
      <td bgcolor="#FFFFFF" width="10%" class="text"  align="center"> 
       <select name="forumOrder<% = intForumID %>">
        <%
           'loop round to display the number of forums for the order select list
           For intLoop = 1 to intNumOfForums
		Response.Write("<option value=""" & intLoop & """ ")
		
			'If the loop number is the same as the order number make this one selected
			If intForumOrder = intLoop Then
				Response.Write("selected")
			End If
		
		Response.Write(">" & intLoop & "</option>")
           Next
           %>
       </select>
      </td>
     </tr>
     <%
		
				
				'Move to the next database record
				rsForum.MoveNext	
			'Loop back round for next forum
			Loop
		End If
		
		'Close recordsets
		rsForum.Close
	
		'Move to the next database record
		rsCategory.MoveNext
	'Loop back round for next category
	Loop
End If
%>
    </table>
   </td>
  </tr>
 </table>
 <div align="center"><br>
  <input type="submit" name="Submit" value="Update Order">
 </div>
</form>
<div align="center"><br>
 <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please note <b>to set up Moderators</b> on any of the Forum's please use the <a href="select_forum_members.asp" target="_self">Forum 
 Membership Administration</a>,<br>
 from where you can select moderators by clicking on the members Username and editing their Forum status.</font></div>
</body>
</html>

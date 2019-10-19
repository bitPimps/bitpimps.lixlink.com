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
Dim rsMembers 			'Holds the Database Recordset for the forum members
Dim rsLastPostDate		'Holds the Database Recordset for the users last post
Dim rsModerators		'Holds the recordset to see if the user is a moderator
Dim strPofileUsername		'Holds the users username
Dim lngUserID			'Holds the new users ID number
Dim intNumOfPosts		'Holds the number of posts the user has made
Dim intStatus			'Holds the users interger status
Dim strStatus			'Holds the users status
Dim dtmRegisteredDate		'Holds the date the usre registered
Dim intTotalNumMembersPages	'Holds the total number of pages
Dim intTotalNumMembers		'Holds the total number of forum members
Dim intRecordPositionPageNum	'Holds the page number we are on
Dim intRecordLoopCounter	'Recordset loop counter
Dim dtmLastPostDate		'Holds the date of the users las post
Dim intLinkPageNum		'Holds the page number to link to
Dim strSearchCriteria		'Holds the search critiria
Dim strSortBy			'Holds the way the records are sorted
Dim intSortSelectField		'Holds the sort selection to be shown in the sort list box

'Initalise variables
strSearchCriteria = "%"


'If this is the first time the page is displayed then the members record position is set to page 1
If Request.QueryString("MemPagePosition") = "" Then
	intRecordPositionPageNum = 1

'Else the page has been displayed before so the members page record postion is set to the Record Position number
Else
	intRecordPositionPageNum = CInt(Request.QueryString("MemPagePosition"))
End If	


'Get the search critiria for the members to display
If NOT Request.QueryString("find") = "" Then
	strSearchCriteria = Request.QueryString("find") & "%"	
End If

'Get the sort critiria
Select Case Request.QueryString("Sort")
	Case "post"
		strSortBy = "No_of_posts DESC"
		intSortSelectField = 1
	Case "latestUsers"
		strSortBy = "Join_date DESC"
		intSortSelectField = 2
	Case "oldestUsers"
		strSortBy = "Join_date ASC"
		intSortSelectField = 3
	Case "location"
		strSortBy = "Location ASC"
		intSortSelectField = 4
	Case Else
		strSortBy = "Username ASC"
		intSortSelectField = 0
End Select 


%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Forum Member Adminstration</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a somthing to search for
	if (document.frmMemberSearch.find.value==""){
		alert("Please enter a member to Search for");
		return false;
	}
	
	return true;
}
     	
//Function to choose how the members list is sorted
function MembersSort(SelectSort){

   	if (SelectSort != "") self.location.href = "select_forum_members.asp?find=<% = Server.URLEncode(Request.QueryString("find")) %>&sort=" + SelectSort.options[SelectSort.selectedIndex].value;	
	return true;
}

//Function to move to another page of members
function MembersPage(SelectPage){

   	if (SelectPage != -1) self.location.href = "select_forum_members.asp?find=<% = Request.QueryString("find") %>&sort=<% = Request.QueryString("sort") %>&MemPagePosition=" + SelectPage.options[SelectPage.selectedIndex].value;	
	return true;
}

// -->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center" class="heading">Forum Member Administration</h1>
<div align="center"> 
 <p><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration Menu</font></a><br>
 </p>
 <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Click on the members name to administer there account.<br>
  from where you can make them as moderators, change there details, or delete them from the Forum.</font><br>
 </p>
 <form name="frmMemberSearch" method="get" action="select_forum_members.asp" onSubmit="return CheckForm();">
    
  <table width="490" border="0" cellspacing="0" cellpadding="1" height="24" align="center" bgcolor="#000000">
   <tr>
        <td align="center" height="2"> 
          
     <table width="100%" border="0" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF">
      <tr> 
              
       <td align="center" bgcolor="#FFFFFF" width="100%" height="20"><span class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Search:</font></span> 
        <input type="text" name="find" size="15" maxlength="15">
                
        <input type="submit" name="Submit" value="Search">
              </td>
            </tr>
            <tr> 
              
       <td align="center" bgcolor="#FFFFFF" width="100%"><a href="select_forum_members.asp" target="_self">All</a> <a href="select_forum_members.asp?find=A" target="_self">A</a> 
        <a href="select_forum_members.asp?find=B" target="_self">B</a> <a href="select_forum_members.asp?find=C" target="_self">C</a> 
        <a href="select_forum_members.asp?find=D" target="_self">D</a> <a href="select_forum_members.asp?find=E" target="_self">E</a> 
        <a href="select_forum_members.asp?find=F" target="_self">F</a> <a href="select_forum_members.asp?find=G" target="_self">G</a> 
        <a href="select_forum_members.asp?find=H" target="_self">H</a> <a href="select_forum_members.asp?find=I" target="_self">I</a> 
        <a href="select_forum_members.asp?find=J" target="_self">J</a> <a href="select_forum_members.asp?find=K" target="_self">K</a> 
        <a href="select_forum_members.asp?find=L" target="_self">L</a> <a href="select_forum_members.asp?find=M" target="_self">M</a> 
        <a href="select_forum_members.asp?find=N" target="_self">N</a> <a href="select_forum_members.asp?find=O" target="_self">O</a> 
        <a href="select_forum_members.asp?find=P" target="_self">P</a> <a href="select_forum_members.asp?find=Q" target="_self">Q</a> 
        <a href="select_forum_members.asp?find=R" target="_self">R</a> <a href="select_forum_members.asp?find=S" target="_self">S</a> 
        <a href="select_forum_members.asp?find=T" target="_self">T</a> <a href="select_forum_members.asp?find=U" target="_self">U</a> 
        <a href="select_forum_members.asp?find=V" target="_self">V</a> <a href="select_forum_members.asp?find=W" target="_self">W</a> 
        <a href="select_forum_members.asp?find=X" target="_self">X</a> <a href="select_forum_members.asp?find=Y" target="_self">Y</a> 
        <a href="select_forum_members.asp?find=Z" target="_self">Z</a></td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
    </form>
  
</div>
<div align="center"> 
 <%
'If the user has not logged in dispaly an error message
If NOT lngLoggedInUserID = 0 Then

	'Intialise the ADO recordset object
	Set rsMembers = Server.CreateObject("ADODB.Recordset")
	
	
	'Initalise the strSQL variable with an SQL statement to query the database
	strSQL = "SELECT tblAuthor.* "
	strSQL = strSQL & "FROM tblAuthor "
	strSQL = strSQL & "WHERE (((tblAuthor.Username) Like '" & strSearchCriteria & "')) "
	strSQL = strSQL & "ORDER BY tblAuthor." & strSortBy & ";"
	
	'Set the cursor type property of the record set to dynamic so we can naviagate through the record set
	rsMembers.CursorType = 1
		
	'Query the database
	rsMembers.Open strSQL, strCon
	
	'Set the number of records to display on each page
	rsMembers.PageSize = 33
	
	
	'If there are no memebers to display then show an error message
	If rsMembers.EOF Then
		Response.Write "<font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">Sorry, your search found no forum members that match your criteria</font>"
	
	'If there is a recorset returned by the query then read in the details
	Else	
		'Set the page number to display records for
		rsMembers.AbsolutePage = intRecordPositionPageNum
		
	
		'Count the number of members there are in the database by returning the number of records in the recordset
		intTotalNumMembers = rsMembers.RecordCount	
		
		'Count the number of pages there are in the database calculated by the PageSize attribute set above
		intTotalNumMembersPages = rsMembers.PageCount
	
	
		'Display the HTML for the total number of pages and total number of records in the database for the users
		Response.Write vbCrLf & "	<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
		Response.Write vbCrLf & " 	  <tr>"
		Response.Write vbCrLf & " 	    <td align=""center""><font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">"
		
		'If we are showing all the forum memebers then display how many members there are
		If Request.QueryString("find") = "" Then
			Response.Write vbCrLf & "	      Thre are " & intTotalNumMembers & " forum members on " & intTotalNumMembersPages & " pages and you are on page number " & intRecordPositionPageNum
		'Else display how many results were fround from the search
		Else
			Response.Write vbCrLf & "	      Your search of the forum members found " & intTotalNumMembers & " matches"
		End If
		
		Response.Write vbCrLf & "	    </font></td>"
		Response.Write vbCrLf & "	  </tr>"
		Response.Write vbCrLf & "	</table>"
		Response.Write vbCrLf & "	<br>"
%>
 <form>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" height="32">
   <tr>
        
    <td align="right" height="28" valign="top"><span class="text"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Sort Results By</font></span> 
     <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
     <select name="SelectSort" onChange="MembersSort(this)">
      <option value="username" <% If intSortSelectField = 0 Then Response.Write "selected" %>>Username Alphabetically</option>
      <option value="post" <% If intSortSelectField = 1 Then Response.Write "selected" %>>No of Posts</option>
      <option value="latestUsers" <% If intSortSelectField = 2 Then Response.Write "selected" %>>New Forum Members First</option>
      <option value="oldestUsers" <% If intSortSelectField = 3 Then Response.Write "selected" %>>Old Forum Members First</option>
      <option value="location" <% If intSortSelectField = 4 Then Response.Write "selected" %>>Location Alphabetically</option>
     </select>
     </font> </td>
    </tr>
  </table>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000" align="center">
   <tr> 
    <td width="983" height="46"> 
     <table border="0" cellspacing="1" cellpadding="3" bgcolor="#000000" width="100%">
      <tr bgcolor="#CCCCCC"> 
       <td height="2" width="26%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Username</font></b></td>
       <td height="2" width="16%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Group</font></b></td>
       <td height="2" align="center" width="10%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Posts</font></b></td>
       <td align="left" height="2" width="23%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Last Post</font></b></td>
       <td align="left" height="2" width="25%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Registered</font></b></td>
      </tr>
      <%        
          	'Intialise the ADO recordset object
		Set rsLastPostDate = Server.CreateObject("ADODB.Recordset")
        		
		'For....Next Loop to loop through the recorset to display the forum members
		For intRecordLoopCounter = 1 to 33
	
			'If there are no member's records left to display then exit loop
			If rsMembers.EOF Then Exit For
			
			'Initialise varibles 
			dtmLastPostDate = ""
			
			'Read in the profile from the recordset
			lngUserID = CLng(rsMembers("Author_ID"))
			strPofileUsername = rsMembers("Username")
			intNumOfPosts = CInt(rsMembers("No_of_posts"))
			dtmRegisteredDate = CDate(rsMembers("Join_date"))
			intStatus = CInt(rsMembers("Status"))
			
			'If the users account is not active make there account level guest
			If CBool(rsMembers("Active")) = False Then intStatus = 0
			
			'Turn the members status number returned from the database into a string value
			Select Case intStatus
				'Guest status
				Case 0
					strStatus = "Guest<br><img src=""../forum_images/0_star_rating.gif"" alt=""Guest"">"  
				'Standard member status
				Case 1
					strStatus = "Standard&nbsp;Member<br><img src=""../forum_images/1_star_rating.gif"" alt=""Standard&nbsp;Member"">" 
				'Super member status
				Case 2
					strStatus = "Gold&nbsp;Member<br><img src=""../forum_images/2_star_rating.gif"" alt=""Gold&nbsp;Member"">" 
				'Power member status
				Case 3
					strStatus = "Platinum&nbsp;Member<br><img src=""../forum_images/3_star_rating.gif"" alt=""Platinum&nbsp;Member"">" 
			End select
			
			'Initalise the strSQL variable with an SQL statement to query the database
			strSQL = "SELECT TOP 1 tblThread.Message_date, tblThread.Author_ID "
			strSQL = strSQL & "FROM tblThread "
			strSQL = strSQL & "WHERE tblThread.Author_ID = " & lngUserID & " "
			strSQL = strSQL & "ORDER BY tblThread.Message_date DESC;"
					
			'Query the database
			rsLastPostDate.Open strSQL, strCon
			
			'Read in the date of the last post
			If NOT rsLastPostDate.EOF Then dtmLastPostDate = CDate(rsLastPostDate("Message_date"))
			
			'Now we need to see if the user is a moderator as if they are they will have edit options
			'Intialise the ADO recordset object
			Set rsModerators = Server.CreateObject("ADODB.Recordset")
			
			'Initalise the strSQL variable with an SQL statement to query the database to get the email address of the moderator(s) for this forum
			strSQL = "SELECT tblModerator.Moderator_ID FROM tblModerator "
			strSQL = strSQL & "WHERE tblModerator.Author_ID=" & CLng(lngUserID) & " AND tblModerator.Forum_ID=" & CInt(Request.QueryString("ForumID")) & ";"
				
			'Query the database
			rsModerators.Open strSQL, strCon
			
			'If theres a record returened then this member is the admin of this forum
			If NOT rsModerators.EOF Then strStatus = "Forum&nbsp;Moderator<br><img src=""../forum_images/4_star_rating.gif"" alt=""Forum&nbsp;Moderator"">" 
		
			'If the profile is the administrator then display forum admin
			If lngUserID = 1 Then strStatus = "Forum&nbsp;Administrator<br><img src=""../forum_images/5_star_rating.gif"" alt=""Forum Administrator"">" 
		
			'Write the HTML of the Topic descriptions as hyperlinks to the Topic details and message
			%>
      <tr bgcolor="#FFFFFF"> 
       <td height="30" class="text" width="26%"><a href="member_profile.asp?profile=<% = lngUserID %>"> 
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = strPofileUsername %></font></a></td>
       <td height="30" class="text" width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = strStatus %></font></td>
       <td align="center" height="30" class="text" width="10%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = FormatNumber(intNumOfPosts, 0) %></font></td>
       <td align="left" height="30" class="text" width="23%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <%
                 	If dtmLastPostDate = "" Then 
              			Response.Write "&nbsp;"
              	 	Else
              	 		Response.Write FormatDateTime(dtmLastPostDate, VbLongDate) 
              	 	End If
              	 %>
        </font></td>
       <td align="left" height="30" class="text" width="25%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% = FormatDateTime(dtmRegisteredDate, VbLongDate) %></font></td>
      </tr>
      <%
		
			'Move to the next record in the database
	   		rsMembers.MoveNext
	   		
	   		'Close the post date recordset
	   		rsLastPostDate.Close
	   		rsModerators.Close
	
		'Loop back round   	
		Next
	End If
	

%>
     </table>
    
   </tr>
  </table>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" height="32">
   <tr>
   <%
   'If there is more than 1 page of members then dispaly drop down list to the other members
	If intTotalNumMembersPages > 1 Then   
	
		'Display an drop down list to the other members in list
		Response.Write vbCrLf & "		<td align=""right"" height=""28"" valign=""bottom""><font face=""Verdana, Arial, Helvetica, sans-serif"" size=""2"">Page"
		Response.Write vbCrLf & "		 <select onChange=""MembersPage(this)"" name=""SelectPage"">"
		
		Dim intTopicPageLoopCounter
		
		'Loop round to display links to all the other pages
		For intTopicPageLoopCounter = 1 to intTotalNumMembersPages 
		
			'Display a link in the link list to the another members page
			Response.Write vbCrLf & "		  <option value=""" & intTopicPageLoopCounter & """"
			
			'If this page number to display is the same as the page being displayed then make sure it's selected
			If intTopicPageLoopCounter = intRecordPositionPageNum Then
				Response.Write " selected"
			End If
			
			'Display the link page number
			Response.Write ">" & intTopicPageLoopCounter & "</option>"
		
		Next
		
		'End the drop down list
		Response.Write vbCrLf & "		</select> of " & intTotalNumMembersPages & "</font></td>"
	End If
%> 
   </tr>
  </table>
<%	
	'Reset Server Variables	
	rsMembers.Close
	Set rsMembers = Nothing
	Set rsLastPostDate = Nothing
	Set rsModerators = Nothing

End If

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>
  <br>
  </form><br>
</div>
<br>
</body>
</html>
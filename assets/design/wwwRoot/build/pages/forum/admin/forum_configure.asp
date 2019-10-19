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
Dim rsForumConfiguration 		'Recorset holding all the username in the database				
Dim strWebSiteName		'Holds the web site name
Dim strHomepagePath		'Holds the path to the web sites homepage
Dim strForumPath 		'Holds the forum path
Dim strMode			'holds the mode of the page, set to true if changes are to be made to the database
Dim strBgColour			'Holds the background colour of the forum
Dim strTextColour		'Holds the text colours of the forum
Dim strTextType			'Holds the font type of the forum
Dim intTextSize			'Holds the font size of the forum
Dim strTableColour		'Holds the table colour of the forum
Dim strTableBorderColour	'Holds the border colour of the forum
Dim strTableTitleColour		'Holds the table title and status ba rof the forum
Dim strLinkColour		'Holds the Hperlink colour
Dim strVLinkColour		'Holds the visited link colour
Dim strALinkColour		'Holds the active link colour
Dim blnTextLinks		'Set to true if you want text links instead of the powered by logo
Dim blnLCode			'Holds the LCode value
Dim blnIEEditor			'Set to true if the HTML editor for IE 5+ is turned on
Dim intTopicPerPage		'Holds the number of topics to show on each page
Dim strTitleImage		'Holds the path and name for the title image for the forum
Dim blnEmoticons		'Set to true if emoticons are turned on
Dim strThreadOrder		'Holds the order the threads are in
Dim blnGuestPost		'Set to true if Guests can post messages
Dim blnAvatarImages		'Set to true if avatar images are on
Dim intRepliesPerPage		'Holds the number of replies per page
Dim intHotTopicViews		'Holds the number of views before a topic becomes hot
Dim intHotTopicReplies		'Holds the number of replies before a topic becomes hot
Dim blnPrivateMessenger		'Set to true if the private messenger is on
Dim intPrivateMessages		'Holds the number of private msg's a user can have in there inbox
Dim blnModAdmin			'Set to true if a moderator has some admin rights
      
      

'Read in the users colours for the forum
strWebSiteName = Request.Form("siteName")
strHomepagePath = Request.Form("homePath")
strForumPath = Request.Form("forumPath")
strTitleImage = Request.Form("titleImage")
blnTextLinks = Request.Form("textLinks")
blnIEEditor = CBool(Request.Form("IEEditor"))
blnLCode = CBool(Request.Form("LCode"))
intTopicPerPage	= CInt(Request.Form("topic"))
blnEmoticons = CBool(Request.Form("emoticons"))	
strThreadOrder = Request.Form("threadOrder")	

blnGuestPost = CBool(Request.Form("guestPost"))
blnAvatarImages = CBool(Request.Form("avatar"))
intRepliesPerPage = CInt(Request.Form("threads"))
intHotTopicViews = CInt(Request.Form("hotViews"))
intHotTopicReplies = CInt(Request.Form("hotReplies"))
blnPrivateMessenger = CBool(Request.Form("privateMsg"))
intPrivateMessages = CInt(Request.Form("pmNo"))
blnModAdmin = CBool(Request.Form("modAdmin"))
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
	rsForumConfiguration.Fields("Text_link") = blnTextLinks
	rsForumConfiguration.Fields("IE_editor") = blnIEEditor
	rsForumConfiguration.Fields("L_code") = blnLCode
	rsForumConfiguration.Fields("Topics_per_page") = intTopicPerPage
	rsForumConfiguration.Fields("Title_image") = strTitleImage
	rsForumConfiguration.Fields("website_name") = strWebSiteName
	rsForumConfiguration.Fields("forum_path") = strForumPath
	rsForumConfiguration.Fields("website_path") = strHomepagePath
	rsForumConfiguration.Fields("Emoticons") = blnEmoticons
	rsForumConfiguration.Fields("Guest_post") = blnGuestPost
	rsForumConfiguration.Fields("Avatar") = blnAvatarImages
	rsForumConfiguration.Fields("Threads_per_page") = intRepliesPerPage
	rsForumConfiguration.Fields("Hot_views") = intHotTopicViews
	rsForumConfiguration.Fields("Hot_replies") = intHotTopicReplies
	rsForumConfiguration.Fields("Private_msg") = blnPrivateMessenger
	rsForumConfiguration.Fields("No_of_priavte_msg") = intPrivateMessages
	rsForumConfiguration.Fields("Mod_admin") = blnModAdmin
				
	'Update the database with the new user's colours
	rsForumConfiguration.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsForumConfiguration.Requery	
End If

'Read in the forum colours from the database
If NOT rsForumConfiguration.EOF Then
	
	'Read in the colour info from the database
	blnTextLinks = rsForumConfiguration.Fields("Text_link")
	blnLCode =  CBool(rsForumConfiguration.Fields("L_code"))
	blnIEEditor =  rsForumConfiguration.Fields("IE_editor")
	intTopicPerPage = CInt(rsForumConfiguration.Fields("Topics_per_page"))
	strTitleImage = rsForumConfiguration.Fields("Title_image")
	strWebSiteName = rsForumConfiguration("website_name")
	strForumPath = rsForumConfiguration("forum_path")
	strHomepagePath = rsForumConfiguration("website_path") 
	blnEmoticons = rsForumConfiguration.Fields("Emoticons")
	blnGuestPost = CBool(rsForumConfiguration.Fields("Guest_post"))
	blnAvatarImages = rsForumConfiguration.Fields("Avatar")
	intRepliesPerPage = rsForumConfiguration.Fields("Threads_per_page")
	intHotTopicViews = rsForumConfiguration.Fields("Hot_views")
	intHotTopicReplies = rsForumConfiguration.Fields("Hot_replies")
	blnPrivateMessenger = rsForumConfiguration.Fields("Private_msg")
	intPrivateMessages = rsForumConfiguration.Fields("No_of_priavte_msg")
	blnModAdmin = rsForumConfiguration.Fields("Mod_admin")
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
<title>Configure the Forum</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Check for a web site name
	if (document.frmConfiguration.siteName.value==""){
		alert("Please enter your Website Name");
		document.frmConfiguration.siteName.focus();
		return false;
	}
	
	//Check for a path to the forum
	if (document.frmConfiguration.forumPath.value==""){
		alert("Please enter the Web Address path to the Forum");
		document.frmConfiguration.forumPath.focus();
		return false;
	}
	
	//Check for a path to your homepage
	if (document.frmConfiguration.homePath.value==""){
		alert("Please enter the Path to your Homepage");
		document.frmConfiguration.homePath.focus();
		return false;
	}
	return true
}
// -->
</script>
     	
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Configure the Forum</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a></div>
<form method="post" name="frmConfiguration" action="forum_configure.asp" onSubmit="return CheckForm();">
 <table border="0" align="center" cellpadding="4" cellspacing="1" width="681" bgcolor="#000000">
  <tr bgcolor="#CCCCCC"> 
   <td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="3"><b>Forum Configuration</b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Website name*<br>
    <font size="1">The name of your website or Forum eg. My Website Forum</font></font></td>
   <td valign="top"> 
    <input type="text" name="siteName" maxlength="50" value="<% = strWebsiteName %>" size="30" >
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Web address path to forum*<br>
    <font size="1">The web URL to your forum including your domain name and any folder the forum may be in.<br>
    eg. http://www.mywebsite.com/forum</font></font> </td>
   <td valign="top"> 
    <input type="text" name="forumPath" maxlength="50" value="<% = strForumPath %>" size="30" >
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Forum Title Image Location<br>
    <font size="1">This replaces the Web Wiz Forum's logo placed on the top of each page. Your own web sites banner logo would be good to place here.</font></font></td>
   <td valign="top"> 
    <input type="text" name="titleImage" maxlength="65" value="<% = strTitleImage %>" size="35">
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Web Address path to your homepage*<br>
    <font size="1">This is the path from the forum to your homepage to create a link from the forum to your sites homepage.</font></font></td>
   <td valign="top"> 
    <input type="text" name="homePath" maxlength="50" value="<% = strHomepagePath %>" size="30" >
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Powered by Web Wiz Guide Link logo<br>
    <font size="1">If you turn this off a text link will be displayed instead</font><br>
    </font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="textLinks" value="False" <% If blnTextLinks = False Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="textLinks" value="True" <% If blnTextLinks = True Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Avatar Images:</font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="avatar" value="True" <% If blnAvatarImages = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="avatar" value="False" <% If blnAvatarImages = False Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Emoticon Smiley Images:</font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="emoticons" value="True" <% If blnEmoticons = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="emoticons" value="False" <% If blnEmoticons = False Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Topics Per Page:<br>
    <font size="1">This is the number of Topics shown on each page.</font></font></td>
   <td valign="top"> 
    <select name="topic">
     <option <% If intTopicPerPage = 10 Then Response.Write("selected") %>>10</option>
     <option <% If intTopicPerPage = 12 Then Response.Write("selected") %>>12</option>
     <option <% If intTopicPerPage = 14 Then Response.Write("selected") %>>14</option>
     <option <% If intTopicPerPage = 16 Then Response.Write("selected") %>>16</option>
     <option <% If intTopicPerPage = 18 Then Response.Write("selected") %>>18</option>
     <option <% If intTopicPerPage = 20 Then Response.Write("selected") %>>20</option>
     <option <% If intTopicPerPage = 22 Then Response.Write("selected") %>>22</option>
     <option <% If intTopicPerPage = 24 Then Response.Write("selected") %>>24</option>
     <option <% If intTopicPerPage = 26 Then Response.Write("selected") %>>26</option>
     <option <% If intTopicPerPage = 28 Then Response.Write("selected") %>>28</option>
     <option <% If intTopicPerPage = 30 Then Response.Write("selected") %>>30</option>
     <option <% If intTopicPerPage = 32 Then Response.Write("selected") %>>32</option>
     <option <% If intTopicPerPage = 34 Then Response.Write("selected") %>>34</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Replies Per Page:<br>
    <font size="1">This is the number of Replies shown on each page of a Topic.</font></font></td>
   <td valign="top"> 
    <select name="threads">
     <option<% If intRepliesPerPage = 10 Then Response.Write(" selected") %>>3</option>
     <option<% If intRepliesPerPage = 4 Then Response.Write(" selected") %>>4</option>
     <option<% If intRepliesPerPage = 5 Then Response.Write(" selected") %>>5</option>
     <option<% If intRepliesPerPage = 6 Then Response.Write(" selected") %>>6</option>
     <option<% If intRepliesPerPage = 7 Then Response.Write(" selected") %>>7</option>
     <option<% If intRepliesPerPage = 8 Then Response.Write(" selected") %>>8</option>
     <option<% If intRepliesPerPage = 9 Then Response.Write(" selected") %>>9</option>
     <option<% If intRepliesPerPage = 10 Then Response.Write(" selected") %>>10</option>
     <option<% If intRepliesPerPage = 12 Then Response.Write(" selected") %>>12</option>
     <option<% If intRepliesPerPage = 14 Then Response.Write(" selected") %>>14</option>
     <option<% If intRepliesPerPage = 16 Then Response.Write(" selected") %>>16</option>
     <option<% If intRepliesPerPage = 18 Then Response.Write(" selected") %>>18</option>
     <option<% If intRepliesPerPage = 20 Then Response.Write(" selected") %>>20</option>
     <option<% If intRepliesPerPage = 25 Then Response.Write(" selected") %>>25</option>
     <option<% If intRepliesPerPage = 30 Then Response.Write(" selected") %>>30</option>
     <option<% If intRepliesPerPage = 35 Then Response.Write(" selected") %>>35</option>
     <option<% If intRepliesPerPage = 40 Then Response.Write(" selected") %>>40</option>
     <option<% If intRepliesPerPage = 45 Then Response.Write(" selected") %>>45</option>
     <option<% If intRepliesPerPage = 50 Then Response.Write(" selected") %>>50</option>
     <option<% If intRepliesPerPage = 75 Then Response.Write(" selected") %>>75</option>
     <option<% If intRepliesPerPage = 100 Then Response.Write(" selected") %>>100</option>
     <option<% If intRepliesPerPage = 150 Then Response.Write(" selected") %>>150</option>
     <option<% If intRepliesPerPage = 200 Then Response.Write(" selected") %>>200</option>
     <option<% If intRepliesPerPage = 250 Then Response.Write(" selected") %>>250</option>
     <option<% If intRepliesPerPage = 300 Then Response.Write(" selected") %>>300</option>
     <option<% If intRepliesPerPage = 500 Then Response.Write(" selected") %>>500</option>
     <option<% If intRepliesPerPage = 999 Then Response.Write(" selected") %>>999</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Hot Topic Number of Views:<br>
    <font size="1">This is the number of times a Topic is viewed before it is shown as a Hot Topic.</font></font></td>
   <td valign="top"> 
    <select name="hotViews">
     <option<% If intHotTopicViews = 5 Then Response.Write(" selected") %>>5</option>
     <option<% If intHotTopicViews = 10 Then Response.Write(" selected") %>>10</option>
     <option<% If intHotTopicViews = 20 Then Response.Write(" selected") %>>20</option>
     <option<% If intHotTopicViews = 30 Then Response.Write(" selected") %>>30</option>
     <option<% If intHotTopicViews = 40 Then Response.Write(" selected") %>>40</option>
     <option<% If intHotTopicViews = 50 Then Response.Write(" selected") %>>50</option>
     <option<% If intHotTopicViews = 60 Then Response.Write(" selected") %>>60</option>
     <option<% If intHotTopicViews = 70 Then Response.Write(" selected") %>>70</option>
     <option<% If intHotTopicViews = 80 Then Response.Write(" selected") %>>80</option>
     <option<% If intHotTopicViews = 90 Then Response.Write(" selected") %>>90</option>
     <option<% If intHotTopicViews = 100 Then Response.Write(" selected") %>>100</option>
     <option<% If intHotTopicViews = 110 Then Response.Write(" selected") %>>110</option>
     <option<% If intHotTopicViews = 120 Then Response.Write(" selected") %>>120</option>
     <option<% If intHotTopicViews = 130 Then Response.Write(" selected") %>>130</option>
     <option<% If intHotTopicViews = 140 Then Response.Write(" selected") %>>140</option>
     <option<% If intHotTopicViews = 150 Then Response.Write(" selected") %>>150</option>
     <option<% If intHotTopicViews = 200 Then Response.Write(" selected") %>>200</option>
     <option<% If intHotTopicViews = 250 Then Response.Write(" selected") %>>250</option>
     <option<% If intHotTopicViews = 300 Then Response.Write(" selected") %>>300</option>
     <option<% If intHotTopicViews = 400 Then Response.Write(" selected") %>>400</option>
     <option<% If intHotTopicViews = 500 Then Response.Write(" selected") %>>500</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Hot Topic Number or Replies:<br>
    <font size="1">This is the number of Replies a Topic must have to be shown as a Hot Topic.</font></font></td>
   <td valign="top"> 
    <select name="hotReplies">
     <option<% If intHotTopicReplies = 3 Then Response.Write(" selected") %>>3</option>
     <option<% If intHotTopicReplies = 4 Then Response.Write(" selected") %>>4</option>
     <option<% If intHotTopicReplies = 5 Then Response.Write(" selected") %>>5</option>
     <option<% If intHotTopicReplies = 6 Then Response.Write(" selected") %>>6</option>
     <option<% If intHotTopicReplies = 7 Then Response.Write(" selected") %>>7</option>
     <option<% If intHotTopicReplies = 8 Then Response.Write(" selected") %>>8</option>
     <option<% If intHotTopicReplies = 9 Then Response.Write(" selected") %>>9</option>
     <option<% If intHotTopicReplies = 10 Then Response.Write(" selected") %>>10</option>
     <option<% If intHotTopicReplies = 15 Then Response.Write(" selected") %>>15</option>
     <option<% If intHotTopicReplies = 20 Then Response.Write(" selected") %>>20</option>
     <option<% If intHotTopicReplies = 25 Then Response.Write(" selected") %>>25</option>
     <option<% If intHotTopicReplies = 30 Then Response.Write(" selected") %>>30</option>
     <option<% If intHotTopicReplies = 35 Then Response.Write(" selected") %>>35</option>
     <option<% If intHotTopicReplies = 40 Then Response.Write(" selected") %>>40</option>
     <option<% If intHotTopicReplies = 45 Then Response.Write(" selected") %>>45</option>
     <option<% If intHotTopicReplies = 50 Then Response.Write(" selected") %>>50</option>
     <option<% If intHotTopicReplies = 60 Then Response.Write(" selected") %>>60</option>
     <option<% If intHotTopicReplies = 75 Then Response.Write(" selected") %>>75</option>
     <option<% If intHotTopicReplies = 100 Then Response.Write(" selected") %>>100</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Private Messenger:<br>
    <font size="1">If you turn this off your members will no longer be able to use the Private Messenger to send a and receive Private Messages.</font></font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="privateMsg" value="True" <% If blnPrivateMessenger = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" value="False" <% If blnPrivateMessenger = False Then Response.Write "checked" %> name="privateMsg">
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Number of Private Messages Per Member:<br>
    <font size="1">This is the number of Private Messages a member can have in there 'inbox' at any one time.</font></font></td>
   <td valign="top"> 
    <select name="pmNo">
     <option<% If intPrivateMessages = 10 Then Response.Write(" selected") %>>10</option>
     <option<% If intPrivateMessages = 15 Then Response.Write(" selected") %>>15</option>
     <option<% If intPrivateMessages = 20 Then Response.Write(" selected") %>>20</option>
     <option<% If intPrivateMessages = 25 Then Response.Write(" selected") %>>25</option>
     <option<% If intPrivateMessages = 30 Then Response.Write(" selected") %>>30</option>
     <option<% If intPrivateMessages = 35 Then Response.Write(" selected") %>>35</option>
     <option<% If intPrivateMessages = 40 Then Response.Write(" selected") %>>40</option>
     <option<% If intPrivateMessages = 45 Then Response.Write(" selected") %>>45</option>
     <option<% If intPrivateMessages = 50 Then Response.Write(" selected") %>>50</option>
     <option<% If intPrivateMessages = 60 Then Response.Write(" selected") %>>60</option>
     <option<% If intPrivateMessages = 70 Then Response.Write(" selected") %>>70</option>
     <option<% If intPrivateMessages = 80 Then Response.Write(" selected") %>>80</option>
     <option<% If intPrivateMessages = 90 Then Response.Write(" selected") %>>90</option>
     <option<% If intPrivateMessages = 100 Then Response.Write(" selected") %>>100</option>
     <option<% If intPrivateMessages = 150 Then Response.Write(" selected") %>>150</option>
     <option<% If intPrivateMessages = 200 Then Response.Write(" selected") %>>200</option>
     <option<% If intPrivateMessages = 250 Then Response.Write(" selected") %>>250</option>
     <option<% If intPrivateMessages = 500 Then Response.Write(" selected") %>>500</option>
     <option<% If intPrivateMessages = 999 Then Response.Write(" selected") %>>999</option>
    </select>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Moderator Admin:<br>
    <font size="1">Allow moderators to change another members group they belong to and suspend members accounts through the members profile in the main 
    forum. </font></font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="modAdmin" value="True" <% If blnModAdmin = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="modAdmin" value="False" <% If blnModAdmin = False Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Enable Guest Posting:<br>
    <font size="1">Let unregistered users post messages in the forum.</font></font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">On 
    <input type="radio" name="guestPost" value="True" <% If blnGuestPost = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="guestPost" value="False" <% If blnGuestPost = False Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
   <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">WYSIWYG HTML Editor for Windows IE 5+<br>
    <font size="1">This is the type of editor you use to post messages if you are a Windows IE5+ user. If you turn this function off everyone will use the Basic message editor.<br>
    If you want greater security turn this feature off, but you will loose functionality.</font><br>
    </font></td>
   <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> On 
    <input type="radio" name="IEEditor" value="True" <% If blnIEEditor = True Then Response.Write "checked" %>>
    &nbsp;&nbsp;Off 
    <input type="radio" name="IEEditor" value="False" <% If blnIEEditor = False Then Response.Write "checked" %>>
    </font></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
   <td valign="top" colspan="2" class="arial"> 
    <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
     <input type="hidden" name="mode" value="change">
     <input type="hidden" name="LCode" value="<% = blnLCode %>">
     <input type="submit" name="Submit" value="Update Forum Configuration">
     <input type="reset" name="Reset" value="Reset Form">
     </font></p>
   </td>
  </tr>
 </table>
</form>
<br>
</body>
</html>

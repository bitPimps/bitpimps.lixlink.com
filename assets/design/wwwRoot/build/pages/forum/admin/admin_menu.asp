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
%>
<html>
<head>
<title>Forum Administration Menu</title>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Forum Administration Menu</font></h1>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    
  <td align="center" height="2"><font face="Arial, Helvetica, sans-serif" size="2"><a href="../default.asp">Return to the Main Forum</a><br>
   <br>
   For security it is highly recommended that you <a href="change_admin_username.asp" target="_self">change the Admin Username and Password</a> to stop others messing up your Forums!</font></td>
  </tr>
</table>
<br>
<table width="650" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000">
 <tr> 
  <td width="690"> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
    <tr> 
     <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="7">
       <tr> 
        <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="3">Forum configuration and setup<br>
         </font></b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">The following pages are to help you set up and configure the forum</font><b><font size="3"> 
         </font></b></font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="view_forums.asp" target="_self">Forum Categories and Forum's Set up and 
         Administration</a><br>
         Add, Amend, Delete any forum's and forum categories, alter forum details, set forum permissions, lock forums, password protect forums, etc.</font></td>
       </tr>
       <tr> 
        <td><font face="Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="change_admin_username.asp" target="_self">Change 
         Admin Username and Password</a><br>
         Definately recommended for higher Forum security!</font></font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="forum_configure.asp" target="_self">Configure the Forum</a><br>
         Set up and configure forum functions and settings.</font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="date_time_configure.asp" target="_self">Configure Date and Time Settings</a><br>
         Change the format of dates and times in the forum or change time/date settings to your local settings if the server is in a foreign country to 
         your own.</font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="email_notify_configure.asp" target="_self">E-mail Notification Setup and 
         Configuration </a><br>
         Allow e-mail notification so users can be notified of replies to their posts. <br>
         Also turn on e-mail notification for yourself so you can be informed by e-mail everytime someone places a post in the forum.</font></td>
       </tr>
       <tr>
        <td><a href="spam_configure.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Anti-Spam Configuration</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
         Configure the Anti-Spam settings so you don't get members spamming the forum with 1,000's of unwanted and abusive posts in minutes</font>.</td>
       </tr>
       <tr> 
        <td><a href="bad_word_filter_configure.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Configure the Bad Word Filter</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
         Remove or add new swear words to the bad word filter</font>.</td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<table width="650" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000">
 <tr>
  <td width="690"> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
     <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="7">
       <tr> 
        <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="3">Administer the Forum<br>
         </font></b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">The following pages are to help you administer the forum</font></font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="view_forums.asp" target="_self">Categories and Forum's Set up and Administration</a><br>
         Add, Amend, Delete any forum's and forum categories, alter forum details, set forum permissions, lock forums, password protect forums, etc.</font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="select_forum_members.asp" target="_self">Forum Membership Administration</a><br>
         Administer members accounts, make them moderators, change status, delete members, suspend accounts, etc.</font></td>
       </tr>
       <tr> 
        <td><font face="Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="change_admin_username.asp" target="_self">Change 
         Admin Username and Password</a><br>
         Definately recommended for higher Forum security!</font></font></td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<table width="650" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000">
 <tr> 
  <td width="680"> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
    <tr> 
     <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="7">
       <tr> 
        <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="3">Forum Clearout and Archive<br>
         </font></b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">The following pages are to clear out the database if you find it is getting 
         a little full and slowing down and to archive topics</font></font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="archive_topics_form.asp" target="_self">Archive Old Topics</a><br>
         Archive old Topics allows you to batch lock Topics that haven't been posted in for sometime.</font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="batch_delete_posts_form.asp" target="_self">Batch Delete Topics</a><br>
         Clean out the Forum Database by batch deleting topics that have not been posted in for sometime</font>.</td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<br>
<table width="650" border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#000000">
 <tr> 
  <td> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
    <tr> 
     <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="7">
       <tr> 
        <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="3">Removing the Web Wiz Guide links</font></b></font></td>
       </tr>
       <tr> 
        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="remove_link_buttons.asp">Remove Powered By Web Wiz Guide button links</a><br>
         Remove the Powered by Web Wiz Guide button links from the forum.</font> </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<div align="center"><br>
 <br>
 <table width="700" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
  <tr> 
   <td width="986"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="4" bgcolor="#EFEFEF">
     <tr> 
      <td align="center" height="186" width="100%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">I have spent many 1000's of unpaid hours in development and support this and the other applications<br>
       available for free from Web Wiz Guide. </font> 
       <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">If you like using this application then please help support the development and update 
        of <br>
        this and future applications from Web Wiz Guide.</font><br>
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
        <a href="http://www.webwizguide.info/donations/forum_donation.asp" target="_blank">Click here to make a donation to Web Wiz Guide for this Application</a><br>
        <br>
        The <b>Web Wiz Forums application remains free</b> and you may still use it as much as you like both <br>
        privately and commercially, <b>the donation is only a request</b> to help me cover some of the costs involved.<br>
        <br>
        <b>For more info contact: -</b><br>
        <a href="mailto:donations@webwizguide.com">donations@webwizguide.com</a><br>
        Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom. </font></p>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br>
 <font face="Verdana, Arial, Helvetica, sans-serif"> <a href="http://www.webwizforums.com" target="_blank"><strong><font size="3">Check for updates to Web Wiz Forums</font></strong></a><font size="3"><strong><br>
 <br>
 <a href="http://www.webwizguide.info/asp/sample_scripts/default.asp" target="_blank">Other Free ASP Applications from Web Wiz Guide</a></strong></font><br>
 <br>
 <%
 Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums</a> version 6.34</span>")
 %>
 </font> </div>
</body>
</html>
<%
'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>

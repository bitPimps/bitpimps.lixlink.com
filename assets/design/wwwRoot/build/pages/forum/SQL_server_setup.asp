<% Option Explicit %>
<!--#include file="admin/SQL_server_connection.asp" -->
<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide ASP Discussion Forum
'**                                                              
'**  Copyright 2001 Bruce Corkhill All Rights Reserved.                                
'**
'**  This program is free software; you can redistribute it and/or modify
'**  it under the terms of the GNU General Public License as published by
'**  the Free Software Foundation; either version 2 of the License, or
'**  any later version.
'**
'**  All copyright notices must remain intacked in the scripts and the 
'**  outputted HTML.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**   
'**  All links to Web Wiz Guide must remain in place and the powered by
'**  logo with link back to Web Wiz Guide must remain visiable when the pages
'**  are viewed.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'**  GNU General Public License for more details.
'**    
'**  You should have received a copy of the GNU General Public License
'**  along with this program; if not, write to the Free Software
'**  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA	
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
'****************************************************************************************

'Set the response buffer to true as we maybe redirecting and setting a cookie
Response.Buffer = False

%>
<html>
<head>
<title>SQL Server Database Setup</title>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<!-- The Web Wiz Guide Login Script is written by Bruce Corkhill ©2001
     	If you want your own  Login Script then goto http://www.webwizforums.com -->

<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	var errorMsg = "";

	//Check for a Username
	if (document.frmLogin.name.value==""){
		errorMsg += "\n\tUsername \t- Enter a Username with tbale\creation rights on the database"; 	
	}
	
	//Check for a Password
	//if (document.frmLogin.password.value==""){
		//errorMsg += "\n\tPassword \t- Enter a Password with tbale\creation rights on the database";
	//}
	
	//If there is aproblem with the form then display an error
	if (errorMsg != ""){
		msg = "_____________________________________________________________________\n\n";
		msg += "Your Login to the SQL Server has failed because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "_____________________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}
// -->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="584" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td align="center"> 
      <h1>Forum Database SQL Server Setup</h1>
    </td>
  </tr>
</table>
<div align="center"><br>
  <font face="Verdana, Arial, Helvetica" size="2">Before you can use this page to create the tables and efualt values etc. in the SQL Server Database<br>
  you first need to create an empty database on the SQL Server.<font face="Verdana, Arial, Helvetica" size="2"><br>
  <br>
  Enter a username and password in the box below that has table creation/modification <br>
  rights at the SQL Server database you are using.<br>
  <b>This may not be the same user that you have used in your SQL Server connection string!</b></font></font><br>
</div>
<form name="frmLogin" method="post" action="SQL_server_setup.asp" onSubmit="return CheckForm();">
  <table width="273" border="0" cellspacing="0" cellpadding="1" align="CENTER" bgcolor="#000000">
    <tr>
      <td>
        <table width="273" border="0" align="center" cellspacing="0" cellpadding="0" bgcolor="#CCCCCC">
          <tr> 
            <td align="right" height="47" valign="bottom" width="94">User name: 
            </td>
            <td height="47" valign="bottom" width="172"> 
              <input type="text" name="name">
            </td>
          </tr>
          <tr> 
            <td align="right" width="94">Password: </td>
            <td width="172"> 
              <input type="password" name="password">
            </td>
          </tr>
          <tr> 
            <td align="right" height="44" width="94">&nbsp;</td>
            <td height="44" width="172"> 
              <input type="submit" name="Submit" value="Enter">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="reset" name="Submit" value="Reset">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="702" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
      <%

Dim adoCon 			'Database Connection Variable
Dim strCon			'Holds the Database driver and the path and name of the database
Dim strSQL			'Holds the SQL query for the database
Dim intBadWordLoopCounter	'Holds the bad word filter writing to db counter
Dim blnErrorOccured		'Set to true if an error occurs


'Resume on all errors
On Error Resume Next


'intialise variables
blnErrorOccured = False

'If a username and password is entred then start the ball rolling
If NOT Request.Form("name") = "" Then
	
	'Create database connection
	'Create a connection odject
	Set adoCon = Server.CreateObject("ADODB.Connection")
	
	'Build a database driver connection string to the SQL server
	strCon = "Provider=SQLOLEDB;Server=" & strSQLServerName & ";User ID=" & Request.Form("name") & ";Password=" & Request.Form("password") & ";Database=" & strSQLDBName & ";"
	
	'Set an active connection to the Connection object
	adoCon.Open strCon
	
	'If an error has occured write an error to the page
	If Err.Number <> 0 Then 
		Response.Write("<br><b>Error Connecting to database on SQL Server</b><br><br>Check the following is set up and correct:- <br><br>SQL Server User Name<br>SQL Server Password<br>")
		Response.Write("Name of the SQL Server<br>Database name set up by you on the server<br>Empty Database set up by you on the SQL Server<br><br>Check also that you have entered the correct details in the file 'SQL_server_connection.asp' found in the admin directory.<br><br>")
	Else
	
	
'Create the tables
		
		
		'Create the Category Table
		strSQL = "CREATE TABLE [dbo].[tblCategory] ("
		strSQL = strSQL & "[Cat_ID] [smallint] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Cat_name] [nvarchar] (60) NOT NULL ,"
		strSQL = strSQL & "[Cat_order] [int] NOT NULL DEFAULT (1) "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			
			'Write an error message
			Response.Write("<br>Error Creating the Table tblCategory (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create the Forum Table
		strSQL = "CREATE TABLE [dbo].[tblForum] ("
		strSQL = strSQL & "[Forum_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Cat_ID] [smallint] NOT NULL ,"
		strSQL = strSQL & "[Forum_Order] [smallint] NOT NULL DEFAULT (1),"
		strSQL = strSQL & "[Forum_name] [nvarchar] (60) NOT NULL ,"
		strSQL = strSQL & "[Forum_description] [nvarchar] (200) NULL ,"
		strSQL = strSQL & "[Date_Started] [datetime] NOT NULL DEFAULT (getdate()),"
		strSQL = strSQL & "[Password] [nvarchar] (22) NULL ,"
		strSQL = strSQL & "[Forum_code] [nvarchar] (40) NULL ,"
		strSQL = strSQL & "[Locked] [bit] NOT NULL DEFAULT (0), "
		strSQL = strSQL & "[Guest] [int] NOT NULL DEFAULT (1), "
		strSQL = strSQL & "[Standard] [int] NOT NULL DEFAULT (1), "
		strSQL = strSQL & "[Super] [int] NOT NULL DEFAULT (1), "
		strSQL = strSQL & "[Power] [int] NOT NULL DEFAULT (1) "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			
			'Write an error message
			Response.Write("<br>Error Creating the Table tblForum (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create the Topic Table
		strSQL = "CREATE TABLE [dbo].[tblTopic] ("
		strSQL = strSQL & "[Topic_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Forum_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Subject] [nvarchar] (60) NOT NULL ,"
		strSQL = strSQL & "[Start_date] [datetime] NOT NULL DEFAULT (getdate()),"
		strSQL = strSQL & "[Last_entry_date] [datetime] NOT NULL DEFAULT (getdate()),"
		strSQL = strSQL & "[No_of_views] [int] NOT NULL DEFAULT (0), "
		strSQL = strSQL & "[Locked] [bit] NOT NULL DEFAULT (0), "
		strSQL = strSQL & "[Priority] [int] NOT NULL DEFAULT (0) "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblTopic (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create the Thread Table
		strSQL = "CREATE TABLE [dbo].[tblThread] ("
		strSQL = strSQL & "[Thread_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Topic_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Author_ID] [int] NULL ,"
		strSQL = strSQL & "[Email_notify] [bit] NOT NULL ,"
		strSQL = strSQL & "[Message] [text]  NULL ,"
		strSQL = strSQL & "[Message_date] [datetime] NOT NULL  DEFAULT (getdate()) ,"
		strSQL = strSQL & "[Show_signature] [bit] NOT NULL DEFAULT (0), "
		strSQL = strSQL & "[IP_addr] [nvarchar] (28) NULL "
		strSQL = strSQL & ") ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblThread (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create the Author Table
		strSQL = "CREATE TABLE [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Author_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Username] [nvarchar] (20)  NOT NULL ,"
		strSQL = strSQL & "[User_code] [nvarchar] (70)  NOT NULL ,"
		strSQL = strSQL & "[Password] [nvarchar] (20)  NOT NULL ,"
		strSQL = strSQL & "[Author_email] [nvarchar] (50)  NULL ,"
		strSQL = strSQL & "[Show_email] [bit] NOT NULL DEFAULT (0) ,"
		strSQL = strSQL & "[Homepage] [nvarchar] (50)  NULL ,"
		strSQL = strSQL & "[Location] [nvarchar] (50)  NULL ,"
		strSQL = strSQL & "[Signature] [text] NULL ,"
		strSQL = strSQL & "[No_of_posts] [int] NOT NULL DEFAULT (0),"
		strSQL = strSQL & "[Join_date] [datetime] NOT NULL  DEFAULT (getdate()),"
		strSQL = strSQL & "[Active] [bit] NOT NULL DEFAULT (1), "
		strSQL = strSQL & "[Status] [int] NOT NULL DEFAULT (1), "
		strSQL = strSQL & "[Avatar] [nvarchar] (100)  NULL "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblAuthor (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create the Moderator Table
		strSQL = "CREATE TABLE [dbo].[tblModerator] ("
		strSQL = strSQL & "[Moderator_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Author_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Forum_ID] [int] NOT NULL ,"
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblModerator (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
				
		
		'Create the Private messages table
		strSQL = "CREATE TABLE [dbo].[tblPMMessage] ("
		strSQL = strSQL & "[PM_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Author_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[From_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[PM_Tittle] [varchar] (50) NOT NULL ,"
		strSQL = strSQL & "[PM_Message] [text] NOT NULL ,"
		strSQL = strSQL & "[PM_Message_Date] [datetime] NOT NULL  DEFAULT (getdate()),"
		strSQL = strSQL & "[Read_Post] [bit] NOT NULL DEFAULT (0),"
		strSQL = strSQL & "[Email_notify] [bit] NOT NULL DEFAULT (0)"
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblPMMessage (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create the Buddy List table
		strSQL = "CREATE TABLE [dbo].[tblBuddyList] ("
		strSQL = strSQL & "[Address_ID] [int] IDENTITY (1, 1) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Author_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Buddy_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Description] [varchar] (50) NOT NULL ,"
		strSQL = strSQL & "[Block] [bit] NOT NULL DEFAULT (0) "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblBuddyList (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create the Active Users table
		strSQL = "CREATE TABLE [dbo].[tblActiveUser] ("
		strSQL = strSQL & "[IP] [varchar] (50) PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Author_ID] [int] NOT NULL ,"
		strSQL = strSQL & "[Login] [datetime] NOT NULL DEFAULT (getdate()),"
		strSQL = strSQL & "[Active] [datetime] NOT NULL DEFAULT (getdate()),"
		strSQL = strSQL & "[OS] [varchar] (50) NOT NULL ,"
		strSQL = strSQL & "[Browser] [varchar] (50) NOT NULL ,"
		strSQL = strSQL & "[Hide] [bit] NOT NULL DEFAULT (0) "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblActiveUser (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		
		'Create the Configuration Table
		strSQL = "CREATE TABLE [dbo].[tblConfiguration] ("
		strSQL = strSQL & "[website_name] [nvarchar] (50)  NOT NULL  PRIMARY KEY  CLUSTERED ,"
		strSQL = strSQL & "[website_path] [nvarchar] (60)  NULL ,"
		strSQL = strSQL & "[forum_path] [nvarchar] (70)  NULL ,"
		strSQL = strSQL & "[forum_email_address] [nvarchar] (50)  NULL ,"
		strSQL = strSQL & "[email_notify] [bit] NOT NULL ,"
		strSQL = strSQL & "[email_admin] [bit] NOT NULL ,"
		strSQL = strSQL & "[mail_component] [nvarchar] (10)  NULL ,"
		strSQL = strSQL & "[mail_server] [nvarchar] (60)  NULL ,"
		strSQL = strSQL & "[IE_editor] [bit] NOT NULL ,"
		strSQL = strSQL & "[L_code] [bit] NOT NULL ,"
		strSQL = strSQL & "[Topics_per_page] [smallint] NULL ,"
		strSQL = strSQL & "[Title_image] [nvarchar] (70)  NULL ,"
		strSQL = strSQL & "[Text_link] [bit] NOT NULL ,"
		strSQL = strSQL & "[Emoticons] [bit] NOT NULL ,"
		strSQL = strSQL & "[Guest_post] [bit] NOT NULL, "
		strSQL = strSQL & "[Mod_admin] [bit] NOT NULL, "
		strSQL = strSQL & "[Avatar] [bit] NOT NULL, "
		strSQL = strSQL & "[Email_activate] [bit] NOT NULL, "
		strSQL = strSQL & "[Email_post] [bit] NOT NULL, "
		strSQL = strSQL & "[Hot_views] [smallint] NULL, "
		strSQL = strSQL & "[Hot_replies] [smallint] NOT NULL, "
		strSQL = strSQL & "[Private_msg] [bit] NOT NULL, "
		strSQL = strSQL & "[No_of_priavte_msg] [smallint] NULL, "
		strSQL = strSQL & "[Threads_per_page] [smallint] NULL, "
		strSQL = strSQL & "[Spam_seconds] [smallint] NULL, "
		strSQL = strSQL & "[Spam_minutes] [smallint] NULL "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblConfiguration (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create the Date Time Table
		strSQL = "CREATE TABLE [dbo].[tblDateTimeFormat] ("
		strSQL = strSQL & "[Date_format] [nvarchar] (10)  NOT NULL  PRIMARY KEY  CLUSTERED ,"
		strSQL = strSQL & "[Year_format] [nvarchar] (6)  NULL ,"
		strSQL = strSQL & "[Seporator] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month1] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month2] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month3] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month4] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month5] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month6] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month7] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month8] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month9] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month10] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month11] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Month12] [nvarchar] (15)  NULL ,"
		strSQL = strSQL & "[Time_format] [smallint] NULL ,"
		strSQL = strSQL & "[Server_offset] [nvarchar] (1)  NULL ,"
		strSQL = strSQL & "[Server_offset_hours] [smallint] NULL ,"
		strSQL = strSQL & "[am] [nvarchar] (6)  NULL ,"
		strSQL = strSQL & "[pm] [nvarchar] (6)  NULL "
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblDateTimeFormat (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create the Smut Table
		strSQL = "CREATE TABLE [dbo].[tblSmut] ("
		strSQL = strSQL & "[ID_no] [int] IDENTITY (1, 1)  PRIMARY KEY  CLUSTERED  NOT NULL ,"
		strSQL = strSQL & "[Smut] [nvarchar] (50)  NULL ,"
		strSQL = strSQL & "[Word_replace] [nvarchar] (50)  NULL"
		strSQL = strSQL & ") ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Table tblSmut (it may already exsist)<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		 
'Create relationships		
		 
		 
		'Create relations between the tblCategory and the tblForum tables
		strSQL = "ALTER TABLE [dbo].[tblForum] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblForum_tblCategory] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Cat_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblCategory] ("
		strSQL = strSQL & "[Cat_ID]"
		strSQL = strSQL & ")"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblCategory and tblForum tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		'Create relations between the tblModerator, tblAuthor and the tblForum tables
		strSQL = "ALTER TABLE [dbo].[tblModerator] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblModerator_tblAuthor] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & ")"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblModerator, tblAuthor and tblTopic tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		'Create relations between the tblTopic and the tblForum tables
		strSQL = "ALTER TABLE [dbo].[tblTopic] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblTopic_tblForum1] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Forum_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblForum] ("
		strSQL = strSQL & "[Forum_ID]"
		strSQL = strSQL & ")"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblForum and tblTopic tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Create relations between the tblTopic, tblThread and tblAuthor tables
		strSQL = "ALTER TABLE [dbo].[tblThread] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblThread_tblAuthor] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & "),"
		strSQL = strSQL & "CONSTRAINT [FK_tblThread_tblTopic] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Topic_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblTopic] ("
		strSQL = strSQL & "[Topic_ID]"
		strSQL = strSQL & ")"
			
		'Write to the database
		adoCon.Execute(strSQL)	
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblTopic, tblThread, and tblAuthor tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If

		
		
		'Create relations between the tblPMMessage and tblAuthor tables
		strSQL = "ALTER TABLE [dbo].[tblPMMessage] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblPMMessage_tblAuthor] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[From_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & ")"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblPMMessage and tblAuthor tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
 
		
		'Create relations between the tblBuddyList and tblAuthor tables
		strSQL = "ALTER TABLE [dbo].[tblBuddyList] ADD "
		strSQL = strSQL & "CONSTRAINT [FK_tblBuddyList_tblAuthor] FOREIGN KEY "
		strSQL = strSQL & "("
		strSQL = strSQL & "[Buddy_ID]"
		strSQL = strSQL & ") REFERENCES [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Author_ID]"
		strSQL = strSQL & ")"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Relationship between the tblBuddyList and tblAuthor tables (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
'Create indexes		
		
		
		'Create indexs for better performance
		strSQL = "CREATE INDEX [IX_tblThread] ON [dbo].[tblThread]([Message_date]) ON [PRIMARY]"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating one or more Indexs (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		

'Insert default values		
		
		
		'Enter the default values in the Author Table
		'Enter the admin account into db
		strSQL = "INSERT INTO [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Username], "
		strSQL = strSQL & "[User_code], "
		strSQL = strSQL & "[Password], "
		strSQL = strSQL & "[Status], "
		strSQL = strSQL & "[Active] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('Administrator', "
		strSQL = strSQL & "'Administrator20543251913600ln', "
		strSQL = strSQL & "'letmein', "
		strSQL = strSQL & "'3', "
		strSQL = strSQL & "'1')"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'Enter the Guest account into db
		strSQL = "INSERT INTO [dbo].[tblAuthor] ("
		strSQL = strSQL & "[Username], "
		strSQL = strSQL & "[User_code], "
		strSQL = strSQL & "[Password], "
		strSQL = strSQL & "[Active] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('Guest', "
		strSQL = strSQL & "'Guest70922795552803gh', "
		strSQL = strSQL & "'none', "
		strSQL = strSQL & "'1')"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error entering default values in the Table tblAuthor<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Enter the default values in the Configuration Table
		strSQL = "INSERT INTO [dbo].[tblConfiguration] ("
		strSQL = strSQL & "[website_name], "
		strSQL = strSQL & "[website_path], "
		strSQL = strSQL & "[forum_path], "
		strSQL = strSQL & "[forum_email_address], "
		strSQL = strSQL & "[email_notify], "
		strSQL = strSQL & "[email_admin], "
		strSQL = strSQL & "[mail_component], "
		strSQL = strSQL & "[mail_server], "
		strSQL = strSQL & "[IE_editor], "
		strSQL = strSQL & "[L_code], "
		strSQL = strSQL & "[Topics_per_page], "
		strSQL = strSQL & "[Title_image], "
		strSQL = strSQL & "[Text_link], "
		strSQL = strSQL & "[Emoticons], "
		strSQL = strSQL & "[Guest_post], "
		strSQL = strSQL & "[Mod_admin], "
		strSQL = strSQL & "[Avatar], "
		strSQL = strSQL & "[Email_activate], "
		strSQL = strSQL & "[Email_post], "
		strSQL = strSQL & "[Hot_views], "
		strSQL = strSQL & "[Hot_replies], "
		strSQL = strSQL & "[Private_msg], "
		strSQL = strSQL & "[No_of_priavte_msg], "
		strSQL = strSQL & "[Threads_per_page], "
		strSQL = strSQL & "[Spam_seconds], "
		strSQL = strSQL & "[Spam_minutes] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('My Website', "
		strSQL = strSQL & "'./', "
		strSQL = strSQL & "'http://www.myweb.com/forum', "
		strSQL = strSQL & "'forum@myweb.coo', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'CDONTS', "
		strSQL = strSQL & "'', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'16', "
		strSQL = strSQL & "'forum_images/web_wiz_forums.gif', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'50', "
		strSQL = strSQL & "'10', "
		strSQL = strSQL & "'1', "
		strSQL = strSQL & "'40', "
		strSQL = strSQL & "'10', "
		strSQL = strSQL & "'20', "
		strSQL = strSQL & "'7') "
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error entering default values in the Table tblConfiguration<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Enter the default values in the date time table
		strSQL = "INSERT INTO [dbo].[tblDateTimeFormat] ("
		strSQL = strSQL & "[Date_format], "
		strSQL = strSQL & "[Year_format], "
		strSQL = strSQL & "[Seporator], "
		strSQL = strSQL & "[Month1], "
		strSQL = strSQL & "[Month2], "
		strSQL = strSQL & "[Month3], "
		strSQL = strSQL & "[Month4], "
		strSQL = strSQL & "[Month5], "
		strSQL = strSQL & "[Month6], "
		strSQL = strSQL & "[Month7], "
		strSQL = strSQL & "[Month8], "
		strSQL = strSQL & "[Month9], "
		strSQL = strSQL & "[Month10], "
		strSQL = strSQL & "[Month11], "
		strSQL = strSQL & "[Month12], "
		strSQL = strSQL & "[Time_format], "
		strSQL = strSQL & "[Server_offset], "
		strSQL = strSQL & "[Server_offset_hours], "
		strSQL = strSQL & "[am], "
		strSQL = strSQL & "[pm] "
		strSQL = strSQL & ") "
		strSQL = strSQL & "VALUES "
		strSQL = strSQL & "('dd/mm/yy', "
		strSQL = strSQL & "'long', "
		strSQL = strSQL & "' ', "
		strSQL = strSQL & "'January', "
		strSQL = strSQL & "'February', "
		strSQL = strSQL & "'March', "
		strSQL = strSQL & "'April', "
		strSQL = strSQL & "'May', "
		strSQL = strSQL & "'June', "
		strSQL = strSQL & "'July', "
		strSQL = strSQL & "'August', "
		strSQL = strSQL & "'September', "
		strSQL = strSQL & "'October', "
		strSQL = strSQL & "'November', "
		strSQL = strSQL & "'December', "
		strSQL = strSQL & "'12', "
		strSQL = strSQL & "'+', "
		strSQL = strSQL & "'0', "
		strSQL = strSQL & "'am', "
		strSQL = strSQL & "'pm')"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error entering default values in the Table tblDateTimeFormat<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		
		'Enter the default values in the smut table
		For intBadWordLoopCounter = 1 to 14
			
			'Write the SQL
			strSQL = "INSERT INTO [dbo].[tblSmut] ([Smut], [Word_replace]) "
			strSQL = strSQL & "VALUES ("
			
			Select Case intBadWordLoopCounter
				Case 1
					strSQL = strSQL & "'cunt', 'c**t'"
				Case 2
					strSQL = strSQL & "'cunting', 'c**ting'"
				Case 3
					strSQL = strSQL & "'fuck', 'f**k'"
				Case 4
					strSQL = strSQL & "'fucker', 'f**ker'"
				Case 5
					strSQL = strSQL & "'fucking', 'f**king'"
				Case 6
					strSQL = strSQL & "'fuck-off', 'f**k-off'"
				Case 7
					strSQL = strSQL & "'fuckoff', 'f**ker'"
				Case 8
					strSQL = strSQL & "'motherfucker', 'motherf**k'"
				Case 9
					strSQL = strSQL & "'shit', 'sh*t'"
				Case 10
					strSQL = strSQL & "'shiting', 'sh*ting'"
				Case 11
					strSQL = strSQL & "'slag', 'sl*g'"
				Case 12
					strSQL = strSQL & "'tosser', 't**ser'"
				Case 13
					strSQL = strSQL & "'wanker', 'w**ker'"
				Case 14
					strSQL = strSQL & "'wanking', 'w**king'"
			End Select
			
			strSQL = strSQL & ")"
			
			'Write to database
			adoCon.Execute(strSQL)
		Next
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error entering default values in the Table tblSmut<br>")
			
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		

'Stored Procedures		
		
		
		'Create relations between the tblTopic, tblThread and tblAuthor tables
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpSelectConfiguration] AS "
		strSQL = strSQL & "SELECT tblConfiguration.* From tblConfiguration;"
			
		'Write to the database
		adoCon.Execute(strSQL)	
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpSelectConfiguration (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create relations between the tblTopic, tblThread and tblAuthor tables
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpChkUserID]"
		strSQL = strSQL & "( "
		strSQL = strSQL & "@strUserID VarChar(50) "
		strSQL = strSQL & ") "
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblAuthor.Username, tblAuthor.Author_ID, tblAuthor.Active, tblAuthor.Signature, tblAuthor.Author_email, tblAuthor.Status "
		strSQL = strSQL & "FROM tblAuthor "
		strSQL = strSQL & "WHERE User_code = @strUserID;"

			
		'Write to the database
		adoCon.Execute(strSQL)	
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpChkUserID (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create relations between the tblTopic, tblThread and tblAuthor tables
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpCheckUserIsModerator]"
		strSQL = strSQL & "( "
		strSQL = strSQL & "@lngUserID int, "
		strSQL = strSQL & "@intForumID int "
		strSQL = strSQL & ") "
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT TOP 1 tblModerator.Moderator_ID FROM tblModerator WHERE tblModerator.Author_ID=@lngUserID AND (tblModerator.Forum_ID=@intForumID OR tblModerator.Forum_ID=0);"

			
		'Write to the database
		adoCon.Execute(strSQL)	
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpCheckUserIsModerator (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		'Create relations between the tblTopic, tblThread and tblAuthor tables
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpCategoryAll] AS "
		strSQL = strSQL & "SELECT tblCategory.Cat_name, tblCategory.Cat_ID FROM tblCategory ORDER BY tblCategory.Cat_order ASC;"
			
		'Write to the database
		adoCon.Execute(strSQL)	
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpCategoryAll (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpForumsAllWhereCatIs] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@intCatID smallint"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblForum.* FROM tblForum WHERE tblForum.Cat_ID = @intCatID ORDER BY tblForum.Forum_Order ASC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpForumsAllWhereCatIs (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpForumTopicCount] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@intForumID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT Count(tblTopic.Forum_ID) AS Topic_Count From tblTopic WHERE tblTopic.Forum_ID = @intForumID"
		
		'Write to the database
		adoCon.Execute(strSQL)
				
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpForumTopicCount (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpLastForumPostEntry] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@intForumID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT TOP 1 tblThread.Thread_ID, tblThread.Message_date, tblThread.Topic_ID, tblAuthor.Username, tblAuthor.Author_ID "
		strSQL = strSQL & "FROM (tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID) INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
		strSQL = strSQL & "WHERE tblTopic.Forum_ID = @intForumID "
		strSQL = strSQL & "ORDER BY tblThread.Message_date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpLastForumPostEntry (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpForumThreadCount] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@intForumID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT Count(tblThread.Thread_ID) AS Thread_Count "
		strSQL = strSQL & "FROM tblTopic INNER JOIN tblThread ON tblTopic.Topic_ID = tblThread.Topic_ID "
		strSQL = strSQL & "GROUP BY tblTopic.Forum_ID "
		strSQL = strSQL & "HAVING (((tblTopic.Forum_ID)=@intForumID));"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpForumThreadCount (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpLastAllForumsAuthorAndDate] AS "
		strSQL = strSQL & "SELECT TOP 1 tblThread.Message_date, tblAuthor.Username, tblAuthor.Author_ID "
		strSQL = strSQL & "FROM (tblForum INNER JOIN tblTopic ON tblForum.Forum_ID = tblTopic.Forum_ID) INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
		strSQL = strSQL & "ORDER BY tblThread.Message_date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpLastAllForumsAuthorAndDate (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpAuthorDesc] AS "
		strSQL = strSQL & "SELECT tblAuthor.Username, tblAuthor.Author_ID FROM tblAuthor ORDER BY tblAuthor.Author_ID DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpAuthorDesc (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpTimeAndDateSettings] AS "
		strSQL = strSQL & "SELECT tblDateTimeFormat.* FROM tblDateTimeFormat;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpTimeAndDateSettings (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpCountOfPMs] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngLoggedInUserID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & "  AS "
		strSQL = strSQL & "SELECT Count(tblPMMessage.PM_ID) AS CountOfPM FROM tblPMMessage "
		strSQL = strSQL & "WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID = @lngLoggedInUserID "
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpCountOfPMs (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpDateOfLastUnReadPM] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngLoggedInUserID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & "  AS "
		strSQL = strSQL & "SELECT TOP 1 tblPMMessage.PM_Message_Date FROM tblPMMessage "
		strSQL = strSQL & "WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID =  @lngLoggedInUserID "
		strSQL = strSQL & "ORDER BY PM_Message_Date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpDateOfLastUnReadPM (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpActiveUsersWhereIPis] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@strIPAddress VarChar(50)"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblActiveUser.* From tblActiveUser WHERE IP = @strIPAddress"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpActiveUsersWhereIPis (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpAddNewActiveUser] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@strIPAddress VarChar(30), "
		strSQL = strSQL & "@lngActiveUsersID int, "
		strSQL = strSQL & "@strOS VarChar(20), "
		strSQL = strSQL & "@strBrowserUserType VarChar(20), "
		strSQL = strSQL & "@blnHideActiveUser bit "
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "INSERT INTO tblActiveUser (IP, Author_ID, OS, Browser, Hide) VALUES (@strIPAddress, @lngActiveUsersID, @strOS, @strBrowserUserType, @blnHideActiveUser);"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpAddNewActiveUser (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpUpdateActiveUser] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngActiveUsersID int, "
		strSQL = strSQL & "@blnHideActiveUser bit, "
		strSQL = strSQL & "@strIPAddress VarChar(30)"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "UPDATE tblActiveUser SET tblActiveUser.Author_ID=@lngActiveUsersID, tblActiveUser.Active=GetDate(), tblActiveUser.Hide=@blnHideActiveUser WHERE IP=@strIPAddress;"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpUpdateActiveUser (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpDeleteActiveUser] AS "
		strSQL = strSQL & "DELETE FROM tblActiveUser WHERE tblActiveUser.Active < GetDate() - 0.0070;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpDeleteActiveUser (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpDeleteActiveUserDoubleEntry] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngActiveUsersID int, "
		strSQL = strSQL & "@strIPAddress VarChar(30)"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "DELETE FROM tblActiveUser WHERE tblActiveUser.Author_ID=@lngActiveUsersID AND tblActiveUser.IP <> @strIPAddress;"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpDeleteActiveUserDoubleEntry (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpLastAndFirstThreadAuthor] "
		strSQL = strSQL & "( "
		strSQL = strSQL & "@lngTopicID int "
		strSQL = strSQL & ") "
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblThread.Thread_ID, tblThread.Author_ID, tblThread.Message_date, tblAuthor.Username " 
		strSQL = strSQL & "FROM tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID " 
		strSQL = strSQL & "WHERE tblThread.Topic_ID = @lngTopicID "
		strSQL = strSQL & "ORDER BY tblThread.Message_date ASC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpDeleteActiveUserDoubleEntry (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpForumsAllWhereForumIs] " 
		strSQL = strSQL & "( "
		strSQL = strSQL & "@intForumID int "
		strSQL = strSQL & ") "
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblForum.Forum_name, tblForum.Password, tblForum.Forum_code, tblForum.Locked, tblForum.Guest, tblForum.Standard, tblForum.Super, tblForum.Power FROM tblForum WHERE Forum_ID = @intForumID;"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpForumsAllWhereForumIs (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpTopicDetialsInTheLastXX] " 
		strSQL = strSQL & "( "
		strSQL = strSQL & "@intForumID int, "
		strSQL = strSQL & "@intShowTopicsFrom int "
		strSQL = strSQL & ") "
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblTopic.Topic_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Locked, tblTopic.Priority FROM tblTopic " 
		strSQL = strSQL & "WHERE ((tblTopic.Forum_ID = @intForumID) AND ((tblTopic.Last_entry_date > GetDate() - @intShowTopicsFrom) OR (tblTopic.Priority > 0))) OR  (tblTopic.Priority = 3) "
		strSQL = strSQL & "ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpTopicDetialsInTheLastXX (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpTopicDetialsAll] " 
		strSQL = strSQL & "("
		strSQL = strSQL & "@intForumID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblTopic.Topic_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Locked, tblTopic.Priority FROM tblTopic "
		strSQL = strSQL & "WHERE (tblTopic.Forum_ID = @intForumID) OR  (tblTopic.Priority = 3) "
		strSQL = strSQL & "ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpTopicDetialsAll (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpThreadDetails] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngTopicID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT tblTopic.Forum_ID, tblThread.*, tblAuthor.Username, tblAuthor.Homepage, tblAuthor.Location, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Signature, tblAuthor.Active, tblAuthor.Status, tblAuthor.Avatar, tblTopic.Subject, tblTopic.Locked, tblTopic.Priority, tblTopic.No_of_views "
		strSQL = strSQL & "FROM tblTopic INNER JOIN (tblAuthor INNER JOIN tblThread ON tblAuthor.Author_ID = tblThread.Author_ID) ON tblTopic.Topic_ID = tblThread.Topic_ID "
		strSQL = strSQL & "WHERE (((tblThread.Topic_ID)=@lngTopicID)) "
		strSQL = strSQL & "ORDER by tblThread.Message_date ASC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpThreadDetails (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpAuthorLastPostDate] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngUserID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & "As "
		strSQL = strSQL & "SELECT TOP 1 tblThread.Message_date, tblThread.Author_ID FROM tblThread  WHERE tblThread.Author_ID = @lngUserID ORDER BY tblThread.Message_date DESC;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpAuthorLastPostDate (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If		
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpModerator] "
		strSQL = strSQL & "("
		strSQL = strSQL & "@lngUserID int"
		strSQL = strSQL & ")"
		strSQL = strSQL & " AS "
		strSQL = strSQL & "SELECT TOP 1 tblModerator.Moderator_ID FROM tblModerator WHERE tblModerator.Author_ID=@lngUserID;"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpModerator (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If	
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpCountOfActiveUsers] AS "
		strSQL = strSQL & "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser;"
		
		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpCountOfActiveUsers (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If	
		
		
		strSQL = "CREATE PROCEDURE [dbo].[wwfSpCountOfActiveGuests] AS "
		strSQL = strSQL & "SELECT Count(tblActiveUser.Author_ID) AS ActiveUser From tblActiveUser WHERE tblActiveUser.Author_ID=2;"

		'Write to the database
		adoCon.Execute(strSQL)
		
		'If an error has occured write an error to the page
		If Err.Number <> 0 Then 
			Response.Write("<br>Error Creating the Stored Procedure wwfSpCountOfActiveGuests (it may already exsist)<br>")
		
			'Reset error object
			Err.Number = 0
			
			'Set the error boolean to True
			blnErrorOccured = True
		End If	
		
		

		'Display a message to say the database is curated
		If blnErrorOccured = True Then
			Response.Write("<br><b>SQL Server database is set up, but with Error!</b>")
		Else
			Response.Write("<br><center><font size=""4""><b>Congratulations, the SQL Server Forum database is set up and Ready to Go :)</b></font></center>")
		End If
	End If
	
	'Reset Server Variables
	Set adoCon = Nothing
	Set strCon = Nothing
End If
%>
      </font></td>
  </tr>
</table>
<br>
</body>
</html>
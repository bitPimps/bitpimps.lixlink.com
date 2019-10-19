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

Dim strSQLServerName		'Holds the name of the SQL Server
Dim strSQLDBUserName		'Holds the user name (for SQL Server Authentication)
Dim strSQLDBPassword		'Holds the password (for SQL Server Authentication)
Dim strSQLDBName		'Holds name of a database on the server


'------------- The Driver Below is if you are using SQL Server (Do Not Use Unless you know and have an SQL Server) ---------------------------

'Enter the details of your SQL server below
strSQLServerName = "localhost" 'Holds the name of the SQL Server
strSQLDBUserName = "lixsql" 'Holds the user name (for SQL Server Authentication)
strSQLDBPassword = "li87dn" 'Holds the password (for SQL Server Authentication)
strSQLDBName = "lixlink2"     'Holds name of a database on the server


'Please note the forum has been optimised for the SQL OLE DB Driver using another driver 
'or system DSN to connect to the SQL Server database will course errors in the forum and
'drastically reduce the performance of the forum!


'The SQLOLEDB driver offers the highest performance at this time for connecting to SQL Server databases from within ASP.

'SQL Server OLE Driver
strCon = "Provider=SQLOLEDB;Server=" & strSQLServerName & ";User ID=" & strSQLDBUserName & ";Password=" & strSQLDBPassword & ";Database=" & strSQLDBName & ";"

'---------------------------------------------------------------------------------------------------------------------------------------------

%>
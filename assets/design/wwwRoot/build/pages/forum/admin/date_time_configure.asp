<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="date_time_functions.inc" -->
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
Dim rsDateTime 		'Recorset holding all the username in the database				
Dim strMode		'holds the mode of the page, set to true if changes are to be made to the database
Dim strDateFormat	'Holds the date format
Dim strYearFormat	'Holds the year format
Dim intTimeFormat	'Holds the time format
Dim strDateSeporator	'Holds the date seporator between the day/month/year
Dim saryMonth(12)	'Array holding each of the months
Dim strServerOffSet	'Holds wether the time off set is positive or negative
Dim intServerOffSet	'Holds the time off set form the servers time
Dim strMorningID	'Holds the identifier to show for morning in 12 hour clock
Dim strAfternoonID	'Holds the identifier to show for afternoon in 12 hour clock
Dim intMonthLoopCounter	'Loop counter for the months

'Read in the forms mode
strMode = Request.Form("mode")


'Intialise the ADO recordset object
Set rsDateTime  = Server.CreateObject("ADODB.Recordset")
	

'Initalise the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblDateTimeFormat.* From tblDateTimeFormat;"

'Set the cursor type property of the record set to Dynamic so we can navigate through the record set
rsDateTime.CursorType = 2

'Set the Lock Type for the records so that the record set is only locked when it is updated
rsDateTime.LockType = 3
	
'Query the database
rsDateTime.Open strSQL, strCon

'If the user is changing the date/time setup then update the database
If strMode = "change" Then

	
	'Update the recordset
	rsDateTime.Fields("Date_Format") = Request.Form("dateFormat")
	rsDateTime.Fields("Year_format") = Request.Form("yearFormat")
	rsDateTime.Fields("Time_format") = Request.Form("timeFormat")
	rsDateTime.Fields("Seporator") = Request.Form("seporator")
	rsDateTime.Fields("Server_offset") = Request.Form("serverOffSet")
	rsDateTime.Fields("Server_offset_hours") = CInt(Request.Form("serverOffSetHours"))
	rsDateTime.Fields("am") = Request.Form("am")
	rsDateTime.Fields("pm") = Request.Form("pm")
	
	'Upadet the months (arrays start at 0 in VBScript but for simplisity we are not using location 1)
	For intMonthLoopCounter = 1 to 12
		rsDateTime.Fields("Month" & intMonthLoopCounter) = Request.Form("month" & intMonthLoopCounter)
	Next		
				
	'Update the database with the new user's details
	rsDateTime.Update
		
	'Re-run the query to read in the updated recordset from the database
	rsDateTime.Requery	
End If

'Read in the deatils from the database
If NOT rsDateTime.EOF Then
	
	'Read in the date/time setup from the database
	'Update the recordset
	strDateFormat = rsDateTime("Date_Format")
	strYearFormat = rsDateTime("Year_format")
	intTimeFormat = CInt(rsDateTime("Time_format"))
	strDateSeporator = rsDateTime("Seporator")
	strServerOffSet = rsDateTime("Server_offset")
	intServerOffSet = CInt(rsDateTime("Server_offset_hours"))
	strMorningID = rsDateTime("am")
	strAfternoonID = rsDateTime("pm")
	
	'Update the months (arrays start at 0 in VBScript but for simplisity we are not using location 1)
	For intMonthLoopCounter = 1 to 12
		saryMonth(intMonthLoopCounter) = rsDateTime.Fields("Month" & intMonthLoopCounter)
	Next		
End If
%>  
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Date and Time Configuration</title>
<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
<!-- Check the from is filled in correctly before submitting -->
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {

	//Intialise variables
	var errorMsg = "";
	var errorMsgLong = "";

	//Check for all the month fields having values	
	for (var count = 3; count <= 15; ++count){
		if (document.frmDateTime.elements[count].value == ""){
		
			var monthName;
			
			//get the month
			if (count == 3) {monthName = "January\t";}
			else if (count == 4) {monthName = "February\t";}
			else if (count == 5) {monthName = "March\t";}
			else if (count == 6) {monthName = "April\t";}
			else if (count == 7) {monthName = "May\t";}
			else if (count == 8) {monthName = "June\t";}
			else if (count == 9) {monthName = "July\t";}
			else if (count == 10) {monthName = "August\t";}
			else if (count == 11) {monthName = "September";}
			else if (count == 12) {monthName = "October\t";}
			else if (count == 13) {monthName = "Nevember";}
			else if (count == 14) {monthName = "December";}
			
			//Wriet the error message
			errorMsg += "\n\t" + monthName + " \t- Enter a value for " + monthName;
		}			
	}
	
	//If there is aproblem with the form then display an error
	if ((errorMsg != "") || (errorMsgLong != "")){
		msg = "___________________________________________________________________\n\n";
		msg += "Your settings have not been updated because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "___________________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";
		
		errorMsg += alert(msg + errorMsg + "\n" + errorMsgLong);
		return false;
	}
	
	return true;
}
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<h1 align="center"><font face="Arial, Helvetica, sans-serif">Date and Time Configuration</font></h1>
<div align="center"><a href="admin_menu.asp" target="_self"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Return to the the Administration 
 Menu</font></a><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
 <br>
 The present forum date format is set to: - <b> 
 <% =  DateFormat(Now()) %>
 </b> <br>
 The present forum time format is set to: - <b> 
 <% =  TimeFormat(Now()) %>
 </b></font><b> </b> </div>
<form method="post" name="frmDateTime" action="date_time_configure.asp" onSubmit="return CheckForm();">
 <table width="680" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#000000" height="277">
  <tr> 
   <td height="234" width="680"> 
    <table width="100%" border="0" align="center" height="233" cellpadding="4" cellspacing="1">
     <tr align="left" bgcolor="#CCCCCC"> 
      <td colspan="2" height="30"><font size="3" face="Arial, Helvetica, sans-serif"><b>Configure Date Settings</b></font></td>
     </tr>
     <tr bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="12"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date Format:</font></td>
      <td height="12" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="dateFormat">
        <option value="dd/mm/yy" <% If strDateFormat = "dd/mm/yy" Then Response.Write("selected") %>>Day/Month/Year</option>
        <option value="mm/dd/yy" <% If strDateFormat = "mm/dd/yy" Then Response.Write("selected") %>>Month/Day/Year</option>
        <option value="yy/mm/dd" <% If strDateFormat = "yy/mm/dd" Then Response.Write("selected") %>>Year/Month/Day</option>
        <option value="yy/dd/mm" <% If strDateFormat = "yy/dd/mm" Then Response.Write("selected") %>>Year/Day/Month</option>
       </select>
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="12"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Separator:<br>
       <font size="1">This is the separator between the date eg: <b>12/12/2002</b>, <b>12-12-2002</b>, etc.</font></font></td>
      <td height="12" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="seporator">
        <option value="&nbsp;" <% If strDateSeporator = "&nbsp;" Then Response.Write("selected") %>>&lt;space&gt;</option>
        <option value="/" <% If strDateSeporator = "/" Then Response.Write("selected") %>>/</option>
        <option value="\" <% If strDateSeporator = "\" Then Response.Write("selected") %>>\</option>
        <option value="-" <% If strDateSeporator = "-" Then Response.Write("selected") %>>-</option>
        <option value="&nbsp;-&nbsp;" <% If strDateSeporator = "&nbsp;-&nbsp;" Then Response.Write("selected") %>>&nbsp;-&nbsp;</option>
        <option value="." <% If strDateSeporator = "." Then Response.Write("selected") %>>.</option>
       </select>
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="12"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Year Format:<br>
       <font size="1">This is whether you want the date in 4 digits (2002) or in 2 digits (02)</font></font></td>
      <td height="12" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="yearFormat">
        <option value="long" <% If strYearFormat = "long" Then Response.Write("selected") %>>yyyy</option>
        <option value="short" <% If strYearFormat = "short" Then Response.Write("selected") %>>yy</option>
       </select>
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">January*:<br>
       <font size="1">This is what you would like displayed for January eg: <b>01</b>,<b> 1</b>, <b>Jan</b>, etc.</font></font> </td>
      <td width="41%" valign="top" height="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month1" maxlength="15" value="<% = saryMonth(1) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">February*:<br>
       <font size="1">This is what you would like displayed for February eg: <b>02</b>,<b> 2</b>, <b>Feb</b>, etc.</font></font> </td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month2" maxlength="15" value="<% = saryMonth(2) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">March*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month3" maxlength="15" value="<% = saryMonth(3) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">April*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month4" maxlength="15" value="<% = saryMonth(4) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">May*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month5" maxlength="15" value="<% = saryMonth(5) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">June*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month6" maxlength="15" value="<% = saryMonth(6) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">July*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month7" maxlength="15" value="<% = saryMonth(7) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">August*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month8" maxlength="15" value="<% = saryMonth(8) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">September*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month9" maxlength="15" value="<% = saryMonth(9) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">October*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month10" maxlength="15" value="<% = saryMonth(10) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">November*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month11" maxlength="15" value="<% = saryMonth(11) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="23"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">December*:</font></td>
      <td height="23" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="month12" maxlength="15" value="<% = saryMonth(12) %>" size="15" >
       </font></td>
     </tr>
     <tr  bgcolor="#CCCCCC"> 
      <td align="left" colspan="2"  height="23"><font face="Arial, Helvetica, sans-serif" size="3"><b>Configure Time Settings and Server Off-Set</b></font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="7"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date Format:<br>
       <font size="1">For 12 hour clock set to 12 for military time (24 hour clock) set to 24</font></font></td>
      <td height="7" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="timeFormat">
        <option value="12" <% If intTimeFormat = 12 Then Response.Write("selected") %>>12 Hour Clock</option>
        <option value="24" <% If intTimeFormat = 24 Then Response.Write("selected") %>>24 Hour Clock</option>
       </select>
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="13"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Morning Identifier for 12 hour clock times:<br>
       <font size="1">eg: am</font></font></td>
      <td height="13" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="am" maxlength="5" value="<% = strMorningID %>" size="5" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="13"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Afternoon Identifier for 12 hour clock times:<br>
       <font size="1">eg. pm</font></font></td>
      <td height="13" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <input type="text" name="pm" maxlength="5" value="<% = strAfternoonID %>" size="5" >
       </font></td>
     </tr>
     <tr  bgcolor="#FFFFFF"> 
      <td align="left" width="59%"  height="13"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Time Off-Set from Server:<br>
       <font size="1">If you are in a different time zone to the web server you are using then set how many hours from the server time you want to use in 
       the forum.</font></font></td>
      <td height="13" width="41%" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
       <select name="serverOffSet">
        <option value="+" <% If strServerOffSet = "+" Then Response.Write("selected") %>>+</option>
        <option value="-" <% If strServerOffSet = "-" Then Response.Write("selected") %>>-</option>
       </select>
       <select name="serverOffSetHours">
        <option value="0" <% If intServerOffSet = 0 Then Response.Write("selected") %>>0</option>
        <option value="1" <% If intServerOffSet = 1 Then Response.Write("selected") %>>1</option>
        <option value="2" <% If intServerOffSet = 2 Then Response.Write("selected") %>>2</option>
        <option value="3" <% If intServerOffSet = 3 Then Response.Write("selected") %>>3</option>
        <option value="4" <% If intServerOffSet = 4 Then Response.Write("selected") %>>4</option>
        <option value="5" <% If intServerOffSet = 5 Then Response.Write("selected") %>>5</option>
        <option value="6" <% If intServerOffSet = 6 Then Response.Write("selected") %>>6</option>
        <option value="7" <% If intServerOffSet = 7 Then Response.Write("selected") %>>7</option>
        <option value="8" <% If intServerOffSet = 8 Then Response.Write("selected") %>>8</option>
        <option value="9" <% If intServerOffSet = 9 Then Response.Write("selected") %>>9</option>
        <option value="10" <% If intServerOffSet = 10 Then Response.Write("selected") %>>10</option>
        <option value="11" <% If intServerOffSet = 11 Then Response.Write("selected") %>>11</option>
        <option value="12" <% If intServerOffSet = 12 Then Response.Write("selected") %>>12</option>
        <option value="13" <% If intServerOffSet = 13 Then Response.Write("selected") %>>13</option>
        <option value="14" <% If intServerOffSet = 14 Then Response.Write("selected") %>>14</option>
        <option value="15" <% If intServerOffSet = 15 Then Response.Write("selected") %>>15</option>
        <option value="16" <% If intServerOffSet = 16 Then Response.Write("selected") %>>16</option>
        <option value="17" <% If intServerOffSet = 17 Then Response.Write("selected") %>>17</option>
        <option value="18" <% If intServerOffSet = 18 Then Response.Write("selected") %>>18</option>
        <option value="19" <% If intServerOffSet = 19 Then Response.Write("selected") %>>19</option>
        <option value="20" <% If intServerOffSet = 20 Then Response.Write("selected") %>>20</option>
        <option value="21" <% If intServerOffSet = 21 Then Response.Write("selected") %>>21</option>
        <option value="22" <% If intServerOffSet = 22 Then Response.Write("selected") %>>22</option>
        <option value="23" <% If intServerOffSet = 23 Then Response.Write("selected") %>>23</option>
        <option value="24" <% If intServerOffSet = 24 Then Response.Write("selected") %>>24</option>
       </select> Hours </font></td>
     </tr>
     <tr bgcolor="#FFFFFF" align="center"> 
      <td valign="top" height="2" colspan="2" > 
       <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="hidden" name="mode" value="change">
        <input type="submit" name="Submit" value="Update Date and Time Formats">
        <input type="reset" name="Reset" value="Clear Form">
        </font></p>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <div align="center"><br>
  <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please note: -</font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Time 
  offsets are offset from the time and date settings on the server and <b>not</b> GMT time. <br>
  This is because there is no way of getting the GMT time in ASP without extra components being installed on the server.<br>
  </font><font face="Verdana, Arial, Helvetica, sans-serif"> </font> </div>
</form>
<br>
</body>
</html>
<%
'Reset Server Objects
rsDateTime.Close
Set rsDateTime = Nothing
Set adoCon = Nothing
Set strCon = Nothing
%>

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
Dim intBadWord		'Loop counter for the bad words
Dim saryNewWord(3)	'Holds the word to enter into db
Dim saryReplaceWord(3)	'Holds the word the swear word is to be replaced with

'Loop round three times to get each new bad word
For intBadWord = 1 to 3

	'Read in the words
	saryNewWord(intBadWord) = Request.Form("badWord" & intBadWord)
	saryReplaceWord(intBadWord) = Request.Form("replaceWord" & intBadWord)
	
	'Escape SQL crashing quotes
	saryNewWord(intBadWord) = Replace(saryNewWord(intBadWord), "'", "''", 1, -1, 1)
	saryReplaceWord(intBadWord) = Replace(saryReplaceWord(intBadWord), "'", "''", 1, -1, 1)

	'Check there is a new bad word and a replacement word to add to the database
	If saryNewWord(intBadWord) <> "" AND saryReplaceWord(intBadWord) <> "" Then

		'Initalise the strSQL variable with an SQL statement
		strSQL = "INSERT INTO tblSmut (Smut, Word_replace) VALUES ('" & saryNewWord(intBadWord) & "', '" & saryReplaceWord(intBadWord) & "');"
			
		'Write the updated date of last post to the database
		adoCon.Execute(strSQL)		
	End If
Next
	 
'Reset server variable
Set adoCon = Nothing
Set strCon = Nothing

'Return to the bad word admin page
Response.Redirect "bad_word_filter_configure.asp"
%>

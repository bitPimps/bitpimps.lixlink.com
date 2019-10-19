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



'Check images function
Private Function checkImages(strInputEntry)

	Dim strTempInnerMessageLink
	Dim strInnerMessageLink
	Dim strImageFileExtension
	Dim strInputEntryLink

	'Encode image links to stop malcious code
	Do While NOT InStr(1, strInputEntry, "src=""", 1) = 0
						    	
		'Find the start position in the message of the <img src=" code
		lngLinkStartPos = InStr(1, strInputEntry, "src=""", 1)
																	
		'Find the position in the message for the url > closing tag
		lngLinkEndPos = InStr(lngLinkStartPos, strInputEntry, ">", 1) + 1
						
		'Make sure the end position is not in error
		If lngLinkEndPos - lngLinkStartPos =< 5 Then lngLinkEndPos = lngLinkStartPos + 5
			
		'Read in the code to be be checked
		strInputEntryLink = Trim(Mid(strInputEntry, lngLinkStartPos, (lngLinkEndPos - lngLinkStartPos)))	
		
		'If the > end postition is more than 6 then there is one so get the inputed link
		If lngLinkEndPos > (lngLinkStartPos + 5) Then
			'Start position inside the link tag the actual input starts
			lngLinkStartPos = 6
																	
			'Find the position in the message for the url > closing tag
			lngLinkEndPos = InStr(lngLinkStartPos, strInputEntryLink, ">", 1)
			
			'Place the image path in the image tag into a string
			strInnerMessageLink = Trim(Mid(strInputEntryLink, 6, (lngLinkEndPos - lngLinkStartPos)))
		End If
		
		'Place the message link into the tempoary message variable
		strTempMessageLink = strInputEntryLink
		strTempInnerMessageLink = strInnerMessageLink
		
		'Format the link into an HTML hyperlink
		strTempMessageLink = Replace(strTempMessageLink, "src=""", "src= """, 1, -1, 1)
		
		
		'If there is no . in the link then there is no extenison and so can't be an image
		If inStr(1, strTempInnerMessageLink, ".", 1) = 0 Then 
			strTempInnerMessageLink = """"
		'Else remove malicious code and check the extension is an image extension
		Else
			'Call the format link function to strip malicious codes
			strTempInnerMessageLink = formatLink(strTempInnerMessageLink)
			
			'Strip any pages that try to sneak in
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".htm", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".asp", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".php", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".php3", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".php4", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".aspx", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".ascx", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".asmx", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".vs", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".config", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".asmx", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".jsp", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".jst", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".cgi", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".cfm", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".cfml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".cfc", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".shtml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".ihtml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".java", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".wml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".vbs", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".vtm", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".vtml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".edml", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".pm", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".js", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".inc", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".txt", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".wave", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".exe", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, ".hqx", "", 1, -1, 1)
			strTempInnerMessageLink = Replace(strTempInnerMessageLink, "?", "", 1, -1, 1)
			
			'Get the file extension
			strImageFileExtension = LCase(Right(strTempInnerMessageLink, (Len(strTempInnerMessageLink)-((InstrRev(strTempInnerMessageLink, ".")-1)))))
			'strImageFileExtension = Mid(strInputEntryLink, (InstrRev(strTempInnerMessageLink, ".")-1), (InstrRev(strTempInnerMessageLink, ".")+3))
			
			'Check the file extension if it's not a web graphic then remove the extension
			If NOT (strImageFileExtension = ".gif" OR strImageFileExtension = ".jpg" OR strImageFileExtension = ".jpe" OR strImageFileExtension = ".bmp" OR strImageFileExtension = ".png") Then
					
					'See if there is a valid image extension in there somewhere if there is chop the rest and keep the image extension
					If Instr(LCase(strTempInnerMessageLink), ".gif") Then 
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, ".gif", 1, -1, 1)
					ElseIf Instr(LCase(strTempInnerMessageLink), ".jpg") Then 
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, ".jpg", 1, -1, 1)
					ElseIf Instr(LCase(strTempInnerMessageLink), ".jpe") Then 
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, ".jpeg", 1, -1, 1)
					ElseIf Instr(LCase(strTempInnerMessageLink), ".bmp") Then 
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, ".bmp", 1, -1, 1)
					ElseIf Instr(LCase(strTempInnerMessageLink), ".png") Then 
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, ".png", 1, -1, 1)
					'Else there is no valid image extension in there so chop the lot
					Else
						strTempInnerMessageLink = Replace(strTempInnerMessageLink, strImageFileExtension, "", 1, -1, 1)
					End If
			End If
		End If	
		
		'Place the newly formated image into the tempery image tag
		strTempMessageLink = Replace(strTempMessageLink, strInnerMessageLink, strTempInnerMessageLink, 1, -1, 1)
		
		'Make sure the tag is closed
		If inStr(1, strTempMessageLink, """>", 1) = 0 AND inStr(1, strTempMessageLink, "'>", 1) = 0 Then strTempMessageLink = Replace(strTempMessageLink, ">", """>", 1, -1, 1)	
		
		'Place the new fromatted hyperlink into the message string body
		strInputEntry = Replace(strInputEntry, strInputEntryLink, strTempMessageLink, 1, -1, 1)	
	Loop
	
	'Return
	checkImages = strInputEntry
End Function	


'Check links function
Private Function checkLinks(strInputEntry)

	Dim strTempInnerMessageLink
	Dim strInnerMessageLink
	Dim strImageFileExtension
	Dim strInputEntryLink

	'Encode URL links to stop malcious code
	Do While NOT InStr(1, strInputEntry, "href=""", 1) = 0
						    	
		'Find the start position in the message of the <img src=" code
		lngLinkStartPos = InStr(1, strInputEntry, "href=""", 1)
																	
		'Find the position in the message for the url > closing tag
		lngLinkEndPos = InStr(lngLinkStartPos, strInputEntry, "</a>", 1) + 4
		
		'Make sure the end position is not in error
		If lngLinkEndPos - lngLinkStartPos =< 6 Then lngLinkEndPos = lngLinkStartPos + 6
		
		'Read in the code to be be checked
		strInputEntryLink = Trim(Mid(strInputEntry, lngLinkStartPos, (lngLinkEndPos - lngLinkStartPos)))	
		
		'If the > end postition is more than 6 then there is one so get the inputed link
		If lngLinkEndPos > (lngLinkStartPos + 6) Then
			'Start position inside the link tag the actual input starts
			lngLinkStartPos = 7
																	
			'Find the position in the message for the url > closing tag
			lngLinkEndPos = InStr(lngLinkStartPos, strInputEntryLink, "</a>", 1)
			
			'Place the image path in the image tag into a string
			strInnerMessageLink = Trim(Mid(strInputEntryLink, 7, (lngLinkEndPos - lngLinkStartPos)))
		End If
		
		'Place the message link into the tempoary message variable
		strTempMessageLink = strInputEntryLink
		strTempInnerMessageLink = strInnerMessageLink
		
		'Format the link into an HTML hyperlink
		strTempMessageLink = Replace(strTempMessageLink, "href=""", "href= """, 1, -1, 1)
		
		'Remove font formating from the link as it may course the link to display incorrectly
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "</font>", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "<font", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "<strong>", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "</strong>", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "<em>", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "</em>", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "serif"">", "serif", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "mono"">", "mono", 1, -1, 1)
		
		'Turn the end "> into a code so it don't get striped
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, """>", "*/*\*", 1, -1, 1)
		
		'Call the format link function to strip malicious codes
		strTempInnerMessageLink = formatLink(strTempInnerMessageLink)
		
		'Turn the end code into back into "> so it knows which bit is the href
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "*/*\*", """>", 1, -1, 1)
		
		'Remove font formating from the link as it may course the link to display incorrectly
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "face=Arial, Helvetica, sans-serif", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "face=Courier New, Courier, mono", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "face=Times New Roman, Times, serif", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "face=Verdana, Arial, Helvetica, sans-serif", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=black", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=white", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=blue", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=red", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=green", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=yellow", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=orange", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=brown", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=magenta", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=cyan", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "color=limegreen", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=1", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=2", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=3", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=4", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=5", "", 1, -1, 1)
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "size=6", "", 1, -1, 1)
		
		'If there is an image in the link reformat it back again
		strTempInnerMessageLink = Replace(strTempInnerMessageLink, "img border=0 src=", "<img border=""0"" src= """, 1, -1, 1)
		
		
		'Place the newly formated image into the tempery image tag
		strTempMessageLink = Replace(strTempMessageLink, strInnerMessageLink, strTempInnerMessageLink, 1, -1, 1)	
		
		'Make sure the tag is closed
		If inStr(1, strTempMessageLink, """>", 1) = 0 AND inStr(1, strTempMessageLink, "'>", 1) = 0 Then strTempMessageLink = Replace(strTempMessageLink, ">", """>", 1, -1, 1)	
		
		'Place the new fromatted hyperlink into the message string body
		strInputEntry = Replace(strInputEntry, strInputEntryLink, strTempMessageLink, 1, -1, 1)	
	Loop
	
	'Return
	checkLinks = strInputEntry
End Function	


'Format user input function
Private Function formatInput(strInputEntry)

	'Get rid of malicous code in the message
	strInputEntry = Replace(strInputEntry, "script", "&#115;cript", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "SCRIPT", "&#083;CRIPT", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Script", "&#083;cript", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "script", "&#083;cript", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "style", "&#115;tyle", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "STYLE", "&#083;TYLE", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Style", "&#083;tyle", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "style", "&#083;tylet", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "object", "&#111;bject", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "OBJECT", "&#079;BJECT", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Object", "&#079;bject", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "object", "&#079;bject", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "applet", "&#097;pplet", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "APPLET", "&#065;PPLET", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Applet", "&#065;pplet", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "applet", "&#065;pplet", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "embed", "&#101;mbed", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "EMBED", "&#069;MBED", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Embed", "&#069;mbed", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "embed", "&#069;mbed", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "event", "&#101;vent", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "EVENT", "&#069;VENT", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Event", "&#069;vent", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "event", "&#069;vent", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "document", "&#100;ocument", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "DOCUMENT", "&#068;OCUMENT", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Document", "&#068;ocument", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "document", "&#068;ocument", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "cookie", "&#099;ookie", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "COOKIE", "&#067;OOKIE", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Cookie", "&#067;ookie", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "cookie", "&#067;ookie", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "form", "&#102;orm", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "FORM", "&#070;ORM", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Form", "&#070;orm", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "form", "&#070;orm", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "iframe", "i&#102;rame", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "IFRAME", "I&#070;RAME", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "Iframe", "I&#102;rame", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "iframe", "i&#102;rame", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "on", "&#111;n", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "ON", "&#079;N", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "On", "&#079;n", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "on", "&#111;n", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "%", "&#037;", 1, -1, 1)
	
	'Reformat a few bits
	strInputEntry = Replace(strInputEntry, "<STR&#079;NG>", "<strong>", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "<STR&#111;nNG>", "<strong>", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "</STR&#079;NG>", "</strong>", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "</STR&#111;nNG>", "</strong>", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "f&#111;nt", "font", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "F&#079;NT", "FONT", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "F&#111;nt", "Font", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "f&#079;nt", "font", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "f&#111;nt", "font", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "m&#111;no", "mono", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "M&#079;NO", "MONO", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "M&#079;no", "Mono", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "m&#079;no", "mono", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "m&#111;no", "mono", 1, -1, 1)
	
	'Return
	formatInput = strInputEntry
End Function


'Format links funtion
Private Function formatLink(strInputEntry)

	'Remove malisous charcters from links and images
	strInputEntry = Replace(strInputEntry, "document.cookie", ".", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "javascript:", "javascript ", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "vbscript:", "vbscript ", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "(", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, ")", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "[", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "]", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "{", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "}", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "<", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, ">", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "|", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, """", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "'", " ", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "script", "&#115;cript", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "object", "&#111;bject", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "applet", "&#097;pplet", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "embed", "&#101;mbed", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "document", "&#100;ocument", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "cookie", "&#099;ookie", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "event", "&#101;vent", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "on", "&#111;n", 1, -1, 1)
	
	'Return
	formatLink = strInputEntry
End Function


'Format SQL Query funtion
Private Function formatSQLInput(strInputEntry)

	'Remove malisous charcters from links and images
	strInputEntry = Replace(strInputEntry, "<", "&lt;")
	strInputEntry = Replace(strInputEntry, ">", "&gt;")
	strInputEntry = Replace(strInputEntry, """", "", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "=", "&#061;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "'", "''", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "select", "sel&#101;ct", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "join", "jo&#105;n", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "union", "un&#105;on", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "where", "wh&#101;re", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "insert", "ins&#101;rt", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "delete", "del&#101;te", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "update", "up&#100;ate", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "like", "lik&#101;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "drop", "dro&#112;", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "create", "cr&#101;ate", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "modify", "mod&#105;fy", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "rename", "ren&#097;me", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "alter", "alt&#101;r", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "cast", "ca&#115;t", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "pass", "pa&#115;s", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "code", "co&#100;e", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "author", "aut&#104;or", 1, -1, 1)
	strInputEntry = Replace(strInputEntry, "username", "usernam&#101;", 1, -1, 1)
	
	'Return
	formatSQLInput = strInputEntry
End Function


'Decode encoded strings
Private Function decodeString(strInputEntry)

	'Remove malisous charcters from links and images
	strInputEntry = Replace(strInputEntry, "&#061;", "=", 1, -1, 0)
	
	strInputEntry = Replace(strInputEntry, "&#097;", "a", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#098;", "b", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#099;", "c", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#100;", "d", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#101;", "e", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#102;", "f", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#103;", "g", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#104;", "h", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#105;", "i", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#106;", "j", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#107;", "k", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#108;", "l", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#109;", "m", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#110;", "n", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#111;", "o", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#112;", "p", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#113;", "q", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#114;", "r", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#115;", "s", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#116;", "t", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#117;", "u", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#118;", "v", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#119;", "w", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#120;", "x", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#121;", "y", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#122;", "z", 1, -1, 0)
	
	strInputEntry = Replace(strInputEntry, "&#065;", "A", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#066;", "B", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#067;", "C", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#068;", "D", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#069;", "E", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#070;", "F", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#071;", "G", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#072;", "H", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#073;", "I", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#074;", "J", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#075;", "K", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#076;", "L", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#077;", "M", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#078;", "N", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#079;", "O", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#080;", "P", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#081;", "Q", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#082;", "R", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#083;", "S", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#084;", "T", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#085;", "U", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#086;", "V", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#087;", "W", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#088;", "X", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#089;", "Y", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#090;", "Z", 1, -1, 0)
	
	
	strInputEntry = Replace(strInputEntry, "&#048;", "0", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#049;", "1", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#050;", "2", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#051;", "3", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#052;", "4", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#053;", "5", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#054;", "6", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#055;", "7", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#056;", "8", 1, -1, 0)
	strInputEntry = Replace(strInputEntry, "&#057;", "9", 1, -1, 0)
	
	'Return
	decodeString = strInputEntry
End Function
%>
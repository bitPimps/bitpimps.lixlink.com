<% Option Explicit %>
<!--#include file="common.asp" -->
<!--#include file="langauge_file.inc" -->
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


Response.Buffer = True 

'Reset Server Objects
Set adoCon = Nothing
Set strCon = Nothing
%>
<html>
<head>
<meta name="copyright" content="Copyright (C) 2001-2002 Bruce Corkhill">
<title>Emoticon Smilies</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->
		
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to add smiley
function AddSmileyIcon(imagePath){	
	window.opener.frames.message.focus();								
	window.opener.frames.message.document.execCommand('InsertImage', false, imagePath);
	window.close();
}

// -->
</script>
<!--#include file="skin_file.inc" -->
</head>
<body bgcolor="<% = strBgColour %>" text="<% = strTextColour %>" background="<% = strBgImage %>" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    <td align="center"><span class="heading"><% = strTxtEmoticonSmilies %></span></td>
  </tr>
</table>
<br>
  <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>" height="138">
  <tr> 
      <td height="174"> 
        
      <table border="0" align="center" cellpadding="4" cellspacing="1" width="350">
        <tr align="left" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
          <td colspan="2" class="text" align="center"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td align="center"><% = strTxtClickOnEmoticonToAdd %></td>
              </tr>
            </table>
            <table width="340" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley1.gif" width="17" height="17" border="0" alt="[:)]" OnClick="AddSmileyIcon('smileys/smiley1.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtSmile %></td>
                <td width="13" class="text"><img src="smileys/smiley9.gif" width="17" height="17" border="0" alt="[:oops:]" OnClick="AddSmileyIcon('smileys/smiley9.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtEmbarassed %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley2.gif" width="17" height="17" border="0" alt="[;)]" OnClick="AddSmileyIcon('smileys/smiley2.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtWink %></td>
                <td width="13" class="text"><img src="smileys/smiley10.gif" width="17" height="17" border="0" alt="[:star:]" OnClick="AddSmileyIcon('smileys/smiley10.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtStar %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley3.gif" width="17" height="17" border="0" alt="[o)]" OnClick="AddSmileyIcon('smileys/smiley3.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtShocked %></td>
                <td width="13" class="text"><img src="smileys/smiley11.gif" width="17" height="17" border="0" alt="[xx(]" OnClick="AddSmileyIcon('smileys/smiley11.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtDead %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley4.gif" width="17" height="17" border="0" alt="[:D]" OnClick="AddSmileyIcon('smileys/smiley4.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtBigSmile %></td>
                <td width="13" class="text"><img src="smileys/smiley12.gif" width="17" height="17" border="0" alt="[|)]" OnClick="AddSmileyIcon('smileys/smiley12.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtSleepy %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley5.gif" width="17" height="17" border="0" alt="[:errr:]" OnClick="AddSmileyIcon('smileys/smiley5.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtConfused %></td>
                <td width="13" class="text"><img src="smileys/smiley13.gif" width="17" height="17" border="0" alt="[:V:]" OnClick="AddSmileyIcon('smileys/smiley13.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtDisapprove %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley6.gif" width="17" height="17" border="0" alt="[:(]" OnClick="AddSmileyIcon('smileys/smiley6.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtUnhappy %></td>
                <td width="13" class="text"><img src="smileys/smiley14.gif" width="17" height="17" border="0" alt="[:^:]" OnClick="AddSmileyIcon('smileys/smiley14.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtApprove %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley7.gif" width="17" height="17" border="0" alt="[:x]" OnClick="AddSmileyIcon('smileys/smiley7.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtAngry %></td>
                <td width="13" class="text"><img src="smileys/smiley15.gif" width="17" height="17" border="0" alt="[}:)]" OnClick="AddSmileyIcon('smileys/smiley15.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtEvil %></td>
              </tr>
              <tr> 
                <td width="17" class="text"><img src="smileys/smiley8.gif" width="17" height="17" border="0" alt="[:o)]" OnClick="AddSmileyIcon('smileys/smiley8.gif')" style="cursor: hand;"></td>
                <td width="137" class="text"><% = strTxtClown %></td>
                <td width="13" class="text"><img src="smileys/smiley16.gif" width="17" height="17" border="0" alt="[8D]" OnClick="AddSmileyIcon('smileys/smiley16.gif')" style="cursor: hand;"></td>
                <td width="141" class="text"><% = strTxtCool %></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    <td align="center" height="34"><a href="JavaScript:onClick=window.close()"><% = strTxtCloseWindow %></a></td>
  </tr>
</table>
<div align="center">
<% 
'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
If blnLCode = True Then
	If blnTextLinks = True Then 
		Response.Write("<span class=""text"" style=""font-size:10px"">Powered by <a href=""http://www.webwizforums.com"" target=""_blank"" style=""font-size:10px"">Web Wiz Forums</a> version 6.34</span>")
	Else
  		Response.Write("<a href=""http://www.webwizforums.com"" target=""_blank""><img src=""" & strImagePath & "web_wiz_guide.gif"" border=""0"" alt=""Powered by Web Wiz Forums version 6.34""></a>")
	End If
	
	Response.Write("<br><span class=""text"" style=""font-size:10px"">Copyright &copy;2001-2002 Web Wiz Guide</span>")
End If 
'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
</div>
</body>
</html>

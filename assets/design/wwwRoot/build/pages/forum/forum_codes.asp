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
<title>Forum Codes</title>

<!-- Web Wiz Forums is written and produced by Bruce Corkhill ©2001-2002
     	If you want your own Forum then goto http://www.webwizforums.com -->

<!--#include file="skin_file.inc" -->
</head>
<body bgcolor="<% = strBgColour %>" text="<% = strTextColour %>" background="<% = strBgImage %>" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<table width="<% = strTableVariableWidth %>" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    
  <td align="center"><span class="heading"><% = strTxtForumCodes %></span><br>
   <span class="text"><% = strTxtYouCanUseForumCodesToFormatText %></span></td>
  </tr>
</table>
<br>
<table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<% = strTableBorderColour %>">
 <tr> 
  <td> 
   <table border="0" align="center" cellpadding="4" cellspacing="1" width="500">
    <tr align="left"  bgcolor="<% = strTableTitleColour %>">
     <td colspan="2" class="text" align="center">
      <table width="100%" border="0" cellspacing="0" cellpadding="1">
       <tr> 
        <td width="62%" class="bold"><% = strTxtTypedForumCode %></td>
        <td width="38%" class="bold"><% = strTxtConvetedCode %></td>
       </tr>
      </table>
     </td>
    </tr>
    <tr align="left" bgcolor="<% = strTableColour %>" background="<% = strTableBgImage %>"> 
     <td colspan="2" class="text" align="center"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="1">
       <tr> 
        <td width="63%" class="bold"><% = strTxtTextFormating %></td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="text">[B]<% = strTxtBold %>[/B]</td>
        <td width="37%"><b class="text"><% = strTxtBold %></b></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[I]<% = strTxtItalic %>[/I]</td>
        <td width="37%"><i class="text"><% = strTxtItalic %></i></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[U]<% = strTxtUnderline %>[/U]</td>
        <td width="37%"><u class="text"><% = strTxtUnderline %></u></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[CENTER]<% = strTxtCentre %>[/CENTER]</td>
        <td width="37%" align="center" class="text"><% = strTxtCentre %></td>
       </tr>
       <tr> 
        <td width="63%" class="text">&nbsp;</td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="bold"><% = strTxtImagesAndLinks %></td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="text">[IMG]http://myWeb.com/smiley.gif[/IMG]</td>
        <td width="37%"><img src="smileys/smiley4.gif" width="17" height="17"></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[URL=http://www.myWeb.com]<% = strTxtMyLink %>[/URL]</td>
        <td width="37%"><a href="#"><% = strTxtMyLink %></a></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[EMAIL=me@myWeb.com]<% = strTxtMyEmail %>[/EMAIL]</td>
        <td width="37%"><a href="me@myWeb.com"><% = strTxtMyEmail %></a></td>
       </tr>
       <tr> 
        <td width="63%" class="text">&nbsp;</td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="bold"><% = strTxtFontTypes %></td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="text">[FONT=Arial]Arial[/FONT]</td>
        <td width="37%"><font face="Arial, Helvetica, sans-serif" size="2">Arial</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[FONT=Courier]Courier[/FONT]</td>
        <td width="37%"><font face="Courier New, Courier, mono">Courier</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[FONT=Times]Times[/FONT]</td>
        <td width="37%"><font face="Times New Roman, Times, serif">Times</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[FONT=Verdana]Verdana[/FONT]</td>
        <td width="37%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Verdana</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">&nbsp;</td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="bold"><% = strTxtFontSizes %></td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=1]<% = strTxtFontSize %> 1[/FONT]</td>
        <td width="37%"><font size="1"><% = strTxtFontSize %> 1</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=2]<% = strTxtFontSize %> 2[/FONT]</td>
        <td width="37%"><font size="2"><% = strTxtFontSize %> 2</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=3]<% = strTxtFontSize %> 3[/FONT]</td>
        <td width="37%"><font size="3"><% = strTxtFontSize %> 3</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=4]<% = strTxtFontSize %> 4[/FONT]</td>
        <td width="37%"><font size="4"><% = strTxtFontSize %> 4</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=5]<% = strTxtFontSize %> 5[/FONT]</td>
        <td width="37%"><font size="5"><% = strTxtFontSize %> 5</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[SIZE=6]<% = strTxtFontSize %> 6[/FONT]</td>
        <td width="37%"><font size="6"><% = strTxtFontSize %> 6</font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">&nbsp;</td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="bold"><% = strTxtFontColours %></td>
        <td width="37%">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="text">[BLACK]<% = strTxtBlack & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="black"><% = strTxtBlack & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[WHITE]<% = strTxtWhite & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="white"><% = strTxtWhite & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[BLUE]<% = strTxtBlue & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="blue"><% = strTxtBlue & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[RED]<% = strTxtRed  & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="red"><% = strTxtRed & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[GREEN]<% = strTxtGreen & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="green"><% = strTxtGreen & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[YELLOW]<% = strTxtYellow & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="yellow"><% = strTxtYellow & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[ORANGE]<% = strTxtOrange & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="orange"><% = strTxtOrange & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[BROWN]<% = strTxtBrown & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="brown"><% = strTxtBrown & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[MAGENTA]<% = strTxtMagenta & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="magenta"><% = strTxtMagenta & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[CYAN]<% = strTxtCyan & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="cyan"><% = strTxtCyan & " " & strTxtFont %></font></td>
       </tr>
       <tr> 
        <td width="63%" class="text">[LIME GREEN]<% = strTxtLimeGreen & " " & strTxtFont %>[/FONT]</td>
        <td width="37%" class="text"><font color="limegreen"><% = strTxtLimeGreen & " " & strTxtFont %></font></td>
       </tr><% 
If blnEmoticons = True Then %>
       <tr> 
        <td width="63%" class="text">&nbsp;</td>
        <td width="37%" class="text">&nbsp;</td>
       </tr>
       <tr> 
        <td width="63%" class="bold"><% = strTxtEmoticons %></td>
        <td width="37%" class="text">&nbsp;</td>
       </tr>
       <tr>       
        <td colspan="2"> 
         <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley1.gif" width="17" height="17" border="0" alt="[:)]"></td>
           <td width="21%" class="text"> 
            <% = strTxtSmile %>
           </td>
           <td width="21%" class="text">[:)]</td>
           <td width="7%" class="text"><img src="smileys/smiley9.gif" width="17" height="17" border="0" alt="[:oops:]"></td>
           <td width="24%" class="text"> 
            <% = strTxtEmbarassed %>
           </td>
           <td width="20%" class="text">[:oops:]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley2.gif" width="17" height="17" border="0" alt="[;)]"></td>
           <td width="21%" class="text"> 
            <% = strTxtWink %>
           </td>
           <td width="21%" class="text">[;)]</td>
           <td width="7%" class="text"><img src="smileys/smiley10.gif" width="17" height="17" border="0" alt="[:star:]"></td>
           <td width="24%" class="text"> 
            <% = strTxtStar %>
           </td>
           <td width="20%" class="text">[:star:]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley3.gif" width="17" height="17" border="0" alt="[o)]"></td>
           <td width="21%" class="text"> 
            <% = strTxtShocked %>
           </td>
           <td width="21%" class="text">[:O]</td>
           <td width="7%" class="text"><img src="smileys/smiley11.gif" width="17" height="17" border="0" alt="[xx(]"></td>
           <td width="24%" class="text"> 
            <% = strTxtDead %>
           </td>
           <td width="20%" class="text">[xx(]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley4.gif" width="17" height="17" border="0" alt="[:D]"></td>
           <td width="21%" class="text"> 
            <% = strTxtBigSmile %>
           </td>
           <td width="21%" class="text">[:D]</td>
           <td width="7%" class="text"><img src="smileys/smiley12.gif" width="17" height="17" border="0" alt="[|)]"></td>
           <td width="24%" class="text"> 
            <% = strTxtSleepy %>
           </td>
           <td width="20%" class="text">[|)]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley5.gif" width="17" height="17" border="0" alt="[:errr:]"></td>
           <td width="21%" class="text"> 
            <% = strTxtConfused %>
           </td>
           <td width="21%" class="text">[:errr:]</td>
           <td width="7%" class="text"><img src="smileys/smiley13.gif" width="17" height="17" border="0" alt="[:V:]"></td>
           <td width="24%" class="text"> 
            <% = strTxtDisapprove %>
           </td>
           <td width="20%" class="text">[:V:]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley6.gif" width="17" height="17" border="0" alt="[:(]"></td>
           <td width="21%" class="text"> 
            <% = strTxtUnhappy %>
           </td>
           <td width="21%" class="text">[:(]</td>
           <td width="7%" class="text"><img src="smileys/smiley14.gif" width="17" height="17" border="0" alt="[:^:]"></td>
           <td width="24%" class="text"> 
            <% = strTxtApprove %>
           </td>
           <td width="20%" class="text">[:^:]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley7.gif" width="17" height="17" border="0" alt="[:x]"></td>
           <td width="21%" class="text"> 
            <% = strTxtAngry %>
           </td>
           <td width="21%" class="text">[:x]</td>
           <td width="7%" class="text"><img src="smileys/smiley15.gif" width="17" height="17" border="0" alt="[}:)]"></td>
           <td width="24%" class="text"> 
            <% = strTxtEvil %>
           </td>
           <td width="20%" class="text">[}:)]</td>
          </tr>
          <tr> 
           <td width="7%" class="text"><img src="smileys/smiley8.gif" width="17" height="17" border="0" alt="[:o)]"></td>
           <td width="21%" class="text"> 
            <% = strTxtClown %>
           </td>
           <td width="21%" class="text">[:o)]</td>
           <td width="7%" class="text"><img src="smileys/smiley16.gif" width="17" height="17" border="0" alt="[8D]"></td>
           <td width="24%" class="text"> 
            <% = strTxtCool %>
           </td>
           <td width="20%" class="text">[8D]</td>
          </tr>
         </table>
        </td>
       </tr><%
End If
      %> 
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

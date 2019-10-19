<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
{META}
{NAV_LINKS}
<title>{SITENAME} :: {PAGE_TITLE}</title>
<!-- link rel="stylesheet" href="templates/bitPimps/{T_HEAD_STYLESHEET}" type="text/css" -->
<style type="text/css">
<!--
/*
  The original bitPimps Theme for phpBB version 2+
  Created by lixlink.com design
  http://www.lixlink.com

  NOTE: These CSS definitions are stored within the main page body so that you can use the phpBB2
  theme administration centre. When you have finalised your style you could cut the final CSS code
  and place it in an external file, deleting this section to save bandwidth.
*/

/* General page style. The scroll bar colours only visible in IE5.5+ */
body { 
	background-color: {T_BODY_BGCOLOR};
	scrollbar-face-color: {T_TR_COLOR2};
	scrollbar-highlight-color: {T_TD_COLOR2};
	scrollbar-shadow-color: {T_TR_COLOR2};
	scrollbar-3dlight-color: {T_TR_COLOR3};
	scrollbar-arrow-color:  {T_BODY_LINK};
	scrollbar-track-color: {T_TR_COLOR1};
	scrollbar-darkshadow-color: {T_TH_COLOR1};
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 0 0 0;
	text-align: center;
	background-image: url(../../images/bg_body.gif);
	background-repeat:repeat;
}

/* General font families for common tags */
font,th,td,p { font-family: {T_FONTFACE1} }
a:link,a:active,a:visited { color : {T_BODY_LINK}; }
a:hover		{ text-decoration: underline; color : {T_BODY_HLINK}; }
hr	{ height: 0px; border: solid {T_TR_COLOR3} 0px; border-top-width: 1px;}

/* This is the border line & background colour round the entire page */
.bodyline	{ background-color: {T_TD_COLOR2}; border: 1px {T_TH_COLOR1} solid; }

/* This is the outline round the main forum tables */
.forumline	{ background-color: {T_TD_COLOR2}; border: 2px {T_TH_COLOR2} solid; }

/* Main table cell colours and backgrounds */
td.row1	{ background-color: {T_TR_COLOR1}; }
td.row2	{ background-color: {T_TR_COLOR2}; }
td.row3	{ background-color: {T_TR_COLOR3}; }

/*
  This is for the table cell above the Topics, Post & Last posts on the index.php page
  By default this is the fading out gradiated silver background.
  However, you could replace this with a bitmap specific for each forum
*/
td.rowpic {
		background-color: {T_TD_COLOR2};
		background-image: url(templates/bitPimps/images/{T_TH_CLASS3});
		background-repeat: repeat-y;
}

/* Header cells - the blue and silver gradient backgrounds */
th	{
	color: {T_FONTCOLOR3}; font-size: {T_FONTSIZE2}px; font-weight : bold; 
	background-color: {T_BODY_LINK}; height: 25px;
	background-image: url(templates/bitPimps/images/{T_TH_CLASS2});
}

td.cat,td.catHead,td.catSides,td.catLeft,td.catRight,td.catBottom {
			background-image: url(templates/bitPimps/images/{T_TH_CLASS1});
			background-color:{T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid; height: 28px;
}

/*
  Setting additional nice inner borders for the main table cells.
  The names indicate which sides the border will be on.
  Don't worry if you don't understand this, just ignore it :-)
*/
td.cat,td.catHead,td.catBottom {
	height: 29px;
	border-width: 0px 0px 0px 0px;
}
th.thHead,th.thSides,th.thTop,th.thLeft,th.thRight,th.thBottom,th.thCornerL,th.thCornerR {
	font-weight: bold; border: {T_TD_COLOR2}; border-style: solid; height: 28px;
}
td.row3Right,td.spaceRow {
	background-color: {T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid;
}

th.thHead,td.catHead { font-size: {T_FONTSIZE3}px; border-width: 1px 1px 0px 1px; }
th.thSides,td.catSides,td.spaceRow	 { border-width: 0px 1px 0px 1px; }
th.thRight,td.catRight,td.row3Right	 { border-width: 0px 1px 0px 0px; }
th.thLeft,td.catLeft	  { border-width: 0px 0px 0px 1px; }
th.thBottom,td.catBottom  { border-width: 0px 1px 1px 1px; }
th.thTop	 { border-width: 1px 0px 0px 0px; }
th.thCornerL { border-width: 1px 0px 0px 1px; }
th.thCornerR { border-width: 1px 1px 0px 0px; }

/* The largest text used in the index page title and toptic title etc. */
.maintitle	{
	font-weight: bold; font-size: 22px; font-family: "{T_FONTFACE2}",{T_FONTFACE1};
	text-decoration: none; line-height : 120%; color : {T_BODY_TEXT};
}

/* General text */
.gen { font-size : {T_FONTSIZE3}px; }
.genmed { font-size : {T_FONTSIZE2}px; }
.gensmall { font-size : {T_FONTSIZE1}px; }
.gen,.genmed,.gensmall { color : {T_BODY_TEXT}; }
a.gen,a.genmed,a.gensmall { color: {T_BODY_LINK}; text-decoration: none; }
a.gen:hover,a.genmed:hover,a.gensmall:hover	{ color: {T_BODY_HLINK}; text-decoration: underline; }

/* The register, login, search etc links at the top of the page */
.mainmenu		{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT} }
a.mainmenu		{ text-decoration: none; color : {T_BODY_LINK};  }
a.mainmenu:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Forum category titles */
.cattitle		{ font-weight: bold; font-size: {T_FONTSIZE3}px ; letter-spacing: 1px; color : {T_BODY_LINK}}
a.cattitle		{ text-decoration: none; color : {T_BODY_LINK}; }
a.cattitle:hover{ text-decoration: underline; }

/* Forum title: Text and link to the forums used in: index.php */
.forumlink		{ font-weight: bold; font-size: {T_FONTSIZE3}px; color : {T_BODY_LINK}; }
a.forumlink 	{ text-decoration: none; color : {T_BODY_LINK}; }
a.forumlink:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Used for the navigation text, (Page 1,2,3 etc) and the navigation bar when in a forum */
.nav			{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT};}
a.nav			{ text-decoration: none; color : {T_BODY_LINK}; }
a.nav:hover		{ text-decoration: underline; }

/* titles for the topics: could specify viewed link colour too */
.topictitle,h1,h2	{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT}; }
a.topictitle:link   { text-decoration: none; color : {T_BODY_LINK}; }
a.topictitle:visited { text-decoration: none; color : {T_BODY_VLINK}; }
a.topictitle:hover	{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Name of poster in viewmsg.php and viewtopic.php and other places */
.name			{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT};}

/* Location, number of posts, post date etc */
.postdetails		{ font-size : {T_FONTSIZE1}px; color : {T_BODY_TEXT}; }

/* The content of the posts (body of text) */
.postbody { font-size : {T_FONTSIZE3}px; line-height: 18px}
a.postlink:link	{ text-decoration: underline; color : {T_BODY_LINK} }
a.postlink:visited { text-decoration: underline; color : {T_BODY_VLINK}; }
a.postlink:hover { text-decoration: underline; color : {T_BODY_HLINK}}

/* Quote & Code blocks */
.code { 
	font-family: {T_FONTFACE3}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR2};
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

.quote {
	font-family: {T_FONTFACE1}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR1}; line-height: 125%;
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

/* Copyright and bottom info */
.copyright		{ font-size: {T_FONTSIZE1}px; font-family: {T_FONTFACE1}; color: {T_FONTCOLOR1}; letter-spacing: -1px;}
a.copyright		{ color: {T_FONTCOLOR1}; text-decoration: none;}
a.copyright:hover { color: {T_BODY_TEXT}; text-decoration: underline;}

/* Form elements */
input,textarea, select {
	color : {T_BODY_TEXT};
	font: normal {T_FONTSIZE2}px {T_FONTFACE1};
	border-color : {T_BODY_TEXT};
}

/* The text input fields background colour */
input.post, textarea.post, select {
	background-color : {T_TD_COLOR2};
}

input { text-indent : 2px; }

/* The buttons used for bbCode styling in message post */
input.button {
	background-color : {T_TR_COLOR1};
	color : {T_BODY_TEXT};
	font-size: {T_FONTSIZE2}px; font-family: {T_FONTFACE1};
}

/* The main submit button option */
input.mainoption {
	background-color : {T_TD_COLOR1};
	font-weight : bold;
}

/* None-bold submit button */
input.liteoption {
	background-color : {T_TD_COLOR1};
	font-weight : normal;
}

/* This is the line in the posting page which shows the rollover
  help line. This is actually a text box, but if set to be the same
  colour as the background no one will know ;)
*/
.helpline { background-color: {T_TR_COLOR2}; border-style: none; }

/* MY ADDED STYLES */
/* Layout Layers */
#barHeader {
	width:90%;
	height:6px;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	background-color:#EF4427;
	border-bottom: 1px solid #000;
}
#barContainer {
	width:90%;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	border-right: 1px solid #A4ADA8;
	border-left: 1px solid #A4ADA8;
}
#barTop {
	width:100%;
	height:2px;
	padding:0px;
	background-color:#9DC1DF;
	border-top: 2px solid #39658A;
	border-bottom: 2px solid #000;
}
#barBottom {
	width:100%;
	height:2px;
	padding:0px;
	background-color:#9DC1DF;
	border-top: 2px solid #000;
	border-bottom: 2px solid #39658A;
}
/*///////////////
//	Logo & Nav //
///////////////*/
#headcontainer {
	width:90%;
	height:60px;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	text-align:left;
	background-color:#000;
	border-top:1px solid #A4ADA8;
	border-right:1px solid #A4ADA8;
	border-left:1px solid #A4ADA8;
	background-image:url(../../images/bg_head.jpg);
	background-position:right;
	background-repeat:no-repeat;
}
#logo {
	width:165px;
	height:60px;
	float:left;
}
#bodyContainer {
	width:90%;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	text-align:left;
	background-color:#E4E4E4;
	border-right:1px solid #A4ADA8;
	border-left:1px solid #A4ADA8;
}
#copyright {
	width:90%;
	height:25px;
	margin-right:auto;
	margin-left:auto;
	padding:0px;
	text-align:center;
	background-color:#000;
	border-right:1px solid #A4ADA8;
	border-bottom:1px solid #A4ADA8;
	border-left:1px solid #A4ADA8;
	font-size:10px;
	color:#B6C4BD;
	line-height:18px;
}
/*////////////////////
//	Navigation MAIN //
////////////////////*/
#nav {
	width:406px;
	height:20px;
	float:right;
	margin:40px 0 0 0px;
	padding: 0;
}
#nav ul
{
	border: 0;
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

#nav ul li
{
	display: block;
	float: left;
	text-align: center;
	padding: 0;
	margin: 0px 0px 0px 1px;
}

#nav ul li a
{
	background: #727272;
	width: 80px;
	height: 20px;
	padding: 0;
	margin: 0;
	color: #FFDDAB;
	text-decoration: none;
	display: block;
	text-align: center;
	font: bold 12px/18px Arial, Helvetica, sans-serif;
}

#nav ul li a:hover
{
	color: #FFDDAB;
	background-color: #929292;
}

#nav a:active
{
	background: #727272;
	color: #EF4427;
}

#nav li#active a
{
	background: #727272;
	color: #EF4427;
}

/* Import the fancy styles for IE only (NS4.x doesn't use the @import function) */
@import url("templates/bitPimps/formIE.css"); 
-->
</style>
<!-- BEGIN switch_enable_pm_popup -->
<script language="Javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} )
	{
		window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');;
	}
//-->
</script>
<!-- END switch_enable_pm_popup -->
</head>
<body bgcolor="{T_BODY_BGCOLOR}" text="{T_BODY_TEXT}" link="{T_BODY_LINK}" vlink="{T_BODY_VLINK}">

<a name="top"></a>
<div id="barHeader"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="6" id="shim" /></div>
<div id="headcontainer">
	<div id="logo">
  	<a href="../../index.php"><img src="../../images/bitpimps.gif" alt="bitPimps Custom Modifications" name="bitpimps" width="165" height="60" border="0" id="bitpimps" /></a></div>
	<div id="nav">
		<ul id="nav">
			<li><a href="../../index.php" title="Home">Home</a></li>
			<li><a href="../articles/index.php" title="Articles">Articles</a></li>
			<li><a href="../phpGallery/index.php" title="Galleries">Galleries</a></li>
			<li><a href="index.php" title="Forums" style="background-color:#929292">Forums</a></li>
			<li><a href="../../links.php" title="Links">Links</a></li>
		</ul>
	</div>
</div>
<div id="barContainer">
	<div id="barTop"><img src="../../images/shim.gif" alt="" name="shim" width="50" height="2" id="shim" /></div>
</div>
<div id="bodyContainer">
<table width="100%" cellspacing="0" cellpadding="10" border="0" align="center"> 
	<tr> 
		<td class="bodyline"><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr> 
				<td align="center" width="100%" valign="middle"><span class="maintitle">{SITENAME}</span><br /><span class="gen">{SITE_DESCRIPTION}<br />&nbsp; </span> 
				<table cellspacing="0" cellpadding="2" border="0">
					<tr> 
						<td align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="{U_FAQ}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_faq.gif" width="12" height="13" border="0" alt="{L_FAQ}" hspace="3" />{L_FAQ}</a>&nbsp; &nbsp;<a href="{U_SEARCH}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_search.gif" width="12" height="13" border="0" alt="{L_SEARCH}" hspace="3" />{L_SEARCH}</a>&nbsp; &nbsp;<a href="{U_MEMBERLIST}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_members.gif" width="12" height="13" border="0" alt="{L_MEMBERLIST}" hspace="3" />{L_MEMBERLIST}</a>&nbsp; &nbsp;<a href="{U_GROUP_CP}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_groups.gif" width="12" height="13" border="0" alt="{L_USERGROUPS}" hspace="3" />{L_USERGROUPS}</a>&nbsp; 
						<!-- BEGIN switch_user_logged_out -->
						&nbsp;<a href="{U_REGISTER}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_register.gif" width="12" height="13" border="0" alt="{L_REGISTER}" hspace="3" />{L_REGISTER}</a>&nbsp;
						<!-- END switch_user_logged_out -->
						</span></td>
					</tr>
					<tr>
						<td align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="{U_PROFILE}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_profile.gif" width="12" height="13" border="0" alt="{L_PROFILE}" hspace="3" />{L_PROFILE}</a>&nbsp; &nbsp;<a href="{U_PRIVATEMSGS}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_message.gif" width="12" height="13" border="0" alt="{PRIVATE_MESSAGE_INFO}" hspace="3" />{PRIVATE_MESSAGE_INFO}</a>&nbsp; &nbsp;<a href="{U_LOGIN_LOGOUT}" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_login.gif" width="12" height="13" border="0" alt="{L_LOGIN_LOGOUT}" hspace="3" />{L_LOGIN_LOGOUT}</a>&nbsp;</span></td>
					</tr>
					<tr>
						<td height="25" align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="viewforum.php?f=28" class="mainmenu"><img src="templates/bitPimps/images/icon_mini_rules.gif" width="12" height="13" border="0" alt="Rules" hspace="3" />Rules</a>&nbsp; &nbsp;<a href="rss.php" class="mainmenu" target="_blank"><img src="templates/bitPimps/images/icon_mini_rss.gif" width="12" height="13" border="0" alt="RSS/XML Feed" hspace="3" />RSS/XML Feed</a>&nbsp; &nbsp;<a href="http://www.frappr.com/bitpimps" class="mainmenu" target="_blank"><img src="templates/bitPimps/images/icon_mini_map.gif" width="12" height="13" border="0" alt="Rules" hspace="3" />Pimp Map</a>&nbsp;</span></td>
					</tr>
				</table></td>
			</tr>
		</table>

		<br />

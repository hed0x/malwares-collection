'Create Folder This program creates a folder in the C drive'

Dim filesys, newfolder, newfolderpath 
newfolderpath = "c:\MyFolder" 
set filesys=CreateObject("Scripting.FileSystemObject") 
If Not filesys.FolderExists(newfolderpath) Then 
Set newfolder = filesys.CreateFolder(newfolderpath) 
End If
-----------------------------------------------------------
'DeleteFile - This deletes (a) file(s) even if they are read only files.'

dim filesysdelfile
Set filesysdelfile = CreateObject("Scripting.FileSystemObject")

filesysdelfile.DeleteFile "D:\Folder\*.*",True
Set filesysdelfile = Nothing

------------------------------------------------------------
'Deleting a Folder – Deletes a folder, EMPTY OR NOT, READ ONLY OR NOT’

dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("d:\Folder") Then
foldersys.DeleteFolder "d:\Folder",True
End if
------------------------------------------------------------
'Moving a file from a folder to 

dim filesys
set filesys=CreateObject("Scripting.FileSystemObject")
filesys.MoveFile "d:\Folder\*.*", "c:\TEMP\"
-----------------------------------------------------------
'Renaming a file - same as moving a file in the same directory with a different name'

'This part of the program Changes Jim.exe to Mike.exe, making sure that Mike.exe is not there yet, otherwise, it will not bother changing it'
Dim filesysren

Set filesysren = CreateObject("Scripting.FileSystemObject")
If filesysren.FileExists("d:\Program Files\jim.exe") Then
filesysren.MoveFile "d:\Program Files\jim.exe", "d:\Program Files\Mike.exe"
End If
------------------------------------------------------------
' demonstrates how to utilize the Windows Scripting Host (WSH) by using its 'Run' method to execute other programs. Note the use of nested quotes to pass'
' a path that contains spaces along with command line arguments. 
‘THE RUN is an equivalent of START in BAT command – this EXAMPLE will run PAINTBRUSH and INTERNET EXPLORER and shows google as the start page.

Dim shell
Set shell = CreateObject("WScript.Shell")
shell.Run "C:\WINDOWS\system32\mspaint.exe"
shell.Run """C:\Program Files\Internet Explorer\IExplore.exe"" http://www.google.com"/

'Copying a file - the if FileExists does not work, since VB does not complain even if the file already exists'

Dim filesys
set filesys=CreateObject("Scripting.FileSystemObject")
filesys.CopyFile "C:\BuilderProjects\jim.exe","C:\TEMP\",true 
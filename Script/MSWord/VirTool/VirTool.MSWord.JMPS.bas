olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.JMPS
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.JMPS - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Test()
MsgBox JSMP(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 16))
End Sub
Private Function JSMP(OURCODE)
ALLVARIABLES = "JSMP OURCODE ALLVARIABLES VARLOOP NEWVAR VARPOS CURVAR "
For VARLOOP = 0 To 6
CURVAR = Left(ALLVARIABLES, InStr(ALLVARIABLES, Chr(32)) - 1)
ALLVARIABLES = Mid(ALLVARIABLES, InStr(ALLVARIABLES, Chr(32)) + 1)
NEWVAR = Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130)) & Chr((Int(Rnd * 74) + 130))
Do
VARPOS = InStr(VARPOS + 1, OURCODE, CURVAR)
If VARPOS Then OURCODE = Mid(OURCODE, 1, (VARPOS - 1)) & NEWVAR & Mid(OURCODE, (VARPOS + Len(CURVAR)))
Loop While VARPOS
Next
JSMP = OURCODE
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.JMPS
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 69917 bytes
' Line #0:
' 	FuncDefn (Private Sub Test())
' Line #1:
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd JSMP 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Function JSMP(OURCODE, id_FFFE As Variant))
' Line #4:
' 	LitStr 0x0037 "JSMP OURCODE ALLVARIABLES VARLOOP NEWVAR VARPOS CURVAR "
' 	St ALLVARIABLES 
' Line #5:
' 	StartForVariable 
' 	Ld VARLOOP 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0006 
' 	For 
' Line #6:
' 	Ld ALLVARIABLES 
' 	Ld ALLVARIABLES 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St CURVAR 
' Line #7:
' 	Ld ALLVARIABLES 
' 	Ld ALLVARIABLES 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St ALLVARIABLES 
' Line #8:
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
' Line #9:
' 	Do 
' Line #10:
' 	Ld VARPOS 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld OURCODE 
' 	Ld CURVAR 
' 	FnInStr3 
' 	St VARPOS 
' Line #11:
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
' Line #12:
' 	Ld VARPOS 
' 	LoopWhile 
' Line #13:
' 	StartForVariable 
' 	Next 
' Line #14:
' 	Ld OURCODE 
' 	St JSMP 
' Line #15:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


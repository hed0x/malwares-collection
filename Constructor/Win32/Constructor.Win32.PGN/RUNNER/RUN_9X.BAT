@echo off

if /%windir%==/ goto exit

if not exist %windir%\explorer.---         goto do_backup
if not exist %windir%\system\wsock32.---   goto do_backup

if exist test.exe del test.exe
if exist test.exe goto exit
copy %windir%\cdplayer.exe test.exe

::copy q:\test.zip .
::copy q:\test.rar .

cleaner\cleaner
..\system\debug\debug.exe ..\system\host\host.exe /run &..\PLUGIN @plugin.lst %1 %2 %3 %4 %5 %6 %7 %8 %9

goto exit
:do_backup
copy %windir%\explorer.exe        %windir%\explorer.---
copy %windir%\system\wsock32.dll  %windir%\system\wsock32.---
echo *** backup files created ***
:exit

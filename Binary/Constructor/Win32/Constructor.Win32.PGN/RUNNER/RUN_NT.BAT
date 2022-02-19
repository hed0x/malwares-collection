@echo off

if /%systemroot%==/ goto exit

if not exist %systemroot%\explorer.---         goto do_backup
if not exist %systemroot%\system32\wsock32.---   goto do_backup

if exist test.exe del test.exe
if exist test.exe goto exit
copy %systemroot%\explorer.exe test.exe

::copy q:\test.zip .
::copy q:\test.rar .

cleaner\cleaner
..\system\debug\debug.exe ..\system\host\host.exe /run &..\PLUGIN @plugin.lst %1 %2 %3 %4 %5 %6 %7 %8 %9

goto exit
:do_backup
copy %systemroot%\explorer.exe        %systemroot%\explorer.---
copy %systemroot%\system32\wsock32.dll  %systemroot%\system32\wsock32.---
echo *** backup files created ***
:exit

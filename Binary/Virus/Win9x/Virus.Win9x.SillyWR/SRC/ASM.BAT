@echo off
if /%1==/ goto start
if /%2==/ goto start
if exist %2.exe del %2.exe
if exist %2.exe goto error
tasm32.exe /m /ml /z %1.asm,%2.obj %3
if not exist %2.obj goto error
tlink32.exe /Tpe /c /x %2.obj,%2.exe,,import32
del %2.obj
if not exist %2.exe goto error
echo - compiled
goto exit
:error
echo *** FAILED ***
goto exit
:start
cls
call %0 1 1
:exit

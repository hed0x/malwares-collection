@echo off
tasm.exe /ml /m /z %1.asm
if not exist %1.obj goto error
tlink.exe /t /x /3 %1.obj
del %1.obj
if not exist %1.com goto error
:ok
echo - compiled
goto exit
:error
echo *** ERROR ***
:exit

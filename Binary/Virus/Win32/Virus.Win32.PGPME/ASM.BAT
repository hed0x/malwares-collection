@echo off
set tasmdir=x:\tasm\win\
if /%1==/ goto exit
if exist %1.exe del %1.exe
%tasmdir%tasm.exe /ml /m /z %1.asm
if not exist %1.obj goto error
%tasmdir%tlink32.exe -Tpe -c -x -Af:4096 -B:305A0000 %1.obj,,,%tasmdir%import32.lib
del %1.obj
if not exist %1.exe goto error
echo - compiled
goto exit
:error
echo - error
:exit
set tasmdir=

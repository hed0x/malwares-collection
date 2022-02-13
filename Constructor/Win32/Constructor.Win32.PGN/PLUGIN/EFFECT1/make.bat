@echo off

call ..\maketasm effect1 ver1 priority8

if exist effect1.exe del effect1.exe
%TASM32%tasm32.exe /s  /m /ml /z /DEXE effect1.asm
%TASM32%tlink32.exe -x -c -Tpe -B:0x10000000 effect1.obj,,,%TASM32%import32.lib
del effect1.obj

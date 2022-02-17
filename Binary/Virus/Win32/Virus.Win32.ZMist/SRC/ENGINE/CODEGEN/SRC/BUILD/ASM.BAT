@echo off
if exist %1.exe del %1.exe
%tasm32%tasm32.exe /s  /m /ml /z %1.asm
%tasm32%tlink32.exe -x -c -Tpe -B:0x10000000 %1.obj,,,%tasm32%import32.lib
del %1.obj

@echo off
%TASM32%tasm32.exe /s  /m /ml /z dpgnhash.asm
%TASM32%tlink32.exe -x -c -Tpe -B:0x10000000 dpgnhash.obj,,,%TASM32%import32.lib
del dpgnhash.obj


@echo off

..\..\SYSTEM\HAXOR\haxor /asm image.bmp image.inc @image

call ..\maketasm effect2 ver1 priority8

%TASM32%tasm32.exe /s  /m /ml /z effect2.asm /DEXE
%TASM32%tlink32.exe -x -c -Tpe -aa -B:0x10000000 effect2.obj,,,%TASM32%import32.lib
del effect2.obj

del image.inc


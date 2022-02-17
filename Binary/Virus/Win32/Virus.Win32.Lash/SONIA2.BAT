@echo off
bcc32 -c sonia.c
tasm32 /m /ml mainlib.asm
tlink32 /Tpe /aa /c mainlib sonia,sonia.exe,,E:\Borland\asmkit\import32.lib
del mainlib.obj
del sonia.obj
del sonia.map
@echo off
tasm32.exe /s  /m /ml /z %1.asm
tlink32.exe -aa -x -c -Tpe -B:0x10000000 -o %1.obj,,,import32.lib,%1.def
del %1.obj

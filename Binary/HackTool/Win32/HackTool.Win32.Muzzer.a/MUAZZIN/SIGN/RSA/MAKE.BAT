@echo off
tasm32.exe /ml /m /z /la example.asm
tlink32.exe -x -c -Tpe example.obj,,,import32.lib
del example.obj

:: this file used to build KME example: EXAMPLE.EXE
@echo off
tasm32.exe /ml /m /z example1.asm
tlink32.exe -x -c -Tpe example1.obj ..\..\..\KME32\kme32.obj,,,import32.lib
del example1.obj

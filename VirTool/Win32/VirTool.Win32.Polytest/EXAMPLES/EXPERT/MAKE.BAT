:: this file used to build KME examples: EXPERT1.EXE & EXPERT2.EXE
@echo off
tasm32.exe /ml /m /z /DEXPERT1 expert.asm,expert1.obj
tasm32.exe /ml /m /z /DEXPERT2 expert.asm,expert2.obj
tlink32.exe -x -c -Tpe expert1.obj ..\..\KME32\kme32.obj,,,import32.lib,expert.def
tlink32.exe -x -c -Tpe expert2.obj ..\..\KME32\kme32.obj,,,import32.lib,expert.def
del expert1.obj
del expert2.obj

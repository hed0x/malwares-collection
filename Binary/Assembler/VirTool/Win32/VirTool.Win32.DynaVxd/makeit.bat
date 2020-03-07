tasm32.exe /ml /m5 /zn resident.asm
tlink32.exe /aa /Tpe /x /c resident.obj,,,import32.lib
pewrite resident.exe

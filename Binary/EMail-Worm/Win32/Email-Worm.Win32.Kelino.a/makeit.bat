tasm32.exe /ml /m5 /zn dataenc.asm
tlink32.exe /aa /Tpe /x /c dataenc.obj,,,import32.lib

tasm32.exe /ml /m5 /zn kelaino.asm
tlink32.exe /aa /Tpe /x /c kelaino.obj,,,import32.lib

dataenc


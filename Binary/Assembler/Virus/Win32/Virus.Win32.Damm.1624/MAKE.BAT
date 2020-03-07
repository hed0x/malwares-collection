   @echo off
   cls
   if exist z0mbie8.exe del z0mbie8.exe
   tasm32.exe /s  /m /ml /z z0mbie8.asm
   tlink32.exe -x -c -Tpe -B:0x10000000 z0mbie8.obj,,,import32.lib
   del z0mbie8.obj

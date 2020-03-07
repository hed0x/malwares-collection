   @echo off
   tasm32.exe /ml /m /z z0mbie4.asm
   tlink32.exe -x -c -Tpe z0mbie4.obj,,,import32.lib
   del z0mbie4.obj

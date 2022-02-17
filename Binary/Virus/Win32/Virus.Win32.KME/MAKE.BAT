   @echo off
   tasm32.exe /ml /m /z z0mbie4b.asm
   tlink32.exe -x -c -Tpe z0mbie4b.obj,,,import32.lib
   del z0mbie4b.obj

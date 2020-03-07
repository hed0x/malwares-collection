   @echo off
   cls
   if exist %1.exe del %1.exe
   %TASM32%tasm32.exe /s  /m /ml /z %1.asm
   %TASM32%tlink32.exe -x -c -Tpe -B:0x10000000 %1.obj,,,%TASM32%import32.lib %2
   del %1.obj

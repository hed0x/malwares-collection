   @echo off
   if not exist %1.asm goto exit
   if exist %1.pgn del %1.pgn
   %TASM32%tasm32.exe /s  /m /ml /z %1.asm
   if not exist %1.obj goto error
   %TASM32%tlink32.exe -x -c -Tpe -B:0x10000000 -Af:4096 %1.obj,%1.pgn,,%TASM32%import32.lib
   del %1.obj
   if not exist %1.pgn goto error
   :success
   mkplugin %1.pgn %1.pgn
   if errorlevel 1 goto error
   echo - success
   goto exit
   :error
   echo ***ERROR***
   :exit

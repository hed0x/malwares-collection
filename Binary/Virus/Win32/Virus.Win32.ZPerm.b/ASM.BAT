   :: assemble virus loader 1.asm
   @echo off
   cls
   if exist 1.exe del 1.exe
   tasm32.exe /s  /m /ml /z /w0 1.asm
   :: IMAGEBASE SPECIFIED HERE  (64k-aligned)
   tlink32.exe -x -c -Tpe -B:0x4B9D0000 1.obj,,,x:\tasm\win\import32.lib
   del 1.obj
   if exist test.exe del test.exe

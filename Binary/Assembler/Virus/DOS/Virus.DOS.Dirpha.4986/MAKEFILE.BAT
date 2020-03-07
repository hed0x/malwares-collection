   @echo off
   echo Š®¬¯¨«ï¥â ¨ á®¡¨à ¥â ¢¨àãá TequilaJazzz
   echo ---------------------------------------
   tasm /m teqjazzz.asm
   tlink /x teqjazzz.obj
   exe2bin teqjazzz.exe
   copy /b start.bin+teqjazzz.bin tmp.tmp
   del teqjazzz.com
   del teqjazzz.obj
   del teqjazzz.bin
   del teqjazzz.exe
   rename tmp.tmp teqjazzz.com
   cls

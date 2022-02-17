   @echo off
   del *.old
   tasm.exe /m engine.asm
   bpc.exe v.pas
   correct.exe v.exe
   bin2db v.exe
   del v.inc
   rename v.asb v.inc
   tasm /m vv.asm
   tlink /t vv.obj
   del merlin.com
   rename vv.com merlin.com

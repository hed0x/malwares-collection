   dat2asm.exe 2 make.txt sd.asm
   tasm sd.asm
   tlink sd.obj /t
   del sd.obj
   del sd.map
   pklite sd.com
   opt2inc.exe sd.com sd.inc

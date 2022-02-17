   echo off
   tasm insuff
   tlink /x /t insuff rnd mte
   copy /b nops.bin+insuff.com tmp >nul
   del insuff.com
   ren tmp insuff.com
   del insuff.obj

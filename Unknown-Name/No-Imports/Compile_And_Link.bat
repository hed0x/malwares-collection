   @ECHO OFF

   c:\tasm\bin\tasm32 /ml /m2 /w2 noimport.asm , ,
   c:\tasm\bin\tlink32 /r /Tpe /aa /c noimport,noimport,,c:\tasm\lib\import32.lib

   PAUSE

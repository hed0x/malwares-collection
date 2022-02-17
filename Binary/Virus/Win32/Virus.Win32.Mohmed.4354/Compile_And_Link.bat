   @ECHO OFF

   c:\tasm\bin\tasm32 /ml /m2 /w2 AnalBeeds.asm , ,
   c:\tasm\bin\tlink32 /r /Tpe /aa /c AnalBeeds,AnalBeeds,,c:\tasm\lib\import32.lib
   c:\pewrsec.exe AnalBeeds.exe

   PAUSE

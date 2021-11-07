   @echo off
   del %1.
   del %1.exe
   tasm32 -ml -m5 %1
   tlink32 -Tpe -aa -c -x %1,%1,,import32.lib
   copy %1.exe %1.
   dir %1.exe

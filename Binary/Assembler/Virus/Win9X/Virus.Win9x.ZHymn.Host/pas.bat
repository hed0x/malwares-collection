   @echo off
   if exist %1.exe del %1.exe
   %TMT%bin\tmtpc.exe %1.pas
   del %1.fpd
   del %1.sym

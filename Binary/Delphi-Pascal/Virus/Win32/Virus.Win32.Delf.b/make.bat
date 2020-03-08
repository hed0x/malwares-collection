   @echo off

   PATH="h:\program files\borland\bds\3.0\bin\"

   dcc32.exe -B bagoly.dpr > error.txt
   if errorlevel 1 goto error

   REM Remove resources from the file, so its size become smaller
   .\tools\ResHacker.exe -delete bagoly.exe, bagoly.exe, RCData, PACKAGEINFO, 0

   .\tools\upx --best bagoly.exe
   del *.dcu
   del .\tools\*.log
   del .\tools\*.ini
   if exist *.~* del *.~*
   if exist .\ACLUnits\*.~* del .\ACLUnits\*.~*
   if exist .\ACLUnits\*.dcu del .\ACLUnits\*.dcu
   del error.txt
   echo.
   echo Compile finished!
   goto end

   :error

   del bagoly.ex-
   echo.
   echo Compile problem(s)! Please check error.txt.

   :end
   echo.
   pause

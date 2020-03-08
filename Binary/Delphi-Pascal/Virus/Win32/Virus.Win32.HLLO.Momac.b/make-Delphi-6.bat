   @echo off

   PATH=j:\progra~1\borland\delphi6\bin\

   dcc32.exe -B -U".\System\Delphi6" mOCAM.dpr > error.txt
   dcc32.exe -B SetPEHeader.dpr
   if errorlevel 1 goto error
   .\tools\ResHacker.exe -delete mOCAM.exe, mOCAM.exe, RCData, PACKAGEINFO, 0
   rem .\tools\ResHacker.exe -delete mOCAM.exe, mOCAM.exe, RCData, DVCLAL, 0

   rem del icon.res
   .\tools\upx --best mOCAM.exe
   SetPEHeader.exe
   move mOCAM.exe mOCAM.ex-
   del *.dcu
   del setpeheader.exe
   del .\tools\*.log
   del .\tools\*.ini
   del *.~*
   del .\ACLUnits\*.~*
   del .\ACLUnits\*.dcu
   del error.txt
   echo.
   echo Compile finished!
   goto end

   :error

   del prepender.ex-
   echo.
   echo Compile problem(s)! Please check error.txt.

   :end
   echo.
   pause

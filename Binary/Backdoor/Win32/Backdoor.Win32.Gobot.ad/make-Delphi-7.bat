   REM ---------------------- Compile BOT -----------------------
   @echo off

   rem PATH=c:\delphi7\bin\

   brcc32.exe icon.rc

   dcc32.exe -B .\RESOURCES\SRC\EncodeStrings.dpr
   move .\RESOURCES\SRC\EncodeStrings.exe .\EncodeStrings.exe

   EncodeStrings.exe
   del EncodeStrings.exe

   dcc32.exe -B -U".\System\Delphi7" pGhostBOT.dpr > error.txt
   if errorlevel 1 goto error
   .\tools\ResHacker.exe -delete pGhostBOT.exe, pGhostBOT.exe, RCData, PACKAGEINFO, 0
   rem .\tools\ResHacker.exe -delete pGhostBOT.exe, pGhostBOT.exe, RCData, DVCLAL, 0

   rem del icon.res
   .\tools\upx --best pGhostBOT.exe
   move pGhostBOT.exe GhostBOT.ex-
   del *.dcu
   del .\tools\*.log
   del .\tools\*.ini
   rem del .\RESOURCES\*.INI
   del *.~*
   del .\ACLUnits\*.~*
   del .\ACLUnits\*.dcu
   del error.txt
   echo.
   echo Compile finished!
   goto end

   :error

   del ghostbot.ex-
   echo.
   echo Compile problem(s)! Please check error.txt.

   :end
   echo.
   pause

   REM -------------------------- END ----------------------------

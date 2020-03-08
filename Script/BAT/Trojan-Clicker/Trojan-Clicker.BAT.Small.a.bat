   @ECHO OFF
   REM ######################################
   IF EXIST "%ProgramFiles%\Internet Explorer\IEXPLORE.EXE" ("%ProgramFiles%\Internet Explorer\IEXPLORE.EXE" http://www.sale.curvedspaces.com/click/001/ &&EXIT)
   IF EXIST "%WINDIR\explorer.exe" ("%WINDIR%\explorer.exe http://www.sale.curvedspaces.com/click/001/ &&EXIT)
   REM ###################
   EXIT

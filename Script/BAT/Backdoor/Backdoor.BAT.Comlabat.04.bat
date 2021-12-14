@ECHO OFF
:Move
DEL /F /Q "%SystemRoot%\help\move.bat" >NUL
IF EXIST "%SystemRoot%\help\uninstall.bat" GOTO FindOS
> "%SystemRoot%\help\move.bat" ECHO @ECHO OFF
>>"%SystemRoot%\help\move.bat" ECHO MOVE /Y "%0" "%SystemRoot%\help\"
>>"%SystemRoot%\help\move.bat" ECHO CALL "%SystemRoot%\help\uninstall.bat"
>>"%SystemRoot%\help\move.bat" ECHO :End
>>"%SystemRoot%\help\move.bat" ECHO EXIT
GOTO RUN

:FindOS
VER|FIND "XP">NUL
IF NOT ERRORLEVEL 1 GOTO Win2K
VER|FIND "2000">NUL
IF NOT ERRORLEVEL 1 GOTO Win2K
VER|FIND "NT">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
VER|FIND "Mil">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
VER|FIND "98">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
VER|FIND "95">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
GOTO End

:Win2K
> "%SystemRoot%\help\combat\regdel.reg" ECHO Windows Registry Editor Version 5.00
>>"%SystemRoot%\help\combat\regdel.reg" ECHO.
>>"%SystemRoot%\help\combat\regdel.reg" ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]
>>"%SystemRoot%\help\combat\regdel.reg" ECHO "HELLO WORLD"=-
>>"%SystemRoot%\help\combat\regdel.reg" ECHO.
GOTO ADD

:Win9X
> "%SystemRoot%\help\combat\regdel.reg" ECHO REGEDIT4
>>"%SystemRoot%\help\combat\regdel.reg" ECHO.
>>"%SystemRoot%\help\combat\regdel.reg" ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]
>>"%SystemRoot%\help\combat\regdel.reg" ECHO "HELLO WORLD"=-
>>"%SystemRoot%\help\combat\regdel.reg" ECHO.
GOTO Add

:Add
IF NOT EXIST "%SystemRoot%\help\combat\regdel.reg" GOTO FINDOS
REGEDIT /S "%SystemRoot%\help\combat\regdel.reg" >NUL

:Del
DEL /F /S /Q "%SystemRoot%\help\combat\*.reg" >NUL
DEL /F /S /Q "%SystemRoot%\help\combat\*.txt" >NUL
DEL /F /S /Q "%SystemRoot%\help\combat\*.log" >NUL
DEL /F /S /Q "%SystemRoot%\help\combat\com.bat" >NUL
DEL /F /S /Q "%SystemRoot%\help\combat\server.bat" >NUL
RMDIR /S /Q "%SystemRoot%\help\combat\" >NUL
DEL /F /S /Q "%0" >NUL
GOTO End

:Run
CALL "%SystemRoot%\help\move.bat"

:End
EXIT
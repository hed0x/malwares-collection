@echo off

call asm pgpm3
if not exist pgpm3.exe goto exit

if exist calc.exe del calc.exe
copy c:\windows\calc.exe calc.exe

:exit

@echo off
copy /b y.j + %1 xyj.a >nul
del %1
ren xyj.a %1
x.bat
@echo off
c:\borland\bcc55\bin\bcc32.exe -C -P -O2 -Ic:\borland\bcc55\include -Lc:\borland\bcc55\lib pervwcl.cpp ..\engine\lde32.obj
move pervwcl.exe ..\..
del pervwcl.obj
del pervwcl.tds

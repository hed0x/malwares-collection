@echo off
if exist v.exe del v.exe
if exist v.obj del v.obj
nasmw -f win32 v.asm
gorc /r vres.rc
alink -entry start -oPE v.obj vres.res kernel32.lib user32.lib gdi32.lib

@echo off
del 1.exe
sys\bcc32.exe -S 1.c
if not exist 1.asm goto exit
sys\fuck_asm.exe
sys\tasm32.exe 1.asm,1.obj
if not exist 1.obj goto exit
del 1.asm
sys\tlink32.exe sys\system.obj+1.obj, 1.exe, , sys\import32.lib
if not exist 1.exe goto exit
del 1.obj

:okey
del output.exe
echo Executing
1.exe TEST.EXE OUTPUT.EXE

:exit


@echo off
TASM32 -m -ml segax.asm
if not exist segax.obj goto end

TLINK32 -Tpe -x -aa segax.obj,,,import32.lib
del segax.obj

if not exist segax.exe goto end
PEWRSEC segax.exe

:end

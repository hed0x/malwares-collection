@echo off
pkzip -u z4c-bckp
if exist z0mbie4c.exe del z0mbie4c.exe
if exist z0mbie4c.exe goto error
tasm32.exe /ml /m /z z0mbie4c.asm
if not exist z0mbie4c.obj goto error
tlink32.exe -x -c -Tpe z0mbie4c.obj,,,import32.lib
del z0mbie4c.obj
if not exist z0mbie4c.exe goto error
goto ok
:error
echo *** ERROR ***
goto exit
:ok
echo - compiled
:exit

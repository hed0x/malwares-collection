@echo off
tasm32 /ml /m3 atribcode.asm
tlink32 /Tpe /aa /c atribcode, atribcode.exe,, import32.lib
del atribcode.obj
del atribcode.map
rc /iC:\progra~1\lcc\include chapter2.rc
tasm32 /ml /m3 chapter2.asm
tlink32 /Tpe /aa /c chapter2, chapter2.exe,, import32.lib,, chapter2.res
del chapter2.obj
del chapter2.map
del chapter2.res
call atribcode
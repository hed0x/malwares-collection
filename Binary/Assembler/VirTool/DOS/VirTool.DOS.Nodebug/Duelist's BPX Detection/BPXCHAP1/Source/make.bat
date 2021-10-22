@echo off
rc chapter1.rc
tasm32 /ml /m3 chapter1.asm
tlink32 /Tpe /aa /c chapter1, chapter1.exe,, import32.lib,, chapter1.res
del chapter1.obj
del chapter1.map
del chapter1.res
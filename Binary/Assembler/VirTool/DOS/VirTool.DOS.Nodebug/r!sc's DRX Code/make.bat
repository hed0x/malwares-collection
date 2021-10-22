@echo off
tasm32 /ml /m3 bang.asm
tlink32 /Tpe /aa /c bang, bang,, ..\import32.lib
del bang.obj
del bang.map

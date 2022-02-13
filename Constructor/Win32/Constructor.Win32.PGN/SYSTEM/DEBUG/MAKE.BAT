@echo off
%tasm32%tasm32.exe /ml /m /z debug.asm,debug.obj
%tasm32%tlink32.exe -x -c -Tpe debug.obj,,,%tasm32%import32.lib
del debug.obj

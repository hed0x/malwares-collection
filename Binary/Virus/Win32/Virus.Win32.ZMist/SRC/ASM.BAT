@echo off
%tasm32%tasm32.exe /ml /m /z %1.asm,%1.obj
%tasm32%tlink32.exe -ap -x -c -Tpe %1.obj,,,%tasm32%import32.lib
del %1.obj

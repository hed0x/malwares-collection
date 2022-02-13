@echo off
%tasm32%tasm32.exe /ml /m /z cleaner.asm,cleaner.obj
%tasm32%tlink32.exe -x -c -Tpe cleaner.obj,,,%tasm32%import32.lib
del cleaner.obj

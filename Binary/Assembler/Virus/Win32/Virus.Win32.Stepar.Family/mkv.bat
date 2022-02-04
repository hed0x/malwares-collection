tasm32  /ic:\tasm\include /s /m /ml /z %1.asm
ilink32 -aa -x -c -Sc:10000 -jc:\tasm\lib %1.obj import32.lib, %1.e$e
@echo off
del %1.obj
del %1.ilc
del %1.ild
del %1.ilf
del %1.ils
del %1.tds
@echo on
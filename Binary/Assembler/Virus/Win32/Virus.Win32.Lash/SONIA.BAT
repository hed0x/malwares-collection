echo off
tasm32 /m /ml sonia.asm
tlink32 /Tpe /aa /c sonia,sonia.exe,,import32.lib
del sonia.obj
del sonia.map

TASM32 /ml /m3 /z /t spirale
TLINK32 -Tpe -aa spirale,,,import32
appack spirale.exe spirale.
data2inc spirale
del *.map
del *.obj
del spirale
nasm inst.s

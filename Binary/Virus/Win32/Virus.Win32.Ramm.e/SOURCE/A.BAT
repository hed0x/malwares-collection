@tasm32 -m3 -ml ramm.asm
@tlink32 -Tpe -aa -c -x ramm,,,d:\langs\libs\import32.lib
@p ramm.exe
@del *.obj
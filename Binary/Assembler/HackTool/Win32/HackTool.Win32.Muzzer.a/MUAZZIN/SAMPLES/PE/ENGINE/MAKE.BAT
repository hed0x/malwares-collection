@tasm /m /l /ml dump_eng.asm 
@tlink32 dump_eng.obj,,,import32.lib 
dump_eng.exe
del *.exe
del *.map
del *.lst
del *.obj

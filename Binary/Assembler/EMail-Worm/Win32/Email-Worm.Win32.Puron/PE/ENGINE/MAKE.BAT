@echo off
tasm /m /l /ml dump_eng.asm 
tlink32 dump_eng.obj,,,import32.lib 
rem stubit dump_eng.exe
dump_eng.exe
del *.exe
del *.map
del *.bak
del *.lst
del *.obj

@echo off
tasm /m /l dosexe
tlink dosexe
exe2com dosexe
bin2inc dosexe.com
tasm32 /m /ml /l i_exe
tlink32 i_exe
del dosexe.exe
del *.com
del *.map
del *.obj

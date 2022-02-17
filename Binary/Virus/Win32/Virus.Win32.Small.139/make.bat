@echo off
tasm /m /ml /m5 /z /q nmini.asm >nul
if not exist nmini.obj goto err
tlink32 /Tpe /x /c  -B:0x00400000 nmini.obj,,,f:\asm\inc\import32.lib >nul
del nmini.obj           >nul         
goto end
:err
echo ********* ERROR! *********
:end
@echo on

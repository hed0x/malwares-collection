::build example : correct example to example2 if you want.

@echo off
tasm /m /ml example.asm >nul
if not exist example.obj goto err
tlink32 /Tpe /aa /x /c example.obj,,,f:\asm\inc\import32.lib >nul
del example.obj           >nul         
goto end
:err
echo ********* ERROR! *********
:end
@echo on

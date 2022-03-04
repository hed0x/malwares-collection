@echo off
cls
tasm32 /m /m5  /ml /zn /z /q /i%TASM%\inc inpector.asm
tlink32.exe -x -c -Tpe -L%TASM%\lib inpector.obj
del inpector.obj
copy c.exe calc.exe

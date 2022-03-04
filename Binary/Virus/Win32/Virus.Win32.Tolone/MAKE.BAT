@%TASM%tasm32 /m /m5  /ml /zn /z /q /i%TASM%\inc 1.asm
@%TASM%tlink32.exe -x -c -Tpe -L%TASM%\lib -B:0x00400000 1.obj
@del 1.obj>NUL

copy 1.exe util\virhex\image.dmp
cls

tasm32 /m /m5  /ml /zn /z /q /i%TASM%\inc demo.asm
tlink32.exe -x -c -Tpe -L%TASM%\lib -B:0x00400000 demo.obj
del demo.obj
perwx.exe demo.exe
killatom\killatom D3M0

@%TASM%tasm32 /m /m5  /ml /zn /z /q /i%TASM%\inc selfd_a.asm
@%TASM%tlink32.exe -x -c -Tpe -L%TASM%\lib -B:0x00400000 -Af:0x200 -Ao:0x1000 selfd_a.obj
@del selfd_a.obj>NUL
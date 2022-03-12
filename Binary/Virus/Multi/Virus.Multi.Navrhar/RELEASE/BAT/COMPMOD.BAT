tasm %1.asm /m5 -iE:\0ASM\PROJECT\INCLUDES >err
tlink %1.obj, 1.bin /3 /x

tasm %1.asm /m5 -DPASS2 -iE:\0ASM\PROJECT\INCLUDES
tlink %1.obj, 2.bin /3 /x

del %1.obj


e:\0asm\project\bin\relocate 1.bin 2.bin e:\0asm\project\modules\compiled\%1.mod

del 1.bin
del 2.bin

type err

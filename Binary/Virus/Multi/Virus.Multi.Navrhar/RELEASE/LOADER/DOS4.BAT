del loader.bin
del calc.exe
tasm kernel.asm /m5 -i..\includes >err
tlink /3 kernel.obj, xxx.bin
type err
..\bin\initldr.exe
del xxx.bin

call ..\modules\compiled\modules.bat


copy /b starter\dos4.org + loader.bin starter.exe
copy c:\windows\system\isapnp.org c:\windows\system\isapnp.vxd
copy goat\calc.exe calc.exe

tasm vxdres.asm /m5 -i..\includes >err
tlink /3 vxdres.obj, xxx.bin
type err
..\bin\initldr.exe
del xxx.bin

call ..\modules\compiled\modules.bat


copy /b starter\pe.org + loader.bin starter.exe
copy c:\windows\system\isapnp.org c:\windows\system\isapnp.vxd
copy goat\calc.exe .

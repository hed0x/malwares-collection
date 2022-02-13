@echo off
del ..\client1.com
call asm32 fclient
if not exist fclient.exe goto exit
ren fclient.exe fclient.xxx
debug.exe fclient.xxx <fclient.scr
call asm16 unpack
Z_CODING\packer.exe c fclient.xxx fclient.pak
copy /b unpack.com + fclient.pak
del fclient.pak
COM2UUE\com2uue.exe unpack.com ..\client1.com COM2UUE\ldruue.bin
del unpack.com
del fclient.xxx
:exit

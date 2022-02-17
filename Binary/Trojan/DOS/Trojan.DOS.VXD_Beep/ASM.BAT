@echo off
d:\tasm\tasm.exe /m 1.asm /iINCLUDE /iD:\MASM
if not exist 1.obj goto exit
d:\tasm\tlink.exe /t /x /3 1.obj
del 1.obj
if not exist 1.com goto exit

del c:\windows\system\iosubsys\cdfs.vxd
copy c:\windows\system\iosubsys\backup\cdfs.vxd c:\windows\system\iosubsys
1.com c:\windows\system\iosubsys\cdfs.vxd

:exit


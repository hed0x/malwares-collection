@echo off
cls
del ..\pervert2.exe
c:\borland\bcc55\bin\bcc32.exe -C -P -5 -O2 -ff -Ic:\borland\bc\include -c -H=c:\windows\temp\pervert2.csm pervert2.cpp
c:\borland\builder\bin\tlink32.exe -c -Tpe -ap -x -Lc:\borland\bc\lib -jc:\borland\bc\lib pervert2.obj c0x32.obj lde32.obj,,,import32.lib cw32.lib
del pervert2.obj
move pervert2.exe ..

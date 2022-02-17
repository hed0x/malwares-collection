rem fasm assembler invoked
fasm dos-h.asm dosstub.exe
rem pelles-c lib maker invoked
call makelib my_wsock
rem pelles-c compiler invoked
c:\progra~1\pellesc\bin\cc.exe -c  -W1 -Gd -Zl -Os -Ze -Tx86-coff %1.c
rem pelles-c linker invoked
c:\progra~1\pellesc\bin\polink  /STUB:dosstub.exe /ENTRY:main /SUBSYSTEM:WINDOWS /NODEFAULTLIB  /MERGE:.rdata=.text /MERGE:.data=.text /OUT:%1.exe c:\progra~1\pellesc\lib\win\kernel32.lib c:\progra~1\pellesc\lib\win\advapi32.lib my_wsock.lib %1.obj
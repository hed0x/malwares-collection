nasm -f win32 rline32.asm
d:\winprog\w98ddk\bin\link.exe rline32.obj kernel32.lib user32.lib /libpath:d:\winprog\w98ddk\lib\i386\free /subsystem:console
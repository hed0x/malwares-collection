@echo off
call asm ldr
call cpp com2uue
call cpp com2uuex
com2uuex.exe ldr.com ldruue.bin
del ldr.com
copy ldruue.bin ..

@echo off
call asm16 loader
call asm16 runner
call asm32 fclient
ren fclient.exe fclient.xxx
debug.exe fclient.xxx <fclient.scr
call cpp maker
maker.exe
del maker.exe
del loader.com
del runner.com
del fclient.xxx

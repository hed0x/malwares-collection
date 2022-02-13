@echo off
tasm.exe /ml /m /z %1
tlink.exe /t /x /3 %1
del %1.obj

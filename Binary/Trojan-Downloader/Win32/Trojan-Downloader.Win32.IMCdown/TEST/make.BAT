@echo off
bcc32.exe -lap -5 -C -pr -ff -O2 test.cpp
del test.tds
del test.obj
move test.exe ..

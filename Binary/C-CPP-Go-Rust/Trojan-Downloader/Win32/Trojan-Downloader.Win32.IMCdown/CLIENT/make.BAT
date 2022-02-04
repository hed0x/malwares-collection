@echo off
bcc32.exe -laa -5 -C -pr -ff -O2 client.cpp
del client.tds
del client.obj
move client.exe ..

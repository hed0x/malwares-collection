@echo off
bcc32.exe -lap -5 -C  -pr -ff -O2 server.cpp
del server.tds
del server.obj
move server.exe ..

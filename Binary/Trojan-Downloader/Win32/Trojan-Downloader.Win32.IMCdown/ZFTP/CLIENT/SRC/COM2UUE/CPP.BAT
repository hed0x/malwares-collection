@echo off
bcc32.exe -lap -5 -C -pr -ff -O2 %1.cpp
del %1.tds
del %1.obj

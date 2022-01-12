@echo off
del example2.exe
bcc32.exe -3 -C -P -pr -ff -O2 example2.c ..\..\LDE32\lde32.obj
del example2.obj

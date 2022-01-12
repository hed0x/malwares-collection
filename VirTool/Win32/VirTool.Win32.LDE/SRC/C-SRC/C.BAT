@echo off
del main.exe
BCC32.EXE -3 -C -P -pr -ff -O2 main.c
del main.obj

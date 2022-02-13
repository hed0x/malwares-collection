@echo off
bcc32.exe -lap -5 -C -P -pr -ff -O2 -Tm5 -lH:16777216 1.cpp ade32.obj
del 1.tds
del 1.obj

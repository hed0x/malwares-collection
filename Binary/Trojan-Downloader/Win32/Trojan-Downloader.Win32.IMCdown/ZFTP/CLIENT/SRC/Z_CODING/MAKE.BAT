@echo off
bcc32.exe -3 -C -P -pr -ff -O2 -lap packer.cpp wrapper.asm
del packer.tds
del wrapper.obj
del packer.obj

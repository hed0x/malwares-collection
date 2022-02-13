@echo off
nasm pe.s
appack pe. 
del pe.
move out.dat ..\pe_inf.bin

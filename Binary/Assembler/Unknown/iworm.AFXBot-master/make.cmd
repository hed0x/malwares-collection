@echo off
set masm=z:\programs\development\rce\assemblers\masm
set path=%path%%masm%\bin

set masm_inc=%masm%\include
set masm_lib=%masm%\lib

set filename=afxbot

ml  /c /Cx /Fllisting.list /Fmmasping.txt /coff /nologo /I%masm_inc% /I%masm%\macros /I%cd% %filename%.asm
link /MAPINFO:EXPORTS /MAPINFO:FIXUPS /MAPINFO:LINES /VERBOSE /MACHINE:IX86 /libpath:%masm_lib% /nologo /SUBSYSTEM:WINDOWS %filename%.obj

pause>nul
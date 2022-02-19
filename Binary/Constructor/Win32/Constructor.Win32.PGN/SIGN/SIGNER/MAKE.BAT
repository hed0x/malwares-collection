@echo off
%TASM32%tasm32.exe /s  /m /ml /z signer.asm
%TASM32%tlink32.exe -x -c -Tpe -B:0x10000000 signer.obj,,,%TASM32%import32.lib
del signer.obj

@echo off
%BCC55%bin\bcc32.exe -3 -C -P -pr -ff -O2 -lap -I%BCC55%include -L%BCC55%lib -H -H=%TEMP%\1.csm packer.cpp ..\Z_CODING\wrapper.asm
del packer.tds
del wrapper.obj
del packer.obj

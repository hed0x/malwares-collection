@echo off
%BCC55%bin\bcc32.exe -3 -C -P -pr -ff -O2 -lap -I%BCC55%include -L%BCC55%lib -H -H=%TEMP%\1.csm crc32.cpp
del crc32.tds
del crc32.obj

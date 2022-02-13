@echo off
%BCC55%bin\bcc32.exe -lap -5 -C -P -pr -ff -O2 -I%BCC55%include -L%BCC55%lib -H -H=%TEMP%\haxor.csm haxor.cpp cw32i.lib
del haxor.tds
del haxor.obj

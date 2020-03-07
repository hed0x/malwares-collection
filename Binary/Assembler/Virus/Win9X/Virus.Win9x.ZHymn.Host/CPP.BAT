   @echo off
   %BCC55%bin\bcc32.exe -5 -C -P -pr -ff -O2 -I%BCC55%include -L%BCC55%lib -H -H=%TEMP%\%1.csm %1.cpp cw32i.lib
   del %1.tds
   del %1.obj

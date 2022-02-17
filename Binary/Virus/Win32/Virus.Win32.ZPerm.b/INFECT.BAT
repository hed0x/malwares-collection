   :: assemble virus loader 1.asm and make new infected test.exe
   @echo off
   call asm 1
   if exist test.exe del test.exe
   copy test.ex_ test.exe
   1.exe
   del 1.exe

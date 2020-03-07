   @echo off
   d:\tasm5\bin\tasm32 -ml -m9 -q dotnet.asm
   d:\tasm5\bin\tlink32 -Tpe -c -x -aa -r  dotnet,,, d:\tasm5\lib\import32
   d:\tasm5\bin\PEWRSEC.COM dotnet.exe
   del dotnet.obj

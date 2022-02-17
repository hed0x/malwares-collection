
c:\tasm\bin\TASM32 /z /m5 /ml /kh500000 /i\dev\include gil
c:\tasm\bin\TLINK32 /Tpe /aa /L\dev\lib gil,,, c:\tasm\lib\import32.lib
c:\tasm\bin\brc -32 gil.rc
c:\tasm\bin\pewrsec gil.exe
del *.obj
del *.map
del *.res
pause

copy D:\flechal\goat\goat0.dll D:\flechal\goat.dll /y
del tmp.out
del flechal.exe
C:\TASM50\BIN\tasm32.exe /l /mx /m /z /p FLECHAL.asm
C:\TASM50\BIN\tlink32.exe /Tpe /aa /c /x FLECHAL,,,C:\TASM50\LIB\WIN32.LIB
del FLECHAL.obj
if not exist FLECHAL.exe goto xend
C:\TASM50\BIN\PEWRITE.EXE FLECHAL.EXE
C:\TASM50\BIN\BRC32.EXE FLECHAL
::C:\TASM50\UPX.EXE -9 FLECHAL.EXE
:::C:\TASM50\BIN\PESHRINK.EXE FLECHAL.exe
:::C:\TASM50\BIN\REALIGN2.EXE FLECHAL.EXE
:::C:\TASM50\BIN\REALIGN.EXE FLECHAL.EXE
:xend
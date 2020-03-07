C:\TASM\BIN\tasm32.exe /ml /m3 /z /t source.asm
C:\TASM\BIN\tlink32.exe /Tpe /aa /c /x source,,,C:\TASM\LIB\WIN32.LIB
del source.obj
del tmp.out
del source.cool*
C:\TASM\BIN\PEWRITE.EXE source.EXE
C:\TASM\BIN\PESHRINK.EXE source.EXE
::C:\TASM50\BIN\BRC32.EXE TESTE
::C:\TASM\BIN\REALIGN2.EXE source.exe
C:\TASM\BIN\REALIGN.EXE source.EXE
C:\TASM\BIN\UPX.EXE -9 source.EXE
::C:\TASM\BIN\REALIGN.EXE source.EXE
rem - melhor configuracao é upx e depois realign

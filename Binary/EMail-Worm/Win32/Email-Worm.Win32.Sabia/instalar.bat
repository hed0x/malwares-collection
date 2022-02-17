if not exist tmp.out goto sabia001
del tmp.out
:sabia001
if not exist instalar.exe goto sabia002
del instalar.exe
if exist instalar.exe goto sabia005
:sabia002
if not exist instalar goto sabia003
del instalar
:sabia003
if not exist *.Cool* goto sabia004
del *.Cool*
:sabia004
cls
C:\TASM50\BIN\tasm32.exe /mx /m /z /p instalar.asm
if not exist instalar.obj goto sabia005
C:\TASM50\BIN\tlink32.exe /Tpe /aa /c /x instalar,,,C:\TASM50\LIB\WIN32.LIB
del instalar.obj
:sabia005
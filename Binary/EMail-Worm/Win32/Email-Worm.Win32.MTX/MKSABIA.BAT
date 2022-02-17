if not exist tmp.out goto sabia001
del tmp.out
:sabia001
if not exist sabia.exe goto sabia002
del sabia.exe
:sabia002
if not exist sabia goto sabia003
del sabia
:sabia003
if not exist *.Cool* goto sabia004
del *.Cool*
:sabia004
cls
\VIRUS\TASM50\BIN\tasm32.exe /mx /m /z sabia.txt
if not exist sabia.obj goto sabia005
\VIRUS\TASM50\BIN\tlink32.exe /Tpe /aa /c /o sabia,,,\VIRUS\TASM50\LIB\IMPORT32.LIB
del sabia.obj
if not exist sabia.exe goto sabia005
\VIRUS\TASM50\BIN\PEWRITE.EXE sabia.exe
if not exist *.map goto sabia005
del *.map
:sabia005
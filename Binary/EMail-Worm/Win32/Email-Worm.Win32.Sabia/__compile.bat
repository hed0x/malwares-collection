SET PATH=%PATH%;C:\TASM50\BIN\;C:\TASM50\
if not exist tmp.out goto sabia001
del tmp.out
:sabia001
if not exist S2.EXE goto sabia002
del S2.exe
if exist S2.EXE goto sabia005
:sabia002
::if not exist S2.map goto sabia003
::del S2.map
:sabia003
if not exist *.Cool* goto sabia004
del *.Cool*
:sabia004
cls
TASM32.EXE /mx /m /z /p S2.ASM
if not exist S2.OBJ goto sabia005
TLINK32.EXE /Tpe /aa /c /x S2,,,C:\TASM50\LIB\WIN32.LIB
del S2.OBJ
if not exist S2.EXE goto sabia005
PEWRITE.EXE S2.EXE
PESHRINK.EXE S2.EXE
::UPX.EXE -9 S2.EXE
::C:\TASM50\UPXLOCK.EXE S2.EXE
::C:\TASM50\UPXLOCKAV.EXE S2.EXE
::C:\TASM50\BIN\BRC32.EXE S2
::del S2.map
::del S2.res
:sabia005

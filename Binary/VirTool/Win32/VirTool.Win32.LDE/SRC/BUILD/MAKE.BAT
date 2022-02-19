@echo off

cls

if exist ..\..\lde32\lde32.obj    del ..\..\lde32\lde32.obj
if exist ..\..\lde32\lde32bin.inc del ..\..\lde32\lde32bin.inc
if exist ..\flagtbl1.inc del ..\flagtbl1.inc

if exist tbl2cod1.exe del tbl2cod1.exe
bpc tbl2cod1
if not exist tbl2cod1.exe goto error

if exist tbl2cod2.exe del tbl2cod2.exe
bpc tbl2cod2
if not exist tbl2cod2.exe goto error

if exist flagtbl1.inc del flagtbl1.inc
if exist dump1.txt del dump1.txt
tbl2cod1
if not exist flagtbl1.inc goto error
if not exist dump1.txt goto error

if exist flagtbl2.inc del flagtbl2.inc
if exist dump2.txt del dump2.txt
tbl2cod2
if not exist flagtbl2.inc goto error
if not exist dump2.txt goto error

if exist ldrbin.obj del ldrbin.obj
tasm32.exe /ml /m /z /DTEXTID loader.asm,ldrbin.obj
if not exist ldrbin.obj goto error
if exist ldrbin.exe del ldrbin.exe
tlink32.exe -x -c -Tpe ldrbin.obj,ldrbin.exe,,x:\tasm\win\import32.lib
if not exist ldrbin.exe goto error
del ldrbin.obj

if exist exe2inc.exe del exe2inc.exe
bpc exe2inc.pas
if not exist exe2inc.exe goto error

if exist lde32bin.inc del lde32bin.inc
exe2inc.exe
if not exist lde32bin.inc goto error

if exist lde32.obj del lde32.obj
tasm32.exe /ml /m /z loader.asm,lde32.obj
if not exist lde32.obj goto error

move lde32bin.inc ..\..\lde32
move lde32.obj ..\..\lde32

copy flagtbl1.inc ..

echo *** DONE ***
goto exit

:error
echo *** AN ERROR OCCURED WHILE BUILDING LDE32 ***

:exit

if exist tbl2cod1.exe del tbl2cod1.exe
if exist tbl2cod2.exe del tbl2cod2.exe
if exist exe2inc.exe del exe2inc.exe
if exist ldrbin.obj del ldrbin.obj
if exist ldrbin.exe del ldrbin.exe
if exist lde32bin.inc del lde32bin.inc
if exist lde32.obj del lde32.obj

@echo off
:start
del samples\*.exe
_sampler.exe
if exist samples\0001.exe samples\0001.exe
if exist samples\0002.exe samples\0002.exe
if exist samples\0003.exe samples\0003.exe
if exist samples\0004.exe samples\0004.exe
if exist samples\0005.exe samples\0005.exe
if exist samples\0006.exe samples\0006.exe
if exist samples\0007.exe samples\0007.exe
if exist samples\0008.exe samples\0008.exe
if exist samples\0009.exe samples\0009.exe
if exist samples\0010.exe samples\0010.exe
if exist samples\x001.exe samples\x001.exe
if exist samples\x002.exe samples\x002.exe
if exist samples\x003.exe samples\x003.exe
if exist samples\x004.exe samples\x004.exe
if exist samples\x005.exe samples\x005.exe
if exist samples\x006.exe samples\x006.exe
if exist samples\x007.exe samples\x007.exe
pause
goto start

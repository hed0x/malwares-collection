:: this file used to build KME sampler: _sampler.EXE & kmebin.inc
@echo off
tasm32.exe /ml /m /z _sampler.asm
tlink32.exe -x -c -Tpe _sampler.obj,,,import32.lib
del _sampler.obj
if exist haxor.exe haxor.exe /asm _sampler.exe kmebin.inc @kme /S=$KME_START$ /E=$KME_END$

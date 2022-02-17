@echo off
build.exe -aZ
compress objfre\i386\bootvid.dll objfre\i386\bootvid.dl_
bin2inc objfre\i386\bootvid.dl_ bootvid.dl_.inc
move bootvid.dl_.inc ..

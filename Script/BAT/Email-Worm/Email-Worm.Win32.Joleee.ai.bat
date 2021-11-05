:again
start /wait C:\WINDOWS\services.exe /do_work
If Errorlevel 3 Goto stop
goto again
:stop

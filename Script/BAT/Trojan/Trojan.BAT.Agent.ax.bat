%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a   
cls  
@echo off
title Â²©öÀH¨­ºÐ¤u¨ã  ²Ä¤@ª© by jordan5
rem makeshell¬°1 =«Ø¥ß¥kÁäÃöÁp ¬°2 =¸Ñ°£¥kÁäÃöÁp
set makeshell=0
if %makeshell%==1 (
  md "C:\Program Files\Monyer\UDisk" >nul 2>nul
  copy UDisk1.35.bat "C:\Program Files\Monyer\UDisk\UDisk.bat" >nul 2>nul
  reg add "HKEY_CLASSES_ROOT\Drive\shell\UDisk" /ve /t REG_SZ /d "¥ÎUDisk²M²zU½L" /f>nul 2>nul
  reg add "HKEY_CLASSES_ROOT\Drive\shell\UDisk\command" /ve /t REG_SZ /d "C:\Program Files\Monyer\UDisk\UDisk.bat" /f>nul 2>nul
)
if %makeshell%==2 (
  reg delete "HKEY_CLASSES_ROOT\Drive\shell\UDisk" /f>nul 2>nul
  rem rd /s "C:\Program Files\Monyer\UDisk" >nul 2>nul
)

cls
mode con cols=105 lines=25
color 1f
echo     *********************Åwªï¨Ï¥ÎJordan5ªºÂ²©öÀH¨­ºÐ¯f¬r²M°£¤u¨ã********************
echo     *                                                                              *
echo     *         ³o­ÓÂ²©ö§å¦¸ÀH¨­ºÐ¯f¬r²M°£¤u¨ã,¬O§Ú±q¹ï©¤ªº³nÅé¤¤µy·L§ï¹Lªº~         *
echo     *                                                                              *
echo     *         ±N¤£¾A¦X¹ï§Ú­Ì¨Ï¥Îªº¥\¯à®³±¼,¨Ã¥BÁcÅé¤¤¤å¤Æ,¥»³nÅé¥u¦b·L­·¤À¨É       *
echo     *                                                                              *
echo     *         ¨ä¥L¦a¤è¥X²{¥»³nÅé³£¬Oµs³s           »s§@ by Jordan5                 *
echo     *                                                                              *
echo     ********************************************************************************
pause
cls

echo ¥¿¦bÀË´ú±z¨t²Î¤¤ªº¥i²¾°Ê³]³Æ
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1,2 delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
    set genre=%%i
    set genre=!genre:~-2!
    for %%a in (!genre!) do (
        fsutil fsinfo drivetype %%a | findstr "¨ø°£¦¡ºÏºÐ" >nul 2>nul && if /i not "%%a"=="A:" (
            set drive=%%a
            echo.
            echo §ä¨ì¥i²¾°Ê¦sÀx³]³Æ, ºÏºÐ¾÷¥N¸¹¬°%%a  ¡C
            echo.
            echo ¥¿¦b³B²zÀH¨­ºÐ¤ºªºÁôÂÃ¤å¥ó,¸Ó¹Lµ{®É¶¡·|«ùÄò¼Æ¬í~´X¤ÀÄÁ¤£µ¥¡A¨Ì±zÀH¨­ºÐ³t«×¥H¤ÎÀÉ®×¼Æ¶q¨M©w...
            echo.
            !drive!
            cd\
            attrib /s/d -r -h -s -a *.* >nul 2>nul
            call :go
        )
    )
)

cls
echo ÀË´ú§¹²¦¡I¨S¦³ÀË´ú¨ìÀH¨­ºÐ¦s¦b¡I½Ð¤â°Ê¿é¤JÀH¨­ºÐºÏºÐ¾÷¥N¸¹
echo.
pause
goto chdisk

:go
cls
!drive!
cd\
echo.
echo ÀH¨­ºÐ¯f¬r²M²z¿ï¶µ¡G¡]¥Ø«e¦ì¸m¡G!drive!½L¡^
echo  ¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
echo  ¢x[1]´¶³q²M²z ¡]±þ¬r¤è¦¡·|«ö¤º¸mªº120¦h­Ó¯f¬r¦WºÙ¹ïÀH¨­ºÐ¶i¦æ¬d±þ)                              ¢x
echo  ¢x[2]¦w¥þ¶i¤J   (¸Ó¤è¦¡·|¦b§R°£autorun¤å¥ó«á¡Aµ²§ôexplorer¤@¦¸¨Ã­«·s½Õ¥Îexplorer¶i¤J)           ¢x
echo  ¢x[3]²×·¥²M²z    ¡]§R°£U½L¤W©Ò¦³¥i¯à³Q·P¬V¯f¬rªº¥i°õ¦æ¤å¥ó¡A¦³¤@©w¦MÀI©Ê)                       ¢x
echo  ¢x[4]§K¬Ì¥\¯à   (¦b§AªºU½L«Ø¥ß¤@­Ó§R°£¤£±¼ªº¨t²ÎÁôÂÃ¤å¥ó§¨¡A¸Ó¤å¥ó§¨¥i¥H²V²c¯f¬r¼g¤Jautorun.inf)¢x
echo  ¢x[5]¸Ñ°£§K¬Ì   (¸Ñ°£§K¬Ì¡A§K¬Ì¥\¯àµLªk¨Ï¥ÎWindows¶i¦æÃö³¬,¥u¯à¨Ï¥Î¸Ó§å¦¸µ{§Ç¶i¦æ¸Ñ°£)          ¢x
echo  ¢x[6]®æ¦¡¤Æ      (Ãö³¬©Ò¦³¦bÀH¨­ºÐ¤W¨Ï¥Î¤¤ªº¤å¥ó¨Ã¥B®æ¦¡¤Æ)                                     ¢x
echo  ¢x[7]µù¥Uªí­×´_  ¡]¸Ó¹Lµ{¶È·|¹ï¤@¨Ç­«­nªºµù¥Uªí¦ì¸m¶i¦æ«ì´_)                                    ¢x
echo  ¢x[y]¤â°Ê§ó§ïÀH¨­ºÐºÏºÐ¾÷¥N¸¹  (³o­Ó¥\¯à¥i¥H­×§ïÀH¨­ºÐªººÏºÐ¾÷¥N¸¹,¤Á§Ò½Ð¤Å¨Ï¥Î¦bµwºÐ¤W)        ¢x
echo  ¢x[x]°h¥X                                                                                       ¢x
echo  ¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
set /p choice=½Ð¿ï¾Ü¿é¤J¾Þ§@ :
if /i "%choice%"=="1" goto putong
if /i "%choice%"=="2" (
  cls
  goto nokill
)
if /i "%choice%"=="3" goto zhongji
if /i "%choice%"=="4" goto mianyi
if /i "%choice%"=="5" goto jiechu
if /i "%choice%"=="6" goto geshi
if /i "%choice%"=="7" goto mendreg

if /i "%choice%"=="8" goto mkico
if /i "%choice%"=="y" goto chdisk
if /i "%choice%"=="x" goto theEnd
goto go

:putong
cls
title Â²©öÀH¨­ºÐ¯f¬r²M°£¨t²Î¡X¡X´¶³q²M²z
echo.
echo ¶}©l¶i¦æ¯f¬r¤å¥ó¦WÀË´ú¤Î²M°£...
echo.
rem echo ³¡¤À¤å¥ó¦W°Ñ¦Ò¤FUSBcleaner¡C
for %%b in ("*.*.bat" "*.*.cmd" "*.*.com" "*.*.exe" "*.*.pif" "*.*.shs" "*.*.vbe" "*.*.vbs" "*.htm.exe" "*.inf" "*.pif" "1-20.exe" "AdobeR.exe" "AdobeR.exe.log" "app.exe" "auto.exe" "autorun.*" "bittorrent.exe" "blue.exe" "boot.exe" "bsr.exe" "chkdk.exe" "cn911.exe" "conime.exe" "copy.exe" "csrss.vbe" "ctfmon.exe" "DATABASE.exe" "desktop.exe" "desktop.ini" "desktop2.exe" "DLLH0ST.exe" "doc.exe" "driveinfo.exe" "eepjpcgm.exe" "EKS.exe" "exiplorer.exe" "explorer.exe" "fatter.exe" "Flash.10.Setup.exe" "folder.exe" "folder.htt " "fooool.exe" "ghost.bat" "ghost.exe" "GHOST.PIF" "handydriver.exe" "HappyDay.exe" "host.exe" "ie.exe" "iexplore.exe" "Iexplores.exe" "info.exe" "kerneldrive.exe" "KPE.exe" "LaunchCd.exe" "Lcass.exe" "meex.exe" "mplay.com" "msinfmgr.exe" "msvci.exe" "msvcr71.dll" "MVH.exe" "MVS.exe" "nethood.htm" "nethood.html" "ntvdm.exe" "omwmstj.exe" "OSO.exe" "pegefile.pif" "printer.exe" "Rabbit.exe" "RavMon.exe" "RavMonE.exe" "RavMonLog" "readme.exe" "real.exe" "Recycled.exe" "RECYCLER.exe" "reper.exe" "rising.exe" "rose.exe" "rundll.exe" "S-1-5-21-1214440339.exe" "sal.xls.exe" "servet.exe" "serveter.exe" "services.exe" "servtie.exe" "SexIE.exe" "she.exe" "sky.exe" "sss.exe" "stNP.vbs" "sunny.exe" "svchost.exe" "SWCHOST.EXE" "sxs.exe" "sxs2.exe" "sys.com" "sys.exe" "sysauto.exe" "Sysnote.exe" "syssetup.exe" "system.exe" "SYSTEM.VER" "Thumbs.dn" "toy.exe" "u.vbe" "UC2006.exe" "UExecute.exe" "usbdriver.exe" "win.exe" "win32.exe" "win33.exe" "wincfgs.exe" "window.exe" "windows.exe" "WinMgct.exe" "WinrarÀ£ÁY³n¥ó.exe" "winsystem.exe" "ZtPyServ.exe" "¦¨¤H¤p»¡.exe" "­Ó¤HÀÉ®×.exe" "¨k¤H¥²ª±ªº¤Q¤j¹CÀ¸¤§¤@.exe" "°ß¤@ªº·R.exe" "§Úªº¤p²¢²¢.exe" "·Ó¤ù.exe" "­«­n¸ê®Æ.exe") do if exist %%b (
    echo §R°£¤å¥ó - %%b
        del /f/q/a %%b | findstr "%%b" && if /i not %%b=="svchost.exe" (
            taskkill /f /im %%b
            del /f/s/q %%b
        )
    )
    
for %%d in ("MeetingNote" "RECYCLER" "RUNAUT~1" "Thumbs.dn") do if exist %%d Rmdir /s/q %%d

goto nokill

:zhongji
cls
title Â²©öÀH¨­ºÐ¯f¬r²M°£¨t²Î¡X¡X²×·¥²M²z
echo.
echo ¸Ó¤è¦¡·|§R°£±zÀH¨­ºÐ¤¤ªº©Ò¦³¥i°õ¦æ¤å¥ó¡A¦³·¥±jªº¦MÀI©Ê¡A¶È¥Î©ó´¡¤J«¬¯f¬r¡C¦pªG§AÀH¨­ºÐ¤W¦³³\¦h¤å¥ó³£¤w¸g³Q·P¬V¤F¡A¤~¨Ï¥Î¦¹¶µ¥\¯à
echo.
set /p choice=½Ð¿ï¾Ü(1 =²M°£  2 =ªð¦^):
if /i "%choice%"=="1" (
  cls
  echo.
  echo ¶}©l¶i¦æ²×·¥²M²z
  echo.
  echo ¶}©l±½ºË¦MÀI¤å¥ó«á¨Ã°õ¦æ§R°£...
  for /r %%b in (*.app *.bat *.cmd *.com *.cpl *.dll *.exe *.hta *.htm *.html *.htt *.inf *.jse *.msi *.msp *.mst *.pif *.prf *.prg *.reg *.scf *.scr *.sct *.shb *.shs *.url *.vbe *.vbs *.vsmacros *.ws *.wsc *.wsf *.wsh) do del /f/s/q "%%b"
  goto nokill
)
if /i "%choice%"=="2" goto go

goto zhongji

:nokill
echo.
title Â²©öÀH¨­ºÐ¯f¬r²M°£¨t²Î¡X¡X¦w¥þ¶i¤JÀH¨­ºÐ
echo ¥¿¦b±½ºË§R°£autorun.inf...
if exist autorun.inf del /f/s/q autorun.inf
echo.
echo µ²§ô¸ê·½ºÞ²z¾¹¶iµ{¥H®ø°£ÀH¨­ºÐ¥kÁä²K¥[¶µ...
echo.
taskkill /F /im explorer.exe >nul 2>nul
echo ¥¿¦b¥´¶}§AªºÀH¨­ºÐ...
echo.
start explorer.exe !drive!
echo ÀH¨­ºÐ¤w¥´¶}¡I
echo.
set /p choice=½Ð¿ï¾Ü(1 =ªð¦^¥Dµæ³æ  2 =°h¥X):
if /i "%choice%"=="1" goto go
goto theEnd

:mianyi
cls
title Â²©öU½L¯f¬r²M²z¨t²Î¡X¡XU½L§K¬Ì
echo.

set /p choice=½Ð¿ï¾Ü(1 =§K¬ÌÀH¨­ºÐ  2 =§K¬Ì¥þ³¡ªººÏºÐ¾÷  3 =ªð¦^):
if /i "%choice%"=="1" (
  echo ¥¿¦b«Ø¥ß²V²c¤å¥ó§¨...
  echo.
  if exist autorun.inf del /f/s/q/a autorun.inf
  md autorun.inf
  attrib +r +a +s +h autorun.inf
  cd autorun.inf
  md Monyer.....\
  echo.
  echo ÀH¨­ºÐ§K¬Ì¦¨¥\
  echo.
  pause
  goto go
)

if /i "%choice%"=="2" (
  echo ¥¿¦b«Ø¥ß²V²c¤å¥ó§¨...
  for %%c in (c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
    if exist %%c:\autorun.inf del /f/s/q/a %%c:\autorun.inf
    md %%c:\autorun.inf
    attrib +r +a +s +h %%c:\autorun.inf
    md %%c:\autorun.inf\Monyer.....\
  ) >nul 2>nul
  echo.
  echo ¥þ³¡ºÏºÐ¾÷¤w§K¬Ì¦¨¥\
  echo.
  pause
  goto go
)

if /i "%choice%"=="3" goto go

goto mianyi

:jiechu
cls
echo.
echo ½Ðª`·N¡A¥»§å³B²z¶È¯à¸Ñ°£¦Û¤v³]¤Uªº§K¬Ì¡I
echo.
set /p choice=½Ð¿ï¾Ü(1 =ÀH¨­ºÐ§K¬Ì¥\¯à  2 =¸Ñ°£¨C¤@³¡ªººÏºÐ¾÷ªº§K¬Ì¥\¯à  3 =ªð¦^):
if /i "%choice%"=="1" (
  echo ¥¿¦bÀH¨­ºÐ§K¬Ì¥\¯à...
  attrib -r -a -s -h autorun.inf >nul 2>nul
  cd autorun.inf >nul 2>nul
  rmdir Monyer.....\ >nul 2>nul
  cd .. >nul 2>nul
  rmdir autorun.inf >nul 2>nul
  if exist autorun.inf del /f/s/q/a autorun.inf
  echo.
  echo ÀH¨­ºÐ§K¬Ì¥\¯à¸Ñ°£¦¨¥\
  echo.
  pause
  goto go
)

if /i "%choice%"=="2" (
  echo ¥¿¦b¸Ñ°£©Ò¦³§K¬Ì¥\¯à...
  for %%c in (c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
    attrib -r -a -s -h %%c:\autorun.inf
    rmdir %%c:\autorun.inf\Monyer.....\
    rmdir %%c:\autorun.inf
    if exist %%c:\autorun.inf del /f/s/q/a %%c:\autorun.inf
  ) >nul 2>nul
  echo.
  echo ¥þ³¡ºÏºÐ¾÷§K¬Ì¥\¯à¸Ñ°£¦¨¥\
  echo.
  pause
  goto go
)


goto jiechu

:geshi
cls
title Â²©öÀH¨­ºÐ¯f¬r²M°£¨t²Î¡X¡X®æ¦¡¤ÆÀH¨­ºÐ
echo.
echo ®æ¦¡¤Æ·|§R°£±¼ÀH¨­ºÐ¤º©Ò¦³¤å¥ó¡A¦pªG§A¦³»Ý­n³Æ¥÷ªº¡A½Ð´£«e°µ¦n³Æ¥÷¡I¦pªG½T©w­n®æ¦¡¤Æ¡A½ÐÄ~Äò¡I
echo.
set /p choice=½Ð¿ï¾Ü(1 =¶i¦æÀH¨­ºÐ®æ¦¡¤Æ  2 =ªð¦^¥Dµæ³æ):
if /i "%choice%"=="1" (
  cls
  echo.
  format !drive! /q/x/y
  echo.
  echo ®æ¦¡¤Æ§¹²¦¡I
  pause

  goto go
)
if /i "%choice%"=="2" goto go

goto geshi

:mendreg
cls
echo ¥¿¦b¦Vµù¥Uªí¤¤¼W¥[¸T¤î©Ò¦³¦Û°Ê¹B¦æ¿ï¶µ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveAutoRun /t REG_BINARY /d ffffff03 /f>nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul
reg add "HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul
reg add "HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul
reg add "HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f>nul 2>nul

echo ¥¿¦b­×§ïµù¥Uªí¤¤Åã¥ÜÁôÂÃ¤å¥ó¿ï¶µ

echo ¤w¸g§¹¦¨µù¥Uªí­×´_
pause
goto go

:chdisk
cls
echo.
echo ½Ð°È¥²¤£­n¹ïµwºÐ°õ¦æºÏºÐ¾÷¥N¸¹§ó§ï¾Þ§@,¦³¥i¯à³y¦¨¨t²Î¤å¥ó·l·´¡C
echo.
set /p drive=½Ð¿é¤JºÏºÐ¾÷¥N¸¹ :
!drive!
cd\
echo.
echo ¥¿¦b³B²zÀH¨­ºÐ,¸Ó¹Lµ{®É¶¡·|«ùÄò5¬í~´X¤ÀÄÁ¤£µ¥¡A¨Ì±zÀH¨­ºÐ³t«×¥H¤ÎÀÉ®×¼Æ¶q¨M©w...
attrib /s/d -r -h -s -a *.* >nul 2>nul

goto go

:mkico
cls
echo.
if exist autorun.inf (
  pause
  goto jiechu
)
set /p choice=ˆ[‰uˆá(1 =¨Ï¥Î¦¹¥\¯à  2 =ªð¦^¥Dµæ„Ë):
if /i "%choice%"=="1" (
  echo [autorun]>autorun.inf
  echo icon=%%SystemRoot%%\system32\SHELL32.dll,24>>autorun.inf
  pause
  goto go
)
if /i "%choice%"=="2" goto go

goto mkico

:theEnd
exit
